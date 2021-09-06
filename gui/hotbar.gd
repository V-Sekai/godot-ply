tool
extends VBoxContainer

const SelectionMode = preload("../utils/selection_mode.gd")

signal selection_mode_changed(mode)

onready var selection_mesh = $"Selection/SelectionModes/SelectMesh"
onready var selection_face = $"Selection/SelectionModes/SelectFace"
onready var selection_edge = $"Selection/SelectionModes/SelectEdge"
onready var selection_vertex = $"Selection/SelectionModes/SelectVertex"
onready var generate_cube = $"Generators/Generators/GenerateCube"
onready var generate_plane = $"Generators/Generators/GeneratePlane"
onready var generate_sphere = $"Generators/Generators/GenerateSphere"
onready var generate_cylinder = $"Generators/Generators/GenerateCylinder"

onready var face_extrude = $"FaceContainer/Tools/Extrude"
onready var face_inset = $"FaceContainer/Tools/Inset"

onready var edge_subdivide = $"EdgeContainer/Tools/Subdivide"
onready var edge_extrude = $"EdgeContainer/Tools/Extrude"
onready var edge_loop = $"EdgeContainer/Tools/EdgeLoop"

onready var vertex_weld = $"VertexContainer/Tools/Weld"
onready var vertex_split = $"VertexContainer/Tools/Split"

func _ready():
	selection_mesh.connect("toggled", self, "_update_selection_mode", [SelectionMode.MESH])
	selection_face.connect("toggled", self, "_update_selection_mode", [SelectionMode.FACE])
	selection_edge.connect("toggled", self, "_update_selection_mode", [SelectionMode.EDGE])
	selection_vertex.connect("toggled", self, "_update_selection_mode", [SelectionMode.VERTEX])

func _update_selection_mode(selected, mode):
	if selected:
		emit_signal("selection_mode_changed", mode)