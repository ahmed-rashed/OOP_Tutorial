classdef cDistantArea_simple < cArea_simple   %The file-name must be the same as the class-name

    properties
        y_bar(1,1)  double
        z_bar(1,1)  double
    end

    methods
        function oThisObject=cDistantArea_simple(A,Iy,Iz,Iyz,y_bar,z_bar)	% Constructor
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
            oThisObject.y_bar=y_bar;
            oThisObject.z_bar=z_bar;
        end

        function Iy_hat=calc_Iy_hat(oThisObject)
            Iy_hat=calc_Iy_hat@cArea_simple(oThisObject,oThisObject.z_bar);
        end
        
        function Iz_hat=calc_Iz_hat(oThisObject)
            Iz_hat=calc_Iz_hat@cArea_simple(oThisObject,oThisObject.y_bar);
        end
        
        function Iyz_hat=calc_Iyz_hat(oThisObject)
            Iyz_hat=calc_Iyz_hat@cArea_simple(oThisObject,oThisObject.y_bar,oThisObject.z_bar);
        end
    end
end