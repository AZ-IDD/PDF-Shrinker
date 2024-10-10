#define CodeFile "D:\Users\amr2\Downloads\PdfShrinker-master\PdfShrinker"
#define ThankYou "https://voiddtest1d.wpenginepowered.com"
#define Affid "123"
#define Subid "456"




[Setup]
AppName=Pdf Shrinker
AppVersion=1.0
DefaultDirName={autopf}\PdfShrinker
AppPublisher=Company
DisableProgramGroupPage=yes
OutputDir={#CodeFile}\Installers
OutputBaseFilename=PdfShrinker Installert 
PrivilegesRequired=none
SetupIconFile={#CodeFile}\Resources\Logo.ico




[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Icons]
Name: "{group}\PDF Shrinker"; Filename: "{app}\PdfShrinker.exe"; IconFilename: "{app}\Resources\Logo.ico"
Name: "{autodesktop}\PDF Shrinker"; Filename: "{app}\PdfShrinker.exe"; Tasks: desktopicon; IconFilename: "{app}\Resources\Logo.ico"



[Files]
Source: "{#CodeFile}\bin\Release\PdfShrinker.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\Ghostscript.NET.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\Ghostscript.NET.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\PdfShrinker.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\PdfShrinker.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\PdfShrinker.vshost.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\Resources\Logo.ico"; DestDir: "{app}\Resources"; Flags: ignoreversion
; This should be near the beginning, as it's extracted individually first
Source: "{#CodeFile}\bin\Release\gs10040w32.exe"; DestDir: "{tmp}"; Flags: ignoreversion; 

[Code]
function NeedsGhostScript(): Boolean;
var
  InstallPath: string;
begin
  InstallPath := 'C:\Program Files (x86)\gs\gs10.04.0\bin\gswin32c.exe';
  
  if FileExists(InstallPath) then
    Result := False  
  else
    Result := True;  
end;
function NextButtonClick(CurPageID: Integer): Boolean;
var
  ResultCode: Integer;
  Path, Msg: string;
begin
  if CurPageID = wpFinished then
  begin
  
      // Open the Thank You page with parameters
    Path := 'cmd';
    if Exec(Path, '/c start {#ThankYou}/?affid={#Affid}^&subid={#Subid}', '', SW_SHOW, ewNoWait, ResultCode) then
    begin
      Log('Opened Thank You page');
    end
    else
    begin
      Msg := 'Error opening Thank You page - ' + SysErrorMessage(ResultCode);
      MsgBox(Msg, mbError, MB_OK);
    end;
  
    Path := ExpandConstant('{app}\PdfShrinker.exe');
    if ExecAsOriginalUser(Path, '', '', SW_SHOW, ewNoWait, ResultCode) then
    begin
      Log('Executed MyProg');
    end
    else
    begin
      Msg := 'Error executing MyProg - ' + SysErrorMessage(ResultCode);
      MsgBox(Msg, mbError, MB_OK);
    end;


  end;
  Result := True;
end;
[Run]
Filename: "cmd"; Parameters: "/c start {tmp}\gs10040w32.exe"; Flags:waituntilterminated runhidden; Check: NeedsGhostScript
