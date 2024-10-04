classdef (Abstract) cMoreMethods_Abst

    methods
        function Ip_arr=Ip(oThisObject_arr)
            Ip_arr=reshape([oThisObject_arr.Iy]+[oThisObject_arr.Iz],size(oThisObject_arr)); %#ok<*MCNPN> 
        end

        function I34_arr=I34(oThisObject_arr)
            I34_arr=reshape(sqrt((([oThisObject_arr.Iy]-[oThisObject_arr.Iz])/2).^2+(-[oThisObject_arr.Iyz]).^2),size(oThisObject_arr));
        end

        function I3_arr=I3(oThisObject_arr)
            I3_arr=reshape(([oThisObject_arr.Iy]+[oThisObject_arr.Iz])/2,size(oThisObject_arr));
        end

        function I4_arr=I4(oThisObject_arr)
            I4_arr=oThisObject_arr.I3;
        end

        function I1_arr=I1(oThisObject_arr)
            I1_arr=oThisObject_arr.I3+oThisObject_arr.I34;
        end

        function I2_arr=I2(oThisObject_arr)
            I2_arr=oThisObject_arr.I3-oThisObject_arr.I34;
        end

        function alpha1_arr=alpha1(oThisObject_arr)
            alpha1_arr=reshape(atan2(-[oThisObject_arr.Iyz],([oThisObject_arr.Iy]-[oThisObject_arr.Iz])/2),size(oThisObject_arr))/2;
        end

        function alpha2_arr=alpha2(oThisObject_arr)
            alpha2_arr=oThisObject_arr.alpha1+pi/2;
        end

        function alpha3_arr=alpha3(oThisObject_arr)
            alpha3_arr=pi/4-oThisObject_arr.alpha1;
        end

        function alpha4_arr=alpha4(oThisObject_arr)
            alpha4_arr=oThisObject_arr.alpha3+pi/2;
        end

        function alpha1d_arr=alpha1d(oThisObject_arr)
            alpha1d_arr=rad2deg(oThisObject_arr.alpha1);
        end

        function alpha2d_arr=alpha2d(oThisObject_arr)
            alpha2d_arr=rad2deg(oThisObject_arr.alpha2);
        end

        function alpha3d_arr=alpha3d(oThisObject_arr)
            alpha3d_arr=rad2deg(oThisObject_arr.alpha3);
        end

        function alpha4d_arr=alpha4d(oThisObject_arr)
            alpha4d_arr=rad2deg(oThisObject_arr.alpha4);
        end

        function rho_y_arr=rho_y(oThisObject_arr)
            rho_y_arr=reshape(sqrt([oThisObject_arr.Iy]./[oThisObject_arr.A]),size(oThisObject_arr));
        end

        function rho_z_arr=rho_z(oThisObject_arr)
            rho_z_arr=reshape(sqrt([oThisObject_arr.Iz]./[oThisObject_arr.A]),size(oThisObject_arr));
        end

        function Sy_arr=Sy(oThisObject_arr,z_max_arr)
            if ~isscalar(z_max_arr) && any(size(oThisObject_arr)~=size(z_max_arr))
                error('z_max_arr must have the same size as oThisObject_arr, or be a scalar')
            end
            Sy_arr=reshape([oThisObject_arr.Iy]./abs(z_max_arr),size(oThisObject_arr));
        end

        function Sz_arr=Sz(oThisObject_arr,y_max_arr)
            if ~isscalar(y_max_arr) && any(size(oThisObject_arr)~=size(y_max_arr))
                error('y_max_arr must have the same size as oThisObject_arr, or be a scalar')
            end
            Sz_arr=reshape([oThisObject_arr.Iz]./abs(y_max_arr),size(oThisObject_arr));
        end

        function oNewArea_arr=rotateAxis(oThisObject_arr,alpha_rad_arr)
            % Positive alpha_rad_arr is counter clock wise
            if ~isscalar(alpha_rad_arr) && any(size(oThisObject_arr)~=size(alpha_rad_arr))
                error('alpha_rad_arr must have the same size as oThisObject_arr, or be a scalar')
            end

            oThisArea_arr_size=size(oThisObject_arr);
            dims_c=num2cell(oThisArea_arr_size);
            if isscalar(alpha_rad_arr)
                temp_cols=TransMatrix(alpha_rad_arr)*[[oThisObject_arr.Iy];[oThisObject_arr.Iz];-[oThisObject_arr.Iyz]];
                oNewArea_arr=reshape(cArea([oThisObject_arr.A],temp_cols(1,:),temp_cols(2,:),-temp_cols(3,:)),oThisArea_arr_size);
            else
                oNewArea_arr(dims_c{:})=cArea;
                for n=1:numel(oNewArea_arr)
                    temp_col=TransMatrix(alpha_rad_arr(n))*[oThisObject_arr(n).Iy;oThisObject_arr(n).Iz;-oThisObject_arr(n).Iyz];
                    oNewArea_arr(n)=cArea(oThisObject_arr(n).A,temp_col(1),temp_col(2),-temp_col(3));
                end
            end
        end

        function oNewArea_arr=rotateAxisd(oThisObject_arr,alpha_deg_arr)
            oNewArea_arr=oThisObject_arr.rotateAxis(deg2rad(alpha_deg_arr));
        end

        function oNewArea_arr=rotateArea(oThisObject_arr,alpha_rad_arr)
            % alpha_rad_arr is the rotation of the cross-section, which is the negative of the rotation of the axes
            % Positive alpha_rad_arr is counter clock wise
            oNewArea_arr=oThisObject_arr.rotateAxis(-alpha_rad_arr);
        end

        function oNewArea_arr=rotateAread(oThisObject_arr,alpha_deg_arr)
            oNewArea_arr=oThisObject_arr.rotateArea(deg2rad(alpha_deg_arr));
        end
    end
end