% Clear all vars except all_data (all items struct)
clearvars -except all_data;
% Load needed variables
folders_config = get_config('folders');
output_folder = folders_config.output_folder;
config_folder = folders_config.config_folder;
% Restore saved environment
load(strcat(output_folder, '/workspace_backup.mat'));
% Restore saved figure
openfig(strcat(output_folder, '/fitness.fig'));
% Restore saved configuration
config_in_file = strcat(config_folder, '/get_config.m');
config_out_file = strcat(output_folder, '/get_config.m');
copyfile(config_out_file, config_in_file);
% Clear ans variable
clear ans;
