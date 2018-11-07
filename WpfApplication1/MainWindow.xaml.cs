/*
 * Delphi-C# integration example by Dmitrii Konnov
 * Location: Orlando FL
 * email: konnov72@gmail.com
 */ 

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using MyOxygeneForms;
//using VCL = RemObjects.Elements.RTL.Delphi.VCL.__Global;
namespace WpfApplication1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        System.Reflection.Assembly GetAssemblyByName(string name)
        {
            return AppDomain.CurrentDomain.GetAssemblies().
                   SingleOrDefault(assembly => assembly.GetName().Name == name);
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // second parameter is name of accembly with Oxygene WPF forms
                MyOxygeneForms.TForm6 a_Frm = new MyOxygeneForms.TForm6(null, "MyOxygeneForms");
                a_Frm.Caption = "VCL Form in C# environment";
                a_Frm.edit1.Text = "C# & Delphi";
                a_Frm.Show();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
