#version 330

// Soft alpha test: discard fully empty texels, blend everything else.
// U7 xform/translucent colors use mid-range alpha (often ~0.5); the old
// hard cutoff at 0.5 punched holes in stained glass, blood, etc.

in vec2 fragTexCoord;
in vec4 fragColor;

uniform sampler2D texture0;
uniform vec4 colDiffuse;

out vec4 finalColor;

void main()
{
	vec4 texelColor = texture(texture0, fragTexCoord);
	// True transparent / unused (index 255 or empty bake)
	if (texelColor.a < 0.01)
		discard;
	finalColor = texelColor * fragColor * colDiffuse;
}
