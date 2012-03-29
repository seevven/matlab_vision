x_right_1=[357,355,319;170,231,230];
x_left_1=[174,169,118;203,283,279];
[Xc_1_left,Xc_1_right] = stereo_triangulation(x_left_1,x_right_1,om,T,fc_left,cc_left,kc_left,alpha_c_left,fc_right,cc_right,kc_right,alpha_c_right);
distance(1,1)=sqrt((Xc_1_left(1,1)-Xc_1_left(1,2))^2+(Xc_1_left(2,1)-Xc_1_left(2,2))^2+(Xc_1_left(3,1)-Xc_1_left(3,2))^2);
distance(2,1)=sqrt((Xc_1_right(1,1)-Xc_1_right(1,2))^2+(Xc_1_right(2,1)-Xc_1_right(2,2))^2+(Xc_1_right(3,1)-Xc_1_right(3,2))^2);
distance(1,2)=sqrt((Xc_1_left(1,2)-Xc_1_left(1,3))^2+(Xc_1_left(2,2)-Xc_1_left(2,3))^2+(Xc_1_left(3,2)-Xc_1_left(3,3))^2);
distance(2,2)=sqrt((Xc_1_right(1,2)-Xc_1_right(1,3))^2+(Xc_1_right(2,2)-Xc_1_right(2,3))^2+(Xc_1_right(3,2)-Xc_1_right(3,3))^2);
distance