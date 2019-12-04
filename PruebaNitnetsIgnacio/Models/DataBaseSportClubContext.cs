using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace PruebaNitnetsIgnacio.Models
{
    public partial class DataBaseSportClubContext : DbContext
    {
        public DataBaseSportClubContext()
        {
        }

        public DataBaseSportClubContext(DbContextOptions<DataBaseSportClubContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Deportes> Deportes { get; set; }
        public virtual DbSet<Pistas> Pistas { get; set; }
        public virtual DbSet<Reservas> Reservas { get; set; }
        public virtual DbSet<Socios> Socios { get; set; }
        public virtual DbSet<Usuarios> Usuarios { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                //#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=(localdb)\\MSSQLLocalDB;Database=DataBaseSportClub;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Deportes>(entity =>
            {
                entity.HasKey(e => e.KindSport)
                    .HasName("PK__tmp_ms_x__ECFF4B5EDDB34485");

                entity.Property(e => e.KindSport)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.DescSport)
                    .HasMaxLength(500)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Pistas>(entity =>
            {
                entity.HasKey(e => e.IdCourt)
                    .HasName("PK__tmp_ms_x__FDA5205D0F3255E0");

                entity.Property(e => e.KindSport)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.KindSportNavigation)
                    .WithMany(p => p.Pistas)
                    .HasForeignKey(d => d.KindSport)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Pistas_ToDeportes");
            });

            modelBuilder.Entity<Reservas>(entity =>
            {
                entity.HasKey(e => e.IdReservation)
                    .HasName("PK__Reservas__7E69A57B0B485B93");

                entity.Property(e => e.DateReservation).HasColumnType("datetime");

                entity.Property(e => e.IdCourt).HasColumnName("idCourt");

                entity.Property(e => e.KindSport)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdCourtNavigation)
                    .WithMany(p => p.Reservas)
                    .HasForeignKey(d => d.IdCourt)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reservas_Pistas");

                entity.HasOne(d => d.IdMemberNavigation)
                    .WithMany(p => p.Reservas)
                    .HasForeignKey(d => d.IdMember)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reservas_ToSocios");

                entity.HasOne(d => d.KindSportNavigation)
                    .WithMany(p => p.Reservas)
                    .HasForeignKey(d => d.KindSport)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reservas_ToDeportes");
            });

            modelBuilder.Entity<Socios>(entity =>
            {
                entity.HasKey(e => e.IdMember)
                    .HasName("PK__tmp_ms_x__570E7FF0B8478052");

                entity.Property(e => e.AddressStreet)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.AdressNumber)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.FirstSurname)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.IdentityNumber)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SecondSurname)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ZipCode)
                    .IsRequired()
                    .HasMaxLength(15)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Usuarios>(entity =>
            {
                entity.HasKey(e => e.Login)
                    .HasName("PK__tmp_ms_x__5E55825A2B4808D5");

                entity.Property(e => e.Login)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Dni)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
