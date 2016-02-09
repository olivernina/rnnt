addpath('caffe-fcnt/matlab/caffe/', 'util');
data_root = ['/media/onina/SSD/projects/tracking/'];
data_path = ['/media/onina/SSD/projects/tracking/videos/']
version = 'orig';

seq_name = 'Ironman'; % Bolt doesn't work as well in the beginning. David is bad
track_param = init_tracker(data_root, seq_name,version);
track_param.debug = 0;
if strcmp(version,'version1')
    position = cnn2_pf_tracker_ver1(track_param);
else
    position = cnn2_pf_tracker_orig(track_param);
end
caffe('reset');


