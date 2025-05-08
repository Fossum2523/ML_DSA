onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib Ture_Dual_Port_RAM_64x16_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {Ture_Dual_Port_RAM_64x16.udo}

run 1000ns

quit -force
