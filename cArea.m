classdef cArea  %The file-name must be the same as the class-name
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
                oThisObject_arr(dims_c{:})=oThisObject_arr; %Initialize the object array by assigning its last element

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

        function Iy_hat_arr=Iy_hat(oThisObject_arr,z_hat_arr)
            Iy_hat_arr=reshape([oThisObject_arr.Iy]+[oThisObject_arr.A].*z_hat_arr(:).'.^2,size(oThisObject_arr));
        end
        
        function Iz_hat_arr=Iz_hat(oThisObject_arr,y_bar)
            Iz_hat_arr=reshape([oThisObject_arr.Iz]+[oThisObject_arr.A].*y_bar(:).'.^2,size(oThisObject_arr));
        end
        
        function Iyz_hat_arr=Iyz_hat(oThisObject_arr,y_bar,z_bar)
            Iyz_hat_arr=reshape([oThisObject_arr.Iyz]+[oThisObject_arr.A].*y_bar(:).'.*z_bar(:).',size(oThisObject_arr));
        end
    end
end