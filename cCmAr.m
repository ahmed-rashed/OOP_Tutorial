classdef cCmAr < cDistantArea	%The file-name must be the same as the class-name

    properties
        oCentroidalAreas_vec(1,:) cDistantArea   %row vector
    end

    methods
        % Constructor
        function oThisCmAr=cCmAr(A_vec,y_hat_vec,z_hat_vec,varargin)
            %Construct the superclass
            oThisCmAr@cDistantArea();

            if nargin>=3 && nargin<=6
                if ~isvector(A_vec),error('A_vec must be a vector');end
                A_vec_size=size(A_vec);

                if any(size(y_hat_vec)~=A_vec_size),error('A_vec and y_hat_vec must have the same size'),end
                if any(size(z_hat_vec)~=A_vec_size),error('A_vec and z_hat_vec must have the same size'),end

                varargin_names=["Iy_vec","Iz_vec","Iyz_vec"];
                for n=1:length(varargin)
                    if any(size(varargin{n})~=A_vec_size),error("A_vec and "+varargin_names(n)+' must have the same size'),end
                end

                % Assign subclass properties
                oThisCmAr.oCentroidalAreas_vec=cDistantArea(A_vec,y_hat_vec,z_hat_vec,varargin{:});  % Superclass properties depend on "oCentroidalAreas_vec" subclass property

                % Correct superclass properties
                oThisCmAr.A=oThisCmAr.calc_A_initially; % "A" must be assigned before "y_bar", "z_bar", "Iy", "Iz" & "Iyz"
                oThisCmAr.y_bar=oThisCmAr.calc_y_bar_initially;  % "y_bar" must be assigned before "Iy", "Iz" & "Iyz"
                oThisCmAr.z_bar=oThisCmAr.calc_z_bar_initially;  % "z_bar" must be assigned before "Iy", "Iz" & "Iyz"

                y_cvec=num2cell(oThisCmAr.calc_y_initially);
                [oThisCmAr.oCentroidalAreas_vec.y_bar]=y_cvec{:};

                z_cvec=num2cell(oThisCmAr.calc_z_initially);
                [oThisCmAr.oCentroidalAreas_vec.z_bar]=z_cvec{:};

                oThisCmAr.Iy=oThisCmAr.calc_Iy_initially;
                oThisCmAr.Iz=oThisCmAr.calc_Iz_initially;
                oThisCmAr.Iyz=oThisCmAr.calc_Iyz_initially;
            elseif nargin ~= 0
                error('This class can be constructed using zero or from 3 to 6 inputs.');
            end
        end
    end

    methods (Access=protected)
        function y_bar=calc_y_bar_initially(oThisCmAr)
            y_bar=oThisCmAr.calc_Qz_hat_initially/oThisCmAr.A;
        end

        function z_bar=calc_z_bar_initially(oThisCmAr)
            z_bar=oThisCmAr.calc_Qy_hat_initially/oThisCmAr.A;
        end

        function y_row=calc_y_initially(oThisCmAr)
            y_row=[oThisCmAr.oCentroidalAreas_vec.y_bar]-oThisCmAr.y_bar;
        end

        function z_row=calc_z_initially(oThisCmAr)
            z_row=[oThisCmAr.oCentroidalAreas_vec.z_bar]-oThisCmAr.z_bar;
        end

        function Iyz=calc_Iyz_initially(oThisCmAr)
            Iyz=sum(oThisCmAr.oCentroidalAreas_vec.calc_Iyz_hat.');
        end
    end

    methods (Access=private)
        function A=calc_A_initially(oThisCmAr)
            A=sum([oThisCmAr.oCentroidalAreas_vec.A]);
        end

        function Qy_hat=calc_Qy_hat_initially(oThisCmAr)
            Qy_hat=sum(oThisCmAr.oCentroidalAreas_vec.calc_Qy_hat);
        end

        function Qz_hat=calc_Qz_hat_initially(oThisCmAr)
            Qz_hat=sum(oThisCmAr.oCentroidalAreas_vec.calc_Qz_hat);
        end

        function Iy=calc_Iy_initially(oThisCmAr)
            Iy=sum(oThisCmAr.oCentroidalAreas_vec.calc_Iy_hat.');
        end

        function Iz=calc_Iz_initially(oThisCmAr)
            Iz=sum(oThisCmAr.oCentroidalAreas_vec.calc_Iy_hat.');
        end
    end
end