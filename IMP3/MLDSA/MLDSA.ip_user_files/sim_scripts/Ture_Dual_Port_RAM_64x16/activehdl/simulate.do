transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+Ture_Dual_Port_RAM_64x16  -L xpm -L blk_mem_gen_v8_4_7 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Ture_Dual_Port_RAM_64x16 xil_defaultlib.glbl

do {Ture_Dual_Port_RAM_64x16.udo}

run 1000ns

endsim

quit -force
