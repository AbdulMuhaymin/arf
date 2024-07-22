mkdir 6.pdos_files
tar -zxvf 6.pdos_files.tar.gz -C 6.pdos_files/
cd 6.pdos_files/
sumpdos.x *\(Zn\)* > Zn.pdos
sumpdos.x *\(S\)* > S.pdos
sumpdos.x *\(Cu\)* > Cu.pdos
sumpdos.x *\(Cu\)*4* > Cu_3d.pdos