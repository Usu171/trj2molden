color Display Background white
color scale method BGR
color scale midpoint 0.666
display depthcue off
set isoval 1
axes location Off
display distance -8.0
light 3 on

#根据实际情况进行修改
for {set i 1} {$i<=51} {incr i} {
set name $i
puts "Processing f1_$name.cub and f2_$name.cub..."
mol default style CPK
mol new f1_$name.cub
mol addfile f2_$name.cub

# 根据实际情况进行修改
scale to 0.4 
rotate y by -15
translate by 0.000000 0.00000 -2.000000

mol modstyle 0 top CPK 0.700000 0.300000 18.000000 16.000000
mol addrep top
mol modstyle 1 top Isosurface $isoval 1 0 0 1 1
mol modcolor 1 top Volume 0
mol scaleminmax top 1 -0.04 0.02
render snapshot $name.bmp
mol delete top
}