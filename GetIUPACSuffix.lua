local module = {}

local other = {
	{"","Un","Do","Tri","Tetra","Penta","Hexa","Hepta","Octa","Enna"},
	{"","Hen","Do","Tri","Tetra","Penta","Hexa","Hepta","Octa","Enna"},
}

local suffixes = {
	{
		"","Mono","Di","Tri","Tetra","Penta","Hexa","Hepta","Octa","Enna"
	},
	{
		"","Deca","Icosa","Triaconta","Tetraconta","Pentaconta","Hexaconta","Heptaconta","Octaconta","Ennaconta"
	},
	{
		"","Hecta","Dicta","Tricta","Tetracta","Pentacta","Hexacta","Heptacta","Octacta","Ennacta"
	},
	{
		"","Kilia","Dilia","Trilia","Tetralia","Pentalia","Hexalia","Heptalia","Octalia","Ennalia"
	},
}

function module.getSuffix(number)
	local suffix = ""
	
	for layer, data in suffixes do
		local nth = math.floor(number/(10^(layer-1)))%10
		suffix = suffix .. (
			if layer == 1 then
				(if number > 20 then other[2][nth+1] else (if number > 10 then other[1][nth+1] else data[nth+1]))
				else
				data[nth+1]
		)
	end
	
	return string.lower(suffix):gsub("^%l", string.upper)
end

return module
