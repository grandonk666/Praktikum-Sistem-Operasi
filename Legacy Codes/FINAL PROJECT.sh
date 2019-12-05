declare -a id
declare -a jenis
declare -a status
declare -a harga
declare -a pukul

i=0
n=0


insert(){
    flag=0
    echo -n "ID Barang                  : "
    read id_temp
    echo -n "Jenis Barang               : "
    read jenis_temp
    echo -n "Merek Baranng              : "
    read merek_temp
    echo -n "Status Barang(Baru/Bekas)  : "
    read status_temp
    echo -n "Harga barang               : "
    read harga_temp

    for nomor_cari in ${id[*]}
    do
        if [[ $nomor_cari -eq $id_temp ]]
        then
            flag=1
            break
        fi
    done

    if [[ $flag -eq 1 ]]
    then
        echo "Barang sudah ada"
    else
        id[$i]=$id_temp
        jenis[$i]=$jenis_temp
        merek[$i]=$merek_temp
        status[$i]=$status_temp
        harga[$i]=$harga_temp
        i=$i+1
        n=$n+1
    fi
}

view(){
    if [[ $n -eq 0 ]]
    then
        echo "Tidak ada barang yang tersedia"
    fi

    for((i=0;i<n;i++))
    do
        echo "========================================="
        echo "ID                : ${id[$i]}"
        echo "Jenis             : ${jenis[$i]}"
        echo "Merek             : ${merek[$i]}"
        echo "Status            : ${status[$i]}"
        echo "Harga             : ${harga[$i]}"
        echo "========================================="
    done
}

search(){
    echo -n "Masukkan ID barang  : "
    read cari
    a=0

    for((i=0;i<n;i++))
    do
        if [[ $cari -eq ${id[$i]} ]]
        then
            a=1
            break
        fi
    done

    if [[ $a -eq 1 ]]
    then
        echo "========================================="
        echo "ID                : ${id[$i]}"
        echo "Jenis             : ${jenis[$i]}"
        echo "Merek             : ${merek[$i]}"
        echo "Status            : ${status[$i]}"
        echo "Harga             : ${harga[$i]}"
        echo "========================================="
    else
        echo "Barang tidak ditemukan"
    fi
}

update(){
    echo -n "Masukkan ID barang : "
    read update
    b=0

    for((i=0;i<n;i++))
    do
        if [[ $update -eq ${id[$i]} ]]
        then 
            b=1
            break
        fi
    done

    if [[ $b -eq 1 ]]
    then
        u=0
        echo -n "ID baru   : "
        read id_temp
        echo -n "Jenis     : "
        read jenis_temp
        echo -n "Merek     : "
        read merek_temp
        echo -n "Status    : "
        read status_temp
        echo -n "Harga     : "
        read harga_temp

        for nomor_cari in ${id[*]}
        do
            if [[ $nomor_cari -eq $id_temp ]]
            then
                u=1
                break
            fi
        done
    
        if [[ $u -eq 1 ]]
        then
            echo "Barang sudah ada"
        else

        	id[$i]=$id_temp
        	jenis[$i]=$jenis_temp
        	merek[$i]=$merek_temp
        	status[$i]=$status_temp
        	harga[$i]=$harga_temp
		fi
	else
		echo "Data barang belum terdaftar"
    fi
}

buy(){
    echo -n "Masukkan ID barang yang akan dibeli : "
    read beli
    c=0

    for((i=0;i<n;i++))
    do 
        if [[ $beli -eq ${id[$i]} ]]
        then
            c=1
            break
        fi
    done

    if [[ $c -eq 1 ]]
    then
    	echo "Masukan Data Pembeli"
		echo -n "Nama      : "
		read pnama
		echo -n "Alamat    : "
		read palamat
		echo -n "Nomor Hp  : "
		read php
		clear

    	echo "========================================="
    	echo "             NOTA PEMBELIAN              "
    	echo "-----------------------------------------"
    	echo "Nama         : $pnama"
    	echo "Alamat       : $palamat"
    	echo "Nomor Hp     : $php"
    	echo "-----------------------------------------"
        echo "ID Barang         : ${id[$i]}"
        echo "Jenis             : ${jenis[$i]}"
        echo "Merek             : ${merek[$i]}"
        echo "Status            : ${status[$i]}"
        echo "Harga             : ${harga[$i]}"
        echo "========================================="

        unset id[$i] 
        unset jenis[$i]
        unset merek[$i] 
        unset status[$i]
        unset harga[$i]

        id=( "${id[@]}" )
        jenis=( "${jenis[@]}" )
        merek=( "${merek[@]}" )
        status=( "${status[@]}" )
        harga=( "${harga[@]}" )
        n=$n-1
    else
        echo "Data barang tidak terdaftar"
    fi
}

while :;
do
    echo "==========================================================="
    echo "                  APLIKASI ADMIN                           "
    echo "                  TOKO ALAT MUSIK                          "
    echo "==========================================================="
    echo ""
    echo " 1. Input Barang Yang Tersedia"
    echo " 2. Lihat Barang Yang Tersedia"
    echo " 3. cari Barang"
    echo " 4. Update Data Barang"
    echo " 5. Beli"
    echo " 6. Exit"
    echo ""
    echo -n "Pilih menu : "
    read pilih

    if [[ $pilih == 1 ]]
    then
        clear
        insert
        clear
    elif [[ $pilih == 2 ]]
    then
        clear
        view
    elif [[ $pilih == 3 ]]
    then 
        clear
        search
    elif [[ $pilih == 4 ]]
    then
        clear
        update
        clear
    elif [[ $pilih == 5 ]]
    then 
        clear
        buy
    elif [[ $pilih == 6 ]]
    then
        exit
    else
        echo "pilihannya gaada!"
    fi
done
