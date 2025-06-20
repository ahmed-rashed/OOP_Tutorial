clearvars
clc
close all

thisPath=fileparts(mfilename('fullpath'));
parentPath=fileparts(thisPath);
cCmAr_FileNames_temp=deblank(string(ls(fullfile(parentPath,'cCmAr*.m'))));
cCmAr_FileNames=cCmAr_FileNames_temp(~endsWith(cCmAr_FileNames_temp,"_simple.m"));
len=strlength(cCmAr_FileNames);
cCmAr_ClassNames=eraseBetween(cCmAr_FileNames,len-1,len);
matlab.diagram.ClassViewer('Classes',cCmAr_ClassNames);