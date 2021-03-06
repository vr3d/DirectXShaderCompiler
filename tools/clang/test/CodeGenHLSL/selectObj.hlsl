// RUN: %dxc -E main -T cs_6_0 %s | FileCheck %s

// CHECK: buffer load/store only works on Raw/Typed/StructuredBuffer
// CHECK: buffer load/store only works on Raw/Typed/StructuredBuffer

RWStructuredBuffer<float2x2> oA;
RWStructuredBuffer<float2x2> oB;

StructuredBuffer<float2x2> iA;
StructuredBuffer<float2x2> iB;

uint s;

[numthreads(8,8,1)]
void main( uint2 tid : SV_DispatchThreadID, uint2 gid : SV_GroupID, uint2 gtid : SV_GroupThreadID, uint gidx : SV_GroupIndex )
{

RWStructuredBuffer<float2x2> o = oA;
StructuredBuffer<float2x2> i = iA;

if (s > 8) {
    o = oB;
    i = iB;
}

o[gid.x] = i[gid.x];
    
}
