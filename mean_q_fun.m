function q_mean = mean_q_fun(data)
time = data(:,1);
x_base = data(:,8);
y_base = data(:,9);
x_tip = data(:,10);
y_tip = data(:,11);
start_time_index = find(time>4,1);
end_time_index = find(time>10,1) - 1;

tipx_mean = mean(x_tip(start_time_index:end_time_index));
tipy_mean = mean(y_tip(start_time_index:end_time_index));
basex_mean = mean(x_base(start_time_index:end_time_index));
basey_mean = mean(y_base(start_time_index:end_time_index));
dx = tipx_mean - basex_mean;
dy = tipy_mean - basey_mean;
%dist = sqrt((tipx_mean - basex_mean)^2 + (tipy_mean - basey_mean)^2);
%Li = sqrt((x_tip(1) - x_base(1))^2 + (y_tip(1) - y_base(1))^2);

q_mean = 2*atan(dx/dy);


