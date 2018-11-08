This is Delphi-C# .Net integration example based on RemObjects.Oxygene

Delphi-WPF.dll  - base RemObjects.Elements.RTL.Delphi.VCL implementation
Form.WPF.pas  - must be replaced, and Delphi-WPF.dll must be rebuild with Form.WPF.pas version coming in this example.

VCL form compiled in derivated assembly will always fail to create, because
dfm  resource can not be found in the current assembly. 
Because of that I introduced new constructor with AssemblyName additional parameter
unfortunately I did not find a solution to implement that in derivted assembly.

MyOxygeneForms.dll - Oxygene/Delphi custom forms implementation assembly. Implement your VCL forms in this DLL.

WpfApplication1.exe - MSVS2015 Visual C# assembly that uses MyOxygeneForms.dll and VCL forms implemented in it.

please follow example instructions
https://delphicontrollab.blogspot.com/2018/11/delphi-and-c-integration.html