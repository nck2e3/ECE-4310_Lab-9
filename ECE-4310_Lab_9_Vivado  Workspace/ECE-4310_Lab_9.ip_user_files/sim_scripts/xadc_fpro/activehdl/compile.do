transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 -l xil_defaultlib \
"../../../../ECE-4310_Lab_8.gen/sources_1/ip/xadc_fpro/xadc_fpro.v" \


vlog -work xil_defaultlib \
"glbl.v"
