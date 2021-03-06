
/*
Copyright (c) 2019 The Khronos Group Inc.
Use of this source code is governed by an MIT-style license that can be
found in the LICENSE.txt file.
*/


attribute vec4 gtf_Vertex;
uniform mat4 gtf_ModelViewProjectionMatrix;
varying vec4 color;

// Function declarations.
bvec4 function(inout bvec4 par[10]);
bool is_all(const in bvec4 par, const in bool value);
bool is_all(const in bvec4 array[10], const in bvec4 value);
void set_all(out bvec4 array[10], const in bvec4 value);

void main (void)
{
	bvec4 par[10];
	bvec4 ret = bvec4(false, false, false, false);

	float gray = 0.0;

	// Initialize the entire array to true.
	set_all(par, bvec4(true, true, true, true));

	ret = function(par);

	// The parameter should be changed by the function and the function should return true.
	if(is_all(par, bvec4(false, false, false, false)) && is_all(ret, true))
	{
		gray = 1.0;
	}

	color = vec4(gray, gray, gray, 1.0);
	gl_Position = gtf_ModelViewProjectionMatrix * gtf_Vertex;
}

// Function definitions.
bvec4 function(inout bvec4 par[10])
{
	// Return the value of the array.
	if(is_all(par, bvec4(true, true, true, true)))
	{
		// Test parameter qualifier (default is "in").
		set_all(par, bvec4(false, false, false, false));

		return bvec4(true, true, true, true);
	}
	else
		return bvec4(false, false, false, false);
}

bool is_all(const in bvec4 par, const in bool value)
{
	bool ret = true;

	if(par[0] != value)
		ret = false;
	if(par[1] != value)
		ret = false;
	if(par[2] != value)
		ret = false;
	if(par[3] != value)
		ret = false;

	return ret;
}

bool is_all(const in bvec4 array[10], const in bvec4 value)
{
	bool ret = true;

	if(array[0] != value)
		ret = false;
	if(array[1] != value)
		ret = false;
	if(array[2] != value)
		ret = false;
	if(array[3] != value)
		ret = false;
	if(array[4] != value)
		ret = false;
	if(array[5] != value)
		ret = false;
	if(array[6] != value)
		ret = false;
	if(array[7] != value)
		ret = false;
	if(array[8] != value)
		ret = false;
	if(array[9] != value)
		ret = false;

	return ret;
}

void set_all(out bvec4 array[10], const in bvec4 value)
{
	array[0] = value;
	array[1] = value;
	array[2] = value;
	array[3] = value;
	array[4] = value;
	array[5] = value;
	array[6] = value;
	array[7] = value;
	array[8] = value;
	array[9] = value;
}
