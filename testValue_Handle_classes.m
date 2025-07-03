clc

%% Value class
oValueClass=cValueClass(5)
oValueClass.prop1=10
oValueClass.setProp1(7)
oValueClass.prop1

%% Handle class
oHandleClass=cHandleClass(5)
oHandleClass.prop1=10
oHandleClass.setProp1(7)
oHandleClass.prop1

%% Modified value class
oValueClass=cModifiedValueClass(5)
oValueClass.prop1=10
oValueClass.setProp1(7)
oValueClass.prop1
oValueClass=oValueClass.setProp1(7)
oValueClass.prop1