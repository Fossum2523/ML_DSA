
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:052

00:00:052	
484.7732	
179.004Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/utils_1/imports/synth_1/MLDSA.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2^
\C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/utils_1/imports/synth_1/MLDSA.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
h
Command: %s
53*	vivadotcl27
5synth_design -top MLDSA_AXI_Top -part xc7k70tfbv676-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7k70tZ17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7k70tZ17-349h px� 
D
Loading part %s157*device2
xc7k70tfbv676-1Z21-403h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
M
#Helper process launched with PID %s4824*oasys2
7084Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 1327.449 ; gain = 438.691
h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
	sha_reset2
wire2b
^C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/Data_Path.v2
26878@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
sha_out_ready2
wire2^
ZC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/MLDSA.v2
1278@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2

NTT_mode2
wire2^
ZC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/MLDSA.v2
1398@Z8-11241h px� 
�
synthesizing module '%s'%s4497*oasys2
MLDSA_AXI_Top2
 2\
XC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/AXI/MLDSA_AXI_Top.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
AXI4_Lite_Slave2
 2^
ZC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/AXI/AXI4_Lite_Slave.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
AXI4_Lite_Slave2
 2
02
12^
ZC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/AXI/AXI4_Lite_Slave.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
AXIS_MLDSA_Wrapper2
 2a
]C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/AXI/AXIS_MLDSA_Wrapper.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
AXIS_MLDSA_Wrapper2
 2
02
12a
]C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/AXI/AXIS_MLDSA_Wrapper.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
MLDSA2
 2^
ZC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/MLDSA.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

Controller2
 2c
_C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/Controller.v2
18@Z8-6157h px� 
�
case item %s is unreachable151*oasys2
9'b0100000012c
_C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/Controller.v2
15878@Z8-151h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

Controller2
 2
02
12c
_C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/Controller.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	Data_Path2
 2b
^C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/Data_Path.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

Data_Mem2
 2\
XC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Data_Mem/Data_Mem.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
Ture_Dual_Port_RAM_23x40962
 2�
�C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.runs/synth_1/.Xil/Vivado-6948-LAPTOP-2P71OMBV/realtime/Ture_Dual_Port_RAM_23x4096_stub.v2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Ture_Dual_Port_RAM_23x40962
 2
02
12�
�C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.runs/synth_1/.Xil/Vivado-6948-LAPTOP-2P71OMBV/realtime/Ture_Dual_Port_RAM_23x4096_stub.v2
68@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Ture_Dual_Port_RAM_23x10242
 2�
�C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.runs/synth_1/.Xil/Vivado-6948-LAPTOP-2P71OMBV/realtime/Ture_Dual_Port_RAM_23x1024_stub.v2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Ture_Dual_Port_RAM_23x10242
 2
02
12�
�C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.runs/synth_1/.Xil/Vivado-6948-LAPTOP-2P71OMBV/realtime/Ture_Dual_Port_RAM_23x1024_stub.v2
68@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Ture_Dual_Port_RAM_64x162
 2�
�C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.runs/synth_1/.Xil/Vivado-6948-LAPTOP-2P71OMBV/realtime/Ture_Dual_Port_RAM_64x16_stub.v2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Ture_Dual_Port_RAM_64x162
 2
02
12�
�C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.runs/synth_1/.Xil/Vivado-6948-LAPTOP-2P71OMBV/realtime/Ture_Dual_Port_RAM_64x16_stub.v2
68@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

Data_Mem2
 2
02
12\
XC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Data_Mem/Data_Mem.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Address_generate2
 2l
hC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Address_generate/Address_generate.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Address_generate2
 2
02
12l
hC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Address_generate/Address_generate.v2
18@Z8-6155h px� 
�
case item %s is unreachable151*oasys2
9'b0000010002b
^C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/Data_Path.v2
23738@Z8-151h px� 
�
synthesizing module '%s'%s4497*oasys2
Keccak_Ctrl2
 2d
`C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/Keccak_Ctrl.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Keccak_Ctrl2
 2
02
12d
`C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/Keccak_Ctrl.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Keccak2
 2X
TC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Keccak/Keccak.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
Padder2
 2X
TC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Keccak/Padder.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2	
padder12
 2Y
UC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Keccak/padder1.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
padder12
 2
02
12Y
UC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Keccak/padder1.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Padder2
 2
02
12X
TC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Keccak/Padder.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
F_Permutation2
 2_
[C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Keccak/F_Permutation.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
rconst2
 2X
TC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Keccak/rconst.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
rconst2
 2
02
12X
TC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Keccak/rconst.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
round_A2
 2Y
UC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Keccak/round_A.v2
2338@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
round_A2
 2
02
12Y
UC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Keccak/round_A.v2
2338@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
round_B2
 2Y
UC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Keccak/round_B.v2
98@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
round_B2
 2
02
12Y
UC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Keccak/round_B.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
F_Permutation2
 2
02
12_
[C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Keccak/F_Permutation.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Keccak2
 2
02
12X
TC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Keccak/Keccak.v2
18@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
buffer_last2
Keccak2
KK2b
^C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/Data_Path.v2
26858@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
KK2
Keccak2
132
122b
^C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/Data_Path.v2
26858@Z8-7023h px� 
�
default block is never used226*oasys2b
^C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/Data_Path.v2
27258@Z8-226h px� 
�
synthesizing module '%s'%s4497*oasys2	
Sampler2
 2Z
VC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/Sampler.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2	
ExpandS2
 2Z
VC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/ExpandS.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
CoeffFromHalfByte2
 2d
`C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/CoeffFromHalfByte.v2
18@Z8-6157h px� 
�
default block is never used226*oasys2d
`C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/CoeffFromHalfByte.v2
338@Z8-226h px� 
�
default block is never used226*oasys2d
`C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/CoeffFromHalfByte.v2
358@Z8-226h px� 
�
default block is never used226*oasys2d
`C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/CoeffFromHalfByte.v2
448@Z8-226h px� 
�
default block is never used226*oasys2d
`C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/CoeffFromHalfByte.v2
538@Z8-226h px� 
�
default block is never used226*oasys2d
`C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/CoeffFromHalfByte.v2
628@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CoeffFromHalfByte2
 2
02
12d
`C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/CoeffFromHalfByte.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
ExpandS2
 2
02
12Z
VC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/ExpandS.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
ExpandA2
 2Z
VC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/ExpandA.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
ExpandA2
 2
02
12Z
VC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/ExpandA.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

ExpandMASK2
 2]
YC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/ExpandMASK.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

ExpandMASK2
 2
02
12]
YC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/ExpandMASK.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
SampleInBall2
 2_
[C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/SampleInBall.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
SampleInBall2
 2
02
12_
[C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/SampleInBall.v2
18@Z8-6155h px� 
�
default block is never used226*oasys2Z
VC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/Sampler.v2
2588@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
Sampler2
 2
02
12Z
VC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Sampler/Sampler.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
NTT2
 2R
NC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/NTT.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
Modular_Reduction2
 2`
\C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/Modular_Reduction.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Modular_Reduction2
 2
02
12`
\C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/Modular_Reduction.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
BU2
 2Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/BU.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2	
mod_add2
 2V
RC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/mod_add.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
mod_add2
 2
02
12V
RC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/mod_add.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
mod_sub2
 2V
RC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/mod_sub.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
mod_sub2
 2
02
12V
RC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/mod_sub.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
mod_mul2
 2V
RC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/mod_mul.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
mod_mul2
 2
02
12V
RC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/mod_mul.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
BU2
 2
02
12Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/BU.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
RU2
 2Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/RU.v2
18@Z8-6157h px� 
K
%s
*synth23
1	Parameter BIT_LEN bound to: 23 - type: integer 
h p
x
� 
I
%s
*synth21
/	Parameter depth bound to: 64 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
RU2
 2
02
12Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/RU.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
CONTR2
 2T
PC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/CONTR.v2
18@Z8-6157h px� 
K
%s
*synth23
1	Parameter BIT_LEN bound to: 23 - type: integer 
h p
x
� 
I
%s
*synth21
/	Parameter depth bound to: 64 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CONTR2
 2
02
12T
PC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/CONTR.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
RU__parameterized02
 2Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/RU.v2
18@Z8-6157h px� 
K
%s
*synth23
1	Parameter BIT_LEN bound to: 23 - type: integer 
h p
x
� 
I
%s
*synth21
/	Parameter depth bound to: 32 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
RU__parameterized02
 2
02
12Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/RU.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
CONTR__parameterized02
 2T
PC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/CONTR.v2
18@Z8-6157h px� 
K
%s
*synth23
1	Parameter BIT_LEN bound to: 23 - type: integer 
h p
x
� 
I
%s
*synth21
/	Parameter depth bound to: 32 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CONTR__parameterized02
 2
02
12T
PC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/CONTR.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
RU__parameterized12
 2Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/RU.v2
18@Z8-6157h px� 
K
%s
*synth23
1	Parameter BIT_LEN bound to: 23 - type: integer 
h p
x
� 
I
%s
*synth21
/	Parameter depth bound to: 16 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
RU__parameterized12
 2
02
12Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/RU.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
CONTR__parameterized12
 2T
PC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/CONTR.v2
18@Z8-6157h px� 
K
%s
*synth23
1	Parameter BIT_LEN bound to: 23 - type: integer 
h p
x
� 
I
%s
*synth21
/	Parameter depth bound to: 16 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CONTR__parameterized12
 2
02
12T
PC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/CONTR.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
RU__parameterized22
 2Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/RU.v2
18@Z8-6157h px� 
K
%s
*synth23
1	Parameter BIT_LEN bound to: 23 - type: integer 
h p
x
� 
H
%s
*synth20
.	Parameter depth bound to: 8 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
RU__parameterized22
 2
02
12Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/RU.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
CONTR__parameterized22
 2T
PC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/CONTR.v2
18@Z8-6157h px� 
K
%s
*synth23
1	Parameter BIT_LEN bound to: 23 - type: integer 
h p
x
� 
H
%s
*synth20
.	Parameter depth bound to: 8 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CONTR__parameterized22
 2
02
12T
PC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/CONTR.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
RU__parameterized32
 2Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/RU.v2
18@Z8-6157h px� 
K
%s
*synth23
1	Parameter BIT_LEN bound to: 23 - type: integer 
h p
x
� 
H
%s
*synth20
.	Parameter depth bound to: 4 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
RU__parameterized32
 2
02
12Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/RU.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
CONTR__parameterized32
 2T
PC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/CONTR.v2
18@Z8-6157h px� 
K
%s
*synth23
1	Parameter BIT_LEN bound to: 23 - type: integer 
h p
x
� 
H
%s
*synth20
.	Parameter depth bound to: 4 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CONTR__parameterized32
 2
02
12T
PC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/CONTR.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
RU__parameterized42
 2Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/RU.v2
18@Z8-6157h px� 
K
%s
*synth23
1	Parameter BIT_LEN bound to: 23 - type: integer 
h p
x
� 
H
%s
*synth20
.	Parameter depth bound to: 2 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
RU__parameterized42
 2
02
12Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/RU.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
CONTR__parameterized42
 2T
PC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/CONTR.v2
18@Z8-6157h px� 
K
%s
*synth23
1	Parameter BIT_LEN bound to: 23 - type: integer 
h p
x
� 
H
%s
*synth20
.	Parameter depth bound to: 2 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CONTR__parameterized42
 2
02
12T
PC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/CONTR.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
RU__parameterized52
 2Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/RU.v2
18@Z8-6157h px� 
K
%s
*synth23
1	Parameter BIT_LEN bound to: 23 - type: integer 
h p
x
� 
H
%s
*synth20
.	Parameter depth bound to: 1 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
RU__parameterized52
 2
02
12Q
MC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/RU.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
CONTR__parameterized52
 2T
PC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/CONTR.v2
18@Z8-6157h px� 
K
%s
*synth23
1	Parameter BIT_LEN bound to: 23 - type: integer 
h p
x
� 
H
%s
*synth20
.	Parameter depth bound to: 1 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CONTR__parameterized52
 2
02
12T
PC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/CONTR.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
NTT2
 2
02
12R
NC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/NTT/NTT.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
PWM2
 2R
NC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/PWM/PWM.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
PWM2
 2
02
12R
NC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/PWM/PWM.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
Encoder2
 2Z
VC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Encoder/Encoder.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
uncenter_coeff2
 2a
]C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Encoder/uncenter_coeff.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
uncenter_coeff2
 2
02
12a
]C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Encoder/uncenter_coeff.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

zero_strip2
 2]
YC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Encoder/zero_strip.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

zero_strip2
 2
02
12]
YC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Encoder/zero_strip.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
Encoder2
 2
02
12Z
VC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Encoder/Encoder.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
Decoder2
 2Z
VC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Decoder/Decoder.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
Decoder2
 2
02
12Z
VC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Decoder/Decoder.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

Decomposer2
 2`
\C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Decomposer/Decomposer.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
coeff_decomposer2
 2f
bC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Decomposer/coeff_decomposer.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
decomp_map12
 2a
]C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Decomposer/decomp_map1.v2
38@Z8-6157h px� 
�
-case statement is not full and has no default155*oasys2a
]C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Decomposer/decomp_map1.v2
608@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
decomp_map12
 2
02
12a
]C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Decomposer/decomp_map1.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
coeff_decomposer2
 2
02
12f
bC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Decomposer/coeff_decomposer.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

Decomposer2
 2
02
12`
\C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Decomposer/Decomposer.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

makehint2
 2X
TC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Hint/makehint.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

makehint2
 2
02
12X
TC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Hint/makehint.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
usehint2
 2W
SC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Hint/usehint.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
usehint2
 2
02
12W
SC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Hint/usehint.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	Data_Path2
 2
02
12b
^C:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/Data_Path.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MLDSA2
 2
02
12^
ZC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/imports/MLDSA/MLDSA.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MLDSA_AXI_Top2
 2
02
12\
XC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/AXI/MLDSA_AXI_Top.v2
18@Z8-6155h px� 
m
9Port %s in module %s is either unconnected or has no load4866*oasys2	
o_ready2
PWMZ8-7129h px� 
m
9Port %s in module %s is either unconnected or has no load4866*oasys2	
o_ready2
NTTZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
clk2

ExpandMASKZ8-7129h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2
reset2

ExpandMASKZ8-7129h px� 
m
9Port %s in module %s is either unconnected or has no load4866*oasys2
clk2	
ExpandAZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2
reset2	
ExpandAZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
sampler_in[47]2	
ExpandAZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
sampler_in[23]2	
ExpandAZ8-7129h px� 
m
9Port %s in module %s is either unconnected or has no load4866*oasys2
clk2	
ExpandSZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2
reset2	
ExpandSZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[62]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[61]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[60]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[59]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[58]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[57]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[56]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[55]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[54]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[53]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[52]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[51]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[50]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[49]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[48]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[47]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[46]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[45]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[44]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[43]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[42]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[41]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[40]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[39]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[38]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[37]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[36]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[35]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[34]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[33]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[32]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[30]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[29]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[28]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[27]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[26]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[25]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[24]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[23]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[22]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[21]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[20]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[19]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[18]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[17]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[16]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[14]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[13]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[12]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[11]2	
round_BZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[10]2	
round_BZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[9]2	
round_BZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[8]2	
round_BZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[6]2	
round_BZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[5]2	
round_BZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[4]2	
round_BZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2
round_const[2]2	
round_BZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
in[63]2	
padder1Z8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
in[62]2	
padder1Z8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
in[61]2	
padder1Z8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
in[60]2	
padder1Z8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
in[59]2	
padder1Z8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
in[58]2	
padder1Z8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
in[57]2	
padder1Z8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
in[56]2	
padder1Z8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[63]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[62]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[61]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[60]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[59]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[58]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[57]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[56]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[55]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[54]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[53]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[52]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[51]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[50]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[49]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[48]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[47]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[46]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[45]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[44]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[43]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[42]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[41]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[40]2
Keccak_CtrlZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

sha_in[39]2
Keccak_CtrlZ8-7129h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-71292
100Z17-14h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:09 ; elapsed = 00:00:09 . Memory (MB): peak = 1578.410 ; gain = 689.652
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:09 . Memory (MB): peak = 1578.410 ; gain = 689.652
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:09 . Memory (MB): peak = 1578.410 ; gain = 689.652
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:012
00:00:00.6832

1578.4102
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_64x16_3/Ture_Dual_Port_RAM_64x16/Ture_Dual_Port_RAM_64x16_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_L	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_64x16_3/Ture_Dual_Port_RAM_64x16/Ture_Dual_Port_RAM_64x16_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_L	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_64x16_3/Ture_Dual_Port_RAM_64x16/Ture_Dual_Port_RAM_64x16_in_context.xdc2'
#MLDSA_/data_path_inst/DM_/temp_seed	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_64x16_3/Ture_Dual_Port_RAM_64x16/Ture_Dual_Port_RAM_64x16_in_context.xdc2'
#MLDSA_/data_path_inst/DM_/temp_seed	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2&
"MLDSA_/data_path_inst/DM_/temp_PWM	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2&
"MLDSA_/data_path_inst/DM_/temp_PWM	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_0	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_0	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_1	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_1	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_2	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_2	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_3	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_3	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_4	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_4	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_5	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_5	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_6	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_6	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_7	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_7	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_8	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_8	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_9	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_9	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x4096_3/Ture_Dual_Port_RAM_23x4096/Ture_Dual_Port_RAM_23x4096_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_A	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x4096_3/Ture_Dual_Port_RAM_23x4096/Ture_Dual_Port_RAM_23x4096_in_context.xdc2$
 MLDSA_/data_path_inst/DM_/temp_A	8Z20-847h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0052

1734.7072
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.1052

1734.7072
0.000Z17-268h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:22 ; elapsed = 00:00:22 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7k70tfbv676-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:22 ; elapsed = 00:00:22 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:22 ; elapsed = 00:00:22 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
7
%s
*synth2
Start Preparing Guide Design
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
got a mismatch Controller
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Doing Graph Differ : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
,IncrSynth : %sReverting to default synthesis4534*oasys29
7Over 50% of partitions are impacted by design changes. Z8-6702h px� 
R
,IncrSynth : %sReverting to default synthesis4534*oasys2
 Z8-6702h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Preparing Guide Design : Time (s): cpu = 00:00:24 ; elapsed = 00:00:24 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
x
3inferred FSM for state register '%s' in module '%s'802*oasys2
curr_state_reg2
AXI4_Lite_SlaveZ8-802h px� 
z
3inferred FSM for state register '%s' in module '%s'802*oasys2
curr_state_KeyGen_reg2

ControllerZ8-802h px� 
{
3inferred FSM for state register '%s' in module '%s'802*oasys2
curr_state_SignGen_reg2

ControllerZ8-802h px� 
{
3inferred FSM for state register '%s' in module '%s'802*oasys2
curr_state_SignVer_reg2

ControllerZ8-802h px� 
p
3inferred FSM for state register '%s' in module '%s'802*oasys2
curr_state_reg2	
usehintZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    IDLE |                           000001 |                              000
h p
x
� 
y
%s
*synth2a
_             MODE_CHOOSE |                           000010 |                              001
h p
x
� 
y
%s
*synth2a
_          WRESP__CHANNEL |                           000100 |                              010
h p
x
� 
y
%s
*synth2a
_             START_MLDSA |                           001000 |                              011
h p
x
� 
y
%s
*synth2a
_              WORK_MLDSA |                           010000 |                              100
h p
x
� 
y
%s
*synth2a
_              OVER_MLDSA |                           100000 |                              101
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
curr_state_reg2	
one-hot2
AXI4_Lite_SlaveZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    IDLE |         000000000000000000000001 |                           000000
h p
x
� 
y
%s
*synth2a
_                 STAGE_1 |         000000000000000000000010 |                           000001
h p
x
� 
y
%s
*synth2a
_                 STAGE_2 |         000000000000000000000100 |                           000010
h p
x
� 
y
%s
*synth2a
_                 STAGE_3 |         000000000000000000001000 |                           000011
h p
x
� 
y
%s
*synth2a
_                 STAGE_4 |         000000000000000000010000 |                           000100
h p
x
� 
y
%s
*synth2a
_                 STAGE_5 |         000000000000000000100000 |                           000101
h p
x
� 
y
%s
*synth2a
_                 STAGE_6 |         000000000000000001000000 |                           000110
h p
x
� 
y
%s
*synth2a
_                 STAGE_7 |         000000000000000010000000 |                           000111
h p
x
� 
y
%s
*synth2a
_                 STAGE_8 |         000000000000000100000000 |                           001000
h p
x
� 
y
%s
*synth2a
_                 STAGE_9 |         000000000000001000000000 |                           001001
h p
x
� 
y
%s
*synth2a
_                STAGE_10 |         000000000000010000000000 |                           001010
h p
x
� 
y
%s
*synth2a
_                STAGE_11 |         000000000000100000000000 |                           001011
h p
x
� 
y
%s
*synth2a
_                STAGE_12 |         000000000001000000000000 |                           001100
h p
x
� 
y
%s
*synth2a
_                STAGE_13 |         000000000010000000000000 |                           001101
h p
x
� 
y
%s
*synth2a
_                STAGE_14 |         000000000100000000000000 |                           001110
h p
x
� 
y
%s
*synth2a
_                STAGE_15 |         000000001000000000000000 |                           001111
h p
x
� 
y
%s
*synth2a
_                STAGE_16 |         000000010000000000000000 |                           010000
h p
x
� 
y
%s
*synth2a
_                STAGE_17 |         000000100000000000000000 |                           010001
h p
x
� 
y
%s
*synth2a
_                STAGE_18 |         000001000000000000000000 |                           010010
h p
x
� 
y
%s
*synth2a
_                STAGE_19 |         000010000000000000000000 |                           010011
h p
x
� 
y
%s
*synth2a
_                STAGE_20 |         000100000000000000000000 |                           010100
h p
x
� 
y
%s
*synth2a
_                STAGE_21 |         001000000000000000000000 |                           010101
h p
x
� 
y
%s
*synth2a
_                STAGE_22 |         010000000000000000000000 |                           010110
h p
x
� 
y
%s
*synth2a
_                STAGE_23 |         100000000000000000000000 |                           010111
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
curr_state_SignGen_reg2	
one-hot2

ControllerZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    IDLE |                      00000000001 |                           000000
h p
x
� 
y
%s
*synth2a
_                 STAGE_1 |                      00000000010 |                           000001
h p
x
� 
y
%s
*synth2a
_                 STAGE_2 |                      00000000100 |                           000010
h p
x
� 
y
%s
*synth2a
_                 STAGE_3 |                      00000001000 |                           000011
h p
x
� 
y
%s
*synth2a
_                 STAGE_4 |                      00000010000 |                           000100
h p
x
� 
y
%s
*synth2a
_                 STAGE_5 |                      00000100000 |                           000101
h p
x
� 
y
%s
*synth2a
_                 STAGE_6 |                      00001000000 |                           000110
h p
x
� 
y
%s
*synth2a
_                 STAGE_7 |                      00010000000 |                           000111
h p
x
� 
y
%s
*synth2a
_                 STAGE_8 |                      00100000000 |                           001000
h p
x
� 
y
%s
*synth2a
_                 STAGE_9 |                      01000000000 |                           001001
h p
x
� 
y
%s
*synth2a
_                STAGE_10 |                      10000000000 |                           001010
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
curr_state_KeyGen_reg2	
one-hot2

ControllerZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    IDLE |                     000000000001 |                           000000
h p
x
� 
y
%s
*synth2a
_                 STAGE_1 |                     000000000010 |                           000001
h p
x
� 
y
%s
*synth2a
_                 STAGE_2 |                     000000000100 |                           000010
h p
x
� 
y
%s
*synth2a
_                 STAGE_3 |                     000000001000 |                           000011
h p
x
� 
y
%s
*synth2a
_                 STAGE_4 |                     000000010000 |                           000100
h p
x
� 
y
%s
*synth2a
_                 STAGE_5 |                     000000100000 |                           000101
h p
x
� 
y
%s
*synth2a
_                 STAGE_6 |                     000001000000 |                           000110
h p
x
� 
y
%s
*synth2a
_                 STAGE_7 |                     000010000000 |                           000111
h p
x
� 
y
%s
*synth2a
_                 STAGE_8 |                     000100000000 |                           001000
h p
x
� 
y
%s
*synth2a
_                 STAGE_9 |                     001000000000 |                           001001
h p
x
� 
y
%s
*synth2a
_                STAGE_10 |                     010000000000 |                           001010
h p
x
� 
y
%s
*synth2a
_                STAGE_11 |                     100000000000 |                           001011
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
curr_state_SignVer_reg2	
one-hot2

ControllerZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
C
%s
*synth2+
)

Incremental Synthesis Report Summary:

h p
x
� 
<
%s
*synth2$
"1. Incremental synthesis run: no

h p
x
� 
a
%s
*synth2I
G   Reason for not running incremental synthesis : Change is too high


h p
x
� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}4868*oasysZ8-7130h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   6 Input   56 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   56 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   3 Input   56 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input   35 Bit       Adders := 12    
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input   27 Bit       Adders := 12    
h p
x
� 
F
%s
*synth2.
,	   3 Input   27 Bit       Adders := 12    
h p
x
� 
F
%s
*synth2.
,	   2 Input   24 Bit       Adders := 34    
h p
x
� 
F
%s
*synth2.
,	   3 Input   23 Bit       Adders := 12    
h p
x
� 
F
%s
*synth2.
,	   2 Input   23 Bit       Adders := 38    
h p
x
� 
F
%s
*synth2.
,	   2 Input   17 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   12 Bit       Adders := 5     
h p
x
� 
F
%s
*synth2.
,	   2 Input   11 Bit       Adders := 5     
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit       Adders := 4     
h p
x
� 
F
%s
*synth2.
,	   4 Input    9 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    9 Bit       Adders := 5     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit       Adders := 15    
h p
x
� 
F
%s
*synth2.
,	   3 Input    8 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 7     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit       Adders := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit       Adders := 4     
h p
x
� 
F
%s
*synth2.
,	   3 Input    2 Bit       Adders := 14    
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit       Adders := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input   1344 Bit         XORs := 1     
h p
x
� 
H
%s
*synth20
.	   5 Input     64 Bit         XORs := 5     
h p
x
� 
H
%s
*synth20
.	   3 Input     64 Bit         XORs := 25    
h p
x
� 
H
%s
*synth20
.	   2 Input     64 Bit         XORs := 25    
h p
x
� 
H
%s
*synth20
.	   2 Input      1 Bit         XORs := 7     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	             1600 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	             1344 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	              672 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	              256 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	              200 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	              192 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               64 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               56 Bit    Registers := 6     
h p
x
� 
H
%s
*synth20
.	               48 Bit    Registers := 20    
h p
x
� 
H
%s
*synth20
.	               46 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	               27 Bit    Registers := 12    
h p
x
� 
H
%s
*synth20
.	               23 Bit    Registers := 357   
h p
x
� 
H
%s
*synth20
.	               21 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               12 Bit    Registers := 12    
h p
x
� 
H
%s
*synth20
.	               11 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	               10 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	                9 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 102   
h p
x
� 
H
%s
*synth20
.	                7 Bit    Registers := 9     
h p
x
� 
H
%s
*synth20
.	                6 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                5 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 13    
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 10    
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 429   
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input 2048 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input 1600 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	   2 Input 1344 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   4 Input 1344 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input 1344 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input 1080 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input  672 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input  256 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input  200 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input  192 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input  128 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   3 Input   64 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   64 Bit        Muxes := 13    
h p
x
� 
F
%s
*synth2.
,	   6 Input   64 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input   64 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	  17 Input   64 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   5 Input   64 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  11 Input   64 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   5 Input   46 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   46 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	  24 Input   24 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   24 Bit        Muxes := 37    
h p
x
� 
F
%s
*synth2.
,	   2 Input   23 Bit        Muxes := 212   
h p
x
� 
F
%s
*synth2.
,	   4 Input   23 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   8 Input   23 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   7 Input   23 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	   6 Input   23 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	   9 Input   23 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   5 Input   23 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   3 Input   23 Bit        Muxes := 10    
h p
x
� 
F
%s
*synth2.
,	   2 Input   22 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   18 Bit        Muxes := 6     
h p
x
� 
F
%s
*synth2.
,	  12 Input   12 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   12 Bit        Muxes := 13    
h p
x
� 
F
%s
*synth2.
,	   3 Input   12 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  11 Input   11 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   11 Bit        Muxes := 18    
h p
x
� 
F
%s
*synth2.
,	   8 Input   11 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  19 Input   11 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input   11 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   5 Input   11 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit        Muxes := 27    
h p
x
� 
F
%s
*synth2.
,	   4 Input   10 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	  12 Input   10 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	  13 Input   10 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  10 Input   10 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  11 Input   10 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   7 Input   10 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   3 Input   10 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input    9 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   5 Input    9 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 93    
h p
x
� 
F
%s
*synth2.
,	   4 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  12 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  24 Input    6 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  11 Input    6 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  12 Input    6 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    6 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit        Muxes := 6     
h p
x
� 
F
%s
*synth2.
,	  46 Input    6 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   6 Input    6 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   3 Input    5 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  24 Input    5 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    5 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   6 Input    5 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 16    
h p
x
� 
F
%s
*synth2.
,	  11 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  12 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  18 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  19 Input    4 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	  23 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   5 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  24 Input    4 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	  20 Input    4 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 13    
h p
x
� 
F
%s
*synth2.
,	  29 Input    3 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   8 Input    3 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  11 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  16 Input    3 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  17 Input    3 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	  13 Input    3 Bit        Muxes := 6     
h p
x
� 
F
%s
*synth2.
,	  23 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  20 Input    3 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  19 Input    3 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  10 Input    3 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   6 Input    3 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    3 Bit        Muxes := 6     
h p
x
� 
F
%s
*synth2.
,	   7 Input    3 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 23    
h p
x
� 
F
%s
*synth2.
,	   3 Input    2 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	  13 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   9 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  23 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  11 Input    2 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	  28 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  16 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   7 Input    2 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	  10 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  15 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  18 Input    1 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 497   
h p
x
� 
F
%s
*synth2.
,	   5 Input    1 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   3 Input    1 Bit        Muxes := 11    
h p
x
� 
F
%s
*synth2.
,	  10 Input    1 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   9 Input    1 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	   7 Input    1 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	  17 Input    1 Bit        Muxes := 10    
h p
x
� 
F
%s
*synth2.
,	   6 Input    1 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  23 Input    1 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  13 Input    1 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	  19 Input    1 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	  11 Input    1 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	  24 Input    1 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  20 Input    1 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	2048 Input    1 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   8 Input    1 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	  14 Input    1 Bit        Muxes := 1     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
\
%s
*synth2D
BDSP Report: Generating DSP mm/a_mul_b0, operation Mode is: A2*B2.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
j
%s
*synth2R
PDSP Report: Generating DSP mm/a_mul_b_reg, operation Mode is: (PCIN>>17)+A2*B2.
h p
x
� 
a
%s
*synth2I
GDSP Report: register mul_in_0_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
\
%s
*synth2D
BDSP Report: Generating DSP mm/a_mul_b0, operation Mode is: A2*B2.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
j
%s
*synth2R
PDSP Report: Generating DSP mm/a_mul_b_reg, operation Mode is: (PCIN>>17)+A2*B2.
h p
x
� 
a
%s
*synth2I
GDSP Report: register mul_in_0_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
\
%s
*synth2D
BDSP Report: Generating DSP mm/a_mul_b0, operation Mode is: A2*B2.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
j
%s
*synth2R
PDSP Report: Generating DSP mm/a_mul_b_reg, operation Mode is: (PCIN>>17)+A2*B2.
h p
x
� 
a
%s
*synth2I
GDSP Report: register mul_in_0_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
\
%s
*synth2D
BDSP Report: Generating DSP mm/a_mul_b0, operation Mode is: A2*B2.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
j
%s
*synth2R
PDSP Report: Generating DSP mm/a_mul_b_reg, operation Mode is: (PCIN>>17)+A2*B2.
h p
x
� 
a
%s
*synth2I
GDSP Report: register mul_in_0_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
\
%s
*synth2D
BDSP Report: Generating DSP mm/a_mul_b0, operation Mode is: A2*B2.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
j
%s
*synth2R
PDSP Report: Generating DSP mm/a_mul_b_reg, operation Mode is: (PCIN>>17)+A2*B2.
h p
x
� 
a
%s
*synth2I
GDSP Report: register mul_in_0_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
\
%s
*synth2D
BDSP Report: Generating DSP mm/a_mul_b0, operation Mode is: A2*B2.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
j
%s
*synth2R
PDSP Report: Generating DSP mm/a_mul_b_reg, operation Mode is: (PCIN>>17)+A2*B2.
h p
x
� 
a
%s
*synth2I
GDSP Report: register mul_in_0_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
\
%s
*synth2D
BDSP Report: Generating DSP mm/a_mul_b0, operation Mode is: A2*B2.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
j
%s
*synth2R
PDSP Report: Generating DSP mm/a_mul_b_reg, operation Mode is: (PCIN>>17)+A2*B2.
h p
x
� 
a
%s
*synth2I
GDSP Report: register mul_in_0_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
\
%s
*synth2D
BDSP Report: Generating DSP mm/a_mul_b0, operation Mode is: A2*B2.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: register mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b0.
h p
x
� 
j
%s
*synth2R
PDSP Report: Generating DSP mm/a_mul_b_reg, operation Mode is: (PCIN>>17)+A2*B2.
h p
x
� 
a
%s
*synth2I
GDSP Report: register mul_in_0_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
c
%s
*synth2K
IDSP Report: register mm/a_mul_b_reg is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
`
%s
*synth2H
FDSP Report: operator mm/a_mul_b0 is absorbed into DSP mm/a_mul_b_reg.
h p
x
� 
�
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
zeta_22
22
5Z8-5544h px� 
�
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
zeta_32
32
5Z8-5544h px� 
�
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
zeta_42
42
5Z8-5544h px� 
e
%s
*synth2M
KDSP Report: Generating DSP inv_rot_o_u, operation Mode is: (A:0x7f6021)*B.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator inv_rot_o_u is absorbed into DSP inv_rot_o_u.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator inv_rot_o_u is absorbed into DSP inv_rot_o_u.
h p
x
� 
p
%s
*synth2X
VDSP Report: Generating DSP inv_rot_o_u, operation Mode is: (PCIN>>17)+(A:0x7f6021)*B.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator inv_rot_o_u is absorbed into DSP inv_rot_o_u.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator inv_rot_o_u is absorbed into DSP inv_rot_o_u.
h p
x
� 
e
%s
*synth2M
KDSP Report: Generating DSP inv_rot_o_d, operation Mode is: (A:0x7f6021)*B.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator inv_rot_o_d is absorbed into DSP inv_rot_o_d.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator inv_rot_o_d is absorbed into DSP inv_rot_o_d.
h p
x
� 
p
%s
*synth2X
VDSP Report: Generating DSP inv_rot_o_d, operation Mode is: (PCIN>>17)+(A:0x7f6021)*B.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator inv_rot_o_d is absorbed into DSP inv_rot_o_d.
h p
x
� 
]
%s
*synth2E
CDSP Report: operator inv_rot_o_d is absorbed into DSP inv_rot_o_d.
h p
x
� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2&
$NTT_/BU_2/mm/MR/adder_2_temp_reg[26]2
FDR2&
$NTT_/BU_2/mm/MR/adder_2_temp_reg[25]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2&
$NTT_/BU_3/mm/MR/adder_2_temp_reg[26]2
FDR2&
$NTT_/BU_3/mm/MR/adder_2_temp_reg[25]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2&
$NTT_/BU_1/mm/MR/adder_2_temp_reg[26]2
FDR2&
$NTT_/BU_1/mm/MR/adder_2_temp_reg[25]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2&
$NTT_/BU_4/mm/MR/adder_2_temp_reg[26]2
FDR2&
$NTT_/BU_4/mm/MR/adder_2_temp_reg[25]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2&
$NTT_/BU_0/mm/MR/adder_2_temp_reg[26]2
FDR2&
$NTT_/BU_0/mm/MR/adder_2_temp_reg[25]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2&
$NTT_/BU_5/mm/MR/adder_2_temp_reg[26]2
FDR2&
$NTT_/BU_5/mm/MR/adder_2_temp_reg[25]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2
NTT_/MR2/adder_2_temp_reg[26]2
FDR2
NTT_/MR2/adder_2_temp_reg[25]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2&
$NTT_/BU_6/mm/MR/adder_2_temp_reg[26]2
FDR2&
$NTT_/BU_6/mm/MR/adder_2_temp_reg[25]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2
NTT_/MR1/adder_2_temp_reg[26]2
FDR2
NTT_/MR1/adder_2_temp_reg[25]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2&
$NTT_/BU_7/mm/MR/adder_2_temp_reg[26]2
FDR2&
$NTT_/BU_7/mm/MR/adder_2_temp_reg[25]Z8-3886h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[47]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[46]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[45]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[44]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[43]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[42]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[41]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[40]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[39]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[38]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[37]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[36]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[35]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[34]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[33]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[32]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[31]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[30]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[29]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[28]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[27]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[26]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[25]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[24]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[23]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[22]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[21]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[20]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[19]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[18]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[17]2
BU__1Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[47]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[46]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[45]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[44]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[43]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[42]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[41]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[40]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[39]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[38]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[37]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[36]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[35]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[34]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[33]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[32]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[31]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[30]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[29]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[28]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[27]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[26]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[25]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[24]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[23]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[22]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[21]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[20]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[19]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[18]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[17]2
BU__2Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[47]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[46]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[45]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[44]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[43]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[42]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[41]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[40]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[39]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[38]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[37]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[36]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[35]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[34]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[33]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[32]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[31]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[30]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[29]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[28]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[27]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[26]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[25]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[24]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[23]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[22]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[21]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[20]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[19]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[18]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[17]2
BU__3Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[47]2
BU__4Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[46]2
BU__4Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[45]2
BU__4Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[44]2
BU__4Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[43]2
BU__4Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[42]2
BU__4Z8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
mm/a_mul_b_reg[41]2
BU__4Z8-3332h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-33322
100Z17-14h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-33322
100Z17-14h px� 
U
%s
*synth2=
;DSP Report: Generating DSP mul_a0, operation Mode is: A*B.
h p
x
� 
S
%s
*synth2;
9DSP Report: operator mul_a0 is absorbed into DSP mul_a0.
h p
x
� 
S
%s
*synth2;
9DSP Report: operator mul_a0 is absorbed into DSP mul_a0.
h p
x
� 
`
%s
*synth2H
FDSP Report: Generating DSP mul_a0, operation Mode is: (PCIN>>17)+A*B.
h p
x
� 
S
%s
*synth2;
9DSP Report: operator mul_a0 is absorbed into DSP mul_a0.
h p
x
� 
S
%s
*synth2;
9DSP Report: operator mul_a0 is absorbed into DSP mul_a0.
h p
x
� 
U
%s
*synth2=
;DSP Report: Generating DSP mul_b0, operation Mode is: A*B.
h p
x
� 
S
%s
*synth2;
9DSP Report: operator mul_b0 is absorbed into DSP mul_b0.
h p
x
� 
S
%s
*synth2;
9DSP Report: operator mul_b0 is absorbed into DSP mul_b0.
h p
x
� 
`
%s
*synth2H
FDSP Report: Generating DSP mul_b0, operation Mode is: (PCIN>>17)+A*B.
h p
x
� 
S
%s
*synth2;
9DSP Report: operator mul_b0 is absorbed into DSP mul_b0.
h p
x
� 
S
%s
*synth2;
9DSP Report: operator mul_b0 is absorbed into DSP mul_b0.
h p
x
� 
l
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
AG_3_last_addrZ8-5546h px� 
i
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
NTT_o_readyZ8-5546h px� 
f
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2

PWM_modeZ8-5546h px� 
i
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
PWM_o_readyZ8-5546h px� 
l
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
AG_1_last_addrZ8-5546h px� 
l
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
AG_1_star_addrZ8-5546h px� 
l
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
AG_2_last_addrZ8-5546h px� 
l
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
AG_3_star_addrZ8-5546h px� 
m
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
AG_4_addr_adderZ8-5546h px� 
�
TROM size for "%s" is below threshold of ROM address width. It will be mapped to LUTs4039*oasys2
AG_4_last_addrZ8-5587h px� 
l
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
AG_4_star_addrZ8-5546h px� 
l
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
AG_3_last_addrZ8-5546h px� 
i
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
NTT_o_readyZ8-5546h px� 
f
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2

PWM_modeZ8-5546h px� 
i
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
PWM_o_readyZ8-5546h px� 
l
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
AG_1_last_addrZ8-5546h px� 
l
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
AG_1_star_addrZ8-5546h px� 
l
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
AG_2_last_addrZ8-5546h px� 
l
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
AG_3_star_addrZ8-5546h px� 
m
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
AG_4_addr_adderZ8-5546h px� 
�
TROM size for "%s" is below threshold of ROM address width. It will be mapped to LUTs4039*oasys2
AG_4_last_addrZ8-5587h px� 
l
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
AG_4_star_addrZ8-5546h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[55]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[54]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[53]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[52]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[51]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[50]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[49]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[48]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[47]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[46]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[45]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[44]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[43]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[42]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[41]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[40]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[39]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[38]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[37]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[36]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[35]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[34]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[33]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[32]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[31]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[30]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[29]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[28]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[27]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[26]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[25]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[24]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_0_reg[23]2
FDE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[23]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[55]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[54]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[54]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[53]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[53]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[52]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[52]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[51]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[51]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[50]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[50]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[49]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[49]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[48]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[48]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[47]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[47]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[46]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[46]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[45]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[45]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[44]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[44]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[43]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[43]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[42]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[42]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[41]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[41]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[40]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[40]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[39]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[39]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[38]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[38]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[37]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[37]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[36]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[36]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[35]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[35]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[34]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[34]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[33]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[33]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[32]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[32]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[31]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[31]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[30]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[30]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[29]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[29]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[28]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[28]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[27]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[27]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[26]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[26]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[25]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[25]2
FDRE2.
,Decomp_/genblk1[1].COEFF_DECOMP/a0_0_reg[24]Z8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
020
.Decomp_/\genblk1[1].COEFF_DECOMP/a0_0_reg[24] Z8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
020
.Decomp_/\genblk1[1].COEFF_DECOMP/a0_0_reg[23] Z8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2
PWM_/MR1/adder_2_temp_reg[26]2
FDR2
PWM_/MR1/adder_2_temp_reg[25]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2
PWM_/MR0/adder_2_temp_reg[26]2
FDR2
PWM_/MR0/adder_2_temp_reg[25]Z8-3886h px� 
t
6propagating constant %s across sequential element (%s)3333*oasys2
02
i_12/\kappa_reg[0] Z8-3333h px� 
t
6propagating constant %s across sequential element (%s)3333*oasys2
02
i_12/\kappa_reg[1] Z8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[55]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[54]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[54]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[53]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[53]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[52]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[52]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[25]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[25]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[26]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[26]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[27]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[27]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[28]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[28]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[29]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[29]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[30]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[30]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[31]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[31]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[32]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[32]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[33]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[33]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[34]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[34]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[35]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[35]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[36]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[36]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[37]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[37]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[38]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[38]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[39]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[39]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[40]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[40]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[41]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[41]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[42]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[42]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[43]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[43]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[44]Z8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[44]2
FDE2.
,Decomp_/genblk1[0].COEFF_DECOMP/a0_1_reg[45]Z8-3886h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-38862
100Z17-14h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-38862
100Z17-14h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-33322
100Z17-14h px� 
�
merging register '%s' into '%s'3619*oasys2
pos_reg[9:0]2
pos_reg[9:0]2W
SC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Hint/usehint.v2
1568@Z8-4471h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1694] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1693] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1696] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1695] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1690] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1689] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1692] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1691] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1686] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1685] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1688] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1687] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1682] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1681] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1684] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1683] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1674] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1673] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1676] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1675] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1678] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1677] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1680] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1679] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1670] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1669] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1672] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1671] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1668] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1667] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1666] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1665] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1706] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1705] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1708] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1707] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1712] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1711] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1710] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1709] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1702] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1701] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1704] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1703] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1698] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1697] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1700] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1699] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1720] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1719] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1718] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1717] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1714] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1713] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1716] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1715] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1728] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1727] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1726] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1725] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1724] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1723] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1722] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1721] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1758] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1757] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1760] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1759] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1754] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1753] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1756] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1755] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1752] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1751] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1750] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1749] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1746] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1745] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1748] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1747] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1738] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1737] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1740] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1739] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1742] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1741] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1744] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1743] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1734] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1733] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1736] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1735] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1732] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1731] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1730] Z8-3333h px� 

6propagating constant %s across sequential element (%s)3333*oasys2
02 
usehint_/\hint_poly_reg[1729] Z8-3333h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-33332
100Z17-14h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-33332
100Z17-14h px� 
�
merging register '%s' into '%s'3619*oasys2
ctr_reg[7:0]2
ctr_reg[7:0]2X
TC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Hint/makehint.v2
878@Z8-4471h px� 
�
merging register '%s' into '%s'3619*oasys2
ctr_reg[7:0]2
ctr_reg[7:0]2X
TC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Hint/makehint.v2
878@Z8-4471h px� 
�
merging register '%s' into '%s'3619*oasys2
sipo_in_len_reg[8:0]2
sipo_in_len_reg[8:0]2Z
VC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/Decoder/Decoder.v2
1668@Z8-4471h px� 
�
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2

DECODE_LVL2
32
5Z8-5544h px� 
�
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2

DECODE_LVL2
32
5Z8-5544h px� 
�
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2

ENCODE_LVL2
32
5Z8-5544h px� 
�
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2

ENCODE_LVL2
32
5Z8-5544h px� 
f
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2

DEC_modeZ8-5546h px� 
m
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
ENC_encode_modeZ8-5546h px� 
f
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2

DEC_modeZ8-5546h px� 
m
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
ENC_encode_modeZ8-5546h px� 
�
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
padder_cnt_last2
42
5Z8-5544h px� 
�
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
padder_cnt_last2
42
5Z8-5544h px� 
�
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
kk_sub_2_in2
22
5Z8-5544h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:01:09 ; elapsed = 00:01:37 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_0 : 0 0 : 3382 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_0 : 0 1 : 1194 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_3 : 0 0 : 3382 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_3 : 0 1 : 1194 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_4 : 0 0 : 3382 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_4 : 0 1 : 1194 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_5 : 0 0 : 3382 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_5 : 0 1 : 1194 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_6 : 0 0 : 3382 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_6 : 0 1 : 1194 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_7 : 0 0 : 3382 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_7 : 0 1 : 1194 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_8 : 0 0 : 3382 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_8 : 0 1 : 1194 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_9 : 0 0 : 3382 4576 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 mm/a_mul_b0_9 : 0 1 : 1194 4576 : Used 1 time 0
h p
x
� 
b
%s
*synth2J
H Sort Area is Data_Path__GB1 mul_a0_0 : 0 0 : 3340 4455 : Used 1 time 0
h p
x
� 
b
%s
*synth2J
H Sort Area is Data_Path__GB1 mul_a0_0 : 0 1 : 1115 4455 : Used 1 time 0
h p
x
� 
b
%s
*synth2J
H Sort Area is Data_Path__GB1 mul_b0_3 : 0 0 : 3340 4455 : Used 1 time 0
h p
x
� 
b
%s
*synth2J
H Sort Area is Data_Path__GB1 mul_b0_3 : 0 1 : 1115 4455 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 inv_rot_o_d_d : 0 0 : 2016 2482 : Used 1 time 0
h p
x
� 
f
%s
*synth2N
L Sort Area is Data_Path__GB0 inv_rot_o_d_d : 0 1 : 466 2482 : Used 1 time 0
h p
x
� 
g
%s
*synth2O
M Sort Area is Data_Path__GB0 inv_rot_o_u_a : 0 0 : 2016 2482 : Used 1 time 0
h p
x
� 
f
%s
*synth2N
L Sort Area is Data_Path__GB0 inv_rot_o_u_a : 0 1 : 466 2482 : Used 1 time 0
h p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
;
%s*synth2#
!
ROM: Preliminary Mapping Report
h px� 
W
%s*synth2?
=+------------+------------+---------------+----------------+
h px� 
X
%s*synth2@
>|Module Name | RTL Object | Depth x Width | Implemented As | 
h px� 
W
%s*synth2?
=+------------+------------+---------------+----------------+
h px� 
X
%s*synth2@
>|NTT         | zeta_7     | 128x23        | LUT            | 
h px� 
X
%s*synth2@
>|NTT         | zeta_6     | 64x23         | LUT            | 
h px� 
X
%s*synth2@
>|NTT         | zeta_5     | 32x23         | LUT            | 
h px� 
X
%s*synth2@
>+------------+------------+---------------+----------------+

h px� 
v
%s*synth2^
\
DSP: Preliminary Mapping Report (see note below. The ' indicates corresponding REG is set)
h px� 
�
%s*synth2�
�+------------+---------------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h px� 
�
%s*synth2�
�|Module Name | DSP Mapping               | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
h px� 
�
%s*synth2�
�+------------+---------------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h px� 
�
%s*synth2�
�|BU          | A2*B2                     | 24     | 18     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|BU          | (PCIN>>17)+A2*B2          | 24     | 7      | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 1    | 
h px� 
�
%s*synth2�
�|BU          | A2*B2                     | 24     | 18     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|BU          | (PCIN>>17)+A2*B2          | 24     | 7      | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 1    | 
h px� 
�
%s*synth2�
�|BU          | A2*B2                     | 24     | 18     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|BU          | (PCIN>>17)+A2*B2          | 24     | 7      | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 1    | 
h px� 
�
%s*synth2�
�|BU          | A2*B2                     | 24     | 18     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|BU          | (PCIN>>17)+A2*B2          | 24     | 7      | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 1    | 
h px� 
�
%s*synth2�
�|BU          | A2*B2                     | 24     | 18     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|BU          | (PCIN>>17)+A2*B2          | 24     | 7      | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 1    | 
h px� 
�
%s*synth2�
�|BU          | A2*B2                     | 24     | 18     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|BU          | (PCIN>>17)+A2*B2          | 24     | 7      | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 1    | 
h px� 
�
%s*synth2�
�|BU          | A2*B2                     | 24     | 18     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|BU          | (PCIN>>17)+A2*B2          | 24     | 7      | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 1    | 
h px� 
�
%s*synth2�
�|BU          | A2*B2                     | 24     | 18     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|BU          | (PCIN>>17)+A2*B2          | 24     | 7      | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 1    | 
h px� 
�
%s*synth2�
�|NTT         | (A:0x7f6021)*B            | 24     | 18     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|NTT         | (PCIN>>17)+(A:0x7f6021)*B | 24     | 7      | -      | -      | 29     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|NTT         | (A:0x7f6021)*B            | 24     | 18     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|NTT         | (PCIN>>17)+(A:0x7f6021)*B | 24     | 7      | -      | -      | 29     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|PWM         | A*B                       | 24     | 18     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|PWM         | (PCIN>>17)+A*B            | 24     | 7      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|PWM         | A*B                       | 24     | 18     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|PWM         | (PCIN>>17)+A*B            | 24     | 7      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�+------------+---------------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

h px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the DSPs inferred at the current stage of the synthesis flow. Some DSP may be reimplemented as non DSP primitives later in the synthesis flow. Multiple instantiated DSPs are reported only once.
h px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:01:18 ; elapsed = 00:01:46 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:01:21 ; elapsed = 00:01:49 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
{Detected registers with asynchronous reset at DSP/BRAM block boundary. Consider using synchronous reset for optimal packing4266*oasys2R
NC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/PWM/PWM.v2
658@Z8-5844h px� 
�
{Detected registers with asynchronous reset at DSP/BRAM block boundary. Consider using synchronous reset for optimal packing4266*oasys2R
NC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.srcs/sources_1/PWM/PWM.v2
728@Z8-5844h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:01:30 ; elapsed = 00:02:04 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:01:39 ; elapsed = 00:02:13 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:01:39 ; elapsed = 00:02:13 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:01:41 ; elapsed = 00:02:16 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:01:42 ; elapsed = 00:02:16 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:01:45 ; elapsed = 00:02:19 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:01:45 ; elapsed = 00:02:19 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!

Static Shift Register Report:
h p
x
� 
�
%s
*synth2�
�+--------------+-------------------------------------------------------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+
h p
x
� 
�
%s
*synth2�
�|Module Name   | RTL Name                                                                      | Length | Width | Reset Signal | Pull out first Reg | Pull out last Reg | SRL16E | SRLC32E | 
h p
x
� 
�
%s
*synth2�
�+--------------+-------------------------------------------------------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/Decomp_/genblk1[0].COEFF_DECOMP/dob_reg[5]              | 3      | 12    | NO           | NO                 | YES               | 12     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_0/valid_buf_reg[3]                              | 4      | 1     | YES          | NO                 | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_1/valid_buf_[63].valid_buf_reg[63]              | 64     | 1     | YES          | NO                 | YES               | 0      | 2       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_1/shift_registers_d[63].shift_reg_d_reg[63][22] | 64     | 23    | YES          | NO                 | YES               | 0      | 46      | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_1/shift_registers_u[63].shift_reg_u_reg[63][22] | 64     | 23    | YES          | NO                 | YES               | 0      | 46      | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_1/valid_buf_reg[3]                              | 4      | 1     | YES          | NO                 | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_2/valid_buf_[31].valid_buf_reg[31]              | 32     | 1     | YES          | NO                 | YES               | 0      | 1       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_2/shift_registers_d[31].shift_reg_d_reg[31][22] | 32     | 23    | YES          | NO                 | YES               | 0      | 23      | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_2/shift_registers_u[31].shift_reg_u_reg[31][22] | 32     | 23    | YES          | NO                 | YES               | 0      | 23      | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_2/valid_buf_reg[3]                              | 4      | 1     | YES          | NO                 | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_3/valid_buf_[15].valid_buf_reg[15]              | 16     | 1     | YES          | NO                 | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_3/shift_registers_d[15].shift_reg_d_reg[15][22] | 16     | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_3/shift_registers_u[15].shift_reg_u_reg[15][22] | 16     | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_3/valid_buf_reg[3]                              | 4      | 1     | YES          | NO                 | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_4/valid_buf_[7].valid_buf_reg[7]                | 8      | 1     | YES          | NO                 | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_4/shift_registers_d[7].shift_reg_d_reg[7][22]   | 8      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_4/shift_registers_u[7].shift_reg_u_reg[7][22]   | 8      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_4/valid_buf_reg[3]                              | 4      | 1     | YES          | NO                 | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_5/valid_buf_[3].valid_buf_reg[3]                | 4      | 1     | YES          | NO                 | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_5/shift_registers_d[3].shift_reg_d_reg[3][22]   | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/RU_5/shift_registers_u[3].shift_reg_u_reg[3][22]   | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_5/valid_buf_reg[3]                              | 4      | 1     | YES          | NO                 | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_6/valid_buf_reg[3]                              | 4      | 1     | YES          | NO                 | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_7/valid_buf_reg[3]                              | 4      | 1     | YES          | NO                 | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_0/shift_reg_a_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_0/shift_reg_b_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_1/shift_reg_a_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_1/shift_reg_b_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_2/shift_reg_a_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_2/shift_reg_b_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_3/shift_reg_a_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_3/shift_reg_b_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_4/shift_reg_a_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_4/shift_reg_b_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_5/shift_reg_a_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_5/shift_reg_b_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_6/shift_reg_a_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_6/shift_reg_b_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_7/shift_reg_a_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�|MLDSA_AXI_Top | MLDSA_/data_path_inst/NTT_/BU_7/shift_reg_b_reg[3][22]                        | 4      | 23    | YES          | NO                 | YES               | 23     | 0       | 
h p
x
� 
�
%s
*synth2�
�+--------------+-------------------------------------------------------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+

h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
W
%s
*synth2?
=
DSP Final Report (the ' indicates corresponding REG is set)
h p
x
� 
�
%s
*synth2�
�+------------+------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h p
x
� 
�
%s
*synth2�
�|Module Name | DSP Mapping      | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
h p
x
� 
�
%s
*synth2�
�+------------+------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h p
x
� 
�
%s
*synth2�
�|NTT         | A*B              | 23     | 17     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|NTT         | PCIN>>17+A*B     | 0      | 6      | -      | -      | 29     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|NTT         | A*B              | 23     | 17     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|NTT         | PCIN>>17+A*B     | 0      | 6      | -      | -      | 29     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|BU          | A'*B'            | 23     | 17     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|BU          | (PCIN>>17+A*B')' | 0      | 6      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 1    | 
h p
x
� 
�
%s
*synth2�
�|BU          | A'*B'            | 23     | 17     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|BU          | (PCIN>>17+A*B')' | 0      | 6      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 1    | 
h p
x
� 
�
%s
*synth2�
�|BU          | A'*B'            | 23     | 17     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|BU          | (PCIN>>17+A*B')' | 0      | 6      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 1    | 
h p
x
� 
�
%s
*synth2�
�|BU          | A'*B'            | 23     | 17     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|BU          | (PCIN>>17+A*B')' | 0      | 6      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 1    | 
h p
x
� 
�
%s
*synth2�
�|BU          | A'*B'            | 23     | 17     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|BU          | (PCIN>>17+A*B')' | 0      | 6      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 1    | 
h p
x
� 
�
%s
*synth2�
�|BU          | A'*B'            | 23     | 17     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|BU          | (PCIN>>17+A*B')' | 0      | 6      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 1    | 
h p
x
� 
�
%s
*synth2�
�|BU          | A'*B'            | 23     | 17     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|BU          | (PCIN>>17+A*B')' | 0      | 6      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 1    | 
h p
x
� 
�
%s
*synth2�
�|BU          | A'*B'            | 23     | 17     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|BU          | (PCIN>>17+A*B')' | 0      | 6      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 1    | 
h p
x
� 
�
%s
*synth2�
�|PWM         | A*B              | 23     | 17     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|PWM         | (PCIN>>17+A*B)'  | 23     | 6      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
h p
x
� 
�
%s
*synth2�
�|PWM         | A*B              | 23     | 17     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|PWM         | (PCIN>>17+A*B)'  | 23     | 6      | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
h p
x
� 
�
%s
*synth2�
�+------------+------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
J
%s
*synth22
0+------+---------------------------+----------+
h p
x
� 
J
%s
*synth22
0|      |BlackBox name              |Instances |
h p
x
� 
J
%s
*synth22
0+------+---------------------------+----------+
h p
x
� 
J
%s
*synth22
0|1     |Ture_Dual_Port_RAM_23x4096 |         1|
h p
x
� 
J
%s
*synth22
0|2     |Ture_Dual_Port_RAM_23x1024 |        11|
h p
x
� 
J
%s
*synth22
0|3     |Ture_Dual_Port_RAM_64x16   |         2|
h p
x
� 
J
%s
*synth22
0+------+---------------------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
F
%s*synth2.
,+------+---------------------------+------+
h px� 
F
%s*synth2.
,|      |Cell                       |Count |
h px� 
F
%s*synth2.
,+------+---------------------------+------+
h px� 
F
%s*synth2.
,|1     |Ture_Dual_Port_RAM_23x1024 |    11|
h px� 
F
%s*synth2.
,|12    |Ture_Dual_Port_RAM_23x4096 |     1|
h px� 
F
%s*synth2.
,|13    |Ture_Dual_Port_RAM_64x16   |     2|
h px� 
F
%s*synth2.
,|15    |BUFG                       |     1|
h px� 
F
%s*synth2.
,|16    |CARRY4                     |   869|
h px� 
F
%s*synth2.
,|17    |DSP48E1                    |    24|
h px� 
F
%s*synth2.
,|22    |LUT1                       |   567|
h px� 
F
%s*synth2.
,|23    |LUT2                       |  3291|
h px� 
F
%s*synth2.
,|24    |LUT3                       |  5226|
h px� 
F
%s*synth2.
,|25    |LUT4                       |  5091|
h px� 
F
%s*synth2.
,|26    |LUT5                       |  5396|
h px� 
F
%s*synth2.
,|27    |LUT6                       | 10666|
h px� 
F
%s*synth2.
,|28    |MUXF7                      |  1010|
h px� 
F
%s*synth2.
,|29    |MUXF8                      |   183|
h px� 
F
%s*synth2.
,|30    |SRL16E                     |   529|
h px� 
F
%s*synth2.
,|31    |SRLC32E                    |   141|
h px� 
F
%s*synth2.
,|32    |FDCE                       |  3634|
h px� 
F
%s*synth2.
,|33    |FDPE                       |     4|
h px� 
F
%s*synth2.
,|34    |FDRE                       |  7404|
h px� 
F
%s*synth2.
,|35    |FDSE                       |    12|
h px� 
F
%s*synth2.
,|36    |IBUF                       |   140|
h px� 
F
%s*synth2.
,|37    |OBUF                       |   109|
h px� 
F
%s*synth2.
,+------+---------------------------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:01:45 ; elapsed = 00:02:19 . Memory (MB): peak = 1734.707 ; gain = 845.949
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
b
%s
*synth2J
HSynthesis finished with 0 errors, 0 critical warnings and 274 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:01:28 ; elapsed = 00:02:12 . Memory (MB): peak = 1734.707 ; gain = 689.652
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:01:45 ; elapsed = 00:02:20 . Memory (MB): peak = 1734.707 ; gain = 845.949
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.6402

1734.7072
0.000Z17-268h px� 
V
-Analyzing %s Unisim elements for replacement
17*netlist2
2086Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
1Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0072

1734.7072
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

b10a55dfZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
3972
2062
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:01:552

00:02:322

1734.7072

1235.312Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0702

1734.7072
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2V
TC:/Users/USER/Desktop/ML_DSA_syn_new/IMP4/MLDSA/MLDSA.runs/synth_1/MLDSA_AXI_Top.dcpZ17-1381h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
write_checkpoint: 2

00:00:052

00:00:052

1734.7072
0.000Z17-268h px� 
�
%s4*runtcl2r
pExecuting : report_utilization -file MLDSA_AXI_Top_utilization_synth.rpt -pb MLDSA_AXI_Top_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sun May 18 00:19:14 2025Z17-206h px� 


End Record