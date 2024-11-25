namespace veritabanip
{
    partial class parola
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.kullanici_adi = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txt_ad = new System.Windows.Forms.TextBox();
            this.txt_parola = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // kullanici_adi
            // 
            this.kullanici_adi.AutoSize = true;
            this.kullanici_adi.Location = new System.Drawing.Point(90, 87);
            this.kullanici_adi.Name = "kullanici_adi";
            this.kullanici_adi.Size = new System.Drawing.Size(104, 16);
            this.kullanici_adi.TabIndex = 0;
            this.kullanici_adi.Text = "KULLANICI ADI :";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(92, 163);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(70, 16);
            this.label2.TabIndex = 1;
            this.label2.Text = " PAROLA :";
            // 
            // txt_ad
            // 
            this.txt_ad.Location = new System.Drawing.Point(228, 84);
            this.txt_ad.Name = "txt_ad";
            this.txt_ad.Size = new System.Drawing.Size(195, 22);
            this.txt_ad.TabIndex = 2;
            // 
            // txt_parola
            // 
            this.txt_parola.Location = new System.Drawing.Point(223, 153);
            this.txt_parola.Name = "txt_parola";
            this.txt_parola.Size = new System.Drawing.Size(199, 22);
            this.txt_parola.TabIndex = 3;
            // 
            // parola
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.txt_parola);
            this.Controls.Add(this.txt_ad);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.kullanici_adi);
            this.Name = "parola";
            this.Text = "Form2";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label kullanici_adi;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txt_ad;
        private System.Windows.Forms.TextBox txt_parola;
    }
}