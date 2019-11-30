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
                    .HasName("PK__Pistas__FDA5205DC6F11F1A");

                entity.Property(e => e.IdCourt).ValueGeneratedNever();

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

                entity.Property(e => e.DateReservation).HasColumnType("date");

                entity.Property(e => e.IdCourt).HasColumnName("idCourt");

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
            });

            modelBuilder.Entity<Socios>(entity =>
            {
                entity.HasKey(e => e.IdMember)
                    .HasName("PK__Socios__570E7FF09F50047A");

                entity.Property(e => e.IdMember).ValueGeneratedNever();

                entity.Property(e => e.AddressStreet)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.AdressNumber)
                    .IsRequired()
                    .HasMaxLength(10)
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
                entity.HasKey(e => e.IdUser)
                    .HasName("PK__Usuarios__B7C926380793B8D2");

                entity.Property(e => e.IdUser).ValueGeneratedNever();

                entity.Property(e => e.Login)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Password).IsRequired();
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
