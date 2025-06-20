classdef cHandleClass < handle
	properties
		prop1
	end

	methods
		%Constructor
		function oThisClass=cHandleClass(value)
			oThisClass.prop1=value;
		end

        %Method works as expected
		function setProp1(oThisClass,value)
			oThisClass.prop1=value;
		end
	end
end