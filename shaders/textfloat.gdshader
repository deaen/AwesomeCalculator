shader_type canvas_item;

uniform float height = 5.0;
void vertex() {
	VERTEX.y += height * sin(TIME);
}
