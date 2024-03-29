classdef cArea < cMoreMethods_Abst  %The file-name must be the same as the class-name
%Methods of this class can handle object arrays
    properties
        A(1,1)   double {mustBeNonnegative}
        Iy(1,1)  double {mustBeNonnegative}=0
        Iz(1,1)  double {mustBeNonnegative}=0
        Iyz(1,1) double =0
    end

    methods
        % Constructor that can initialize object array
        function oThisObject_arr=cArea(A_arr,Iy_arr,Iz_arr,Iyz_arr)
            if nargin>=1
                A_arr_size=size(A_arr);
                dims_c=num2cell(A_arr_size);
                oThisObject_arr=repelem(oThisObject_arr,dims_c{:});  %Initialize the object array

                N=numel(A_arr);
                for n=1:N
                    oThisObject_arr(n).A=A_arr(n);
                end
%                 % Or alternatively
%                 A_carr=num2cell(A_arr);
%                 [oThisObject_arr.A]=deal(A_carr{:});
            end

            if nargin>=2
                if any(size(Iy_arr)~=A_arr_size),error('Iy_arr and A_arr must have identical size.'),end
                for n=1:N
                    oThisObject_arr(n).Iy=Iy_arr(n); %#ok<AGROW>
                end
            end

            if nargin>=3
                if any(size(Iz_arr)~=A_arr_size),error('Iz_arr and A_arr must have identical size.'),end
                for n=1:N
                    oThisObject_arr(n).Iz=Iz_arr(n); %#ok<AGROW>
                end
            end

            if nargin==4
                if any(size(Iyz_arr)~=A_arr_size),error('Iyz_arr and A_arr must have identical size.'),end
                for n=1:N
                    oThisObject_arr(n).Iyz=Iyz_arr(n); %#ok<AGROW>
                end
            end
        end

        function Qy_hat_arr=calc_Qy_hat(oThisObject_arr,z_bar_arr)
            Qy_hat_arr=reshape([oThisObject_arr.A].*z_bar_arr(:).',size(oThisObject_arr));
        end
        
        function Qz_hat_arr=calc_Qz_hat(oThisObject_arr,y_bar_arr)
            Qz_hat_arr=reshape([oThisObject_arr.A].*y_bar_arr(:).',size(oThisObject_arr));
        end
        
        function Iy_hat_arr=calc_Iy_hat(oThisObject_arr,z_bar_arr)
            Iy_hat_arr=reshape([oThisObject_arr.Iy]+[oThisObject_arr.A].*z_bar_arr(:).'.^2,size(oThisObject_arr));
        end
        
        function Iz_hat_arr=calc_Iz_hat(oThisObject_arr,y_bar_arr)
            Iz_hat_arr=reshape([oThisObject_arr.Iz]+[oThisObject_arr.A].*y_bar_arr(:).'.^2,size(oThisObject_arr));
        end
        
        function Iyz_hat_arr=calc_Iyz_hat(oThisObject_arr,y_bar_arr,z_bar_arr)
            Iyz_hat_arr=reshape([oThisObject_arr.Iyz]+[oThisObject_arr.A].*y_bar_arr(:).'.*z_bar_arr(:).',size(oThisObject_arr));
        end
    end
end