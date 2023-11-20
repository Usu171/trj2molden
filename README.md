# Calculate the molden.input file for each frame of the xyz animation

**trj2inp.sh**: Generate ORCA input files for each frame of the xyz animation

(You can also use input files from other software, but you need to create the corresponding `runall.sh`)

How to Use: `./trj2inp.sh trj.xyz template.inp`

You need to create a template input file

e.g.
```
! B3LYP D3 def2-TZVP def2/J RIJCOSX noautostart miniprint nopop
%maxcore  1000
%pal nprocs  8 end
* xyz 0 1
[geometry]
*
```

**orcarunall.sh**: Run all ORCA input files



**trj2xyz.sh**: Split the xyz animation into individual .xyz files

How to Use: `./trj2xyz.sh trj.xyz`

**xtbrunall.sh**: Use xTB to calculate all .xyz files

**batch.sh & bath.bat**: Use Multiwfn to generate cub files for IRI

**isoall.tcl**: Render IRI animation using VMD

**reverse.sh**: Reverse your xyz animation file

`source isoall.tcl`