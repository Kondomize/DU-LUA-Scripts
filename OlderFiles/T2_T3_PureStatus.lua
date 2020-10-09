--[[
Pure screen display

This code goes into unit -> start() filter of the programming board

1) Make sure you name your screen slot: display1, display2
2) Make sure you name your container slots correctly, ie: PureAluminum
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

    local useL = 1 --export: Use 1 for L or 0 for t
    if useL == 1 then
        unitMeasure = "KL"
    elseif useL == 0 then
        unitMeasure = "T"
    end

    -- PureCalcium Variables 
    local maxPureCalcium = 10400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureCalcium = 1.55 --export:
    if useL == 1 then
        massPureCalcium = round(math.ceil(PureCalcium.getItemsMass()/weightPureCalcium),1)
    elseif useL == 0 then  
        massPureCalcium = round(math.ceil(PureCalcium.getItemsMass()),1)
    end
    local percentPureCalcium = math.ceil(((math.ceil((PureCalcium.getItemsMass()/weightPureCalcium) - 0.5)/maxPureCalcium)*100))
    local statusPureCalcium = pureStatus(percentPureCalcium)
        
    -- PureChromium Variables 
    local maxPureChromium = 10400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureChromium = 7.19 --export:
    if useL == 1 then
        massPureChromium = round(math.ceil(PureChromium.getItemsMass()/weightPureChromium),1)
    elseif useL == 0 then  
        massPureChromium = round(math.ceil(PureChromium.getItemsMass()),1)
    end
    local percentPureChromium = math.ceil(((math.ceil((PureChromium.getItemsMass()/weightPureChromium) - 0.5)/maxPureChromium)*100))
    local statusPureChromium = pureStatus(percentPureChromium)
        
    -- PureCopper Variables 
    local maxPureCopper = 10400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureCopper = 8.96 --export:
    if useL == 1 then
        massPureCopper = round(math.ceil(PureCopper.getItemsMass()/weightPureCopper),1)
    elseif useL == 0 then  
        massPureCopper = round(math.ceil(PureCopper.getItemsMass()),1)
    end
    local percentPureCopper = math.ceil(((math.ceil((PureCopper.getItemsMass()/weightPureCopper) - 0.5)/maxPureCopper)*100))
    local statusPureCopper = pureStatus(percentPureCopper)
        
    -- PureSodium Variables 
    local maxPureSodium = 10400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureSodium = .97 --export:
    if useL == 1 then
        massPureSodium = round(math.ceil(PureSodium.getItemsMass()/weightPureSodium),1)
    elseif useL == 0 then  
        massPureSodium = round(math.ceil(PureSodium.getItemsMass()),1)
    end
    local percentPureSodium = math.ceil(((math.ceil((PureSodium.getItemsMass()/weightPureSodium) - 0.5)/maxPureSodium)*100))
    local statusPureSodium = pureStatus(percentPureSodium)


    -- PureLithium Variables 
    local maxPureLithium = 10400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureLithium = 0.53 --export:
    if useL == 1 then
        massPureLithium = round(math.ceil(PureLithium.getItemsMass()/weightPureLithium),1)
    elseif useL == 0 then  
        massPureLithium = round(math.ceil(PureLithium.getItemsMass()),1)
    end
    local percentPureLithium = math.ceil(((math.ceil((PureLithium.getItemsMass()/weightPureLithium) - 0.5)/maxPureLithium)*100))
    local statusPureLithium = pureStatus(percentPureLithium)
        
    -- PureNickel Variables
    local maxPureNickel = 10400 --export: This is the maximum mass allowed in container. Update as needed
    local weightPureNickel = 8.91 --export:
    if useL == 1 then
        massPureNickel = round(math.ceil(PureNickel.getItemsMass()/weightPureNickel),1)
    elseif useL == 0 then
        massPureNickel = round(math.ceil(PureNickel.getItemsMass()),1)
    end
    local percentPureNickel = math.ceil(((math.ceil((PureNickel.getItemsMass()/weightPureNickel) - 0.5)/maxPureNickel)*100))
    local statusPureNickel = pureStatus(percentPureNickel)

    -- PureSilver Variables
    local maxPureSilver = 10400 --export:;This is the maximum mass allowed in container. Update as needed
    local weightPureSilver = 10.49 --export:
    if useL == 1 then
        massPureSilver = round(math.ceil(PureSilver.getItemsMass()/weightPureSilver),1)
    elseif useL == 0 then
        massPureSilver = round(math.ceil(PureSilver.getItemsMass()),1)
    end
    local percentPureSilver = math.ceil(((math.ceil((PureSilver.getItemsMass()/weightPureSilver) - 0.5)/maxPureSilver)*100))
    local statusPureSilver = pureStatus(percentPureSilver)

    -- Pure Sulfur Variables
    local maxPureSulfur = 10400 --export:;This is the maximum mass allowed in container. Update as needed
    local weightPureSulfur = 1.82 --export:
    if useL == 1 then
        massPureSulfur = round(math.ceil(PureSulfur.getItemsMass()/weightPureSulfur),1)
    elseif useL == 0 then
        massPureSulfur = round(math.ceil(PureSulfur.getItemsMass()),1)
    end
    local percentPureSulfur = math.ceil(((math.ceil((PureSulfur.getItemsMass()/weightPureSulfur) - 0.5)/maxPureSulfur)*100))
    local statusPureSulfur = pureStatus(percentPureSulfur)

    html = [[
    <div class="bootstrap">
    <h1 style="
        font-size: 8em;
    ">T2 Pure Status</h1>
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
            <th>Pure Sodium</th>
            <th>]]..massPureSodium..unitMeasure..[[</th>
            <th>]]..percentPureSodium..[[%</th>
            ]]..statusPureSodium..[[
        </tr>
        <tr>
            <th>Pure Chromium</th>
            <th>]]..massPureChromium..unitMeasure..[[</th>
            <th>]]..percentPureChromium..[[%</th>
            ]]..statusPureChromium..[[
        </tr>
        <tr>
            <th>Pure Copper</th>
            <th>]]..massPureCopper..unitMeasure..[[</th>
            <th>]]..percentPureCopper..[[%</th>
            ]]..statusPureCopper..[[
        </tr>
        <tr>
            <th>Pure Calcium</th>
            <th>]]..massPureCalcium..unitMeasure..[[</th>
            <th>]]..percentPureCalcium..[[%</th>
            ]]..statusPureCalcium..[[
        </tr>
        
    </table>
    </div>
    ]]

    display1.setHTML(html)

    html = [[
    <div class="bootstrap">
    <h1 style="
        font-size: 8em;
    ">T3 Pure Status</h1>
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
            <th>Pure Nickel</th>
            <th>]]..massPureNickel..unitMeasure..[[</th>
            <th>]]..percentPureNickel..[[%</th>
            ]]..statusPureNickel..[[
        </tr>
        <tr>
            <th>Pure Lithium</th>
            <th>]]..massPureLithium..unitMeasure..[[</th>
            <th>]]..percentPureLithium..[[%</th>
            ]]..statusPureLithium..[[
        </tr>
        <tr>
            <th>Pure Sulfur</th>
            <th>]]..massPureSulfur..unitMeasure..[[</th>
            <th>]]..percentPureSulfur..[[%</th>
            ]]..statusPureSulfur..[[
        </tr>
        <tr>
            <th>Pure Silver</th>
            <th>]]..massPureSilver..unitMeasure..[[</th>
            <th>]]..percentPureSilver..[[%</th>
            ]]..statusPureSilver..[[
        </tr>
        
    </table>
    </div>
    ]]

    display2.setHTML(html)
end
unit.setTimer('updateTable', 1)