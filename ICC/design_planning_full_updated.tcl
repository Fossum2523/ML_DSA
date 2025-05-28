### ------------------------------
### Step 1: Create Pad Cells
### ------------------------------

### ------------------------------
### Step 1: Create Pad Cells
### ------------------------------

# Corner pads
create_cell {cornerLL cornerLR cornerUL cornerUR} PCORNER

# Core power pads
create_cell {core_vdd1 core_vdd2} PVDD1DGZ
create_cell {core_vss1 core_vss2} PVSS1DGZ

# IO power pads (50 VDD + 54 VSS + 1 POC, grouped for readability)
create_cell {io_vdd1 io_vdd2 io_vdd3 io_vdd4 io_vdd5 io_vdd6 io_vdd7 io_vdd8 io_vdd9 io_vdd10} PVDD2DGZ
create_cell {io_vdd11 io_vdd12 io_vdd13 io_vdd14 io_vdd15 io_vdd16 io_vdd17 io_vdd18 io_vdd19 io_vdd20} PVDD2DGZ
create_cell {io_vdd21 io_vdd22 io_vdd23 io_vdd24 io_vdd25 io_vdd26 io_vdd27 io_vdd28 io_vdd29 io_vdd30} PVDD2DGZ
create_cell {io_vdd31 io_vdd32 io_vdd33 io_vdd34 io_vdd35 io_vdd36 io_vdd37 io_vdd38 io_vdd39 io_vdd40} PVDD2DGZ
create_cell {io_vdd41 io_vdd42 io_vdd43 io_vdd44 io_vdd45 io_vdd46 io_vdd47 io_vdd48 io_vdd49 io_vdd50} PVDD2DGZ

create_cell {io_vss1 io_vss2 io_vss3 io_vss4 io_vss5 io_vss6 io_vss7 io_vss8 io_vss9 io_vss10} PVSS2DGZ
create_cell {io_vss11 io_vss12 io_vss13 io_vss14 io_vss15 io_vss16 io_vss17 io_vss18 io_vss19 io_vss20} PVSS2DGZ
create_cell {io_vss21 io_vss22 io_vss23 io_vss24 io_vss25 io_vss26 io_vss27 io_vss28 io_vss29 io_vss30} PVSS2DGZ
create_cell {io_vss31 io_vss32 io_vss33 io_vss34 io_vss35 io_vss36 io_vss37 io_vss38 io_vss39 io_vss40} PVSS2DGZ
create_cell {io_vss41 io_vss42 io_vss43 io_vss44 io_vss45 io_vss46 io_vss47 io_vss48 io_vss49 io_vss50} PVSS2DGZ
create_cell {io_vss51 io_vss52 io_vss53 io_vss54} PVSS2DGZ

# IO power-on control pad
create_cell {io_poc} PVDD2POC

### ------------------------------
### Step 2: Floorplan and Pad Filler
### ------------------------------

### ------------------------------
### Step 2: Floorplan and Pad Filler
### ------------------------------

# Create floorplan with 60um IO-to-core spacing on all sides
create_floorplan -core_utilization 0.6 -flip_first_row \
                 -left_io2core 60 -bottom_io2core 60 \
                 -right_io2core 60 -top_io2core 60

# Insert filler cells between IO pads
insert_pad_filler -cell {PFILLER20 PFILLER10 PFILLER5 PFILLER1 PFILLER05 PFILLER0005} \
                  -overlap_cell {PFILLER0005}

# Save initial floorplan version
save_mw_cel -design $DESIGN
save_mw_cel -design $DESIGN -as die_init

### ------------------------------
### Step 3: Power Ring and Power Rails
### ------------------------------

### ------------------------------
### Step 3: Power Ring and Power Rails
### ------------------------------

# Define power and ground net names
derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}

# Set rail constraints for METAL3 (horizontal) and METAL2 (vertical)
set_fp_rail_constraints -add_layer -layer METAL3 -direction horizontal -max_strap 10 -min_strap 3 -max_width 3 -min_width 3 -spacing minimum
set_fp_rail_constraints -add_layer -layer METAL2 -direction vertical   -max_strap 10 -min_strap 3 -max_width 3 -min_width 3 -spacing minimum

# Define global power ring around core using METAL2 and METAL3
set_fp_rail_constraints -set_ring -nets {VDD VSS VDD VSS} \
                        -horizontal_ring_layer {METAL3} \
                        -vertical_ring_layer {METAL2} \
                        -ring_width 8 -ring_offset 3 -extend_strap core_ring

# Prevent routing over macros (if any)
set_fp_rail_constraints -set_global -no_routing_over_hard_macros

# Synthesize power rails (based on power budget and voltage)
synthesize_fp_rail -nets {VDD VSS} -voltage_supply 1.8 -synthesize_power_plan -power_budget 7

# Commit the PG routing
commit_fp_rail

### ------------------------------
### Step 4: Pre-route Instances and PG Connection
### ------------------------------

### ------------------------------
### Step 4: Pre-route Instances and PG Connection
### ------------------------------

# Pre-route instances (cell rows) for power, ignore macros and cover cells
preroute_instances -ignore_macros -ignore_cover_cells -primary_routing_layer pin \
                   -extend_for_multiple_connections -extension_gap 17

# Pre-route block rings for macros (if present), ignore pads
preroute_instances -ignore_pads -ignore_cover_cells -primary_routing_layer pin

# Connect power rails to standard cells
preroute_standard_cells -extend_for_multiple_connections -extension_gap 17 \
                        -connect horizontal -remove_floating_pieces \
                        -do_not_route_over_macros -fill_empty_rows \
                        -port_filter_mode off -cell_master_filter_mode off \
                        -cell_instance_filter_mode off -voltage_area_filter_mode off \
                        -route_type {P/G Std. Cell Pin Conn}

# Analyze the final rail structure for voltage and power budget
analyze_fp_rail -net {VDD VSS} -power_budget 7 -voltage_supply 1.8

# Improve rail routing coverage if necessary
set_pnet_options -partial "METAL2 METAL3"

# Optional final legalize/placement refresh
create_fp_placement -incremental all

# Save checkpoint
save_mw_cel -design $DESIGN
save_mw_cel -design $DESIGN -as design_planning

### ------------------------------
### Step 5: Pad Placement Constraints
### ------------------------------
set_pad_physical_constraints -side 1 -pad_name IPAD_clk -order 1 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_m_axis_tready -order 2 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_resetn -order 3 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr0 -order 4 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr1 -order 5 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr10 -order 6 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr11 -order 7 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr12 -order 8 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr13 -order 9 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr14 -order 10 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name io_vdd1 -order 11 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name io_vss1 -order 12 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr15 -order 13 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr16 -order 14 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr17 -order 15 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr18 -order 16 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr19 -order 17 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr2 -order 18 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr20 -order 19 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr21 -order 20 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name io_vdd2 -order 21 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name io_vss2 -order 22 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr22 -order 23 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr23 -order 24 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr24 -order 25 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr25 -order 26 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr26 -order 27 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr27 -order 28 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr28 -order 29 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr29 -order 30 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name io_vdd3 -order 31 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name io_vss3 -order 32 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr3 -order 33 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr30 -order 34 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr31 -order 35 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr4 -order 36 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr5 -order 37 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr6 -order 38 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr7 -order 39 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr8 -order 40 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name io_vdd4 -order 41 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name io_vss4 -order 42 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_araddr9 -order 43 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_arvalid -order 44 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr0 -order 45 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr1 -order 46 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr10 -order 47 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr11 -order 48 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr12 -order 49 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr13 -order 50 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name io_vdd5 -order 51 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name io_vss5 -order 52 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr14 -order 53 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr15 -order 54 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr16 -order 55 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr17 -order 56 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr18 -order 57 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr19 -order 58 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr2 -order 59 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr20 -order 60 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name io_vdd6 -order 61 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name io_vss6 -order 62 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr21 -order 63 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr22 -order 64 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr23 -order 65 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr24 -order 66 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr25 -order 67 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr26 -order 68 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr27 -order 69 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr28 -order 70 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name io_vdd7 -order 71 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name io_vss7 -order 72 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr29 -order 73 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 1 -pad_name IPAD_s_axi_awaddr3 -order 74 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_awaddr30 -order 1 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_awaddr31 -order 2 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_awaddr4 -order 3 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_awaddr5 -order 4 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_awaddr6 -order 5 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_awaddr7 -order 6 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_awaddr8 -order 7 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_awaddr9 -order 8 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_awvalid -order 9 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_bready -order 10 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name io_vdd8 -order 11 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name io_vss8 -order 12 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_rready -order 13 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata0 -order 14 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata1 -order 15 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata10 -order 16 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata11 -order 17 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata12 -order 18 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata13 -order 19 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata14 -order 20 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name io_vdd9 -order 21 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name io_vss9 -order 22 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata15 -order 23 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata16 -order 24 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata17 -order 25 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata18 -order 26 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata19 -order 27 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata2 -order 28 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata20 -order 29 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata21 -order 30 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name io_vdd10 -order 31 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name io_vss10 -order 32 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata22 -order 33 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata23 -order 34 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata24 -order 35 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata25 -order 36 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata26 -order 37 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata27 -order 38 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata28 -order 39 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata29 -order 40 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name io_vdd11 -order 41 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name io_vss11 -order 42 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata3 -order 43 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata30 -order 44 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata31 -order 45 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata4 -order 46 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata5 -order 47 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata6 -order 48 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata7 -order 49 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata8 -order 50 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name io_vdd12 -order 51 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name io_vss12 -order 52 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wdata9 -order 53 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wstrb0 -order 54 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wstrb1 -order 55 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wstrb2 -order 56 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wstrb3 -order 57 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axi_wvalid -order 58 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axis_a_tdata0 -order 59 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axis_a_tdata1 -order 60 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name io_vdd13 -order 61 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name io_vss13 -order 62 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axis_a_tdata10 -order 63 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axis_a_tdata11 -order 64 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axis_a_tdata12 -order 65 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axis_a_tdata13 -order 66 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axis_a_tdata14 -order 67 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axis_a_tdata15 -order 68 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axis_a_tdata16 -order 69 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axis_a_tdata17 -order 70 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name io_vdd14 -order 71 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name io_vss14 -order 72 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axis_a_tdata18 -order 73 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 2 -pad_name IPAD_s_axis_a_tdata19 -order 74 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata2 -order 1 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata20 -order 2 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata21 -order 3 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata22 -order 4 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata23 -order 5 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata24 -order 6 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata25 -order 7 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata26 -order 8 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata27 -order 9 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata28 -order 10 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name io_vdd15 -order 11 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name io_vss15 -order 12 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata29 -order 13 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata3 -order 14 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata30 -order 15 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata31 -order 16 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata32 -order 17 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata33 -order 18 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata34 -order 19 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata35 -order 20 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name io_vdd16 -order 21 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name io_vss16 -order 22 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata36 -order 23 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata37 -order 24 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata38 -order 25 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata39 -order 26 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata4 -order 27 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata40 -order 28 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata41 -order 29 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata42 -order 30 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name io_vdd17 -order 31 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name io_vss17 -order 32 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata43 -order 33 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata44 -order 34 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata45 -order 35 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata46 -order 36 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata47 -order 37 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata48 -order 38 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata49 -order 39 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata5 -order 40 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name io_vdd18 -order 41 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name io_vss18 -order 42 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata50 -order 43 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata51 -order 44 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata52 -order 45 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata53 -order 46 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata54 -order 47 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata55 -order 48 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata56 -order 49 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata57 -order 50 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name io_vdd19 -order 51 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name io_vss19 -order 52 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata58 -order 53 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata59 -order 54 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata6 -order 55 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata60 -order 56 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata61 -order 57 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata62 -order 58 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata63 -order 59 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata7 -order 60 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name io_vdd20 -order 61 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name io_vss20 -order 62 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata8 -order 63 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tdata9 -order 64 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tlast -order 65 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_a_tvalid -order 66 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_b_tdata0 -order 67 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_b_tdata1 -order 68 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_b_tdata10 -order 69 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_b_tdata11 -order 70 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name io_vdd21 -order 71 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name io_vss21 -order 72 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_b_tdata12 -order 73 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 3 -pad_name IPAD_s_axis_b_tdata13 -order 74 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata14 -order 1 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata15 -order 2 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata16 -order 3 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata17 -order 4 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata18 -order 5 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata19 -order 6 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata2 -order 7 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata20 -order 8 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata21 -order 9 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata22 -order 10 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name io_vdd22 -order 11 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name io_vss22 -order 12 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata23 -order 13 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata24 -order 14 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata25 -order 15 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata26 -order 16 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata27 -order 17 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata28 -order 18 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata29 -order 19 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata3 -order 20 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name io_vdd23 -order 21 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name io_vss23 -order 22 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata30 -order 23 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata31 -order 24 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata32 -order 25 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata33 -order 26 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata34 -order 27 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata35 -order 28 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata36 -order 29 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata37 -order 30 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name io_vdd24 -order 31 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name io_vss24 -order 32 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata38 -order 33 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata39 -order 34 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata4 -order 35 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata40 -order 36 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata41 -order 37 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata42 -order 38 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata43 -order 39 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata44 -order 40 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name io_vdd25 -order 41 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name io_vss25 -order 42 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata45 -order 43 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata46 -order 44 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata47 -order 45 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata48 -order 46 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata49 -order 47 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata5 -order 48 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata50 -order 49 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata51 -order 50 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name io_vdd26 -order 51 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name io_vss26 -order 52 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata52 -order 53 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata53 -order 54 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata54 -order 55 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata55 -order 56 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata56 -order 57 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata57 -order 58 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata58 -order 59 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata59 -order 60 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name io_vdd27 -order 61 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name io_vss27 -order 62 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata6 -order 63 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata60 -order 64 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata61 -order 65 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata62 -order 66 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata63 -order 67 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata7 -order 68 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata8 -order 69 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tdata9 -order 70 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name io_vdd28 -order 71 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name io_vss28 -order 72 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tlast -order 73 -min_left_iospace 6 -min_right_iospace 6
set_pad_physical_constraints -side 4 -pad_name IPAD_s_axis_b_tvalid -order 74 -min_left_iospace 6 -min_right_iospace 6
