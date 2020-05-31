-- removes the sources from md

function Div(el)
    if (el.t == "Div" and el.classes[1] == "rnc") then
	return {}
	end
end