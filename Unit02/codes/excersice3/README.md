## Loading files Guide

### Scripts

#### Crate a project

`create_project my_proj ./my_proj -part xc7a35tcpg236-1`

For example:

First run `vivado -mode tcl`

Then run this code:

```
create_project comb_2 \
/home/abel/Documents/vivado_projects/GP02/lab2_3/sub/comb_2 \
-part xc7a35tcpg236-1
```
<!-- create_project top \
/home/abel/Documents/vivado_projects/GP02/lab2_3/top \
-part xc7a35tcpg236-1 -->


#### Add sources

`add_files -fileset sources_1 [glob ./rtl/*.v]`
`add_files -fileset constrs_1 [glob ./constraints/*.xdc]`

`add_files -fileset sim_1     [glob ./tb/*.v]`
#### Set properties

`set_property top top       [get_filesets sources_1]`
`set_property top tb_top    [get_filesets sim_1]`

#### Update compile order

`update_compile_order -fileset sources_1`
`update_compile_order -fileset sim_1`

### Run

#### Option 1: Batch mode

The script to run is the following:

`vivado -mode batch -source "Desktop/dd1/githubRepos/add25/Unit02/codes/excersice_3/load_files.tcl"`

#### Option 2: Interactive Shell.

In order to running the `.tcl` file in the interactive Shell we could type the following lines:

`vivado -mode tcl`
`source build.tcl`
