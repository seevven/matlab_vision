clear 
clc
load resp;
 fin=fopen('inputdata.txt','r');
I=fscanf(fin,'%f',27);                               %截面惯性矩
x=fscanf(fin,'%f',28);
clocknum=3;
%节点位移随坐标的变化曲线
y=resp(2:29,clocknum);
hold on;
grid on;
xlabel('节点坐标（m）');
ylabel('节点位移（m）');
title('节点位移随坐标的变化曲线');
plot(x,y);
%节点转角随坐标变化曲线
z=resp(30:57,clocknum);
hold on;
grid on;
xlabel('节点坐标（m）');
ylabel('节点转角（m）');
title('节点转角随坐标的变化曲线');
plot(x,z);