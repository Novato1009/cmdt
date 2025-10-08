-- ===============================================================
-- SuperBeltfedQuantumBiomassGenerator v3.0.0
-- Autor: Novato1403
-- ===============================================================
-- Detección automática de todos los combustibles, incluyendo los de mods.
-- Ajuste de potencia progresiva (5 % → 50 %).
-- Supresión total de radiación en un radio de 50 km.
-- Cambios visuales dinámicos según tipo de combustible.
-- ===============================================================

RegisterHook("/Game/FactoryGame/-Shared/Blueprint/BP_GameState.BP_GameState_C:ReceiveBeginPlay", function(Context)
    print("⚡ SuperBeltfedQuantumBiomassGenerator inicializado con AutoFuelDetector™ y Contención Cuántica.")
    DetectAllFuels()
end)

local BASE_POWER = 5e+26
local CONTAINMENT_RADIUS = 5000000 -- 50 km de radio real
local dynamicFuelTable = {}

-- ===============================================================
-- 🔍 DETECCIÓN AUTOMÁTICA DE COMBUSTIBLES
-- ===============================================================
function DetectAllFuels()
    local allItems = FindAllOf("Class'/Script/FactoryGame.FGItemDescriptor'")
    local totalDetected = 0

    for _, item in ipairs(allItems) do
        local name = item:GetName()
        local bonus = 1.10

        if string.find(name, "Leaves") then
            bonus = 1.05
        elseif string.find(name, "Wood") then
            bonus = 1.10
        elseif string.find(name, "Biomass") then
            bonus = 1.15
        elseif string.find(name, "Coal") then
            bonus = 1.30
        elseif string.find(name, "Coke") then
            bonus = 1.35
        elseif string.find(name, "Oil") then
            bonus = 1.40
        elseif string.find(name, "Fuel") then
            bonus = 1.45
        elseif string.find(name, "Turbofuel") then
            bonus = 1.50
        elseif string.find(name, "Uranium") or string.find(name, "Plutonium") or string.find(name, "Nuclear") then
            bonus = 1.50
        elseif string.find(name, "Residue") then
            bonus = 1.42
        elseif string.find(name, "Alien") then
            bonus = 1.25
        elseif string.find(name, "Fabric") or string.find(name, "Mycelia") then
            bonus = 1.20
        else
            if string.find(name, "Fuel") or string.find(name, "Energy") or string.find(name, "Combust") then
                bonus = 1.35
            else
                bonus = 1.10
            end
        end

        dynamicFuelTable[name] = bonus
        totalDetected = totalDetected + 1
    end

    print("✅ AutoFuelDetector™: Combustibles detectados:", totalDetected)
end

-- ===============================================================
-- ⚙️ CONFIGURACIÓN INICIAL DEL GENERADOR
-- ===============================================================
RegisterHook("/Game/FactoryGame/Buildable/Factory/GeneratorBiomass/Build_GeneratorBiomass_C:UserConstructionScript", function(Context)
    local generator = Context:get()
    generator.mPowerProduction = BASE_POWER
    generator.mFuelConsumptionRate = 0.5
    generator.ContainmentField = nil
end)

-- ===============================================================
-- ☢️ CAMBIO DE POTENCIA Y EFECTOS SEGÚN COMBUSTIBLE
-- ===============================================================
RegisterHook("/Game/FactoryGame/Buildable/Factory/GeneratorBiomass/Build_GeneratorBiomass_C:OnFuelChanged", function(Context)
    local generator = Context:get()
    local fuelItem = generator.mCurrentFuelItem

    if fuelItem == nil then
        generator.mPowerProduction = BASE_POWER
        print("⚠️ Combustible no detectado, potencia base aplicada.")
        return
    end

    local fuelName = fuelItem:GetName()
    local bonus = dynamicFuelTable[fuelName] or 1.10
    local totalPower = BASE_POWER * bonus

    generator.mPowerProduction = totalPower

    -- ⚙️ Efectos visuales dinámicos
    if string.find(fuelName, "Uranium") or string.find(fuelName, "Plutonium") or string.find(fuelName, "Nuclear") then
        generator:SetColorParameter("CoreColor", { R = 0.1, G = 1.0, B = 0.1 }) -- Verde radiactivo
        ActivateContainmentField(generator)
        print("☢️ Radiación detectada: Contención cuántica activada.")
    elseif string.find(fuelName, "Turbofuel") or string.find(fuelName, "Fuel") then
        generator:SetColorParameter("CoreColor", { R = 0.1, G = 0.4, B = 1.0 }) -- Azul cuántico
        DeactivateContainmentField(generator)
    else
        generator:SetColorParameter("CoreColor", { R = 1.0, G = 0.5, B = 0.1 }) -- Naranja clásico
        DeactivateContainmentField(generator)
    end

    print(string.format("🔥 Combustible: %s | Bonificación: +%d%% | Potencia: %.2e YW",
        fuelName, math.floor((bonus - 1) * 100), totalPower))
end)

-- ===============================================================
-- 🛡️ CAMPO DE CONTENCIÓN (SUPRESIÓN DE RADIACIÓN)
-- ===============================================================

function ActivateContainmentField(generator)
    if generator.ContainmentField then return end

    local location = generator:GetActorLocation()
    local field = SpawnBlueprint("/Game/FactoryGame/-Shared/Blueprint/BP_RadShield.BP_RadShield_C", location)
    field:SetRadius(CONTAINMENT_RADIUS)
    field:SetShieldStrength(999999)
    generator.ContainmentField = field

    print("🧪 Campo de contención cuántica activo. Radio:", CONTAINMENT_RADIUS / 100, "m")
end

function DeactivateContainmentField(generator)
    if generator.ContainmentField then
        generator.ContainmentField:DestroyActor()
        generator.ContainmentField = nil
        print("🔵 Campo de contención cuántica desactivado.")
    end
end
