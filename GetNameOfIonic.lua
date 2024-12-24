local iupac = require(game.ReplicatedStorage.GetIUPACSuffix)

local module = {}
local periodicTable = {
	{"H", "Hydrogen"},
	{"He", "Helium"},
	{"Li", "Lithium"},
	{"Be", "Beryllium"},
	{"B", "Boron"},
	{"C", "Carbon"},
	{"N", "Nitrogen"},
	{"O", "Oxygen"},
	{"F", "Fluorine"},
	{"Ne", "Neon"},
	{"Na", "Sodium"},
	{"Mg", "Magnesium"},
	{"Al", "Aluminium"},
	{"Si", "Silicon"},
	{"P", "Phosphorus"},
	{"S", "Sulfur"},
	{"Cl", "Chlorine"},
	{"Ar", "Argon"},
	{"K", "Potassium"},
	{"Ca", "Calcium"},
	{"Sc", "Scandium"},
	{"Ti", "Titanium"},
	{"V", "Vanadium"},
	{"Cr", "Chromium"},
	{"Mn", "Manganese"},
	{"Fe", "Iron"},
	{"Co", "Cobalt"},
	{"Ni", "Nickel"},
	{"Cu", "Copper"},
	{"Zn", "Zinc"},
	{"Ga", "Gallium"},
	{"Ge", "Germanium"},
	{"As", "Arsenic"},
	{"Se", "Selenium"},
	{"Br", "Bromine"},
	{"Kr", "Krypton"},
	{"Rb", "Rubidium"},
	{"Sr", "Strontium"},
	{"Y", "Yttrium"},
	{"Zr", "Zirconium"},
	{"Nb", "Niobium"},
	{"Mo", "Molybdenum"},
	{"Tc", "Technetium"},
	{"Ru", "Ruthenium"},
	{"Rh", "Rhodium"},
	{"Pd", "Palladium"},
	{"Ag", "Silver"},
	{"Cd", "Cadmium"},
	{"In", "Indium"},
	{"Sn", "Tin"},
	{"Sb", "Antimony"},
	{"Te", "Tellurium"},
	{"I", "Iodine"},
	{"Xe", "Xenon"},
	{"Cs", "Cesium"},
	{"Ba", "Barium"},
	{"La", "Lanthanum"},
	{"Ce", "Cerium"},
	{"Pr", "Praseodymium"},
	{"Nd", "Neodymium"},
	{"Pm", "Promethium"},
	{"Sm", "Samarium"},
	{"Eu", "Europium"},
	{"Gd", "Gadolinium"},
	{"Tb", "Terbium"},
	{"Dy", "Dysprosium"},
	{"Ho", "Holmium"},
	{"Er", "Erbium"},
	{"Tm", "Thulium"},
	{"Yb", "Ytterbium"},
	{"Lu", "Lutetium"},
	{"Hf", "Hafnium"},
	{"Ta", "Tantalum"},
	{"W", "Tungsten"},
	{"Re", "Rhenium"},
	{"Os", "Osmium"},
	{"Ir", "Iridium"},
	{"Pt", "Platinum"},
	{"Au", "Gold"},
	{"Hg", "Mercury"},
	{"Tl", "Thallium"},
	{"Pb", "Lead"},
	{"Bi", "Bismuth"},
	{"Po", "Polonium"},
	{"At", "Astatine"},
	{"Rn", "Radon"},
	{"Fr", "Francium"},
	{"Ra", "Radium"},
	{"Ac", "Actinium"},
	{"Th", "Thorium"},
	{"Pa", "Protactinium"},
	{"U", "Uranium"},
	{"Np", "Neptunium"},
	{"Pu", "Plutonium"},
	{"Am", "Americium"},
	{"Cm", "Curium"},
	{"Bk", "Berkelium"},
	{"Cf", "Californium"},
	{"Es", "Einsteinium"},
	{"Fm", "Fermium"},
	{"Md", "Mendelevium"},
	{"No", "Nobelium"},
	{"Lr", "Lawrencium"},
	{"Rf", "Rutherfordium"},
	{"Db", "Dubnium"},
	{"Sg", "Seaborgium"},
	{"Bh", "Bohrium"},
	{"Hs", "Hassium"},
	{"Mt", "Meitnerium"},
	{"Ds", "Darmstadtium"},
	{"Rg", "Roentgenium"},
	{"Cn", "Copernicium"},
	{"Nh", "Nihonium"},
	{"Fl", "Flerovium"},
	{"Mc", "Moscovium"},
	{"Lv", "Livermorium"},
	{"Ts", "Tennessine"},
	{"Og", "Oganesson"}
}
local vowels = {"a","e","i","o","u","y"}

function GetElementNameFromSymbol(symbol)
	for _,i in periodicTable do
		if i[1] == symbol then
			return i[2]
		end
	end
end

function NameElement(e,f)
	local n = tostring(e[1])
	local q = e[2]
	
	local return_ = ""
	
	for index,letter in n:split("") do
		if not f then
			if index > 0 then
				if table.find(vowels,letter) then
					return_ ..= "ide"
					break
				else
					return_ ..= letter
				end
			end
		else
			return_ ..= letter
		end
	end
	
	return return_
end

function simplify(t)
	return string.lower(t):gsub("^%l", string.upper)
end

function module.GetNameOfIonicElement(e1, e2)
	local eNames = {
		{GetElementNameFromSymbol(e1[1]),e1[2]},
		{GetElementNameFromSymbol(e2[1]),e2[2]},
	}
	
	return (
		simplify(
			(if eNames[1][2] > 1 then iupac.getSuffix(eNames[1][2]) else "") ..
				NameElement(eNames[1],true)
		) .. " " 
		.. simplify(
				iupac.getSuffix(eNames[2][2]) ..
				NameElement(eNames[2])
			)
	)
end

return module
