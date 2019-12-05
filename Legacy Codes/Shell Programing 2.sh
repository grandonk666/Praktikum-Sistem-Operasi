exit=1;
while [[$exit -eq 1 ]]
do
echo “1. Menu Kalkulator Loop”;
echo “2. Keluar”;
echo “Pilihan : ”;
read pilihan
if [[ $pilihan -eq 1 ]];
then
 echo “Masukan Bilangan Acuan : ”;
 read acuan;
 echo “Masukan Batasan Loop : ”;
 read loop;
 echo “Penjumlahan”;
 for ((i=1; i<=loop; i=i+1))
 do
  let jumlah=$acuan+$i
  echo “$acuan + $i = $jumlah”;
 done
 echo “Pengurangan”;
 for ((i=1; i<=loop; i=i+1))
 do
  let jumlah=$acuan-$i
  echo “$acuan - $i = $jumlah”;
 done
 echo “Pembagian”;
 for ((i=1; i<=loop; i=i+1))
 do
  let jumlah=$acuan/$i
  echo “$acuan / $i = $jumlah”;
 done
 echo “Perkalian”;
 for ((i=1; i<=loop; i=i+1))
 do
  let jumlah=$acuan*$i
  echo “$acuan * $i = $jumlah”;
 done
elif [[ $pilihan = 2 ]]
then
 exit=0;
 fi
done
