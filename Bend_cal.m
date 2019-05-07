%% Data Loading
d_20 = csvread('bend_cal_pwm_20.csv',1,1);
d_40 = csvread('bend_cal_pwm_40.csv',1,1);
d_60 = csvread('bend_cal_pwm_60.csv',1,1);
d_80 = csvread('bend_cal_pwm_80.csv',1,1);
d_100 = csvread('bend_cal_pwm_100.csv',1,1);
d_120 = csvread('bend_cal_pwm_120.csv',1,1);
d_140 = csvread('bend_cal_pwm_140.csv',1,1);
d_160 = csvread('bend_cal_pwm_160.csv',1,1);
d_180 = csvread('bend_cal_pwm_180.csv',1,1);
d_200 = csvread('bend_cal_pwm_200.csv',1,1);

%%
[mean_flex_20,var_flex_20] = mean_flex_fun(d_20);
mean_q_20 = mean_q_fun(d_20);
[mean_flex_40,var_flex_40] = mean_flex_fun(d_40);
mean_q_40 = mean_q_fun(d_40);
[mean_flex_60,var_flex_60] = mean_flex_fun(d_60);
mean_q_60 = mean_q_fun(d_60);
[mean_flex_80,var_flex_80] = mean_flex_fun(d_80);
mean_q_80 = mean_q_fun(d_80);
[mean_flex_100,var_flex_100] = mean_flex_fun(d_100);
mean_q_100 = mean_q_fun(d_100);
[mean_flex_120,var_flex_120] = mean_flex_fun(d_120);
mean_q_120 = mean_q_fun(d_120);
[mean_flex_140,var_flex_140] = mean_flex_fun(d_140);
mean_q_140 = mean_q_fun(d_140);
[mean_flex_160,var_flex_160] = mean_flex_fun(d_160);
mean_q_160 = mean_q_fun(d_160);
[mean_flex_180,var_flex_180] = mean_flex_fun(d_180);
mean_q_180 = mean_q_fun(d_180);
[mean_flex_200,var_flex_200] = mean_flex_fun(d_200);
mean_q_200 = mean_q_fun(d_200);

q = [mean_q_20,mean_q_40,mean_q_60,mean_q_80,mean_q_100,mean_q_120,mean_q_140,mean_q_160,mean_q_180,mean_q_200];
flex = [mean_flex_20,mean_flex_40,mean_flex_60,mean_flex_80,mean_flex_100,mean_flex_120,mean_flex_140,mean_flex_160,mean_flex_180,mean_flex_200];

plot(flex,q,'.')

A = [flex;ones(1,10)];
A = A';
b = q';
x = A\b;
t=linspace(400,650);
hmm = t*x(1)+x(2);
hold on
plot(t,hmm)
xlabel('Steady State Bend Sensor Reading')
ylabel('Angle (radians)')
legend('data points', 'fitted curve')

figure(2)
volt = flex/1024;
res = (56e3./volt)-56e3;
plot(res,q,'.')
xlabel('Resistance (Ohms)')
ylabel('Angle (radians)')

% y=mx+b m=-.0096, b=5.8393