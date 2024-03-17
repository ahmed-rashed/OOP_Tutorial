classdef cCmAr < cDistantArea	%The file-name must be the same as the class-name 

    properties
        oDistantArea_vec(1,:) cDistantArea   %row vector
    end

    methods
        % Constructor
        function oThisCompositeArea=cCmAr(A_vec,Iy_vec,Iz_vec,Iyz_vec,y_hat_vec,z_hat_vec)
            %Construct the superclass
            oThisCompositeArea@cDistantArea();

            if nargin==6
                if ~isvector(A_vec),error('A_vec must be a vector');end
                A_vec_size=size(A_vec);
                if any(size(Iy_vec)~=A_vec_size),error('A_vec and Iy_vec must have the same size'),end
                if any(size(Iz_vec)~=A_vec_size),error('A_vec and Iz_vec must have the same size'),end
                if any(size(Iyz_vec)~=A_vec_size),error('A_vec and Iyz_vec must have the same size'),end
                if any(size(y_hat_vec)~=A_vec_size),error('A_vec and y_hat_vec must have the same size'),end
                if any(size(z_hat_vec)~=A_vec_size),error('A_vec and z_hat_vec must have the same size'),end

                % Assign subclass properties
                oThisCompositeArea.oDistantArea_vec=cDistantArea(A_vec,Iy_vec,Iz_vec,Iyz_vec,y_hat_vec,z_hat_vec);  % Superclass properties depend on "oDistantArea_vec" subclass property

                % Modify superclass properties
                oThisCompositeArea.A=oThisCompositeArea.calc_A; % "A" must be assigned before "y_bar", "z_bar", "Iy", "Iz" & "Iyz"
                oThisCompositeArea.y_bar=oThisCompositeArea.calc_y_bar;  % "y_bar" must be assigned before "Iy", "Iz" & "Iyz"
                oThisCompositeArea.z_bar=oThisCompositeArea.calc_z_bar;  % "z_bar" must be assigned before "Iy", "Iz" & "Iyz"

                oThisCompositeArea.Iy=oThisCompositeArea.calc_Iy;
                oThisCompositeArea.Iz=oThisCompositeArea.calc_Iz;
                oThisCompositeArea.Iyz=oThisCompositeArea.calc_Iyz;
            elseif nargin ~= 0
                error('This class can be constructed using zero or 6 inputs.');
            end
        end

        function Qy_hat=calc_Qy_hat(oThisCompositeArea)
            Qy_hat=sum(calc_Qy_hat@cDistantArea(oThisCompositeArea.oDistantArea_vec));
        end
        
        function Qz_hat=calc_Qz_hat(oThisCompositeArea)
            Qz_hat=sum(calc_Qz_hat@cDistantArea(oThisCompositeArea.oDistantArea_vec));
        end
        
        function Iy_hat=calc_Iy_hat(oThisCompositeArea)
            Iy_hat=sum(calc_Iy_hat@cDistantArea(oThisCompositeArea.oDistantArea_vec));
        end
        
        function Iz_hat=calc_Iz_hat(oThisCompositeArea)
            Iz_hat=sum(calc_Iz_hat@cDistantArea(oThisCompositeArea.oDistantArea_vec));
        end
        
        function Iyz_hat=calc_Iyz_hat(oThisCompositeArea)
            Iyz_hat=sum(calc_Iyz_hat@cDistantArea(oThisCompositeArea.oDistantArea_vec));
        end
    end

    methods (Access=protected)
        function A=calc_A(oThisCompositeArea)
            A=sum([oThisCompositeArea.oDistantArea_vec.A]);
        end
        
        function y_bar=calc_y_bar(oThisCompositeArea)
            y_bar=oThisCompositeArea.calc_Qz_hat/oThisCompositeArea.A;
        end
        
        function z_bar=calc_z_bar(oThisCompositeArea)
            z_bar=oThisCompositeArea.calc_Qy_hat/oThisCompositeArea.A;
        end
        
        function Iy=calc_Iy(oThisCompositeArea)
            Iy=oThisCompositeArea.calc_Iy_hat-oThisCompositeArea.A*oThisCompositeArea.z_bar.^2;
        end
        
        function Iz=calc_Iz(oThisCompositeArea)
            Iz=oThisCompositeArea.calc_Iz_hat-oThisCompositeArea.A*oThisCompositeArea.y_bar.^2;
        end
        
        function Iyz=calc_Iyz(oThisCompositeArea)
            Iyz=oThisCompositeArea.calc_Iyz_hat-oThisCompositeArea.A*oThisCompositeArea.y_bar*oThisCompositeArea.z_bar;
        end
    end    
end
