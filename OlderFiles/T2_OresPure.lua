function round(number,decimals)
    local power = 10^decimals
    return math.floor((number/1000) * power) / power
end 

function oreStatus(percent)
    if percent <= 0 then return "<th style=\"color: red;\">EMPTY</th>"
    elseif percent > 0 and percent <=25 then return "<th style=\"color: red;\">LOW</th>"
    elseif percent > 25 and percent <= 50 then return "<th style=\"color: orange;\">LOW</th>"
    elseif percent > 50 and percent <= 99 then return "<th style=\"color: green;\">GOOD</th>"
    else return "<th style=\"color: green;\">FULL</th>"
    end 
end  

local useL = 1 --export: Use 1 for L or 0 for t
if useL == 1 then
    unitMeasure = "KL"
elseif useL == 0 then
    unitMeasure = "T"
end

-- Chromite Variables 
local maxChromite = 153000 --export: This is the maximum mass allowed in container. Update as needed
local weightChromite = 7.19 --export:
if useL == 1 then
    massChromite = round(math.ceil(chromite.getItemsMass()/weightChromite),1)
elseif useL == 0 then
    massChromite = round(math.ceil(chromite.getItemsMass()),1)
end
local percentChromite = math.ceil(((math.ceil((chromite.getItemsMass()/weightChromite) - 0.5)/maxChromite)*100))
local statusChromite = oreStatus(percentChromite)

-- Chromium Variables 
local maxChromium = 153000 --export: This is the maximum mass allowed in container. Update as needed
local weightChromium = 7.19 --export:
if useL == 1 then
    massChromium = round(math.ceil(chromium.getItemsMass()/weightChromium),1)
elseif useL == 0 then
    massChromium = round(math.ceil(chromium.getItemsMass()),1)
end
local percentChromium = math.ceil(((math.ceil((chromium.getItemsMass()/weightChromium) - 0.5)/maxChromium)*100))
local statusChromium = oreStatus(percentChromium)

-- Limestone Variables
local maxLimestone = 153000 --export: This is the maximum mass allowed in container. Update as needed
local weightLimestone = 2.81 --export:
if useL == 1 then
    massLimestone = round(math.ceil(limestone.getItemsMass()/weightLimestone),1)
elseif useL == 0 then
    massLimestone = round(math.ceil(limestone.getItemsMass()),1)
end
local percentLimestone = math.ceil(((math.ceil((limestone.getItemsMass()/weightLimestone) - 0.5)/maxLimestone)*100))
local statusLimestone = oreStatus(percentLimestone)
    
-- Calcium Variables
local maxCalcium = 153000 --export: This is the maximum mass allowed in container. Update as needed
local weightCalcium = 1.55 --export:
if useL == 1 then
    massCalcium = round(math.ceil(calcium.getItemsMass()/weightCalcium),1)
elseif useL == 0 then
    massCalcium = round(math.ceil(calcium.getItemsMass()),1)
end
local percentCalcium = math.ceil(((math.ceil((calcium.getItemsMass()/weightCalcium) - 0.5)/maxCalcium)*100))
local statusCalcium = oreStatus(percentCalcium)

-- Malachite Variables
local maxMalachite = 153600 --export: This is the maximum mass allowed in container. Update as needed
local weightMalachite = 4 --export:
if useL == 1 then
    massMalachite = round(math.ceil(malachite.getItemsMass()/weightCalcium),1)
elseif useL == 0 then
    massMalachite = round(math.ceil(malachite.getItemsMass()),1)
end
local percentMalachitem = math.ceil(((math.ceil((malachite.getItemsMass()/weightMalachite) - 0.5)/maxMalachite)*100))
local statusMalachite = oreStatus(percentMalachite)

-- Copper Variables
local maxCopper = 153000 --export: This is the maximum mass allowed in container. Update as needed
local weightCopper = 8.96 --export:
if useL == 1 then
    massCopper = round(math.ceil(copper.getItemsMass()/weightCopper),1)
elseif useL == 0 then
    massCopper = round(math.ceil(copper.getItemsMass()),1)
end
local percentCopper = math.ceil(((math.ceil((copper.getItemsMass()/weightCopper) - 0.5)/maxCopper)*100))
local statusCopper = oreStatus(percentCopper)

-- Natron Variables
local maxNatron = 153000 --export: This is the maximum mass allowed in container. Update as needed
local weightNatron = 0.97 --export:
if useL == 1 then
    massNatron = round(math.ceil(natron.getItemsMass()/weightSodium),1)
elseif useL == 0 then
    massNatron = round(math.ceil(natron.getItemsMass()),1)
end
local percentNatron = math.ceil(((math.ceil((natron.getItemsMass()/weightSodium) - 0.5)/maxNatron)*100))
local statusNatron = oreStatus(percentNatron)

-- Sodium Variables
local maxSodium = 153000 --export: This is the maximum mass allowed in container. Update as needed
local weightSodium = 0.97 --export:
if useL == 1 then
    massSodium = round(math.ceil(sodium.getItemsMass()/weightSodium),1)
elseif useL == 0 then
    massSodium = round(math.ceil(sodium.getItemsMass()),1)
end
local percentSodium = math.ceil(((math.ceil((sodium.getItemsMass()/weightSodium) - 0.5)/maxSodium)*100))
local statusSodium = oreStatus(percentSodium)


html = [[
<div class="bootstrap">
<h1 style="
	font-size: 8em;
">T2 Ore Status</h1>
<table 
style="
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
	width: 80%;
	font-size: 4em;
">
	</br>
	<tr style="
		width: 100%;
		margin-bottom: 30px;
		background-color: blue;
		color: white;
	">
		<th>Item</th>
		<th>Qty</th>
		<th>Levels</th>
		<th>Status</th>
	<tr style="background-color:gray;color:black;">
		<th>Chromite</th>
		<th>]]..massChromite..unitMeasure..[[</th>
		<th>]]..percentChromite..[[%</th>
		]]..statusChromite..[[
	</tr>
	<tr style="background-color:gray;color:black;">
		<th>Chromium</th>
		<th>]]..massChromium..unitMeasure..[[</th>
		<th>]]..percentChromium..[[%</th>
		]]..statusChromium..[[
	</tr>
	<tr>
		<th>Limestone</th>
		<th>]]..massLimestone..unitMeasure..[[</th>
		<th>]]..percentLimestone..[[%</th>
		]]..statusLimestone..[[
	</tr>
	<tr>
		<th>Calcium</th>
		<th>]]..massCalcium..unitMeasure..[[</th>
		<th>]]..percentCalcium..[[%</th>
		]]..statusCalcium..[[
	</tr>
	<tr style="background-color:gray;color:black;">
		<th>Malachite</th>
		<th>]]..massMalachite..unitMeasure..[[</th>
		<th>]]..percentMalachite..[[%</th>
		]]..statusMalachite..[[
	</tr>
	<tr style="background-color:gray;color:black;">
		<th>Copper</th>
		<th>]]..massCopper..unitMeasure..[[</th>
		<th>]]..percentCopper..[[%</th>
		]]..statusCopper..[[
	</tr>
	<tr>
		<th>Natron</th>
		<th>]]..massNatron..unitMeasure..[[</th>
		<th>]]..percentNatron..[[%</th>
		]]..statusNatron..[[
	</tr>
	<tr>
		<th>Sodium</th>
		<th>]]..massSodium..unitMeasure..[[</th>
		<th>]]..percentSodium..[[%</th>
		]]..statusSodium..[[
	</tr>

</table>
</div>
]]

screen.setHTML(html)