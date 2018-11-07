 {
* Delphi-C# integration example by Dmitrii Konnov
* Location: Orlando FL
* email: konnov72@gmail.com
}
namespace MyOxygeneForms;
//unit Unit5;// for Editing form in Delphi
interface

uses
  System.Windows.Controls, RemObjects.Elements.RTL.Delphi, RemObjects.Elements.RTL.Delphi.VCL;
 { // for Editing form in Delphi
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;}

type
  
  TForm6 = public class(TForm)
  //TForm6 = class(TForm)
   
  private
  { Private declarations }
  public
    
  { Public declarations }
    Button1: TButton;
    button2: TButton;
    edit1: TEdit;
    label1: TLabel;
    radioButton1: TRadioButton;
    CheckBox1: TCheckBox;
    listBox1: TListBox;
    comboBox1: TComboBox;
    groupBox1: TGroupBox;
    Panel1: TPanel;

    panel2: TPanel;
    label2: TLabel;
    label3: TLabel;
    label4: TLabel;
    label5: TLabel;
    label6: TLabel;
    checkBox2: TCheckBox;
    checkBox3: TCheckBox;
    checkBox4: TCheckBox;
    edit2: TEdit;
    edit3: TEdit;

	  
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var key: Char);
	
  end;

 
  var
    Form6: TForm6;

implementation
//{$R *.dfm} // for Editing form in Delphi

procedure TForm6.Button1Click(Sender: TObject);
begin
  ShowMessage('WPF!!');
  label1.Width := 200;
  label1.Caption := 'All right!';
  ShowMessage('Clicked!');
  ShowMessage(edit1.Text);

  listBox1.Items.Add(edit1.Text);
  comboBox1.Items.Add(edit1.Text);
  edit1.OnKeyPress := @Edit1KeyPress;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  edit1.Text := 'Blah!';
end;

procedure TForm6.ComboBox1Select(Sender: TObject);
begin
  ShowMessage('Yes!');
end;

procedure TForm6.Edit1KeyPress(Sender: TObject; var key: Char);
begin
  ShowMessage(key);
end;


end.