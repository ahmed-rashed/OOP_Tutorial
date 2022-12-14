classdef cDistantArea < cArea   %The file-name must be the same as the class-name
%Methods of this class can handle object arrays
    properties
        y_bar(1,1)  double
        z_bar(1,1)  double
    end

    methods
        % Constructor that can initialize object array
        function oThisObject_arr=cDistantArea(A_arr,Iy_arr,Iz_arr,Iyz_arr,y_hat_arr,z_hat_arr)
            if nargin==0    %This is needed to create array of this class
                superClassArgs={};
            elseif nargin==6
                superClassArgs={A_arr,Iy_arr,Iz_arr,Iyz_arr};
            else
                error('This class can be constructed using zero or 6 inputs.');
            end

            %Construct the superclass
            oThisObject_arr@cArea(superClassArgs{:});
                
            %Construct the subclass
            if nargin~=0    %This is needed to create array of this class
                A_arr_size=size(A_arr);
                if any(size(y_hat_arr)~=A_arr_size),error('y_hat_arr and A_arr must have identical size.'),end
                y_hat_carr=num2cell(y_hat_arr);
                [oThisObject_arr.y_bar]=deal(y_hat_carr{:});
    
                if any(size(z_hat_arr)~=A_arr_size),error('z_hat_arr and A_arr must have identical size.'),end
                z_hat_carr=num2cell(z_hat_arr);
                [oThisObject_arr.z_bar]=deal(z_hat_carr{:});
            end
        end

        function Iy_hat=Iy_hat(oThisObject_arr)
            Iy_hat=Iy_hat@cArea(oThisObject_arr,[oThisObject_arr.z_bar]); %#ok<NODEF> 
        end
        
        function Iz_hat=Iz_hat(oThisObject_arr)
            Iz_hat=Iz_hat@cArea(oThisObject_arr,[oThisObject_arr.y_bar]); %#ok<NODEF> 
        end
        
        function Iyz_hat=Iyz_hat(oThisObject_arr)
            Iyz_hat=Iyz_hat@cArea(oThisObject_arr,[oThisObject_arr.y_bar],[oThisObject_arr.z_bar]); %#ok<NODEF> 
        end
    end
end