function varargout = main(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
function main_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);
function varargout = main_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function eM_Callback(hObject, eventdata, handles)
function eM_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function eN_Callback(hObject, eventdata, handles)
function eN_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function eK_Callback(hObject, eventdata, handles)
function eK_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function eS_Callback(hObject, eventdata, handles)
function eS_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton1_Callback(hObject, eventdata, handles)
clc
K='1001101110';

N=10;
rK=numel(K);

M=get(handles.eM,'String');

M=unicode2native(M);
M=dec2bin(M)

M=reshape(M',1,numel(M));
raz=mod(numel(M),N);

if raz==0
    M=reshape(M,numel(M)/N,N);
else
    M=strcat(dec2bin(0,N-raz),M);
    M=reshape(M,numel(M)/N,N);
end

for i=1:numel(M(:,1))
    XL=M(i,1:5);
    XR=M(i,6:10);
    for raund=1:10
        
        if mod(raund,2)==1
            Key=K(1:5);
        else
            Key=K(6:10);
        end
        res='';
        for j=1:5
            ans=[str2double(Key(j)) str2double(XL(j))];
            res=strcat(res,num2str(xor(ans(1),ans(2))));
        end
        S(i,:)=strcat(XR,res);
        
        XL=S(i,1:5);
        XR=S(i,6:10);
    end
end
dS=S;
S=reshape(S',1,numel(S));
if raz==0
    S=reshape(S,8,numel(S)/8)';
else
    S(1:N-raz)='';
    S=reshape(S,8,numel(S)/8)';
end

S=char(bin2dec(S)');
set(handles.eS,'String',S)


for i=1:numel(dS(:,1))
    XL=dS(i,1:5);
    XR=dS(i,6:10);
    for raund=1:10
        
        if mod(raund,2)==1
            Key=K(1:5);
        else
            Key=K(6:10);
        end
        res='';
        for j=1:5
            ans=[str2double(Key(j)) str2double(XL(j))];
            res=strcat(res,num2str(xor(ans(1),ans(2))));
        end
        M2(i,:)=strcat(XR,res);
        
        XL=M2(i,1:5);
        XR=M2(i,6:10);
    end
end


M2=reshape(M2,1,numel(M2))

if raz==0
    M2=reshape(M2,8,numel(M2)/8)'
else
    M2(1:N-raz)='';
    M2=reshape(M2,8,numel(M2)/8)'
end

M2=native2unicode(bin2dec(M2)')
set(handles.eM2,'String',M2)



function eM2_Callback(hObject, eventdata, handles)
% hObject    handle to eM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eM2 as text
%        str2double(get(hObject,'String')) returns contents of eM2 as a double


% --- Executes during object creation, after setting all properties.
function eM2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
