unit.hide()
if displayT1 then displayT1.activate() end
if displayT2 then displayT2.activate() end
if displayT3 then displayT3.activate() end
if displayT4 then displayT4.activate() end
if displayT5 then displayT5.activate() end
function displayOff()
    if displayT1 then displayT1.clear() end
    if displayT2 then displayT2.clear() end
    if displayT3 then displayT3.clear() end
    if displayT4 then displayT4.clear() end
    if displayT5 then displayT5.clear() end
end
function generateHtml()
    elementsIds = core.getElementIdList()
    containers = {}
    oreData = {}
    pureData = {}
    function newContainer(_id)
        local container =
        {
            id = _id;
            name = core.getElementNameById(_id);
            mass = core.getElementMassById(_id);
        }
        return container
    end
    for i = 1, #elementsIds do
            for i = 1, #elementsIds do
        		if core.getElementTypeById(elementsIds[i]) == "container" or core.getElementTypeById(elementsIds[i]) == "Container Hub" and string.match(core.getElementNameById(elementsIds[i]),"Ore") or string.match(core.getElementNameById(elementsIds[i]),"Pure") then
            		table.insert(containers, newContainer(elementsIds[i]))
        		end
            end
    end
    for i = 1, #containers do
        table.insert(oreData, {oreContainer = containers[i].name, oreContainerMass = containers[i].mass})
        table.insert(pureData, {pureContainer = containers[i].name, pureContainerMass = containers[i].mass})
    end
    function round(number,decimals)
        local power = 10^decimals
        return math.floor((number/1000) * power) / power
    end
    function oreStatus(percent)
        if percent <= 0 then return "<th style=\"color: red;\">EMPTY</th>"
        elseif percent > 0 and percent <=25 then return "<th style=\"color: orange;\">CRITICAL</th>"
        elseif percent > 25 and percent <= 50 then return "<th style=\"color: yellow;\">LOW</th>"
        elseif percent > 50 and percent <= 99 then return "<th style=\"color: green;\">GOOD</th>"
        else return "<th style=\"color: green;\">FULL</th>"
        end
    end
    function pureStatus(percent)
        if percent == 0 then return "<th style=\"color: red;\">OUT</th>"
        elseif percent == nil then return "<th style=\"color: red;\">OUT</th>"
        elseif percent <= 10 then return "<th style=\"color: orange;\">CRITICAL</th>"
        elseif percent > 10 and percent < 25 then return "<th style=\"color: yellow;\">LOW</th>"
        else return "<th style=\"color: green;\">GOOD</th>"
        end
    end
    function hoStatus(percent)
        if percent <= 10 then return "<th style=\"color: orange;\">LOW</th>"
        elseif percent > 10 and percent < 70 then return "<th style=\"color: green;\">GOOD</th>"
        else return "<th style=\"color: red;\">PLEASE EMPTY</th>"
        end
    end
--T1 Stuff
    -- Bauxite
    local maxBauxiteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightBauxiteOre = 1.28
    local BauxiteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer,"Bauxite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massBauxiteOre = round(math.ceil((OreContainerMass - BauxiteOreContainerMass) / weightBauxiteOre),1)
            percentBauxiteOre = math.ceil(((math.ceil((massBauxiteOre*1000) - 0.5)/maxBauxiteOre)*100))
            statusBauxiteOre = oreStatus(percentBauxiteOre)
        end
    end
    if massBauxiteOre == nil then
        massBauxiteOre = 0
        percentBauxite = 0
        statusBauxiteOre = 0
    end
    -- CoalOre
    local maxCoalOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightCoalOre = 1.35
    local CoalOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer,"Coal") then
            local OreContainerMass = oreData[k].oreContainerMass
            massCoalOre = round(math.ceil((OreContainerMass - CoalOreContainerMass) / weightCoalOre),1)
            percentCoalOre = math.ceil(((math.ceil((massCoalOre*1000) - 0.5)/maxCoalOre)*100))
            statusCoalOre = oreStatus(percentCoalOre)
        end
    end
    if massCoalOre == nil then
        massCoalOre = 0
        percentCoalOre = 0
        statusCoalOre = 0
    end
    -- HematiteOre
    local maxHematiteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightHematiteOre = 5.04
    local HematiteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer,"Hematite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massHematiteOre = round(math.ceil((OreContainerMass - HematiteOreContainerMass) / weightHematiteOre),1)
            percentHematiteOre = math.ceil(((math.ceil((massHematiteOre*1000) - 0.5)/maxHematiteOre)*100))
            statusHematiteOre = oreStatus(percentHematiteOre)
        end
    end
    if massHematiteOre == nil then
        massHematiteOre = 0
        percentHematiteOre = 0
        statusHematiteOre = 0
    end
    -- QuartzOre
    local maxQuartzOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightQuartzOre = 2.65
    local QuartzOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Quartz") then
            local OreContainerMass = oreData[k].oreContainerMass
            massQuartzOre = round(math.ceil((OreContainerMass - QuartzOreContainerMass) / weightQuartzOre),1)
            percentQuartzOre = math.ceil(((math.ceil((massQuartzOre*1000) - 0.5)/maxQuartzOre)*100))
            statusQuartzOre = oreStatus(percentQuartzOre)
        end
    end
    if massQuartzOre == nil then
        massQuartzOre= 0
        percentQuartzOre = 0
        statusQuartzOre = 0
    end
--T2 Stuff
    -- ChromiteOre
    local maxChromiteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightChromiteOre = 4.54
    local ChromiteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Chromite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massChromiteOre = round(math.ceil((OreContainerMass - ChromiteOreContainerMass) / weightChromiteOre),1)
            percentChromiteOre = math.ceil(((math.ceil((massChromiteOre*1000) - 0.5)/maxChromiteOre)*100))
            statusChromiteOre = oreStatus(percentChromiteOre)
        end
    end
    if massChromiteOre == nil then
        massChromiteOre = 0
        percentChromiteOre = 0
        statusChromiteOre = 0
    end
    -- MalachiteOre
    local maxMalachiteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightMalachiteOre = 4.00
    local MalachiteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Malachite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massMalachiteOre = round(math.ceil((OreContainerMass - MalachiteOreContainerMass) / weightMalachiteOre),1)
            percentMalachiteOre = math.ceil(((math.ceil((massMalachiteOre*1000) - 0.5)/maxMalachiteOre)*100))
            statusMalachiteOre = oreStatus(percentMalachiteOre)
        end
    end
    if massMalachiteOre == nil then
        massMalachiteOre = 0
        percentMalachiteOre = 0
        statusMalachiteOre = 0
    end
    -- LimestoneOre
    local maxLimestoneOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightLimestoneOre = 2.71
    local LimestoneOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Limestone") then
            local OreContainerMass = oreData[k].oreContainerMass
            massLimestoneOre = round(math.ceil((OreContainerMass - LimestoneOreContainerMass) / weightLimestoneOre),1)
            percentLimestoneOre = math.ceil(((math.ceil((massLimestoneOre*1000) - 0.5)/maxLimestoneOre)*100))
            statusLimestoneOre = oreStatus(percentLimestoneOre)
        end
    end
    if massLimestoneOre == nil then
        massLimestoneOre = 0
        percentLimestoneOre = 0
        statusLimestoneOre = 0
    end
    -- NatronOre
    local maxNatronOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightNatronOre = 1.55
    local NatronOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Natron") then
            local OreContainerMass = oreData[k].oreContainerMass
            massNatronOre = round(math.ceil((OreContainerMass - NatronOreContainerMass) / weightNatronOre),1)
            percentNatronOre = math.ceil(((math.ceil((massNatronOre*1000) - 0.5)/maxNatronOre)*100))
            statusNatronOre = oreStatus(percentNatronOre)
        end
    end
    if massNatronOre == nil then
        massNatronOre = 0
        percentNatronOre = 0
        statusNatronOre = 0
    end
--T3 Stuff
    -- GarnieriteOre
    local maxGarnieriteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightGarnieriteOre = 2.60
    local GarnieriteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Garnierite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massGarnieriteOre = round(math.ceil((OreContainerMass - GarnieriteOreContainerMass) / weightGarnieriteOre),1)
            percentGarnieriteOre = math.ceil(((math.ceil((massGarnieriteOre*1000) - 0.5)/maxGarnieriteOre)*100))
            statusGarnieriteOre = oreStatus(percentGarnieriteOre)
        end
    end
    if massGarnieriteOre == nil then
        massGarnieriteOre = 0
        percentGarnieriteOre = 0
        statusGarnieriteOre = 0
    end
    -- PetaliteOre
    local maxPetaliteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPetaliteOre = 2.41
    local PetaliteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Petalite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massPetaliteOre = round(math.ceil((OreContainerMass - PetaliteOreContainerMass) / weightPetaliteOre),1)
            percentPetaliteOre = math.ceil(((math.ceil((massPetaliteOre*1000) - 0.5)/maxPetaliteOre)*100))
            statusPetaliteOre = oreStatus(percentPetaliteOre)
        end
    end
    if massPetaliteOre == nil then
        massPetaliteOre = 0
        percentPetaliteOre = 0
        statusPetaliteOre = 0
    end
    -- AcanthiteOre
    local maxAcanthiteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightAcanthiteOre = 7.20
    local AcanthiteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Acanthite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massAcanthiteOre = round(math.ceil((OreContainerMass - AcanthiteOreContainerMass) / weightAcanthiteOre),1)
            percentAcanthiteOre = math.ceil(((math.ceil((massAcanthiteOre*1000) - 0.5)/maxAcanthiteOre)*100))
            statusAcanthiteOre = oreStatus(percentAcanthiteOre)
        end
    end
    if massAcanthiteOre == nil then
        massAcanthiteOre = 0
        percentAcanthiteOre = 0
        statusAcanthiteOre = 0
    end
    -- PyriteOre
    local maxPyriteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPyriteOre = 5.01
    local PyriteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Pyrite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massPyriteOre = round(math.ceil((OreContainerMass - PyriteOreContainerMass) / weightPyriteOre),1)
            percentPyriteOre = math.ceil(((math.ceil((massPyriteOre*1000) - 0.5)/maxPyriteOre)*100))
            statusPyriteOre = oreStatus(percentPyriteOre)
        end
    end
    if massPyriteOre == nil then
        massPyriteOre = 0
        percentPyriteOre = 0
        statusPyriteOre = 0
    end
--T4 Stuff
    -- CobaltiteOre
    local maxCobaltiteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightCobaltiteOre = 6.33
    local CobaltiteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Cobaltite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massCobaltiteOre = round(math.ceil((OreContainerMass - CobaltiteOreContainerMass) / weightCobaltiteOre),1)
            percentCobaltiteOre = math.ceil(((math.ceil((massCobaltiteOre*1000) - 0.5)/maxCobaltiteOre)*100))
            statusCobaltiteOre = oreStatus(percentCobaltiteOre)
        end
    end
    if massCobaltiteOre == nil then
        massCobaltiteOre = 0
        percentCobaltiteOre = 0
        statusCobaltiteOre = 0
    end
    -- CryoliteOre
    local maxCryoliteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightCryoliteOre = 2.95
    local CryoliteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Cryolite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massCryoliteOre = round(math.ceil((OreContainerMass - CryoliteOreContainerMass) / weightCryoliteOre),1)
            percentCryoliteOre = math.ceil(((math.ceil((massCryoliteOre*1000) - 0.5)/maxCryoliteOre)*100))
            statusCryoliteOre = oreStatus(percentCryoliteOre)
        end
    end
    if massCryoliteOre == nil then
        massCryoliteOre = 0
        percentCryoliteOre = 0
        statusCryoliteOre = 0
    end
    -- GoldOre
    local maxGoldOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightGoldOre = 19.30
    local GoldOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Gold") then
            local OreContainerMass = oreData[k].oreContainerMass
            massGoldOre = round(math.ceil((OreContainerMass - GoldOreContainerMass) / weightGoldOre),1)
            percentGoldOre = math.ceil(((math.ceil((massGoldOre*1000) - 0.5)/maxGoldOre)*100))
            statusGoldOre = oreStatus(percentGoldOre)
        end
    end
    if massGoldOre == nil then
        massGoldOre = 0
        percentGoldOre = 0
        statusGoldOre = 0
    end
    -- KolbeckiteOre
    local maxKolbeckiteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightKolbeckiteOre = 2.37
    local KolbeckiteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Kolbeckite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massKolbeckiteOre = round(math.ceil((OreContainerMass - KolbeckiteOreContainerMass) / weightKolbeckiteOre),1)
            percentKolbeckiteOre = math.ceil(((math.ceil((massKolbeckiteOre*1000) - 0.5)/maxKolbeckiteOre)*100))
            statusKolbeckiteOre = oreStatus(percentKolbeckiteOre)
        end
    end
    if massKolbeckiteOre == nil then
        massKolbeckiteOre = 0
        percentKolbeckiteOre = 0
        statusKolbeckiteOre = 0
    end
--T5 Stuff
    -- RhodoniteOre
    local maxRhodoniteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightRhodoniteOre = 3.76
    local RhodoniteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Rhodonite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massRhodoniteOre = round(math.ceil((OreContainerMass - RhodoniteOreContainerMass) / weightRhodoniteOre),1)
            percentRhodoniteOre = math.ceil(((math.ceil((massManganeseCobalt*1000) - 0.5)/maxRhodoniteOre)*100))
            statusRhodoniteOre = oreStatus(percentRhodoniteOre)
        end
    end
    if massRhodoniteOre == nil then
        massRhodoniteOre = 0
        percentRhodoniteOre = 0
        statusRhodoniteOre = 0
    end
    -- ColumbiteOre
    local maxColumbiteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightColumbiteOre = 5.38
    local ColumbiteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Columbite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massColumbiteOre = round(math.ceil((OreContainerMass - ColumbiteOreContainerMass) / weightColumbiteOre),1)
            percentColumbiteOre = math.ceil(((math.ceil((massColumbiteOre*1000) - 0.5)/maxColumbiteOre)*100))
            statusColumbiteOre = oreStatus(percentColumbiteOre)
        end
    end
    if massColumbiteOre == nil then
        massColumbiteOre = 0
        percentColumbiteOre = 0
        statusColumbiteOre = 0
    end
    -- IllmeniteOre
    local maxIllmeniteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightIllmeniteOre = 4.55
    local IllmeniteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Illmenite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massIllmeniteOre = round(math.ceil((OreContainerMass - IllmeniteOreContainerMass) / weightIllmeniteOre),1)
            percentIllmeniteOre = math.ceil(((math.ceil((massIllmeniteOre*1000) - 0.5)/maxIllmeniteOre)*100))
            statusIllmeniteOre = oreStatus(percentIllmeniteOre)
        end
    end
    if massIllmeniteOre == nil then
        massIllmeniteOre = 0
        percentIllmeniteOre = 0
        statusIllmeniteOre = 0
    end
    -- VanadiniteOre
    local maxVanadiniteOre = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightVanadiniteOre = 6.95
    local VanadiniteOreContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(oreData) do
        if string.match(oreData[k].oreContainer, "Vanadinite") then
            local OreContainerMass = oreData[k].oreContainerMass
            massVanadiniteOre = round(math.ceil((OreContainerMass - VanadiniteOreContainerMass) / weightVanadiniteOre),1)
            percentVanadiniteOre = math.ceil(((math.ceil((massVanadiniteOre*1000) - 0.5)/maxVanadiniteOre)*100))
            statusVanadiniteOre = oreStatus(percentVanadiniteOre)
        end
    end
    if massVanadiniteOre == nil then
        massVanadiniteOre = 0
        percentVanadiniteOre = 0
        statusVanadiniteOre = 0
    end
    --T1 Stuff
    -- PureAluminum
    local maxPureAluminum = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureAluminum = 2.70
    local PureAluminumContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer,"Alumin") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureAluminum = round(math.ceil((PureContainerMass - PureAluminumContainerMass) / weightPureAluminum),1)
            percentPureAluminum = math.ceil(((math.ceil((massPureAluminum*1000) - 0.5)/maxPureAluminum)*100))
            statusPureAluminum = pureStatus(percentPureAluminum)
        end
    end
    if massPureAluminum == nil then
        massPureAluminum = 0
        percentAluminum = 0
        statusPureAluminum = 0
    end
    -- PureCarbon
    local maxPureCarbon = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureCarbon = 2.27
    local PureCarbonContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer,"Carbon") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureCarbon = round(math.ceil((PureContainerMass - PureCarbonContainerMass) / weightPureCarbon),1)
            percentPureCarbon = math.ceil(((math.ceil((massPureCarbon*1000) - 0.5)/maxPureCarbon)*100))
            statusPureCarbon = pureStatus(percentPureCarbon)
        end
    end
    if massPureCarbon == nil then
        massPureCarbon = 0
        percentPureCarbon = 0
        statusPureCarbon = 0
    end
    -- PureIron
    local maxPureIron = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureIron = 7.85
    local PureIronContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer,"Iron") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureIron = round(math.ceil((PureContainerMass - PureIronContainerMass) / weightPureIron),1)
            percentPureIron = math.ceil(((math.ceil((massPureIron*1000) - 0.5)/maxPureIron)*100))
            statusPureIron = pureStatus(percentPureIron)
        end
    end
    if massPureIron == nil then
        massPureIron = 0
        percentPureIron = 0
        statusPureIron = 0
    end
    -- Pure Silicon
    local maxPureSilicon = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureSilicon = 2.33
    local PureSiliconContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Silicon") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureSilicon = round(math.ceil((PureContainerMass - PureSiliconContainerMass) / weightPureSilicon),1)
            percentPureSilicon = math.ceil(((math.ceil((massPureSilicon*1000) - 0.5)/maxPureSilicon)*100))
            statusPureSilicon = pureStatus(percentPureSilicon)
        end
    end
    if massPureSilicon == nil then
        massPureSilicon= 0
        percentPureSilicon = 0
        statusPureSilicon = 0
    end
    -- PureOxygen
    local maxPureOxygen = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureOxygen = 1
    local PureOxygenContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Oxygen") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureOxygen = round(math.ceil((PureContainerMass - PureOxygenContainerMass) / weightPureOxygen),1)
            percentPureOxygen = math.ceil(((math.ceil((massPureOxygen*1000) - 0.5)/maxPureOxygen)*100))
            statusPureOxygen = hoStatus(percentPureOxygen)
        end
    end
    if massPureOxygen == nil then
        massPureOxygen = 0
        percentPureOxygen = 0
        statusPureOxygen = 0
    end
    -- PureHydrogen
    local maxPureHydrogen = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureHydrogen = 0.07
    local PureHydrogenContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Hydrogen") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureHydrogen = round(math.ceil((PureContainerMass - PureHydrogenContainerMass) / weightPureHydrogen),1)
            percentPureHydrogen = math.ceil(((math.ceil((massPureHydrogen*1000) - 0.5)/maxPureHydrogen)*100))
            statusPureHydrogen = hoStatus(percentPureHydrogen)
        end
    end
    if massPureHydrogen == nil then
        massPureHydrogen = 0
        percentPureHydrogen = 0
        statusPureHydrogen = 0
    end
--T2 Stuff
    -- PureCalcium
    local maxPureCalcium = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureCalcium = 1.55
    local PureCalciumContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Calcium") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureCalcium = round(math.ceil((PureContainerMass - PureCalciumContainerMass) / weightPureCalcium),1)
            percentPureCalcium = math.ceil(((math.ceil((massPureCalcium*1000) - 0.5)/maxPureCalcium)*100))
            statusPureCalcium = pureStatus(percentPureCalcium)
        end
    end
    if massPureCalcium == nil then
        massPureCalcium = 0
        percentPureCalcium = 0
        statusPureCalcium = 0
    end
    -- PureChromium
    local maxPureChromium = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureChromium = 7.19
    local PureChromiumContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Chromium") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureChromium = round(math.ceil((PureContainerMass - PureChromiumContainerMass) / weightPureChromium),1)
            percentPureChromium = math.ceil(((math.ceil((massPureChromium*1000) - 0.5)/maxPureChromium)*100))
            statusPureChromium = pureStatus(percentPureChromium)
        end
    end
    if massPureChromium == nil then
        massPureChromium = 0
        percentPureChromium = 0
        statusPureChromium = 0
    end
    -- PureCopper
    local maxPureCopper = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureCopper = 8.96
    local PureCopperContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Copper") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureCopper = round(math.ceil((PureContainerMass - PureCopperContainerMass) / weightPureCopper),1)
            percentPureCopper = math.ceil(((math.ceil((massPureCopper*1000) - 0.5)/maxPureCopper)*100))
            statusPureCopper = pureStatus(percentPureCopper)
        end
    end
    if massPureCopper == nil then
        massPureCopper = 0
        percentPureCopper = 0
        statusPureCopper = 0
    end
    -- PureSodium
    local maxPureSodium = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureSodium = 0.97
    local PureSodiumContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Sodium") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureSodium = round(math.ceil((PureContainerMass - PureSodiumContainerMass) / weightPureSodium),1)
            percentPureSodium = math.ceil(((math.ceil((massPureSodium*1000) - 0.5)/maxPureSodium)*100))
            statusPureSodium = pureStatus(percentPureSodium)
        end
    end
    if massPureSodium == nil then
        massPureSodium = 0
        percentPureSodium = 0
        statusPureSodium = 0
    end
--T3 Stuff
    -- PureLithium
    local maxPureLithium = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureLithium = 0.53
    local PureLithiumContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Lithium") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureLithium = round(math.ceil((PureContainerMass - PureLithiumContainerMass) / weightPureLithium),1)
            percentPureLithium = math.ceil(((math.ceil((massPureLithium*1000) - 0.5)/maxPureLithium)*100))
            statusPureLithium = pureStatus(percentPureLithium)
        end
    end
    if massPureLithium == nil then
        massPureLithium = 0
        percentPureLithium = 0
        statusPureLithium = 0
    end
    -- PureNickel
    local maxPureNickel = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureNickel = 8.91
    local PureNickelContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Nickel") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureNickel = round(math.ceil((PureContainerMass - PureNickelContainerMass) / weightPureNickel),1)
            percentPureNickel = math.ceil(((math.ceil((massPureNickel*1000) - 0.5)/maxPureNickel)*100))
            statusPureNickel = pureStatus(percentPureNickel)
        end
    end
    if massPureNickel == nil then
        massPureNickel = 0
        percentPureNickel = 0
        statusPureNickel = 0
    end
    -- PureSilver
    local maxPureSilver = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureSilver = 10.49
    local PureSilverContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Silver") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureSilver = round(math.ceil((PureContainerMass - PureSilverContainerMass) / weightPureSilver),1)
            percentPureSilver = math.ceil(((math.ceil((massPureSilver*1000) - 0.5)/maxPureSilver)*100))
            statusPureSilver = pureStatus(percentPureSilver)
        end
    end
    if massPureSilver == nil then
        massPureSilver = 0
        percentPureSilver = 0
        statusPureSilver = 0
    end
    -- Pure Sulfur
    local maxPureSulfur = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureSulfur = 1.82
    local PureSulfurContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Sulfur") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureSulfur = round(math.ceil((PureContainerMass - PureSulfurContainerMass) / weightPureSulfur),1)
            percentPureSulfur = math.ceil(((math.ceil((massPureSulfur*1000) - 0.5)/maxPureSulfur)*100))
            statusPureSulfur = pureStatus(percentPureSulfur)
        end
    end
    if massPureSulfur == nil then
        massPureSulfur = 0
        percentPureSulfur = 0
        statusPureSulfur = 0
    end
--T4 Stuff
    -- PureCobalt
    local maxPureCobalt = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureCobalt = 8.90
    local PureCobaltContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Cobalt") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureCobalt = round(math.ceil((PureContainerMass - PureCobaltContainerMass) / weightPureCobalt),1)
            percentPureCobalt = math.ceil(((math.ceil((massPureCobalt*1000) - 0.5)/maxPureCobalt)*100))
            statusPureCobalt = pureStatus(percentPureCobalt)
        end
    end
    if massPureCobalt == nil then
        massPureCobalt = 0
        percentPureCobalt = 0
        statusPureCobalt = 0
    end
    -- PureFluorine
    local maxPureFluorine = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureFluorine = 1.70
    local PureFluorineContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Fluorine") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureFluorine = round(math.ceil((PureContainerMass - PureFluorineContainerMass) / weightPureFluorine),1)
            percentPureFluorine = math.ceil(((math.ceil((massPureFluorine*1000) - 0.5)/maxPureFluorine)*100))
            statusPureFluorine = pureStatus(percentPureFluorine)
        end
    end
    if massPureFluorine == nil then
        massPureFluorine = 0
        percentPureFluorine = 0
        statusPureFluorine = 0
    end
    -- PureGold
    local maxPureGold = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureGold = 19.30
    local PureGoldContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Gold") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureGold = round(math.ceil((PureContainerMass - PureGoldContainerMass) / weightPureGold),1)
            percentPureGold = math.ceil(((math.ceil((massPureGold*1000) - 0.5)/maxPureGold)*100))
            statusPureGold = pureStatus(percentPureGold)
        end
    end
    if massPureGold == nil then
        massPureGold = 0
        percentPureGold = 0
        statusPureGold = 0
    end
    -- Pure Scandium
    local maxPureScandium = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureScandium = 2.98
    local PureScandiumContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Scandium") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureScandium = round(math.ceil((PureContainerMass - PureScandiumContainerMass) / weightPureScandium),1)
            percentPureScandium = math.ceil(((math.ceil((massPureScandium*1000) - 0.5)/maxPureScandium)*100))
            statusPureScandium = pureStatus(percentPureScandium)
        end
    end
    if massPureScandium == nil then
        massPureScandium = 0
        percentPureScandium = 0
        statusPureScandium = 0
    end
--T5 Stuff
    -- PureManganese
    local maxPureManganese = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureManganese = 7.21
    local PureManganeseContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Manganese") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureManganese = round(math.ceil((PureContainerMass - PureManganeseContainerMass) / weightPureManganese),1)
            percentPureManganese = math.ceil(((math.ceil((massManganeseCobalt*1000) - 0.5)/maxPureManganese)*100))
            statusPureManganese = pureStatus(percentPureManganese)
        end
    end
    if massPureManganese == nil then
        massPureManganese = 0
        percentPureManganese = 0
        statusPureManganese = 0
    end
    -- PureNiobium
    local maxPureNiobium = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureNiobium = 8.57
    local PureNiobiumContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Niobium") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureNiobium = round(math.ceil((PureContainerMass - PureNiobiumContainerMass) / weightPureNiobium),1)
            percentPureNiobium = math.ceil(((math.ceil((massPureNiobium*1000) - 0.5)/maxPureNiobium)*100))
            statusPureNiobium = pureStatus(percentPureNiobium)
        end
    end
    if massPureNiobium == nil then
        massPureNiobium = 0
        percentPureNiobium = 0
        statusPureNiobium = 0
    end
    -- PureTitanium
    local maxPureTitanium = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureTitanium = 4.51
    local PureTitaniumContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Titanium") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureTitanium = round(math.ceil((PureContainerMass - PureTitaniumContainerMass) / weightPureTitanium),1)
            percentPureTitanium = math.ceil(((math.ceil((massPureTitanium*1000) - 0.5)/maxPureTitanium)*100))
            statusPureTitanium = pureStatus(percentPureTitanium)
        end
    end
    if massPureTitanium == nil then
        massPureTitanium = 0
        percentPureTitanium = 0
        statusPureTitanium = 0
    end
    -- Pure Vanadium
    local maxPureVanadium = 358400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureVanadium = 6.00
    local PureVanadiumContainerMass = 0 --export: This is the mass of the container.
    for k, v in pairs(pureData) do
        if string.match(pureData[k].pureContainer, "Vanadium") then
            local PureContainerMass = pureData[k].pureContainerMass
            massPureVanadium = round(math.ceil((PureContainerMass - PureVanadiumContainerMass) / weightPureVanadium),1)
            percentPureVanadium = math.ceil(((math.ceil((massPureVanadium*1000) - 0.5)/maxPureVanadium)*100))
            statusPureVanadium = pureStatus(percentPureVanadium)
        end
    end
    if massPureVanadium == nil then
        massPureVanadium = 0
        percentPureVanadium = 0
        statusPureVanadium = 0
    end
    if displayT1 then
        html = [[
        <div class="bootstrap">
        <h1 style="
            font-size: 8em;
        ">T1 Pure/Ore Status</h1>
        <table 
        style="
            margin-top: 5px;
            margin-left: auto;
            margin-right: auto;
            width: 100%;
            font-size: 4em;
        ">
            </br>
            <tr style="
                width: 100%;
                margin-bottom: 30px;
                background-color: blue;
                color: white;
            ">
                <th>Type</th>
                <th>Qty</th>
                <th>Levels</th>
                <th>Status</th>
            <tr>
                <th>Aluminium</th>
                <th>]]..massPureAluminum..[[KL]]..[[</th>
                <th>]]..percentPureAluminum..[[%</th>
                ]]..statusPureAluminum..[[
            </tr>
            <tr>
                <th>Bauxite</th>
                <th>]]..massBauxiteOre..[[KL]]..[[</th>
                <th>]]..percentBauxiteOre..[[%</th>
                ]]..statusBauxiteOre..[[
            </tr>
            <tr>
                <th>Carbon</th>
                <th>]]..massPureCarbon..[[KL]]..[[</th>
                <th>]]..percentPureCarbon..[[%</th>
                ]]..statusPureCarbon..[[
            </tr>
            <tr>
                <th>Coal</th>
                <th>]]..massCoalOre..[[KL]]..[[</th>
                <th>]]..percentCoalOre..[[%</th>
                ]]..statusCoalOre..[[
            </tr>
            <tr>
                <th>Iron</th>
                <th>]]..massPureIron..[[KL]]..[[</th>
                <th>]]..percentPureIron..[[%</th>
                ]]..statusPureIron..[[
            </tr>
            <tr>
                <th>Hematite</th>
                <th>]]..massHematiteOre..[[KL]]..[[</th>
                <th>]]..percentHematiteOre..[[%</th>
                ]]..statusHematiteOre..[[
            </tr>
            <tr>
                <th>Silicon</th>
                <th>]]..massPureSilicon..[[KL]]..[[</th>
                <th>]]..percentPureSilicon..[[%</th>
                ]]..statusPureSilicon..[[
            </tr>
            <tr>
                <th>Quartz</th>
                <th>]]..massQuartzOre..[[KL]]..[[</th>
                <th>]]..percentQuartzOre..[[%</th>
                ]]..statusQuartzOre..[[
            </tr>
            <tr>
                <th>Hydrogen</th>
                <th>]]..massPureHydrogen..[[KL]]..[[</th>
                <th>]]..percentPureHydrogen..[[%</th>
                ]]..statusPureHydrogen..[[
            </tr>
            <tr>
                <th>Oxygen</th>
                <th>]]..massPureOxygen..[[KL]]..[[</th>
                <th>]]..percentPureOxygen..[[%</th>
                ]]..statusPureOxygen..[[
            </tr>
        </table>
        </div>
        ]]
        displayT1.setHTML(html)
    end
    if displayT2 then
        html = [[
        <div class="bootstrap">
        <h1 style="
            font-size: 8em;
        ">T2 Pure/Ore Status</h1>
        <table 
        style="
            margin-top: 5px;
            margin-left: auto;
            margin-right: auto;
            width: 100%;
            font-size: 4em;
        ">
            </br>
            <tr style="
                width: 100%;
                margin-bottom: 30px;
                background-color: blue;
                color: white;
            ">
                <th>Type</th>
                <th>Qty</th>
                <th>Levels</th>
                <th>Status</th>
            <tr>
                <th>Sodium</th>
                <th>]]..massPureSodium..[[KL]]..[[</th>
                <th>]]..percentPureSodium..[[%</th>
                ]]..statusPureSodium..[[
            </tr>
            <tr>
                <th>Natron</th>
                <th>]]..massNatronOre..[[KL]]..[[</th>
                <th>]]..percentNatronOre..[[%</th>
                ]]..statusNatronOre..[[
            </tr>
            <tr>
                <th>Chromium</th>
                <th>]]..massPureChromium..[[KL]]..[[</th>
                <th>]]..percentPureChromium..[[%</th>
                ]]..statusPureChromium..[[
            </tr>
            <tr>
                <th>Chromite</th>
                <th>]]..massChromiteOre..[[KL]]..[[</th>
                <th>]]..percentChromiteOre..[[%</th>
                ]]..statusChromiteOre..[[
            </tr>
            <tr>
                <th>Copper</th>
                <th>]]..massPureCopper..[[KL]]..[[</th>
                <th>]]..percentPureCopper..[[%</th>
                ]]..statusPureCopper..[[
            </tr>
            <tr>
                <th>Malachite</th>
                <th>]]..massMalachiteOre..[[KL]]..[[</th>
                <th>]]..percentMalachiteOre..[[%</th>
                ]]..statusMalachiteOre..[[
            </tr>
            <tr>
                <th>Calcium</th>
                <th>]]..massPureCalcium..[[KL]]..[[</th>
                <th>]]..percentPureCalcium..[[%</th>
                ]]..statusPureCalcium..[[
            </tr>
            <tr>
                <th>Limestone</th>
                <th>]]..massLimestoneOre..[[KL]]..[[</th>
                <th>]]..percentLimestoneOre..[[%</th>
                ]]..statusLimestoneOre..[[
            </tr>
            </table>
        </div>
        ]]
        displayT2.setHTML(html)
    end
    if displayT3 then
        html = [[
        <div class="bootstrap">
        <h1 style="
            font-size: 8em;
        ">T3 Pure/Ore Status</h1>
        <table 
        style="
            margin-top: 5px;
            margin-left: auto;
            margin-right: auto;
            width: 95%;
            font-size: 4em;
        ">
            </br>
            <tr style="
                width: 100%;
                margin-bottom: 30px;
                background-color: blue;
                color: white;
            ">
                <th>Type</th>
                <th>Qty</th>
                <th>Levels</th>
                <th>Status</th>
            <tr>
                <th>Nickel</th>
                <th>]]..massPureNickel..[[KL]]..[[</th>
                <th>]]..percentPureNickel..[[%</th>
                ]]..statusPureNickel..[[
            </tr>
            <tr>
                <th>Garnierite</th>
                <th>]]..massGarnieriteOre..[[KL]]..[[</th>
                <th>]]..percentGarnieriteOre..[[%</th>
                ]]..statusGarnieriteOre..[[
            </tr>
            <tr>
                <th>Lithium</th>
                <th>]]..massPureLithium..[[KL]]..[[</th>
                <th>]]..percentPureLithium..[[%</th>
                ]]..statusPureLithium..[[
            </tr>
            <tr>
                <th>Petalite</th>
                <th>]]..massPetaliteOre..[[KL]]..[[</th>
                <th>]]..percentPetaliteOre..[[%</th>
                ]]..statusPetaliteOre..[[
            </tr>
            <tr>
                <th>Sulfur</th>
                <th>]]..massPureSulfur..[[KL]]..[[</th>
                <th>]]..percentPureSulfur..[[%</th>
                ]]..statusPureSulfur..[[
            </tr>
            <tr>
                <th>Pyrite</th>
                <th>]]..massPyriteOre..[[KL]]..[[</th>
                <th>]]..percentPyriteOre..[[%</th>
                ]]..statusPyriteOre..[[
            </tr>
            <tr>
                <th>Silver</th>
                <th>]]..massPureSilver..[[KL]]..[[</th>
                <th>]]..percentPureSilver..[[%</th>
                ]]..statusPureSilver..[[
            </tr>
            <tr>
                <th>Acanthite</th>
                <th>]]..massAcanthiteOre..[[KL]]..[[</th>
                <th>]]..percentAcanthiteOre..[[%</th>
                ]]..statusAcanthiteOre..[[
            </tr>   
        </table>
        </div>
        ]]
        displayT3.setHTML(html)
    end
    if displayT4 then
        html = [[
        <div class="bootstrap">
        <h1 style="
            font-size: 8em;
        ">T4 Pure/Ore Status</h1>
        <table 
        style="
            margin-top: 5px;
            margin-left: auto;
            margin-right: auto;
            width: 100%;
            font-size: 4em;
        ">
            </br>
            <tr style="
                width: 100%;
                margin-bottom: 30px;
                background-color: blue;
                color: white;
            ">
                <th>Type</th>
                <th>Qty</th>
                <th>Levels</th>
                <th>Status</th>
            <tr>
                <th>Cobalt</th>
                <th>]]..massPureCobalt..[[KL]]..[[</th>
                <th>]]..percentPureCobalt..[[%</th>
                ]]..statusPureCobalt..[[
            </tr>
            <tr>
                <th>Cobaltite</th>
                <th>]]..massCobaltiteOre..[[KL]]..[[</th>
                <th>]]..percentCobaltiteOre..[[%</th>
                ]]..statusCobaltiteOre..[[
            </tr>
            <tr>
                <th>Fluorine</th>
                <th>]]..massPureFluorine..[[KL]]..[[</th>
                <th>]]..percentPureFluorine..[[%</th>
                ]]..statusPureFluorine..[[
            </tr>
            <tr>
                <th>Cryolite</th>
                <th>]]..massCryoliteOre..[[KL]]..[[</th>
                <th>]]..percentCryoliteOre..[[%</th>
                ]]..statusCryoliteOre..[[
            </tr>
            <tr>
                <th>Gold</th>
                <th>]]..massPureGold..[[KL]]..[[</th>
                <th>]]..percentPureGold..[[%</th>
                ]]..statusPureGold..[[
            </tr>
            <tr>
                <th>Gold Nuggets</th>
                <th>]]..massGoldOre..[[KL]]..[[</th>
                <th>]]..percentGoldOre..[[%</th>
                ]]..statusGoldOre..[[
            </tr>
            <tr>
                <th>Scandium</th>
                <th>]]..massPureScandium..[[KL]]..[[</th>
                <th>]]..percentPureScandium..[[%</th>
                ]]..statusPureScandium..[[
            </tr>
            <tr>
                <th>Kolbeckite</th>
                <th>]]..massKolbeckiteOre..[[KL]]..[[</th>
                <th>]]..percentKolbeckiteOre..[[%</th>
                ]]..statusKolbeckiteOre..[[
            </tr>
            
        </table>
        </div>
        ]]
        displayT4.setHTML(html)
    end

    if displayT5 then
        html = [[
        <div class="bootstrap">
        <h1 style="
            font-size: 8em;
        ">T5 Ore Status</h1>
        <table 
        style="
            margin-top: 5px;
            margin-left: auto;
            margin-right: auto;
            width: 90%;
            font-size: 4em;
        ">
            </br>
            <tr style="
                width: 100%;
                margin-bottom: 30px;
                background-color: blue;
                color: white;
            ">
                <th>Type</th>
                <th>Qty</th>
                <th>Levels</th>
                <th>Status</th>
            <tr>
                <th>Manganese</th>
                <th>]]..massPureManganese..[[KL]]..[[</th>
                <th>]]..percentPureManganese..[[%</th>
                ]]..statusPureManganese..[[
            </tr>
            <tr>
                <th>Rhodonite</th>
                <th>]]..massRhodoniteOre..[[KL]]..[[</th>
                <th>]]..percentRhodoniteOre..[[%</th>
                ]]..statusRhodoniteOre..[[
            </tr>
            <tr>
                <th>Niobium</th>
                <th>]]..massPureNiobium..[[KL]]..[[</th>
                <th>]]..percentPureNiobium..[[%</th>
                ]]..statusPureNiobium..[[
            </tr>
            <tr>
                <th>Columbite</th>
                <th>]]..massColumbiteOre..[[KL]]..[[</th>
                <th>]]..percentColumbiteOre..[[%</th>
                ]]..statusColumbiteOre..[[
            </tr>
            <tr>
                <th>Titanium</th>
                <th>]]..massPureTitanium..[[KL]]..[[</th>
                <th>]]..percentPureTitanium..[[%</th>
                ]]..statusPureTitanium..[[
            </tr>
            <tr>
                <th>Illmenite</th>
                <th>]]..massIllmeniteOre..[[KL]]..[[</th>
                <th>]]..percentIllmeniteOre..[[%</th>
                ]]..statusIllmeniteOre..[[
            </tr>
            <tr>
                <th>Vanadium</th>
                <th>]]..massPureVanadium..[[KL]]..[[</th>
                <th>]]..percentPureVanadium..[[%</th>
                ]]..statusPureVanadium..[[
            </tr>
            <tr>
                <th>Vanadinite</th>
                <th>]]..massVanadiniteOre..[[KL]]..[[</th>
                <th>]]..percentVanadiniteOre..[[%</th>
                ]]..statusVanadiniteOre..[[
            </tr>
        </table>
        </div>
        ]]
        displayT5.setHTML(html)
    end
end
unit.setTimer('updateTable', 1)