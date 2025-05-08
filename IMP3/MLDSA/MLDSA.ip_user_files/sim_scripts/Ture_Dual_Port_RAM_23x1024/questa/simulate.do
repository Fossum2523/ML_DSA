onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib Ture_Dual_Port_RAM_23x1024_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {Ture_Dual_Port_RAM_23x1024.udo}

run 1000ns

quit -force
