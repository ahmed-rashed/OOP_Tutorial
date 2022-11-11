classdef cArea_simple	 %The file-name must be the same as the class-name

    properties
        A   double {mustBeNonnegative}
        Iy(1,1)  double {mustBeNonnegative}=0
        Iz(1,1)  double {mustBeNonnegative}=0
        Iyz(1,1) double =0
    end

    methods
        function oThisObject=cArea_simple(A,Iy,Iz,Iyz)	% Constructor
            if nargin>=1
                oThisObject.A=A;
            end

            if nargin>=2
                oThisObject.Iy=Iy;
            end

            if nargin>=3
                oThisObject.Iz=Iz;
            end

            if nargin==4
                oThisObject.Iyz=Iyz;
            end
        end

        function Iy_hat=Iy_hat(oThisObject,z_hat)
            Iy_hat=oThisObject.Iy+oThisObject.A*z_hat.^2;
        end
        
        function Iz_hat=Iz_hat(oThisObject,y_hat)
            Iz_hat=oThisObject.Iz+oThisObject.A*y_hat.^2;
        end
        
        function Iyz_hat=Iyz_hat(oThisObject,y_hat,z_hat)
            Iyz_hat=oThisObject.Iyz+oThisObject.A*y_hat*z_hat;
        end
    end
end