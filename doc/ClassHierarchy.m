clearvars
clc
close all

thisPath=fileparts(mfilename('fullpath'));
parentPath=fileparts(thisPath);
elementFileNames=deblank(string(ls(fullfile(parentPath,'c*.m'))));
len=strlength(elementFileNames);
elementClassNames=eraseBetween(elementFileNames,len-1,len);
matlab.diagram.ClassViewer('Classes',elementClassNames);