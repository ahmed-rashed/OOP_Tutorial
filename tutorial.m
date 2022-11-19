clear all %#ok<CLALL> 
clc

oArea=cArea_simple %#ok<*NOPTS,*NASGU> 
oArea=cArea_simple(1)
oArea=cArea_simple(1,2)
oArea=cArea_simple(1,2,3)
oArea=cArea_simple(1,2,3,4)


oArea.A
oArea.A=8
Iz_hat(oArea,5)
oArea.Iz_hat(5)
oArea.Iy_hat(6)
oArea.Iyz_hat(5,6)




oArea=cArea_simple(1,2,3,4)
oArea.Iz_hat(5)
oArea.Iy_hat(6)
oArea.Iyz_hat(5,6)
oDistantArea=cDistantArea_simple(1,2,3,4,5,6)
oDistantArea.Iz_hat
oDistantArea.Iy_hat
oDistantArea.Iyz_hat


isa(oDistantArea,'cArea_simple')
isa(oDistantArea,'cDistantArea_simple')
class(oDistantArea)




doc cDistantArea_simple
matlab.diagram.ClassViewer('Classes',["cArea_simple","cDistantArea_simple"])



oArea1_arr(2,2)=cArea_simple(3.2)
oArea1_arr(2,1)=cArea_simple(1.4)




oArea1_arr.A
oArea1_arr(1,1).A,oArea1_arr(2,1).A,oArea1_arr(1,2).A,oArea1_arr(2,2).A


oArea1_arr.Iy
oArea1_arr(1,1).Iy,oArea1_arr(2,1).Iy,oArea1_arr(1,2).Iy,oArea1_arr(2,2).Iy

[oArea1_arr.A]
[oArea1_arr.Iy]

reshape([oArea1_arr.Iy],size(oArea1_arr))

{oArea1_arr.A}
{oArea1_arr.Iy}






A_arr=[1,2,3;4,5,6]
Iy_arr=[7,8,9;10,11,12]
Iz_arr=[13,14,15;16,17,18]
oArea2_arr=cArea(A_arr,Iy_arr,Iz_arr)

Iyz_arr=zeros(2,3)
y_hat_arr=[1,2,3;4,5,6]
z_hat_arr=[7,8,9;10,11,12]
oDistantArea_arr=cDistantArea(A_arr,Iy_arr,Iz_arr,Iyz_arr,y_hat_arr,z_hat_arr)

oArea2_arr.Iz_hat(5)
oArea2_arr.Iz_hat(y_hat_arr)

oArea2_arr.Iyz_hat(5,6)
oArea2_arr.Iyz_hat(y_hat_arr,z_hat_arr)

oDistantArea_arr.Iz_hat
oDistantArea_arr.Iyz_hat

test_cCompositeArea