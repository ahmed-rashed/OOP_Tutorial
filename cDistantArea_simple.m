classdef cDistantArea_simple < cArea_simple   %The file-name must be the same as the class-name

    properties
        y_hat(1,1)  double
        z_hat(1,1)  double
    end

    methods
        function oThisObject=cDistantArea_simple(A,Iy,Iz,Iyz,y_hat,z_hat)	% Constructor
            if nargin==0
                superClassArgs={};
            elseif nargin==6
                superClassArgs={A,Iy,Iz,Iyz};
            else
                error('This class can be constructed using zero or 6 inputs.');
            end

            %Construct the superclass
            oThisObject@cArea_simple(superClassArgs{:});
            
            %Construct the subclass
            oThisObject.y_hat=y_hat;
            oThisObject.z_hat=z_hat;
        end

        function Iy_hat=Iy_hat(oThisObject)
            Iy_hat=Iy_hat@cArea_simple(oThisObject,oThisObject.z_hat); %#ok<NODEF> 
        end
        
        function Iz_hat=Iz_hat(oThisObject)
            Iz_hat=Iz_hat@cArea_simple(oThisObject,oThisObject.y_hat); %#ok<NODEF> 
        end
        
        function Iyz_hat=Iyz_hat(oThisObject)
            Iyz_hat=Iyz_hat@cArea_simple(oThisObject,oThisObject.y_hat,oThisObject.z_hat); %#ok<NODEF> 
        end
    end
end