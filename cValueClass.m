classdef cValueClass
	properties
		prop1
	end

	methods
		%Constructor
		function oThisClass=cValueClass(value)
			oThisClass.prop1=value;
		end

		%Method will not work as expected
		function setProp1(oThisClass,value)
			oThisClass.prop1=value;
		end
	end
end