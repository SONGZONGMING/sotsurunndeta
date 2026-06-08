function sub = load_humanData_v1(datadir, dataname, demoname)

% load and augment data
sub = load_E1_v2([datadir dataname]);

% princeton subjects only
i1 = strcmp({sub.expt_name}, 'pilot-v1');% 'repeater-v1'})
i2 = strcmp({sub.expt_name}, 'repeater-v1');
sub = sub(i1 | i2 );

for sn = 1:length(sub)
    sub(sn).sID = sub(sn).sNum; % align some notations for later on
end

%% load demographics (修复版：防止格式错误导致崩溃)
fname = demoname;
fid = fopen(fname);
if fid > 0
    % 尝试读取 3 列
    hdr = textscan(fid, '%s%s%s', 1, 'delimiter', ',');
    data = textscan(fid, '%s%f%s', 'delimiter', ',');
    fclose(fid);

    % 检查读取是否完整 (修复索引越界的核心)
    len1 = length(data{1});
    len2 = length(data{2});
    len3 = length(data{3});
    min_len = min([len1, len2, len3]); % 取最小长度，防止越界

    nm = cell(1, min_len);
    ge = cell(1, min_len);
    ag = zeros(min_len, 1);

    for i = 1:min_len
        nm{i} = data{1}{i};
        ge{i} = data{3}{i};
        ag(i) = data{2}(i);
    end
else
    warning('无法打开 Demographics 文件，将跳过人口统计学数据加载。');
    nm = {}; ge = {}; ag = [];
end

%% pair demographics with subject
% 只有当数据都不为空时才进行配对
if ~isempty(nm) && ~isempty(sub)
    for sn = 1:length(sub)
        if isempty(sub(sn).subjectID), continue; end
        
        idx = find(strcmp(nm, sub(sn).subjectID));
        if ~isempty(idx)
            sub(sn).age = ag(idx);
            sub(sn).gender = ge{idx};
        else
            % 如果找不到匹配的 ID，给个默认值防止后面画图报错
            sub(sn).age = NaN;
            sub(sn).gender = 'U'; 
        end
    end
end