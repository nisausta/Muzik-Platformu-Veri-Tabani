using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;

namespace veritabanip
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        static string conString = "Data Source=NISA;Initial Catalog=veritabaniproje;Integrated Security=True";
        SqlConnection connect = new SqlConnection(conString);

        private void btn_kayitol_Click(object sender, EventArgs e)
        {
            try
            {
                if (connect.State == ConnectionState.Closed)
                    connect.Open();
                string kayit = "insert into Kullanicilar (KullaniciAdi,KullaniciEposta,KullaniciSifre,KullaniciTelNo,CinsiyetID) values(@KullaniciAdi,@KullaniciEposta,@KullaniciSifre,@KullaniciTelNo,@CinsiyetID)"; 
                SqlCommand komut = new SqlCommand(kayit, connect);
           
                SqlDataReader dr;
                connect.Open();
                dr = komut.ExecuteReader();
                while (dr.Read())
                {
                    CinsiyetID.Items.Add(dr["CinsiyetID"]);
                }
               connect.Close();
                komut.Parameters.AddWithValue("@KullaniciID", txt_id.Text);
                komut.Parameters.AddWithValue("@KullaniciAdi", txt_ad.Text);
                komut.Parameters.AddWithValue("@KullaniciEposta", txt_eposta.Text);
                komut.Parameters.AddWithValue("@KullaniciSifre", txt_parola.Text);
                komut.Parameters.AddWithValue("@KullaniciTelNo", txt_telno.Text);
              //komut.Parameters.AddWithValue("@DogumTarihi", combobox_dt.Text);
                //komut.Parameters.AddWithValue("@CinsiyetID", combobox_cinsiyet.Text);
              //  komut.Parameters.AddWithValue("@ilID", combobox_sehir.Text);
                komut.ExecuteNonQuery();
                connect.Close();
                MessageBox.Show("kayıt eklendi");

            }
            catch (Exception hata)
            {
                MessageBox.Show("HATA" + hata.Message);
            }

 
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void combobox_dt_ValueChanged(object sender, EventArgs e)
        {

        }
    }
}

