[Setup]
VersionInfoVersion=@VER_FULLVERSION@
AppId=@installer.app.id@
AppName=@installer.app.name@
AppVerName=@installer.app.name@ - Version:@VER_FULLVERSION@
AppPublisher=@installer.app.publisher@
AppPublisherURL=@installer.app.publisher.url@
AppSupportURL=@installer.app.support.url@
AppUpdatesURL=@installer.app.updates.url@
DefaultDirName=@installer.default.dir.name@
DefaultGroupName=@installer.default.group.name@
AllowNoIcons=yes
OutputDir=..\deploy
OutputBaseFilename=@installer.app.id@-@VER_FULLVERSION@
Compression=lzma
SolidCompression=yes
AlwaysShowDirOnReadyPage=yes
AllowRootDirectory=yes
AlwaysShowGroupOnReadyPage=yes
DirExistsWarning=yes

;[Languages]
;Name: "english"; MessagesFile: "compiler:Languages\ChineseTrad-2-5.1.11.isl"

[Types]
Name: "full"; Description: "Full installation"
;Name: "compact"; Description: "Compact installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "main"; Description: "NodeAgent"; Types: full custom; Flags: fixed
Name: "modules"; Description: "Common Modules"; Types: full custom
Name: "jvm"; Description: "Java Virtual Machine"; Types: full custom

[Tasks]
Name: startmenuicons; Description: "Create a &group in Start Menu"; GroupDescription: "Additional icons:"; Components: main; Flags: @installer.select.startmenuicnos@
Name: desktopicon; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"; Components: main; Flags: @installer.select.desktopicon@
Name: desktopicon\common; Description: "For all users"; GroupDescription: "Additional icons:"; Components: main; Flags: exclusive @installer.select.desktopicon.common@
Name: desktopicon\user; Description: "For the current user only"; GroupDescription: "Additional icons:"; Components: main; Flags: exclusive @installer.select.desktopicon.user@
Name: quicklaunchicon; Description: "Create a &Quick Launch icon"; GroupDescription: "Additional icons:"; Components: main; Flags: @installer.select.quicklaunchicon@
Name: installservice; Description: "Register as system service."; GroupDescription: "Should NodeAgent run as a system service?"; Components: main; Flags: @installer.select.installservice@
Name: portSet_990x; Description: "990x: 9900 ~ 9902"; GroupDescription: "Select a set of ports that NodeAgent will listen to"; Components: main; Flags: @installer.select.portset.990x@
Name: portSet_991x; Description: "991x: 9910 ~ 9912"; GroupDescription: "Select a set of ports that NodeAgent will listen to"; Components: main; Flags: @installer.select.portset.991x@
Name: portSet_992x; Description: "992x: 9920 ~ 9922"; GroupDescription: "Select a set of ports that NodeAgent will listen to"; Components: main; Flags: @installer.select.portset.992x@
Name: portSet_993x; Description: "993x: 9930 ~ 9932"; GroupDescription: "Select a set of ports that NodeAgent will listen to"; Components: main; Flags: @installer.select.portset.993x@
Name: portSet_994x; Description: "994x: 9940 ~ 9942"; GroupDescription: "Select a set of ports that NodeAgent will listen to"; Components: main; Flags: @installer.select.portset.994x@
Name: portSet_995x; Description: "995x: 9950 ~ 9952"; GroupDescription: "Select a set of ports that NodeAgent will listen to"; Components: main; Flags: @installer.select.portset.995x@
Name: portSet_996x; Description: "996x: 9960 ~ 9962"; GroupDescription: "Select a set of ports that NodeAgent will listen to"; Components: main; Flags: @installer.select.portset.996x@
Name: portSet_997x; Description: "997x: 9970 ~ 9972"; GroupDescription: "Select a set of ports that NodeAgent will listen to"; Components: main; Flags: @installer.select.portset.997x@
Name: portSet_998x; Description: "998x: 9980 ~ 9982"; GroupDescription: "Select a set of ports that NodeAgent will listen to"; Components: main; Flags: @installer.select.portset.998x@
Name: portSet_999x; Description: "999x: 9990 ~ 9992"; GroupDescription: "Select a set of ports that NodeAgent will listen to"; Components: main; Flags: @installer.select.portset.999x@

[Dirs]
Name: "{app}"; Permissions: users-full
Name: "{app}\log"; Permissions: users-full
Name: "{app}\990x"; Permissions: users-full; Tasks: portSet_990x
Name: "{app}\991x"; Permissions: users-full; Tasks: portSet_991x
Name: "{app}\992x"; Permissions: users-full; Tasks: portSet_992x
Name: "{app}\993x"; Permissions: users-full; Tasks: portSet_993x
Name: "{app}\994x"; Permissions: users-full; Tasks: portSet_994x
Name: "{app}\995x"; Permissions: users-full; Tasks: portSet_995x
Name: "{app}\996x"; Permissions: users-full; Tasks: portSet_996x
Name: "{app}\997x"; Permissions: users-full; Tasks: portSet_997x
Name: "{app}\998x"; Permissions: users-full; Tasks: portSet_998x
Name: "{app}\999x"; Permissions: users-full; Tasks: portSet_999x
Name: "@VANGUARD_REPOSITORY@"; Permissions: users-full

[Files]
Source: "setup\bin\*"; DestDir: "{app}\bin"; Components: main; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\drv\*"; DestDir: "{app}\drv"; Components: main; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\dll\*"; DestDir: "{app}\dll"; Components: main; Flags: recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\etc\java.policy"; DestDir: "{app}\etc"; Components: main; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\splash.jpg"; DestDir: "{app}\etc"; Components: main; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\jvm\*"; DestDir: "{app}\java"; Components: jvm; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "setup\lib\*"; DestDir: "{app}\lib"; Components: main; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\app\*"; DestDir: "{app}\app"; Components: main; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist; AfterInstall: AfterAppDirInstalled('{app}\app')
Source: "setup\modules\*"; DestDir: "{app}\modules"; Components: modules; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\990x\*"; DestDir: "{app}\990x"; Tasks: portSet_990x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\991x\*"; DestDir: "{app}\991x"; Tasks: portSet_991x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\992x\*"; DestDir: "{app}\992x"; Tasks: portSet_992x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\993x\*"; DestDir: "{app}\993x"; Tasks: portSet_993x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\994x\*"; DestDir: "{app}\994x"; Tasks: portSet_994x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\995x\*"; DestDir: "{app}\995x"; Tasks: portSet_995x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\996x\*"; DestDir: "{app}\996x"; Tasks: portSet_996x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\997x\*"; DestDir: "{app}\997x"; Tasks: portSet_997x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\998x\*"; DestDir: "{app}\998x"; Tasks: portSet_998x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\999x\*"; DestDir: "{app}\999x"; Tasks: portSet_999x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\etc\nodeagentprofile-990x.xml"; DestDir: "{app}\etc"; Tasks: portSet_990x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagentprofile-991x.xml"; DestDir: "{app}\etc"; Tasks: portSet_991x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagentprofile-992x.xml"; DestDir: "{app}\etc"; Tasks: portSet_992x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagentprofile-993x.xml"; DestDir: "{app}\etc"; Tasks: portSet_993x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagentprofile-994x.xml"; DestDir: "{app}\etc"; Tasks: portSet_994x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagentprofile-995x.xml"; DestDir: "{app}\etc"; Tasks: portSet_995x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagentprofile-996x.xml"; DestDir: "{app}\etc"; Tasks: portSet_996x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagentprofile-997x.xml"; DestDir: "{app}\etc"; Tasks: portSet_997x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagentprofile-998x.xml"; DestDir: "{app}\etc"; Tasks: portSet_998x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagentprofile-999x.xml"; DestDir: "{app}\etc"; Tasks: portSet_999x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagent-990x.conf"; DestDir: "{app}\etc"; Tasks: portSet_990x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagent-991x.conf"; DestDir: "{app}\etc"; Tasks: portSet_991x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagent-992x.conf"; DestDir: "{app}\etc"; Tasks: portSet_992x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagent-993x.conf"; DestDir: "{app}\etc"; Tasks: portSet_993x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagent-994x.conf"; DestDir: "{app}\etc"; Tasks: portSet_994x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagent-995x.conf"; DestDir: "{app}\etc"; Tasks: portSet_995x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagent-996x.conf"; DestDir: "{app}\etc"; Tasks: portSet_996x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagent-997x.conf"; DestDir: "{app}\etc"; Tasks: portSet_997x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagent-998x.conf"; DestDir: "{app}\etc"; Tasks: portSet_998x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\nodeagent-999x.conf"; DestDir: "{app}\etc"; Tasks: portSet_999x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\log4j-990x.xml"; DestDir: "{app}\etc"; Tasks: portSet_990x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\log4j-991x.xml"; DestDir: "{app}\etc"; Tasks: portSet_991x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\log4j-992x.xml"; DestDir: "{app}\etc"; Tasks: portSet_992x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\log4j-993x.xml"; DestDir: "{app}\etc"; Tasks: portSet_993x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\log4j-994x.xml"; DestDir: "{app}\etc"; Tasks: portSet_994x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\log4j-995x.xml"; DestDir: "{app}\etc"; Tasks: portSet_995x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\log4j-996x.xml"; DestDir: "{app}\etc"; Tasks: portSet_996x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\log4j-997x.xml"; DestDir: "{app}\etc"; Tasks: portSet_997x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\log4j-998x.xml"; DestDir: "{app}\etc"; Tasks: portSet_998x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\etc\log4j-999x.xml"; DestDir: "{app}\etc"; Tasks: portSet_999x; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\ssl\*"; DestDir: "{app}\990x\ssl"; Tasks: portSet_990x; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\ssl\*"; DestDir: "{app}\991x\ssl"; Tasks: portSet_991x; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\ssl\*"; DestDir: "{app}\992x\ssl"; Tasks: portSet_992x; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\ssl\*"; DestDir: "{app}\993x\ssl"; Tasks: portSet_993x; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\ssl\*"; DestDir: "{app}\994x\ssl"; Tasks: portSet_994x; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\ssl\*"; DestDir: "{app}\995x\ssl"; Tasks: portSet_995x; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\ssl\*"; DestDir: "{app}\996x\ssl"; Tasks: portSet_996x; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\ssl\*"; DestDir: "{app}\997x\ssl"; Tasks: portSet_997x; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\ssl\*"; DestDir: "{app}\998x\ssl"; Tasks: portSet_998x; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\ssl\*"; DestDir: "{app}\999x\ssl"; Tasks: portSet_999x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\mnm\shared\*"; DestDir: "{app}\990x\modules"; Tasks: portSet_990x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\shared\*"; DestDir: "{app}\991x\modules"; Tasks: portSet_991x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\shared\*"; DestDir: "{app}\992x\modules"; Tasks: portSet_992x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\shared\*"; DestDir: "{app}\993x\modules"; Tasks: portSet_993x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\shared\*"; DestDir: "{app}\994x\modules"; Tasks: portSet_994x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\shared\*"; DestDir: "{app}\995x\modules"; Tasks: portSet_995x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\shared\*"; DestDir: "{app}\996x\modules"; Tasks: portSet_996x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\shared\*"; DestDir: "{app}\997x\modules"; Tasks: portSet_997x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\shared\*"; DestDir: "{app}\998x\modules"; Tasks: portSet_998x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\shared\*"; DestDir: "{app}\999x\modules"; Tasks: portSet_999x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\990x\*"; DestDir: "{app}\990x\modules"; Tasks: portSet_990x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\991x\*"; DestDir: "{app}\991x\modules"; Tasks: portSet_991x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\992x\*"; DestDir: "{app}\992x\modules"; Tasks: portSet_992x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\993x\*"; DestDir: "{app}\993x\modules"; Tasks: portSet_993x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\994x\*"; DestDir: "{app}\994x\modules"; Tasks: portSet_994x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\995x\*"; DestDir: "{app}\995x\modules"; Tasks: portSet_995x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\996x\*"; DestDir: "{app}\996x\modules"; Tasks: portSet_996x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\997x\*"; DestDir: "{app}\997x\modules"; Tasks: portSet_997x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\998x\*"; DestDir: "{app}\998x\modules"; Tasks: portSet_998x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\mnm\999x\*"; DestDir: "{app}\999x\modules"; Tasks: portSet_999x; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent-990x.exe"; DestDir: "{app}\bin"; Tasks: portSet_990x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent-991x.exe"; DestDir: "{app}\bin"; Tasks: portSet_991x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent-992x.exe"; DestDir: "{app}\bin"; Tasks: portSet_992x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent-993x.exe"; DestDir: "{app}\bin"; Tasks: portSet_993x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent-994x.exe"; DestDir: "{app}\bin"; Tasks: portSet_994x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent-995x.exe"; DestDir: "{app}\bin"; Tasks: portSet_995x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent-996x.exe"; DestDir: "{app}\bin"; Tasks: portSet_996x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent-997x.exe"; DestDir: "{app}\bin"; Tasks: portSet_997x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent-998x.exe"; DestDir: "{app}\bin"; Tasks: portSet_998x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent-999x.exe"; DestDir: "{app}\bin"; Tasks: portSet_999x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice-990x.exe"; DestDir: "{app}\bin"; Tasks: portSet_990x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice-991x.exe"; DestDir: "{app}\bin"; Tasks: portSet_991x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice-992x.exe"; DestDir: "{app}\bin"; Tasks: portSet_992x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice-993x.exe"; DestDir: "{app}\bin"; Tasks: portSet_993x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice-994x.exe"; DestDir: "{app}\bin"; Tasks: portSet_994x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice-995x.exe"; DestDir: "{app}\bin"; Tasks: portSet_995x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice-996x.exe"; DestDir: "{app}\bin"; Tasks: portSet_996x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice-997x.exe"; DestDir: "{app}\bin"; Tasks: portSet_997x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice-998x.exe"; DestDir: "{app}\bin"; Tasks: portSet_998x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice-999x.exe"; DestDir: "{app}\bin"; Tasks: portSet_999x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent64-990x.exe"; DestDir: "{app}\bin"; Tasks: portSet_990x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent64-991x.exe"; DestDir: "{app}\bin"; Tasks: portSet_991x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent64-992x.exe"; DestDir: "{app}\bin"; Tasks: portSet_992x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent64-993x.exe"; DestDir: "{app}\bin"; Tasks: portSet_993x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent64-994x.exe"; DestDir: "{app}\bin"; Tasks: portSet_994x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent64-995x.exe"; DestDir: "{app}\bin"; Tasks: portSet_995x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent64-996x.exe"; DestDir: "{app}\bin"; Tasks: portSet_996x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent64-997x.exe"; DestDir: "{app}\bin"; Tasks: portSet_997x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent64-998x.exe"; DestDir: "{app}\bin"; Tasks: portSet_998x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent64-999x.exe"; DestDir: "{app}\bin"; Tasks: portSet_999x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice64-990x.exe"; DestDir: "{app}\bin"; Tasks: portSet_990x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice64-991x.exe"; DestDir: "{app}\bin"; Tasks: portSet_991x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice64-992x.exe"; DestDir: "{app}\bin"; Tasks: portSet_992x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice64-993x.exe"; DestDir: "{app}\bin"; Tasks: portSet_993x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice64-994x.exe"; DestDir: "{app}\bin"; Tasks: portSet_994x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice64-995x.exe"; DestDir: "{app}\bin"; Tasks: portSet_995x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice64-996x.exe"; DestDir: "{app}\bin"; Tasks: portSet_996x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice64-997x.exe"; DestDir: "{app}\bin"; Tasks: portSet_997x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice64-998x.exe"; DestDir: "{app}\bin"; Tasks: portSet_998x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagentservice64-999x.exe"; DestDir: "{app}\bin"; Tasks: portSet_999x; Flags: ignoreversion skipifsourcedoesntexist
Source: "setup\winrun4j\nodeagent-990x.ini"; DestDir: "{app}\bin"; Tasks: portSet_990x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent-990x.ini')
Source: "setup\winrun4j\nodeagent-991x.ini"; DestDir: "{app}\bin"; Tasks: portSet_991x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent-991x.ini')
Source: "setup\winrun4j\nodeagent-992x.ini"; DestDir: "{app}\bin"; Tasks: portSet_992x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent-992x.ini')
Source: "setup\winrun4j\nodeagent-993x.ini"; DestDir: "{app}\bin"; Tasks: portSet_993x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent-993x.ini')
Source: "setup\winrun4j\nodeagent-994x.ini"; DestDir: "{app}\bin"; Tasks: portSet_994x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent-994x.ini')
Source: "setup\winrun4j\nodeagent-995x.ini"; DestDir: "{app}\bin"; Tasks: portSet_995x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent-995x.ini')
Source: "setup\winrun4j\nodeagent-996x.ini"; DestDir: "{app}\bin"; Tasks: portSet_996x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent-996x.ini')
Source: "setup\winrun4j\nodeagent-997x.ini"; DestDir: "{app}\bin"; Tasks: portSet_997x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent-997x.ini')
Source: "setup\winrun4j\nodeagent-998x.ini"; DestDir: "{app}\bin"; Tasks: portSet_998x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent-998x.ini')
Source: "setup\winrun4j\nodeagent-999x.ini"; DestDir: "{app}\bin"; Tasks: portSet_999x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent-999x.ini')
Source: "setup\winrun4j\nodeagentservice-990x.ini"; DestDir: "{app}\bin"; Tasks: portSet_990x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice-990x.ini')
Source: "setup\winrun4j\nodeagentservice-991x.ini"; DestDir: "{app}\bin"; Tasks: portSet_991x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice-991x.ini')
Source: "setup\winrun4j\nodeagentservice-992x.ini"; DestDir: "{app}\bin"; Tasks: portSet_992x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice-992x.ini')
Source: "setup\winrun4j\nodeagentservice-993x.ini"; DestDir: "{app}\bin"; Tasks: portSet_993x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice-993x.ini')
Source: "setup\winrun4j\nodeagentservice-994x.ini"; DestDir: "{app}\bin"; Tasks: portSet_994x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice-994x.ini')
Source: "setup\winrun4j\nodeagentservice-995x.ini"; DestDir: "{app}\bin"; Tasks: portSet_995x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice-995x.ini')
Source: "setup\winrun4j\nodeagentservice-996x.ini"; DestDir: "{app}\bin"; Tasks: portSet_996x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice-996x.ini')
Source: "setup\winrun4j\nodeagentservice-997x.ini"; DestDir: "{app}\bin"; Tasks: portSet_997x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice-997x.ini')
Source: "setup\winrun4j\nodeagentservice-998x.ini"; DestDir: "{app}\bin"; Tasks: portSet_998x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice-998x.ini')
Source: "setup\winrun4j\nodeagentservice-999x.ini"; DestDir: "{app}\bin"; Tasks: portSet_999x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice-999x.ini')
Source: "setup\winrun4j\nodeagent64-990x.ini"; DestDir: "{app}\bin"; Tasks: portSet_990x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent64-990x.ini')
Source: "setup\winrun4j\nodeagent64-991x.ini"; DestDir: "{app}\bin"; Tasks: portSet_991x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent64-991x.ini')
Source: "setup\winrun4j\nodeagent64-992x.ini"; DestDir: "{app}\bin"; Tasks: portSet_992x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent64-992x.ini')
Source: "setup\winrun4j\nodeagent64-993x.ini"; DestDir: "{app}\bin"; Tasks: portSet_993x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent64-993x.ini')
Source: "setup\winrun4j\nodeagent64-994x.ini"; DestDir: "{app}\bin"; Tasks: portSet_994x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent64-994x.ini')
Source: "setup\winrun4j\nodeagent64-995x.ini"; DestDir: "{app}\bin"; Tasks: portSet_995x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent64-995x.ini')
Source: "setup\winrun4j\nodeagent64-996x.ini"; DestDir: "{app}\bin"; Tasks: portSet_996x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent64-996x.ini')
Source: "setup\winrun4j\nodeagent64-997x.ini"; DestDir: "{app}\bin"; Tasks: portSet_997x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent64-997x.ini')
Source: "setup\winrun4j\nodeagent64-998x.ini"; DestDir: "{app}\bin"; Tasks: portSet_998x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent64-998x.ini')
Source: "setup\winrun4j\nodeagent64-999x.ini"; DestDir: "{app}\bin"; Tasks: portSet_999x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagent64-999x.ini')
Source: "setup\winrun4j\nodeagentservice64-990x.ini"; DestDir: "{app}\bin"; Tasks: portSet_990x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice64-990x.ini')
Source: "setup\winrun4j\nodeagentservice64-991x.ini"; DestDir: "{app}\bin"; Tasks: portSet_991x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice64-991x.ini')
Source: "setup\winrun4j\nodeagentservice64-992x.ini"; DestDir: "{app}\bin"; Tasks: portSet_992x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice64-992x.ini')
Source: "setup\winrun4j\nodeagentservice64-993x.ini"; DestDir: "{app}\bin"; Tasks: portSet_993x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice64-993x.ini')
Source: "setup\winrun4j\nodeagentservice64-994x.ini"; DestDir: "{app}\bin"; Tasks: portSet_994x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice64-994x.ini')
Source: "setup\winrun4j\nodeagentservice64-995x.ini"; DestDir: "{app}\bin"; Tasks: portSet_995x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice64-995x.ini')
Source: "setup\winrun4j\nodeagentservice64-996x.ini"; DestDir: "{app}\bin"; Tasks: portSet_996x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice64-996x.ini')
Source: "setup\winrun4j\nodeagentservice64-997x.ini"; DestDir: "{app}\bin"; Tasks: portSet_997x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice64-997x.ini')
Source: "setup\winrun4j\nodeagentservice64-998x.ini"; DestDir: "{app}\bin"; Tasks: portSet_998x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice64-998x.ini')
Source: "setup\winrun4j\nodeagentservice64-999x.ini"; DestDir: "{app}\bin"; Tasks: portSet_999x; Flags: ignoreversion skipifsourcedoesntexist; AfterInstall: AfterNodeAgentIniInstalled('{app}\bin\nodeagentservice64-999x.ini')

[Icons]
Name: "{group}\990x\Start Service on 990x (need admin)"; Filename: "sc.exe"; Parameters: "start @installer.service.id@-990x"; WorkingDir: "{app}\990x"; Tasks: startmenuicons and installservice and portSet_990x
Name: "{group}\991x\Start Service on 991x (need admin)"; Filename: "sc.exe"; Parameters: "start @installer.service.id@-991x"; WorkingDir: "{app}\991x"; Tasks: startmenuicons and installservice and portSet_991x
Name: "{group}\992x\Start Service on 992x (need admin)"; Filename: "sc.exe"; Parameters: "start @installer.service.id@-992x"; WorkingDir: "{app}\992x"; Tasks: startmenuicons and installservice and portSet_992x
Name: "{group}\993x\Start Service on 993x (need admin)"; Filename: "sc.exe"; Parameters: "start @installer.service.id@-993x"; WorkingDir: "{app}\993x"; Tasks: startmenuicons and installservice and portSet_993x
Name: "{group}\994x\Start Service on 994x (need admin)"; Filename: "sc.exe"; Parameters: "start @installer.service.id@-994x"; WorkingDir: "{app}\994x"; Tasks: startmenuicons and installservice and portSet_994x
Name: "{group}\995x\Start Service on 995x (need admin)"; Filename: "sc.exe"; Parameters: "start @installer.service.id@-995x"; WorkingDir: "{app}\995x"; Tasks: startmenuicons and installservice and portSet_995x
Name: "{group}\996x\Start Service on 996x (need admin)"; Filename: "sc.exe"; Parameters: "start @installer.service.id@-996x"; WorkingDir: "{app}\996x"; Tasks: startmenuicons and installservice and portSet_996x
Name: "{group}\997x\Start Service on 997x (need admin)"; Filename: "sc.exe"; Parameters: "start @installer.service.id@-997x"; WorkingDir: "{app}\997x"; Tasks: startmenuicons and installservice and portSet_997x
Name: "{group}\998x\Start Service on 998x (need admin)"; Filename: "sc.exe"; Parameters: "start @installer.service.id@-998x"; WorkingDir: "{app}\998x"; Tasks: startmenuicons and installservice and portSet_998x
Name: "{group}\999x\Start Service on 999x (need admin)"; Filename: "sc.exe"; Parameters: "start @installer.service.id@-999x"; WorkingDir: "{app}\999x"; Tasks: startmenuicons and installservice and portSet_999x
Name: "{group}\990x\Stop Service on 990x (need admin)"; Filename: "sc.exe"; Parameters: "Stop @installer.service.id@-990x"; WorkingDir: "{app}\990x"; Tasks: startmenuicons and installservice and portSet_990x
Name: "{group}\991x\Stop Service on 991x (need admin)"; Filename: "sc.exe"; Parameters: "Stop @installer.service.id@-991x"; WorkingDir: "{app}\991x"; Tasks: startmenuicons and installservice and portSet_991x
Name: "{group}\992x\Stop Service on 992x (need admin)"; Filename: "sc.exe"; Parameters: "Stop @installer.service.id@-992x"; WorkingDir: "{app}\992x"; Tasks: startmenuicons and installservice and portSet_992x
Name: "{group}\993x\Stop Service on 993x (need admin)"; Filename: "sc.exe"; Parameters: "Stop @installer.service.id@-993x"; WorkingDir: "{app}\993x"; Tasks: startmenuicons and installservice and portSet_993x
Name: "{group}\994x\Stop Service on 994x (need admin)"; Filename: "sc.exe"; Parameters: "Stop @installer.service.id@-994x"; WorkingDir: "{app}\994x"; Tasks: startmenuicons and installservice and portSet_994x
Name: "{group}\995x\Stop Service on 995x (need admin)"; Filename: "sc.exe"; Parameters: "Stop @installer.service.id@-995x"; WorkingDir: "{app}\995x"; Tasks: startmenuicons and installservice and portSet_995x
Name: "{group}\996x\Stop Service on 996x (need admin)"; Filename: "sc.exe"; Parameters: "Stop @installer.service.id@-996x"; WorkingDir: "{app}\996x"; Tasks: startmenuicons and installservice and portSet_996x
Name: "{group}\997x\Stop Service on 997x (need admin)"; Filename: "sc.exe"; Parameters: "Stop @installer.service.id@-997x"; WorkingDir: "{app}\997x"; Tasks: startmenuicons and installservice and portSet_997x
Name: "{group}\998x\Stop Service on 998x (need admin)"; Filename: "sc.exe"; Parameters: "Stop @installer.service.id@-998x"; WorkingDir: "{app}\998x"; Tasks: startmenuicons and installservice and portSet_998x
Name: "{group}\999x\Stop Service on 999x (need admin)"; Filename: "sc.exe"; Parameters: "Stop @installer.service.id@-999x"; WorkingDir: "{app}\999x"; Tasks: startmenuicons and installservice and portSet_999x
Name: "{group}\@app.bootstrap.displayName@"; Filename: "{app}\app\bootstrap\@app.bootstrap.starterName@-@APP_REGION@.exe"; WorkingDir: "{app}\app\bootstrap"; Tasks: startmenuicons
Name: "{group}\@app.bootstrap.displayName@"; Filename: "{app}\app\bootstrap\@app.bootstrap.starterName@-@APP_REGION@.exe"; WorkingDir: "{app}\app\bootstrap"; Tasks: startmenuicons
Name: "{group}\Uninstall @app.bootstrap.displayName@"; Filename: "{uninstallexe}"; Tasks: startmenuicons
Name: "{commondesktop}\@app.bootstrap.displayName@"; Filename: "{app}\app\bootstrap\@app.bootstrap.starterName@-@APP_REGION@.exe"; WorkingDir: "{app}\app\bootstrap"; Tasks: desktopicon\common
Name: "{userdesktop}\@app.bootstrap.displayName@"; Filename: "{app}\app\bootstrap\@app.bootstrap.starterName@-@APP_REGION@.exe"; WorkingDir: "{app}\app\bootstrap"; Tasks: desktopicon\user

;[Registry]
;Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; ValueName: "IISIDeviceAgentSystemTrayApplet"; ValueData: "{app}\bin\systrayapp.bat"; Flags: uninsdeletevalue

[Run]
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-i ..\etc\nodeagent-990x.conf"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_990x; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-i ..\etc\nodeagent-991x.conf"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_991x; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-i ..\etc\nodeagent-992x.conf"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_992x; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-i ..\etc\nodeagent-993x.conf"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_993x; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-i ..\etc\nodeagent-994x.conf"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_994x; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-i ..\etc\nodeagent-995x.conf"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_995x; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-i ..\etc\nodeagent-996x.conf"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_996x; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-i ..\etc\nodeagent-997x.conf"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_997x; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-i ..\etc\nodeagent-998x.conf"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_998x; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-it ..\etc\nodeagent-999x.conf"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_999x; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-990x.exe"; Parameters: "--WinRun4J:RegisterService"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_990x; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-991x.exe"; Parameters: "--WinRun4J:RegisterService"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_991x; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-992x.exe"; Parameters: "--WinRun4J:RegisterService"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_992x; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-993x.exe"; Parameters: "--WinRun4J:RegisterService"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_993x; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-994x.exe"; Parameters: "--WinRun4J:RegisterService"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_994x; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-995x.exe"; Parameters: "--WinRun4J:RegisterService"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_995x; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-996x.exe"; Parameters: "--WinRun4J:RegisterService"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_996x; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-997x.exe"; Parameters: "--WinRun4J:RegisterService"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_997x; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-998x.exe"; Parameters: "--WinRun4J:RegisterService"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_998x; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-999x.exe"; Parameters: "--WinRun4J:RegisterService"; WorkingDir: "{app}\bin"; Tasks: installservice and portSet_999x; Flags: runhidden
@installer.install.firewall.settings@

[UninstallRun]
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-r ..\etc\nodeagent-990x.conf"; WorkingDir: "{app}\bin"; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-r ..\etc\nodeagent-991x.conf"; WorkingDir: "{app}\bin"; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-r ..\etc\nodeagent-992x.conf"; WorkingDir: "{app}\bin"; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-r ..\etc\nodeagent-993x.conf"; WorkingDir: "{app}\bin"; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-r ..\etc\nodeagent-994x.conf"; WorkingDir: "{app}\bin"; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-r ..\etc\nodeagent-995x.conf"; WorkingDir: "{app}\bin"; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-r ..\etc\nodeagent-996x.conf"; WorkingDir: "{app}\bin"; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-r ..\etc\nodeagent-997x.conf"; WorkingDir: "{app}\bin"; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-r ..\etc\nodeagent-998x.conf"; WorkingDir: "{app}\bin"; Flags: runhidden
;Filename: "{app}\bin\wrapper.exe"; Parameters: "-r ..\etc\nodeagent-999x.conf"; WorkingDir: "{app}\bin"; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-990x.exe"; Parameters: "--WinRun4J:UnregisterService"; WorkingDir: "{app}\bin"; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-991x.exe"; Parameters: "--WinRun4J:UnregisterService"; WorkingDir: "{app}\bin"; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-992x.exe"; Parameters: "--WinRun4J:UnregisterService"; WorkingDir: "{app}\bin"; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-993x.exe"; Parameters: "--WinRun4J:UnregisterService"; WorkingDir: "{app}\bin"; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-994x.exe"; Parameters: "--WinRun4J:UnregisterService"; WorkingDir: "{app}\bin"; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-995x.exe"; Parameters: "--WinRun4J:UnregisterService"; WorkingDir: "{app}\bin"; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-996x.exe"; Parameters: "--WinRun4J:UnregisterService"; WorkingDir: "{app}\bin"; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-997x.exe"; Parameters: "--WinRun4J:UnregisterService"; WorkingDir: "{app}\bin"; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-998x.exe"; Parameters: "--WinRun4J:UnregisterService"; WorkingDir: "{app}\bin"; Flags: runhidden
Filename: "{app}\bin\nodeagentservice-999x.exe"; Parameters: "--WinRun4J:UnregisterService"; WorkingDir: "{app}\bin"; Flags: runhidden
@installer.uninstall.firewall.settings@

[UninstallDelete]
Type: files; Name: "{app}\bin\*.log"
Type: files; Name: "{app}\log\*.log"
Type: files; Name: "{app}\990x"
Type: files; Name: "{app}\991x"
Type: files; Name: "{app}\992x"
Type: files; Name: "{app}\993x"
Type: files; Name: "{app}\994x"
Type: files; Name: "{app}\995x"
Type: files; Name: "{app}\996x"
Type: files; Name: "{app}\997x"
Type: files; Name: "{app}\998x"
Type: files; Name: "{app}\999x"
Type: files; Name: "{app}"

[Code]
var vanguardCustomSettingPage : TInputQueryWizardPage;
var vanguardServiceUrl : String;

procedure InitializeWizard();
begin
  // Create the page
  vanguardCustomSettingPage := CreateInputQueryPage(wpSelectTasks,
  'Vanguard settings', 'You can change Vanguard settings here.',
  'Please specify Vanguard service URL if default value is not desired, then click Next.');
  // Add items (False means it's not a password edit)
  vanguardCustomSettingPage.Add('Service URL:', False);
  // Set initial values (optional)
  if (Pos('://:', '@VANGUARD_SERVICE_URL@') = 0) then
  begin
    vanguardCustomSettingPage.Values[0] := '@VANGUARD_SERVICE_URL@';
  end
  else
  begin
    vanguardCustomSettingPage.Values[0] := '';
  end;
end;

procedure AfterNodeAgentIniInstalled(NodeAgentIniFileName: String);
var AnsiIniContent : AnsiString;
var IniContent : String;
begin
  vanguardServiceUrl := vanguardCustomSettingPage.Values[0];
  if (LoadStringFromFile(ExpandConstant(NodeAgentIniFileName), AnsiIniContent)) then
  begin
    IniContent := String(AnsiIniContent);
    StringChangeEx(IniContent, '-Dinfinity.vanguard.serviceurl=NONE', '-Dinfinity.vanguard.serviceurl=' + vanguardServiceUrl, True);
    AnsiIniContent := AnsiString(IniContent);
    if (SaveStringToFile(ExpandConstant(NodeAgentIniFileName), AnsiIniContent, False)) then
    begin
      Log('[AfterNodeAgentIniInstalled] Successfully replacing infinity.vanguard.serviceurl setting in ' + ExpandConstant(NodeAgentIniFileName) + ' to ' + vanguardServiceUrl);
    end
    else
    begin
      Log('[AfterNodeAgentIniInstalled] Cannot save changes to ' + ExpandConstant(NodeAgentIniFileName) + '!');
    end
  end
  else
  begin
    Log('[AfterNodeAgentIniInstalled] Cannot open ' + ExpandConstant(NodeAgentIniFileName) + '!');
  end;
end;

procedure AfterAppDirInstalled(AppDirName: String);
var 
  AnsiIniContent : AnsiString;
  IniContent : String;
  FindRec: TFindRec;
  FileName: String;
begin
  vanguardServiceUrl := vanguardCustomSettingPage.Values[0];
  if FindFirst(ExpandConstant(AppDirName + '\bootstrap\*.bat'), FindRec) then begin
    try
      repeat
      // Don't count directories
      if FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY = 0 then begin
        FileName := ExpandConstant('{app}\app\bootstrap\' + FindRec.Name);
        Log('[AfterAppDirInstalled] Processing ' + FileName + '...');
        if (LoadStringFromFile(FileName, AnsiIniContent)) then begin
          IniContent := String(AnsiIniContent);
          StringChangeEx(IniContent, 'VANGUARD_SERVICE_URL=NONE', 'VANGUARD_SERVICE_URL=' + vanguardServiceUrl, True);
          AnsiIniContent := AnsiString(IniContent);
          if (SaveStringToFile(FileName, AnsiIniContent, False)) then begin
            Log('[AfterAppDirInstalled] Successfully replacing VANGUARD_SERVICE_URL setting in ' + FileName + ' to ' + vanguardServiceUrl);
          end
          else begin
            Log('[AfterAppDirInstalled] Cannot save changes to ' + FileName + '!');
          end
        end
        else begin
          Log('[AfterAppDirInstalled] Cannot open ' + FileName + '!');
        end;
      end;
      until not FindNext(FindRec);
    finally
      FindClose(FindRec);
    end;
  end;
end;
