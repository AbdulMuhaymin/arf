mkdir 6.pdos_files
tar -zxvf 6.pdos_files.tar.gz -C 6.pdos_files/
cd 6.pdos_files/
sumpdos.x *\(Zn\)* > Zn.pdos
sumpdos.x *\(S\)* > S.pdos
sumpdos.x *\(Co\)* > Co.pdos
sumpdos.x *\(Co\)*3* > Co_3d.pdos