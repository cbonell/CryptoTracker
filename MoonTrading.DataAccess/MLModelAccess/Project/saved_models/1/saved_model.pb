??"
??
D
AddV2
x"T
y"T
z"T"
Ttype:
2	??
B
AssignVariableOp
resource
value"dtype"
dtypetype?
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
.
Identity

input"T
output"T"	
Ttype
:
Less
x"T
y"T
z
"
Ttype:
2	
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?
?
Mul
x"T
y"T
z"T"
Ttype:
2	?

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype?
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
?
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ?
@
StaticRegexFullMatch	
input

output
"
patternstring
?
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
-
Tanh
x"T
y"T"
Ttype:

2
?
TensorListFromTensor
tensor"element_dtype
element_shape"
shape_type*
output_handle??element_dtype"
element_dtypetype"

shape_typetype:
2	
?
TensorListReserve
element_shape"
shape_type
num_elements#
handle??element_dtype"
element_dtypetype"

shape_typetype:
2	
?
TensorListStack
input_handle
element_shape
tensor"element_dtype"
element_dtypetype" 
num_elementsint?????????
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
?
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ?
?
While

input2T
output2T"
T
list(type)("
condfunc"
bodyfunc" 
output_shapeslist(shape)
 "
parallel_iterationsint
?"serve*2.6.02v2.6.0-rc2-32-g919f693420e8??!
?
output_layer/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>*$
shared_nameoutput_layer/kernel
{
'output_layer/kernel/Read/ReadVariableOpReadVariableOpoutput_layer/kernel*
_output_shapes

:>*
dtype0
z
output_layer/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*"
shared_nameoutput_layer/bias
s
%output_layer/bias/Read/ReadVariableOpReadVariableOpoutput_layer/bias*
_output_shapes
:*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
?
rnn_1/simple_rnn_cell_8/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>*/
shared_name rnn_1/simple_rnn_cell_8/kernel
?
2rnn_1/simple_rnn_cell_8/kernel/Read/ReadVariableOpReadVariableOprnn_1/simple_rnn_cell_8/kernel*
_output_shapes

:>*
dtype0
?
(rnn_1/simple_rnn_cell_8/recurrent_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>>*9
shared_name*(rnn_1/simple_rnn_cell_8/recurrent_kernel
?
<rnn_1/simple_rnn_cell_8/recurrent_kernel/Read/ReadVariableOpReadVariableOp(rnn_1/simple_rnn_cell_8/recurrent_kernel*
_output_shapes

:>>*
dtype0
?
rnn_1/simple_rnn_cell_8/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:>*-
shared_namernn_1/simple_rnn_cell_8/bias
?
0rnn_1/simple_rnn_cell_8/bias/Read/ReadVariableOpReadVariableOprnn_1/simple_rnn_cell_8/bias*
_output_shapes
:>*
dtype0
?
rnn_2/simple_rnn_cell_9/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>>*/
shared_name rnn_2/simple_rnn_cell_9/kernel
?
2rnn_2/simple_rnn_cell_9/kernel/Read/ReadVariableOpReadVariableOprnn_2/simple_rnn_cell_9/kernel*
_output_shapes

:>>*
dtype0
?
(rnn_2/simple_rnn_cell_9/recurrent_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>>*9
shared_name*(rnn_2/simple_rnn_cell_9/recurrent_kernel
?
<rnn_2/simple_rnn_cell_9/recurrent_kernel/Read/ReadVariableOpReadVariableOp(rnn_2/simple_rnn_cell_9/recurrent_kernel*
_output_shapes

:>>*
dtype0
?
rnn_2/simple_rnn_cell_9/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:>*-
shared_namernn_2/simple_rnn_cell_9/bias
?
0rnn_2/simple_rnn_cell_9/bias/Read/ReadVariableOpReadVariableOprnn_2/simple_rnn_cell_9/bias*
_output_shapes
:>*
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
?
Adam/output_layer/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>*+
shared_nameAdam/output_layer/kernel/m
?
.Adam/output_layer/kernel/m/Read/ReadVariableOpReadVariableOpAdam/output_layer/kernel/m*
_output_shapes

:>*
dtype0
?
Adam/output_layer/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*)
shared_nameAdam/output_layer/bias/m
?
,Adam/output_layer/bias/m/Read/ReadVariableOpReadVariableOpAdam/output_layer/bias/m*
_output_shapes
:*
dtype0
?
%Adam/rnn_1/simple_rnn_cell_8/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>*6
shared_name'%Adam/rnn_1/simple_rnn_cell_8/kernel/m
?
9Adam/rnn_1/simple_rnn_cell_8/kernel/m/Read/ReadVariableOpReadVariableOp%Adam/rnn_1/simple_rnn_cell_8/kernel/m*
_output_shapes

:>*
dtype0
?
/Adam/rnn_1/simple_rnn_cell_8/recurrent_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>>*@
shared_name1/Adam/rnn_1/simple_rnn_cell_8/recurrent_kernel/m
?
CAdam/rnn_1/simple_rnn_cell_8/recurrent_kernel/m/Read/ReadVariableOpReadVariableOp/Adam/rnn_1/simple_rnn_cell_8/recurrent_kernel/m*
_output_shapes

:>>*
dtype0
?
#Adam/rnn_1/simple_rnn_cell_8/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:>*4
shared_name%#Adam/rnn_1/simple_rnn_cell_8/bias/m
?
7Adam/rnn_1/simple_rnn_cell_8/bias/m/Read/ReadVariableOpReadVariableOp#Adam/rnn_1/simple_rnn_cell_8/bias/m*
_output_shapes
:>*
dtype0
?
%Adam/rnn_2/simple_rnn_cell_9/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>>*6
shared_name'%Adam/rnn_2/simple_rnn_cell_9/kernel/m
?
9Adam/rnn_2/simple_rnn_cell_9/kernel/m/Read/ReadVariableOpReadVariableOp%Adam/rnn_2/simple_rnn_cell_9/kernel/m*
_output_shapes

:>>*
dtype0
?
/Adam/rnn_2/simple_rnn_cell_9/recurrent_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>>*@
shared_name1/Adam/rnn_2/simple_rnn_cell_9/recurrent_kernel/m
?
CAdam/rnn_2/simple_rnn_cell_9/recurrent_kernel/m/Read/ReadVariableOpReadVariableOp/Adam/rnn_2/simple_rnn_cell_9/recurrent_kernel/m*
_output_shapes

:>>*
dtype0
?
#Adam/rnn_2/simple_rnn_cell_9/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:>*4
shared_name%#Adam/rnn_2/simple_rnn_cell_9/bias/m
?
7Adam/rnn_2/simple_rnn_cell_9/bias/m/Read/ReadVariableOpReadVariableOp#Adam/rnn_2/simple_rnn_cell_9/bias/m*
_output_shapes
:>*
dtype0
?
Adam/output_layer/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>*+
shared_nameAdam/output_layer/kernel/v
?
.Adam/output_layer/kernel/v/Read/ReadVariableOpReadVariableOpAdam/output_layer/kernel/v*
_output_shapes

:>*
dtype0
?
Adam/output_layer/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*)
shared_nameAdam/output_layer/bias/v
?
,Adam/output_layer/bias/v/Read/ReadVariableOpReadVariableOpAdam/output_layer/bias/v*
_output_shapes
:*
dtype0
?
%Adam/rnn_1/simple_rnn_cell_8/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>*6
shared_name'%Adam/rnn_1/simple_rnn_cell_8/kernel/v
?
9Adam/rnn_1/simple_rnn_cell_8/kernel/v/Read/ReadVariableOpReadVariableOp%Adam/rnn_1/simple_rnn_cell_8/kernel/v*
_output_shapes

:>*
dtype0
?
/Adam/rnn_1/simple_rnn_cell_8/recurrent_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>>*@
shared_name1/Adam/rnn_1/simple_rnn_cell_8/recurrent_kernel/v
?
CAdam/rnn_1/simple_rnn_cell_8/recurrent_kernel/v/Read/ReadVariableOpReadVariableOp/Adam/rnn_1/simple_rnn_cell_8/recurrent_kernel/v*
_output_shapes

:>>*
dtype0
?
#Adam/rnn_1/simple_rnn_cell_8/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:>*4
shared_name%#Adam/rnn_1/simple_rnn_cell_8/bias/v
?
7Adam/rnn_1/simple_rnn_cell_8/bias/v/Read/ReadVariableOpReadVariableOp#Adam/rnn_1/simple_rnn_cell_8/bias/v*
_output_shapes
:>*
dtype0
?
%Adam/rnn_2/simple_rnn_cell_9/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>>*6
shared_name'%Adam/rnn_2/simple_rnn_cell_9/kernel/v
?
9Adam/rnn_2/simple_rnn_cell_9/kernel/v/Read/ReadVariableOpReadVariableOp%Adam/rnn_2/simple_rnn_cell_9/kernel/v*
_output_shapes

:>>*
dtype0
?
/Adam/rnn_2/simple_rnn_cell_9/recurrent_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:>>*@
shared_name1/Adam/rnn_2/simple_rnn_cell_9/recurrent_kernel/v
?
CAdam/rnn_2/simple_rnn_cell_9/recurrent_kernel/v/Read/ReadVariableOpReadVariableOp/Adam/rnn_2/simple_rnn_cell_9/recurrent_kernel/v*
_output_shapes

:>>*
dtype0
?
#Adam/rnn_2/simple_rnn_cell_9/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:>*4
shared_name%#Adam/rnn_2/simple_rnn_cell_9/bias/v
?
7Adam/rnn_2/simple_rnn_cell_9/bias/v/Read/ReadVariableOpReadVariableOp#Adam/rnn_2/simple_rnn_cell_9/bias/v*
_output_shapes
:>*
dtype0

NoOpNoOp
?2
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*?1
value?1B?1 B?1
?
layer_with_weights-0
layer-0
layer_with_weights-1
layer-1
layer_with_weights-2
layer-2
	optimizer
	variables
regularization_losses
trainable_variables
	keras_api
	
signatures
l

cell

state_spec
	variables
regularization_losses
trainable_variables
	keras_api
l
cell

state_spec
	variables
regularization_losses
trainable_variables
	keras_api
h

kernel
bias
	variables
regularization_losses
trainable_variables
	keras_api
?
iter

beta_1

beta_2
	decay
 learning_ratemZm[!m\"m]#m^$m_%m`&mavbvc!vd"ve#vf$vg%vh&vi
8
!0
"1
#2
$3
%4
&5
6
7
 
8
!0
"1
#2
$3
%4
&5
6
7
?
	variables
regularization_losses
'metrics

(layers
)non_trainable_variables
*layer_regularization_losses
+layer_metrics
trainable_variables
 
~

!kernel
"recurrent_kernel
#bias
,	variables
-regularization_losses
.trainable_variables
/	keras_api
 

!0
"1
#2
 

!0
"1
#2
?
	variables

0states
regularization_losses
1metrics

2layers
3non_trainable_variables
4layer_regularization_losses
5layer_metrics
trainable_variables
~

$kernel
%recurrent_kernel
&bias
6	variables
7regularization_losses
8trainable_variables
9	keras_api
 

$0
%1
&2
 

$0
%1
&2
?
	variables

:states
regularization_losses
;metrics

<layers
=non_trainable_variables
>layer_regularization_losses
?layer_metrics
trainable_variables
_]
VARIABLE_VALUEoutput_layer/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE
[Y
VARIABLE_VALUEoutput_layer/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1
 

0
1
?
	variables
regularization_losses
@metrics

Alayers
Bnon_trainable_variables
Clayer_regularization_losses
Dlayer_metrics
trainable_variables
HF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUErnn_1/simple_rnn_cell_8/kernel&variables/0/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUE(rnn_1/simple_rnn_cell_8/recurrent_kernel&variables/1/.ATTRIBUTES/VARIABLE_VALUE
XV
VARIABLE_VALUErnn_1/simple_rnn_cell_8/bias&variables/2/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUErnn_2/simple_rnn_cell_9/kernel&variables/3/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUE(rnn_2/simple_rnn_cell_9/recurrent_kernel&variables/4/.ATTRIBUTES/VARIABLE_VALUE
XV
VARIABLE_VALUErnn_2/simple_rnn_cell_9/bias&variables/5/.ATTRIBUTES/VARIABLE_VALUE

E0
F1

0
1
2
 
 
 

!0
"1
#2
 

!0
"1
#2
?
,	variables
-regularization_losses
Gmetrics

Hlayers
Inon_trainable_variables
Jlayer_regularization_losses
Klayer_metrics
.trainable_variables
 
 


0
 
 
 

$0
%1
&2
 

$0
%1
&2
?
6	variables
7regularization_losses
Lmetrics

Mlayers
Nnon_trainable_variables
Olayer_regularization_losses
Player_metrics
8trainable_variables
 
 

0
 
 
 
 
 
 
 
 
4
	Qtotal
	Rcount
S	variables
T	keras_api
D
	Utotal
	Vcount
W
_fn_kwargs
X	variables
Y	keras_api
 
 
 
 
 
 
 
 
 
 
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

Q0
R1

S	variables
QO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE
 

U0
V1

X	variables
??
VARIABLE_VALUEAdam/output_layer/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/output_layer/bias/mPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUE%Adam/rnn_1/simple_rnn_cell_8/kernel/mBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE/Adam/rnn_1/simple_rnn_cell_8/recurrent_kernel/mBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUE#Adam/rnn_1/simple_rnn_cell_8/bias/mBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUE%Adam/rnn_2/simple_rnn_cell_9/kernel/mBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE/Adam/rnn_2/simple_rnn_cell_9/recurrent_kernel/mBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUE#Adam/rnn_2/simple_rnn_cell_9/bias/mBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUEAdam/output_layer/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/output_layer/bias/vPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUE%Adam/rnn_1/simple_rnn_cell_8/kernel/vBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE/Adam/rnn_1/simple_rnn_cell_8/recurrent_kernel/vBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUE#Adam/rnn_1/simple_rnn_cell_8/bias/vBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUE%Adam/rnn_2/simple_rnn_cell_9/kernel/vBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE/Adam/rnn_2/simple_rnn_cell_9/recurrent_kernel/vBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUE#Adam/rnn_2/simple_rnn_cell_9/bias/vBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
?
serving_default_input_layerPlaceholder*+
_output_shapes
:?????????*
dtype0* 
shape:?????????
?
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_layerrnn_1/simple_rnn_cell_8/kernelrnn_1/simple_rnn_cell_8/bias(rnn_1/simple_rnn_cell_8/recurrent_kernelrnn_2/simple_rnn_cell_9/kernelrnn_2/simple_rnn_cell_9/bias(rnn_2/simple_rnn_cell_9/recurrent_kerneloutput_layer/kerneloutput_layer/bias*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8? *,
f'R%
#__inference_signature_wrapper_21747
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
?
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename'output_layer/kernel/Read/ReadVariableOp%output_layer/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOp2rnn_1/simple_rnn_cell_8/kernel/Read/ReadVariableOp<rnn_1/simple_rnn_cell_8/recurrent_kernel/Read/ReadVariableOp0rnn_1/simple_rnn_cell_8/bias/Read/ReadVariableOp2rnn_2/simple_rnn_cell_9/kernel/Read/ReadVariableOp<rnn_2/simple_rnn_cell_9/recurrent_kernel/Read/ReadVariableOp0rnn_2/simple_rnn_cell_9/bias/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOp.Adam/output_layer/kernel/m/Read/ReadVariableOp,Adam/output_layer/bias/m/Read/ReadVariableOp9Adam/rnn_1/simple_rnn_cell_8/kernel/m/Read/ReadVariableOpCAdam/rnn_1/simple_rnn_cell_8/recurrent_kernel/m/Read/ReadVariableOp7Adam/rnn_1/simple_rnn_cell_8/bias/m/Read/ReadVariableOp9Adam/rnn_2/simple_rnn_cell_9/kernel/m/Read/ReadVariableOpCAdam/rnn_2/simple_rnn_cell_9/recurrent_kernel/m/Read/ReadVariableOp7Adam/rnn_2/simple_rnn_cell_9/bias/m/Read/ReadVariableOp.Adam/output_layer/kernel/v/Read/ReadVariableOp,Adam/output_layer/bias/v/Read/ReadVariableOp9Adam/rnn_1/simple_rnn_cell_8/kernel/v/Read/ReadVariableOpCAdam/rnn_1/simple_rnn_cell_8/recurrent_kernel/v/Read/ReadVariableOp7Adam/rnn_1/simple_rnn_cell_8/bias/v/Read/ReadVariableOp9Adam/rnn_2/simple_rnn_cell_9/kernel/v/Read/ReadVariableOpCAdam/rnn_2/simple_rnn_cell_9/recurrent_kernel/v/Read/ReadVariableOp7Adam/rnn_2/simple_rnn_cell_9/bias/v/Read/ReadVariableOpConst*.
Tin'
%2#	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *'
f"R 
__inference__traced_save_23714
?	
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameoutput_layer/kerneloutput_layer/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_raternn_1/simple_rnn_cell_8/kernel(rnn_1/simple_rnn_cell_8/recurrent_kernelrnn_1/simple_rnn_cell_8/biasrnn_2/simple_rnn_cell_9/kernel(rnn_2/simple_rnn_cell_9/recurrent_kernelrnn_2/simple_rnn_cell_9/biastotalcounttotal_1count_1Adam/output_layer/kernel/mAdam/output_layer/bias/m%Adam/rnn_1/simple_rnn_cell_8/kernel/m/Adam/rnn_1/simple_rnn_cell_8/recurrent_kernel/m#Adam/rnn_1/simple_rnn_cell_8/bias/m%Adam/rnn_2/simple_rnn_cell_9/kernel/m/Adam/rnn_2/simple_rnn_cell_9/recurrent_kernel/m#Adam/rnn_2/simple_rnn_cell_9/bias/mAdam/output_layer/kernel/vAdam/output_layer/bias/v%Adam/rnn_1/simple_rnn_cell_8/kernel/v/Adam/rnn_1/simple_rnn_cell_8/recurrent_kernel/v#Adam/rnn_1/simple_rnn_cell_8/bias/v%Adam/rnn_2/simple_rnn_cell_9/kernel/v/Adam/rnn_2/simple_rnn_cell_9/recurrent_kernel/v#Adam/rnn_2/simple_rnn_cell_9/bias/v*-
Tin&
$2"*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? **
f%R#
!__inference__traced_restore_23823?? 
?
?
L__inference_simple_rnn_cell_9_layer_call_and_return_conditional_losses_20469

inputs

states0
matmul_readvariableop_resource:>>-
biasadd_readvariableop_resource:>2
 matmul_1_readvariableop_resource:>>
identity

identity_1??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOpX
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:2
ones_like/Shapeg
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2
ones_like/Const?
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2
	ones_like_
mulMulinputsones_like:output:0*
T0*'
_output_shapes
:?????????>2
mul?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:>>*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulmul:z:0MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:>*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2	
BiasAdd?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02
MatMul_1/ReadVariableOpy
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2

MatMul_1k
addAddV2BiasAdd:output:0MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
addO
TanhTanhadd:z:0*
T0*'
_output_shapes
:?????????>2
Tanhc
IdentityIdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identityg

Identity_1IdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity_1?
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:?????????>:?????????>: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????>
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????>
 
_user_specified_namestates
?
?
while_cond_20667
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_20667___redundant_placeholder03
/while_while_cond_20667___redundant_placeholder13
/while_while_cond_20667___redundant_placeholder23
/while_while_cond_20667___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?
?
while_cond_20481
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_20481___redundant_placeholder03
/while_while_cond_20481___redundant_placeholder13
/while_while_cond_20481___redundant_placeholder23
/while_while_cond_20481___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?Z
?
@__inference_rnn_1_layer_call_and_return_conditional_losses_22817

inputsB
0simple_rnn_cell_8_matmul_readvariableop_resource:>?
1simple_rnn_cell_8_biasadd_readvariableop_resource:>D
2simple_rnn_cell_8_matmul_1_readvariableop_resource:>>
identity??(simple_rnn_cell_8/BiasAdd/ReadVariableOp?'simple_rnn_cell_8/MatMul/ReadVariableOp?)simple_rnn_cell_8/MatMul_1/ReadVariableOp?whileD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/permz
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:?????????2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????*
shrink_axis_mask2
strided_slice_2?
!simple_rnn_cell_8/ones_like/ShapeShapestrided_slice_2:output:0*
T0*
_output_shapes
:2#
!simple_rnn_cell_8/ones_like/Shape?
!simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2#
!simple_rnn_cell_8/ones_like/Const?
simple_rnn_cell_8/ones_likeFill*simple_rnn_cell_8/ones_like/Shape:output:0*simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/ones_like?
simple_rnn_cell_8/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2!
simple_rnn_cell_8/dropout/Const?
simple_rnn_cell_8/dropout/MulMul$simple_rnn_cell_8/ones_like:output:0(simple_rnn_cell_8/dropout/Const:output:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/dropout/Mul?
simple_rnn_cell_8/dropout/ShapeShape$simple_rnn_cell_8/ones_like:output:0*
T0*
_output_shapes
:2!
simple_rnn_cell_8/dropout/Shape?
6simple_rnn_cell_8/dropout/random_uniform/RandomUniformRandomUniform(simple_rnn_cell_8/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????*
dtype0*

seed4*
seed2???28
6simple_rnn_cell_8/dropout/random_uniform/RandomUniform?
(simple_rnn_cell_8/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???2*
(simple_rnn_cell_8/dropout/GreaterEqual/y?
&simple_rnn_cell_8/dropout/GreaterEqualGreaterEqual?simple_rnn_cell_8/dropout/random_uniform/RandomUniform:output:01simple_rnn_cell_8/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????2(
&simple_rnn_cell_8/dropout/GreaterEqual?
simple_rnn_cell_8/dropout/CastCast*simple_rnn_cell_8/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????2 
simple_rnn_cell_8/dropout/Cast?
simple_rnn_cell_8/dropout/Mul_1Mul!simple_rnn_cell_8/dropout/Mul:z:0"simple_rnn_cell_8/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????2!
simple_rnn_cell_8/dropout/Mul_1?
simple_rnn_cell_8/mulMulstrided_slice_2:output:0#simple_rnn_cell_8/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/mul?
'simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp0simple_rnn_cell_8_matmul_readvariableop_resource*
_output_shapes

:>*
dtype02)
'simple_rnn_cell_8/MatMul/ReadVariableOp?
simple_rnn_cell_8/MatMulMatMulsimple_rnn_cell_8/mul:z:0/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/MatMul?
(simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp1simple_rnn_cell_8_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype02*
(simple_rnn_cell_8/BiasAdd/ReadVariableOp?
simple_rnn_cell_8/BiasAddBiasAdd"simple_rnn_cell_8/MatMul:product:00simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/BiasAdd?
)simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp2simple_rnn_cell_8_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02+
)simple_rnn_cell_8/MatMul_1/ReadVariableOp?
simple_rnn_cell_8/MatMul_1MatMulzeros:output:01simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/MatMul_1?
simple_rnn_cell_8/addAddV2"simple_rnn_cell_8/BiasAdd:output:0$simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/add?
simple_rnn_cell_8/TanhTanhsimple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/Tanh?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:00simple_rnn_cell_8_matmul_readvariableop_resource1simple_rnn_cell_8_biasadd_readvariableop_resource2simple_rnn_cell_8_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_22739*
condR
while_cond_22738*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:?????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*+
_output_shapes
:?????????>2
transpose_1n
IdentityIdentitytranspose_1:y:0^NoOp*
T0*+
_output_shapes
:?????????>2

Identity?
NoOpNoOp)^simple_rnn_cell_8/BiasAdd/ReadVariableOp(^simple_rnn_cell_8/MatMul/ReadVariableOp*^simple_rnn_cell_8/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????: : : 2T
(simple_rnn_cell_8/BiasAdd/ReadVariableOp(simple_rnn_cell_8/BiasAdd/ReadVariableOp2R
'simple_rnn_cell_8/MatMul/ReadVariableOp'simple_rnn_cell_8/MatMul/ReadVariableOp2V
)simple_rnn_cell_8/MatMul_1/ReadVariableOp)simple_rnn_cell_8/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:?????????
 
_user_specified_nameinputs
?7
?
while_body_22611
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0J
8while_simple_rnn_cell_8_matmul_readvariableop_resource_0:>G
9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0:>L
:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorH
6while_simple_rnn_cell_8_matmul_readvariableop_resource:>E
7while_simple_rnn_cell_8_biasadd_readvariableop_resource:>J
8while_simple_rnn_cell_8_matmul_1_readvariableop_resource:>>??.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?-while/simple_rnn_cell_8/MatMul/ReadVariableOp?/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/simple_rnn_cell_8/ones_like/ShapeShape0while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2)
'while/simple_rnn_cell_8/ones_like/Shape?
'while/simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'while/simple_rnn_cell_8/ones_like/Const?
!while/simple_rnn_cell_8/ones_likeFill0while/simple_rnn_cell_8/ones_like/Shape:output:00while/simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2#
!while/simple_rnn_cell_8/ones_like?
while/simple_rnn_cell_8/mulMul0while/TensorArrayV2Read/TensorListGetItem:item:0*while/simple_rnn_cell_8/ones_like:output:0*
T0*'
_output_shapes
:?????????2
while/simple_rnn_cell_8/mul?
-while/simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp8while_simple_rnn_cell_8_matmul_readvariableop_resource_0*
_output_shapes

:>*
dtype02/
-while/simple_rnn_cell_8/MatMul/ReadVariableOp?
while/simple_rnn_cell_8/MatMulMatMulwhile/simple_rnn_cell_8/mul:z:05while/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
while/simple_rnn_cell_8/MatMul?
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype020
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?
while/simple_rnn_cell_8/BiasAddBiasAdd(while/simple_rnn_cell_8/MatMul:product:06while/simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
while/simple_rnn_cell_8/BiasAdd?
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype021
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
 while/simple_rnn_cell_8/MatMul_1MatMulwhile_placeholder_27while/simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 while/simple_rnn_cell_8/MatMul_1?
while/simple_rnn_cell_8/addAddV2(while/simple_rnn_cell_8/BiasAdd:output:0*while/simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_8/add?
while/simple_rnn_cell_8/TanhTanhwhile/simple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_8/Tanh?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_8/Tanh:y:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity while/simple_rnn_cell_8/Tanh:y:0^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp/^while/simple_rnn_cell_8/BiasAdd/ReadVariableOp.^while/simple_rnn_cell_8/MatMul/ReadVariableOp0^while/simple_rnn_cell_8/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"t
7while_simple_rnn_cell_8_biasadd_readvariableop_resource9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0"v
8while_simple_rnn_cell_8_matmul_1_readvariableop_resource:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0"r
6while_simple_rnn_cell_8_matmul_readvariableop_resource8while_simple_rnn_cell_8_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2`
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp2^
-while/simple_rnn_cell_8/MatMul/ReadVariableOp-while/simple_rnn_cell_8/MatMul/ReadVariableOp2b
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?S
?
(bitcoin_basic_RNN_rnn_1_while_body_19671L
Hbitcoin_basic_rnn_rnn_1_while_bitcoin_basic_rnn_rnn_1_while_loop_counterR
Nbitcoin_basic_rnn_rnn_1_while_bitcoin_basic_rnn_rnn_1_while_maximum_iterations-
)bitcoin_basic_rnn_rnn_1_while_placeholder/
+bitcoin_basic_rnn_rnn_1_while_placeholder_1/
+bitcoin_basic_rnn_rnn_1_while_placeholder_2K
Gbitcoin_basic_rnn_rnn_1_while_bitcoin_basic_rnn_rnn_1_strided_slice_1_0?
?bitcoin_basic_rnn_rnn_1_while_tensorarrayv2read_tensorlistgetitem_bitcoin_basic_rnn_rnn_1_tensorarrayunstack_tensorlistfromtensor_0b
Pbitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resource_0:>_
Qbitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resource_0:>d
Rbitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0:>>*
&bitcoin_basic_rnn_rnn_1_while_identity,
(bitcoin_basic_rnn_rnn_1_while_identity_1,
(bitcoin_basic_rnn_rnn_1_while_identity_2,
(bitcoin_basic_rnn_rnn_1_while_identity_3,
(bitcoin_basic_rnn_rnn_1_while_identity_4I
Ebitcoin_basic_rnn_rnn_1_while_bitcoin_basic_rnn_rnn_1_strided_slice_1?
?bitcoin_basic_rnn_rnn_1_while_tensorarrayv2read_tensorlistgetitem_bitcoin_basic_rnn_rnn_1_tensorarrayunstack_tensorlistfromtensor`
Nbitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resource:>]
Obitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resource:>b
Pbitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resource:>>??Fbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?Ebitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp?Gbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
Obitcoin_basic_RNN/rnn_1/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   2Q
Obitcoin_basic_RNN/rnn_1/while/TensorArrayV2Read/TensorListGetItem/element_shape?
Abitcoin_basic_RNN/rnn_1/while/TensorArrayV2Read/TensorListGetItemTensorListGetItem?bitcoin_basic_rnn_rnn_1_while_tensorarrayv2read_tensorlistgetitem_bitcoin_basic_rnn_rnn_1_tensorarrayunstack_tensorlistfromtensor_0)bitcoin_basic_rnn_rnn_1_while_placeholderXbitcoin_basic_RNN/rnn_1/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????*
element_dtype02C
Abitcoin_basic_RNN/rnn_1/while/TensorArrayV2Read/TensorListGetItem?
?bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/ones_like/ShapeShapeHbitcoin_basic_RNN/rnn_1/while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2A
?bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/ones_like/Shape?
?bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2A
?bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/ones_like/Const?
9bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/ones_likeFillHbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/ones_like/Shape:output:0Hbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2;
9bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/ones_like?
3bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/mulMulHbitcoin_basic_RNN/rnn_1/while/TensorArrayV2Read/TensorListGetItem:item:0Bbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/ones_like:output:0*
T0*'
_output_shapes
:?????????25
3bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/mul?
Ebitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOpPbitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resource_0*
_output_shapes

:>*
dtype02G
Ebitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp?
6bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMulMatMul7bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/mul:z:0Mbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>28
6bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul?
Fbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOpQbitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype02H
Fbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?
7bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/BiasAddBiasAdd@bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul:product:0Nbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>29
7bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/BiasAdd?
Gbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOpRbitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype02I
Gbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
8bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul_1MatMul+bitcoin_basic_rnn_rnn_1_while_placeholder_2Obitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2:
8bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul_1?
3bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/addAddV2@bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/BiasAdd:output:0Bbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>25
3bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/add?
4bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/TanhTanh7bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>26
4bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/Tanh?
Bbitcoin_basic_RNN/rnn_1/while/TensorArrayV2Write/TensorListSetItemTensorListSetItem+bitcoin_basic_rnn_rnn_1_while_placeholder_1)bitcoin_basic_rnn_rnn_1_while_placeholder8bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/Tanh:y:0*
_output_shapes
: *
element_dtype02D
Bbitcoin_basic_RNN/rnn_1/while/TensorArrayV2Write/TensorListSetItem?
#bitcoin_basic_RNN/rnn_1/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2%
#bitcoin_basic_RNN/rnn_1/while/add/y?
!bitcoin_basic_RNN/rnn_1/while/addAddV2)bitcoin_basic_rnn_rnn_1_while_placeholder,bitcoin_basic_RNN/rnn_1/while/add/y:output:0*
T0*
_output_shapes
: 2#
!bitcoin_basic_RNN/rnn_1/while/add?
%bitcoin_basic_RNN/rnn_1/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2'
%bitcoin_basic_RNN/rnn_1/while/add_1/y?
#bitcoin_basic_RNN/rnn_1/while/add_1AddV2Hbitcoin_basic_rnn_rnn_1_while_bitcoin_basic_rnn_rnn_1_while_loop_counter.bitcoin_basic_RNN/rnn_1/while/add_1/y:output:0*
T0*
_output_shapes
: 2%
#bitcoin_basic_RNN/rnn_1/while/add_1?
&bitcoin_basic_RNN/rnn_1/while/IdentityIdentity'bitcoin_basic_RNN/rnn_1/while/add_1:z:0#^bitcoin_basic_RNN/rnn_1/while/NoOp*
T0*
_output_shapes
: 2(
&bitcoin_basic_RNN/rnn_1/while/Identity?
(bitcoin_basic_RNN/rnn_1/while/Identity_1IdentityNbitcoin_basic_rnn_rnn_1_while_bitcoin_basic_rnn_rnn_1_while_maximum_iterations#^bitcoin_basic_RNN/rnn_1/while/NoOp*
T0*
_output_shapes
: 2*
(bitcoin_basic_RNN/rnn_1/while/Identity_1?
(bitcoin_basic_RNN/rnn_1/while/Identity_2Identity%bitcoin_basic_RNN/rnn_1/while/add:z:0#^bitcoin_basic_RNN/rnn_1/while/NoOp*
T0*
_output_shapes
: 2*
(bitcoin_basic_RNN/rnn_1/while/Identity_2?
(bitcoin_basic_RNN/rnn_1/while/Identity_3IdentityRbitcoin_basic_RNN/rnn_1/while/TensorArrayV2Write/TensorListSetItem:output_handle:0#^bitcoin_basic_RNN/rnn_1/while/NoOp*
T0*
_output_shapes
: 2*
(bitcoin_basic_RNN/rnn_1/while/Identity_3?
(bitcoin_basic_RNN/rnn_1/while/Identity_4Identity8bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/Tanh:y:0#^bitcoin_basic_RNN/rnn_1/while/NoOp*
T0*'
_output_shapes
:?????????>2*
(bitcoin_basic_RNN/rnn_1/while/Identity_4?
"bitcoin_basic_RNN/rnn_1/while/NoOpNoOpG^bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOpF^bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOpH^bitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2$
"bitcoin_basic_RNN/rnn_1/while/NoOp"?
Ebitcoin_basic_rnn_rnn_1_while_bitcoin_basic_rnn_rnn_1_strided_slice_1Gbitcoin_basic_rnn_rnn_1_while_bitcoin_basic_rnn_rnn_1_strided_slice_1_0"Y
&bitcoin_basic_rnn_rnn_1_while_identity/bitcoin_basic_RNN/rnn_1/while/Identity:output:0"]
(bitcoin_basic_rnn_rnn_1_while_identity_11bitcoin_basic_RNN/rnn_1/while/Identity_1:output:0"]
(bitcoin_basic_rnn_rnn_1_while_identity_21bitcoin_basic_RNN/rnn_1/while/Identity_2:output:0"]
(bitcoin_basic_rnn_rnn_1_while_identity_31bitcoin_basic_RNN/rnn_1/while/Identity_3:output:0"]
(bitcoin_basic_rnn_rnn_1_while_identity_41bitcoin_basic_RNN/rnn_1/while/Identity_4:output:0"?
Obitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resourceQbitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resource_0"?
Pbitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resourceRbitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0"?
Nbitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resourcePbitcoin_basic_rnn_rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resource_0"?
?bitcoin_basic_rnn_rnn_1_while_tensorarrayv2read_tensorlistgetitem_bitcoin_basic_rnn_rnn_1_tensorarrayunstack_tensorlistfromtensor?bitcoin_basic_rnn_rnn_1_while_tensorarrayv2read_tensorlistgetitem_bitcoin_basic_rnn_rnn_1_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2?
Fbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOpFbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp2?
Ebitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOpEbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp2?
Gbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOpGbitcoin_basic_RNN/rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?
?
while_cond_20117
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_20117___redundant_placeholder03
/while_while_cond_20117___redundant_placeholder13
/while_while_cond_20117___redundant_placeholder23
/while_while_cond_20117___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?#
?
while_body_19932
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_01
while_simple_rnn_cell_8_19954_0:>-
while_simple_rnn_cell_8_19956_0:>1
while_simple_rnn_cell_8_19958_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor/
while_simple_rnn_cell_8_19954:>+
while_simple_rnn_cell_8_19956:>/
while_simple_rnn_cell_8_19958:>>??/while/simple_rnn_cell_8/StatefulPartitionedCall?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
/while/simple_rnn_cell_8/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2while_simple_rnn_cell_8_19954_0while_simple_rnn_cell_8_19956_0while_simple_rnn_cell_8_19958_0*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:?????????>:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_simple_rnn_cell_8_layer_call_and_return_conditional_losses_1991921
/while/simple_rnn_cell_8/StatefulPartitionedCall?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder8while/simple_rnn_cell_8/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity8while/simple_rnn_cell_8/StatefulPartitionedCall:output:1^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp0^while/simple_rnn_cell_8/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"@
while_simple_rnn_cell_8_19954while_simple_rnn_cell_8_19954_0"@
while_simple_rnn_cell_8_19956while_simple_rnn_cell_8_19956_0"@
while_simple_rnn_cell_8_19958while_simple_rnn_cell_8_19958_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2b
/while/simple_rnn_cell_8/StatefulPartitionedCall/while/simple_rnn_cell_8/StatefulPartitionedCall: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?N
?
@__inference_rnn_1_layer_call_and_return_conditional_losses_21089

inputsB
0simple_rnn_cell_8_matmul_readvariableop_resource:>?
1simple_rnn_cell_8_biasadd_readvariableop_resource:>D
2simple_rnn_cell_8_matmul_1_readvariableop_resource:>>
identity??(simple_rnn_cell_8/BiasAdd/ReadVariableOp?'simple_rnn_cell_8/MatMul/ReadVariableOp?)simple_rnn_cell_8/MatMul_1/ReadVariableOp?whileD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/permz
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:?????????2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????*
shrink_axis_mask2
strided_slice_2?
!simple_rnn_cell_8/ones_like/ShapeShapestrided_slice_2:output:0*
T0*
_output_shapes
:2#
!simple_rnn_cell_8/ones_like/Shape?
!simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2#
!simple_rnn_cell_8/ones_like/Const?
simple_rnn_cell_8/ones_likeFill*simple_rnn_cell_8/ones_like/Shape:output:0*simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/ones_like?
simple_rnn_cell_8/mulMulstrided_slice_2:output:0$simple_rnn_cell_8/ones_like:output:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/mul?
'simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp0simple_rnn_cell_8_matmul_readvariableop_resource*
_output_shapes

:>*
dtype02)
'simple_rnn_cell_8/MatMul/ReadVariableOp?
simple_rnn_cell_8/MatMulMatMulsimple_rnn_cell_8/mul:z:0/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/MatMul?
(simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp1simple_rnn_cell_8_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype02*
(simple_rnn_cell_8/BiasAdd/ReadVariableOp?
simple_rnn_cell_8/BiasAddBiasAdd"simple_rnn_cell_8/MatMul:product:00simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/BiasAdd?
)simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp2simple_rnn_cell_8_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02+
)simple_rnn_cell_8/MatMul_1/ReadVariableOp?
simple_rnn_cell_8/MatMul_1MatMulzeros:output:01simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/MatMul_1?
simple_rnn_cell_8/addAddV2"simple_rnn_cell_8/BiasAdd:output:0$simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/add?
simple_rnn_cell_8/TanhTanhsimple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/Tanh?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:00simple_rnn_cell_8_matmul_readvariableop_resource1simple_rnn_cell_8_biasadd_readvariableop_resource2simple_rnn_cell_8_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_21019*
condR
while_cond_21018*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:?????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*+
_output_shapes
:?????????>2
transpose_1n
IdentityIdentitytranspose_1:y:0^NoOp*
T0*+
_output_shapes
:?????????>2

Identity?
NoOpNoOp)^simple_rnn_cell_8/BiasAdd/ReadVariableOp(^simple_rnn_cell_8/MatMul/ReadVariableOp*^simple_rnn_cell_8/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????: : : 2T
(simple_rnn_cell_8/BiasAdd/ReadVariableOp(simple_rnn_cell_8/BiasAdd/ReadVariableOp2R
'simple_rnn_cell_8/MatMul/ReadVariableOp'simple_rnn_cell_8/MatMul/ReadVariableOp2V
)simple_rnn_cell_8/MatMul_1/ReadVariableOp)simple_rnn_cell_8/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:?????????
 
_user_specified_nameinputs
?#
?
while_body_20118
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_01
while_simple_rnn_cell_8_20140_0:>-
while_simple_rnn_cell_8_20142_0:>1
while_simple_rnn_cell_8_20144_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor/
while_simple_rnn_cell_8_20140:>+
while_simple_rnn_cell_8_20142:>/
while_simple_rnn_cell_8_20144:>>??/while/simple_rnn_cell_8/StatefulPartitionedCall?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
/while/simple_rnn_cell_8/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2while_simple_rnn_cell_8_20140_0while_simple_rnn_cell_8_20142_0while_simple_rnn_cell_8_20144_0*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:?????????>:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_simple_rnn_cell_8_layer_call_and_return_conditional_losses_2005121
/while/simple_rnn_cell_8/StatefulPartitionedCall?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder8while/simple_rnn_cell_8/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity8while/simple_rnn_cell_8/StatefulPartitionedCall:output:1^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp0^while/simple_rnn_cell_8/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"@
while_simple_rnn_cell_8_20140while_simple_rnn_cell_8_20140_0"@
while_simple_rnn_cell_8_20142while_simple_rnn_cell_8_20142_0"@
while_simple_rnn_cell_8_20144while_simple_rnn_cell_8_20144_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2b
/while/simple_rnn_cell_8/StatefulPartitionedCall/while/simple_rnn_cell_8/StatefulPartitionedCall: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?
?
%__inference_rnn_2_layer_call_fn_23406

inputs
unknown:>>
	unknown_0:>
	unknown_1:>>
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_2_layer_call_and_return_conditional_losses_212162
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????>: : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:?????????>
 
_user_specified_nameinputs
?7
?
while_body_22355
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0J
8while_simple_rnn_cell_8_matmul_readvariableop_resource_0:>G
9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0:>L
:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorH
6while_simple_rnn_cell_8_matmul_readvariableop_resource:>E
7while_simple_rnn_cell_8_biasadd_readvariableop_resource:>J
8while_simple_rnn_cell_8_matmul_1_readvariableop_resource:>>??.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?-while/simple_rnn_cell_8/MatMul/ReadVariableOp?/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/simple_rnn_cell_8/ones_like/ShapeShape0while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2)
'while/simple_rnn_cell_8/ones_like/Shape?
'while/simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'while/simple_rnn_cell_8/ones_like/Const?
!while/simple_rnn_cell_8/ones_likeFill0while/simple_rnn_cell_8/ones_like/Shape:output:00while/simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2#
!while/simple_rnn_cell_8/ones_like?
while/simple_rnn_cell_8/mulMul0while/TensorArrayV2Read/TensorListGetItem:item:0*while/simple_rnn_cell_8/ones_like:output:0*
T0*'
_output_shapes
:?????????2
while/simple_rnn_cell_8/mul?
-while/simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp8while_simple_rnn_cell_8_matmul_readvariableop_resource_0*
_output_shapes

:>*
dtype02/
-while/simple_rnn_cell_8/MatMul/ReadVariableOp?
while/simple_rnn_cell_8/MatMulMatMulwhile/simple_rnn_cell_8/mul:z:05while/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
while/simple_rnn_cell_8/MatMul?
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype020
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?
while/simple_rnn_cell_8/BiasAddBiasAdd(while/simple_rnn_cell_8/MatMul:product:06while/simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
while/simple_rnn_cell_8/BiasAdd?
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype021
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
 while/simple_rnn_cell_8/MatMul_1MatMulwhile_placeholder_27while/simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 while/simple_rnn_cell_8/MatMul_1?
while/simple_rnn_cell_8/addAddV2(while/simple_rnn_cell_8/BiasAdd:output:0*while/simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_8/add?
while/simple_rnn_cell_8/TanhTanhwhile/simple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_8/Tanh?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_8/Tanh:y:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity while/simple_rnn_cell_8/Tanh:y:0^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp/^while/simple_rnn_cell_8/BiasAdd/ReadVariableOp.^while/simple_rnn_cell_8/MatMul/ReadVariableOp0^while/simple_rnn_cell_8/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"t
7while_simple_rnn_cell_8_biasadd_readvariableop_resource9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0"v
8while_simple_rnn_cell_8_matmul_1_readvariableop_resource:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0"r
6while_simple_rnn_cell_8_matmul_readvariableop_resource8while_simple_rnn_cell_8_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2`
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp2^
-while/simple_rnn_cell_8/MatMul/ReadVariableOp-while/simple_rnn_cell_8/MatMul/ReadVariableOp2b
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?L
?	
rnn_1_while_body_22047(
$rnn_1_while_rnn_1_while_loop_counter.
*rnn_1_while_rnn_1_while_maximum_iterations
rnn_1_while_placeholder
rnn_1_while_placeholder_1
rnn_1_while_placeholder_2'
#rnn_1_while_rnn_1_strided_slice_1_0c
_rnn_1_while_tensorarrayv2read_tensorlistgetitem_rnn_1_tensorarrayunstack_tensorlistfromtensor_0P
>rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resource_0:>M
?rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resource_0:>R
@rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0:>>
rnn_1_while_identity
rnn_1_while_identity_1
rnn_1_while_identity_2
rnn_1_while_identity_3
rnn_1_while_identity_4%
!rnn_1_while_rnn_1_strided_slice_1a
]rnn_1_while_tensorarrayv2read_tensorlistgetitem_rnn_1_tensorarrayunstack_tensorlistfromtensorN
<rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resource:>K
=rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resource:>P
>rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resource:>>??4rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?3rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp?5rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
=rnn_1/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   2?
=rnn_1/while/TensorArrayV2Read/TensorListGetItem/element_shape?
/rnn_1/while/TensorArrayV2Read/TensorListGetItemTensorListGetItem_rnn_1_while_tensorarrayv2read_tensorlistgetitem_rnn_1_tensorarrayunstack_tensorlistfromtensor_0rnn_1_while_placeholderFrnn_1/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????*
element_dtype021
/rnn_1/while/TensorArrayV2Read/TensorListGetItem?
-rnn_1/while/simple_rnn_cell_8/ones_like/ShapeShape6rnn_1/while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2/
-rnn_1/while/simple_rnn_cell_8/ones_like/Shape?
-rnn_1/while/simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2/
-rnn_1/while/simple_rnn_cell_8/ones_like/Const?
'rnn_1/while/simple_rnn_cell_8/ones_likeFill6rnn_1/while/simple_rnn_cell_8/ones_like/Shape:output:06rnn_1/while/simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2)
'rnn_1/while/simple_rnn_cell_8/ones_like?
+rnn_1/while/simple_rnn_cell_8/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2-
+rnn_1/while/simple_rnn_cell_8/dropout/Const?
)rnn_1/while/simple_rnn_cell_8/dropout/MulMul0rnn_1/while/simple_rnn_cell_8/ones_like:output:04rnn_1/while/simple_rnn_cell_8/dropout/Const:output:0*
T0*'
_output_shapes
:?????????2+
)rnn_1/while/simple_rnn_cell_8/dropout/Mul?
+rnn_1/while/simple_rnn_cell_8/dropout/ShapeShape0rnn_1/while/simple_rnn_cell_8/ones_like:output:0*
T0*
_output_shapes
:2-
+rnn_1/while/simple_rnn_cell_8/dropout/Shape?
Brnn_1/while/simple_rnn_cell_8/dropout/random_uniform/RandomUniformRandomUniform4rnn_1/while/simple_rnn_cell_8/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????*
dtype0*

seed4*
seed2?ػ2D
Brnn_1/while/simple_rnn_cell_8/dropout/random_uniform/RandomUniform?
4rnn_1/while/simple_rnn_cell_8/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???26
4rnn_1/while/simple_rnn_cell_8/dropout/GreaterEqual/y?
2rnn_1/while/simple_rnn_cell_8/dropout/GreaterEqualGreaterEqualKrnn_1/while/simple_rnn_cell_8/dropout/random_uniform/RandomUniform:output:0=rnn_1/while/simple_rnn_cell_8/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????24
2rnn_1/while/simple_rnn_cell_8/dropout/GreaterEqual?
*rnn_1/while/simple_rnn_cell_8/dropout/CastCast6rnn_1/while/simple_rnn_cell_8/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????2,
*rnn_1/while/simple_rnn_cell_8/dropout/Cast?
+rnn_1/while/simple_rnn_cell_8/dropout/Mul_1Mul-rnn_1/while/simple_rnn_cell_8/dropout/Mul:z:0.rnn_1/while/simple_rnn_cell_8/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????2-
+rnn_1/while/simple_rnn_cell_8/dropout/Mul_1?
!rnn_1/while/simple_rnn_cell_8/mulMul6rnn_1/while/TensorArrayV2Read/TensorListGetItem:item:0/rnn_1/while/simple_rnn_cell_8/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????2#
!rnn_1/while/simple_rnn_cell_8/mul?
3rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp>rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resource_0*
_output_shapes

:>*
dtype025
3rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp?
$rnn_1/while/simple_rnn_cell_8/MatMulMatMul%rnn_1/while/simple_rnn_cell_8/mul:z:0;rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2&
$rnn_1/while/simple_rnn_cell_8/MatMul?
4rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp?rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype026
4rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?
%rnn_1/while/simple_rnn_cell_8/BiasAddBiasAdd.rnn_1/while/simple_rnn_cell_8/MatMul:product:0<rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2'
%rnn_1/while/simple_rnn_cell_8/BiasAdd?
5rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp@rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype027
5rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
&rnn_1/while/simple_rnn_cell_8/MatMul_1MatMulrnn_1_while_placeholder_2=rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2(
&rnn_1/while/simple_rnn_cell_8/MatMul_1?
!rnn_1/while/simple_rnn_cell_8/addAddV2.rnn_1/while/simple_rnn_cell_8/BiasAdd:output:00rnn_1/while/simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2#
!rnn_1/while/simple_rnn_cell_8/add?
"rnn_1/while/simple_rnn_cell_8/TanhTanh%rnn_1/while/simple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2$
"rnn_1/while/simple_rnn_cell_8/Tanh?
0rnn_1/while/TensorArrayV2Write/TensorListSetItemTensorListSetItemrnn_1_while_placeholder_1rnn_1_while_placeholder&rnn_1/while/simple_rnn_cell_8/Tanh:y:0*
_output_shapes
: *
element_dtype022
0rnn_1/while/TensorArrayV2Write/TensorListSetItemh
rnn_1/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
rnn_1/while/add/y?
rnn_1/while/addAddV2rnn_1_while_placeholderrnn_1/while/add/y:output:0*
T0*
_output_shapes
: 2
rnn_1/while/addl
rnn_1/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
rnn_1/while/add_1/y?
rnn_1/while/add_1AddV2$rnn_1_while_rnn_1_while_loop_counterrnn_1/while/add_1/y:output:0*
T0*
_output_shapes
: 2
rnn_1/while/add_1?
rnn_1/while/IdentityIdentityrnn_1/while/add_1:z:0^rnn_1/while/NoOp*
T0*
_output_shapes
: 2
rnn_1/while/Identity?
rnn_1/while/Identity_1Identity*rnn_1_while_rnn_1_while_maximum_iterations^rnn_1/while/NoOp*
T0*
_output_shapes
: 2
rnn_1/while/Identity_1?
rnn_1/while/Identity_2Identityrnn_1/while/add:z:0^rnn_1/while/NoOp*
T0*
_output_shapes
: 2
rnn_1/while/Identity_2?
rnn_1/while/Identity_3Identity@rnn_1/while/TensorArrayV2Write/TensorListSetItem:output_handle:0^rnn_1/while/NoOp*
T0*
_output_shapes
: 2
rnn_1/while/Identity_3?
rnn_1/while/Identity_4Identity&rnn_1/while/simple_rnn_cell_8/Tanh:y:0^rnn_1/while/NoOp*
T0*'
_output_shapes
:?????????>2
rnn_1/while/Identity_4?
rnn_1/while/NoOpNoOp5^rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp4^rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp6^rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
rnn_1/while/NoOp"5
rnn_1_while_identityrnn_1/while/Identity:output:0"9
rnn_1_while_identity_1rnn_1/while/Identity_1:output:0"9
rnn_1_while_identity_2rnn_1/while/Identity_2:output:0"9
rnn_1_while_identity_3rnn_1/while/Identity_3:output:0"9
rnn_1_while_identity_4rnn_1/while/Identity_4:output:0"H
!rnn_1_while_rnn_1_strided_slice_1#rnn_1_while_rnn_1_strided_slice_1_0"?
=rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resource?rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resource_0"?
>rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resource@rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0"~
<rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resource>rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resource_0"?
]rnn_1_while_tensorarrayv2read_tensorlistgetitem_rnn_1_tensorarrayunstack_tensorlistfromtensor_rnn_1_while_tensorarrayv2read_tensorlistgetitem_rnn_1_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2l
4rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp4rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp2j
3rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp3rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp2n
5rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp5rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
??
?
!__inference__traced_restore_23823
file_prefix6
$assignvariableop_output_layer_kernel:>2
$assignvariableop_1_output_layer_bias:&
assignvariableop_2_adam_iter:	 (
assignvariableop_3_adam_beta_1: (
assignvariableop_4_adam_beta_2: '
assignvariableop_5_adam_decay: /
%assignvariableop_6_adam_learning_rate: C
1assignvariableop_7_rnn_1_simple_rnn_cell_8_kernel:>M
;assignvariableop_8_rnn_1_simple_rnn_cell_8_recurrent_kernel:>>=
/assignvariableop_9_rnn_1_simple_rnn_cell_8_bias:>D
2assignvariableop_10_rnn_2_simple_rnn_cell_9_kernel:>>N
<assignvariableop_11_rnn_2_simple_rnn_cell_9_recurrent_kernel:>>>
0assignvariableop_12_rnn_2_simple_rnn_cell_9_bias:>#
assignvariableop_13_total: #
assignvariableop_14_count: %
assignvariableop_15_total_1: %
assignvariableop_16_count_1: @
.assignvariableop_17_adam_output_layer_kernel_m:>:
,assignvariableop_18_adam_output_layer_bias_m:K
9assignvariableop_19_adam_rnn_1_simple_rnn_cell_8_kernel_m:>U
Cassignvariableop_20_adam_rnn_1_simple_rnn_cell_8_recurrent_kernel_m:>>E
7assignvariableop_21_adam_rnn_1_simple_rnn_cell_8_bias_m:>K
9assignvariableop_22_adam_rnn_2_simple_rnn_cell_9_kernel_m:>>U
Cassignvariableop_23_adam_rnn_2_simple_rnn_cell_9_recurrent_kernel_m:>>E
7assignvariableop_24_adam_rnn_2_simple_rnn_cell_9_bias_m:>@
.assignvariableop_25_adam_output_layer_kernel_v:>:
,assignvariableop_26_adam_output_layer_bias_v:K
9assignvariableop_27_adam_rnn_1_simple_rnn_cell_8_kernel_v:>U
Cassignvariableop_28_adam_rnn_1_simple_rnn_cell_8_recurrent_kernel_v:>>E
7assignvariableop_29_adam_rnn_1_simple_rnn_cell_8_bias_v:>K
9assignvariableop_30_adam_rnn_2_simple_rnn_cell_9_kernel_v:>>U
Cassignvariableop_31_adam_rnn_2_simple_rnn_cell_9_recurrent_kernel_v:>>E
7assignvariableop_32_adam_rnn_2_simple_rnn_cell_9_bias_v:>
identity_34??AssignVariableOp?AssignVariableOp_1?AssignVariableOp_10?AssignVariableOp_11?AssignVariableOp_12?AssignVariableOp_13?AssignVariableOp_14?AssignVariableOp_15?AssignVariableOp_16?AssignVariableOp_17?AssignVariableOp_18?AssignVariableOp_19?AssignVariableOp_2?AssignVariableOp_20?AssignVariableOp_21?AssignVariableOp_22?AssignVariableOp_23?AssignVariableOp_24?AssignVariableOp_25?AssignVariableOp_26?AssignVariableOp_27?AssignVariableOp_28?AssignVariableOp_29?AssignVariableOp_3?AssignVariableOp_30?AssignVariableOp_31?AssignVariableOp_32?AssignVariableOp_4?AssignVariableOp_5?AssignVariableOp_6?AssignVariableOp_7?AssignVariableOp_8?AssignVariableOp_9?
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:"*
dtype0*?
value?B?"B6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:"*
dtype0*W
valueNBL"B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices?
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*?
_output_shapes?
?::::::::::::::::::::::::::::::::::*0
dtypes&
$2"	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

Identity?
AssignVariableOpAssignVariableOp$assignvariableop_output_layer_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1?
AssignVariableOp_1AssignVariableOp$assignvariableop_1_output_layer_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0	*
_output_shapes
:2

Identity_2?
AssignVariableOp_2AssignVariableOpassignvariableop_2_adam_iterIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3?
AssignVariableOp_3AssignVariableOpassignvariableop_3_adam_beta_1Identity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4?
AssignVariableOp_4AssignVariableOpassignvariableop_4_adam_beta_2Identity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5?
AssignVariableOp_5AssignVariableOpassignvariableop_5_adam_decayIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6?
AssignVariableOp_6AssignVariableOp%assignvariableop_6_adam_learning_rateIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7?
AssignVariableOp_7AssignVariableOp1assignvariableop_7_rnn_1_simple_rnn_cell_8_kernelIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8?
AssignVariableOp_8AssignVariableOp;assignvariableop_8_rnn_1_simple_rnn_cell_8_recurrent_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9?
AssignVariableOp_9AssignVariableOp/assignvariableop_9_rnn_1_simple_rnn_cell_8_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10?
AssignVariableOp_10AssignVariableOp2assignvariableop_10_rnn_2_simple_rnn_cell_9_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11?
AssignVariableOp_11AssignVariableOp<assignvariableop_11_rnn_2_simple_rnn_cell_9_recurrent_kernelIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:2
Identity_12?
AssignVariableOp_12AssignVariableOp0assignvariableop_12_rnn_2_simple_rnn_cell_9_biasIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_12n
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:2
Identity_13?
AssignVariableOp_13AssignVariableOpassignvariableop_13_totalIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_13n
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:2
Identity_14?
AssignVariableOp_14AssignVariableOpassignvariableop_14_countIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_14n
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:2
Identity_15?
AssignVariableOp_15AssignVariableOpassignvariableop_15_total_1Identity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_15n
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:2
Identity_16?
AssignVariableOp_16AssignVariableOpassignvariableop_16_count_1Identity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_16n
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:2
Identity_17?
AssignVariableOp_17AssignVariableOp.assignvariableop_17_adam_output_layer_kernel_mIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_17n
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:2
Identity_18?
AssignVariableOp_18AssignVariableOp,assignvariableop_18_adam_output_layer_bias_mIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_18n
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:2
Identity_19?
AssignVariableOp_19AssignVariableOp9assignvariableop_19_adam_rnn_1_simple_rnn_cell_8_kernel_mIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_19n
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:2
Identity_20?
AssignVariableOp_20AssignVariableOpCassignvariableop_20_adam_rnn_1_simple_rnn_cell_8_recurrent_kernel_mIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_20n
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:2
Identity_21?
AssignVariableOp_21AssignVariableOp7assignvariableop_21_adam_rnn_1_simple_rnn_cell_8_bias_mIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_21n
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:2
Identity_22?
AssignVariableOp_22AssignVariableOp9assignvariableop_22_adam_rnn_2_simple_rnn_cell_9_kernel_mIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_22n
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:2
Identity_23?
AssignVariableOp_23AssignVariableOpCassignvariableop_23_adam_rnn_2_simple_rnn_cell_9_recurrent_kernel_mIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_23n
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:2
Identity_24?
AssignVariableOp_24AssignVariableOp7assignvariableop_24_adam_rnn_2_simple_rnn_cell_9_bias_mIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_24n
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:2
Identity_25?
AssignVariableOp_25AssignVariableOp.assignvariableop_25_adam_output_layer_kernel_vIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_25n
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:2
Identity_26?
AssignVariableOp_26AssignVariableOp,assignvariableop_26_adam_output_layer_bias_vIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_26n
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:2
Identity_27?
AssignVariableOp_27AssignVariableOp9assignvariableop_27_adam_rnn_1_simple_rnn_cell_8_kernel_vIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_27n
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:2
Identity_28?
AssignVariableOp_28AssignVariableOpCassignvariableop_28_adam_rnn_1_simple_rnn_cell_8_recurrent_kernel_vIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_28n
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:2
Identity_29?
AssignVariableOp_29AssignVariableOp7assignvariableop_29_adam_rnn_1_simple_rnn_cell_8_bias_vIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_29n
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:2
Identity_30?
AssignVariableOp_30AssignVariableOp9assignvariableop_30_adam_rnn_2_simple_rnn_cell_9_kernel_vIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_30n
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:2
Identity_31?
AssignVariableOp_31AssignVariableOpCassignvariableop_31_adam_rnn_2_simple_rnn_cell_9_recurrent_kernel_vIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_31n
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:2
Identity_32?
AssignVariableOp_32AssignVariableOp7assignvariableop_32_adam_rnn_2_simple_rnn_cell_9_bias_vIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_329
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp?
Identity_33Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_33f
Identity_34IdentityIdentity_33:output:0^NoOp_1*
T0*
_output_shapes
: 2
Identity_34?
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 2
NoOp_1"#
identity_34Identity_34:output:0*W
_input_shapesF
D: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
?
?
L__inference_simple_rnn_cell_8_layer_call_and_return_conditional_losses_23457

inputs
states_00
matmul_readvariableop_resource:>-
biasadd_readvariableop_resource:>2
 matmul_1_readvariableop_resource:>>
identity

identity_1??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOpX
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:2
ones_like/Shapeg
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2
ones_like/Const?
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2
	ones_like_
mulMulinputsones_like:output:0*
T0*'
_output_shapes
:?????????2
mul?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:>*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulmul:z:0MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:>*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2	
BiasAdd?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02
MatMul_1/ReadVariableOp{
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2

MatMul_1k
addAddV2BiasAdd:output:0MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
addO
TanhTanhadd:z:0*
T0*'
_output_shapes
:?????????>2
Tanhc
IdentityIdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identityg

Identity_1IdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity_1?
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:?????????:?????????>: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs:QM
'
_output_shapes
:?????????>
"
_user_specified_name
states/0
?	
?
rnn_2_while_cond_21912(
$rnn_2_while_rnn_2_while_loop_counter.
*rnn_2_while_rnn_2_while_maximum_iterations
rnn_2_while_placeholder
rnn_2_while_placeholder_1
rnn_2_while_placeholder_2*
&rnn_2_while_less_rnn_2_strided_slice_1?
;rnn_2_while_rnn_2_while_cond_21912___redundant_placeholder0?
;rnn_2_while_rnn_2_while_cond_21912___redundant_placeholder1?
;rnn_2_while_rnn_2_while_cond_21912___redundant_placeholder2?
;rnn_2_while_rnn_2_while_cond_21912___redundant_placeholder3
rnn_2_while_identity
?
rnn_2/while/LessLessrnn_2_while_placeholder&rnn_2_while_less_rnn_2_strided_slice_1*
T0*
_output_shapes
: 2
rnn_2/while/Lesso
rnn_2/while/IdentityIdentityrnn_2/while/Less:z:0*
T0
*
_output_shapes
: 2
rnn_2/while/Identity"5
rnn_2_while_identityrnn_2/while/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?
?
L__inference_simple_rnn_cell_9_layer_call_and_return_conditional_losses_23564

inputs
states_00
matmul_readvariableop_resource:>>-
biasadd_readvariableop_resource:>2
 matmul_1_readvariableop_resource:>>
identity

identity_1??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOpX
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:2
ones_like/Shapeg
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2
ones_like/Const?
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2
	ones_likec
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2
dropout/Const
dropout/MulMulones_like:output:0dropout/Const:output:0*
T0*'
_output_shapes
:?????????>2
dropout/Mul`
dropout/ShapeShapeones_like:output:0*
T0*
_output_shapes
:2
dropout/Shape?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:?????????>*
dtype0*

seed4*
seed2ڎ?2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???2
dropout/GreaterEqual/y?
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????>2
dropout/GreaterEqual
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????>2
dropout/Castz
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:?????????>2
dropout/Mul_1^
mulMulinputsdropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????>2
mul?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:>>*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulmul:z:0MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:>*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2	
BiasAdd?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02
MatMul_1/ReadVariableOp{
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2

MatMul_1k
addAddV2BiasAdd:output:0MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
addO
TanhTanhadd:z:0*
T0*'
_output_shapes
:?????????>2
Tanhc
IdentityIdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identityg

Identity_1IdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity_1?
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:?????????>:?????????>: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????>
 
_user_specified_nameinputs:QM
'
_output_shapes
:?????????>
"
_user_specified_name
states/0
?>
?	
rnn_1_while_body_21797(
$rnn_1_while_rnn_1_while_loop_counter.
*rnn_1_while_rnn_1_while_maximum_iterations
rnn_1_while_placeholder
rnn_1_while_placeholder_1
rnn_1_while_placeholder_2'
#rnn_1_while_rnn_1_strided_slice_1_0c
_rnn_1_while_tensorarrayv2read_tensorlistgetitem_rnn_1_tensorarrayunstack_tensorlistfromtensor_0P
>rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resource_0:>M
?rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resource_0:>R
@rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0:>>
rnn_1_while_identity
rnn_1_while_identity_1
rnn_1_while_identity_2
rnn_1_while_identity_3
rnn_1_while_identity_4%
!rnn_1_while_rnn_1_strided_slice_1a
]rnn_1_while_tensorarrayv2read_tensorlistgetitem_rnn_1_tensorarrayunstack_tensorlistfromtensorN
<rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resource:>K
=rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resource:>P
>rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resource:>>??4rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?3rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp?5rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
=rnn_1/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   2?
=rnn_1/while/TensorArrayV2Read/TensorListGetItem/element_shape?
/rnn_1/while/TensorArrayV2Read/TensorListGetItemTensorListGetItem_rnn_1_while_tensorarrayv2read_tensorlistgetitem_rnn_1_tensorarrayunstack_tensorlistfromtensor_0rnn_1_while_placeholderFrnn_1/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????*
element_dtype021
/rnn_1/while/TensorArrayV2Read/TensorListGetItem?
-rnn_1/while/simple_rnn_cell_8/ones_like/ShapeShape6rnn_1/while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2/
-rnn_1/while/simple_rnn_cell_8/ones_like/Shape?
-rnn_1/while/simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2/
-rnn_1/while/simple_rnn_cell_8/ones_like/Const?
'rnn_1/while/simple_rnn_cell_8/ones_likeFill6rnn_1/while/simple_rnn_cell_8/ones_like/Shape:output:06rnn_1/while/simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2)
'rnn_1/while/simple_rnn_cell_8/ones_like?
!rnn_1/while/simple_rnn_cell_8/mulMul6rnn_1/while/TensorArrayV2Read/TensorListGetItem:item:00rnn_1/while/simple_rnn_cell_8/ones_like:output:0*
T0*'
_output_shapes
:?????????2#
!rnn_1/while/simple_rnn_cell_8/mul?
3rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp>rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resource_0*
_output_shapes

:>*
dtype025
3rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp?
$rnn_1/while/simple_rnn_cell_8/MatMulMatMul%rnn_1/while/simple_rnn_cell_8/mul:z:0;rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2&
$rnn_1/while/simple_rnn_cell_8/MatMul?
4rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp?rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype026
4rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?
%rnn_1/while/simple_rnn_cell_8/BiasAddBiasAdd.rnn_1/while/simple_rnn_cell_8/MatMul:product:0<rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2'
%rnn_1/while/simple_rnn_cell_8/BiasAdd?
5rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp@rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype027
5rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
&rnn_1/while/simple_rnn_cell_8/MatMul_1MatMulrnn_1_while_placeholder_2=rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2(
&rnn_1/while/simple_rnn_cell_8/MatMul_1?
!rnn_1/while/simple_rnn_cell_8/addAddV2.rnn_1/while/simple_rnn_cell_8/BiasAdd:output:00rnn_1/while/simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2#
!rnn_1/while/simple_rnn_cell_8/add?
"rnn_1/while/simple_rnn_cell_8/TanhTanh%rnn_1/while/simple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2$
"rnn_1/while/simple_rnn_cell_8/Tanh?
0rnn_1/while/TensorArrayV2Write/TensorListSetItemTensorListSetItemrnn_1_while_placeholder_1rnn_1_while_placeholder&rnn_1/while/simple_rnn_cell_8/Tanh:y:0*
_output_shapes
: *
element_dtype022
0rnn_1/while/TensorArrayV2Write/TensorListSetItemh
rnn_1/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
rnn_1/while/add/y?
rnn_1/while/addAddV2rnn_1_while_placeholderrnn_1/while/add/y:output:0*
T0*
_output_shapes
: 2
rnn_1/while/addl
rnn_1/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
rnn_1/while/add_1/y?
rnn_1/while/add_1AddV2$rnn_1_while_rnn_1_while_loop_counterrnn_1/while/add_1/y:output:0*
T0*
_output_shapes
: 2
rnn_1/while/add_1?
rnn_1/while/IdentityIdentityrnn_1/while/add_1:z:0^rnn_1/while/NoOp*
T0*
_output_shapes
: 2
rnn_1/while/Identity?
rnn_1/while/Identity_1Identity*rnn_1_while_rnn_1_while_maximum_iterations^rnn_1/while/NoOp*
T0*
_output_shapes
: 2
rnn_1/while/Identity_1?
rnn_1/while/Identity_2Identityrnn_1/while/add:z:0^rnn_1/while/NoOp*
T0*
_output_shapes
: 2
rnn_1/while/Identity_2?
rnn_1/while/Identity_3Identity@rnn_1/while/TensorArrayV2Write/TensorListSetItem:output_handle:0^rnn_1/while/NoOp*
T0*
_output_shapes
: 2
rnn_1/while/Identity_3?
rnn_1/while/Identity_4Identity&rnn_1/while/simple_rnn_cell_8/Tanh:y:0^rnn_1/while/NoOp*
T0*'
_output_shapes
:?????????>2
rnn_1/while/Identity_4?
rnn_1/while/NoOpNoOp5^rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp4^rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp6^rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
rnn_1/while/NoOp"5
rnn_1_while_identityrnn_1/while/Identity:output:0"9
rnn_1_while_identity_1rnn_1/while/Identity_1:output:0"9
rnn_1_while_identity_2rnn_1/while/Identity_2:output:0"9
rnn_1_while_identity_3rnn_1/while/Identity_3:output:0"9
rnn_1_while_identity_4rnn_1/while/Identity_4:output:0"H
!rnn_1_while_rnn_1_strided_slice_1#rnn_1_while_rnn_1_strided_slice_1_0"?
=rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resource?rnn_1_while_simple_rnn_cell_8_biasadd_readvariableop_resource_0"?
>rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resource@rnn_1_while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0"~
<rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resource>rnn_1_while_simple_rnn_cell_8_matmul_readvariableop_resource_0"?
]rnn_1_while_tensorarrayv2read_tensorlistgetitem_rnn_1_tensorarrayunstack_tensorlistfromtensor_rnn_1_while_tensorarrayv2read_tensorlistgetitem_rnn_1_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2l
4rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp4rnn_1/while/simple_rnn_cell_8/BiasAdd/ReadVariableOp2j
3rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp3rnn_1/while/simple_rnn_cell_8/MatMul/ReadVariableOp2n
5rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp5rnn_1/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?
?
while_cond_21018
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_21018___redundant_placeholder03
/while_while_cond_21018___redundant_placeholder13
/while_while_cond_21018___redundant_placeholder23
/while_while_cond_21018___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?
?
while_cond_23038
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_23038___redundant_placeholder03
/while_while_cond_23038___redundant_placeholder13
/while_while_cond_23038___redundant_placeholder23
/while_while_cond_23038___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?[
?
@__inference_rnn_1_layer_call_and_return_conditional_losses_22561
inputs_0B
0simple_rnn_cell_8_matmul_readvariableop_resource:>?
1simple_rnn_cell_8_biasadd_readvariableop_resource:>D
2simple_rnn_cell_8_matmul_1_readvariableop_resource:>>
identity??(simple_rnn_cell_8/BiasAdd/ReadVariableOp?'simple_rnn_cell_8/MatMul/ReadVariableOp?)simple_rnn_cell_8/MatMul_1/ReadVariableOp?whileF
ShapeShapeinputs_0*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputs_0transpose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????*
shrink_axis_mask2
strided_slice_2?
!simple_rnn_cell_8/ones_like/ShapeShapestrided_slice_2:output:0*
T0*
_output_shapes
:2#
!simple_rnn_cell_8/ones_like/Shape?
!simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2#
!simple_rnn_cell_8/ones_like/Const?
simple_rnn_cell_8/ones_likeFill*simple_rnn_cell_8/ones_like/Shape:output:0*simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/ones_like?
simple_rnn_cell_8/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2!
simple_rnn_cell_8/dropout/Const?
simple_rnn_cell_8/dropout/MulMul$simple_rnn_cell_8/ones_like:output:0(simple_rnn_cell_8/dropout/Const:output:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/dropout/Mul?
simple_rnn_cell_8/dropout/ShapeShape$simple_rnn_cell_8/ones_like:output:0*
T0*
_output_shapes
:2!
simple_rnn_cell_8/dropout/Shape?
6simple_rnn_cell_8/dropout/random_uniform/RandomUniformRandomUniform(simple_rnn_cell_8/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????*
dtype0*

seed4*
seed2???28
6simple_rnn_cell_8/dropout/random_uniform/RandomUniform?
(simple_rnn_cell_8/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???2*
(simple_rnn_cell_8/dropout/GreaterEqual/y?
&simple_rnn_cell_8/dropout/GreaterEqualGreaterEqual?simple_rnn_cell_8/dropout/random_uniform/RandomUniform:output:01simple_rnn_cell_8/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????2(
&simple_rnn_cell_8/dropout/GreaterEqual?
simple_rnn_cell_8/dropout/CastCast*simple_rnn_cell_8/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????2 
simple_rnn_cell_8/dropout/Cast?
simple_rnn_cell_8/dropout/Mul_1Mul!simple_rnn_cell_8/dropout/Mul:z:0"simple_rnn_cell_8/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????2!
simple_rnn_cell_8/dropout/Mul_1?
simple_rnn_cell_8/mulMulstrided_slice_2:output:0#simple_rnn_cell_8/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/mul?
'simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp0simple_rnn_cell_8_matmul_readvariableop_resource*
_output_shapes

:>*
dtype02)
'simple_rnn_cell_8/MatMul/ReadVariableOp?
simple_rnn_cell_8/MatMulMatMulsimple_rnn_cell_8/mul:z:0/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/MatMul?
(simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp1simple_rnn_cell_8_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype02*
(simple_rnn_cell_8/BiasAdd/ReadVariableOp?
simple_rnn_cell_8/BiasAddBiasAdd"simple_rnn_cell_8/MatMul:product:00simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/BiasAdd?
)simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp2simple_rnn_cell_8_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02+
)simple_rnn_cell_8/MatMul_1/ReadVariableOp?
simple_rnn_cell_8/MatMul_1MatMulzeros:output:01simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/MatMul_1?
simple_rnn_cell_8/addAddV2"simple_rnn_cell_8/BiasAdd:output:0$simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/add?
simple_rnn_cell_8/TanhTanhsimple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/Tanh?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:00simple_rnn_cell_8_matmul_readvariableop_resource1simple_rnn_cell_8_biasadd_readvariableop_resource2simple_rnn_cell_8_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_22483*
condR
while_cond_22482*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :??????????????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :??????????????????>2
transpose_1w
IdentityIdentitytranspose_1:y:0^NoOp*
T0*4
_output_shapes"
 :??????????????????>2

Identity?
NoOpNoOp)^simple_rnn_cell_8/BiasAdd/ReadVariableOp(^simple_rnn_cell_8/MatMul/ReadVariableOp*^simple_rnn_cell_8/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????: : : 2T
(simple_rnn_cell_8/BiasAdd/ReadVariableOp(simple_rnn_cell_8/BiasAdd/ReadVariableOp2R
'simple_rnn_cell_8/MatMul/ReadVariableOp'simple_rnn_cell_8/MatMul/ReadVariableOp2V
)simple_rnn_cell_8/MatMul_1/ReadVariableOp)simple_rnn_cell_8/MatMul_1/ReadVariableOp2
whilewhile:^ Z
4
_output_shapes"
 :??????????????????
"
_user_specified_name
inputs/0
?
?
,__inference_output_layer_layer_call_fn_23436

inputs
unknown:>
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *P
fKRI
G__inference_output_layer_layer_call_and_return_conditional_losses_212342
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????>: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????>
 
_user_specified_nameinputs
?

?
1__inference_simple_rnn_cell_8_layer_call_fn_23500

inputs
states_0
unknown:>
	unknown_0:>
	unknown_1:>>
identity

identity_1??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0unknown	unknown_0	unknown_1*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:?????????>:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_simple_rnn_cell_8_layer_call_and_return_conditional_losses_199192
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*'
_output_shapes
:?????????>2

Identity_1h
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:?????????:?????????>: : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs:QM
'
_output_shapes
:?????????>
"
_user_specified_name
states/0
?K
?
__inference__traced_save_23714
file_prefix2
.savev2_output_layer_kernel_read_readvariableop0
,savev2_output_layer_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop=
9savev2_rnn_1_simple_rnn_cell_8_kernel_read_readvariableopG
Csavev2_rnn_1_simple_rnn_cell_8_recurrent_kernel_read_readvariableop;
7savev2_rnn_1_simple_rnn_cell_8_bias_read_readvariableop=
9savev2_rnn_2_simple_rnn_cell_9_kernel_read_readvariableopG
Csavev2_rnn_2_simple_rnn_cell_9_recurrent_kernel_read_readvariableop;
7savev2_rnn_2_simple_rnn_cell_9_bias_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop9
5savev2_adam_output_layer_kernel_m_read_readvariableop7
3savev2_adam_output_layer_bias_m_read_readvariableopD
@savev2_adam_rnn_1_simple_rnn_cell_8_kernel_m_read_readvariableopN
Jsavev2_adam_rnn_1_simple_rnn_cell_8_recurrent_kernel_m_read_readvariableopB
>savev2_adam_rnn_1_simple_rnn_cell_8_bias_m_read_readvariableopD
@savev2_adam_rnn_2_simple_rnn_cell_9_kernel_m_read_readvariableopN
Jsavev2_adam_rnn_2_simple_rnn_cell_9_recurrent_kernel_m_read_readvariableopB
>savev2_adam_rnn_2_simple_rnn_cell_9_bias_m_read_readvariableop9
5savev2_adam_output_layer_kernel_v_read_readvariableop7
3savev2_adam_output_layer_bias_v_read_readvariableopD
@savev2_adam_rnn_1_simple_rnn_cell_8_kernel_v_read_readvariableopN
Jsavev2_adam_rnn_1_simple_rnn_cell_8_recurrent_kernel_v_read_readvariableopB
>savev2_adam_rnn_1_simple_rnn_cell_8_bias_v_read_readvariableopD
@savev2_adam_rnn_2_simple_rnn_cell_9_kernel_v_read_readvariableopN
Jsavev2_adam_rnn_2_simple_rnn_cell_9_recurrent_kernel_v_read_readvariableopB
>savev2_adam_rnn_2_simple_rnn_cell_9_bias_v_read_readvariableop
savev2_const

identity_1??MergeV2Checkpoints?
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1?
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard?
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename?
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:"*
dtype0*?
value?B?"B6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names?
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:"*
dtype0*W
valueNBL"B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slices?
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0.savev2_output_layer_kernel_read_readvariableop,savev2_output_layer_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop9savev2_rnn_1_simple_rnn_cell_8_kernel_read_readvariableopCsavev2_rnn_1_simple_rnn_cell_8_recurrent_kernel_read_readvariableop7savev2_rnn_1_simple_rnn_cell_8_bias_read_readvariableop9savev2_rnn_2_simple_rnn_cell_9_kernel_read_readvariableopCsavev2_rnn_2_simple_rnn_cell_9_recurrent_kernel_read_readvariableop7savev2_rnn_2_simple_rnn_cell_9_bias_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop5savev2_adam_output_layer_kernel_m_read_readvariableop3savev2_adam_output_layer_bias_m_read_readvariableop@savev2_adam_rnn_1_simple_rnn_cell_8_kernel_m_read_readvariableopJsavev2_adam_rnn_1_simple_rnn_cell_8_recurrent_kernel_m_read_readvariableop>savev2_adam_rnn_1_simple_rnn_cell_8_bias_m_read_readvariableop@savev2_adam_rnn_2_simple_rnn_cell_9_kernel_m_read_readvariableopJsavev2_adam_rnn_2_simple_rnn_cell_9_recurrent_kernel_m_read_readvariableop>savev2_adam_rnn_2_simple_rnn_cell_9_bias_m_read_readvariableop5savev2_adam_output_layer_kernel_v_read_readvariableop3savev2_adam_output_layer_bias_v_read_readvariableop@savev2_adam_rnn_1_simple_rnn_cell_8_kernel_v_read_readvariableopJsavev2_adam_rnn_1_simple_rnn_cell_8_recurrent_kernel_v_read_readvariableop>savev2_adam_rnn_1_simple_rnn_cell_8_bias_v_read_readvariableop@savev2_adam_rnn_2_simple_rnn_cell_9_kernel_v_read_readvariableopJsavev2_adam_rnn_2_simple_rnn_cell_9_recurrent_kernel_v_read_readvariableop>savev2_adam_rnn_2_simple_rnn_cell_9_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *0
dtypes&
$2"	2
SaveV2?
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes?
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identity_

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: 2

Identity_1c
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"!

identity_1Identity_1:output:0*?
_input_shapes?
?: :>:: : : : : :>:>>:>:>>:>>:>: : : : :>::>:>>:>:>>:>>:>:>::>:>>:>:>>:>>:>: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:$ 

_output_shapes

:>: 

_output_shapes
::

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :$ 

_output_shapes

:>:$	 

_output_shapes

:>>: 


_output_shapes
:>:$ 

_output_shapes

:>>:$ 

_output_shapes

:>>: 

_output_shapes
:>:

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :$ 

_output_shapes

:>: 

_output_shapes
::$ 

_output_shapes

:>:$ 

_output_shapes

:>>: 

_output_shapes
:>:$ 

_output_shapes

:>>:$ 

_output_shapes

:>>: 

_output_shapes
:>:$ 

_output_shapes

:>: 

_output_shapes
::$ 

_output_shapes

:>:$ 

_output_shapes

:>>: 

_output_shapes
:>:$ 

_output_shapes

:>>:$  

_output_shapes

:>>: !

_output_shapes
:>:"

_output_shapes
: 
?

?
1__inference_simple_rnn_cell_9_layer_call_fn_23578

inputs
states_0
unknown:>>
	unknown_0:>
	unknown_1:>>
identity

identity_1??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0unknown	unknown_0	unknown_1*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:?????????>:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_simple_rnn_cell_9_layer_call_and_return_conditional_losses_204692
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*'
_output_shapes
:?????????>2

Identity_1h
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:?????????>:?????????>: : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????>
 
_user_specified_nameinputs:QM
'
_output_shapes
:?????????>
"
_user_specified_name
states/0
?	
?
rnn_2_while_cond_22178(
$rnn_2_while_rnn_2_while_loop_counter.
*rnn_2_while_rnn_2_while_maximum_iterations
rnn_2_while_placeholder
rnn_2_while_placeholder_1
rnn_2_while_placeholder_2*
&rnn_2_while_less_rnn_2_strided_slice_1?
;rnn_2_while_rnn_2_while_cond_22178___redundant_placeholder0?
;rnn_2_while_rnn_2_while_cond_22178___redundant_placeholder1?
;rnn_2_while_rnn_2_while_cond_22178___redundant_placeholder2?
;rnn_2_while_rnn_2_while_cond_22178___redundant_placeholder3
rnn_2_while_identity
?
rnn_2/while/LessLessrnn_2_while_placeholder&rnn_2_while_less_rnn_2_strided_slice_1*
T0*
_output_shapes
: 2
rnn_2/while/Lesso
rnn_2/while/IdentityIdentityrnn_2/while/Less:z:0*
T0
*
_output_shapes
: 2
rnn_2/while/Identity"5
rnn_2_while_identityrnn_2/while/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?Z
?
@__inference_rnn_1_layer_call_and_return_conditional_losses_21577

inputsB
0simple_rnn_cell_8_matmul_readvariableop_resource:>?
1simple_rnn_cell_8_biasadd_readvariableop_resource:>D
2simple_rnn_cell_8_matmul_1_readvariableop_resource:>>
identity??(simple_rnn_cell_8/BiasAdd/ReadVariableOp?'simple_rnn_cell_8/MatMul/ReadVariableOp?)simple_rnn_cell_8/MatMul_1/ReadVariableOp?whileD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/permz
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:?????????2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????*
shrink_axis_mask2
strided_slice_2?
!simple_rnn_cell_8/ones_like/ShapeShapestrided_slice_2:output:0*
T0*
_output_shapes
:2#
!simple_rnn_cell_8/ones_like/Shape?
!simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2#
!simple_rnn_cell_8/ones_like/Const?
simple_rnn_cell_8/ones_likeFill*simple_rnn_cell_8/ones_like/Shape:output:0*simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/ones_like?
simple_rnn_cell_8/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2!
simple_rnn_cell_8/dropout/Const?
simple_rnn_cell_8/dropout/MulMul$simple_rnn_cell_8/ones_like:output:0(simple_rnn_cell_8/dropout/Const:output:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/dropout/Mul?
simple_rnn_cell_8/dropout/ShapeShape$simple_rnn_cell_8/ones_like:output:0*
T0*
_output_shapes
:2!
simple_rnn_cell_8/dropout/Shape?
6simple_rnn_cell_8/dropout/random_uniform/RandomUniformRandomUniform(simple_rnn_cell_8/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????*
dtype0*

seed4*
seed2Ǻ?28
6simple_rnn_cell_8/dropout/random_uniform/RandomUniform?
(simple_rnn_cell_8/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???2*
(simple_rnn_cell_8/dropout/GreaterEqual/y?
&simple_rnn_cell_8/dropout/GreaterEqualGreaterEqual?simple_rnn_cell_8/dropout/random_uniform/RandomUniform:output:01simple_rnn_cell_8/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????2(
&simple_rnn_cell_8/dropout/GreaterEqual?
simple_rnn_cell_8/dropout/CastCast*simple_rnn_cell_8/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????2 
simple_rnn_cell_8/dropout/Cast?
simple_rnn_cell_8/dropout/Mul_1Mul!simple_rnn_cell_8/dropout/Mul:z:0"simple_rnn_cell_8/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????2!
simple_rnn_cell_8/dropout/Mul_1?
simple_rnn_cell_8/mulMulstrided_slice_2:output:0#simple_rnn_cell_8/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/mul?
'simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp0simple_rnn_cell_8_matmul_readvariableop_resource*
_output_shapes

:>*
dtype02)
'simple_rnn_cell_8/MatMul/ReadVariableOp?
simple_rnn_cell_8/MatMulMatMulsimple_rnn_cell_8/mul:z:0/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/MatMul?
(simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp1simple_rnn_cell_8_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype02*
(simple_rnn_cell_8/BiasAdd/ReadVariableOp?
simple_rnn_cell_8/BiasAddBiasAdd"simple_rnn_cell_8/MatMul:product:00simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/BiasAdd?
)simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp2simple_rnn_cell_8_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02+
)simple_rnn_cell_8/MatMul_1/ReadVariableOp?
simple_rnn_cell_8/MatMul_1MatMulzeros:output:01simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/MatMul_1?
simple_rnn_cell_8/addAddV2"simple_rnn_cell_8/BiasAdd:output:0$simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/add?
simple_rnn_cell_8/TanhTanhsimple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/Tanh?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:00simple_rnn_cell_8_matmul_readvariableop_resource1simple_rnn_cell_8_biasadd_readvariableop_resource2simple_rnn_cell_8_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_21499*
condR
while_cond_21498*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:?????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*+
_output_shapes
:?????????>2
transpose_1n
IdentityIdentitytranspose_1:y:0^NoOp*
T0*+
_output_shapes
:?????????>2

Identity?
NoOpNoOp)^simple_rnn_cell_8/BiasAdd/ReadVariableOp(^simple_rnn_cell_8/MatMul/ReadVariableOp*^simple_rnn_cell_8/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????: : : 2T
(simple_rnn_cell_8/BiasAdd/ReadVariableOp(simple_rnn_cell_8/BiasAdd/ReadVariableOp2R
'simple_rnn_cell_8/MatMul/ReadVariableOp'simple_rnn_cell_8/MatMul/ReadVariableOp2V
)simple_rnn_cell_8/MatMul_1/ReadVariableOp)simple_rnn_cell_8/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
while_cond_22738
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_22738___redundant_placeholder03
/while_while_cond_22738___redundant_placeholder13
/while_while_cond_22738___redundant_placeholder23
/while_while_cond_22738___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
??
?

 __inference__wrapped_model_19863
input_layerZ
Hbitcoin_basic_rnn_rnn_1_simple_rnn_cell_8_matmul_readvariableop_resource:>W
Ibitcoin_basic_rnn_rnn_1_simple_rnn_cell_8_biasadd_readvariableop_resource:>\
Jbitcoin_basic_rnn_rnn_1_simple_rnn_cell_8_matmul_1_readvariableop_resource:>>Z
Hbitcoin_basic_rnn_rnn_2_simple_rnn_cell_9_matmul_readvariableop_resource:>>W
Ibitcoin_basic_rnn_rnn_2_simple_rnn_cell_9_biasadd_readvariableop_resource:>\
Jbitcoin_basic_rnn_rnn_2_simple_rnn_cell_9_matmul_1_readvariableop_resource:>>O
=bitcoin_basic_rnn_output_layer_matmul_readvariableop_resource:>L
>bitcoin_basic_rnn_output_layer_biasadd_readvariableop_resource:
identity??5bitcoin_basic_RNN/output_layer/BiasAdd/ReadVariableOp?4bitcoin_basic_RNN/output_layer/MatMul/ReadVariableOp?@bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp??bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp?Abitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp?bitcoin_basic_RNN/rnn_1/while?@bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp??bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp?Abitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp?bitcoin_basic_RNN/rnn_2/whiley
bitcoin_basic_RNN/rnn_1/ShapeShapeinput_layer*
T0*
_output_shapes
:2
bitcoin_basic_RNN/rnn_1/Shape?
+bitcoin_basic_RNN/rnn_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2-
+bitcoin_basic_RNN/rnn_1/strided_slice/stack?
-bitcoin_basic_RNN/rnn_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2/
-bitcoin_basic_RNN/rnn_1/strided_slice/stack_1?
-bitcoin_basic_RNN/rnn_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2/
-bitcoin_basic_RNN/rnn_1/strided_slice/stack_2?
%bitcoin_basic_RNN/rnn_1/strided_sliceStridedSlice&bitcoin_basic_RNN/rnn_1/Shape:output:04bitcoin_basic_RNN/rnn_1/strided_slice/stack:output:06bitcoin_basic_RNN/rnn_1/strided_slice/stack_1:output:06bitcoin_basic_RNN/rnn_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2'
%bitcoin_basic_RNN/rnn_1/strided_slice?
#bitcoin_basic_RNN/rnn_1/zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2%
#bitcoin_basic_RNN/rnn_1/zeros/mul/y?
!bitcoin_basic_RNN/rnn_1/zeros/mulMul.bitcoin_basic_RNN/rnn_1/strided_slice:output:0,bitcoin_basic_RNN/rnn_1/zeros/mul/y:output:0*
T0*
_output_shapes
: 2#
!bitcoin_basic_RNN/rnn_1/zeros/mul?
$bitcoin_basic_RNN/rnn_1/zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2&
$bitcoin_basic_RNN/rnn_1/zeros/Less/y?
"bitcoin_basic_RNN/rnn_1/zeros/LessLess%bitcoin_basic_RNN/rnn_1/zeros/mul:z:0-bitcoin_basic_RNN/rnn_1/zeros/Less/y:output:0*
T0*
_output_shapes
: 2$
"bitcoin_basic_RNN/rnn_1/zeros/Less?
&bitcoin_basic_RNN/rnn_1/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2(
&bitcoin_basic_RNN/rnn_1/zeros/packed/1?
$bitcoin_basic_RNN/rnn_1/zeros/packedPack.bitcoin_basic_RNN/rnn_1/strided_slice:output:0/bitcoin_basic_RNN/rnn_1/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2&
$bitcoin_basic_RNN/rnn_1/zeros/packed?
#bitcoin_basic_RNN/rnn_1/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2%
#bitcoin_basic_RNN/rnn_1/zeros/Const?
bitcoin_basic_RNN/rnn_1/zerosFill-bitcoin_basic_RNN/rnn_1/zeros/packed:output:0,bitcoin_basic_RNN/rnn_1/zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
bitcoin_basic_RNN/rnn_1/zeros?
&bitcoin_basic_RNN/rnn_1/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2(
&bitcoin_basic_RNN/rnn_1/transpose/perm?
!bitcoin_basic_RNN/rnn_1/transpose	Transposeinput_layer/bitcoin_basic_RNN/rnn_1/transpose/perm:output:0*
T0*+
_output_shapes
:?????????2#
!bitcoin_basic_RNN/rnn_1/transpose?
bitcoin_basic_RNN/rnn_1/Shape_1Shape%bitcoin_basic_RNN/rnn_1/transpose:y:0*
T0*
_output_shapes
:2!
bitcoin_basic_RNN/rnn_1/Shape_1?
-bitcoin_basic_RNN/rnn_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2/
-bitcoin_basic_RNN/rnn_1/strided_slice_1/stack?
/bitcoin_basic_RNN/rnn_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:21
/bitcoin_basic_RNN/rnn_1/strided_slice_1/stack_1?
/bitcoin_basic_RNN/rnn_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/bitcoin_basic_RNN/rnn_1/strided_slice_1/stack_2?
'bitcoin_basic_RNN/rnn_1/strided_slice_1StridedSlice(bitcoin_basic_RNN/rnn_1/Shape_1:output:06bitcoin_basic_RNN/rnn_1/strided_slice_1/stack:output:08bitcoin_basic_RNN/rnn_1/strided_slice_1/stack_1:output:08bitcoin_basic_RNN/rnn_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2)
'bitcoin_basic_RNN/rnn_1/strided_slice_1?
3bitcoin_basic_RNN/rnn_1/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????25
3bitcoin_basic_RNN/rnn_1/TensorArrayV2/element_shape?
%bitcoin_basic_RNN/rnn_1/TensorArrayV2TensorListReserve<bitcoin_basic_RNN/rnn_1/TensorArrayV2/element_shape:output:00bitcoin_basic_RNN/rnn_1/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02'
%bitcoin_basic_RNN/rnn_1/TensorArrayV2?
Mbitcoin_basic_RNN/rnn_1/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   2O
Mbitcoin_basic_RNN/rnn_1/TensorArrayUnstack/TensorListFromTensor/element_shape?
?bitcoin_basic_RNN/rnn_1/TensorArrayUnstack/TensorListFromTensorTensorListFromTensor%bitcoin_basic_RNN/rnn_1/transpose:y:0Vbitcoin_basic_RNN/rnn_1/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02A
?bitcoin_basic_RNN/rnn_1/TensorArrayUnstack/TensorListFromTensor?
-bitcoin_basic_RNN/rnn_1/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2/
-bitcoin_basic_RNN/rnn_1/strided_slice_2/stack?
/bitcoin_basic_RNN/rnn_1/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:21
/bitcoin_basic_RNN/rnn_1/strided_slice_2/stack_1?
/bitcoin_basic_RNN/rnn_1/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/bitcoin_basic_RNN/rnn_1/strided_slice_2/stack_2?
'bitcoin_basic_RNN/rnn_1/strided_slice_2StridedSlice%bitcoin_basic_RNN/rnn_1/transpose:y:06bitcoin_basic_RNN/rnn_1/strided_slice_2/stack:output:08bitcoin_basic_RNN/rnn_1/strided_slice_2/stack_1:output:08bitcoin_basic_RNN/rnn_1/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????*
shrink_axis_mask2)
'bitcoin_basic_RNN/rnn_1/strided_slice_2?
9bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/ones_like/ShapeShape0bitcoin_basic_RNN/rnn_1/strided_slice_2:output:0*
T0*
_output_shapes
:2;
9bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/ones_like/Shape?
9bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2;
9bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/ones_like/Const?
3bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/ones_likeFillBbitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/ones_like/Shape:output:0Bbitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????25
3bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/ones_like?
-bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/mulMul0bitcoin_basic_RNN/rnn_1/strided_slice_2:output:0<bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/ones_like:output:0*
T0*'
_output_shapes
:?????????2/
-bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/mul?
?bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOpHbitcoin_basic_rnn_rnn_1_simple_rnn_cell_8_matmul_readvariableop_resource*
_output_shapes

:>*
dtype02A
?bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp?
0bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMulMatMul1bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/mul:z:0Gbitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>22
0bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul?
@bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOpIbitcoin_basic_rnn_rnn_1_simple_rnn_cell_8_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype02B
@bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp?
1bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/BiasAddBiasAdd:bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul:product:0Hbitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>23
1bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/BiasAdd?
Abitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOpJbitcoin_basic_rnn_rnn_1_simple_rnn_cell_8_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02C
Abitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
2bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul_1MatMul&bitcoin_basic_RNN/rnn_1/zeros:output:0Ibitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>24
2bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul_1?
-bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/addAddV2:bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/BiasAdd:output:0<bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2/
-bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/add?
.bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/TanhTanh1bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>20
.bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/Tanh?
5bitcoin_basic_RNN/rnn_1/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   27
5bitcoin_basic_RNN/rnn_1/TensorArrayV2_1/element_shape?
'bitcoin_basic_RNN/rnn_1/TensorArrayV2_1TensorListReserve>bitcoin_basic_RNN/rnn_1/TensorArrayV2_1/element_shape:output:00bitcoin_basic_RNN/rnn_1/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'bitcoin_basic_RNN/rnn_1/TensorArrayV2_1~
bitcoin_basic_RNN/rnn_1/timeConst*
_output_shapes
: *
dtype0*
value	B : 2
bitcoin_basic_RNN/rnn_1/time?
0bitcoin_basic_RNN/rnn_1/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????22
0bitcoin_basic_RNN/rnn_1/while/maximum_iterations?
*bitcoin_basic_RNN/rnn_1/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2,
*bitcoin_basic_RNN/rnn_1/while/loop_counter?
bitcoin_basic_RNN/rnn_1/whileWhile3bitcoin_basic_RNN/rnn_1/while/loop_counter:output:09bitcoin_basic_RNN/rnn_1/while/maximum_iterations:output:0%bitcoin_basic_RNN/rnn_1/time:output:00bitcoin_basic_RNN/rnn_1/TensorArrayV2_1:handle:0&bitcoin_basic_RNN/rnn_1/zeros:output:00bitcoin_basic_RNN/rnn_1/strided_slice_1:output:0Obitcoin_basic_RNN/rnn_1/TensorArrayUnstack/TensorListFromTensor:output_handle:0Hbitcoin_basic_rnn_rnn_1_simple_rnn_cell_8_matmul_readvariableop_resourceIbitcoin_basic_rnn_rnn_1_simple_rnn_cell_8_biasadd_readvariableop_resourceJbitcoin_basic_rnn_rnn_1_simple_rnn_cell_8_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *4
body,R*
(bitcoin_basic_RNN_rnn_1_while_body_19671*4
cond,R*
(bitcoin_basic_RNN_rnn_1_while_cond_19670*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
bitcoin_basic_RNN/rnn_1/while?
Hbitcoin_basic_RNN/rnn_1/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2J
Hbitcoin_basic_RNN/rnn_1/TensorArrayV2Stack/TensorListStack/element_shape?
:bitcoin_basic_RNN/rnn_1/TensorArrayV2Stack/TensorListStackTensorListStack&bitcoin_basic_RNN/rnn_1/while:output:3Qbitcoin_basic_RNN/rnn_1/TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:?????????>*
element_dtype02<
:bitcoin_basic_RNN/rnn_1/TensorArrayV2Stack/TensorListStack?
-bitcoin_basic_RNN/rnn_1/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2/
-bitcoin_basic_RNN/rnn_1/strided_slice_3/stack?
/bitcoin_basic_RNN/rnn_1/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/bitcoin_basic_RNN/rnn_1/strided_slice_3/stack_1?
/bitcoin_basic_RNN/rnn_1/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/bitcoin_basic_RNN/rnn_1/strided_slice_3/stack_2?
'bitcoin_basic_RNN/rnn_1/strided_slice_3StridedSliceCbitcoin_basic_RNN/rnn_1/TensorArrayV2Stack/TensorListStack:tensor:06bitcoin_basic_RNN/rnn_1/strided_slice_3/stack:output:08bitcoin_basic_RNN/rnn_1/strided_slice_3/stack_1:output:08bitcoin_basic_RNN/rnn_1/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2)
'bitcoin_basic_RNN/rnn_1/strided_slice_3?
(bitcoin_basic_RNN/rnn_1/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2*
(bitcoin_basic_RNN/rnn_1/transpose_1/perm?
#bitcoin_basic_RNN/rnn_1/transpose_1	TransposeCbitcoin_basic_RNN/rnn_1/TensorArrayV2Stack/TensorListStack:tensor:01bitcoin_basic_RNN/rnn_1/transpose_1/perm:output:0*
T0*+
_output_shapes
:?????????>2%
#bitcoin_basic_RNN/rnn_1/transpose_1?
bitcoin_basic_RNN/rnn_2/ShapeShape'bitcoin_basic_RNN/rnn_1/transpose_1:y:0*
T0*
_output_shapes
:2
bitcoin_basic_RNN/rnn_2/Shape?
+bitcoin_basic_RNN/rnn_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2-
+bitcoin_basic_RNN/rnn_2/strided_slice/stack?
-bitcoin_basic_RNN/rnn_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2/
-bitcoin_basic_RNN/rnn_2/strided_slice/stack_1?
-bitcoin_basic_RNN/rnn_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2/
-bitcoin_basic_RNN/rnn_2/strided_slice/stack_2?
%bitcoin_basic_RNN/rnn_2/strided_sliceStridedSlice&bitcoin_basic_RNN/rnn_2/Shape:output:04bitcoin_basic_RNN/rnn_2/strided_slice/stack:output:06bitcoin_basic_RNN/rnn_2/strided_slice/stack_1:output:06bitcoin_basic_RNN/rnn_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2'
%bitcoin_basic_RNN/rnn_2/strided_slice?
#bitcoin_basic_RNN/rnn_2/zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2%
#bitcoin_basic_RNN/rnn_2/zeros/mul/y?
!bitcoin_basic_RNN/rnn_2/zeros/mulMul.bitcoin_basic_RNN/rnn_2/strided_slice:output:0,bitcoin_basic_RNN/rnn_2/zeros/mul/y:output:0*
T0*
_output_shapes
: 2#
!bitcoin_basic_RNN/rnn_2/zeros/mul?
$bitcoin_basic_RNN/rnn_2/zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2&
$bitcoin_basic_RNN/rnn_2/zeros/Less/y?
"bitcoin_basic_RNN/rnn_2/zeros/LessLess%bitcoin_basic_RNN/rnn_2/zeros/mul:z:0-bitcoin_basic_RNN/rnn_2/zeros/Less/y:output:0*
T0*
_output_shapes
: 2$
"bitcoin_basic_RNN/rnn_2/zeros/Less?
&bitcoin_basic_RNN/rnn_2/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2(
&bitcoin_basic_RNN/rnn_2/zeros/packed/1?
$bitcoin_basic_RNN/rnn_2/zeros/packedPack.bitcoin_basic_RNN/rnn_2/strided_slice:output:0/bitcoin_basic_RNN/rnn_2/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2&
$bitcoin_basic_RNN/rnn_2/zeros/packed?
#bitcoin_basic_RNN/rnn_2/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2%
#bitcoin_basic_RNN/rnn_2/zeros/Const?
bitcoin_basic_RNN/rnn_2/zerosFill-bitcoin_basic_RNN/rnn_2/zeros/packed:output:0,bitcoin_basic_RNN/rnn_2/zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
bitcoin_basic_RNN/rnn_2/zeros?
&bitcoin_basic_RNN/rnn_2/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2(
&bitcoin_basic_RNN/rnn_2/transpose/perm?
!bitcoin_basic_RNN/rnn_2/transpose	Transpose'bitcoin_basic_RNN/rnn_1/transpose_1:y:0/bitcoin_basic_RNN/rnn_2/transpose/perm:output:0*
T0*+
_output_shapes
:?????????>2#
!bitcoin_basic_RNN/rnn_2/transpose?
bitcoin_basic_RNN/rnn_2/Shape_1Shape%bitcoin_basic_RNN/rnn_2/transpose:y:0*
T0*
_output_shapes
:2!
bitcoin_basic_RNN/rnn_2/Shape_1?
-bitcoin_basic_RNN/rnn_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2/
-bitcoin_basic_RNN/rnn_2/strided_slice_1/stack?
/bitcoin_basic_RNN/rnn_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:21
/bitcoin_basic_RNN/rnn_2/strided_slice_1/stack_1?
/bitcoin_basic_RNN/rnn_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/bitcoin_basic_RNN/rnn_2/strided_slice_1/stack_2?
'bitcoin_basic_RNN/rnn_2/strided_slice_1StridedSlice(bitcoin_basic_RNN/rnn_2/Shape_1:output:06bitcoin_basic_RNN/rnn_2/strided_slice_1/stack:output:08bitcoin_basic_RNN/rnn_2/strided_slice_1/stack_1:output:08bitcoin_basic_RNN/rnn_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2)
'bitcoin_basic_RNN/rnn_2/strided_slice_1?
3bitcoin_basic_RNN/rnn_2/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????25
3bitcoin_basic_RNN/rnn_2/TensorArrayV2/element_shape?
%bitcoin_basic_RNN/rnn_2/TensorArrayV2TensorListReserve<bitcoin_basic_RNN/rnn_2/TensorArrayV2/element_shape:output:00bitcoin_basic_RNN/rnn_2/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02'
%bitcoin_basic_RNN/rnn_2/TensorArrayV2?
Mbitcoin_basic_RNN/rnn_2/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2O
Mbitcoin_basic_RNN/rnn_2/TensorArrayUnstack/TensorListFromTensor/element_shape?
?bitcoin_basic_RNN/rnn_2/TensorArrayUnstack/TensorListFromTensorTensorListFromTensor%bitcoin_basic_RNN/rnn_2/transpose:y:0Vbitcoin_basic_RNN/rnn_2/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02A
?bitcoin_basic_RNN/rnn_2/TensorArrayUnstack/TensorListFromTensor?
-bitcoin_basic_RNN/rnn_2/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2/
-bitcoin_basic_RNN/rnn_2/strided_slice_2/stack?
/bitcoin_basic_RNN/rnn_2/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:21
/bitcoin_basic_RNN/rnn_2/strided_slice_2/stack_1?
/bitcoin_basic_RNN/rnn_2/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/bitcoin_basic_RNN/rnn_2/strided_slice_2/stack_2?
'bitcoin_basic_RNN/rnn_2/strided_slice_2StridedSlice%bitcoin_basic_RNN/rnn_2/transpose:y:06bitcoin_basic_RNN/rnn_2/strided_slice_2/stack:output:08bitcoin_basic_RNN/rnn_2/strided_slice_2/stack_1:output:08bitcoin_basic_RNN/rnn_2/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2)
'bitcoin_basic_RNN/rnn_2/strided_slice_2?
9bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/ones_like/ShapeShape0bitcoin_basic_RNN/rnn_2/strided_slice_2:output:0*
T0*
_output_shapes
:2;
9bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/ones_like/Shape?
9bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2;
9bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/ones_like/Const?
3bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/ones_likeFillBbitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/ones_like/Shape:output:0Bbitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>25
3bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/ones_like?
-bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/mulMul0bitcoin_basic_RNN/rnn_2/strided_slice_2:output:0<bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/ones_like:output:0*
T0*'
_output_shapes
:?????????>2/
-bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/mul?
?bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOpHbitcoin_basic_rnn_rnn_2_simple_rnn_cell_9_matmul_readvariableop_resource*
_output_shapes

:>>*
dtype02A
?bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp?
0bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMulMatMul1bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/mul:z:0Gbitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>22
0bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul?
@bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOpIbitcoin_basic_rnn_rnn_2_simple_rnn_cell_9_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype02B
@bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp?
1bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/BiasAddBiasAdd:bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul:product:0Hbitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>23
1bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/BiasAdd?
Abitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOpJbitcoin_basic_rnn_rnn_2_simple_rnn_cell_9_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02C
Abitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
2bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul_1MatMul&bitcoin_basic_RNN/rnn_2/zeros:output:0Ibitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>24
2bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul_1?
-bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/addAddV2:bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/BiasAdd:output:0<bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2/
-bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/add?
.bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/TanhTanh1bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>20
.bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/Tanh?
5bitcoin_basic_RNN/rnn_2/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   27
5bitcoin_basic_RNN/rnn_2/TensorArrayV2_1/element_shape?
'bitcoin_basic_RNN/rnn_2/TensorArrayV2_1TensorListReserve>bitcoin_basic_RNN/rnn_2/TensorArrayV2_1/element_shape:output:00bitcoin_basic_RNN/rnn_2/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'bitcoin_basic_RNN/rnn_2/TensorArrayV2_1~
bitcoin_basic_RNN/rnn_2/timeConst*
_output_shapes
: *
dtype0*
value	B : 2
bitcoin_basic_RNN/rnn_2/time?
0bitcoin_basic_RNN/rnn_2/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????22
0bitcoin_basic_RNN/rnn_2/while/maximum_iterations?
*bitcoin_basic_RNN/rnn_2/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2,
*bitcoin_basic_RNN/rnn_2/while/loop_counter?
bitcoin_basic_RNN/rnn_2/whileWhile3bitcoin_basic_RNN/rnn_2/while/loop_counter:output:09bitcoin_basic_RNN/rnn_2/while/maximum_iterations:output:0%bitcoin_basic_RNN/rnn_2/time:output:00bitcoin_basic_RNN/rnn_2/TensorArrayV2_1:handle:0&bitcoin_basic_RNN/rnn_2/zeros:output:00bitcoin_basic_RNN/rnn_2/strided_slice_1:output:0Obitcoin_basic_RNN/rnn_2/TensorArrayUnstack/TensorListFromTensor:output_handle:0Hbitcoin_basic_rnn_rnn_2_simple_rnn_cell_9_matmul_readvariableop_resourceIbitcoin_basic_rnn_rnn_2_simple_rnn_cell_9_biasadd_readvariableop_resourceJbitcoin_basic_rnn_rnn_2_simple_rnn_cell_9_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *4
body,R*
(bitcoin_basic_RNN_rnn_2_while_body_19787*4
cond,R*
(bitcoin_basic_RNN_rnn_2_while_cond_19786*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
bitcoin_basic_RNN/rnn_2/while?
Hbitcoin_basic_RNN/rnn_2/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2J
Hbitcoin_basic_RNN/rnn_2/TensorArrayV2Stack/TensorListStack/element_shape?
:bitcoin_basic_RNN/rnn_2/TensorArrayV2Stack/TensorListStackTensorListStack&bitcoin_basic_RNN/rnn_2/while:output:3Qbitcoin_basic_RNN/rnn_2/TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:?????????>*
element_dtype02<
:bitcoin_basic_RNN/rnn_2/TensorArrayV2Stack/TensorListStack?
-bitcoin_basic_RNN/rnn_2/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2/
-bitcoin_basic_RNN/rnn_2/strided_slice_3/stack?
/bitcoin_basic_RNN/rnn_2/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/bitcoin_basic_RNN/rnn_2/strided_slice_3/stack_1?
/bitcoin_basic_RNN/rnn_2/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/bitcoin_basic_RNN/rnn_2/strided_slice_3/stack_2?
'bitcoin_basic_RNN/rnn_2/strided_slice_3StridedSliceCbitcoin_basic_RNN/rnn_2/TensorArrayV2Stack/TensorListStack:tensor:06bitcoin_basic_RNN/rnn_2/strided_slice_3/stack:output:08bitcoin_basic_RNN/rnn_2/strided_slice_3/stack_1:output:08bitcoin_basic_RNN/rnn_2/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2)
'bitcoin_basic_RNN/rnn_2/strided_slice_3?
(bitcoin_basic_RNN/rnn_2/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2*
(bitcoin_basic_RNN/rnn_2/transpose_1/perm?
#bitcoin_basic_RNN/rnn_2/transpose_1	TransposeCbitcoin_basic_RNN/rnn_2/TensorArrayV2Stack/TensorListStack:tensor:01bitcoin_basic_RNN/rnn_2/transpose_1/perm:output:0*
T0*+
_output_shapes
:?????????>2%
#bitcoin_basic_RNN/rnn_2/transpose_1?
4bitcoin_basic_RNN/output_layer/MatMul/ReadVariableOpReadVariableOp=bitcoin_basic_rnn_output_layer_matmul_readvariableop_resource*
_output_shapes

:>*
dtype026
4bitcoin_basic_RNN/output_layer/MatMul/ReadVariableOp?
%bitcoin_basic_RNN/output_layer/MatMulMatMul0bitcoin_basic_RNN/rnn_2/strided_slice_3:output:0<bitcoin_basic_RNN/output_layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2'
%bitcoin_basic_RNN/output_layer/MatMul?
5bitcoin_basic_RNN/output_layer/BiasAdd/ReadVariableOpReadVariableOp>bitcoin_basic_rnn_output_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype027
5bitcoin_basic_RNN/output_layer/BiasAdd/ReadVariableOp?
&bitcoin_basic_RNN/output_layer/BiasAddBiasAdd/bitcoin_basic_RNN/output_layer/MatMul:product:0=bitcoin_basic_RNN/output_layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2(
&bitcoin_basic_RNN/output_layer/BiasAdd?
IdentityIdentity/bitcoin_basic_RNN/output_layer/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identity?
NoOpNoOp6^bitcoin_basic_RNN/output_layer/BiasAdd/ReadVariableOp5^bitcoin_basic_RNN/output_layer/MatMul/ReadVariableOpA^bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp@^bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOpB^bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp^bitcoin_basic_RNN/rnn_1/whileA^bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp@^bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOpB^bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp^bitcoin_basic_RNN/rnn_2/while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':?????????: : : : : : : : 2n
5bitcoin_basic_RNN/output_layer/BiasAdd/ReadVariableOp5bitcoin_basic_RNN/output_layer/BiasAdd/ReadVariableOp2l
4bitcoin_basic_RNN/output_layer/MatMul/ReadVariableOp4bitcoin_basic_RNN/output_layer/MatMul/ReadVariableOp2?
@bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp@bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp2?
?bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp?bitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp2?
Abitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOpAbitcoin_basic_RNN/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp2>
bitcoin_basic_RNN/rnn_1/whilebitcoin_basic_RNN/rnn_1/while2?
@bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp@bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp2?
?bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp?bitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp2?
Abitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOpAbitcoin_basic_RNN/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp2>
bitcoin_basic_RNN/rnn_2/whilebitcoin_basic_RNN/rnn_2/while:X T
+
_output_shapes
:?????????
%
_user_specified_nameinput_layer
?D
?
while_body_22483
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0J
8while_simple_rnn_cell_8_matmul_readvariableop_resource_0:>G
9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0:>L
:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorH
6while_simple_rnn_cell_8_matmul_readvariableop_resource:>E
7while_simple_rnn_cell_8_biasadd_readvariableop_resource:>J
8while_simple_rnn_cell_8_matmul_1_readvariableop_resource:>>??.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?-while/simple_rnn_cell_8/MatMul/ReadVariableOp?/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/simple_rnn_cell_8/ones_like/ShapeShape0while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2)
'while/simple_rnn_cell_8/ones_like/Shape?
'while/simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'while/simple_rnn_cell_8/ones_like/Const?
!while/simple_rnn_cell_8/ones_likeFill0while/simple_rnn_cell_8/ones_like/Shape:output:00while/simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2#
!while/simple_rnn_cell_8/ones_like?
%while/simple_rnn_cell_8/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2'
%while/simple_rnn_cell_8/dropout/Const?
#while/simple_rnn_cell_8/dropout/MulMul*while/simple_rnn_cell_8/ones_like:output:0.while/simple_rnn_cell_8/dropout/Const:output:0*
T0*'
_output_shapes
:?????????2%
#while/simple_rnn_cell_8/dropout/Mul?
%while/simple_rnn_cell_8/dropout/ShapeShape*while/simple_rnn_cell_8/ones_like:output:0*
T0*
_output_shapes
:2'
%while/simple_rnn_cell_8/dropout/Shape?
<while/simple_rnn_cell_8/dropout/random_uniform/RandomUniformRandomUniform.while/simple_rnn_cell_8/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????*
dtype0*

seed4*
seed2??2>
<while/simple_rnn_cell_8/dropout/random_uniform/RandomUniform?
.while/simple_rnn_cell_8/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???20
.while/simple_rnn_cell_8/dropout/GreaterEqual/y?
,while/simple_rnn_cell_8/dropout/GreaterEqualGreaterEqualEwhile/simple_rnn_cell_8/dropout/random_uniform/RandomUniform:output:07while/simple_rnn_cell_8/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????2.
,while/simple_rnn_cell_8/dropout/GreaterEqual?
$while/simple_rnn_cell_8/dropout/CastCast0while/simple_rnn_cell_8/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????2&
$while/simple_rnn_cell_8/dropout/Cast?
%while/simple_rnn_cell_8/dropout/Mul_1Mul'while/simple_rnn_cell_8/dropout/Mul:z:0(while/simple_rnn_cell_8/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????2'
%while/simple_rnn_cell_8/dropout/Mul_1?
while/simple_rnn_cell_8/mulMul0while/TensorArrayV2Read/TensorListGetItem:item:0)while/simple_rnn_cell_8/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????2
while/simple_rnn_cell_8/mul?
-while/simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp8while_simple_rnn_cell_8_matmul_readvariableop_resource_0*
_output_shapes

:>*
dtype02/
-while/simple_rnn_cell_8/MatMul/ReadVariableOp?
while/simple_rnn_cell_8/MatMulMatMulwhile/simple_rnn_cell_8/mul:z:05while/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
while/simple_rnn_cell_8/MatMul?
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype020
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?
while/simple_rnn_cell_8/BiasAddBiasAdd(while/simple_rnn_cell_8/MatMul:product:06while/simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
while/simple_rnn_cell_8/BiasAdd?
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype021
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
 while/simple_rnn_cell_8/MatMul_1MatMulwhile_placeholder_27while/simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 while/simple_rnn_cell_8/MatMul_1?
while/simple_rnn_cell_8/addAddV2(while/simple_rnn_cell_8/BiasAdd:output:0*while/simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_8/add?
while/simple_rnn_cell_8/TanhTanhwhile/simple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_8/Tanh?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_8/Tanh:y:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity while/simple_rnn_cell_8/Tanh:y:0^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp/^while/simple_rnn_cell_8/BiasAdd/ReadVariableOp.^while/simple_rnn_cell_8/MatMul/ReadVariableOp0^while/simple_rnn_cell_8/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"t
7while_simple_rnn_cell_8_biasadd_readvariableop_resource9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0"v
8while_simple_rnn_cell_8_matmul_1_readvariableop_resource:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0"r
6while_simple_rnn_cell_8_matmul_readvariableop_resource8while_simple_rnn_cell_8_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2`
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp2^
-while/simple_rnn_cell_8/MatMul/ReadVariableOp-while/simple_rnn_cell_8/MatMul/ReadVariableOp2b
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?
?
while_cond_23294
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_23294___redundant_placeholder03
/while_while_cond_23294___redundant_placeholder13
/while_while_cond_23294___redundant_placeholder23
/while_while_cond_23294___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?#
?
while_body_20668
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_01
while_simple_rnn_cell_9_20690_0:>>-
while_simple_rnn_cell_9_20692_0:>1
while_simple_rnn_cell_9_20694_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor/
while_simple_rnn_cell_9_20690:>>+
while_simple_rnn_cell_9_20692:>/
while_simple_rnn_cell_9_20694:>>??/while/simple_rnn_cell_9/StatefulPartitionedCall?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????>*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
/while/simple_rnn_cell_9/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2while_simple_rnn_cell_9_20690_0while_simple_rnn_cell_9_20692_0while_simple_rnn_cell_9_20694_0*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:?????????>:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_simple_rnn_cell_9_layer_call_and_return_conditional_losses_2060121
/while/simple_rnn_cell_9/StatefulPartitionedCall?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder8while/simple_rnn_cell_9/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity8while/simple_rnn_cell_9/StatefulPartitionedCall:output:1^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp0^while/simple_rnn_cell_9/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"@
while_simple_rnn_cell_9_20690while_simple_rnn_cell_9_20690_0"@
while_simple_rnn_cell_9_20692while_simple_rnn_cell_9_20692_0"@
while_simple_rnn_cell_9_20694while_simple_rnn_cell_9_20694_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2b
/while/simple_rnn_cell_9/StatefulPartitionedCall/while/simple_rnn_cell_9/StatefulPartitionedCall: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?
?
%__inference_rnn_1_layer_call_fn_22828
inputs_0
unknown:>
	unknown_0:>
	unknown_1:>>
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0unknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_1_layer_call_and_return_conditional_losses_199952
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :??????????????????>2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????: : : 22
StatefulPartitionedCallStatefulPartitionedCall:^ Z
4
_output_shapes"
 :??????????????????
"
_user_specified_name
inputs/0
?
?
L__inference_simple_rnn_cell_9_layer_call_and_return_conditional_losses_20601

inputs

states0
matmul_readvariableop_resource:>>-
biasadd_readvariableop_resource:>2
 matmul_1_readvariableop_resource:>>
identity

identity_1??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOpX
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:2
ones_like/Shapeg
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2
ones_like/Const?
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2
	ones_likec
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2
dropout/Const
dropout/MulMulones_like:output:0dropout/Const:output:0*
T0*'
_output_shapes
:?????????>2
dropout/Mul`
dropout/ShapeShapeones_like:output:0*
T0*
_output_shapes
:2
dropout/Shape?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:?????????>*
dtype0*

seed4*
seed2???2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???2
dropout/GreaterEqual/y?
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????>2
dropout/GreaterEqual
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????>2
dropout/Castz
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:?????????>2
dropout/Mul_1^
mulMulinputsdropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????>2
mul?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:>>*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulmul:z:0MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:>*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2	
BiasAdd?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02
MatMul_1/ReadVariableOpy
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2

MatMul_1k
addAddV2BiasAdd:output:0MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
addO
TanhTanhadd:z:0*
T0*'
_output_shapes
:?????????>2
Tanhc
IdentityIdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identityg

Identity_1IdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity_1?
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:?????????>:?????????>: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????>
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????>
 
_user_specified_namestates
?N
?
@__inference_rnn_1_layer_call_and_return_conditional_losses_22425
inputs_0B
0simple_rnn_cell_8_matmul_readvariableop_resource:>?
1simple_rnn_cell_8_biasadd_readvariableop_resource:>D
2simple_rnn_cell_8_matmul_1_readvariableop_resource:>>
identity??(simple_rnn_cell_8/BiasAdd/ReadVariableOp?'simple_rnn_cell_8/MatMul/ReadVariableOp?)simple_rnn_cell_8/MatMul_1/ReadVariableOp?whileF
ShapeShapeinputs_0*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputs_0transpose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????*
shrink_axis_mask2
strided_slice_2?
!simple_rnn_cell_8/ones_like/ShapeShapestrided_slice_2:output:0*
T0*
_output_shapes
:2#
!simple_rnn_cell_8/ones_like/Shape?
!simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2#
!simple_rnn_cell_8/ones_like/Const?
simple_rnn_cell_8/ones_likeFill*simple_rnn_cell_8/ones_like/Shape:output:0*simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/ones_like?
simple_rnn_cell_8/mulMulstrided_slice_2:output:0$simple_rnn_cell_8/ones_like:output:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/mul?
'simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp0simple_rnn_cell_8_matmul_readvariableop_resource*
_output_shapes

:>*
dtype02)
'simple_rnn_cell_8/MatMul/ReadVariableOp?
simple_rnn_cell_8/MatMulMatMulsimple_rnn_cell_8/mul:z:0/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/MatMul?
(simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp1simple_rnn_cell_8_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype02*
(simple_rnn_cell_8/BiasAdd/ReadVariableOp?
simple_rnn_cell_8/BiasAddBiasAdd"simple_rnn_cell_8/MatMul:product:00simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/BiasAdd?
)simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp2simple_rnn_cell_8_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02+
)simple_rnn_cell_8/MatMul_1/ReadVariableOp?
simple_rnn_cell_8/MatMul_1MatMulzeros:output:01simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/MatMul_1?
simple_rnn_cell_8/addAddV2"simple_rnn_cell_8/BiasAdd:output:0$simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/add?
simple_rnn_cell_8/TanhTanhsimple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/Tanh?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:00simple_rnn_cell_8_matmul_readvariableop_resource1simple_rnn_cell_8_biasadd_readvariableop_resource2simple_rnn_cell_8_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_22355*
condR
while_cond_22354*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :??????????????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :??????????????????>2
transpose_1w
IdentityIdentitytranspose_1:y:0^NoOp*
T0*4
_output_shapes"
 :??????????????????>2

Identity?
NoOpNoOp)^simple_rnn_cell_8/BiasAdd/ReadVariableOp(^simple_rnn_cell_8/MatMul/ReadVariableOp*^simple_rnn_cell_8/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????: : : 2T
(simple_rnn_cell_8/BiasAdd/ReadVariableOp(simple_rnn_cell_8/BiasAdd/ReadVariableOp2R
'simple_rnn_cell_8/MatMul/ReadVariableOp'simple_rnn_cell_8/MatMul/ReadVariableOp2V
)simple_rnn_cell_8/MatMul_1/ReadVariableOp)simple_rnn_cell_8/MatMul_1/ReadVariableOp2
whilewhile:^ Z
4
_output_shapes"
 :??????????????????
"
_user_specified_name
inputs/0
?Z
?
@__inference_rnn_2_layer_call_and_return_conditional_losses_23373

inputsB
0simple_rnn_cell_9_matmul_readvariableop_resource:>>?
1simple_rnn_cell_9_biasadd_readvariableop_resource:>D
2simple_rnn_cell_9_matmul_1_readvariableop_resource:>>
identity??(simple_rnn_cell_9/BiasAdd/ReadVariableOp?'simple_rnn_cell_9/MatMul/ReadVariableOp?)simple_rnn_cell_9/MatMul_1/ReadVariableOp?whileD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/permz
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:?????????>2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_2?
!simple_rnn_cell_9/ones_like/ShapeShapestrided_slice_2:output:0*
T0*
_output_shapes
:2#
!simple_rnn_cell_9/ones_like/Shape?
!simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2#
!simple_rnn_cell_9/ones_like/Const?
simple_rnn_cell_9/ones_likeFill*simple_rnn_cell_9/ones_like/Shape:output:0*simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/ones_like?
simple_rnn_cell_9/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2!
simple_rnn_cell_9/dropout/Const?
simple_rnn_cell_9/dropout/MulMul$simple_rnn_cell_9/ones_like:output:0(simple_rnn_cell_9/dropout/Const:output:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/dropout/Mul?
simple_rnn_cell_9/dropout/ShapeShape$simple_rnn_cell_9/ones_like:output:0*
T0*
_output_shapes
:2!
simple_rnn_cell_9/dropout/Shape?
6simple_rnn_cell_9/dropout/random_uniform/RandomUniformRandomUniform(simple_rnn_cell_9/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????>*
dtype0*

seed4*
seed2???28
6simple_rnn_cell_9/dropout/random_uniform/RandomUniform?
(simple_rnn_cell_9/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???2*
(simple_rnn_cell_9/dropout/GreaterEqual/y?
&simple_rnn_cell_9/dropout/GreaterEqualGreaterEqual?simple_rnn_cell_9/dropout/random_uniform/RandomUniform:output:01simple_rnn_cell_9/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????>2(
&simple_rnn_cell_9/dropout/GreaterEqual?
simple_rnn_cell_9/dropout/CastCast*simple_rnn_cell_9/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????>2 
simple_rnn_cell_9/dropout/Cast?
simple_rnn_cell_9/dropout/Mul_1Mul!simple_rnn_cell_9/dropout/Mul:z:0"simple_rnn_cell_9/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????>2!
simple_rnn_cell_9/dropout/Mul_1?
simple_rnn_cell_9/mulMulstrided_slice_2:output:0#simple_rnn_cell_9/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/mul?
'simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp0simple_rnn_cell_9_matmul_readvariableop_resource*
_output_shapes

:>>*
dtype02)
'simple_rnn_cell_9/MatMul/ReadVariableOp?
simple_rnn_cell_9/MatMulMatMulsimple_rnn_cell_9/mul:z:0/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/MatMul?
(simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp1simple_rnn_cell_9_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype02*
(simple_rnn_cell_9/BiasAdd/ReadVariableOp?
simple_rnn_cell_9/BiasAddBiasAdd"simple_rnn_cell_9/MatMul:product:00simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/BiasAdd?
)simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp2simple_rnn_cell_9_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02+
)simple_rnn_cell_9/MatMul_1/ReadVariableOp?
simple_rnn_cell_9/MatMul_1MatMulzeros:output:01simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/MatMul_1?
simple_rnn_cell_9/addAddV2"simple_rnn_cell_9/BiasAdd:output:0$simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/add?
simple_rnn_cell_9/TanhTanhsimple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/Tanh?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:00simple_rnn_cell_9_matmul_readvariableop_resource1simple_rnn_cell_9_biasadd_readvariableop_resource2simple_rnn_cell_9_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_23295*
condR
while_cond_23294*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:?????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*+
_output_shapes
:?????????>2
transpose_1s
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity?
NoOpNoOp)^simple_rnn_cell_9/BiasAdd/ReadVariableOp(^simple_rnn_cell_9/MatMul/ReadVariableOp*^simple_rnn_cell_9/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????>: : : 2T
(simple_rnn_cell_9/BiasAdd/ReadVariableOp(simple_rnn_cell_9/BiasAdd/ReadVariableOp2R
'simple_rnn_cell_9/MatMul/ReadVariableOp'simple_rnn_cell_9/MatMul/ReadVariableOp2V
)simple_rnn_cell_9/MatMul_1/ReadVariableOp)simple_rnn_cell_9/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:?????????>
 
_user_specified_nameinputs
?
?
(bitcoin_basic_RNN_rnn_2_while_cond_19786L
Hbitcoin_basic_rnn_rnn_2_while_bitcoin_basic_rnn_rnn_2_while_loop_counterR
Nbitcoin_basic_rnn_rnn_2_while_bitcoin_basic_rnn_rnn_2_while_maximum_iterations-
)bitcoin_basic_rnn_rnn_2_while_placeholder/
+bitcoin_basic_rnn_rnn_2_while_placeholder_1/
+bitcoin_basic_rnn_rnn_2_while_placeholder_2N
Jbitcoin_basic_rnn_rnn_2_while_less_bitcoin_basic_rnn_rnn_2_strided_slice_1c
_bitcoin_basic_rnn_rnn_2_while_bitcoin_basic_rnn_rnn_2_while_cond_19786___redundant_placeholder0c
_bitcoin_basic_rnn_rnn_2_while_bitcoin_basic_rnn_rnn_2_while_cond_19786___redundant_placeholder1c
_bitcoin_basic_rnn_rnn_2_while_bitcoin_basic_rnn_rnn_2_while_cond_19786___redundant_placeholder2c
_bitcoin_basic_rnn_rnn_2_while_bitcoin_basic_rnn_rnn_2_while_cond_19786___redundant_placeholder3*
&bitcoin_basic_rnn_rnn_2_while_identity
?
"bitcoin_basic_RNN/rnn_2/while/LessLess)bitcoin_basic_rnn_rnn_2_while_placeholderJbitcoin_basic_rnn_rnn_2_while_less_bitcoin_basic_rnn_rnn_2_strided_slice_1*
T0*
_output_shapes
: 2$
"bitcoin_basic_RNN/rnn_2/while/Less?
&bitcoin_basic_RNN/rnn_2/while/IdentityIdentity&bitcoin_basic_RNN/rnn_2/while/Less:z:0*
T0
*
_output_shapes
: 2(
&bitcoin_basic_RNN/rnn_2/while/Identity"Y
&bitcoin_basic_rnn_rnn_2_while_identity/bitcoin_basic_RNN/rnn_2/while/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?
?
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_21632

inputs
rnn_1_21612:>
rnn_1_21614:>
rnn_1_21616:>>
rnn_2_21619:>>
rnn_2_21621:>
rnn_2_21623:>>$
output_layer_21626:> 
output_layer_21628:
identity??$output_layer/StatefulPartitionedCall?rnn_1/StatefulPartitionedCall?rnn_2/StatefulPartitionedCall?
rnn_1/StatefulPartitionedCallStatefulPartitionedCallinputsrnn_1_21612rnn_1_21614rnn_1_21616*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_1_layer_call_and_return_conditional_losses_215772
rnn_1/StatefulPartitionedCall?
rnn_2/StatefulPartitionedCallStatefulPartitionedCall&rnn_1/StatefulPartitionedCall:output:0rnn_2_21619rnn_2_21621rnn_2_21623*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_2_layer_call_and_return_conditional_losses_214192
rnn_2/StatefulPartitionedCall?
$output_layer/StatefulPartitionedCallStatefulPartitionedCall&rnn_2/StatefulPartitionedCall:output:0output_layer_21626output_layer_21628*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *P
fKRI
G__inference_output_layer_layer_call_and_return_conditional_losses_212342&
$output_layer/StatefulPartitionedCall?
IdentityIdentity-output_layer/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identity?
NoOpNoOp%^output_layer/StatefulPartitionedCall^rnn_1/StatefulPartitionedCall^rnn_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':?????????: : : : : : : : 2L
$output_layer/StatefulPartitionedCall$output_layer/StatefulPartitionedCall2>
rnn_1/StatefulPartitionedCallrnn_1/StatefulPartitionedCall2>
rnn_2/StatefulPartitionedCallrnn_2/StatefulPartitionedCall:S O
+
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
while_cond_23166
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_23166___redundant_placeholder03
/while_while_cond_23166___redundant_placeholder13
/while_while_cond_23166___redundant_placeholder23
/while_while_cond_23166___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?

?
1__inference_bitcoin_basic_RNN_layer_call_fn_22305

inputs
unknown:>
	unknown_0:>
	unknown_1:>>
	unknown_2:>>
	unknown_3:>
	unknown_4:>>
	unknown_5:>
	unknown_6:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_216322
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':?????????: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:?????????
 
_user_specified_nameinputs
?>
?	
rnn_2_while_body_21913(
$rnn_2_while_rnn_2_while_loop_counter.
*rnn_2_while_rnn_2_while_maximum_iterations
rnn_2_while_placeholder
rnn_2_while_placeholder_1
rnn_2_while_placeholder_2'
#rnn_2_while_rnn_2_strided_slice_1_0c
_rnn_2_while_tensorarrayv2read_tensorlistgetitem_rnn_2_tensorarrayunstack_tensorlistfromtensor_0P
>rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resource_0:>>M
?rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resource_0:>R
@rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0:>>
rnn_2_while_identity
rnn_2_while_identity_1
rnn_2_while_identity_2
rnn_2_while_identity_3
rnn_2_while_identity_4%
!rnn_2_while_rnn_2_strided_slice_1a
]rnn_2_while_tensorarrayv2read_tensorlistgetitem_rnn_2_tensorarrayunstack_tensorlistfromtensorN
<rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resource:>>K
=rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resource:>P
>rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resource:>>??4rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?3rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp?5rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
=rnn_2/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2?
=rnn_2/while/TensorArrayV2Read/TensorListGetItem/element_shape?
/rnn_2/while/TensorArrayV2Read/TensorListGetItemTensorListGetItem_rnn_2_while_tensorarrayv2read_tensorlistgetitem_rnn_2_tensorarrayunstack_tensorlistfromtensor_0rnn_2_while_placeholderFrnn_2/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????>*
element_dtype021
/rnn_2/while/TensorArrayV2Read/TensorListGetItem?
-rnn_2/while/simple_rnn_cell_9/ones_like/ShapeShape6rnn_2/while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2/
-rnn_2/while/simple_rnn_cell_9/ones_like/Shape?
-rnn_2/while/simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2/
-rnn_2/while/simple_rnn_cell_9/ones_like/Const?
'rnn_2/while/simple_rnn_cell_9/ones_likeFill6rnn_2/while/simple_rnn_cell_9/ones_like/Shape:output:06rnn_2/while/simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2)
'rnn_2/while/simple_rnn_cell_9/ones_like?
!rnn_2/while/simple_rnn_cell_9/mulMul6rnn_2/while/TensorArrayV2Read/TensorListGetItem:item:00rnn_2/while/simple_rnn_cell_9/ones_like:output:0*
T0*'
_output_shapes
:?????????>2#
!rnn_2/while/simple_rnn_cell_9/mul?
3rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp>rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resource_0*
_output_shapes

:>>*
dtype025
3rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp?
$rnn_2/while/simple_rnn_cell_9/MatMulMatMul%rnn_2/while/simple_rnn_cell_9/mul:z:0;rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2&
$rnn_2/while/simple_rnn_cell_9/MatMul?
4rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp?rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype026
4rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?
%rnn_2/while/simple_rnn_cell_9/BiasAddBiasAdd.rnn_2/while/simple_rnn_cell_9/MatMul:product:0<rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2'
%rnn_2/while/simple_rnn_cell_9/BiasAdd?
5rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp@rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype027
5rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
&rnn_2/while/simple_rnn_cell_9/MatMul_1MatMulrnn_2_while_placeholder_2=rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2(
&rnn_2/while/simple_rnn_cell_9/MatMul_1?
!rnn_2/while/simple_rnn_cell_9/addAddV2.rnn_2/while/simple_rnn_cell_9/BiasAdd:output:00rnn_2/while/simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2#
!rnn_2/while/simple_rnn_cell_9/add?
"rnn_2/while/simple_rnn_cell_9/TanhTanh%rnn_2/while/simple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2$
"rnn_2/while/simple_rnn_cell_9/Tanh?
0rnn_2/while/TensorArrayV2Write/TensorListSetItemTensorListSetItemrnn_2_while_placeholder_1rnn_2_while_placeholder&rnn_2/while/simple_rnn_cell_9/Tanh:y:0*
_output_shapes
: *
element_dtype022
0rnn_2/while/TensorArrayV2Write/TensorListSetItemh
rnn_2/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
rnn_2/while/add/y?
rnn_2/while/addAddV2rnn_2_while_placeholderrnn_2/while/add/y:output:0*
T0*
_output_shapes
: 2
rnn_2/while/addl
rnn_2/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
rnn_2/while/add_1/y?
rnn_2/while/add_1AddV2$rnn_2_while_rnn_2_while_loop_counterrnn_2/while/add_1/y:output:0*
T0*
_output_shapes
: 2
rnn_2/while/add_1?
rnn_2/while/IdentityIdentityrnn_2/while/add_1:z:0^rnn_2/while/NoOp*
T0*
_output_shapes
: 2
rnn_2/while/Identity?
rnn_2/while/Identity_1Identity*rnn_2_while_rnn_2_while_maximum_iterations^rnn_2/while/NoOp*
T0*
_output_shapes
: 2
rnn_2/while/Identity_1?
rnn_2/while/Identity_2Identityrnn_2/while/add:z:0^rnn_2/while/NoOp*
T0*
_output_shapes
: 2
rnn_2/while/Identity_2?
rnn_2/while/Identity_3Identity@rnn_2/while/TensorArrayV2Write/TensorListSetItem:output_handle:0^rnn_2/while/NoOp*
T0*
_output_shapes
: 2
rnn_2/while/Identity_3?
rnn_2/while/Identity_4Identity&rnn_2/while/simple_rnn_cell_9/Tanh:y:0^rnn_2/while/NoOp*
T0*'
_output_shapes
:?????????>2
rnn_2/while/Identity_4?
rnn_2/while/NoOpNoOp5^rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp4^rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp6^rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
rnn_2/while/NoOp"5
rnn_2_while_identityrnn_2/while/Identity:output:0"9
rnn_2_while_identity_1rnn_2/while/Identity_1:output:0"9
rnn_2_while_identity_2rnn_2/while/Identity_2:output:0"9
rnn_2_while_identity_3rnn_2/while/Identity_3:output:0"9
rnn_2_while_identity_4rnn_2/while/Identity_4:output:0"H
!rnn_2_while_rnn_2_strided_slice_1#rnn_2_while_rnn_2_strided_slice_1_0"?
=rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resource?rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resource_0"?
>rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resource@rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0"~
<rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resource>rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resource_0"?
]rnn_2_while_tensorarrayv2read_tensorlistgetitem_rnn_2_tensorarrayunstack_tensorlistfromtensor_rnn_2_while_tensorarrayv2read_tensorlistgetitem_rnn_2_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2l
4rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp4rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp2j
3rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp3rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp2n
5rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp5rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?

?
1__inference_bitcoin_basic_RNN_layer_call_fn_21260
input_layer
unknown:>
	unknown_0:>
	unknown_1:>>
	unknown_2:>>
	unknown_3:>
	unknown_4:>>
	unknown_5:>
	unknown_6:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_layerunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_212412
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':?????????: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
+
_output_shapes
:?????????
%
_user_specified_nameinput_layer
?
?
%__inference_rnn_2_layer_call_fn_23395
inputs_0
unknown:>>
	unknown_0:>
	unknown_1:>>
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0unknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_2_layer_call_and_return_conditional_losses_207312
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????>: : : 22
StatefulPartitionedCallStatefulPartitionedCall:^ Z
4
_output_shapes"
 :??????????????????>
"
_user_specified_name
inputs/0
?
?
%__inference_rnn_1_layer_call_fn_22850

inputs
unknown:>
	unknown_0:>
	unknown_1:>>
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_1_layer_call_and_return_conditional_losses_210892
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????>2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????: : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:?????????
 
_user_specified_nameinputs
?L
?	
rnn_2_while_body_22179(
$rnn_2_while_rnn_2_while_loop_counter.
*rnn_2_while_rnn_2_while_maximum_iterations
rnn_2_while_placeholder
rnn_2_while_placeholder_1
rnn_2_while_placeholder_2'
#rnn_2_while_rnn_2_strided_slice_1_0c
_rnn_2_while_tensorarrayv2read_tensorlistgetitem_rnn_2_tensorarrayunstack_tensorlistfromtensor_0P
>rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resource_0:>>M
?rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resource_0:>R
@rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0:>>
rnn_2_while_identity
rnn_2_while_identity_1
rnn_2_while_identity_2
rnn_2_while_identity_3
rnn_2_while_identity_4%
!rnn_2_while_rnn_2_strided_slice_1a
]rnn_2_while_tensorarrayv2read_tensorlistgetitem_rnn_2_tensorarrayunstack_tensorlistfromtensorN
<rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resource:>>K
=rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resource:>P
>rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resource:>>??4rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?3rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp?5rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
=rnn_2/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2?
=rnn_2/while/TensorArrayV2Read/TensorListGetItem/element_shape?
/rnn_2/while/TensorArrayV2Read/TensorListGetItemTensorListGetItem_rnn_2_while_tensorarrayv2read_tensorlistgetitem_rnn_2_tensorarrayunstack_tensorlistfromtensor_0rnn_2_while_placeholderFrnn_2/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????>*
element_dtype021
/rnn_2/while/TensorArrayV2Read/TensorListGetItem?
-rnn_2/while/simple_rnn_cell_9/ones_like/ShapeShape6rnn_2/while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2/
-rnn_2/while/simple_rnn_cell_9/ones_like/Shape?
-rnn_2/while/simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2/
-rnn_2/while/simple_rnn_cell_9/ones_like/Const?
'rnn_2/while/simple_rnn_cell_9/ones_likeFill6rnn_2/while/simple_rnn_cell_9/ones_like/Shape:output:06rnn_2/while/simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2)
'rnn_2/while/simple_rnn_cell_9/ones_like?
+rnn_2/while/simple_rnn_cell_9/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2-
+rnn_2/while/simple_rnn_cell_9/dropout/Const?
)rnn_2/while/simple_rnn_cell_9/dropout/MulMul0rnn_2/while/simple_rnn_cell_9/ones_like:output:04rnn_2/while/simple_rnn_cell_9/dropout/Const:output:0*
T0*'
_output_shapes
:?????????>2+
)rnn_2/while/simple_rnn_cell_9/dropout/Mul?
+rnn_2/while/simple_rnn_cell_9/dropout/ShapeShape0rnn_2/while/simple_rnn_cell_9/ones_like:output:0*
T0*
_output_shapes
:2-
+rnn_2/while/simple_rnn_cell_9/dropout/Shape?
Brnn_2/while/simple_rnn_cell_9/dropout/random_uniform/RandomUniformRandomUniform4rnn_2/while/simple_rnn_cell_9/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????>*
dtype0*

seed4*
seed2ԕ?2D
Brnn_2/while/simple_rnn_cell_9/dropout/random_uniform/RandomUniform?
4rnn_2/while/simple_rnn_cell_9/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???26
4rnn_2/while/simple_rnn_cell_9/dropout/GreaterEqual/y?
2rnn_2/while/simple_rnn_cell_9/dropout/GreaterEqualGreaterEqualKrnn_2/while/simple_rnn_cell_9/dropout/random_uniform/RandomUniform:output:0=rnn_2/while/simple_rnn_cell_9/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????>24
2rnn_2/while/simple_rnn_cell_9/dropout/GreaterEqual?
*rnn_2/while/simple_rnn_cell_9/dropout/CastCast6rnn_2/while/simple_rnn_cell_9/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????>2,
*rnn_2/while/simple_rnn_cell_9/dropout/Cast?
+rnn_2/while/simple_rnn_cell_9/dropout/Mul_1Mul-rnn_2/while/simple_rnn_cell_9/dropout/Mul:z:0.rnn_2/while/simple_rnn_cell_9/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????>2-
+rnn_2/while/simple_rnn_cell_9/dropout/Mul_1?
!rnn_2/while/simple_rnn_cell_9/mulMul6rnn_2/while/TensorArrayV2Read/TensorListGetItem:item:0/rnn_2/while/simple_rnn_cell_9/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????>2#
!rnn_2/while/simple_rnn_cell_9/mul?
3rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp>rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resource_0*
_output_shapes

:>>*
dtype025
3rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp?
$rnn_2/while/simple_rnn_cell_9/MatMulMatMul%rnn_2/while/simple_rnn_cell_9/mul:z:0;rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2&
$rnn_2/while/simple_rnn_cell_9/MatMul?
4rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp?rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype026
4rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?
%rnn_2/while/simple_rnn_cell_9/BiasAddBiasAdd.rnn_2/while/simple_rnn_cell_9/MatMul:product:0<rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2'
%rnn_2/while/simple_rnn_cell_9/BiasAdd?
5rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp@rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype027
5rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
&rnn_2/while/simple_rnn_cell_9/MatMul_1MatMulrnn_2_while_placeholder_2=rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2(
&rnn_2/while/simple_rnn_cell_9/MatMul_1?
!rnn_2/while/simple_rnn_cell_9/addAddV2.rnn_2/while/simple_rnn_cell_9/BiasAdd:output:00rnn_2/while/simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2#
!rnn_2/while/simple_rnn_cell_9/add?
"rnn_2/while/simple_rnn_cell_9/TanhTanh%rnn_2/while/simple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2$
"rnn_2/while/simple_rnn_cell_9/Tanh?
0rnn_2/while/TensorArrayV2Write/TensorListSetItemTensorListSetItemrnn_2_while_placeholder_1rnn_2_while_placeholder&rnn_2/while/simple_rnn_cell_9/Tanh:y:0*
_output_shapes
: *
element_dtype022
0rnn_2/while/TensorArrayV2Write/TensorListSetItemh
rnn_2/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
rnn_2/while/add/y?
rnn_2/while/addAddV2rnn_2_while_placeholderrnn_2/while/add/y:output:0*
T0*
_output_shapes
: 2
rnn_2/while/addl
rnn_2/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
rnn_2/while/add_1/y?
rnn_2/while/add_1AddV2$rnn_2_while_rnn_2_while_loop_counterrnn_2/while/add_1/y:output:0*
T0*
_output_shapes
: 2
rnn_2/while/add_1?
rnn_2/while/IdentityIdentityrnn_2/while/add_1:z:0^rnn_2/while/NoOp*
T0*
_output_shapes
: 2
rnn_2/while/Identity?
rnn_2/while/Identity_1Identity*rnn_2_while_rnn_2_while_maximum_iterations^rnn_2/while/NoOp*
T0*
_output_shapes
: 2
rnn_2/while/Identity_1?
rnn_2/while/Identity_2Identityrnn_2/while/add:z:0^rnn_2/while/NoOp*
T0*
_output_shapes
: 2
rnn_2/while/Identity_2?
rnn_2/while/Identity_3Identity@rnn_2/while/TensorArrayV2Write/TensorListSetItem:output_handle:0^rnn_2/while/NoOp*
T0*
_output_shapes
: 2
rnn_2/while/Identity_3?
rnn_2/while/Identity_4Identity&rnn_2/while/simple_rnn_cell_9/Tanh:y:0^rnn_2/while/NoOp*
T0*'
_output_shapes
:?????????>2
rnn_2/while/Identity_4?
rnn_2/while/NoOpNoOp5^rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp4^rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp6^rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
rnn_2/while/NoOp"5
rnn_2_while_identityrnn_2/while/Identity:output:0"9
rnn_2_while_identity_1rnn_2/while/Identity_1:output:0"9
rnn_2_while_identity_2rnn_2/while/Identity_2:output:0"9
rnn_2_while_identity_3rnn_2/while/Identity_3:output:0"9
rnn_2_while_identity_4rnn_2/while/Identity_4:output:0"H
!rnn_2_while_rnn_2_strided_slice_1#rnn_2_while_rnn_2_strided_slice_1_0"?
=rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resource?rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resource_0"?
>rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resource@rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0"~
<rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resource>rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resource_0"?
]rnn_2_while_tensorarrayv2read_tensorlistgetitem_rnn_2_tensorarrayunstack_tensorlistfromtensor_rnn_2_while_tensorarrayv2read_tensorlistgetitem_rnn_2_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2l
4rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp4rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp2j
3rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp3rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp2n
5rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp5rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?
?
while_cond_19931
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_19931___redundant_placeholder03
/while_while_cond_19931___redundant_placeholder13
/while_while_cond_19931___redundant_placeholder23
/while_while_cond_19931___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?

?
G__inference_output_layer_layer_call_and_return_conditional_losses_23427

inputs0
matmul_readvariableop_resource:>-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:>*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2	
BiasAddk
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????>: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????>
 
_user_specified_nameinputs
?
?
while_cond_22482
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_22482___redundant_placeholder03
/while_while_cond_22482___redundant_placeholder13
/while_while_cond_22482___redundant_placeholder23
/while_while_cond_22482___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?

?
G__inference_output_layer_layer_call_and_return_conditional_losses_21234

inputs0
matmul_readvariableop_resource:>-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:>*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2	
BiasAddk
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????>: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????>
 
_user_specified_nameinputs
?
?
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_21695
input_layer
rnn_1_21675:>
rnn_1_21677:>
rnn_1_21679:>>
rnn_2_21682:>>
rnn_2_21684:>
rnn_2_21686:>>$
output_layer_21689:> 
output_layer_21691:
identity??$output_layer/StatefulPartitionedCall?rnn_1/StatefulPartitionedCall?rnn_2/StatefulPartitionedCall?
rnn_1/StatefulPartitionedCallStatefulPartitionedCallinput_layerrnn_1_21675rnn_1_21677rnn_1_21679*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_1_layer_call_and_return_conditional_losses_210892
rnn_1/StatefulPartitionedCall?
rnn_2/StatefulPartitionedCallStatefulPartitionedCall&rnn_1/StatefulPartitionedCall:output:0rnn_2_21682rnn_2_21684rnn_2_21686*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_2_layer_call_and_return_conditional_losses_212162
rnn_2/StatefulPartitionedCall?
$output_layer/StatefulPartitionedCallStatefulPartitionedCall&rnn_2/StatefulPartitionedCall:output:0output_layer_21689output_layer_21691*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *P
fKRI
G__inference_output_layer_layer_call_and_return_conditional_losses_212342&
$output_layer/StatefulPartitionedCall?
IdentityIdentity-output_layer/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identity?
NoOpNoOp%^output_layer/StatefulPartitionedCall^rnn_1/StatefulPartitionedCall^rnn_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':?????????: : : : : : : : 2L
$output_layer/StatefulPartitionedCall$output_layer/StatefulPartitionedCall2>
rnn_1/StatefulPartitionedCallrnn_1/StatefulPartitionedCall2>
rnn_2/StatefulPartitionedCallrnn_2/StatefulPartitionedCall:X T
+
_output_shapes
:?????????
%
_user_specified_nameinput_layer
?
?
while_cond_21340
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_21340___redundant_placeholder03
/while_while_cond_21340___redundant_placeholder13
/while_while_cond_21340___redundant_placeholder23
/while_while_cond_21340___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?

?
1__inference_bitcoin_basic_RNN_layer_call_fn_21672
input_layer
unknown:>
	unknown_0:>
	unknown_1:>>
	unknown_2:>>
	unknown_3:>
	unknown_4:>>
	unknown_5:>
	unknown_6:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_layerunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_216322
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':?????????: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
+
_output_shapes
:?????????
%
_user_specified_nameinput_layer
?
?
%__inference_rnn_2_layer_call_fn_23384
inputs_0
unknown:>>
	unknown_0:>
	unknown_1:>>
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0unknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_2_layer_call_and_return_conditional_losses_205452
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????>: : : 22
StatefulPartitionedCallStatefulPartitionedCall:^ Z
4
_output_shapes"
 :??????????????????>
"
_user_specified_name
inputs/0
?
?
while_cond_22354
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_22354___redundant_placeholder03
/while_while_cond_22354___redundant_placeholder13
/while_while_cond_22354___redundant_placeholder23
/while_while_cond_22354___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?D
?
while_body_23039
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0J
8while_simple_rnn_cell_9_matmul_readvariableop_resource_0:>>G
9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0:>L
:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorH
6while_simple_rnn_cell_9_matmul_readvariableop_resource:>>E
7while_simple_rnn_cell_9_biasadd_readvariableop_resource:>J
8while_simple_rnn_cell_9_matmul_1_readvariableop_resource:>>??.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?-while/simple_rnn_cell_9/MatMul/ReadVariableOp?/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????>*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/simple_rnn_cell_9/ones_like/ShapeShape0while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2)
'while/simple_rnn_cell_9/ones_like/Shape?
'while/simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'while/simple_rnn_cell_9/ones_like/Const?
!while/simple_rnn_cell_9/ones_likeFill0while/simple_rnn_cell_9/ones_like/Shape:output:00while/simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2#
!while/simple_rnn_cell_9/ones_like?
%while/simple_rnn_cell_9/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2'
%while/simple_rnn_cell_9/dropout/Const?
#while/simple_rnn_cell_9/dropout/MulMul*while/simple_rnn_cell_9/ones_like:output:0.while/simple_rnn_cell_9/dropout/Const:output:0*
T0*'
_output_shapes
:?????????>2%
#while/simple_rnn_cell_9/dropout/Mul?
%while/simple_rnn_cell_9/dropout/ShapeShape*while/simple_rnn_cell_9/ones_like:output:0*
T0*
_output_shapes
:2'
%while/simple_rnn_cell_9/dropout/Shape?
<while/simple_rnn_cell_9/dropout/random_uniform/RandomUniformRandomUniform.while/simple_rnn_cell_9/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????>*
dtype0*

seed4*
seed2??2>
<while/simple_rnn_cell_9/dropout/random_uniform/RandomUniform?
.while/simple_rnn_cell_9/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???20
.while/simple_rnn_cell_9/dropout/GreaterEqual/y?
,while/simple_rnn_cell_9/dropout/GreaterEqualGreaterEqualEwhile/simple_rnn_cell_9/dropout/random_uniform/RandomUniform:output:07while/simple_rnn_cell_9/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????>2.
,while/simple_rnn_cell_9/dropout/GreaterEqual?
$while/simple_rnn_cell_9/dropout/CastCast0while/simple_rnn_cell_9/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????>2&
$while/simple_rnn_cell_9/dropout/Cast?
%while/simple_rnn_cell_9/dropout/Mul_1Mul'while/simple_rnn_cell_9/dropout/Mul:z:0(while/simple_rnn_cell_9/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????>2'
%while/simple_rnn_cell_9/dropout/Mul_1?
while/simple_rnn_cell_9/mulMul0while/TensorArrayV2Read/TensorListGetItem:item:0)while/simple_rnn_cell_9/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/mul?
-while/simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp8while_simple_rnn_cell_9_matmul_readvariableop_resource_0*
_output_shapes

:>>*
dtype02/
-while/simple_rnn_cell_9/MatMul/ReadVariableOp?
while/simple_rnn_cell_9/MatMulMatMulwhile/simple_rnn_cell_9/mul:z:05while/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
while/simple_rnn_cell_9/MatMul?
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype020
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?
while/simple_rnn_cell_9/BiasAddBiasAdd(while/simple_rnn_cell_9/MatMul:product:06while/simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
while/simple_rnn_cell_9/BiasAdd?
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype021
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
 while/simple_rnn_cell_9/MatMul_1MatMulwhile_placeholder_27while/simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 while/simple_rnn_cell_9/MatMul_1?
while/simple_rnn_cell_9/addAddV2(while/simple_rnn_cell_9/BiasAdd:output:0*while/simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/add?
while/simple_rnn_cell_9/TanhTanhwhile/simple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/Tanh?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_9/Tanh:y:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity while/simple_rnn_cell_9/Tanh:y:0^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp/^while/simple_rnn_cell_9/BiasAdd/ReadVariableOp.^while/simple_rnn_cell_9/MatMul/ReadVariableOp0^while/simple_rnn_cell_9/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"t
7while_simple_rnn_cell_9_biasadd_readvariableop_resource9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0"v
8while_simple_rnn_cell_9_matmul_1_readvariableop_resource:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0"r
6while_simple_rnn_cell_9_matmul_readvariableop_resource8while_simple_rnn_cell_9_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2`
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp2^
-while/simple_rnn_cell_9/MatMul/ReadVariableOp-while/simple_rnn_cell_9/MatMul/ReadVariableOp2b
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?#
?
while_body_20482
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_01
while_simple_rnn_cell_9_20504_0:>>-
while_simple_rnn_cell_9_20506_0:>1
while_simple_rnn_cell_9_20508_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor/
while_simple_rnn_cell_9_20504:>>+
while_simple_rnn_cell_9_20506:>/
while_simple_rnn_cell_9_20508:>>??/while/simple_rnn_cell_9/StatefulPartitionedCall?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????>*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
/while/simple_rnn_cell_9/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2while_simple_rnn_cell_9_20504_0while_simple_rnn_cell_9_20506_0while_simple_rnn_cell_9_20508_0*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:?????????>:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_simple_rnn_cell_9_layer_call_and_return_conditional_losses_2046921
/while/simple_rnn_cell_9/StatefulPartitionedCall?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder8while/simple_rnn_cell_9/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity8while/simple_rnn_cell_9/StatefulPartitionedCall:output:1^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp0^while/simple_rnn_cell_9/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"@
while_simple_rnn_cell_9_20504while_simple_rnn_cell_9_20504_0"@
while_simple_rnn_cell_9_20506while_simple_rnn_cell_9_20506_0"@
while_simple_rnn_cell_9_20508while_simple_rnn_cell_9_20508_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2b
/while/simple_rnn_cell_9/StatefulPartitionedCall/while/simple_rnn_cell_9/StatefulPartitionedCall: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?	
?
#__inference_signature_wrapper_21747
input_layer
unknown:>
	unknown_0:>
	unknown_1:>>
	unknown_2:>>
	unknown_3:>
	unknown_4:>>
	unknown_5:>
	unknown_6:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_layerunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8? *)
f$R"
 __inference__wrapped_model_198632
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':?????????: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
+
_output_shapes
:?????????
%
_user_specified_nameinput_layer
?
?
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_21718
input_layer
rnn_1_21698:>
rnn_1_21700:>
rnn_1_21702:>>
rnn_2_21705:>>
rnn_2_21707:>
rnn_2_21709:>>$
output_layer_21712:> 
output_layer_21714:
identity??$output_layer/StatefulPartitionedCall?rnn_1/StatefulPartitionedCall?rnn_2/StatefulPartitionedCall?
rnn_1/StatefulPartitionedCallStatefulPartitionedCallinput_layerrnn_1_21698rnn_1_21700rnn_1_21702*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_1_layer_call_and_return_conditional_losses_215772
rnn_1/StatefulPartitionedCall?
rnn_2/StatefulPartitionedCallStatefulPartitionedCall&rnn_1/StatefulPartitionedCall:output:0rnn_2_21705rnn_2_21707rnn_2_21709*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_2_layer_call_and_return_conditional_losses_214192
rnn_2/StatefulPartitionedCall?
$output_layer/StatefulPartitionedCallStatefulPartitionedCall&rnn_2/StatefulPartitionedCall:output:0output_layer_21712output_layer_21714*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *P
fKRI
G__inference_output_layer_layer_call_and_return_conditional_losses_212342&
$output_layer/StatefulPartitionedCall?
IdentityIdentity-output_layer/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identity?
NoOpNoOp%^output_layer/StatefulPartitionedCall^rnn_1/StatefulPartitionedCall^rnn_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':?????????: : : : : : : : 2L
$output_layer/StatefulPartitionedCall$output_layer/StatefulPartitionedCall2>
rnn_1/StatefulPartitionedCallrnn_1/StatefulPartitionedCall2>
rnn_2/StatefulPartitionedCallrnn_2/StatefulPartitionedCall:X T
+
_output_shapes
:?????????
%
_user_specified_nameinput_layer
?
?
L__inference_simple_rnn_cell_8_layer_call_and_return_conditional_losses_23486

inputs
states_00
matmul_readvariableop_resource:>-
biasadd_readvariableop_resource:>2
 matmul_1_readvariableop_resource:>>
identity

identity_1??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOpX
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:2
ones_like/Shapeg
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2
ones_like/Const?
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2
	ones_likec
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2
dropout/Const
dropout/MulMulones_like:output:0dropout/Const:output:0*
T0*'
_output_shapes
:?????????2
dropout/Mul`
dropout/ShapeShapeones_like:output:0*
T0*
_output_shapes
:2
dropout/Shape?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:?????????*
dtype0*

seed4*
seed2???2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???2
dropout/GreaterEqual/y?
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????2
dropout/GreaterEqual
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????2
dropout/Castz
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:?????????2
dropout/Mul_1^
mulMulinputsdropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????2
mul?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:>*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulmul:z:0MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:>*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2	
BiasAdd?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02
MatMul_1/ReadVariableOp{
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2

MatMul_1k
addAddV2BiasAdd:output:0MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
addO
TanhTanhadd:z:0*
T0*'
_output_shapes
:?????????>2
Tanhc
IdentityIdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identityg

Identity_1IdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity_1?
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:?????????:?????????>: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs:QM
'
_output_shapes
:?????????>
"
_user_specified_name
states/0
?
?
L__inference_simple_rnn_cell_9_layer_call_and_return_conditional_losses_23535

inputs
states_00
matmul_readvariableop_resource:>>-
biasadd_readvariableop_resource:>2
 matmul_1_readvariableop_resource:>>
identity

identity_1??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOpX
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:2
ones_like/Shapeg
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2
ones_like/Const?
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2
	ones_like_
mulMulinputsones_like:output:0*
T0*'
_output_shapes
:?????????>2
mul?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:>>*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulmul:z:0MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:>*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2	
BiasAdd?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02
MatMul_1/ReadVariableOp{
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2

MatMul_1k
addAddV2BiasAdd:output:0MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
addO
TanhTanhadd:z:0*
T0*'
_output_shapes
:?????????>2
Tanhc
IdentityIdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identityg

Identity_1IdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity_1?
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:?????????>:?????????>: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????>
 
_user_specified_nameinputs:QM
'
_output_shapes
:?????????>
"
_user_specified_name
states/0
?
?
while_cond_21498
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_21498___redundant_placeholder03
/while_while_cond_21498___redundant_placeholder13
/while_while_cond_21498___redundant_placeholder23
/while_while_cond_21498___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?>
?
@__inference_rnn_2_layer_call_and_return_conditional_losses_20545

inputs)
simple_rnn_cell_9_20470:>>%
simple_rnn_cell_9_20472:>)
simple_rnn_cell_9_20474:>>
identity??)simple_rnn_cell_9/StatefulPartitionedCall?whileD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????>2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_2?
)simple_rnn_cell_9/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0simple_rnn_cell_9_20470simple_rnn_cell_9_20472simple_rnn_cell_9_20474*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:?????????>:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_simple_rnn_cell_9_layer_call_and_return_conditional_losses_204692+
)simple_rnn_cell_9/StatefulPartitionedCall?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0simple_rnn_cell_9_20470simple_rnn_cell_9_20472simple_rnn_cell_9_20474*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_20482*
condR
while_cond_20481*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :??????????????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :??????????????????>2
transpose_1s
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity?
NoOpNoOp*^simple_rnn_cell_9/StatefulPartitionedCall^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????>: : : 2V
)simple_rnn_cell_9/StatefulPartitionedCall)simple_rnn_cell_9/StatefulPartitionedCall2
whilewhile:\ X
4
_output_shapes"
 :??????????????????>
 
_user_specified_nameinputs
?
?
%__inference_rnn_1_layer_call_fn_22839
inputs_0
unknown:>
	unknown_0:>
	unknown_1:>>
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0unknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_1_layer_call_and_return_conditional_losses_201812
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :??????????????????>2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????: : : 22
StatefulPartitionedCallStatefulPartitionedCall:^ Z
4
_output_shapes"
 :??????????????????
"
_user_specified_name
inputs/0
?
?
(bitcoin_basic_RNN_rnn_1_while_cond_19670L
Hbitcoin_basic_rnn_rnn_1_while_bitcoin_basic_rnn_rnn_1_while_loop_counterR
Nbitcoin_basic_rnn_rnn_1_while_bitcoin_basic_rnn_rnn_1_while_maximum_iterations-
)bitcoin_basic_rnn_rnn_1_while_placeholder/
+bitcoin_basic_rnn_rnn_1_while_placeholder_1/
+bitcoin_basic_rnn_rnn_1_while_placeholder_2N
Jbitcoin_basic_rnn_rnn_1_while_less_bitcoin_basic_rnn_rnn_1_strided_slice_1c
_bitcoin_basic_rnn_rnn_1_while_bitcoin_basic_rnn_rnn_1_while_cond_19670___redundant_placeholder0c
_bitcoin_basic_rnn_rnn_1_while_bitcoin_basic_rnn_rnn_1_while_cond_19670___redundant_placeholder1c
_bitcoin_basic_rnn_rnn_1_while_bitcoin_basic_rnn_rnn_1_while_cond_19670___redundant_placeholder2c
_bitcoin_basic_rnn_rnn_1_while_bitcoin_basic_rnn_rnn_1_while_cond_19670___redundant_placeholder3*
&bitcoin_basic_rnn_rnn_1_while_identity
?
"bitcoin_basic_RNN/rnn_1/while/LessLess)bitcoin_basic_rnn_rnn_1_while_placeholderJbitcoin_basic_rnn_rnn_1_while_less_bitcoin_basic_rnn_rnn_1_strided_slice_1*
T0*
_output_shapes
: 2$
"bitcoin_basic_RNN/rnn_1/while/Less?
&bitcoin_basic_RNN/rnn_1/while/IdentityIdentity&bitcoin_basic_RNN/rnn_1/while/Less:z:0*
T0
*
_output_shapes
: 2(
&bitcoin_basic_RNN/rnn_1/while/Identity"Y
&bitcoin_basic_rnn_rnn_1_while_identity/bitcoin_basic_RNN/rnn_1/while/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?N
?
@__inference_rnn_1_layer_call_and_return_conditional_losses_22681

inputsB
0simple_rnn_cell_8_matmul_readvariableop_resource:>?
1simple_rnn_cell_8_biasadd_readvariableop_resource:>D
2simple_rnn_cell_8_matmul_1_readvariableop_resource:>>
identity??(simple_rnn_cell_8/BiasAdd/ReadVariableOp?'simple_rnn_cell_8/MatMul/ReadVariableOp?)simple_rnn_cell_8/MatMul_1/ReadVariableOp?whileD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/permz
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:?????????2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????*
shrink_axis_mask2
strided_slice_2?
!simple_rnn_cell_8/ones_like/ShapeShapestrided_slice_2:output:0*
T0*
_output_shapes
:2#
!simple_rnn_cell_8/ones_like/Shape?
!simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2#
!simple_rnn_cell_8/ones_like/Const?
simple_rnn_cell_8/ones_likeFill*simple_rnn_cell_8/ones_like/Shape:output:0*simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/ones_like?
simple_rnn_cell_8/mulMulstrided_slice_2:output:0$simple_rnn_cell_8/ones_like:output:0*
T0*'
_output_shapes
:?????????2
simple_rnn_cell_8/mul?
'simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp0simple_rnn_cell_8_matmul_readvariableop_resource*
_output_shapes

:>*
dtype02)
'simple_rnn_cell_8/MatMul/ReadVariableOp?
simple_rnn_cell_8/MatMulMatMulsimple_rnn_cell_8/mul:z:0/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/MatMul?
(simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp1simple_rnn_cell_8_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype02*
(simple_rnn_cell_8/BiasAdd/ReadVariableOp?
simple_rnn_cell_8/BiasAddBiasAdd"simple_rnn_cell_8/MatMul:product:00simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/BiasAdd?
)simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp2simple_rnn_cell_8_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02+
)simple_rnn_cell_8/MatMul_1/ReadVariableOp?
simple_rnn_cell_8/MatMul_1MatMulzeros:output:01simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/MatMul_1?
simple_rnn_cell_8/addAddV2"simple_rnn_cell_8/BiasAdd:output:0$simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/add?
simple_rnn_cell_8/TanhTanhsimple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_8/Tanh?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:00simple_rnn_cell_8_matmul_readvariableop_resource1simple_rnn_cell_8_biasadd_readvariableop_resource2simple_rnn_cell_8_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_22611*
condR
while_cond_22610*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:?????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*+
_output_shapes
:?????????>2
transpose_1n
IdentityIdentitytranspose_1:y:0^NoOp*
T0*+
_output_shapes
:?????????>2

Identity?
NoOpNoOp)^simple_rnn_cell_8/BiasAdd/ReadVariableOp(^simple_rnn_cell_8/MatMul/ReadVariableOp*^simple_rnn_cell_8/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????: : : 2T
(simple_rnn_cell_8/BiasAdd/ReadVariableOp(simple_rnn_cell_8/BiasAdd/ReadVariableOp2R
'simple_rnn_cell_8/MatMul/ReadVariableOp'simple_rnn_cell_8/MatMul/ReadVariableOp2V
)simple_rnn_cell_8/MatMul_1/ReadVariableOp)simple_rnn_cell_8/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
%__inference_rnn_2_layer_call_fn_23417

inputs
unknown:>>
	unknown_0:>
	unknown_1:>>
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_2_layer_call_and_return_conditional_losses_214192
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????>: : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:?????????>
 
_user_specified_nameinputs
?	
?
rnn_1_while_cond_21796(
$rnn_1_while_rnn_1_while_loop_counter.
*rnn_1_while_rnn_1_while_maximum_iterations
rnn_1_while_placeholder
rnn_1_while_placeholder_1
rnn_1_while_placeholder_2*
&rnn_1_while_less_rnn_1_strided_slice_1?
;rnn_1_while_rnn_1_while_cond_21796___redundant_placeholder0?
;rnn_1_while_rnn_1_while_cond_21796___redundant_placeholder1?
;rnn_1_while_rnn_1_while_cond_21796___redundant_placeholder2?
;rnn_1_while_rnn_1_while_cond_21796___redundant_placeholder3
rnn_1_while_identity
?
rnn_1/while/LessLessrnn_1_while_placeholder&rnn_1_while_less_rnn_1_strided_slice_1*
T0*
_output_shapes
: 2
rnn_1/while/Lesso
rnn_1/while/IdentityIdentityrnn_1/while/Less:z:0*
T0
*
_output_shapes
: 2
rnn_1/while/Identity"5
rnn_1_while_identityrnn_1/while/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
??
?
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_22263

inputsH
6rnn_1_simple_rnn_cell_8_matmul_readvariableop_resource:>E
7rnn_1_simple_rnn_cell_8_biasadd_readvariableop_resource:>J
8rnn_1_simple_rnn_cell_8_matmul_1_readvariableop_resource:>>H
6rnn_2_simple_rnn_cell_9_matmul_readvariableop_resource:>>E
7rnn_2_simple_rnn_cell_9_biasadd_readvariableop_resource:>J
8rnn_2_simple_rnn_cell_9_matmul_1_readvariableop_resource:>>=
+output_layer_matmul_readvariableop_resource:>:
,output_layer_biasadd_readvariableop_resource:
identity??#output_layer/BiasAdd/ReadVariableOp?"output_layer/MatMul/ReadVariableOp?.rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp?-rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp?/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp?rnn_1/while?.rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp?-rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp?/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp?rnn_2/whileP
rnn_1/ShapeShapeinputs*
T0*
_output_shapes
:2
rnn_1/Shape?
rnn_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn_1/strided_slice/stack?
rnn_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_1/strided_slice/stack_1?
rnn_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_1/strided_slice/stack_2?
rnn_1/strided_sliceStridedSlicernn_1/Shape:output:0"rnn_1/strided_slice/stack:output:0$rnn_1/strided_slice/stack_1:output:0$rnn_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
rnn_1/strided_sliceh
rnn_1/zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
rnn_1/zeros/mul/y?
rnn_1/zeros/mulMulrnn_1/strided_slice:output:0rnn_1/zeros/mul/y:output:0*
T0*
_output_shapes
: 2
rnn_1/zeros/mulk
rnn_1/zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
rnn_1/zeros/Less/y
rnn_1/zeros/LessLessrnn_1/zeros/mul:z:0rnn_1/zeros/Less/y:output:0*
T0*
_output_shapes
: 2
rnn_1/zeros/Lessn
rnn_1/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
rnn_1/zeros/packed/1?
rnn_1/zeros/packedPackrnn_1/strided_slice:output:0rnn_1/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
rnn_1/zeros/packedk
rnn_1/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
rnn_1/zeros/Const?
rnn_1/zerosFillrnn_1/zeros/packed:output:0rnn_1/zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
rnn_1/zeros?
rnn_1/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
rnn_1/transpose/perm?
rnn_1/transpose	Transposeinputsrnn_1/transpose/perm:output:0*
T0*+
_output_shapes
:?????????2
rnn_1/transposea
rnn_1/Shape_1Shapernn_1/transpose:y:0*
T0*
_output_shapes
:2
rnn_1/Shape_1?
rnn_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn_1/strided_slice_1/stack?
rnn_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_1/strided_slice_1/stack_1?
rnn_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_1/strided_slice_1/stack_2?
rnn_1/strided_slice_1StridedSlicernn_1/Shape_1:output:0$rnn_1/strided_slice_1/stack:output:0&rnn_1/strided_slice_1/stack_1:output:0&rnn_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
rnn_1/strided_slice_1?
!rnn_1/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2#
!rnn_1/TensorArrayV2/element_shape?
rnn_1/TensorArrayV2TensorListReserve*rnn_1/TensorArrayV2/element_shape:output:0rnn_1/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
rnn_1/TensorArrayV2?
;rnn_1/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   2=
;rnn_1/TensorArrayUnstack/TensorListFromTensor/element_shape?
-rnn_1/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorrnn_1/transpose:y:0Drnn_1/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02/
-rnn_1/TensorArrayUnstack/TensorListFromTensor?
rnn_1/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn_1/strided_slice_2/stack?
rnn_1/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_1/strided_slice_2/stack_1?
rnn_1/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_1/strided_slice_2/stack_2?
rnn_1/strided_slice_2StridedSlicernn_1/transpose:y:0$rnn_1/strided_slice_2/stack:output:0&rnn_1/strided_slice_2/stack_1:output:0&rnn_1/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????*
shrink_axis_mask2
rnn_1/strided_slice_2?
'rnn_1/simple_rnn_cell_8/ones_like/ShapeShapernn_1/strided_slice_2:output:0*
T0*
_output_shapes
:2)
'rnn_1/simple_rnn_cell_8/ones_like/Shape?
'rnn_1/simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'rnn_1/simple_rnn_cell_8/ones_like/Const?
!rnn_1/simple_rnn_cell_8/ones_likeFill0rnn_1/simple_rnn_cell_8/ones_like/Shape:output:00rnn_1/simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2#
!rnn_1/simple_rnn_cell_8/ones_like?
%rnn_1/simple_rnn_cell_8/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2'
%rnn_1/simple_rnn_cell_8/dropout/Const?
#rnn_1/simple_rnn_cell_8/dropout/MulMul*rnn_1/simple_rnn_cell_8/ones_like:output:0.rnn_1/simple_rnn_cell_8/dropout/Const:output:0*
T0*'
_output_shapes
:?????????2%
#rnn_1/simple_rnn_cell_8/dropout/Mul?
%rnn_1/simple_rnn_cell_8/dropout/ShapeShape*rnn_1/simple_rnn_cell_8/ones_like:output:0*
T0*
_output_shapes
:2'
%rnn_1/simple_rnn_cell_8/dropout/Shape?
<rnn_1/simple_rnn_cell_8/dropout/random_uniform/RandomUniformRandomUniform.rnn_1/simple_rnn_cell_8/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????*
dtype0*

seed4*
seed2?ވ2>
<rnn_1/simple_rnn_cell_8/dropout/random_uniform/RandomUniform?
.rnn_1/simple_rnn_cell_8/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???20
.rnn_1/simple_rnn_cell_8/dropout/GreaterEqual/y?
,rnn_1/simple_rnn_cell_8/dropout/GreaterEqualGreaterEqualErnn_1/simple_rnn_cell_8/dropout/random_uniform/RandomUniform:output:07rnn_1/simple_rnn_cell_8/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????2.
,rnn_1/simple_rnn_cell_8/dropout/GreaterEqual?
$rnn_1/simple_rnn_cell_8/dropout/CastCast0rnn_1/simple_rnn_cell_8/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????2&
$rnn_1/simple_rnn_cell_8/dropout/Cast?
%rnn_1/simple_rnn_cell_8/dropout/Mul_1Mul'rnn_1/simple_rnn_cell_8/dropout/Mul:z:0(rnn_1/simple_rnn_cell_8/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????2'
%rnn_1/simple_rnn_cell_8/dropout/Mul_1?
rnn_1/simple_rnn_cell_8/mulMulrnn_1/strided_slice_2:output:0)rnn_1/simple_rnn_cell_8/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????2
rnn_1/simple_rnn_cell_8/mul?
-rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp6rnn_1_simple_rnn_cell_8_matmul_readvariableop_resource*
_output_shapes

:>*
dtype02/
-rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp?
rnn_1/simple_rnn_cell_8/MatMulMatMulrnn_1/simple_rnn_cell_8/mul:z:05rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
rnn_1/simple_rnn_cell_8/MatMul?
.rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp7rnn_1_simple_rnn_cell_8_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype020
.rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp?
rnn_1/simple_rnn_cell_8/BiasAddBiasAdd(rnn_1/simple_rnn_cell_8/MatMul:product:06rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
rnn_1/simple_rnn_cell_8/BiasAdd?
/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp8rnn_1_simple_rnn_cell_8_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype021
/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
 rnn_1/simple_rnn_cell_8/MatMul_1MatMulrnn_1/zeros:output:07rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 rnn_1/simple_rnn_cell_8/MatMul_1?
rnn_1/simple_rnn_cell_8/addAddV2(rnn_1/simple_rnn_cell_8/BiasAdd:output:0*rnn_1/simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
rnn_1/simple_rnn_cell_8/add?
rnn_1/simple_rnn_cell_8/TanhTanhrnn_1/simple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2
rnn_1/simple_rnn_cell_8/Tanh?
#rnn_1/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2%
#rnn_1/TensorArrayV2_1/element_shape?
rnn_1/TensorArrayV2_1TensorListReserve,rnn_1/TensorArrayV2_1/element_shape:output:0rnn_1/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
rnn_1/TensorArrayV2_1Z

rnn_1/timeConst*
_output_shapes
: *
dtype0*
value	B : 2

rnn_1/time?
rnn_1/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
rnn_1/while/maximum_iterationsv
rnn_1/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
rnn_1/while/loop_counter?
rnn_1/whileWhile!rnn_1/while/loop_counter:output:0'rnn_1/while/maximum_iterations:output:0rnn_1/time:output:0rnn_1/TensorArrayV2_1:handle:0rnn_1/zeros:output:0rnn_1/strided_slice_1:output:0=rnn_1/TensorArrayUnstack/TensorListFromTensor:output_handle:06rnn_1_simple_rnn_cell_8_matmul_readvariableop_resource7rnn_1_simple_rnn_cell_8_biasadd_readvariableop_resource8rnn_1_simple_rnn_cell_8_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *"
bodyR
rnn_1_while_body_22047*"
condR
rnn_1_while_cond_22046*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
rnn_1/while?
6rnn_1/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   28
6rnn_1/TensorArrayV2Stack/TensorListStack/element_shape?
(rnn_1/TensorArrayV2Stack/TensorListStackTensorListStackrnn_1/while:output:3?rnn_1/TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:?????????>*
element_dtype02*
(rnn_1/TensorArrayV2Stack/TensorListStack?
rnn_1/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
rnn_1/strided_slice_3/stack?
rnn_1/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
rnn_1/strided_slice_3/stack_1?
rnn_1/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_1/strided_slice_3/stack_2?
rnn_1/strided_slice_3StridedSlice1rnn_1/TensorArrayV2Stack/TensorListStack:tensor:0$rnn_1/strided_slice_3/stack:output:0&rnn_1/strided_slice_3/stack_1:output:0&rnn_1/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
rnn_1/strided_slice_3?
rnn_1/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
rnn_1/transpose_1/perm?
rnn_1/transpose_1	Transpose1rnn_1/TensorArrayV2Stack/TensorListStack:tensor:0rnn_1/transpose_1/perm:output:0*
T0*+
_output_shapes
:?????????>2
rnn_1/transpose_1_
rnn_2/ShapeShapernn_1/transpose_1:y:0*
T0*
_output_shapes
:2
rnn_2/Shape?
rnn_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn_2/strided_slice/stack?
rnn_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_2/strided_slice/stack_1?
rnn_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_2/strided_slice/stack_2?
rnn_2/strided_sliceStridedSlicernn_2/Shape:output:0"rnn_2/strided_slice/stack:output:0$rnn_2/strided_slice/stack_1:output:0$rnn_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
rnn_2/strided_sliceh
rnn_2/zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
rnn_2/zeros/mul/y?
rnn_2/zeros/mulMulrnn_2/strided_slice:output:0rnn_2/zeros/mul/y:output:0*
T0*
_output_shapes
: 2
rnn_2/zeros/mulk
rnn_2/zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
rnn_2/zeros/Less/y
rnn_2/zeros/LessLessrnn_2/zeros/mul:z:0rnn_2/zeros/Less/y:output:0*
T0*
_output_shapes
: 2
rnn_2/zeros/Lessn
rnn_2/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
rnn_2/zeros/packed/1?
rnn_2/zeros/packedPackrnn_2/strided_slice:output:0rnn_2/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
rnn_2/zeros/packedk
rnn_2/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
rnn_2/zeros/Const?
rnn_2/zerosFillrnn_2/zeros/packed:output:0rnn_2/zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
rnn_2/zeros?
rnn_2/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
rnn_2/transpose/perm?
rnn_2/transpose	Transposernn_1/transpose_1:y:0rnn_2/transpose/perm:output:0*
T0*+
_output_shapes
:?????????>2
rnn_2/transposea
rnn_2/Shape_1Shapernn_2/transpose:y:0*
T0*
_output_shapes
:2
rnn_2/Shape_1?
rnn_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn_2/strided_slice_1/stack?
rnn_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_2/strided_slice_1/stack_1?
rnn_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_2/strided_slice_1/stack_2?
rnn_2/strided_slice_1StridedSlicernn_2/Shape_1:output:0$rnn_2/strided_slice_1/stack:output:0&rnn_2/strided_slice_1/stack_1:output:0&rnn_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
rnn_2/strided_slice_1?
!rnn_2/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2#
!rnn_2/TensorArrayV2/element_shape?
rnn_2/TensorArrayV2TensorListReserve*rnn_2/TensorArrayV2/element_shape:output:0rnn_2/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
rnn_2/TensorArrayV2?
;rnn_2/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2=
;rnn_2/TensorArrayUnstack/TensorListFromTensor/element_shape?
-rnn_2/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorrnn_2/transpose:y:0Drnn_2/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02/
-rnn_2/TensorArrayUnstack/TensorListFromTensor?
rnn_2/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn_2/strided_slice_2/stack?
rnn_2/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_2/strided_slice_2/stack_1?
rnn_2/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_2/strided_slice_2/stack_2?
rnn_2/strided_slice_2StridedSlicernn_2/transpose:y:0$rnn_2/strided_slice_2/stack:output:0&rnn_2/strided_slice_2/stack_1:output:0&rnn_2/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
rnn_2/strided_slice_2?
'rnn_2/simple_rnn_cell_9/ones_like/ShapeShapernn_2/strided_slice_2:output:0*
T0*
_output_shapes
:2)
'rnn_2/simple_rnn_cell_9/ones_like/Shape?
'rnn_2/simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'rnn_2/simple_rnn_cell_9/ones_like/Const?
!rnn_2/simple_rnn_cell_9/ones_likeFill0rnn_2/simple_rnn_cell_9/ones_like/Shape:output:00rnn_2/simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2#
!rnn_2/simple_rnn_cell_9/ones_like?
%rnn_2/simple_rnn_cell_9/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2'
%rnn_2/simple_rnn_cell_9/dropout/Const?
#rnn_2/simple_rnn_cell_9/dropout/MulMul*rnn_2/simple_rnn_cell_9/ones_like:output:0.rnn_2/simple_rnn_cell_9/dropout/Const:output:0*
T0*'
_output_shapes
:?????????>2%
#rnn_2/simple_rnn_cell_9/dropout/Mul?
%rnn_2/simple_rnn_cell_9/dropout/ShapeShape*rnn_2/simple_rnn_cell_9/ones_like:output:0*
T0*
_output_shapes
:2'
%rnn_2/simple_rnn_cell_9/dropout/Shape?
<rnn_2/simple_rnn_cell_9/dropout/random_uniform/RandomUniformRandomUniform.rnn_2/simple_rnn_cell_9/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????>*
dtype0*

seed4*
seed2???2>
<rnn_2/simple_rnn_cell_9/dropout/random_uniform/RandomUniform?
.rnn_2/simple_rnn_cell_9/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???20
.rnn_2/simple_rnn_cell_9/dropout/GreaterEqual/y?
,rnn_2/simple_rnn_cell_9/dropout/GreaterEqualGreaterEqualErnn_2/simple_rnn_cell_9/dropout/random_uniform/RandomUniform:output:07rnn_2/simple_rnn_cell_9/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????>2.
,rnn_2/simple_rnn_cell_9/dropout/GreaterEqual?
$rnn_2/simple_rnn_cell_9/dropout/CastCast0rnn_2/simple_rnn_cell_9/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????>2&
$rnn_2/simple_rnn_cell_9/dropout/Cast?
%rnn_2/simple_rnn_cell_9/dropout/Mul_1Mul'rnn_2/simple_rnn_cell_9/dropout/Mul:z:0(rnn_2/simple_rnn_cell_9/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????>2'
%rnn_2/simple_rnn_cell_9/dropout/Mul_1?
rnn_2/simple_rnn_cell_9/mulMulrnn_2/strided_slice_2:output:0)rnn_2/simple_rnn_cell_9/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????>2
rnn_2/simple_rnn_cell_9/mul?
-rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp6rnn_2_simple_rnn_cell_9_matmul_readvariableop_resource*
_output_shapes

:>>*
dtype02/
-rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp?
rnn_2/simple_rnn_cell_9/MatMulMatMulrnn_2/simple_rnn_cell_9/mul:z:05rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
rnn_2/simple_rnn_cell_9/MatMul?
.rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp7rnn_2_simple_rnn_cell_9_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype020
.rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp?
rnn_2/simple_rnn_cell_9/BiasAddBiasAdd(rnn_2/simple_rnn_cell_9/MatMul:product:06rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
rnn_2/simple_rnn_cell_9/BiasAdd?
/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp8rnn_2_simple_rnn_cell_9_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype021
/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
 rnn_2/simple_rnn_cell_9/MatMul_1MatMulrnn_2/zeros:output:07rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 rnn_2/simple_rnn_cell_9/MatMul_1?
rnn_2/simple_rnn_cell_9/addAddV2(rnn_2/simple_rnn_cell_9/BiasAdd:output:0*rnn_2/simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
rnn_2/simple_rnn_cell_9/add?
rnn_2/simple_rnn_cell_9/TanhTanhrnn_2/simple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2
rnn_2/simple_rnn_cell_9/Tanh?
#rnn_2/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2%
#rnn_2/TensorArrayV2_1/element_shape?
rnn_2/TensorArrayV2_1TensorListReserve,rnn_2/TensorArrayV2_1/element_shape:output:0rnn_2/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
rnn_2/TensorArrayV2_1Z

rnn_2/timeConst*
_output_shapes
: *
dtype0*
value	B : 2

rnn_2/time?
rnn_2/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
rnn_2/while/maximum_iterationsv
rnn_2/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
rnn_2/while/loop_counter?
rnn_2/whileWhile!rnn_2/while/loop_counter:output:0'rnn_2/while/maximum_iterations:output:0rnn_2/time:output:0rnn_2/TensorArrayV2_1:handle:0rnn_2/zeros:output:0rnn_2/strided_slice_1:output:0=rnn_2/TensorArrayUnstack/TensorListFromTensor:output_handle:06rnn_2_simple_rnn_cell_9_matmul_readvariableop_resource7rnn_2_simple_rnn_cell_9_biasadd_readvariableop_resource8rnn_2_simple_rnn_cell_9_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *"
bodyR
rnn_2_while_body_22179*"
condR
rnn_2_while_cond_22178*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
rnn_2/while?
6rnn_2/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   28
6rnn_2/TensorArrayV2Stack/TensorListStack/element_shape?
(rnn_2/TensorArrayV2Stack/TensorListStackTensorListStackrnn_2/while:output:3?rnn_2/TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:?????????>*
element_dtype02*
(rnn_2/TensorArrayV2Stack/TensorListStack?
rnn_2/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
rnn_2/strided_slice_3/stack?
rnn_2/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
rnn_2/strided_slice_3/stack_1?
rnn_2/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_2/strided_slice_3/stack_2?
rnn_2/strided_slice_3StridedSlice1rnn_2/TensorArrayV2Stack/TensorListStack:tensor:0$rnn_2/strided_slice_3/stack:output:0&rnn_2/strided_slice_3/stack_1:output:0&rnn_2/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
rnn_2/strided_slice_3?
rnn_2/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
rnn_2/transpose_1/perm?
rnn_2/transpose_1	Transpose1rnn_2/TensorArrayV2Stack/TensorListStack:tensor:0rnn_2/transpose_1/perm:output:0*
T0*+
_output_shapes
:?????????>2
rnn_2/transpose_1?
"output_layer/MatMul/ReadVariableOpReadVariableOp+output_layer_matmul_readvariableop_resource*
_output_shapes

:>*
dtype02$
"output_layer/MatMul/ReadVariableOp?
output_layer/MatMulMatMulrnn_2/strided_slice_3:output:0*output_layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
output_layer/MatMul?
#output_layer/BiasAdd/ReadVariableOpReadVariableOp,output_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02%
#output_layer/BiasAdd/ReadVariableOp?
output_layer/BiasAddBiasAddoutput_layer/MatMul:product:0+output_layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
output_layer/BiasAddx
IdentityIdentityoutput_layer/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identity?
NoOpNoOp$^output_layer/BiasAdd/ReadVariableOp#^output_layer/MatMul/ReadVariableOp/^rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp.^rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp0^rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp^rnn_1/while/^rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp.^rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp0^rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp^rnn_2/while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':?????????: : : : : : : : 2J
#output_layer/BiasAdd/ReadVariableOp#output_layer/BiasAdd/ReadVariableOp2H
"output_layer/MatMul/ReadVariableOp"output_layer/MatMul/ReadVariableOp2`
.rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp.rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp2^
-rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp-rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp2b
/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp2
rnn_1/whilernn_1/while2`
.rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp.rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp2^
-rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp-rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp2b
/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp2
rnn_2/whilernn_2/while:S O
+
_output_shapes
:?????????
 
_user_specified_nameinputs
?S
?
(bitcoin_basic_RNN_rnn_2_while_body_19787L
Hbitcoin_basic_rnn_rnn_2_while_bitcoin_basic_rnn_rnn_2_while_loop_counterR
Nbitcoin_basic_rnn_rnn_2_while_bitcoin_basic_rnn_rnn_2_while_maximum_iterations-
)bitcoin_basic_rnn_rnn_2_while_placeholder/
+bitcoin_basic_rnn_rnn_2_while_placeholder_1/
+bitcoin_basic_rnn_rnn_2_while_placeholder_2K
Gbitcoin_basic_rnn_rnn_2_while_bitcoin_basic_rnn_rnn_2_strided_slice_1_0?
?bitcoin_basic_rnn_rnn_2_while_tensorarrayv2read_tensorlistgetitem_bitcoin_basic_rnn_rnn_2_tensorarrayunstack_tensorlistfromtensor_0b
Pbitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resource_0:>>_
Qbitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resource_0:>d
Rbitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0:>>*
&bitcoin_basic_rnn_rnn_2_while_identity,
(bitcoin_basic_rnn_rnn_2_while_identity_1,
(bitcoin_basic_rnn_rnn_2_while_identity_2,
(bitcoin_basic_rnn_rnn_2_while_identity_3,
(bitcoin_basic_rnn_rnn_2_while_identity_4I
Ebitcoin_basic_rnn_rnn_2_while_bitcoin_basic_rnn_rnn_2_strided_slice_1?
?bitcoin_basic_rnn_rnn_2_while_tensorarrayv2read_tensorlistgetitem_bitcoin_basic_rnn_rnn_2_tensorarrayunstack_tensorlistfromtensor`
Nbitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resource:>>]
Obitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resource:>b
Pbitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resource:>>??Fbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?Ebitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp?Gbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
Obitcoin_basic_RNN/rnn_2/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2Q
Obitcoin_basic_RNN/rnn_2/while/TensorArrayV2Read/TensorListGetItem/element_shape?
Abitcoin_basic_RNN/rnn_2/while/TensorArrayV2Read/TensorListGetItemTensorListGetItem?bitcoin_basic_rnn_rnn_2_while_tensorarrayv2read_tensorlistgetitem_bitcoin_basic_rnn_rnn_2_tensorarrayunstack_tensorlistfromtensor_0)bitcoin_basic_rnn_rnn_2_while_placeholderXbitcoin_basic_RNN/rnn_2/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????>*
element_dtype02C
Abitcoin_basic_RNN/rnn_2/while/TensorArrayV2Read/TensorListGetItem?
?bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/ones_like/ShapeShapeHbitcoin_basic_RNN/rnn_2/while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2A
?bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/ones_like/Shape?
?bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2A
?bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/ones_like/Const?
9bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/ones_likeFillHbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/ones_like/Shape:output:0Hbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2;
9bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/ones_like?
3bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/mulMulHbitcoin_basic_RNN/rnn_2/while/TensorArrayV2Read/TensorListGetItem:item:0Bbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/ones_like:output:0*
T0*'
_output_shapes
:?????????>25
3bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/mul?
Ebitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOpPbitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resource_0*
_output_shapes

:>>*
dtype02G
Ebitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp?
6bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMulMatMul7bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/mul:z:0Mbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>28
6bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul?
Fbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOpQbitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype02H
Fbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?
7bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/BiasAddBiasAdd@bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul:product:0Nbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>29
7bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/BiasAdd?
Gbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOpRbitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype02I
Gbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
8bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul_1MatMul+bitcoin_basic_rnn_rnn_2_while_placeholder_2Obitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2:
8bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul_1?
3bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/addAddV2@bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/BiasAdd:output:0Bbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>25
3bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/add?
4bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/TanhTanh7bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>26
4bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/Tanh?
Bbitcoin_basic_RNN/rnn_2/while/TensorArrayV2Write/TensorListSetItemTensorListSetItem+bitcoin_basic_rnn_rnn_2_while_placeholder_1)bitcoin_basic_rnn_rnn_2_while_placeholder8bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/Tanh:y:0*
_output_shapes
: *
element_dtype02D
Bbitcoin_basic_RNN/rnn_2/while/TensorArrayV2Write/TensorListSetItem?
#bitcoin_basic_RNN/rnn_2/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2%
#bitcoin_basic_RNN/rnn_2/while/add/y?
!bitcoin_basic_RNN/rnn_2/while/addAddV2)bitcoin_basic_rnn_rnn_2_while_placeholder,bitcoin_basic_RNN/rnn_2/while/add/y:output:0*
T0*
_output_shapes
: 2#
!bitcoin_basic_RNN/rnn_2/while/add?
%bitcoin_basic_RNN/rnn_2/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2'
%bitcoin_basic_RNN/rnn_2/while/add_1/y?
#bitcoin_basic_RNN/rnn_2/while/add_1AddV2Hbitcoin_basic_rnn_rnn_2_while_bitcoin_basic_rnn_rnn_2_while_loop_counter.bitcoin_basic_RNN/rnn_2/while/add_1/y:output:0*
T0*
_output_shapes
: 2%
#bitcoin_basic_RNN/rnn_2/while/add_1?
&bitcoin_basic_RNN/rnn_2/while/IdentityIdentity'bitcoin_basic_RNN/rnn_2/while/add_1:z:0#^bitcoin_basic_RNN/rnn_2/while/NoOp*
T0*
_output_shapes
: 2(
&bitcoin_basic_RNN/rnn_2/while/Identity?
(bitcoin_basic_RNN/rnn_2/while/Identity_1IdentityNbitcoin_basic_rnn_rnn_2_while_bitcoin_basic_rnn_rnn_2_while_maximum_iterations#^bitcoin_basic_RNN/rnn_2/while/NoOp*
T0*
_output_shapes
: 2*
(bitcoin_basic_RNN/rnn_2/while/Identity_1?
(bitcoin_basic_RNN/rnn_2/while/Identity_2Identity%bitcoin_basic_RNN/rnn_2/while/add:z:0#^bitcoin_basic_RNN/rnn_2/while/NoOp*
T0*
_output_shapes
: 2*
(bitcoin_basic_RNN/rnn_2/while/Identity_2?
(bitcoin_basic_RNN/rnn_2/while/Identity_3IdentityRbitcoin_basic_RNN/rnn_2/while/TensorArrayV2Write/TensorListSetItem:output_handle:0#^bitcoin_basic_RNN/rnn_2/while/NoOp*
T0*
_output_shapes
: 2*
(bitcoin_basic_RNN/rnn_2/while/Identity_3?
(bitcoin_basic_RNN/rnn_2/while/Identity_4Identity8bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/Tanh:y:0#^bitcoin_basic_RNN/rnn_2/while/NoOp*
T0*'
_output_shapes
:?????????>2*
(bitcoin_basic_RNN/rnn_2/while/Identity_4?
"bitcoin_basic_RNN/rnn_2/while/NoOpNoOpG^bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOpF^bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOpH^bitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2$
"bitcoin_basic_RNN/rnn_2/while/NoOp"?
Ebitcoin_basic_rnn_rnn_2_while_bitcoin_basic_rnn_rnn_2_strided_slice_1Gbitcoin_basic_rnn_rnn_2_while_bitcoin_basic_rnn_rnn_2_strided_slice_1_0"Y
&bitcoin_basic_rnn_rnn_2_while_identity/bitcoin_basic_RNN/rnn_2/while/Identity:output:0"]
(bitcoin_basic_rnn_rnn_2_while_identity_11bitcoin_basic_RNN/rnn_2/while/Identity_1:output:0"]
(bitcoin_basic_rnn_rnn_2_while_identity_21bitcoin_basic_RNN/rnn_2/while/Identity_2:output:0"]
(bitcoin_basic_rnn_rnn_2_while_identity_31bitcoin_basic_RNN/rnn_2/while/Identity_3:output:0"]
(bitcoin_basic_rnn_rnn_2_while_identity_41bitcoin_basic_RNN/rnn_2/while/Identity_4:output:0"?
Obitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resourceQbitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_biasadd_readvariableop_resource_0"?
Pbitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resourceRbitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0"?
Nbitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resourcePbitcoin_basic_rnn_rnn_2_while_simple_rnn_cell_9_matmul_readvariableop_resource_0"?
?bitcoin_basic_rnn_rnn_2_while_tensorarrayv2read_tensorlistgetitem_bitcoin_basic_rnn_rnn_2_tensorarrayunstack_tensorlistfromtensor?bitcoin_basic_rnn_rnn_2_while_tensorarrayv2read_tensorlistgetitem_bitcoin_basic_rnn_rnn_2_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2?
Fbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOpFbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/BiasAdd/ReadVariableOp2?
Ebitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOpEbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul/ReadVariableOp2?
Gbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOpGbitcoin_basic_RNN/rnn_2/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?D
?
while_body_22739
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0J
8while_simple_rnn_cell_8_matmul_readvariableop_resource_0:>G
9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0:>L
:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorH
6while_simple_rnn_cell_8_matmul_readvariableop_resource:>E
7while_simple_rnn_cell_8_biasadd_readvariableop_resource:>J
8while_simple_rnn_cell_8_matmul_1_readvariableop_resource:>>??.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?-while/simple_rnn_cell_8/MatMul/ReadVariableOp?/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/simple_rnn_cell_8/ones_like/ShapeShape0while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2)
'while/simple_rnn_cell_8/ones_like/Shape?
'while/simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'while/simple_rnn_cell_8/ones_like/Const?
!while/simple_rnn_cell_8/ones_likeFill0while/simple_rnn_cell_8/ones_like/Shape:output:00while/simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2#
!while/simple_rnn_cell_8/ones_like?
%while/simple_rnn_cell_8/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2'
%while/simple_rnn_cell_8/dropout/Const?
#while/simple_rnn_cell_8/dropout/MulMul*while/simple_rnn_cell_8/ones_like:output:0.while/simple_rnn_cell_8/dropout/Const:output:0*
T0*'
_output_shapes
:?????????2%
#while/simple_rnn_cell_8/dropout/Mul?
%while/simple_rnn_cell_8/dropout/ShapeShape*while/simple_rnn_cell_8/ones_like:output:0*
T0*
_output_shapes
:2'
%while/simple_rnn_cell_8/dropout/Shape?
<while/simple_rnn_cell_8/dropout/random_uniform/RandomUniformRandomUniform.while/simple_rnn_cell_8/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????*
dtype0*

seed4*
seed2???2>
<while/simple_rnn_cell_8/dropout/random_uniform/RandomUniform?
.while/simple_rnn_cell_8/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???20
.while/simple_rnn_cell_8/dropout/GreaterEqual/y?
,while/simple_rnn_cell_8/dropout/GreaterEqualGreaterEqualEwhile/simple_rnn_cell_8/dropout/random_uniform/RandomUniform:output:07while/simple_rnn_cell_8/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????2.
,while/simple_rnn_cell_8/dropout/GreaterEqual?
$while/simple_rnn_cell_8/dropout/CastCast0while/simple_rnn_cell_8/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????2&
$while/simple_rnn_cell_8/dropout/Cast?
%while/simple_rnn_cell_8/dropout/Mul_1Mul'while/simple_rnn_cell_8/dropout/Mul:z:0(while/simple_rnn_cell_8/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????2'
%while/simple_rnn_cell_8/dropout/Mul_1?
while/simple_rnn_cell_8/mulMul0while/TensorArrayV2Read/TensorListGetItem:item:0)while/simple_rnn_cell_8/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????2
while/simple_rnn_cell_8/mul?
-while/simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp8while_simple_rnn_cell_8_matmul_readvariableop_resource_0*
_output_shapes

:>*
dtype02/
-while/simple_rnn_cell_8/MatMul/ReadVariableOp?
while/simple_rnn_cell_8/MatMulMatMulwhile/simple_rnn_cell_8/mul:z:05while/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
while/simple_rnn_cell_8/MatMul?
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype020
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?
while/simple_rnn_cell_8/BiasAddBiasAdd(while/simple_rnn_cell_8/MatMul:product:06while/simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
while/simple_rnn_cell_8/BiasAdd?
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype021
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
 while/simple_rnn_cell_8/MatMul_1MatMulwhile_placeholder_27while/simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 while/simple_rnn_cell_8/MatMul_1?
while/simple_rnn_cell_8/addAddV2(while/simple_rnn_cell_8/BiasAdd:output:0*while/simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_8/add?
while/simple_rnn_cell_8/TanhTanhwhile/simple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_8/Tanh?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_8/Tanh:y:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity while/simple_rnn_cell_8/Tanh:y:0^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp/^while/simple_rnn_cell_8/BiasAdd/ReadVariableOp.^while/simple_rnn_cell_8/MatMul/ReadVariableOp0^while/simple_rnn_cell_8/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"t
7while_simple_rnn_cell_8_biasadd_readvariableop_resource9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0"v
8while_simple_rnn_cell_8_matmul_1_readvariableop_resource:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0"r
6while_simple_rnn_cell_8_matmul_readvariableop_resource8while_simple_rnn_cell_8_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2`
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp2^
-while/simple_rnn_cell_8/MatMul/ReadVariableOp-while/simple_rnn_cell_8/MatMul/ReadVariableOp2b
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?	
?
rnn_1_while_cond_22046(
$rnn_1_while_rnn_1_while_loop_counter.
*rnn_1_while_rnn_1_while_maximum_iterations
rnn_1_while_placeholder
rnn_1_while_placeholder_1
rnn_1_while_placeholder_2*
&rnn_1_while_less_rnn_1_strided_slice_1?
;rnn_1_while_rnn_1_while_cond_22046___redundant_placeholder0?
;rnn_1_while_rnn_1_while_cond_22046___redundant_placeholder1?
;rnn_1_while_rnn_1_while_cond_22046___redundant_placeholder2?
;rnn_1_while_rnn_1_while_cond_22046___redundant_placeholder3
rnn_1_while_identity
?
rnn_1/while/LessLessrnn_1_while_placeholder&rnn_1_while_less_rnn_1_strided_slice_1*
T0*
_output_shapes
: 2
rnn_1/while/Lesso
rnn_1/while/IdentityIdentityrnn_1/while/Less:z:0*
T0
*
_output_shapes
: 2
rnn_1/while/Identity"5
rnn_1_while_identityrnn_1/while/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
´
?
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_21989

inputsH
6rnn_1_simple_rnn_cell_8_matmul_readvariableop_resource:>E
7rnn_1_simple_rnn_cell_8_biasadd_readvariableop_resource:>J
8rnn_1_simple_rnn_cell_8_matmul_1_readvariableop_resource:>>H
6rnn_2_simple_rnn_cell_9_matmul_readvariableop_resource:>>E
7rnn_2_simple_rnn_cell_9_biasadd_readvariableop_resource:>J
8rnn_2_simple_rnn_cell_9_matmul_1_readvariableop_resource:>>=
+output_layer_matmul_readvariableop_resource:>:
,output_layer_biasadd_readvariableop_resource:
identity??#output_layer/BiasAdd/ReadVariableOp?"output_layer/MatMul/ReadVariableOp?.rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp?-rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp?/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp?rnn_1/while?.rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp?-rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp?/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp?rnn_2/whileP
rnn_1/ShapeShapeinputs*
T0*
_output_shapes
:2
rnn_1/Shape?
rnn_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn_1/strided_slice/stack?
rnn_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_1/strided_slice/stack_1?
rnn_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_1/strided_slice/stack_2?
rnn_1/strided_sliceStridedSlicernn_1/Shape:output:0"rnn_1/strided_slice/stack:output:0$rnn_1/strided_slice/stack_1:output:0$rnn_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
rnn_1/strided_sliceh
rnn_1/zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
rnn_1/zeros/mul/y?
rnn_1/zeros/mulMulrnn_1/strided_slice:output:0rnn_1/zeros/mul/y:output:0*
T0*
_output_shapes
: 2
rnn_1/zeros/mulk
rnn_1/zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
rnn_1/zeros/Less/y
rnn_1/zeros/LessLessrnn_1/zeros/mul:z:0rnn_1/zeros/Less/y:output:0*
T0*
_output_shapes
: 2
rnn_1/zeros/Lessn
rnn_1/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
rnn_1/zeros/packed/1?
rnn_1/zeros/packedPackrnn_1/strided_slice:output:0rnn_1/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
rnn_1/zeros/packedk
rnn_1/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
rnn_1/zeros/Const?
rnn_1/zerosFillrnn_1/zeros/packed:output:0rnn_1/zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
rnn_1/zeros?
rnn_1/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
rnn_1/transpose/perm?
rnn_1/transpose	Transposeinputsrnn_1/transpose/perm:output:0*
T0*+
_output_shapes
:?????????2
rnn_1/transposea
rnn_1/Shape_1Shapernn_1/transpose:y:0*
T0*
_output_shapes
:2
rnn_1/Shape_1?
rnn_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn_1/strided_slice_1/stack?
rnn_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_1/strided_slice_1/stack_1?
rnn_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_1/strided_slice_1/stack_2?
rnn_1/strided_slice_1StridedSlicernn_1/Shape_1:output:0$rnn_1/strided_slice_1/stack:output:0&rnn_1/strided_slice_1/stack_1:output:0&rnn_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
rnn_1/strided_slice_1?
!rnn_1/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2#
!rnn_1/TensorArrayV2/element_shape?
rnn_1/TensorArrayV2TensorListReserve*rnn_1/TensorArrayV2/element_shape:output:0rnn_1/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
rnn_1/TensorArrayV2?
;rnn_1/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   2=
;rnn_1/TensorArrayUnstack/TensorListFromTensor/element_shape?
-rnn_1/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorrnn_1/transpose:y:0Drnn_1/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02/
-rnn_1/TensorArrayUnstack/TensorListFromTensor?
rnn_1/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn_1/strided_slice_2/stack?
rnn_1/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_1/strided_slice_2/stack_1?
rnn_1/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_1/strided_slice_2/stack_2?
rnn_1/strided_slice_2StridedSlicernn_1/transpose:y:0$rnn_1/strided_slice_2/stack:output:0&rnn_1/strided_slice_2/stack_1:output:0&rnn_1/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????*
shrink_axis_mask2
rnn_1/strided_slice_2?
'rnn_1/simple_rnn_cell_8/ones_like/ShapeShapernn_1/strided_slice_2:output:0*
T0*
_output_shapes
:2)
'rnn_1/simple_rnn_cell_8/ones_like/Shape?
'rnn_1/simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'rnn_1/simple_rnn_cell_8/ones_like/Const?
!rnn_1/simple_rnn_cell_8/ones_likeFill0rnn_1/simple_rnn_cell_8/ones_like/Shape:output:00rnn_1/simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2#
!rnn_1/simple_rnn_cell_8/ones_like?
rnn_1/simple_rnn_cell_8/mulMulrnn_1/strided_slice_2:output:0*rnn_1/simple_rnn_cell_8/ones_like:output:0*
T0*'
_output_shapes
:?????????2
rnn_1/simple_rnn_cell_8/mul?
-rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp6rnn_1_simple_rnn_cell_8_matmul_readvariableop_resource*
_output_shapes

:>*
dtype02/
-rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp?
rnn_1/simple_rnn_cell_8/MatMulMatMulrnn_1/simple_rnn_cell_8/mul:z:05rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
rnn_1/simple_rnn_cell_8/MatMul?
.rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp7rnn_1_simple_rnn_cell_8_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype020
.rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp?
rnn_1/simple_rnn_cell_8/BiasAddBiasAdd(rnn_1/simple_rnn_cell_8/MatMul:product:06rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
rnn_1/simple_rnn_cell_8/BiasAdd?
/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp8rnn_1_simple_rnn_cell_8_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype021
/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
 rnn_1/simple_rnn_cell_8/MatMul_1MatMulrnn_1/zeros:output:07rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 rnn_1/simple_rnn_cell_8/MatMul_1?
rnn_1/simple_rnn_cell_8/addAddV2(rnn_1/simple_rnn_cell_8/BiasAdd:output:0*rnn_1/simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
rnn_1/simple_rnn_cell_8/add?
rnn_1/simple_rnn_cell_8/TanhTanhrnn_1/simple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2
rnn_1/simple_rnn_cell_8/Tanh?
#rnn_1/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2%
#rnn_1/TensorArrayV2_1/element_shape?
rnn_1/TensorArrayV2_1TensorListReserve,rnn_1/TensorArrayV2_1/element_shape:output:0rnn_1/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
rnn_1/TensorArrayV2_1Z

rnn_1/timeConst*
_output_shapes
: *
dtype0*
value	B : 2

rnn_1/time?
rnn_1/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
rnn_1/while/maximum_iterationsv
rnn_1/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
rnn_1/while/loop_counter?
rnn_1/whileWhile!rnn_1/while/loop_counter:output:0'rnn_1/while/maximum_iterations:output:0rnn_1/time:output:0rnn_1/TensorArrayV2_1:handle:0rnn_1/zeros:output:0rnn_1/strided_slice_1:output:0=rnn_1/TensorArrayUnstack/TensorListFromTensor:output_handle:06rnn_1_simple_rnn_cell_8_matmul_readvariableop_resource7rnn_1_simple_rnn_cell_8_biasadd_readvariableop_resource8rnn_1_simple_rnn_cell_8_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *"
bodyR
rnn_1_while_body_21797*"
condR
rnn_1_while_cond_21796*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
rnn_1/while?
6rnn_1/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   28
6rnn_1/TensorArrayV2Stack/TensorListStack/element_shape?
(rnn_1/TensorArrayV2Stack/TensorListStackTensorListStackrnn_1/while:output:3?rnn_1/TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:?????????>*
element_dtype02*
(rnn_1/TensorArrayV2Stack/TensorListStack?
rnn_1/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
rnn_1/strided_slice_3/stack?
rnn_1/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
rnn_1/strided_slice_3/stack_1?
rnn_1/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_1/strided_slice_3/stack_2?
rnn_1/strided_slice_3StridedSlice1rnn_1/TensorArrayV2Stack/TensorListStack:tensor:0$rnn_1/strided_slice_3/stack:output:0&rnn_1/strided_slice_3/stack_1:output:0&rnn_1/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
rnn_1/strided_slice_3?
rnn_1/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
rnn_1/transpose_1/perm?
rnn_1/transpose_1	Transpose1rnn_1/TensorArrayV2Stack/TensorListStack:tensor:0rnn_1/transpose_1/perm:output:0*
T0*+
_output_shapes
:?????????>2
rnn_1/transpose_1_
rnn_2/ShapeShapernn_1/transpose_1:y:0*
T0*
_output_shapes
:2
rnn_2/Shape?
rnn_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn_2/strided_slice/stack?
rnn_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_2/strided_slice/stack_1?
rnn_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_2/strided_slice/stack_2?
rnn_2/strided_sliceStridedSlicernn_2/Shape:output:0"rnn_2/strided_slice/stack:output:0$rnn_2/strided_slice/stack_1:output:0$rnn_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
rnn_2/strided_sliceh
rnn_2/zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
rnn_2/zeros/mul/y?
rnn_2/zeros/mulMulrnn_2/strided_slice:output:0rnn_2/zeros/mul/y:output:0*
T0*
_output_shapes
: 2
rnn_2/zeros/mulk
rnn_2/zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
rnn_2/zeros/Less/y
rnn_2/zeros/LessLessrnn_2/zeros/mul:z:0rnn_2/zeros/Less/y:output:0*
T0*
_output_shapes
: 2
rnn_2/zeros/Lessn
rnn_2/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
rnn_2/zeros/packed/1?
rnn_2/zeros/packedPackrnn_2/strided_slice:output:0rnn_2/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
rnn_2/zeros/packedk
rnn_2/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
rnn_2/zeros/Const?
rnn_2/zerosFillrnn_2/zeros/packed:output:0rnn_2/zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
rnn_2/zeros?
rnn_2/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
rnn_2/transpose/perm?
rnn_2/transpose	Transposernn_1/transpose_1:y:0rnn_2/transpose/perm:output:0*
T0*+
_output_shapes
:?????????>2
rnn_2/transposea
rnn_2/Shape_1Shapernn_2/transpose:y:0*
T0*
_output_shapes
:2
rnn_2/Shape_1?
rnn_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn_2/strided_slice_1/stack?
rnn_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_2/strided_slice_1/stack_1?
rnn_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_2/strided_slice_1/stack_2?
rnn_2/strided_slice_1StridedSlicernn_2/Shape_1:output:0$rnn_2/strided_slice_1/stack:output:0&rnn_2/strided_slice_1/stack_1:output:0&rnn_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
rnn_2/strided_slice_1?
!rnn_2/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2#
!rnn_2/TensorArrayV2/element_shape?
rnn_2/TensorArrayV2TensorListReserve*rnn_2/TensorArrayV2/element_shape:output:0rnn_2/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
rnn_2/TensorArrayV2?
;rnn_2/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2=
;rnn_2/TensorArrayUnstack/TensorListFromTensor/element_shape?
-rnn_2/TensorArrayUnstack/TensorListFromTensorTensorListFromTensorrnn_2/transpose:y:0Drnn_2/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02/
-rnn_2/TensorArrayUnstack/TensorListFromTensor?
rnn_2/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
rnn_2/strided_slice_2/stack?
rnn_2/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_2/strided_slice_2/stack_1?
rnn_2/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_2/strided_slice_2/stack_2?
rnn_2/strided_slice_2StridedSlicernn_2/transpose:y:0$rnn_2/strided_slice_2/stack:output:0&rnn_2/strided_slice_2/stack_1:output:0&rnn_2/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
rnn_2/strided_slice_2?
'rnn_2/simple_rnn_cell_9/ones_like/ShapeShapernn_2/strided_slice_2:output:0*
T0*
_output_shapes
:2)
'rnn_2/simple_rnn_cell_9/ones_like/Shape?
'rnn_2/simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'rnn_2/simple_rnn_cell_9/ones_like/Const?
!rnn_2/simple_rnn_cell_9/ones_likeFill0rnn_2/simple_rnn_cell_9/ones_like/Shape:output:00rnn_2/simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2#
!rnn_2/simple_rnn_cell_9/ones_like?
rnn_2/simple_rnn_cell_9/mulMulrnn_2/strided_slice_2:output:0*rnn_2/simple_rnn_cell_9/ones_like:output:0*
T0*'
_output_shapes
:?????????>2
rnn_2/simple_rnn_cell_9/mul?
-rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp6rnn_2_simple_rnn_cell_9_matmul_readvariableop_resource*
_output_shapes

:>>*
dtype02/
-rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp?
rnn_2/simple_rnn_cell_9/MatMulMatMulrnn_2/simple_rnn_cell_9/mul:z:05rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
rnn_2/simple_rnn_cell_9/MatMul?
.rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp7rnn_2_simple_rnn_cell_9_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype020
.rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp?
rnn_2/simple_rnn_cell_9/BiasAddBiasAdd(rnn_2/simple_rnn_cell_9/MatMul:product:06rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
rnn_2/simple_rnn_cell_9/BiasAdd?
/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp8rnn_2_simple_rnn_cell_9_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype021
/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
 rnn_2/simple_rnn_cell_9/MatMul_1MatMulrnn_2/zeros:output:07rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 rnn_2/simple_rnn_cell_9/MatMul_1?
rnn_2/simple_rnn_cell_9/addAddV2(rnn_2/simple_rnn_cell_9/BiasAdd:output:0*rnn_2/simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
rnn_2/simple_rnn_cell_9/add?
rnn_2/simple_rnn_cell_9/TanhTanhrnn_2/simple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2
rnn_2/simple_rnn_cell_9/Tanh?
#rnn_2/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2%
#rnn_2/TensorArrayV2_1/element_shape?
rnn_2/TensorArrayV2_1TensorListReserve,rnn_2/TensorArrayV2_1/element_shape:output:0rnn_2/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
rnn_2/TensorArrayV2_1Z

rnn_2/timeConst*
_output_shapes
: *
dtype0*
value	B : 2

rnn_2/time?
rnn_2/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
rnn_2/while/maximum_iterationsv
rnn_2/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
rnn_2/while/loop_counter?
rnn_2/whileWhile!rnn_2/while/loop_counter:output:0'rnn_2/while/maximum_iterations:output:0rnn_2/time:output:0rnn_2/TensorArrayV2_1:handle:0rnn_2/zeros:output:0rnn_2/strided_slice_1:output:0=rnn_2/TensorArrayUnstack/TensorListFromTensor:output_handle:06rnn_2_simple_rnn_cell_9_matmul_readvariableop_resource7rnn_2_simple_rnn_cell_9_biasadd_readvariableop_resource8rnn_2_simple_rnn_cell_9_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *"
bodyR
rnn_2_while_body_21913*"
condR
rnn_2_while_cond_21912*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
rnn_2/while?
6rnn_2/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   28
6rnn_2/TensorArrayV2Stack/TensorListStack/element_shape?
(rnn_2/TensorArrayV2Stack/TensorListStackTensorListStackrnn_2/while:output:3?rnn_2/TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:?????????>*
element_dtype02*
(rnn_2/TensorArrayV2Stack/TensorListStack?
rnn_2/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
rnn_2/strided_slice_3/stack?
rnn_2/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
rnn_2/strided_slice_3/stack_1?
rnn_2/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
rnn_2/strided_slice_3/stack_2?
rnn_2/strided_slice_3StridedSlice1rnn_2/TensorArrayV2Stack/TensorListStack:tensor:0$rnn_2/strided_slice_3/stack:output:0&rnn_2/strided_slice_3/stack_1:output:0&rnn_2/strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
rnn_2/strided_slice_3?
rnn_2/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
rnn_2/transpose_1/perm?
rnn_2/transpose_1	Transpose1rnn_2/TensorArrayV2Stack/TensorListStack:tensor:0rnn_2/transpose_1/perm:output:0*
T0*+
_output_shapes
:?????????>2
rnn_2/transpose_1?
"output_layer/MatMul/ReadVariableOpReadVariableOp+output_layer_matmul_readvariableop_resource*
_output_shapes

:>*
dtype02$
"output_layer/MatMul/ReadVariableOp?
output_layer/MatMulMatMulrnn_2/strided_slice_3:output:0*output_layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
output_layer/MatMul?
#output_layer/BiasAdd/ReadVariableOpReadVariableOp,output_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02%
#output_layer/BiasAdd/ReadVariableOp?
output_layer/BiasAddBiasAddoutput_layer/MatMul:product:0+output_layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
output_layer/BiasAddx
IdentityIdentityoutput_layer/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identity?
NoOpNoOp$^output_layer/BiasAdd/ReadVariableOp#^output_layer/MatMul/ReadVariableOp/^rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp.^rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp0^rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp^rnn_1/while/^rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp.^rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp0^rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp^rnn_2/while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':?????????: : : : : : : : 2J
#output_layer/BiasAdd/ReadVariableOp#output_layer/BiasAdd/ReadVariableOp2H
"output_layer/MatMul/ReadVariableOp"output_layer/MatMul/ReadVariableOp2`
.rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp.rnn_1/simple_rnn_cell_8/BiasAdd/ReadVariableOp2^
-rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp-rnn_1/simple_rnn_cell_8/MatMul/ReadVariableOp2b
/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp/rnn_1/simple_rnn_cell_8/MatMul_1/ReadVariableOp2
rnn_1/whilernn_1/while2`
.rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp.rnn_2/simple_rnn_cell_9/BiasAdd/ReadVariableOp2^
-rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp-rnn_2/simple_rnn_cell_9/MatMul/ReadVariableOp2b
/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp/rnn_2/simple_rnn_cell_9/MatMul_1/ReadVariableOp2
rnn_2/whilernn_2/while:S O
+
_output_shapes
:?????????
 
_user_specified_nameinputs
?7
?
while_body_23167
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0J
8while_simple_rnn_cell_9_matmul_readvariableop_resource_0:>>G
9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0:>L
:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorH
6while_simple_rnn_cell_9_matmul_readvariableop_resource:>>E
7while_simple_rnn_cell_9_biasadd_readvariableop_resource:>J
8while_simple_rnn_cell_9_matmul_1_readvariableop_resource:>>??.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?-while/simple_rnn_cell_9/MatMul/ReadVariableOp?/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????>*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/simple_rnn_cell_9/ones_like/ShapeShape0while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2)
'while/simple_rnn_cell_9/ones_like/Shape?
'while/simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'while/simple_rnn_cell_9/ones_like/Const?
!while/simple_rnn_cell_9/ones_likeFill0while/simple_rnn_cell_9/ones_like/Shape:output:00while/simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2#
!while/simple_rnn_cell_9/ones_like?
while/simple_rnn_cell_9/mulMul0while/TensorArrayV2Read/TensorListGetItem:item:0*while/simple_rnn_cell_9/ones_like:output:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/mul?
-while/simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp8while_simple_rnn_cell_9_matmul_readvariableop_resource_0*
_output_shapes

:>>*
dtype02/
-while/simple_rnn_cell_9/MatMul/ReadVariableOp?
while/simple_rnn_cell_9/MatMulMatMulwhile/simple_rnn_cell_9/mul:z:05while/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
while/simple_rnn_cell_9/MatMul?
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype020
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?
while/simple_rnn_cell_9/BiasAddBiasAdd(while/simple_rnn_cell_9/MatMul:product:06while/simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
while/simple_rnn_cell_9/BiasAdd?
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype021
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
 while/simple_rnn_cell_9/MatMul_1MatMulwhile_placeholder_27while/simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 while/simple_rnn_cell_9/MatMul_1?
while/simple_rnn_cell_9/addAddV2(while/simple_rnn_cell_9/BiasAdd:output:0*while/simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/add?
while/simple_rnn_cell_9/TanhTanhwhile/simple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/Tanh?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_9/Tanh:y:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity while/simple_rnn_cell_9/Tanh:y:0^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp/^while/simple_rnn_cell_9/BiasAdd/ReadVariableOp.^while/simple_rnn_cell_9/MatMul/ReadVariableOp0^while/simple_rnn_cell_9/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"t
7while_simple_rnn_cell_9_biasadd_readvariableop_resource9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0"v
8while_simple_rnn_cell_9_matmul_1_readvariableop_resource:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0"r
6while_simple_rnn_cell_9_matmul_readvariableop_resource8while_simple_rnn_cell_9_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2`
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp2^
-while/simple_rnn_cell_9/MatMul/ReadVariableOp-while/simple_rnn_cell_9/MatMul/ReadVariableOp2b
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?>
?
@__inference_rnn_1_layer_call_and_return_conditional_losses_19995

inputs)
simple_rnn_cell_8_19920:>%
simple_rnn_cell_8_19922:>)
simple_rnn_cell_8_19924:>>
identity??)simple_rnn_cell_8/StatefulPartitionedCall?whileD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????*
shrink_axis_mask2
strided_slice_2?
)simple_rnn_cell_8/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0simple_rnn_cell_8_19920simple_rnn_cell_8_19922simple_rnn_cell_8_19924*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:?????????>:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_simple_rnn_cell_8_layer_call_and_return_conditional_losses_199192+
)simple_rnn_cell_8/StatefulPartitionedCall?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0simple_rnn_cell_8_19920simple_rnn_cell_8_19922simple_rnn_cell_8_19924*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_19932*
condR
while_cond_19931*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :??????????????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :??????????????????>2
transpose_1w
IdentityIdentitytranspose_1:y:0^NoOp*
T0*4
_output_shapes"
 :??????????????????>2

Identity?
NoOpNoOp*^simple_rnn_cell_8/StatefulPartitionedCall^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????: : : 2V
)simple_rnn_cell_8/StatefulPartitionedCall)simple_rnn_cell_8/StatefulPartitionedCall2
whilewhile:\ X
4
_output_shapes"
 :??????????????????
 
_user_specified_nameinputs
?7
?
while_body_21019
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0J
8while_simple_rnn_cell_8_matmul_readvariableop_resource_0:>G
9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0:>L
:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorH
6while_simple_rnn_cell_8_matmul_readvariableop_resource:>E
7while_simple_rnn_cell_8_biasadd_readvariableop_resource:>J
8while_simple_rnn_cell_8_matmul_1_readvariableop_resource:>>??.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?-while/simple_rnn_cell_8/MatMul/ReadVariableOp?/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/simple_rnn_cell_8/ones_like/ShapeShape0while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2)
'while/simple_rnn_cell_8/ones_like/Shape?
'while/simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'while/simple_rnn_cell_8/ones_like/Const?
!while/simple_rnn_cell_8/ones_likeFill0while/simple_rnn_cell_8/ones_like/Shape:output:00while/simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2#
!while/simple_rnn_cell_8/ones_like?
while/simple_rnn_cell_8/mulMul0while/TensorArrayV2Read/TensorListGetItem:item:0*while/simple_rnn_cell_8/ones_like:output:0*
T0*'
_output_shapes
:?????????2
while/simple_rnn_cell_8/mul?
-while/simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp8while_simple_rnn_cell_8_matmul_readvariableop_resource_0*
_output_shapes

:>*
dtype02/
-while/simple_rnn_cell_8/MatMul/ReadVariableOp?
while/simple_rnn_cell_8/MatMulMatMulwhile/simple_rnn_cell_8/mul:z:05while/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
while/simple_rnn_cell_8/MatMul?
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype020
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?
while/simple_rnn_cell_8/BiasAddBiasAdd(while/simple_rnn_cell_8/MatMul:product:06while/simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
while/simple_rnn_cell_8/BiasAdd?
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype021
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
 while/simple_rnn_cell_8/MatMul_1MatMulwhile_placeholder_27while/simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 while/simple_rnn_cell_8/MatMul_1?
while/simple_rnn_cell_8/addAddV2(while/simple_rnn_cell_8/BiasAdd:output:0*while/simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_8/add?
while/simple_rnn_cell_8/TanhTanhwhile/simple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_8/Tanh?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_8/Tanh:y:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity while/simple_rnn_cell_8/Tanh:y:0^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp/^while/simple_rnn_cell_8/BiasAdd/ReadVariableOp.^while/simple_rnn_cell_8/MatMul/ReadVariableOp0^while/simple_rnn_cell_8/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"t
7while_simple_rnn_cell_8_biasadd_readvariableop_resource9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0"v
8while_simple_rnn_cell_8_matmul_1_readvariableop_resource:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0"r
6while_simple_rnn_cell_8_matmul_readvariableop_resource8while_simple_rnn_cell_8_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2`
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp2^
-while/simple_rnn_cell_8/MatMul/ReadVariableOp-while/simple_rnn_cell_8/MatMul/ReadVariableOp2b
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?
?
while_cond_22610
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_22610___redundant_placeholder03
/while_while_cond_22610___redundant_placeholder13
/while_while_cond_22610___redundant_placeholder23
/while_while_cond_22610___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?Z
?
@__inference_rnn_2_layer_call_and_return_conditional_losses_23117
inputs_0B
0simple_rnn_cell_9_matmul_readvariableop_resource:>>?
1simple_rnn_cell_9_biasadd_readvariableop_resource:>D
2simple_rnn_cell_9_matmul_1_readvariableop_resource:>>
identity??(simple_rnn_cell_9/BiasAdd/ReadVariableOp?'simple_rnn_cell_9/MatMul/ReadVariableOp?)simple_rnn_cell_9/MatMul_1/ReadVariableOp?whileF
ShapeShapeinputs_0*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputs_0transpose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????>2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_2?
!simple_rnn_cell_9/ones_like/ShapeShapestrided_slice_2:output:0*
T0*
_output_shapes
:2#
!simple_rnn_cell_9/ones_like/Shape?
!simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2#
!simple_rnn_cell_9/ones_like/Const?
simple_rnn_cell_9/ones_likeFill*simple_rnn_cell_9/ones_like/Shape:output:0*simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/ones_like?
simple_rnn_cell_9/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2!
simple_rnn_cell_9/dropout/Const?
simple_rnn_cell_9/dropout/MulMul$simple_rnn_cell_9/ones_like:output:0(simple_rnn_cell_9/dropout/Const:output:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/dropout/Mul?
simple_rnn_cell_9/dropout/ShapeShape$simple_rnn_cell_9/ones_like:output:0*
T0*
_output_shapes
:2!
simple_rnn_cell_9/dropout/Shape?
6simple_rnn_cell_9/dropout/random_uniform/RandomUniformRandomUniform(simple_rnn_cell_9/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????>*
dtype0*

seed4*
seed2???28
6simple_rnn_cell_9/dropout/random_uniform/RandomUniform?
(simple_rnn_cell_9/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???2*
(simple_rnn_cell_9/dropout/GreaterEqual/y?
&simple_rnn_cell_9/dropout/GreaterEqualGreaterEqual?simple_rnn_cell_9/dropout/random_uniform/RandomUniform:output:01simple_rnn_cell_9/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????>2(
&simple_rnn_cell_9/dropout/GreaterEqual?
simple_rnn_cell_9/dropout/CastCast*simple_rnn_cell_9/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????>2 
simple_rnn_cell_9/dropout/Cast?
simple_rnn_cell_9/dropout/Mul_1Mul!simple_rnn_cell_9/dropout/Mul:z:0"simple_rnn_cell_9/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????>2!
simple_rnn_cell_9/dropout/Mul_1?
simple_rnn_cell_9/mulMulstrided_slice_2:output:0#simple_rnn_cell_9/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/mul?
'simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp0simple_rnn_cell_9_matmul_readvariableop_resource*
_output_shapes

:>>*
dtype02)
'simple_rnn_cell_9/MatMul/ReadVariableOp?
simple_rnn_cell_9/MatMulMatMulsimple_rnn_cell_9/mul:z:0/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/MatMul?
(simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp1simple_rnn_cell_9_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype02*
(simple_rnn_cell_9/BiasAdd/ReadVariableOp?
simple_rnn_cell_9/BiasAddBiasAdd"simple_rnn_cell_9/MatMul:product:00simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/BiasAdd?
)simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp2simple_rnn_cell_9_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02+
)simple_rnn_cell_9/MatMul_1/ReadVariableOp?
simple_rnn_cell_9/MatMul_1MatMulzeros:output:01simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/MatMul_1?
simple_rnn_cell_9/addAddV2"simple_rnn_cell_9/BiasAdd:output:0$simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/add?
simple_rnn_cell_9/TanhTanhsimple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/Tanh?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:00simple_rnn_cell_9_matmul_readvariableop_resource1simple_rnn_cell_9_biasadd_readvariableop_resource2simple_rnn_cell_9_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_23039*
condR
while_cond_23038*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :??????????????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :??????????????????>2
transpose_1s
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity?
NoOpNoOp)^simple_rnn_cell_9/BiasAdd/ReadVariableOp(^simple_rnn_cell_9/MatMul/ReadVariableOp*^simple_rnn_cell_9/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????>: : : 2T
(simple_rnn_cell_9/BiasAdd/ReadVariableOp(simple_rnn_cell_9/BiasAdd/ReadVariableOp2R
'simple_rnn_cell_9/MatMul/ReadVariableOp'simple_rnn_cell_9/MatMul/ReadVariableOp2V
)simple_rnn_cell_9/MatMul_1/ReadVariableOp)simple_rnn_cell_9/MatMul_1/ReadVariableOp2
whilewhile:^ Z
4
_output_shapes"
 :??????????????????>
"
_user_specified_name
inputs/0
?

?
1__inference_simple_rnn_cell_9_layer_call_fn_23592

inputs
states_0
unknown:>>
	unknown_0:>
	unknown_1:>>
identity

identity_1??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0unknown	unknown_0	unknown_1*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:?????????>:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_simple_rnn_cell_9_layer_call_and_return_conditional_losses_206012
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*'
_output_shapes
:?????????>2

Identity_1h
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:?????????>:?????????>: : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????>
 
_user_specified_nameinputs:QM
'
_output_shapes
:?????????>
"
_user_specified_name
states/0
?

?
1__inference_bitcoin_basic_RNN_layer_call_fn_22284

inputs
unknown:>
	unknown_0:>
	unknown_1:>>
	unknown_2:>>
	unknown_3:>
	unknown_4:>>
	unknown_5:>
	unknown_6:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????**
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_212412
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':?????????: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:?????????
 
_user_specified_nameinputs
?D
?
while_body_21341
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0J
8while_simple_rnn_cell_9_matmul_readvariableop_resource_0:>>G
9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0:>L
:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorH
6while_simple_rnn_cell_9_matmul_readvariableop_resource:>>E
7while_simple_rnn_cell_9_biasadd_readvariableop_resource:>J
8while_simple_rnn_cell_9_matmul_1_readvariableop_resource:>>??.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?-while/simple_rnn_cell_9/MatMul/ReadVariableOp?/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????>*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/simple_rnn_cell_9/ones_like/ShapeShape0while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2)
'while/simple_rnn_cell_9/ones_like/Shape?
'while/simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'while/simple_rnn_cell_9/ones_like/Const?
!while/simple_rnn_cell_9/ones_likeFill0while/simple_rnn_cell_9/ones_like/Shape:output:00while/simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2#
!while/simple_rnn_cell_9/ones_like?
%while/simple_rnn_cell_9/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2'
%while/simple_rnn_cell_9/dropout/Const?
#while/simple_rnn_cell_9/dropout/MulMul*while/simple_rnn_cell_9/ones_like:output:0.while/simple_rnn_cell_9/dropout/Const:output:0*
T0*'
_output_shapes
:?????????>2%
#while/simple_rnn_cell_9/dropout/Mul?
%while/simple_rnn_cell_9/dropout/ShapeShape*while/simple_rnn_cell_9/ones_like:output:0*
T0*
_output_shapes
:2'
%while/simple_rnn_cell_9/dropout/Shape?
<while/simple_rnn_cell_9/dropout/random_uniform/RandomUniformRandomUniform.while/simple_rnn_cell_9/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????>*
dtype0*

seed4*
seed2???2>
<while/simple_rnn_cell_9/dropout/random_uniform/RandomUniform?
.while/simple_rnn_cell_9/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???20
.while/simple_rnn_cell_9/dropout/GreaterEqual/y?
,while/simple_rnn_cell_9/dropout/GreaterEqualGreaterEqualEwhile/simple_rnn_cell_9/dropout/random_uniform/RandomUniform:output:07while/simple_rnn_cell_9/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????>2.
,while/simple_rnn_cell_9/dropout/GreaterEqual?
$while/simple_rnn_cell_9/dropout/CastCast0while/simple_rnn_cell_9/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????>2&
$while/simple_rnn_cell_9/dropout/Cast?
%while/simple_rnn_cell_9/dropout/Mul_1Mul'while/simple_rnn_cell_9/dropout/Mul:z:0(while/simple_rnn_cell_9/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????>2'
%while/simple_rnn_cell_9/dropout/Mul_1?
while/simple_rnn_cell_9/mulMul0while/TensorArrayV2Read/TensorListGetItem:item:0)while/simple_rnn_cell_9/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/mul?
-while/simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp8while_simple_rnn_cell_9_matmul_readvariableop_resource_0*
_output_shapes

:>>*
dtype02/
-while/simple_rnn_cell_9/MatMul/ReadVariableOp?
while/simple_rnn_cell_9/MatMulMatMulwhile/simple_rnn_cell_9/mul:z:05while/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
while/simple_rnn_cell_9/MatMul?
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype020
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?
while/simple_rnn_cell_9/BiasAddBiasAdd(while/simple_rnn_cell_9/MatMul:product:06while/simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
while/simple_rnn_cell_9/BiasAdd?
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype021
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
 while/simple_rnn_cell_9/MatMul_1MatMulwhile_placeholder_27while/simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 while/simple_rnn_cell_9/MatMul_1?
while/simple_rnn_cell_9/addAddV2(while/simple_rnn_cell_9/BiasAdd:output:0*while/simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/add?
while/simple_rnn_cell_9/TanhTanhwhile/simple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/Tanh?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_9/Tanh:y:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity while/simple_rnn_cell_9/Tanh:y:0^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp/^while/simple_rnn_cell_9/BiasAdd/ReadVariableOp.^while/simple_rnn_cell_9/MatMul/ReadVariableOp0^while/simple_rnn_cell_9/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"t
7while_simple_rnn_cell_9_biasadd_readvariableop_resource9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0"v
8while_simple_rnn_cell_9_matmul_1_readvariableop_resource:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0"r
6while_simple_rnn_cell_9_matmul_readvariableop_resource8while_simple_rnn_cell_9_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2`
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp2^
-while/simple_rnn_cell_9/MatMul/ReadVariableOp-while/simple_rnn_cell_9/MatMul/ReadVariableOp2b
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?
?
L__inference_simple_rnn_cell_8_layer_call_and_return_conditional_losses_20051

inputs

states0
matmul_readvariableop_resource:>-
biasadd_readvariableop_resource:>2
 matmul_1_readvariableop_resource:>>
identity

identity_1??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOpX
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:2
ones_like/Shapeg
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2
ones_like/Const?
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2
	ones_likec
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2
dropout/Const
dropout/MulMulones_like:output:0dropout/Const:output:0*
T0*'
_output_shapes
:?????????2
dropout/Mul`
dropout/ShapeShapeones_like:output:0*
T0*
_output_shapes
:2
dropout/Shape?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:?????????*
dtype0*

seed4*
seed2???2&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???2
dropout/GreaterEqual/y?
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????2
dropout/GreaterEqual
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????2
dropout/Castz
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:?????????2
dropout/Mul_1^
mulMulinputsdropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????2
mul?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:>*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulmul:z:0MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:>*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2	
BiasAdd?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02
MatMul_1/ReadVariableOpy
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2

MatMul_1k
addAddV2BiasAdd:output:0MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
addO
TanhTanhadd:z:0*
T0*'
_output_shapes
:?????????>2
Tanhc
IdentityIdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identityg

Identity_1IdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity_1?
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:?????????:?????????>: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????>
 
_user_specified_namestates
?N
?
@__inference_rnn_2_layer_call_and_return_conditional_losses_23237

inputsB
0simple_rnn_cell_9_matmul_readvariableop_resource:>>?
1simple_rnn_cell_9_biasadd_readvariableop_resource:>D
2simple_rnn_cell_9_matmul_1_readvariableop_resource:>>
identity??(simple_rnn_cell_9/BiasAdd/ReadVariableOp?'simple_rnn_cell_9/MatMul/ReadVariableOp?)simple_rnn_cell_9/MatMul_1/ReadVariableOp?whileD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/permz
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:?????????>2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_2?
!simple_rnn_cell_9/ones_like/ShapeShapestrided_slice_2:output:0*
T0*
_output_shapes
:2#
!simple_rnn_cell_9/ones_like/Shape?
!simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2#
!simple_rnn_cell_9/ones_like/Const?
simple_rnn_cell_9/ones_likeFill*simple_rnn_cell_9/ones_like/Shape:output:0*simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/ones_like?
simple_rnn_cell_9/mulMulstrided_slice_2:output:0$simple_rnn_cell_9/ones_like:output:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/mul?
'simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp0simple_rnn_cell_9_matmul_readvariableop_resource*
_output_shapes

:>>*
dtype02)
'simple_rnn_cell_9/MatMul/ReadVariableOp?
simple_rnn_cell_9/MatMulMatMulsimple_rnn_cell_9/mul:z:0/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/MatMul?
(simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp1simple_rnn_cell_9_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype02*
(simple_rnn_cell_9/BiasAdd/ReadVariableOp?
simple_rnn_cell_9/BiasAddBiasAdd"simple_rnn_cell_9/MatMul:product:00simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/BiasAdd?
)simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp2simple_rnn_cell_9_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02+
)simple_rnn_cell_9/MatMul_1/ReadVariableOp?
simple_rnn_cell_9/MatMul_1MatMulzeros:output:01simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/MatMul_1?
simple_rnn_cell_9/addAddV2"simple_rnn_cell_9/BiasAdd:output:0$simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/add?
simple_rnn_cell_9/TanhTanhsimple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/Tanh?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:00simple_rnn_cell_9_matmul_readvariableop_resource1simple_rnn_cell_9_biasadd_readvariableop_resource2simple_rnn_cell_9_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_23167*
condR
while_cond_23166*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:?????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*+
_output_shapes
:?????????>2
transpose_1s
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity?
NoOpNoOp)^simple_rnn_cell_9/BiasAdd/ReadVariableOp(^simple_rnn_cell_9/MatMul/ReadVariableOp*^simple_rnn_cell_9/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????>: : : 2T
(simple_rnn_cell_9/BiasAdd/ReadVariableOp(simple_rnn_cell_9/BiasAdd/ReadVariableOp2R
'simple_rnn_cell_9/MatMul/ReadVariableOp'simple_rnn_cell_9/MatMul/ReadVariableOp2V
)simple_rnn_cell_9/MatMul_1/ReadVariableOp)simple_rnn_cell_9/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:?????????>
 
_user_specified_nameinputs
?
?
%__inference_rnn_1_layer_call_fn_22861

inputs
unknown:>
	unknown_0:>
	unknown_1:>>
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_1_layer_call_and_return_conditional_losses_215772
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:?????????>2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????: : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:?????????
 
_user_specified_nameinputs
?N
?
@__inference_rnn_2_layer_call_and_return_conditional_losses_21216

inputsB
0simple_rnn_cell_9_matmul_readvariableop_resource:>>?
1simple_rnn_cell_9_biasadd_readvariableop_resource:>D
2simple_rnn_cell_9_matmul_1_readvariableop_resource:>>
identity??(simple_rnn_cell_9/BiasAdd/ReadVariableOp?'simple_rnn_cell_9/MatMul/ReadVariableOp?)simple_rnn_cell_9/MatMul_1/ReadVariableOp?whileD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/permz
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:?????????>2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_2?
!simple_rnn_cell_9/ones_like/ShapeShapestrided_slice_2:output:0*
T0*
_output_shapes
:2#
!simple_rnn_cell_9/ones_like/Shape?
!simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2#
!simple_rnn_cell_9/ones_like/Const?
simple_rnn_cell_9/ones_likeFill*simple_rnn_cell_9/ones_like/Shape:output:0*simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/ones_like?
simple_rnn_cell_9/mulMulstrided_slice_2:output:0$simple_rnn_cell_9/ones_like:output:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/mul?
'simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp0simple_rnn_cell_9_matmul_readvariableop_resource*
_output_shapes

:>>*
dtype02)
'simple_rnn_cell_9/MatMul/ReadVariableOp?
simple_rnn_cell_9/MatMulMatMulsimple_rnn_cell_9/mul:z:0/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/MatMul?
(simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp1simple_rnn_cell_9_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype02*
(simple_rnn_cell_9/BiasAdd/ReadVariableOp?
simple_rnn_cell_9/BiasAddBiasAdd"simple_rnn_cell_9/MatMul:product:00simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/BiasAdd?
)simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp2simple_rnn_cell_9_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02+
)simple_rnn_cell_9/MatMul_1/ReadVariableOp?
simple_rnn_cell_9/MatMul_1MatMulzeros:output:01simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/MatMul_1?
simple_rnn_cell_9/addAddV2"simple_rnn_cell_9/BiasAdd:output:0$simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/add?
simple_rnn_cell_9/TanhTanhsimple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/Tanh?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:00simple_rnn_cell_9_matmul_readvariableop_resource1simple_rnn_cell_9_biasadd_readvariableop_resource2simple_rnn_cell_9_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_21146*
condR
while_cond_21145*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:?????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*+
_output_shapes
:?????????>2
transpose_1s
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity?
NoOpNoOp)^simple_rnn_cell_9/BiasAdd/ReadVariableOp(^simple_rnn_cell_9/MatMul/ReadVariableOp*^simple_rnn_cell_9/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????>: : : 2T
(simple_rnn_cell_9/BiasAdd/ReadVariableOp(simple_rnn_cell_9/BiasAdd/ReadVariableOp2R
'simple_rnn_cell_9/MatMul/ReadVariableOp'simple_rnn_cell_9/MatMul/ReadVariableOp2V
)simple_rnn_cell_9/MatMul_1/ReadVariableOp)simple_rnn_cell_9/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:?????????>
 
_user_specified_nameinputs
?

?
1__inference_simple_rnn_cell_8_layer_call_fn_23514

inputs
states_0
unknown:>
	unknown_0:>
	unknown_1:>>
identity

identity_1??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0unknown	unknown_0	unknown_1*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:?????????>:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_simple_rnn_cell_8_layer_call_and_return_conditional_losses_200512
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*'
_output_shapes
:?????????>2

Identity_1h
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:?????????:?????????>: : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs:QM
'
_output_shapes
:?????????>
"
_user_specified_name
states/0
?
?
while_cond_22910
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_22910___redundant_placeholder03
/while_while_cond_22910___redundant_placeholder13
/while_while_cond_22910___redundant_placeholder23
/while_while_cond_22910___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?>
?
@__inference_rnn_1_layer_call_and_return_conditional_losses_20181

inputs)
simple_rnn_cell_8_20106:>%
simple_rnn_cell_8_20108:>)
simple_rnn_cell_8_20110:>>
identity??)simple_rnn_cell_8/StatefulPartitionedCall?whileD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????*
shrink_axis_mask2
strided_slice_2?
)simple_rnn_cell_8/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0simple_rnn_cell_8_20106simple_rnn_cell_8_20108simple_rnn_cell_8_20110*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:?????????>:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_simple_rnn_cell_8_layer_call_and_return_conditional_losses_200512+
)simple_rnn_cell_8/StatefulPartitionedCall?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0simple_rnn_cell_8_20106simple_rnn_cell_8_20108simple_rnn_cell_8_20110*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_20118*
condR
while_cond_20117*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :??????????????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :??????????????????>2
transpose_1w
IdentityIdentitytranspose_1:y:0^NoOp*
T0*4
_output_shapes"
 :??????????????????>2

Identity?
NoOpNoOp*^simple_rnn_cell_8/StatefulPartitionedCall^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????: : : 2V
)simple_rnn_cell_8/StatefulPartitionedCall)simple_rnn_cell_8/StatefulPartitionedCall2
whilewhile:\ X
4
_output_shapes"
 :??????????????????
 
_user_specified_nameinputs
?D
?
while_body_23295
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0J
8while_simple_rnn_cell_9_matmul_readvariableop_resource_0:>>G
9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0:>L
:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorH
6while_simple_rnn_cell_9_matmul_readvariableop_resource:>>E
7while_simple_rnn_cell_9_biasadd_readvariableop_resource:>J
8while_simple_rnn_cell_9_matmul_1_readvariableop_resource:>>??.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?-while/simple_rnn_cell_9/MatMul/ReadVariableOp?/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????>*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/simple_rnn_cell_9/ones_like/ShapeShape0while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2)
'while/simple_rnn_cell_9/ones_like/Shape?
'while/simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'while/simple_rnn_cell_9/ones_like/Const?
!while/simple_rnn_cell_9/ones_likeFill0while/simple_rnn_cell_9/ones_like/Shape:output:00while/simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2#
!while/simple_rnn_cell_9/ones_like?
%while/simple_rnn_cell_9/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2'
%while/simple_rnn_cell_9/dropout/Const?
#while/simple_rnn_cell_9/dropout/MulMul*while/simple_rnn_cell_9/ones_like:output:0.while/simple_rnn_cell_9/dropout/Const:output:0*
T0*'
_output_shapes
:?????????>2%
#while/simple_rnn_cell_9/dropout/Mul?
%while/simple_rnn_cell_9/dropout/ShapeShape*while/simple_rnn_cell_9/ones_like:output:0*
T0*
_output_shapes
:2'
%while/simple_rnn_cell_9/dropout/Shape?
<while/simple_rnn_cell_9/dropout/random_uniform/RandomUniformRandomUniform.while/simple_rnn_cell_9/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????>*
dtype0*

seed4*
seed2??k2>
<while/simple_rnn_cell_9/dropout/random_uniform/RandomUniform?
.while/simple_rnn_cell_9/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???20
.while/simple_rnn_cell_9/dropout/GreaterEqual/y?
,while/simple_rnn_cell_9/dropout/GreaterEqualGreaterEqualEwhile/simple_rnn_cell_9/dropout/random_uniform/RandomUniform:output:07while/simple_rnn_cell_9/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????>2.
,while/simple_rnn_cell_9/dropout/GreaterEqual?
$while/simple_rnn_cell_9/dropout/CastCast0while/simple_rnn_cell_9/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????>2&
$while/simple_rnn_cell_9/dropout/Cast?
%while/simple_rnn_cell_9/dropout/Mul_1Mul'while/simple_rnn_cell_9/dropout/Mul:z:0(while/simple_rnn_cell_9/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????>2'
%while/simple_rnn_cell_9/dropout/Mul_1?
while/simple_rnn_cell_9/mulMul0while/TensorArrayV2Read/TensorListGetItem:item:0)while/simple_rnn_cell_9/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/mul?
-while/simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp8while_simple_rnn_cell_9_matmul_readvariableop_resource_0*
_output_shapes

:>>*
dtype02/
-while/simple_rnn_cell_9/MatMul/ReadVariableOp?
while/simple_rnn_cell_9/MatMulMatMulwhile/simple_rnn_cell_9/mul:z:05while/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
while/simple_rnn_cell_9/MatMul?
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype020
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?
while/simple_rnn_cell_9/BiasAddBiasAdd(while/simple_rnn_cell_9/MatMul:product:06while/simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
while/simple_rnn_cell_9/BiasAdd?
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype021
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
 while/simple_rnn_cell_9/MatMul_1MatMulwhile_placeholder_27while/simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 while/simple_rnn_cell_9/MatMul_1?
while/simple_rnn_cell_9/addAddV2(while/simple_rnn_cell_9/BiasAdd:output:0*while/simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/add?
while/simple_rnn_cell_9/TanhTanhwhile/simple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/Tanh?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_9/Tanh:y:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity while/simple_rnn_cell_9/Tanh:y:0^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp/^while/simple_rnn_cell_9/BiasAdd/ReadVariableOp.^while/simple_rnn_cell_9/MatMul/ReadVariableOp0^while/simple_rnn_cell_9/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"t
7while_simple_rnn_cell_9_biasadd_readvariableop_resource9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0"v
8while_simple_rnn_cell_9_matmul_1_readvariableop_resource:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0"r
6while_simple_rnn_cell_9_matmul_readvariableop_resource8while_simple_rnn_cell_9_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2`
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp2^
-while/simple_rnn_cell_9/MatMul/ReadVariableOp-while/simple_rnn_cell_9/MatMul/ReadVariableOp2b
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?7
?
while_body_21146
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0J
8while_simple_rnn_cell_9_matmul_readvariableop_resource_0:>>G
9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0:>L
:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorH
6while_simple_rnn_cell_9_matmul_readvariableop_resource:>>E
7while_simple_rnn_cell_9_biasadd_readvariableop_resource:>J
8while_simple_rnn_cell_9_matmul_1_readvariableop_resource:>>??.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?-while/simple_rnn_cell_9/MatMul/ReadVariableOp?/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????>*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/simple_rnn_cell_9/ones_like/ShapeShape0while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2)
'while/simple_rnn_cell_9/ones_like/Shape?
'while/simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'while/simple_rnn_cell_9/ones_like/Const?
!while/simple_rnn_cell_9/ones_likeFill0while/simple_rnn_cell_9/ones_like/Shape:output:00while/simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2#
!while/simple_rnn_cell_9/ones_like?
while/simple_rnn_cell_9/mulMul0while/TensorArrayV2Read/TensorListGetItem:item:0*while/simple_rnn_cell_9/ones_like:output:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/mul?
-while/simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp8while_simple_rnn_cell_9_matmul_readvariableop_resource_0*
_output_shapes

:>>*
dtype02/
-while/simple_rnn_cell_9/MatMul/ReadVariableOp?
while/simple_rnn_cell_9/MatMulMatMulwhile/simple_rnn_cell_9/mul:z:05while/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
while/simple_rnn_cell_9/MatMul?
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype020
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?
while/simple_rnn_cell_9/BiasAddBiasAdd(while/simple_rnn_cell_9/MatMul:product:06while/simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
while/simple_rnn_cell_9/BiasAdd?
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype021
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
 while/simple_rnn_cell_9/MatMul_1MatMulwhile_placeholder_27while/simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 while/simple_rnn_cell_9/MatMul_1?
while/simple_rnn_cell_9/addAddV2(while/simple_rnn_cell_9/BiasAdd:output:0*while/simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/add?
while/simple_rnn_cell_9/TanhTanhwhile/simple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/Tanh?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_9/Tanh:y:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity while/simple_rnn_cell_9/Tanh:y:0^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp/^while/simple_rnn_cell_9/BiasAdd/ReadVariableOp.^while/simple_rnn_cell_9/MatMul/ReadVariableOp0^while/simple_rnn_cell_9/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"t
7while_simple_rnn_cell_9_biasadd_readvariableop_resource9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0"v
8while_simple_rnn_cell_9_matmul_1_readvariableop_resource:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0"r
6while_simple_rnn_cell_9_matmul_readvariableop_resource8while_simple_rnn_cell_9_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2`
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp2^
-while/simple_rnn_cell_9/MatMul/ReadVariableOp-while/simple_rnn_cell_9/MatMul/ReadVariableOp2b
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?
?
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_21241

inputs
rnn_1_21090:>
rnn_1_21092:>
rnn_1_21094:>>
rnn_2_21217:>>
rnn_2_21219:>
rnn_2_21221:>>$
output_layer_21235:> 
output_layer_21237:
identity??$output_layer/StatefulPartitionedCall?rnn_1/StatefulPartitionedCall?rnn_2/StatefulPartitionedCall?
rnn_1/StatefulPartitionedCallStatefulPartitionedCallinputsrnn_1_21090rnn_1_21092rnn_1_21094*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_1_layer_call_and_return_conditional_losses_210892
rnn_1/StatefulPartitionedCall?
rnn_2/StatefulPartitionedCallStatefulPartitionedCall&rnn_1/StatefulPartitionedCall:output:0rnn_2_21217rnn_2_21219rnn_2_21221*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_rnn_2_layer_call_and_return_conditional_losses_212162
rnn_2/StatefulPartitionedCall?
$output_layer/StatefulPartitionedCallStatefulPartitionedCall&rnn_2/StatefulPartitionedCall:output:0output_layer_21235output_layer_21237*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *P
fKRI
G__inference_output_layer_layer_call_and_return_conditional_losses_212342&
$output_layer/StatefulPartitionedCall?
IdentityIdentity-output_layer/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????2

Identity?
NoOpNoOp%^output_layer/StatefulPartitionedCall^rnn_1/StatefulPartitionedCall^rnn_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':?????????: : : : : : : : 2L
$output_layer/StatefulPartitionedCall$output_layer/StatefulPartitionedCall2>
rnn_1/StatefulPartitionedCallrnn_1/StatefulPartitionedCall2>
rnn_2/StatefulPartitionedCallrnn_2/StatefulPartitionedCall:S O
+
_output_shapes
:?????????
 
_user_specified_nameinputs
?7
?
while_body_22911
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0J
8while_simple_rnn_cell_9_matmul_readvariableop_resource_0:>>G
9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0:>L
:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorH
6while_simple_rnn_cell_9_matmul_readvariableop_resource:>>E
7while_simple_rnn_cell_9_biasadd_readvariableop_resource:>J
8while_simple_rnn_cell_9_matmul_1_readvariableop_resource:>>??.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?-while/simple_rnn_cell_9/MatMul/ReadVariableOp?/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????>*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/simple_rnn_cell_9/ones_like/ShapeShape0while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2)
'while/simple_rnn_cell_9/ones_like/Shape?
'while/simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'while/simple_rnn_cell_9/ones_like/Const?
!while/simple_rnn_cell_9/ones_likeFill0while/simple_rnn_cell_9/ones_like/Shape:output:00while/simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2#
!while/simple_rnn_cell_9/ones_like?
while/simple_rnn_cell_9/mulMul0while/TensorArrayV2Read/TensorListGetItem:item:0*while/simple_rnn_cell_9/ones_like:output:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/mul?
-while/simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp8while_simple_rnn_cell_9_matmul_readvariableop_resource_0*
_output_shapes

:>>*
dtype02/
-while/simple_rnn_cell_9/MatMul/ReadVariableOp?
while/simple_rnn_cell_9/MatMulMatMulwhile/simple_rnn_cell_9/mul:z:05while/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
while/simple_rnn_cell_9/MatMul?
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype020
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp?
while/simple_rnn_cell_9/BiasAddBiasAdd(while/simple_rnn_cell_9/MatMul:product:06while/simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
while/simple_rnn_cell_9/BiasAdd?
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype021
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp?
 while/simple_rnn_cell_9/MatMul_1MatMulwhile_placeholder_27while/simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 while/simple_rnn_cell_9/MatMul_1?
while/simple_rnn_cell_9/addAddV2(while/simple_rnn_cell_9/BiasAdd:output:0*while/simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/add?
while/simple_rnn_cell_9/TanhTanhwhile/simple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_9/Tanh?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_9/Tanh:y:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity while/simple_rnn_cell_9/Tanh:y:0^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp/^while/simple_rnn_cell_9/BiasAdd/ReadVariableOp.^while/simple_rnn_cell_9/MatMul/ReadVariableOp0^while/simple_rnn_cell_9/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"t
7while_simple_rnn_cell_9_biasadd_readvariableop_resource9while_simple_rnn_cell_9_biasadd_readvariableop_resource_0"v
8while_simple_rnn_cell_9_matmul_1_readvariableop_resource:while_simple_rnn_cell_9_matmul_1_readvariableop_resource_0"r
6while_simple_rnn_cell_9_matmul_readvariableop_resource8while_simple_rnn_cell_9_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2`
.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp.while/simple_rnn_cell_9/BiasAdd/ReadVariableOp2^
-while/simple_rnn_cell_9/MatMul/ReadVariableOp-while/simple_rnn_cell_9/MatMul/ReadVariableOp2b
/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp/while/simple_rnn_cell_9/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?N
?
@__inference_rnn_2_layer_call_and_return_conditional_losses_22981
inputs_0B
0simple_rnn_cell_9_matmul_readvariableop_resource:>>?
1simple_rnn_cell_9_biasadd_readvariableop_resource:>D
2simple_rnn_cell_9_matmul_1_readvariableop_resource:>>
identity??(simple_rnn_cell_9/BiasAdd/ReadVariableOp?'simple_rnn_cell_9/MatMul/ReadVariableOp?)simple_rnn_cell_9/MatMul_1/ReadVariableOp?whileF
ShapeShapeinputs_0*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputs_0transpose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????>2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_2?
!simple_rnn_cell_9/ones_like/ShapeShapestrided_slice_2:output:0*
T0*
_output_shapes
:2#
!simple_rnn_cell_9/ones_like/Shape?
!simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2#
!simple_rnn_cell_9/ones_like/Const?
simple_rnn_cell_9/ones_likeFill*simple_rnn_cell_9/ones_like/Shape:output:0*simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/ones_like?
simple_rnn_cell_9/mulMulstrided_slice_2:output:0$simple_rnn_cell_9/ones_like:output:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/mul?
'simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp0simple_rnn_cell_9_matmul_readvariableop_resource*
_output_shapes

:>>*
dtype02)
'simple_rnn_cell_9/MatMul/ReadVariableOp?
simple_rnn_cell_9/MatMulMatMulsimple_rnn_cell_9/mul:z:0/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/MatMul?
(simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp1simple_rnn_cell_9_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype02*
(simple_rnn_cell_9/BiasAdd/ReadVariableOp?
simple_rnn_cell_9/BiasAddBiasAdd"simple_rnn_cell_9/MatMul:product:00simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/BiasAdd?
)simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp2simple_rnn_cell_9_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02+
)simple_rnn_cell_9/MatMul_1/ReadVariableOp?
simple_rnn_cell_9/MatMul_1MatMulzeros:output:01simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/MatMul_1?
simple_rnn_cell_9/addAddV2"simple_rnn_cell_9/BiasAdd:output:0$simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/add?
simple_rnn_cell_9/TanhTanhsimple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/Tanh?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:00simple_rnn_cell_9_matmul_readvariableop_resource1simple_rnn_cell_9_biasadd_readvariableop_resource2simple_rnn_cell_9_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_22911*
condR
while_cond_22910*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :??????????????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :??????????????????>2
transpose_1s
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity?
NoOpNoOp)^simple_rnn_cell_9/BiasAdd/ReadVariableOp(^simple_rnn_cell_9/MatMul/ReadVariableOp*^simple_rnn_cell_9/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????>: : : 2T
(simple_rnn_cell_9/BiasAdd/ReadVariableOp(simple_rnn_cell_9/BiasAdd/ReadVariableOp2R
'simple_rnn_cell_9/MatMul/ReadVariableOp'simple_rnn_cell_9/MatMul/ReadVariableOp2V
)simple_rnn_cell_9/MatMul_1/ReadVariableOp)simple_rnn_cell_9/MatMul_1/ReadVariableOp2
whilewhile:^ Z
4
_output_shapes"
 :??????????????????>
"
_user_specified_name
inputs/0
?
?
while_cond_21145
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_21145___redundant_placeholder03
/while_while_cond_21145___redundant_placeholder13
/while_while_cond_21145___redundant_placeholder23
/while_while_cond_21145___redundant_placeholder3
while_identity
p

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: 2

while/Less]
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: 2
while/Identity")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-: : : : :?????????>: ::::: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
:
?Z
?
@__inference_rnn_2_layer_call_and_return_conditional_losses_21419

inputsB
0simple_rnn_cell_9_matmul_readvariableop_resource:>>?
1simple_rnn_cell_9_biasadd_readvariableop_resource:>D
2simple_rnn_cell_9_matmul_1_readvariableop_resource:>>
identity??(simple_rnn_cell_9/BiasAdd/ReadVariableOp?'simple_rnn_cell_9/MatMul/ReadVariableOp?)simple_rnn_cell_9/MatMul_1/ReadVariableOp?whileD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/permz
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:?????????>2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_2?
!simple_rnn_cell_9/ones_like/ShapeShapestrided_slice_2:output:0*
T0*
_output_shapes
:2#
!simple_rnn_cell_9/ones_like/Shape?
!simple_rnn_cell_9/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2#
!simple_rnn_cell_9/ones_like/Const?
simple_rnn_cell_9/ones_likeFill*simple_rnn_cell_9/ones_like/Shape:output:0*simple_rnn_cell_9/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/ones_like?
simple_rnn_cell_9/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2!
simple_rnn_cell_9/dropout/Const?
simple_rnn_cell_9/dropout/MulMul$simple_rnn_cell_9/ones_like:output:0(simple_rnn_cell_9/dropout/Const:output:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/dropout/Mul?
simple_rnn_cell_9/dropout/ShapeShape$simple_rnn_cell_9/ones_like:output:0*
T0*
_output_shapes
:2!
simple_rnn_cell_9/dropout/Shape?
6simple_rnn_cell_9/dropout/random_uniform/RandomUniformRandomUniform(simple_rnn_cell_9/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????>*
dtype0*

seed4*
seed2?ݳ28
6simple_rnn_cell_9/dropout/random_uniform/RandomUniform?
(simple_rnn_cell_9/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???2*
(simple_rnn_cell_9/dropout/GreaterEqual/y?
&simple_rnn_cell_9/dropout/GreaterEqualGreaterEqual?simple_rnn_cell_9/dropout/random_uniform/RandomUniform:output:01simple_rnn_cell_9/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????>2(
&simple_rnn_cell_9/dropout/GreaterEqual?
simple_rnn_cell_9/dropout/CastCast*simple_rnn_cell_9/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????>2 
simple_rnn_cell_9/dropout/Cast?
simple_rnn_cell_9/dropout/Mul_1Mul!simple_rnn_cell_9/dropout/Mul:z:0"simple_rnn_cell_9/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????>2!
simple_rnn_cell_9/dropout/Mul_1?
simple_rnn_cell_9/mulMulstrided_slice_2:output:0#simple_rnn_cell_9/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/mul?
'simple_rnn_cell_9/MatMul/ReadVariableOpReadVariableOp0simple_rnn_cell_9_matmul_readvariableop_resource*
_output_shapes

:>>*
dtype02)
'simple_rnn_cell_9/MatMul/ReadVariableOp?
simple_rnn_cell_9/MatMulMatMulsimple_rnn_cell_9/mul:z:0/simple_rnn_cell_9/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/MatMul?
(simple_rnn_cell_9/BiasAdd/ReadVariableOpReadVariableOp1simple_rnn_cell_9_biasadd_readvariableop_resource*
_output_shapes
:>*
dtype02*
(simple_rnn_cell_9/BiasAdd/ReadVariableOp?
simple_rnn_cell_9/BiasAddBiasAdd"simple_rnn_cell_9/MatMul:product:00simple_rnn_cell_9/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/BiasAdd?
)simple_rnn_cell_9/MatMul_1/ReadVariableOpReadVariableOp2simple_rnn_cell_9_matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02+
)simple_rnn_cell_9/MatMul_1/ReadVariableOp?
simple_rnn_cell_9/MatMul_1MatMulzeros:output:01simple_rnn_cell_9/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/MatMul_1?
simple_rnn_cell_9/addAddV2"simple_rnn_cell_9/BiasAdd:output:0$simple_rnn_cell_9/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/add?
simple_rnn_cell_9/TanhTanhsimple_rnn_cell_9/add:z:0*
T0*'
_output_shapes
:?????????>2
simple_rnn_cell_9/Tanh?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:00simple_rnn_cell_9_matmul_readvariableop_resource1simple_rnn_cell_9_biasadd_readvariableop_resource2simple_rnn_cell_9_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_21341*
condR
while_cond_21340*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*+
_output_shapes
:?????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*+
_output_shapes
:?????????>2
transpose_1s
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity?
NoOpNoOp)^simple_rnn_cell_9/BiasAdd/ReadVariableOp(^simple_rnn_cell_9/MatMul/ReadVariableOp*^simple_rnn_cell_9/MatMul_1/ReadVariableOp^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????>: : : 2T
(simple_rnn_cell_9/BiasAdd/ReadVariableOp(simple_rnn_cell_9/BiasAdd/ReadVariableOp2R
'simple_rnn_cell_9/MatMul/ReadVariableOp'simple_rnn_cell_9/MatMul/ReadVariableOp2V
)simple_rnn_cell_9/MatMul_1/ReadVariableOp)simple_rnn_cell_9/MatMul_1/ReadVariableOp2
whilewhile:S O
+
_output_shapes
:?????????>
 
_user_specified_nameinputs
?
?
L__inference_simple_rnn_cell_8_layer_call_and_return_conditional_losses_19919

inputs

states0
matmul_readvariableop_resource:>-
biasadd_readvariableop_resource:>2
 matmul_1_readvariableop_resource:>>
identity

identity_1??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?MatMul_1/ReadVariableOpX
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:2
ones_like/Shapeg
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2
ones_like/Const?
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2
	ones_like_
mulMulinputsones_like:output:0*
T0*'
_output_shapes
:?????????2
mul?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:>*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulmul:z:0MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:>*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2	
BiasAdd?
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource*
_output_shapes

:>>*
dtype02
MatMul_1/ReadVariableOpy
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2

MatMul_1k
addAddV2BiasAdd:output:0MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
addO
TanhTanhadd:z:0*
T0*'
_output_shapes
:?????????>2
Tanhc
IdentityIdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identityg

Identity_1IdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity_1?
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,:?????????:?????????>: : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????>
 
_user_specified_namestates
?D
?
while_body_21499
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0J
8while_simple_rnn_cell_8_matmul_readvariableop_resource_0:>G
9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0:>L
:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0:>>
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorH
6while_simple_rnn_cell_8_matmul_readvariableop_resource:>E
7while_simple_rnn_cell_8_biasadd_readvariableop_resource:>J
8while_simple_rnn_cell_8_matmul_1_readvariableop_resource:>>??.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?-while/simple_rnn_cell_8/MatMul/ReadVariableOp?/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????   29
7while/TensorArrayV2Read/TensorListGetItem/element_shape?
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:?????????*
element_dtype02+
)while/TensorArrayV2Read/TensorListGetItem?
'while/simple_rnn_cell_8/ones_like/ShapeShape0while/TensorArrayV2Read/TensorListGetItem:item:0*
T0*
_output_shapes
:2)
'while/simple_rnn_cell_8/ones_like/Shape?
'while/simple_rnn_cell_8/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ??2)
'while/simple_rnn_cell_8/ones_like/Const?
!while/simple_rnn_cell_8/ones_likeFill0while/simple_rnn_cell_8/ones_like/Shape:output:00while/simple_rnn_cell_8/ones_like/Const:output:0*
T0*'
_output_shapes
:?????????2#
!while/simple_rnn_cell_8/ones_like?
%while/simple_rnn_cell_8/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *?8@2'
%while/simple_rnn_cell_8/dropout/Const?
#while/simple_rnn_cell_8/dropout/MulMul*while/simple_rnn_cell_8/ones_like:output:0.while/simple_rnn_cell_8/dropout/Const:output:0*
T0*'
_output_shapes
:?????????2%
#while/simple_rnn_cell_8/dropout/Mul?
%while/simple_rnn_cell_8/dropout/ShapeShape*while/simple_rnn_cell_8/ones_like:output:0*
T0*
_output_shapes
:2'
%while/simple_rnn_cell_8/dropout/Shape?
<while/simple_rnn_cell_8/dropout/random_uniform/RandomUniformRandomUniform.while/simple_rnn_cell_8/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????*
dtype0*

seed4*
seed2?Ԡ2>
<while/simple_rnn_cell_8/dropout/random_uniform/RandomUniform?
.while/simple_rnn_cell_8/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *???20
.while/simple_rnn_cell_8/dropout/GreaterEqual/y?
,while/simple_rnn_cell_8/dropout/GreaterEqualGreaterEqualEwhile/simple_rnn_cell_8/dropout/random_uniform/RandomUniform:output:07while/simple_rnn_cell_8/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????2.
,while/simple_rnn_cell_8/dropout/GreaterEqual?
$while/simple_rnn_cell_8/dropout/CastCast0while/simple_rnn_cell_8/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????2&
$while/simple_rnn_cell_8/dropout/Cast?
%while/simple_rnn_cell_8/dropout/Mul_1Mul'while/simple_rnn_cell_8/dropout/Mul:z:0(while/simple_rnn_cell_8/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????2'
%while/simple_rnn_cell_8/dropout/Mul_1?
while/simple_rnn_cell_8/mulMul0while/TensorArrayV2Read/TensorListGetItem:item:0)while/simple_rnn_cell_8/dropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????2
while/simple_rnn_cell_8/mul?
-while/simple_rnn_cell_8/MatMul/ReadVariableOpReadVariableOp8while_simple_rnn_cell_8_matmul_readvariableop_resource_0*
_output_shapes

:>*
dtype02/
-while/simple_rnn_cell_8/MatMul/ReadVariableOp?
while/simple_rnn_cell_8/MatMulMatMulwhile/simple_rnn_cell_8/mul:z:05while/simple_rnn_cell_8/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2 
while/simple_rnn_cell_8/MatMul?
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOpReadVariableOp9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0*
_output_shapes
:>*
dtype020
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp?
while/simple_rnn_cell_8/BiasAddBiasAdd(while/simple_rnn_cell_8/MatMul:product:06while/simple_rnn_cell_8/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2!
while/simple_rnn_cell_8/BiasAdd?
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOpReadVariableOp:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0*
_output_shapes

:>>*
dtype021
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp?
 while/simple_rnn_cell_8/MatMul_1MatMulwhile_placeholder_27while/simple_rnn_cell_8/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????>2"
 while/simple_rnn_cell_8/MatMul_1?
while/simple_rnn_cell_8/addAddV2(while/simple_rnn_cell_8/BiasAdd:output:0*while/simple_rnn_cell_8/MatMul_1:product:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_8/add?
while/simple_rnn_cell_8/TanhTanhwhile/simple_rnn_cell_8/add:z:0*
T0*'
_output_shapes
:?????????>2
while/simple_rnn_cell_8/Tanh?
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_1while_placeholder while/simple_rnn_cell_8/Tanh:y:0*
_output_shapes
: *
element_dtype02,
*while/TensorArrayV2Write/TensorListSetItem\
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add/yi
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: 2
	while/add`
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :2
while/add_1/yv
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: 2
while/add_1k
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity~
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_1m
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_2?
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: 2
while/Identity_3?
while/Identity_4Identity while/simple_rnn_cell_8/Tanh:y:0^while/NoOp*
T0*'
_output_shapes
:?????????>2
while/Identity_4?

while/NoOpNoOp/^while/simple_rnn_cell_8/BiasAdd/ReadVariableOp.^while/simple_rnn_cell_8/MatMul/ReadVariableOp0^while/simple_rnn_cell_8/MatMul_1/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2

while/NoOp")
while_identitywhile/Identity:output:0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0"t
7while_simple_rnn_cell_8_biasadd_readvariableop_resource9while_simple_rnn_cell_8_biasadd_readvariableop_resource_0"v
8while_simple_rnn_cell_8_matmul_1_readvariableop_resource:while_simple_rnn_cell_8_matmul_1_readvariableop_resource_0"r
6while_simple_rnn_cell_8_matmul_readvariableop_resource8while_simple_rnn_cell_8_matmul_readvariableop_resource_0"0
while_strided_slice_1while_strided_slice_1_0"?
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%: : : : :?????????>: : : : : 2`
.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp.while/simple_rnn_cell_8/BiasAdd/ReadVariableOp2^
-while/simple_rnn_cell_8/MatMul/ReadVariableOp-while/simple_rnn_cell_8/MatMul/ReadVariableOp2b
/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp/while/simple_rnn_cell_8/MatMul_1/ReadVariableOp: 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:?????????>:

_output_shapes
: :

_output_shapes
: 
?>
?
@__inference_rnn_2_layer_call_and_return_conditional_losses_20731

inputs)
simple_rnn_cell_9_20656:>>%
simple_rnn_cell_9_20658:>)
simple_rnn_cell_9_20660:>>
identity??)simple_rnn_cell_9/StatefulPartitionedCall?whileD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
zeros/mul/yConst*
_output_shapes
: *
dtype0*
value	B :>2
zeros/mul/yl
	zeros/mulMulstrided_slice:output:0zeros/mul/y:output:0*
T0*
_output_shapes
: 2
	zeros/mul_
zeros/Less/yConst*
_output_shapes
: *
dtype0*
value
B :?2
zeros/Less/yg

zeros/LessLesszeros/mul:z:0zeros/Less/y:output:0*
T0*
_output_shapes
: 2

zeros/Lessb
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value	B :>2
zeros/packed/1?
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:2
zeros/packed_
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    2
zeros/Constu
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*'
_output_shapes
:?????????>2
zerosu
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose/perm?
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :??????????????????>2
	transposeO
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
:2	
Shape_1x
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_1/stack|
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_1|
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_1/stack_2?
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice_1?
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
TensorArrayV2/element_shape?
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2?
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   27
5TensorArrayUnstack/TensorListFromTensor/element_shape?
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type02)
'TensorArrayUnstack/TensorListFromTensorx
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_2/stack|
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_1|
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_2/stack_2?
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_2?
)simple_rnn_cell_9/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0simple_rnn_cell_9_20656simple_rnn_cell_9_20658simple_rnn_cell_9_20660*
Tin	
2*
Tout
2*
_collective_manager_ids
 *:
_output_shapes(
&:?????????>:?????????>*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *U
fPRN
L__inference_simple_rnn_cell_9_layer_call_and_return_conditional_losses_206012+
)simple_rnn_cell_9/StatefulPartitionedCall?
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   2
TensorArrayV2_1/element_shape?
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type02
TensorArrayV2_1N
timeConst*
_output_shapes
: *
dtype0*
value	B : 2
time
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
while/maximum_iterationsj
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : 2
while/loop_counter?
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0simple_rnn_cell_9_20656simple_rnn_cell_9_20658simple_rnn_cell_9_20660*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*9
_output_shapes'
%: : : : :?????????>: : : : : *%
_read_only_resource_inputs
	*
_stateful_parallelism( *
bodyR
while_body_20668*
condR
while_cond_20667*8
output_shapes'
%: : : : :?????????>: : : : : *
parallel_iterations 2
while?
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"????>   22
0TensorArrayV2Stack/TensorListStack/element_shape?
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*4
_output_shapes"
 :??????????????????>*
element_dtype02$
"TensorArrayV2Stack/TensorListStack?
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????2
strided_slice_3/stack|
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice_3/stack_1|
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice_3/stack_2?
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*'
_output_shapes
:?????????>*
shrink_axis_mask2
strided_slice_3y
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          2
transpose_1/perm?
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*4
_output_shapes"
 :??????????????????>2
transpose_1s
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*'
_output_shapes
:?????????>2

Identity?
NoOpNoOp*^simple_rnn_cell_9/StatefulPartitionedCall^while*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:??????????????????>: : : 2V
)simple_rnn_cell_9/StatefulPartitionedCall)simple_rnn_cell_9/StatefulPartitionedCall2
whilewhile:\ X
4
_output_shapes"
 :??????????????????>
 
_user_specified_nameinputs"?L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*?
serving_default?
G
input_layer8
serving_default_input_layer:0?????????@
output_layer0
StatefulPartitionedCall:0?????????tensorflow/serving/predict:??
?
layer_with_weights-0
layer-0
layer_with_weights-1
layer-1
layer_with_weights-2
layer-2
	optimizer
	variables
regularization_losses
trainable_variables
	keras_api
	
signatures
*j&call_and_return_all_conditional_losses
k_default_save_signature
l__call__"
_tf_keras_sequential
?

cell

state_spec
	variables
regularization_losses
trainable_variables
	keras_api
*m&call_and_return_all_conditional_losses
n__call__"
_tf_keras_rnn_layer
?
cell

state_spec
	variables
regularization_losses
trainable_variables
	keras_api
*o&call_and_return_all_conditional_losses
p__call__"
_tf_keras_rnn_layer
?

kernel
bias
	variables
regularization_losses
trainable_variables
	keras_api
*q&call_and_return_all_conditional_losses
r__call__"
_tf_keras_layer
?
iter

beta_1

beta_2
	decay
 learning_ratemZm[!m\"m]#m^$m_%m`&mavbvc!vd"ve#vf$vg%vh&vi"
	optimizer
X
!0
"1
#2
$3
%4
&5
6
7"
trackable_list_wrapper
 "
trackable_list_wrapper
X
!0
"1
#2
$3
%4
&5
6
7"
trackable_list_wrapper
?
	variables
regularization_losses
'metrics

(layers
)non_trainable_variables
*layer_regularization_losses
+layer_metrics
trainable_variables
l__call__
k_default_save_signature
*j&call_and_return_all_conditional_losses
&j"call_and_return_conditional_losses"
_generic_user_object
,
sserving_default"
signature_map
?

!kernel
"recurrent_kernel
#bias
,	variables
-regularization_losses
.trainable_variables
/	keras_api
*t&call_and_return_all_conditional_losses
u__call__"
_tf_keras_layer
 "
trackable_list_wrapper
5
!0
"1
#2"
trackable_list_wrapper
 "
trackable_list_wrapper
5
!0
"1
#2"
trackable_list_wrapper
?
	variables

0states
regularization_losses
1metrics

2layers
3non_trainable_variables
4layer_regularization_losses
5layer_metrics
trainable_variables
n__call__
*m&call_and_return_all_conditional_losses
&m"call_and_return_conditional_losses"
_generic_user_object
?

$kernel
%recurrent_kernel
&bias
6	variables
7regularization_losses
8trainable_variables
9	keras_api
*v&call_and_return_all_conditional_losses
w__call__"
_tf_keras_layer
 "
trackable_list_wrapper
5
$0
%1
&2"
trackable_list_wrapper
 "
trackable_list_wrapper
5
$0
%1
&2"
trackable_list_wrapper
?
	variables

:states
regularization_losses
;metrics

<layers
=non_trainable_variables
>layer_regularization_losses
?layer_metrics
trainable_variables
p__call__
*o&call_and_return_all_conditional_losses
&o"call_and_return_conditional_losses"
_generic_user_object
%:#>2output_layer/kernel
:2output_layer/bias
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
?
	variables
regularization_losses
@metrics

Alayers
Bnon_trainable_variables
Clayer_regularization_losses
Dlayer_metrics
trainable_variables
r__call__
*q&call_and_return_all_conditional_losses
&q"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
0:.>2rnn_1/simple_rnn_cell_8/kernel
::8>>2(rnn_1/simple_rnn_cell_8/recurrent_kernel
*:(>2rnn_1/simple_rnn_cell_8/bias
0:.>>2rnn_2/simple_rnn_cell_9/kernel
::8>>2(rnn_2/simple_rnn_cell_9/recurrent_kernel
*:(>2rnn_2/simple_rnn_cell_9/bias
.
E0
F1"
trackable_list_wrapper
5
0
1
2"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
5
!0
"1
#2"
trackable_list_wrapper
 "
trackable_list_wrapper
5
!0
"1
#2"
trackable_list_wrapper
?
,	variables
-regularization_losses
Gmetrics

Hlayers
Inon_trainable_variables
Jlayer_regularization_losses
Klayer_metrics
.trainable_variables
u__call__
*t&call_and_return_all_conditional_losses
&t"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'

0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
5
$0
%1
&2"
trackable_list_wrapper
 "
trackable_list_wrapper
5
$0
%1
&2"
trackable_list_wrapper
?
6	variables
7regularization_losses
Lmetrics

Mlayers
Nnon_trainable_variables
Olayer_regularization_losses
Player_metrics
8trainable_variables
w__call__
*v&call_and_return_all_conditional_losses
&v"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
N
	Qtotal
	Rcount
S	variables
T	keras_api"
_tf_keras_metric
^
	Utotal
	Vcount
W
_fn_kwargs
X	variables
Y	keras_api"
_tf_keras_metric
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
:  (2total
:  (2count
.
Q0
R1"
trackable_list_wrapper
-
S	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
.
U0
V1"
trackable_list_wrapper
-
X	variables"
_generic_user_object
*:(>2Adam/output_layer/kernel/m
$:"2Adam/output_layer/bias/m
5:3>2%Adam/rnn_1/simple_rnn_cell_8/kernel/m
?:=>>2/Adam/rnn_1/simple_rnn_cell_8/recurrent_kernel/m
/:->2#Adam/rnn_1/simple_rnn_cell_8/bias/m
5:3>>2%Adam/rnn_2/simple_rnn_cell_9/kernel/m
?:=>>2/Adam/rnn_2/simple_rnn_cell_9/recurrent_kernel/m
/:->2#Adam/rnn_2/simple_rnn_cell_9/bias/m
*:(>2Adam/output_layer/kernel/v
$:"2Adam/output_layer/bias/v
5:3>2%Adam/rnn_1/simple_rnn_cell_8/kernel/v
?:=>>2/Adam/rnn_1/simple_rnn_cell_8/recurrent_kernel/v
/:->2#Adam/rnn_1/simple_rnn_cell_8/bias/v
5:3>>2%Adam/rnn_2/simple_rnn_cell_9/kernel/v
?:=>>2/Adam/rnn_2/simple_rnn_cell_9/recurrent_kernel/v
/:->2#Adam/rnn_2/simple_rnn_cell_9/bias/v
?2?
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_21989
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_22263
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_21695
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_21718?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?B?
 __inference__wrapped_model_19863input_layer"?
???
FullArgSpec
args? 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
1__inference_bitcoin_basic_RNN_layer_call_fn_21260
1__inference_bitcoin_basic_RNN_layer_call_fn_22284
1__inference_bitcoin_basic_RNN_layer_call_fn_22305
1__inference_bitcoin_basic_RNN_layer_call_fn_21672?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
@__inference_rnn_1_layer_call_and_return_conditional_losses_22425
@__inference_rnn_1_layer_call_and_return_conditional_losses_22561
@__inference_rnn_1_layer_call_and_return_conditional_losses_22681
@__inference_rnn_1_layer_call_and_return_conditional_losses_22817?
???
FullArgSpecB
args:?7
jself
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults?

 
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
%__inference_rnn_1_layer_call_fn_22828
%__inference_rnn_1_layer_call_fn_22839
%__inference_rnn_1_layer_call_fn_22850
%__inference_rnn_1_layer_call_fn_22861?
???
FullArgSpecB
args:?7
jself
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults?

 
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
@__inference_rnn_2_layer_call_and_return_conditional_losses_22981
@__inference_rnn_2_layer_call_and_return_conditional_losses_23117
@__inference_rnn_2_layer_call_and_return_conditional_losses_23237
@__inference_rnn_2_layer_call_and_return_conditional_losses_23373?
???
FullArgSpecB
args:?7
jself
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults?

 
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
%__inference_rnn_2_layer_call_fn_23384
%__inference_rnn_2_layer_call_fn_23395
%__inference_rnn_2_layer_call_fn_23406
%__inference_rnn_2_layer_call_fn_23417?
???
FullArgSpecB
args:?7
jself
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults?

 
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
G__inference_output_layer_layer_call_and_return_conditional_losses_23427?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
,__inference_output_layer_layer_call_fn_23436?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?B?
#__inference_signature_wrapper_21747input_layer"?
???
FullArgSpec
args? 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
L__inference_simple_rnn_cell_8_layer_call_and_return_conditional_losses_23457
L__inference_simple_rnn_cell_8_layer_call_and_return_conditional_losses_23486?
???
FullArgSpec3
args+?(
jself
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
1__inference_simple_rnn_cell_8_layer_call_fn_23500
1__inference_simple_rnn_cell_8_layer_call_fn_23514?
???
FullArgSpec3
args+?(
jself
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
L__inference_simple_rnn_cell_9_layer_call_and_return_conditional_losses_23535
L__inference_simple_rnn_cell_9_layer_call_and_return_conditional_losses_23564?
???
FullArgSpec3
args+?(
jself
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
1__inference_simple_rnn_cell_9_layer_call_fn_23578
1__inference_simple_rnn_cell_9_layer_call_fn_23592?
???
FullArgSpec3
args+?(
jself
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 ?
 __inference__wrapped_model_19863?!#"$&%8?5
.?+
)?&
input_layer?????????
? ";?8
6
output_layer&?#
output_layer??????????
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_21695s!#"$&%@?=
6?3
)?&
input_layer?????????
p 

 
? "%?"
?
0?????????
? ?
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_21718s!#"$&%@?=
6?3
)?&
input_layer?????????
p

 
? "%?"
?
0?????????
? ?
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_21989n!#"$&%;?8
1?.
$?!
inputs?????????
p 

 
? "%?"
?
0?????????
? ?
L__inference_bitcoin_basic_RNN_layer_call_and_return_conditional_losses_22263n!#"$&%;?8
1?.
$?!
inputs?????????
p

 
? "%?"
?
0?????????
? ?
1__inference_bitcoin_basic_RNN_layer_call_fn_21260f!#"$&%@?=
6?3
)?&
input_layer?????????
p 

 
? "???????????
1__inference_bitcoin_basic_RNN_layer_call_fn_21672f!#"$&%@?=
6?3
)?&
input_layer?????????
p

 
? "???????????
1__inference_bitcoin_basic_RNN_layer_call_fn_22284a!#"$&%;?8
1?.
$?!
inputs?????????
p 

 
? "???????????
1__inference_bitcoin_basic_RNN_layer_call_fn_22305a!#"$&%;?8
1?.
$?!
inputs?????????
p

 
? "???????????
G__inference_output_layer_layer_call_and_return_conditional_losses_23427\/?,
%?"
 ?
inputs?????????>
? "%?"
?
0?????????
? 
,__inference_output_layer_layer_call_fn_23436O/?,
%?"
 ?
inputs?????????>
? "???????????
@__inference_rnn_1_layer_call_and_return_conditional_losses_22425?!#"O?L
E?B
4?1
/?,
inputs/0??????????????????

 
p 

 
? "2?/
(?%
0??????????????????>
? ?
@__inference_rnn_1_layer_call_and_return_conditional_losses_22561?!#"O?L
E?B
4?1
/?,
inputs/0??????????????????

 
p

 
? "2?/
(?%
0??????????????????>
? ?
@__inference_rnn_1_layer_call_and_return_conditional_losses_22681q!#"??<
5?2
$?!
inputs?????????

 
p 

 
? ")?&
?
0?????????>
? ?
@__inference_rnn_1_layer_call_and_return_conditional_losses_22817q!#"??<
5?2
$?!
inputs?????????

 
p

 
? ")?&
?
0?????????>
? ?
%__inference_rnn_1_layer_call_fn_22828}!#"O?L
E?B
4?1
/?,
inputs/0??????????????????

 
p 

 
? "%?"??????????????????>?
%__inference_rnn_1_layer_call_fn_22839}!#"O?L
E?B
4?1
/?,
inputs/0??????????????????

 
p

 
? "%?"??????????????????>?
%__inference_rnn_1_layer_call_fn_22850d!#"??<
5?2
$?!
inputs?????????

 
p 

 
? "??????????>?
%__inference_rnn_1_layer_call_fn_22861d!#"??<
5?2
$?!
inputs?????????

 
p

 
? "??????????>?
@__inference_rnn_2_layer_call_and_return_conditional_losses_22981}$&%O?L
E?B
4?1
/?,
inputs/0??????????????????>

 
p 

 
? "%?"
?
0?????????>
? ?
@__inference_rnn_2_layer_call_and_return_conditional_losses_23117}$&%O?L
E?B
4?1
/?,
inputs/0??????????????????>

 
p

 
? "%?"
?
0?????????>
? ?
@__inference_rnn_2_layer_call_and_return_conditional_losses_23237m$&%??<
5?2
$?!
inputs?????????>

 
p 

 
? "%?"
?
0?????????>
? ?
@__inference_rnn_2_layer_call_and_return_conditional_losses_23373m$&%??<
5?2
$?!
inputs?????????>

 
p

 
? "%?"
?
0?????????>
? ?
%__inference_rnn_2_layer_call_fn_23384p$&%O?L
E?B
4?1
/?,
inputs/0??????????????????>

 
p 

 
? "??????????>?
%__inference_rnn_2_layer_call_fn_23395p$&%O?L
E?B
4?1
/?,
inputs/0??????????????????>

 
p

 
? "??????????>?
%__inference_rnn_2_layer_call_fn_23406`$&%??<
5?2
$?!
inputs?????????>

 
p 

 
? "??????????>?
%__inference_rnn_2_layer_call_fn_23417`$&%??<
5?2
$?!
inputs?????????>

 
p

 
? "??????????>?
#__inference_signature_wrapper_21747?!#"$&%G?D
? 
=?:
8
input_layer)?&
input_layer?????????";?8
6
output_layer&?#
output_layer??????????
L__inference_simple_rnn_cell_8_layer_call_and_return_conditional_losses_23457?!#"\?Y
R?O
 ?
inputs?????????
'?$
"?
states/0?????????>
p 
? "R?O
H?E
?
0/0?????????>
$?!
?
0/1/0?????????>
? ?
L__inference_simple_rnn_cell_8_layer_call_and_return_conditional_losses_23486?!#"\?Y
R?O
 ?
inputs?????????
'?$
"?
states/0?????????>
p
? "R?O
H?E
?
0/0?????????>
$?!
?
0/1/0?????????>
? ?
1__inference_simple_rnn_cell_8_layer_call_fn_23500?!#"\?Y
R?O
 ?
inputs?????????
'?$
"?
states/0?????????>
p 
? "D?A
?
0?????????>
"?
?
1/0?????????>?
1__inference_simple_rnn_cell_8_layer_call_fn_23514?!#"\?Y
R?O
 ?
inputs?????????
'?$
"?
states/0?????????>
p
? "D?A
?
0?????????>
"?
?
1/0?????????>?
L__inference_simple_rnn_cell_9_layer_call_and_return_conditional_losses_23535?$&%\?Y
R?O
 ?
inputs?????????>
'?$
"?
states/0?????????>
p 
? "R?O
H?E
?
0/0?????????>
$?!
?
0/1/0?????????>
? ?
L__inference_simple_rnn_cell_9_layer_call_and_return_conditional_losses_23564?$&%\?Y
R?O
 ?
inputs?????????>
'?$
"?
states/0?????????>
p
? "R?O
H?E
?
0/0?????????>
$?!
?
0/1/0?????????>
? ?
1__inference_simple_rnn_cell_9_layer_call_fn_23578?$&%\?Y
R?O
 ?
inputs?????????>
'?$
"?
states/0?????????>
p 
? "D?A
?
0?????????>
"?
?
1/0?????????>?
1__inference_simple_rnn_cell_9_layer_call_fn_23592?$&%\?Y
R?O
 ?
inputs?????????>
'?$
"?
states/0?????????>
p
? "D?A
?
0?????????>
"?
?
1/0?????????>