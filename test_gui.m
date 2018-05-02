function varargout = test_gui(varargin)
% TEST_GUI MATLAB code for test_gui.fig
%      TEST_GUI, by itself, creates a new TEST_GUI or raises the existing
%      singleton*.
%
%      H = TEST_GUI returns the handle to a new TEST_GUI or the handle to
%      the existing singleton*.
%
%      TEST_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST_GUI.M with the given input arguments.
%
%      TEST_GUI('Property','Value',...) creates a new TEST_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test_gui

% Last Modified by GUIDE v2.5 26-Apr-2018 14:45:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @test_gui_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before test_gui is made visible.
function test_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test_gui (see VARARGIN)

% Choose default command line output for test_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in right.
function right_Callback(hObject, eventdata, handles)
handles.right.BackgroundColor = [0 1 0];
handles.left.BackgroundColor = [1 1 1];
handles.up.BackgroundColor = [1 1 1];
handles.down.BackgroundColor = [1 1 1];

% SECTION WE ARE HAVING TROUBLE WITH
% --- Executes on button press in left.
function left_Callback(hObject, eventdata, handles)
handles.dir = 2;
guidata(hObject,handles)
left(hObject,handles)
handles.x = handles.x - handles.speed;
Graph(handles);
guidata(hObject,handles)

%ship.x = ship.x-1
%handles.axes1 = Graph(matrix,ship.dir,ship.x,ship.y);

% --- Executes on button press in up.
function up_Callback(hObject, eventdata, handles)
handles.right.BackgroundColor = [1 1 1];
handles.left.BackgroundColor = [1 1 1];
handles.up.BackgroundColor = [0 1 0];
handles.down.BackgroundColor = [1 1 1];

% --- Executes on button press in down.
function down_Callback(hObject, eventdata, handles)
handles.right.BackgroundColor = [1 1 1];
handles.left.BackgroundColor = [1 1 1];
handles.up.BackgroundColor = [1 1 1];
handles.down.BackgroundColor = [0 1 0];


% --- Executes on button press in speedup.
function speedup_Callback(hObject, eventdata, handles)
currentCounterValue = str2double(get(handles.speed, 'String'));
newString = sprintf( '%d', int32(currentCounterValue + 1));
set(handles.speed, 'String', newString );
%handles.speed.String = 'Speed:',newString;

% --- Executes on button press in speeddown.
function speeddown_Callback(hObject, eventdata, handles)
currentCounterValue = str2double(get(handles.speed, 'String'));
newString = sprintf( '%d', int32(currentCounterValue - 1));
set(handles.speed, 'String', newString );
% --- Executes on button press in speed.

function speed_Callback(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
  
%Push creates a new matrix to play
handles.x = 4;
handles.y = 4;
handles.speed = 1;
handles.dead = 0;
handles.end = ones(7,7);
handles.dir = 2;
guidata(hObject,handles);
handles.matrix = SS(hObject, handles,2);
%Graphs the Matrix on the GUI
Graph(handles);
guidata(hObject,handles);



% this function generates a matrix randomly filled with 1's and 0's
% where 1's represent asteroids and 0's represent empty space that the
% player can move through without crashing.
function matrix = SS(hObject, handles, level)
if level == 1
    matrix = rand(5,5) > .9;
elseif level == 2
    matrix = rand(5,5) > .8;
elseif level == 3
    matrix = rand(5,5) > .7;
elseif level == 4
    matrix = rand(5,5) > .2;
end
handles.dead = 1
   handles.speed = 1;
   handles.x = 4;
   handles.y = 4;
   handles.dir = 2;

   matrix = double(matrix);
   [ydim, xdim] = size(matrix);
   ringedMat = ones(ydim+2,xdim+2);
   ringedMat(2:ydim+1,2:xdim+1) = matrix;
   matrix = ringedMat;
   guidata(hObject,handles);

   %function takes the matrix we generated with the function SS and plots
   %it with a scatterplot on our GUI for handles.axes1.
function Graph(handles) 
   % This section flips the matrix by 270 degrees counter clockwise since
   % the function 'find' which is used later finds the index of row and col
   % position of 1's and the numbers used to represent our ship in the
   % matrix. If we simply used find to graph the indexes of the un-rotateed
   % then the when we ploted the scatterplot of these indicies then the 
   if(handles.dead)
       handles.matrix = ones(7,7);
   end
   Flip = rot90(handles.matrix);
   Flip = rot90(Flip);
   Flip = rot90(Flip);
   Flip(handles.x,handles.y) = handles.dir;

   
    [row1,col1] = find(Flip==1);
    [row2,col2] = find(Flip==2);
    [row3,col3] = find(Flip==3);
    [row4,col4] = find(Flip==4);
    [row5,col5] = find(Flip==5);
    

scatter(row1,col1,'o','filled','b')
hold all
scatter(row2,col2,'<','filled','r')

scatter(row3,col3,'^','filled','r')

scatter(row4,col4,'>','filled','r')

scatter(row5,col5,'v','filled','r')
hold off
drawnow


function left(hObject,handles)
 for i = 1:handles.speed    
       if handles.matrix(8-handles.y, handles.x-i) == 1
           handles.dead = 1;
           guidata(hObject,handles);
       end  
 end
 guidata(hObject,handles);
                                                                                                  