function [flex_mean,flex_var] = mean_flex_fun(data)
time = data(:,1);
flex = data(:,6);
start_time_index = find(time>3,1);
end_time_index = find(time>10,1) - 1;
flex_mean = mean(flex(start_time_index:end_time_index));
flex_var = var(flex(start_time_index:end_time_index));
end