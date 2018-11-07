/*
 * Delphi-C# integration example by Dmitrii Konnov
 * Location: Orlando FL
 * email: konnov72@gmail.com
 * this is fix of Form.WPF.pas for Delphi-C# integration example
// VCL form compiled in derivated assembly will always fail to create, because
// dfm  resource can not be found in the current assembly. 
// Because of that I introduced new constructor with AssemblyName additional parameter
// unfortunately I did not find a solution to implement that in derivted assembly.
 */ 
namespace RemObjects.Elements.RTL.Delphi.VCL;

{$IF ECHOESWPF}

interface

uses
  System.Windows.Controls, RemObjects.Elements.RTL.Delphi;

type
  TCustomForm = public partial class(TNativeControl)
  protected
    method PlatformSetTop(aValue: Integer); override;
    method PlatformSetLeft(aValue: Integer); override;
    method PlatformSetCaption(aValue: String); override;
    method PlatformInitControl; override;

  public
    constructor(aOwner: TComponent);
	constructor (aOwner: TComponent; AssemblyName : String); 
  end;

  TForm = public partial class(TCustomForm)
  protected
    method CreateHandle; override;
  public	
	constructor (aOwner: TComponent; AssemblyName : String); 
    method Show; override;
  end;

implementation



constructor TCustomForm(aOwner: TComponent);
begin
  HandleNeeded;
  var lName := typeOf(self).Name;
  lName := lName.Substring(lName.LastIndexOf('.') + 1).ToUpper;
  if lName.ToUpper <> 'TFORM' then begin
    // the resource is on the .exe, not here!
    var lAssembly := System.Reflection.Assembly.GetEntryAssembly();    
    var lResStream := lAssembly.GetManifestResourceStream(lName);        
    var lBuffer := new Byte[lResStream.Length];
    lResStream.Read(lBuffer, 0, lResStream.Length);
    var lStream := new TMemoryStream();
    lStream.Write(lBuffer, lResStream.Length);
    lStream.Position := 74; // Discard header
    var lReader := new TReader(lStream, 100);
    lReader.ReadRootComponent(self);
  end;
end;

method TCustomForm.PlatformSetTop(aValue: Integer);
begin
  (fHandle as System.Windows.Window).Top := aValue;
end;

method TCustomForm.PlatformSetLeft(aValue: Integer);
begin
  (fHandle as System.Windows.Window).Left := aValue;
end;

method TCustomForm.PlatformSetCaption(aValue: String);
begin
  (fHandle as System.Windows.Window).Title := aValue;
end;

method TCustomForm.PlatformInitControl;
begin
  fHeightDelta := Integer(System.Windows.SystemParameters.WindowCaptionHeight +
    System.Windows.SystemParameters.ResizeFrameHorizontalBorderHeight);
  fWidthDelta := Integer(System.Windows.SystemParameters.ResizeFrameVerticalBorderWidth);
end;

method TForm.CreateHandle;
begin
  fHandle := new System.Windows.Window();
  fPanel := new Canvas();
  (fHandle as System.Windows.Window).Content := fPanel;
end;

method TForm.Show;
begin
  (fHandle as System.Windows.Window).Show;
end;

// VCL form compiled in derivated assembly will always fail to create, because
// dfm  resource can not be found in the current assembly. 
// Because of that I introduced new constructor with AssemblyName additional parameter
// unfortunately I did not find a solution to implement that in derivted assembly.

constructor TCustomForm(aOwner: TComponent; AssemblyName : String); 
begin

method  GetAssemblyByName(name : String) : System.Reflection.Assembly;
begin	
	var assemblies := AppDomain.CurrentDomain.GetAssemblies();
	var i : Integer;	
	for i := 0 to length(assemblies) -1 do
	begin
      if assemblies[i].GetName().Name = name then
	  begin
		result := assemblies[i];
        exit;
	  end;
	end;
	raise new System.Exception('Assembly ' + name + ' not found');	
end;

	if Application = nil then
       Application := TApplication.Create(nil);
    
	HandleNeeded;
	var lName := typeOf(self).Name;
	lName := lName.Substring(lName.LastIndexOf('.') + 1).ToUpper;
	if lName.ToUpper <> 'TFORM' then begin
	// the resource is on the .exe, not here!
	var lAssembly := GetAssemblyByName(AssemblyName);
	var lResStream := lAssembly.GetManifestResourceStream(lName);        
	var lBuffer := new Byte[lResStream.Length];
	lResStream.Read(lBuffer, 0, lResStream.Length);
	var lStream := new TMemoryStream();
	lStream.Write(lBuffer, lResStream.Length);
	lStream.Position := 74; // Discard header
	var lReader := new TReader(lStream, 100);
	lReader.ReadRootComponent(self);
	end;
end;

constructor TForm(aOwner: TComponent; AssemblyName : String); 
begin
	inherited;
end;
{$ENDIF}

end.