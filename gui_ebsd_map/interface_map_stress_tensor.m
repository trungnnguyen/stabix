% Copyright 2013 Max-Planck-Institut f�r Eisenforschung GmbH
% $Id: interface_map_stress_tensor.m 1203 2014-08-05 13:07:41Z d.mercier $
function interface_map_stress_tensor
%% Function used to set stress tensor in the map interface
% authors: d.mercier@mpie.de / c.zambaldi@mpie.de

gui = guidata(gcf);

% Setting of components of stress tensor if empty
if isempty(get(gui.handles.ST_s11, 'String'))
    set(gui.handles.ST_s11, 'String', '0')
end
if isempty(get(gui.handles.ST_s12, 'String'))
    set(gui.handles.ST_s12, 'String', '0')
end
if isempty(get(gui.handles.ST_s13, 'String'))
    set(gui.handles.ST_s13, 'String', '0')
end
if isempty(get(gui.handles.ST_s21, 'String'))
    set(gui.handles.ST_s21, 'String', '0')
end
if isempty(get(gui.handles.ST_s22, 'String'))
    set(gui.handles.ST_s22, 'String', '0')
end
if isempty(get(gui.handles.ST_s23, 'String'))
    set(gui.handles.ST_s23, 'String', '0')
end
if isempty(get(gui.handles.ST_s31, 'String'))
    set(gui.handles.ST_s31, 'String', '0')
end
if isempty(get(gui.handles.ST_s32, 'String'))
    set(gui.handles.ST_s32, 'String', '0')
end
if isempty(get(gui.handles.ST_s33, 'String'))
    set(gui.handles.ST_s33, 'String', '1')
end

% Get components of stress tensor
stress11 = str2double(get(gui.handles.ST_s11, 'String'));
stress12 = str2double(get(gui.handles.ST_s12, 'String'));
stress13 = str2double(get(gui.handles.ST_s13, 'String'));
stress21 = str2double(get(gui.handles.ST_s21, 'String'));
stress22 = str2double(get(gui.handles.ST_s22, 'String'));
stress23 = str2double(get(gui.handles.ST_s23, 'String'));
stress31 = str2double(get(gui.handles.ST_s31, 'String'));
stress32 = str2double(get(gui.handles.ST_s32, 'String'));
stress33 = str2double(get(gui.handles.ST_s33, 'String'));

gui.stress_tensor.sigma    = [stress11, stress12, stress13;...
    stress21, stress22, stress23;...
    stress31, stress32, stress33];
% Stress tensor is defined using TSL convensions with x down !!!

%% Frobenius norm - unitized stress tensor to get generalized schmid factor
gui.stress_tensor.sigma_n = gui.stress_tensor.sigma/norm(gui.stress_tensor.sigma,'fro');

%% Trace of the stress tensor
gui.stress_tensor.sigma_v = [gui.stress_tensor.sigma(1,1) gui.stress_tensor.sigma(2,2) gui.stress_tensor.sigma(3,3)]';

guidata(gcf, gui);

end