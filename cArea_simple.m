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

        function Iy_hat=calc_Iy_hat(oThisObject,z_bar)
            Iy_hat=oThisObject.Iy+oThisObject.A*z_bar.^2;
        end
        
        function Iz_hat=calc_Iz_hat(oThisObject,y_bar)
            Iz_hat=oThisObject.Iz+oThisObject.A*y_bar.^2;
        end
        
        function Iyz_hat=calc_Iyz_hat(oThisObject,y_bar,z_bar)
            Iyz_hat=oThisObject.Iyz+oThisObject.A*y_bar*z_bar;
        end
    end
end