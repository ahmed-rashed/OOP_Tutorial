classdef cCompositeArea	%The file-name must be the same as the class-name 

    properties
        oDistantArea_vec(1,:) cDistantArea   %row vector
    end

    methods
        % Constructor
        function oThisCompositeArea=cCompositeArea(A_vec,Iy_vec,Iz_vec,Iyz_vec,y_hat_vec,z_hat_vec)
            if nargin==6
                if ~isvector(A_vec),error('A_vec must be a vector');end
                A_vec_size=size(A_vec);
                if any(size(Iy_vec)~=A_vec_size),error('A_vec and Iy_vec must have the same size'),end
                if any(size(Iz_vec)~=A_vec_size),error('A_vec and Iz_vec must have the same size'),end
                if any(size(Iyz_vec)~=A_vec_size),error('A_vec and Iyz_vec must have the same size'),end
                if any(size(y_hat_vec)~=A_vec_size),error('A_vec and y_hat_vec must have the same size'),end
                if any(size(z_hat_vec)~=A_vec_size),error('A_vec and z_hat_vec must have the same size'),end

                %Assign class properties
                oThisCompositeArea.oDistantArea_vec=cDistantArea(A_vec,Iy_vec,Iz_vec,Iyz_vec,y_hat_vec,z_hat_vec);
            elseif nargin ~= 0
                error('This class can be constructed using zero or 6 inputs.');
            end
        end
                
        function A=A(oThisCompositeArea)
            A=sum([oThisCompositeArea.oDistantArea_vec.A]);
        end
        
        function Qy=Qy(oThisCompositeArea)
            Qy=sum([oThisCompositeArea.oDistantArea_vec.A].*[oThisCompositeArea.oDistantArea_vec.z_hat]);
        end
        
        function Qz=Qz(oThisCompositeArea)
            Qz=sum([oThisCompositeArea.oDistantArea_vec.A].*[oThisCompositeArea.oDistantArea_vec.y_hat]);
        end
        
        function y_bar=y_bar(oThisCompositeArea)
            y_bar=oThisCompositeArea.Qz/oThisCompositeArea.A;
        end
        
        function z_bar=z_bar(oThisCompositeArea)
            z_bar=oThisCompositeArea.Qy/oThisCompositeArea.A;
        end
        
        function Iy_hat=Iy_hat(oThisCompositeArea)
            Iy_hat=sum([oThisCompositeArea.oDistantArea_vec.Iy])+sum([oThisCompositeArea.oDistantArea_vec.A].*[oThisCompositeArea.oDistantArea_vec.z_hat].^2);
        end
        
        function Iz_hat=Iz_hat(oThisCompositeArea)
            Iz_hat=sum([oThisCompositeArea.oDistantArea_vec.Iz])+sum([oThisCompositeArea.oDistantArea_vec.A].*[oThisCompositeArea.oDistantArea_vec.y_hat].^2);
        end
        
        function Iyz_hat=Iyz_hat(oThisCompositeArea)
            Iyz_hat=sum([oThisCompositeArea.oDistantArea_vec.Iyz])+sum([oThisCompositeArea.oDistantArea_vec.A].*[oThisCompositeArea.oDistantArea_vec.y_hat].*[oThisCompositeArea.oDistantArea_vec.z_hat]);
        end
        
        function Iy=Iy(oThisCompositeArea)
            Iy=oThisCompositeArea.Iy_hat-oThisCompositeArea.A*oThisCompositeArea.z_bar.^2;
        end
        
        function Iz=Iz(oThisCompositeArea)
            Iz=oThisCompositeArea.Iz_hat-oThisCompositeArea.A*oThisCompositeArea.y_bar.^2;
        end
        
        function Iyz=Iyz(oThisCompositeArea)
            Iyz=oThisCompositeArea.Iyz_hat-oThisCompositeArea.A*oThisCompositeArea.y_bar*oThisCompositeArea.z_bar;
        end
    end    
end