onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BODY_G_ROM_opt

do {wave.do}

view wave
view structure
view signals

do {BODY_G_ROM.udo}

run -all

quit -force
