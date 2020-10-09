--[[
Refineries screen display

This code goes into unit -> start() filter of the programming board

1) Make sure you name your screen slot: display1, display2
2) Make sure to add a tick filter to unit slot, name the ticker: updateTable
3) In ticker lua code, add: generateHtml()
]]

unit.hide()
display1.activate()
display2.activate()

function generateHtml()
    function round(number,decimals)
        local power = 10^decimals
        return math.floor((number/1000) * power) / power
    end 

    function pureStatus(percent)
        if percent <= 25 then return "<th style=\"color: red;\">LOW</th>"
        elseif percent > 25 and percent < 50 then return "<th style=\"color: orange;\">LOW</th>"
        else return "<th style=\"color: green;\">GOOD</th>"
        end 
    end

    function hoStatus(percent)
        if percent <= 10 then return "<th style=\"color: orange;\">LOW</th>"
        elseif percent > 10 and percent < 70 then return "<th style=\"color: green;\">GOOD</th>"
        else return "<th style=\"color: red;\">PLEASE EMPTY</th>"
        end 
    end

    local useL = 1 --export: Use 1 for L or 0 for t
    if useL == 1 then
        unitMeasure = "KL"
    elseif useL == 0 then
        unitMeasure = "T"
    end

    -- PureAluminum Variables 
    local maxPureAluminum = 10400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureAluminum = 2.70 --export:
    if useL == 1 then
        massPureAluminum = round(math.ceil(PureAluminum.getItemsMass()/weightPureAluminum),1)
    elseif useL == 0 then  
        massPureAluminum = round(math.ceil(PureAluminum.getItemsMass()),1)
    end
    local percentPureAluminum = math.ceil(((math.ceil((PureAluminum.getItemsMass()/weightPureAluminum) - 0.5)/maxPureAluminum)*100))
    local statusPureAluminum = pureStatus(percentPureAluminum)
        
    -- PureCarbon Variables
    local maxPureCarbon = 10400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureCarbon = 2.27 --export:
    if useL == 1 then
        massPureCarbon = round(math.ceil(PureCarbon.getItemsMass()/weightPureCarbon),1)
    elseif useL == 0 then
        massPureCarbon = round(math.ceil(PureCarbon.getItemsMass()),1)
    end
    local percentPureCarbon = math.ceil(((math.ceil((PureCarbon.getItemsMass()/weightPureCarbon) - 0.5)/maxPureCarbon)*100))
    local statusPureCarbon = pureStatus(percentPureCarbon)

    -- PureIron Variables
    local maxPureIron = 10400 --export:;This is the maximum mass allowed in container. Update as needed
    local weightPureIron = 7.85 --export:
    if useL == 1 then
        massPureIron = round(math.ceil(PureIron.getItemsMass()/weightPureIron),1)
    elseif useL == 0 then
        massPureIron = round(math.ceil(PureIron.getItemsMass()),1)
    end
    local percentPureIron = math.ceil(((math.ceil((PureIron.getItemsMass()/weightPureIron) - 0.5)/maxPureIron)*100))
    local statusPureIron = pureStatus(percentPureIron)

    -- Pure Silicon Variables
    local maxPureSilicon = 10400 --export:;This is the maximum mass allowed in container. Update as needed
    local weightPureSilicon = 2.33 --export:
    if useL == 1 then
        massPureSilicon = round(math.ceil(PureSilicon.getItemsMass()/weightPureSilicon),1)
    elseif useL == 0 then
        massPureSilicon = round(math.ceil(PureSilicon.getItemsMass()),1)
    end
    local percentPureSilicon = math.ceil(((math.ceil((PureSilicon.getItemsMass()/weightPureSilicon) - 0.5)/maxPureSilicon)*100))
    local statusPureSilicon = pureStatus(percentPureSilicon)

    -- PureOxygen Variables 
    local maxPureOxygen = 10400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureOxygen = 1 --export:
    if useL == 1 then
        massPureOxygen = round(math.ceil(PureOxygen.getItemsMass()/weightPureOxygen),1)
    elseif useL == 0 then  
        massPureOxygen = round(math.ceil(PureOxygen.getItemsMass()),1)
    end
    local percentPureOxygen = math.ceil(((math.ceil((PureOxygen.getItemsMass()/weightPureOxygen) - 0.5)/maxPureOxygen)*100))
    local statusPureOxygen = hoStatus(percentPureOxygen)

    -- PureHydrogen Variables 
    local maxPureHydrogen = 10400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureHydrogen = 0.07 --export:
    if useL == 1 then
        massPureHydrogen = round(math.ceil(PureHydrogen.getItemsMass()/weightPureHydrogen),1)
    elseif useL == 0 then  
        massPureHydrogen = round(math.ceil(PureHydrogen.getItemsMass()),1)
    end
    local percentPureHydrogen = math.ceil(((math.ceil((PureHydrogen.getItemsMass()/weightPureHydrogen) - 0.5)/maxPureHydrogen)*100))
    local statusPureHydrogen = hoStatus(percentPureHydrogen)

    html = [[
    <div class="bootstrap">
    <h1 style="
        font-size: 8em;
    ">T1 Pure Status</h1>
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
            <th>Ore</th>
            <th>Qty</th>
            <th>Levels</th>
            <th>Status</th>
        <tr>
            <th>Pure Aluminium</th>
            <th>]]..massPureAluminum..unitMeasure..[[</th>
            <th>]]..percentPureAluminum..[[%</th>
            ]]..statusPureAluminum..[[
        </tr>
        <tr>
            <th>Pure Carbon</th>
            <th>]]..massPureCarbon..unitMeasure..[[</th>
            <th>]]..percentPureCarbon..[[%</th>
            ]]..statusPureCarbon..[[
        </tr>
        <tr>
            <th>Pure Iron</th>
            <th>]]..massPureIron..unitMeasure..[[</th>
            <th>]]..percentPureIron..[[%</th>
            ]]..statusPureIron..[[
        </tr>
        <tr>
            <th>Pure Silicon</th>
            <th>]]..massPureSilicon..unitMeasure..[[</th>
            <th>]]..percentPureSilicon..[[%</th>
            ]]..statusPureSilicon..[[
        </tr>
        
    </table>
    </div>
    ]]

    display1.setHTML(html)

    html = [[
    <div class="bootstrap">
    <h1 style="
        font-size: 8em;
    ">Oxygen/Hydrogen Status</h1>
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
            <th>Ore</th>
            <th>Qty</th>
            <th>Levels</th>
            <th>Status</th>
        <tr>
            <th>Pure Hydrogen</th>
            <th>]]..massPureHydrogen..unitMeasure..[[</th>
            <th>]]..percentPureHydrogen..[[%</th>
            ]]..statusPureHydrogen..[[
        </tr>
        <tr>
            <th>Pure Oxygen</th>
            <th>]]..massPureOxygen..unitMeasure..[[</th>
            <th>]]..percentPureOxygen..[[%</th>
            ]]..statusPureOxygen..[[
        </tr>
        
    </table>
    </div>
    ]]

    display2.setHTML(html)
end
unit.setTimer('updateTable', 1)