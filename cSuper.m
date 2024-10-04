classdef cSuper
   properties(Access=private)
      Prop=2
   end

   methods
      function p=superMethod(oThisObject)
         p=oThisObject.Prop;
      end
   end
end