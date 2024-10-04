classdef cSub < cSuper
   properties
      Prop=1
   end

   methods
      function p=subMethod(oThisObject)
         p=oThisObject.Prop;
      end
   end
end