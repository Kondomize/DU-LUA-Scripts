unit.hide()
elementsIds = core.getElementIdList()
elements = {}

function newElement(_id)
    local element = 
    {
        id = _id;
        name = core.getElementNameById(_id);
        mass = core.getElementMassById(_id);
        _type = core.getElementTypeById(_id);
    }
    return element
end

for i = 1, #elementsIds do
    --if string.match(core.getElementTypeById(elementsIds[i]), "ontainer") and string.match(core.getElementNameById(elementsIds[i]),"Pure") or string.match(core.getElementNameById(elementsIds[i]),"Ore") then
        table.insert(elements, newElement(elementsIds[i]))
    --end
end
    
for i = 1, #elements do
    system.print(elements[i].name .. [[: ]] .. elements[i].mass .. [[: ]] .. elements[i]._type)
end