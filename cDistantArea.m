classdef cDistantArea < cArea   %The file-name must be the same as the class-name
% Methods of this class can handle object arrays
    properties
        y_bar(1,1)  double
        z_bar(1,1)  double
    end

    methods
        % Constructor that can initialize object array
        function oThisObject_arr=cDistantArea(A_arr,y_bar_arr,z_bar_arr,varargin)
            if nargin==0    % This is needed to create array of this class
                superClassArgs={};
            elseif nargin>=3 && nargin<=6
                superClassArgs=[{A_arr},varargin(:).'];
            else
                error('This class can be constructed using zero or from 3 to 6 inputs!');
            end

            % Construct the superclass
            oThisObject_arr@cArea(superClassArgs{:});

            % Assign subclass properties
            if nargin~=0
                A_arr_size=size(A_arr);
                if any(size(y_bar_arr)~=A_arr_size),error('y_hat_arr and A_arr must have identical size.'),end
                y_hat_carr=num2cell(y_bar_arr);
                [oThisObject_arr.y_bar]=deal(y_hat_carr{:});

                if any(size(z_bar_arr)~=A_arr_size),error('z_hat_arr and A_arr must have identical size.'),end
                z_hat_carr=num2cell(z_bar_arr);
                [oThisObject_arr.z_bar]=deal(z_hat_carr{:});
            end
        end

        function Qy_hat_arr=calc_Qy_hat(oThisObject_arr)
            Qy_hat_arr=calc_Qy_hat@cArea(oThisObject_arr,[oThisObject_arr.z_bar]); %#ok<*NODEF> 
        end

        function Qz_hat_arr=calc_Qz_hat(oThisObject_arr)
            Qz_hat_arr=calc_Qz_hat@cArea(oThisObject_arr,[oThisObject_arr.y_bar]);
        end

        function Iy_hat_arr=calc_Iy_hat(oThisObject_arr)
            Iy_hat_arr=calc_Iy_hat@cArea(oThisObject_arr,[oThisObject_arr.z_bar]);
        end
        
        function Iz_hat_arr=calc_Iz_hat(oThisObject_arr)
            Iz_hat_arr=calc_Iz_hat@cArea(oThisObject_arr,[oThisObject_arr.y_bar]);
        end
        
        function Iyz_hat_arr=calc_Iyz_hat(oThisObject_arr)
            Iyz_hat_arr=calc_Iyz_hat@cArea(oThisObject_arr,[oThisObject_arr.y_bar],[oThisObject_arr.z_bar]);
        end
    end
end