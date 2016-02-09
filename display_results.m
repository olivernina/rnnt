clear;
addpath('caffe-fcnt/matlab/caffe/', 'util');
data_root = ['/media/onina/SSD/projects/tracking'];
data_path = ['/media/onina/SSD/projects/tracking/videos/']
versions = ['orig' ;'ver1'];
colors = ['r','g']
seq_name = 'Ironman'; % Bolt doesn't work as well in the beginning. Ironman is bad
tracker_param = init_tracker(data_root, seq_name,'comparison');
tracker_param.debug = 0;
load_tracker_param;
positions = {}

for i=1:size(versions,1)
    dir_path = [data_root '/results/' versions(i,:) '/' seq_name];
    res_file = [dir_path '/position.mat'];
    load(res_file);
    positions{i} = position;
end


for i=1:50%size(frames,1)

    frame_name = sprintf([data_path 'img/%04d.jpg'], i);
    frame = imread(frame_name);
    sz = [pf_param.p_sz, pf_param.p_sz];

    figure(1); clf;
    set(gcf,'DoubleBuffer','on','MenuBar','none');
    colormap('gray');
    axes('position', [0 0 1 1])
    imagesc(frame, [0,1]); hold on;
    text(5, 18, num2str(i), 'Color','y', 'FontWeight','bold', 'FontSize',18);
    
    for v=1:size(versions,1)
        positions{v}(:, i)
        drawbox(sz(1:2), affparam2mat(positions{v}(:, i)), 'Color',colors(v), 'LineWidth',2.5);
    end
    axis off; hold off;
    drawnow;
    saveas(gcf,[ tracker_param.result_path '/' num2str(i)  '.png']);
end

