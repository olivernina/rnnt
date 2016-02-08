addpath('caffe-fcnt/matlab/caffe/', 'util');
data_path = ['video/'];
% seq_name = 'MotorRolling';

videos = dir(data_path);
videos = videos(3:end);

for i=1:size(videos,1)
    seq_name = videos(i).name; % Bolt doesn't work as well in the beginning. David is bad
    track_param = init_tracker(data_path, seq_name);
    track_param.debug = 0;
    position = cnn2_pf_tracker_orig(track_param);
    caffe('reset');
end

