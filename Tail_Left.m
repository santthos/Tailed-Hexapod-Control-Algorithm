clear all
close all
clc

sim=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
sim.simxFinish(-1); % just in case, close all opened connections
clientID=sim.simxStart('127.0.0.1',19999,true,true,5000,5);
    
if (clientID>-1)   
 disp('Connected to remote API server');
 
Rest_Position = [0,-2.61799387799149,0.785398163397448,0,0.523598775598299,0.785398163397448,0,3.66519142918809,0.785398163397448,0,-2.61799387799149,0.785398163397448,0,-2.61799387799149,0.785398163397448,0,0.523598775598299,0.785398163397448,0,-0.785398163397448,-0.785398163397448,-0.785398163397448,-1.0471975511966];

Tail_Leftt = [0,-2.61799387799149,0.785398163397448,0,0.523598775598299,0.785398163397448,0,3.66519142918809,0.785398163397448,0,-2.61799387799149,0.785398163397448,0,-2.61799387799149,0.785398163397448,0,0.523598775598299,0.785398163397448,0.523598775598299,-0.523598775598299,-1.22173047639603,-1.22173047639603,-0.436332312998582];



h= [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

[r,h(1)] = sim.simxGetObjectHandle(clientID,'Front_Right_Joint',sim.simx_opmode_blocking);
[r,h(2)] = sim.simxGetObjectHandle(clientID,'Front_Right_Limb',sim.simx_opmode_blocking);
[r,h(3)] = sim.simxGetObjectHandle(clientID,'Front_Right_Foot',sim.simx_opmode_blocking);
[r,h(4)]= sim.simxGetObjectHandle(clientID,'Mid_Right_Joint',sim.simx_opmode_blocking);
[r,h(5)] = sim.simxGetObjectHandle(clientID,'Mid_Right_Limb',sim.simx_opmode_blocking);
[r,h(6)] = sim.simxGetObjectHandle(clientID,'Mid_Right_Foot',sim.simx_opmode_blocking);
[r,h(7)] = sim.simxGetObjectHandle(clientID,'Back_Right_Joint',sim.simx_opmode_blocking);
[r,h(8)] = sim.simxGetObjectHandle(clientID,'Back_Right_Limb',sim.simx_opmode_blocking);
[r,h(9)] = sim.simxGetObjectHandle(clientID,'Back_Right_Foot',sim.simx_opmode_blocking);
[r,h(10)] = sim.simxGetObjectHandle(clientID,'Front_Left_Joint',sim.simx_opmode_blocking);
[r,h(11)] = sim.simxGetObjectHandle(clientID,'Front_Left_Limb',sim.simx_opmode_blocking);
[r,h(12)] = sim.simxGetObjectHandle(clientID,'Front_Left_Foot',sim.simx_opmode_blocking);
[r,h(13)] = sim.simxGetObjectHandle(clientID,'Mid_Left_Joint',sim.simx_opmode_blocking);
[r,h(14)] = sim.simxGetObjectHandle(clientID,'Mid_Left_Limb',sim.simx_opmode_blocking);
[r,h(15)] = sim.simxGetObjectHandle(clientID,'Mid_Left_Foot',sim.simx_opmode_blocking);
[r,h(16)] = sim.simxGetObjectHandle(clientID,'Back_Left_Joint',sim.simx_opmode_blocking);
[r,h(17)]= sim.simxGetObjectHandle(clientID,'Back_Left_Limb',sim.simx_opmode_blocking);
[r,h(18)] = sim.simxGetObjectHandle(clientID,'Back_Left_Foot',sim.simx_opmode_blocking);
[r,h(19)] = sim.simxGetObjectHandle(clientID,'Tail_Joint',sim.simx_opmode_blocking);
[r,h(20)] = sim.simxGetObjectHandle(clientID,'Tail_Segment_1',sim.simx_opmode_blocking);
[r,h(21)] = sim.simxGetObjectHandle(clientID,'Tail_Segment_2',sim.simx_opmode_blocking);
[r,h(22)] = sim.simxGetObjectHandle(clientID,'Tail_Segment_3',sim.simx_opmode_blocking);
[r,h(23)] = sim.simxGetObjectHandle(clientID,'Tail_Head',sim.simx_opmode_blocking);
    



    for i=1:23
    sim.simxSetJointTargetPosition(clientID,h(i),Rest_Position(i) ,sim.simx_opmode_streaming);
    end
    pause(0.15);
    
    n=1
    
    for n=1:5
    
    for i=1:23
    sim.simxSetJointTargetPosition(clientID,h(i),Tail_Leftt(i) ,sim.simx_opmode_streaming);
    end
    pause(1);
   
    n=n+1
   
    
    for i=1:23
    sim.simxSetJointTargetPosition(clientID,h(i),Rest_Position(i) ,sim.simx_opmode_streaming);
    end
    pause(1);
    
    end
    
    else
    
    disp('Failed connecting to remote API server');
    
end

sim.delete(); % call the destructor!
    
    
disp('Program ended');
    