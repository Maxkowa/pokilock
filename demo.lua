local Unlocker, awful, poki = ...
local player = awful.player
local pet = awful.pet
local wasCasting = {}
local target, focus, healer, enemyHealer = awful.target, awful.focus, awful.healer, awful.enemyHealer
awful.DevMode = true
poki.warlock = {}
poki.warlock.demo = awful.Actor:New({ spec = 2, class = "warlock"})
local demo = poki.warlock.demo
local spell = awful.Spell
local NewItem = awful.NewItem

--TODO
-- CHECK SEED FIRST
--Fix Incinerate 3x cast + Cast delay
-- soullink
-- corruption if more then 1 warlock
--SoulFire only fish for buff

awful.Populate({
    banish = spell({710, 18647}, { effect = "magic", targeted = true }),
    challengingHowl = spell({5484}, { effect = "magic", targeted = true }),
    createHealthstone = spell({6201, 6202, 5699, 11729, 11730, 27230}, { beneficial = true }),
    demonArmor = spell({706, 1086, 11733, 11734, 11735, 27260, 47889, 47890}, { beneficial = true }),
    demonCharge = spell({54785}, { damage = "magic", targeted = true }),
    demonSkin = spell({687, 696}, { beneficial = true }),
    demonicCircleSummon = spell({48018}, { beneficial = true }),
    demonicCircleTeleport = spell({48020}, { beneficial = true }),
    demonicEmpowerment = spell({47193}, { beneficial = true }),
    detectInvisibility = spell({132}, { beneficial = true }),
    enslaveDemon = spell({1098, 11726, 11725, 19444, 19443, 19442, 19445, 61191}, { effect = "magic", targeted = true }),
    eyeOfKilrogg = spell({126}, { beneficial = true }),
    felArmor = spell({28176, 47893, 47894, 47895}, { beneficial = true }),
    felDomination = spell({18708}, { beneficial = true }),
    healthFunnel = spell({755, 3698, 3699, 3700, 11693, 11694, 11695, 27259}, { beneficial = true }),
    immolationAura = spell({50589}, { damage = "magic", targeted = true }),
    inferno = spell({1122}, { damage = "magic", targeted = true }),
    manaFeed = spell({100}, { beneficial = true }),
    metamorphosis = spell({47241, 61610, 59672}, { beneficial = true }),
    ritualOfDoom = spell({18540}, { beneficial = true }),
    ritualOfSummoning = spell({698}, { beneficial = true }),
    senseDemons = spell({5500}, { beneficial = true }),
    shadowCleave = spell({50581}, { damage = "magic", targeted = true }),
    shadowWard = spell({6229, 28610, 28611, 28612, 47891, 47892}, { beneficial = true }),
    soulLink = spell({19028}, { beneficial = true }),
    soulshatter = spell({29858}, { beneficial = true }),
    summonFelhunter = spell({691}, { beneficial = true }),
    summonImp = spell({688}, { beneficial = true }),
    summonSuccubus = spell({712}, { beneficial = true }),
    summonVoidwalker = spell({697}, { beneficial = true }),
    unendingBreath = spell({5697}, { beneficial = true }),
    createFirestone = spell({17951, 17952, 17953, 17954, 17955, 27230}, { beneficial = true }),
    createSoulstone = spell({20707, 20762, 20763, 20764, 20765, 20766, 27238}, { beneficial = true }),
    createSpellstone = spell({47888}, { beneficial = true }),
    amplifyCurse = spell({18223}, { effect = "magic", targeted = true }),
    atrocity = spell({12345}, { effect = "magic", targeted = true }),
    corruption = spell({172, 6222, 6223, 7648, 11671, 11672, 25311, 27216}, { damage = "magic", targeted = true }),
    curseOfAgony = spell({980, 1014, 6217, 11711, 11712, 11713, 27218}, { damage = "magic", targeted = true }),
    curseOfDoom = spell({603, 30910, 47867}, { damage = "magic", targeted = true }),
    curseOfExhaustion = spell({18223}, { effect = "magic", targeted = true }),
    curseOfElements = spell({1490, 11721, 11722, 27228, 47865}, { effect = "magic", targeted = true }),
    curseOfTongues = spell({1714, 11719}, { effect = "magic", targeted = true }),
    curseOfWeakness = spell({702, 1108, 6205, 7646, 11707, 11708, 27228}, { effect = "magic", targeted = true }),
    darkPact = spell({18220, 18937, 18938, 27265, 59092}, { beneficial = true }),
    deathCoil = spell({6789, 17925, 17926, 27223, 47859, 47860}, { damage = "magic", targeted = true }),
    drainLife = spell({689, 699, 709, 7651, 11699, 11700, 27263, 47857, 47858}, { damage = "magic", targeted = true }),
    drainMana = spell({5138}, { target = true }),
    fear = spell({5782, 6213, 6215}, { effect = "magic", targeted = true }),
    haunt = spell({48181, 59164, 59165, 59166}, { damage = "magic", targeted = true }),
    howlOfTerror = spell({5484, 17928}, { effect = "magic", targeted = true }),
    lifeTap = spell({1454, 1455, 1456, 11687, 11688, 11689, 27222, 47855, 47856}, { beneficial = true }),
    seedOfCorruption = spell({27243, 47843, 47844}, { damage = "magic", targeted = true}),
    unstableAffliction = spell({30108, 30404, 30405, 47843, 47844}, { damage = "magic", targeted = true }),
    drainSoul = spell({1120, 8288, 8289, 11675, 11676, 27217}, { damage = "magic", targeted = true }),
    chaosBolt = spell({50796, 59172, 59173, 59174, 59175}, { damage = "magic", targeted = true }),
    conflagrate = spell({17962}, { damage = "magic", targeted = true }),
    demonicImmolate = spell({75445}, { damage = "magic", targeted = true }),
    hellfire = spell({1949, 11683, 11684, 11685, 27213}, { damage = "magic", targeted = false }),
    immolate = spell({47811}, { damage = "magic", targeted = true }),
    incinerate = spell({29722, 32231, 47837, 47838}, { damage = "magic", targeted = true }),
    rainOfFire = spell({5740, 6219, 11677, 11678, 27212, 47836, 47837}, { damage = "magic", targeted = false }),
    searingPain = spell({17919, 17920, 17921, 17922, 17923, 17924, 27210, 47843, 47844, 47845}, { damage = "magic", targeted = true }),
    shadowBolt = spell({686, 695, 705, 1088, 1106, 7641, 11659, 11660, 25307, 27209, 47843, 47808, 47809}, { damage = "magic", targeted = true }),
    shadowBoltFiller = spell({686, 695, 705, 1088, 1106, 7641, 11659, 11660, 25307, 27209, 47843, 47808, 47809}, { damage = "magic", targeted = true }),
    shadowburn = spell({17877, 18867, 18868, 18869, 18870, 18871, 47843, 47844, 47845, 47846, 47847}, { damage = "magic", targeted = true }),
    shadowflame = spell({47897, 61290}, { damage = "magic", targeted = true }),
    shadowfury = spell({30283, 30413, 30414, 47847, 47848}, { damage = "magic", targeted = true }),
    soulFire = spell({6353, 17924, 27211, 47843, 47844, 47845}, { damage = "magic", targeted = true }),
    felguard = spell({30146}, { beneficial = true , targeted = false }),
    spellstoneTest = spell({41196}, { beneficial = true }),
}, demo, getfenv(1))

awful.powerTypes = {
	["mana"] = 0,
	["rage"] = 1,
	["focus"] = 2,
	["energy"] = 3,
	["combopoints"] = 4,
	["cp"] = 4,
	["runes"] = 5,
	["runicpower"] = 6,
	["soulshards"] = 7,
	["shards"] = 7,
	["astralpower"] = 8,
	["ap"] = 8,
	["lunarpower"] = 8,
	["holypower"] = 9,
	["alternatepower"] = 10,
	["maelstrom"] = 11,
	["chi"] = 12,
	["insanity"] = 13,
	["arcanecharges"] = 16,
	["fury"] = 17,
	["pain"] = 18,
    ["essence"] = 19
}

-- RGBA color scheme
local yellow = {148, 130, 201, 1}
local white = {255, 255, 255, 1}
local dark = {21, 21, 21, 0.45}
-- all ui saved variables are stored in `settings`
-- slash command to open the GUI is now `/example`
local gui, settings, cmd = awful.UI:New("pokilock", {
	title = "Pokilock",
	show = true, -- show on load by default
	colors = {
		-- color of our ui title in the top left
		title = yellow,
		-- primary is the primary text color
		primary = white,
		-- accent controls colors of elements and some element text in the UI. it should contrast nicely with the background.
		accent = yellow,
		background = dark,
	}
})

gui:Tab("Farm")
gui.tabs["Farm"]:Checkbox({
    text = "Farm",
    var = "farm", -- selected state = settings.farm
    tooltip = "Enable Farm",
})


gui:Tab("Curse")
gui.tabs["Curse"]:Checkbox({
    text = "Curse of Elements",
    var = "curseOfElements", -- selected state = settings.curseOfElements
    tooltip = "Enable Curse of Elements",
})

gui.tabs["Curse"]:Checkbox({
    text = "Curse of Doom",
    var = "curseOfDoom", -- selected state = settings.curseOfDoom
    tooltip = "Enable Curse of Doom",
})




local healthstone = awful.Item(36892, 36893, 36894)
local soulShard = awful.Item(6265)
local soulShardCount = GetItemCount(6265)
local soulstone = awful.Item(36895)
--- local spellstone = awful.Item(41196)


awful.Populate(items, actor, getfenv(1))

function WasCastingCheck()
    local time = awful.time
    if player.casting then
        wasCasting[player.castingid] = time
    end
    for spell, when in pairs(wasCasting) do
        if time - when > 0.100 + awful.buffer then
            wasCasting[spell] = nil
        end
    end
end

function _print(message)
    awful.alert(message)
end


createSoulstone:Callback(function(spell)
    if not player.combat then
        if soulstone.count == 0 then
            spell:Cast()
        end
    end
end)


local soulStoneCount = 0
local spellstone = awful.Item(41196) -- Create an Item object for the spellstone

createSpellstone:Callback(function(spell)
    if not player.combat then
        if soulStoneCount < 20 then
            RunMacroText("/run local n=0 for i=0,4 do for j=1,C_Container.GetContainerNumSlots(i) do local z=C_Container.GetContainerItemID(i,j) if z~=nil then if z==6265 then if n>19 then C_Container.PickupContainerItem(i,j) DeleteCursorItem() else n=n+1 end end end end end")
            if spellstone.count == 0 then
                spell:Cast()
            end
        end
    end
end)

function Buff()
    local spellstonelist = { 41196, 41191, 41192, 41193, 41194, 41195 }

    function _Use(item)
        local name, bag, slot = SecureCmdItemParse(item)
        if slot or GetItemInfo(name) then
            SecureCmdUseItem(name, bag, slot)
        end
    end

    local hasMH, mhExpires, _, _, hasOH, ohExpires, _ = GetWeaponEnchantInfo()

    if not (hasMH and mhExpires) and not player.moving then
        for i = 1, #spellstonelist do
            if GetItemCount(spellstonelist[i]) >= 1 and (C_Container.GetItemCooldown(spellstonelist[i])) == 0 then
                local CurrentWeapon = GetInventoryItemID("player", 16)
                local spellstonename = GetItemInfo(spellstonelist[i])
                if spellstonename then
                    _Use(spellstonename)
                    UseInventoryItem(16)
                    spellstonecount = 0
                end
            end
        end
    end
end

function UseHyperspeedAccelerators()
    -- Get the enchantment information for the hands slot
    local hasHandEnchant, handEnchantExpiration, _, _, _, _, _, _, _, handEnchantID = GetInventoryItemGems(10)

    -- Check if Hyperspeed Accelerators are active
    local hyperspeedAcceleratorsID = 54758 -- Replace with the actual spell ID of Hyperspeed Accelerators
    if hasHandEnchant and handEnchantID == hyperspeedAcceleratorsID then
        -- Hyperspeed Accelerators are active, no need to use them again
        return
    end

    -- Hyperspeed Accelerators are not active, try to use them
    if player.combat and target.enemy then
        -- Check if Hyperspeed Accelerators are available
        if GetItemCount(hyperspeedAcceleratorsID) >= 1 and (C_Container.GetItemCooldown(hyperspeedAcceleratorsID)) == 0 then
            _Use(GetItemInfo(hyperspeedAcceleratorsID))
            _print("Using Hyperspeed Accelerators")
        end
    end
end


felguard:Callback(function(spell)
    local felguardID = 30147
    if wasCasting[felguardID] then return end
    if not pet.exists then
      return spell:Cast()
    end
end)

lifeTap:Callback(function(spell)
        if player.mana > 22000 and player.buff(63321)then return end
            if player.mana < 10000 or not player.buff(63321) or not player.combat then
        spell:Cast()
    end
end)

curseOfDoom:Callback(function(spell)
    if target.enemy then
        if settings.curseOfDoom and not target.debuff(spell.id) then
            spell:Cast(target)
        end
    end
end)

curseOfElements:Callback(function(spell)
    if target.enemy then
        if settings.curseOfElements and not target.debuff("Curse of the Elements") then
            spell:Cast(target)
        end
    end
end)

immolate:Callback(function(spell)
    local immolateID = 47811
    if target.enemy then
        if wasCasting[immolateID] then return end
        if not target.debuff("Immolate") then
            spell:Cast(target)
        end
    end
end)

metamorphosis:Callback("burst", function(spell)
    if target.enemy then
        spell:Cast()
    end
end)

drainSoul:Callback(function(spell)
    if target.enemy then
        if settings.farm then
            spell:Cast(target)
        end
    end
end)

function countEnemiesInRange(range)
    local count = 0
    awful.enemies.loop(function(enemy)
        if enemy.distanceTo(player) <= range then
            count = count + 1
        end
    end)
    return count
end

immolationAura:Callback(function(spell)
    if countEnemiesInRange(10) > 2 then
        awful.enemies.loop(function(enemy)
            if enemy.distanceTo(player) <= 10 then
                spell:Cast(enemy)
            end
        end)
    end
end)



demonicEmpowerment:Callback(function(spell)
    if pet.exists then
        spell:Cast()
    end
end)


soulFire:Callback(function(spell)
    if target.enemy then
        if target.combat then
            if player.buff(63167) or target.hp <= 35 then
                spell:Cast(target)
            end
        end
    end
end)

corruption:Callback(function(spell)
    if target.enemy then
        if not target.debuff("Corruption") then
            spell:Cast(target)
        end
    end
end)

incinerate:Callback(function(spell)
    if target.enemy then
        if not player.buff(63167) then
            local casted = awful.enemies.loop(function(enemy)
                if enemy.combat and enemy.hp <= 35 then
                    return spell:Cast(enemy)
                end
            end)
            if casted then return end
        end
        if player.buff(71165) then
            spell:Cast(target)
        end
    end
end)

shadowBolt:Callback(function(spell)
    local shadowBoltID = 47809
    if target.enemy then
        if wasCasting[shadowBoltID] then return end
        if not target.debuff(17800) then
        spell:Cast(target)
        end
    end
end)

felArmor:Callback(function(spell)
    if not player.buff(47893) then
        spell:Cast()
    end
end)

shadowBoltFiller:Callback(function(spell)
    if target.enemy then
        spell:Cast(target)
    end
end)

seedOfCorruption:Callback(function(spell)
    if target.enemy then
        local numEnemiesNearTarget = 0
        for _, unit in ipairs(awful.units) do
            if unit.enemy and unit.distanceTo(target) <= 10 then
                numEnemiesNearTarget = numEnemiesNearTarget + 1
            end
        end
        if numEnemiesNearTarget >= 3 then
            local enemies = awful.enemies.get(target, 10)
            for _, enemy in ipairs(enemies) do
                spell:Cast(enemy)
            end
        end
    end
end)

shadowflame:Callback(function(spell)
    if target.enemy then
        local numTargetsInRange = 0
        for _, unit in ipairs(awful.units) do
            numTargetsInRange = numTargetsInRange + 1
            if numTargetsInRange > 3 then
                spell:Cast(target)
                return
            end
        end
    end
end)



demo:Init(function() 
    if awful.burst then
        metamorphosis("burst")
    end
    drainSoul()
    WasCastingCheck()
    if player.mounted then return end 
    if player.casting or player.channeling then return end
    Buff()
    createSpellstone()
    createSoulstone()
    felArmor()
    lifeTap()
    felguard()
    UseHyperspeedAccelerators()
    seedOfCorruption()
    shadowBolt()
    demonicEmpowerment()
    curseOfDoom()
    curseOfElements()
    corruption()
    immolate()
    incinerate()
    immolationAura()
    soulFire()
    shadowflame()
    shadowBoltFiller()
end)










