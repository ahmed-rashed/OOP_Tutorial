classdef cValueClass
	properties
		prop1
	end

	methods
		%Constructor
		function oThisClass=cValueClass(value)
			oThisClass.prop1=value;
		end

		%This method will not work as expected
		function setProp1(oThisClass,value)
			oThisClass.prop1=value;
		end
	end
end