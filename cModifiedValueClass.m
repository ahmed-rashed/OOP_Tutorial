classdef cModifiedValueClass
	properties
		prop1
	end

	methods
		%Constructor
		function oThisClass=cModifiedValueClass(value)
			oThisClass.prop1=value;
		end

		function oThisClass=setProp1(oThisClass,value)
            if nargout<1
                warning('This method cannot modify the property. You must overwrite the parent class to modify the property!')
            end
			oThisClass.prop1=value;
		end
	end
end