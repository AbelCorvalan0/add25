# ## Load Files

# # Open project
# open_project ./Documents/vivado_projects/GP02/lab2_3/sub/comb_1/comb_1.xpr

# # Add files
# # Sources
# add_files -fileset sources_1 ./Desktop/dd1/githubRepos/add25/Unit02/codes/excersice_3/comb_1/comb_1.v

# # Constraints
# add_files -fileset constrs_1 ./Desktop/dd1/githubRepos/add25/constraints/Arty_Master_v2.xdc

# # Tests Bench
# add_files -fileset sim_1 ./Desktop/dd1/githubRepos/add25/Unit02/codes/excersice_3/comb_1/tb_comb_1.v


## Load Files

# -------------------------------------------------
# Open project (ABSOLUTE PATH)
# -------------------------------------------------
open_project /home/abel/Documents/vivado_projects/GP02/pruebafiltro/pruebafiltro.xpr

# -------------------------------------------------
# Add files
# -------------------------------------------------

# Sources
add_files -fileset sources_1 \
    /home/abel/Desktop/dd1/githubRepos/add25/Unit02/resources/fir/fir/filtro_fir.v \
    /home/abel/Desktop/dd1/githubRepos/add25/Unit02/resources/fir/fir/SatTruncFP.v \
    /home/abel/Desktop/dd1/githubRepos/add25/Unit02/resources/fir/fir/signal_generator.v \
    /home/abel/Desktop/dd1/githubRepos/add25/Unit02/resources/fir/fir/top_design.v

# Constraints
add_files -fileset constrs_1 \
    /home/abel/Desktop/dd1/githubRepos/add25/constraints/Arty_Master_v2.xdc

# Testbench
add_files -fileset sim_1 \
    /home/abel/Desktop/dd1/githubRepos/add25/Unit02/resources/fir/fir/tb_filtro_fir.v

# -------------------------------------------------
# Set properties
# -------------------------------------------------
set_property top tb_corner_cases [get_filesets sim_1]

# -------------------------------------------------
# Update compile order
# -------------------------------------------------
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

puts "INFO: Files successfully loaded"
