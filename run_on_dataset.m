addpath('caffe-fcnt/matlab/caffe/', 'util');
data_root = ['/media/olired/tracking/'];
data_path = ['/media/olired/tracking/videos/']
% seq_name = 'MotorRolling';
version = 'orig';
videos = dir(data_path);
videos = videos(3:end);

for i=1:size(videos,1)
    seq_name = videos(i).name; % Bolt doesn't work as well in the beginning. David is bad
    track_param = init_tracker(data_root, seq_name,version);
    track_param.debug = 0;
    if strcmp(version,'version1')
        position = cnn2_pf_tracker_ver1(track_param);
    else
        position = cnn2_pf_tracker_orig(track_param);
    end
    caffe('reset');
end

