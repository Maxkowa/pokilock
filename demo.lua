local unlocker, awful, demo = ...
local player, target, focus, healer, enemyHealer = awful.player, awful.target, awful.focus, awful.healer, awful.enemyHealer
awful.DevMode = true

---Spells
poki.warlock = {
poki.warlock.demonology = awful.Actor:New({ spec = 5, class = "warlock" }),
}
local demo = poki.warlock.demonology
local NewSell = awful.NewSpell
local NewItem = awful.NewItem

awful.Populate({
    banish = NewSpell({710, 18647}, { effect = "magic", targeted = true }),
    challengingHowl = NewSpell({5484}, { effect = "magic", targeted = true }),
    createHealthstone = NewSpell({6201, 6202, 5699, 11729, 11730, 27230}, { beneficial = true }),
    demonArmor = NewSpell({706, 1086, 11733, 11734, 11735, 27260, 47889, 47890}, { beneficial = true }),
    demonCharge = NewSpell({54785}, { damage = "magic", targeted = true }),
    demonSkin = NewSpell({687, 696}, { beneficial = true }),
    demonicCircleSummon = NewSpell({48018}, { beneficial = true }),
    demonicCircleTeleport = NewSpell({48020}, { beneficial = true }),
    demonicEmpowerment = NewSpell({47193}, { beneficial = true }),
    detectInvisibility = NewSpell({132}, { beneficial = true }),
    enslaveDemon = NewSpell({1098, 11726, 11725, 19444, 19443, 19442, 19445, 61191}, { effect = "magic", targeted = true }),
    eyeOfKilrogg = NewSpell({126}, { beneficial = true }),
    felArmor = NewSpell({28176, 47893, 47894, 47895}, { beneficial = true }),
    felDomination = NewSpell({18708}, { beneficial = true }),
    healthFunnel = NewSpell({755, 3698, 3699, 3700, 11693, 11694, 11695, 27259}, { beneficial = true }),
    immolationAuraDemon = NewSpell({50589}, { damage = "magic", targeted = true }),
    inferno = NewSpell({1122}, { damage = "magic", targeted = true }),
    manaFeed = NewSpell({100}, { beneficial = true }),
    metamorphosis = NewSpell({47241, 61610, 59672}, { beneficial = true }),
    ritualOfDoom = NewSpell({18540}, { beneficial = true }),
    ritualOfDoom = NewSpell({58887, 29893}, { beneficial = true }),
    ritualOfSummoning = NewSpell({698}, { beneficial = true }),
    senseDemons = NewSpell({5500}, { beneficial = true }),
    shadowCleave = NewSpell({50581}, { damage = "shadow", targeted = true }),
    shadowWard = NewSpell({6229, 28610, 28611, 28612, 47891, 47892}, { beneficial = true }),
    soulLink = NewSpell({19028}, { beneficial = true }),
    soulshatter = NewSpell({29858}, { beneficial = true }),
    summonFelguard = NewSpell({30146}, { beneficial = true }),
    summonFelhunter = NewSpell({691}, { beneficial = true }),
    summonImp = NewSpell({688}, { beneficial = true }),
    summonSuccubus = NewSpell({712}, { beneficial = true }),
    summonVoidwalker = NewSpell({697}, { beneficial = true }),
    unendingBreath = NewSpell({5697}, { beneficial = true }),
    createFirestone = NewSpell({17951, 17952, 17953, 17954, 17955, 27230}, { beneficial = true }),
    createSoulstone = NewSpell({20707, 20762, 20763, 20764, 20765, 20766, 27238}, { beneficial = true }),
    createSpellstone = NewSpell({2362, 17727, 17728, 17729, 17730, 27230}, { beneficial = true }),
    amplifyCurse = NewSpell({18223}, { effect = "magic", targeted = true }),
    atrocity = NewSpell({12345}, { effect = "magic", targeted = true }),
    corruption = NewSpell({172, 6222, 6223, 7648, 11671, 11672, 25311, 27216}, { damage = "shadow", targeted = true }),
    curseOfAgony = NewSpell({980, 1014, 6217, 11711, 11712, 11713, 27218}, { damage = "shadow", targeted = true }),
    curseOfDoom = NewSpell({603, 30910, 47867}, { damage = "shadow", targeted = true }),
    curseOfExhaustion = NewSpell({18223}, { effect = "magic", targeted = true }),
    curseOfElements = NewSpell({1490, 11721, 11722, 27228, 47865}, { effect = "magic", targeted = true }),
    curseOfTongues = NewSpell({1714, 11719}, { effect = "magic", targeted = true }),
    curseOfWeakness = NewSpell({702, 1108, 6205, 7646, 11707, 11708, 27228}, { effect = "magic", targeted = true }),
    darkPact = NewSpell({18220, 18937, 18938, 27265, 59092}, { beneficial = true }),
    deathCoil = NewSpell({6789, 17925, 17926, 27223, 47859, 47860}, { damage = "shadow", targeted = true }),
    drainLife = NewSpell({689, 699, 709, 7651, 11699, 11700, 27263, 47857, 47858}, { damage = "shadow", targeted = true }),
    drainMana = NewSpell({5138}, { target = true }),
    fear = NewSpell({5782, 6213, 6215}, { effect = "magic", targeted = true }),
    haunt = NewSpell({48181, 59164, 59165, 59166}, { damage = "shadow", targeted = true }),
    howlOfTerror = NewSpell({5484, 17928}, { effect = "magic", targeted = true }),
    lifeTap = NewSpell({1454, 1455, 1456, 11687, 11688, 11689, 27222, 47855, 47856}, { beneficial = true }),
    seedOfCorruption = NewSpell({27243, 47843, 47844}, { damage = "shadow", targeted = true }),
    unstableAffliction = NewSpell({30108, 30404, 30405, 47843, 47844}, { damage = "shadow", targeted = true }),
    drainSoul = NewSpell({1120, 8288, 8289, 11675, 11676, 27217}, { damage = "shadow", targeted = true }),
    chaosBolt = NewSpell({50796, 59172, 59173, 59174, 59175}, { damage = "fire", targeted = true }),
    conflagrate = NewSpell({17962}, { damage = "fire", targeted = true }),
    demonicImmolate = NewSpell({75445}, { damage = "fire", targeted = true }),
    hellfire = NewSpell({1949, 11683, 11684, 11685, 27213}, { damage = "fire", targeted = false }),
    immolate = NewSpell({348, 707, 1094, 2941, 11665, 11667, 11668, 25309, 27215, 47837, 47838}, { damage = "fire", targeted = true }),
    incinerate = NewSpell({29722, 32231, 47837, 47838}, { damage = "fire", targeted = true }),
    rainOfFire = NewSpell({5740, 6219, 11677, 11678, 27212, 47836, 47837}, { damage = "fire", targeted = false }),
    searingPain = NewSpell({17919, 17920, 17921, 17922, 17923, 17924, 27210, 47843, 47844, 47845}, { damage = "shadow", targeted = true }),
    shadowBolt = NewSpell({686, 695, 705, 1088, 1106, 7641, 11659, 11660, 25307, 27209, 47843, 47808, 47809}, { damage = "shadow", targeted = true }),
    shadowburn = NewSpell({17877, 18867, 18868, 18869, 18870, 18871, 47843, 47844, 47845, 47846, 47847}, { damage = "shadow", targeted = true }),
    shadowflame = NewSpell({47897, 61290}, { damage = "fire", targeted = true }),
    shadowfury = NewSpell({30283, 30413, 30414, 47847, 47848}, { damage = "shadow", targeted = true }),
    soulFire = NewSpell({6353, 17924, 27211, 47843, 47844, 47845}, { damage = "fire", targeted = true }),
}, Demo, getfenv(1))

awful.PopulateItems({
    healthstone = NewItem({5512, 19004, 19005, 19006, 19007, 19008}, { beneficial = true }),
    soulstone = NewItem({5232, 16892, 16893, 16895, 22116, 22117, 27239}, { beneficial = true }),
    soulShard = NewItem({6265, 6266, 6267, 6268, 20752, 20756, 20757, 20758, 20759, 20760, 20761, 27230}, { beneficial = true }),
    hyperspeedAccelartors = NewItem({54998}, { beneficial = true }),
})

awful.powerTypes = {
    mana = "Mana",
}

-- Create spell callbacks for Demonology Warlock spells
lifeTap:Callback(function(spell)
    if player:HasBuff(63321) and player.power.mana < 30 then
        return
    end
    spell:Cast()
end)

curseOfDoom:Callback(function(spell)
    if target.debuff("Curse of Doom") then
        return
    end
    spell:Cast(target)
end)

immolate:Callback(function(spell)
    local numImmolateDebuffs = 0
    for _, unit in ipairs(awful.units) do
        if unit:IsInCombat() and not unit.debuff("Immolate") then
            numImmolateDebuffs = numImmolateDebuffs + 1
            if numImmolateDebuffs > 3 then
                return
            end
        end
    end
    if not target.debuff("Immolate") then
        spell:Cast(target)
    end
end)

metamorphosis:Callback(function(spell)
    spell:Cast()
end)

immolationAura:Callback(function(spell)
    local numImmolationAuraDebuffs = 0
    for _, unit in ipairs(awful.units) do
        if unit:IsInCombat() and unit.debuff("Immolation Aura") then
            numImmolationAuraDebuffs = numImmolationAuraDebuffs + 1
            if numImmolationAuraDebuffs > 3 then
                return
            end
        end
    end
    if target:IsInRange(spell) and target.timeToDie > 15 and not target.debuff("Immolation Aura") then
        spell:Cast()
    end
end)

demonicEmpowerment:Callback(function(spell)
    if Demo.pet and Demo.pet:IsSummoned("Felguard") then
        spell:Cast()
    end
end)

soulFire:Callback(function(spell)
    if target.health.percent <= 35 then
        spell:Cast(target)
    end
end)

corruption:Callback(function(spell)
    local numCorruptionDebuffs = 0
    for _, unit in ipairs(awful.units) do
        if unit:IsInCombat() and not unit.debuff("Corruption") then
            numCorruptionDebuffs = numCorruptionDebuffs + 1
            if numCorruptionDebuffs > 3 then
                return
            end
        end
    end
    if not target.debuff("Corruption") and target.timeToDie > 18 then
        spell:Cast(target)
    end
end)

incinerate:Callback(function(spell)
    if player:HasBuff(12345) then
        spell:Cast(target)
    end
end)

shadowBolt:Callback(function(spell)
    if not target.debuff(17803) or target.debuff(17803).remains < 3 then
        spell:Cast(target)
    end
end)


seedOfCorruption:Callback(function(spell)
    local numEnemies = 0
    for _, unit in ipairs(awful.units) do
        if unit:IsInCombat() and unit:IsInRange(target) then
            numEnemies = numEnemies + 1
            if numEnemies > 3 then
                spell:Cast(target)
                return
            end
        end
    end
end)

shadowflame:Callback(function(spell)
    local numTargetsInRange = 0
    for _, unit in ipairs(awful.units) do
        if unit:IsInCombat() and unit:IsInRange(spell) then
            numTargetsInRange = numTargetsInRange + 1
            if numTargetsInRange > 3 then
                spell:Cast(target)
                return
            end
        end
    end
end)


demo:Init(function() 
    if player.mounted then return end 
    if player.casting or player.channeling then return end

    lifeTap()
    summonFelguard()
    shadowBolt()
    demonicEmpowerment()
    curseOfDoom()
    corruption()
    immolate()
    metamorphosis()
    immolationAura()
    soulFire()
    incinerate()
    shadowflame()
    seedOfCorruption()
end)










