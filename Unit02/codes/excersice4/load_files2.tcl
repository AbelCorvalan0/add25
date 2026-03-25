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
open_project /home/abel/Documents/vivado_projects/GP02/lab2_4/fir_filter/fir_filter.xpr

# -------------------------------------------------
# Add files
# -------------------------------------------------

# Sources
add_files -fileset sources_1 \
    /home/abel/Desktop/dd1/githubRepos/add25/Unit02/codes/excersice_4/filtro_fir.v

# Constraints
add_files -fileset constrs_1 \
    /home/abel/Desktop/dd1/githubRepos/add25/constraints/Arty_Master_v2.xdc

# Testbench
add_files -fileset sim_1 \
    /home/abel/Desktop/dd1/githubRepos/add25/Unit02/codes/excersice_4/tb_filtro_fir.v

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
