classdef cCmAr < cDistantArea	%The file-name must be the same as the class-name

    properties
        oCentroidalSubAreas_vec(1,:) cDistantArea   %row vector
    end

    methods
        % Constructor
        function oThisCompositeArea=cCmAr(A_vec,y_hat_vec,z_hat_vec,Iy_vec,Iz_vec,Iyz_vec)
            %Construct the superclass
            oThisCompositeArea@cDistantArea();

            if nargin>=3 && nargin<=6
                if ~isvector(A_vec),error('A_vec must be a vector');end
                A_vec_size=size(A_vec);
                if any(size(Iy_vec)~=A_vec_size),error('A_vec and Iy_vec must have the same size'),end
                if any(size(Iz_vec)~=A_vec_size),error('A_vec and Iz_vec must have the same size'),end
                if any(size(Iyz_vec)~=A_vec_size),error('A_vec and Iyz_vec must have the same size'),end
                if any(size(y_hat_vec)~=A_vec_size),error('A_vec and y_hat_vec must have the same size'),end
                if any(size(z_hat_vec)~=A_vec_size),error('A_vec and z_hat_vec must have the same size'),end

                % Assign subclass properties
                oThisCompositeArea.oCentroidalSubAreas_vec=cDistantArea(A_vec,y_hat_vec,z_hat_vec,Iy_vec,Iz_vec,Iyz_vec);  % Superclass properties depend on "oCentroidalSubAreas_vec" subclass property

                % Correct superclass properties
                oThisCompositeArea.A=oThisCompositeArea.calc_A_initially; % "A" must be assigned before "y_bar", "z_bar", "Iy", "Iz" & "Iyz"
                oThisCompositeArea.y_bar=oThisCompositeArea.calc_y_bar_initially;  % "y_bar" must be assigned before "Iy", "Iz" & "Iyz"
                oThisCompositeArea.z_bar=oThisCompositeArea.calc_z_bar_initially;  % "z_bar" must be assigned before "Iy", "Iz" & "Iyz"

                y_cvec=num2cell(oThisCompositeArea.calc_y_initially);
                [oThisCompositeArea.oCentroidalSubAreas_vec.y_bar]=y_cvec{:};

                z_cvec=num2cell(oThisCompositeArea.calc_z_initially);
                [oThisCompositeArea.oCentroidalSubAreas_vec.z_bar]=z_cvec{:};

                oThisCompositeArea.Iy=oThisCompositeArea.calc_Iy_initially;
                oThisCompositeArea.Iz=oThisCompositeArea.calc_Iz_initially;
                oThisCompositeArea.Iyz=oThisCompositeArea.calc_Iyz_initially;
            elseif nargin ~= 0
                error('This class can be constructed using zero or from 3 to 6 inputs.');
            end
        end
    end

    methods (Access=protected)
        function y_bar=calc_y_bar_initially(oThisCompositeArea)
            y_bar=oThisCompositeArea.calc_Qz_hat_initially/oThisCompositeArea.A;
        end

        function z_bar=calc_z_bar_initially(oThisCompositeArea)
            z_bar=oThisCompositeArea.calc_Qy_hat_initially/oThisCompositeArea.A;
        end

        function y_row=calc_y_initially(oThisCompositeArea)
            y_row=[oThisCompositeArea.oCentroidalSubAreas_vec.y_bar]-oThisCompositeArea.y_bar;
        end

        function z_row=calc_z_initially(oThisCompositeArea)
            z_row=[oThisCompositeArea.oCentroidalSubAreas_vec.z_bar]-oThisCompositeArea.z_bar;
        end

        function Iyz=calc_Iyz_initially(oThisCompositeArea)
            Iyz=sum(oThisCompositeArea.oCentroidalSubAreas_vec.calc_Iyz_hat);
        end
    end

    methods (Access=private)
        function A=calc_A_initially(oThisCompositeArea)
            A=sum([oThisCompositeArea.oCentroidalSubAreas_vec.A]);
        end

        function Qy_hat=calc_Qy_hat_initially(oThisCompositeArea)
            Qy_hat=sum(oThisCompositeArea.oCentroidalSubAreas_vec.calc_Qy_hat);
        end

        function Qz_hat=calc_Qz_hat_initially(oThisCompositeArea)
            Qz_hat=sum(oThisCompositeArea.oCentroidalSubAreas_vec.calc_Qz_hat);
        end

        function Iy=calc_Iy_initially(oThisCompositeArea)
            Iy=sum(oThisCompositeArea.oCentroidalSubAreas_vec.calc_Iy_hat);
        end

        function Iz=calc_Iz_initially(oThisCompositeArea)
            Iz=sum(oThisCompositeArea.oCentroidalSubAreas_vec.calc_Iz_hat);
        end
    end
end