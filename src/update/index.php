<?php

define('VERSION', '1.4.7');

$patch_notes = [
	"Updated Strafkatalog to v0.1.5",
	"Updated the /att command to give 10 wanteds according to the new Strafkatalog"
];

$todo = [
	"Translate to German (Coming later, Noxus and Seba offered help - Thanks!)",
	"Add support for arguments for custom commands",
	"Add /vk ID command for automatic traffic stops"
];

$data = [
	'version' => VERSION,
	'patch_notes' => $patch_notes,
	'todo' => $todo
];

header('Content-Type: application/json');
echo json_encode($data);

exit;