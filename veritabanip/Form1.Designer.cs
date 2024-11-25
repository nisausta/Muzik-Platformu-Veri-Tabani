namespace veritabanip
{
    partial class Form1
    {
        /// <summary>
        ///Gerekli tasarımcı değişkeni.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///Kullanılan tüm kaynakları temizleyin.
        /// </summary>
        ///<param name="disposing">yönetilen kaynaklar dispose edilmeliyse doğru; aksi halde yanlış.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer üretilen kod

        /// <summary>
        /// Tasarımcı desteği için gerekli metot - bu metodun 
        ///içeriğini kod düzenleyici ile değiştirmeyin.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.combobox_sehir = new System.Windows.Forms.ComboBox();
            this.sehir = new System.Windows.Forms.Label();
            this.btn_kayitol = new System.Windows.Forms.Button();
            this.combobox_cinsiyet = new System.Windows.Forms.ComboBox();
            this.combobox_dt = new System.Windows.Forms.DateTimePicker();
            this.txt_eposta = new System.Windows.Forms.TextBox();
            this.txt_parola = new System.Windows.Forms.TextBox();
            this.txt_telno = new System.Windows.Forms.TextBox();
            this.txt_ad = new System.Windows.Forms.TextBox();
            this.cinsiyet = new System.Windows.Forms.Label();
            this.Dogum_tarihi = new System.Windows.Forms.Label();
            this.telno = new System.Windows.Forms.Label();
            this.eposta = new System.Windows.Forms.Label();
            this.parola = new System.Windows.Forms.Label();
            this.kullanıcı_adi = new System.Windows.Forms.Label();
            this.kayitol = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.txt_id = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // combobox_sehir
            // 
            this.combobox_sehir.FormattingEnabled = true;
            this.combobox_sehir.Location = new System.Drawing.Point(577, 354);
            this.combobox_sehir.Name = "combobox_sehir";
            this.combobox_sehir.Size = new System.Drawing.Size(199, 24);
            this.combobox_sehir.TabIndex = 35;
            // 
            // sehir
            // 
            this.sehir.AutoSize = true;
            this.sehir.Font = new System.Drawing.Font("Modern No. 20", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sehir.Location = new System.Drawing.Point(312, 347);
            this.sehir.Name = "sehir";
            this.sehir.Size = new System.Drawing.Size(254, 31);
            this.sehir.TabIndex = 34;
            this.sehir.Text = " Yaşadığın Şehir :";
            // 
            // btn_kayitol
            // 
            this.btn_kayitol.Location = new System.Drawing.Point(510, 405);
            this.btn_kayitol.Name = "btn_kayitol";
            this.btn_kayitol.Size = new System.Drawing.Size(137, 32);
            this.btn_kayitol.TabIndex = 33;
            this.btn_kayitol.Text = " KAYITOL";
            this.btn_kayitol.UseVisualStyleBackColor = true;
            this.btn_kayitol.Click += new System.EventHandler(this.btn_kayitol_Click);
            // 
            // combobox_cinsiyet
            // 
            this.combobox_cinsiyet.FormattingEnabled = true;
            this.combobox_cinsiyet.Location = new System.Drawing.Point(577, 316);
            this.combobox_cinsiyet.Name = "combobox_cinsiyet";
            this.combobox_cinsiyet.Size = new System.Drawing.Size(208, 24);
            this.combobox_cinsiyet.TabIndex = 32;
            // 
            // combobox_dt
            // 
            this.combobox_dt.Location = new System.Drawing.Point(577, 278);
            this.combobox_dt.Name = "combobox_dt";
            this.combobox_dt.Size = new System.Drawing.Size(209, 22);
            this.combobox_dt.TabIndex = 31;
            this.combobox_dt.ValueChanged += new System.EventHandler(this.combobox_dt_ValueChanged);
            // 
            // txt_eposta
            // 
            this.txt_eposta.Location = new System.Drawing.Point(577, 137);
            this.txt_eposta.Name = "txt_eposta";
            this.txt_eposta.Size = new System.Drawing.Size(212, 22);
            this.txt_eposta.TabIndex = 30;
            // 
            // txt_parola
            // 
            this.txt_parola.Location = new System.Drawing.Point(577, 182);
            this.txt_parola.Name = "txt_parola";
            this.txt_parola.Size = new System.Drawing.Size(212, 22);
            this.txt_parola.TabIndex = 29;
            // 
            // txt_telno
            // 
            this.txt_telno.Location = new System.Drawing.Point(577, 234);
            this.txt_telno.Name = "txt_telno";
            this.txt_telno.Size = new System.Drawing.Size(212, 22);
            this.txt_telno.TabIndex = 28;
            // 
            // txt_ad
            // 
            this.txt_ad.Location = new System.Drawing.Point(577, 90);
            this.txt_ad.Name = "txt_ad";
            this.txt_ad.Size = new System.Drawing.Size(212, 22);
            this.txt_ad.TabIndex = 27;
            // 
            // cinsiyet
            // 
            this.cinsiyet.AutoSize = true;
            this.cinsiyet.Font = new System.Drawing.Font("Modern No. 20", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cinsiyet.Location = new System.Drawing.Point(413, 316);
            this.cinsiyet.Name = "cinsiyet";
            this.cinsiyet.Size = new System.Drawing.Size(134, 31);
            this.cinsiyet.TabIndex = 26;
            this.cinsiyet.Text = "Cinsiyet :";
            // 
            // Dogum_tarihi
            // 
            this.Dogum_tarihi.AutoSize = true;
            this.Dogum_tarihi.Font = new System.Drawing.Font("Modern No. 20", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Dogum_tarihi.Location = new System.Drawing.Point(323, 269);
            this.Dogum_tarihi.Name = "Dogum_tarihi";
            this.Dogum_tarihi.Size = new System.Drawing.Size(218, 31);
            this.Dogum_tarihi.TabIndex = 25;
            this.Dogum_tarihi.Text = "Doğum Tarihi :";
            // 
            // telno
            // 
            this.telno.AutoSize = true;
            this.telno.Font = new System.Drawing.Font("Modern No. 20", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.telno.Location = new System.Drawing.Point(421, 223);
            this.telno.Name = "telno";
            this.telno.Size = new System.Drawing.Size(128, 31);
            this.telno.TabIndex = 24;
            this.telno.Text = "Telefon :";
            // 
            // eposta
            // 
            this.eposta.AutoSize = true;
            this.eposta.Font = new System.Drawing.Font("Modern No. 20", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.eposta.Location = new System.Drawing.Point(407, 126);
            this.eposta.Name = "eposta";
            this.eposta.Size = new System.Drawing.Size(138, 31);
            this.eposta.TabIndex = 23;
            this.eposta.Text = " E Posta :";
            // 
            // parola
            // 
            this.parola.AutoSize = true;
            this.parola.Font = new System.Drawing.Font("Modern No. 20", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.parola.Location = new System.Drawing.Point(434, 171);
            this.parola.Name = "parola";
            this.parola.Size = new System.Drawing.Size(117, 31);
            this.parola.TabIndex = 22;
            this.parola.Text = "Parola :";
            // 
            // kullanıcı_adi
            // 
            this.kullanıcı_adi.AutoSize = true;
            this.kullanıcı_adi.Font = new System.Drawing.Font("Modern No. 20", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.kullanıcı_adi.Location = new System.Drawing.Point(328, 86);
            this.kullanıcı_adi.Name = "kullanıcı_adi";
            this.kullanıcı_adi.Size = new System.Drawing.Size(214, 31);
            this.kullanıcı_adi.TabIndex = 21;
            this.kullanıcı_adi.Text = "Kullanıcı Adı :";
            // 
            // kayitol
            // 
            this.kayitol.AutoSize = true;
            this.kayitol.Font = new System.Drawing.Font("Modern No. 20", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.kayitol.Location = new System.Drawing.Point(495, 13);
            this.kayitol.Name = "kayitol";
            this.kayitol.Size = new System.Drawing.Size(171, 31);
            this.kayitol.TabIndex = 20;
            this.kayitol.Text = " KAYIT OL";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(12, 48);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(310, 322);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 19;
            this.pictureBox1.TabStop = false;
            // 
            // txt_id
            // 
            this.txt_id.Location = new System.Drawing.Point(565, 60);
            this.txt_id.Name = "txt_id";
            this.txt_id.Size = new System.Drawing.Size(219, 22);
            this.txt_id.TabIndex = 36;
            this.txt_id.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.txt_id);
            this.Controls.Add(this.combobox_sehir);
            this.Controls.Add(this.sehir);
            this.Controls.Add(this.btn_kayitol);
            this.Controls.Add(this.combobox_cinsiyet);
            this.Controls.Add(this.combobox_dt);
            this.Controls.Add(this.txt_eposta);
            this.Controls.Add(this.txt_parola);
            this.Controls.Add(this.txt_telno);
            this.Controls.Add(this.txt_ad);
            this.Controls.Add(this.cinsiyet);
            this.Controls.Add(this.Dogum_tarihi);
            this.Controls.Add(this.telno);
            this.Controls.Add(this.eposta);
            this.Controls.Add(this.parola);
            this.Controls.Add(this.kullanıcı_adi);
            this.Controls.Add(this.kayitol);
            this.Controls.Add(this.pictureBox1);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox combobox_sehir;
        private System.Windows.Forms.Label sehir;
        private System.Windows.Forms.Button btn_kayitol;
        private System.Windows.Forms.ComboBox combobox_cinsiyet;
        private System.Windows.Forms.DateTimePicker combobox_dt;
        private System.Windows.Forms.TextBox txt_eposta;
        private System.Windows.Forms.TextBox txt_parola;
        private System.Windows.Forms.TextBox txt_telno;
        private System.Windows.Forms.TextBox txt_ad;
        private System.Windows.Forms.Label cinsiyet;
        private System.Windows.Forms.Label Dogum_tarihi;
        private System.Windows.Forms.Label telno;
        private System.Windows.Forms.Label eposta;
        private System.Windows.Forms.Label parola;
        private System.Windows.Forms.Label kullanıcı_adi;
        private System.Windows.Forms.Label kayitol;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.TextBox txt_id;
    }
}

