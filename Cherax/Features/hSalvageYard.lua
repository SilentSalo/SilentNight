for i = 1, 3 do
    FeatureMgr.AddFeature(salvageSlotsRobbery[i].hash, salvageSlotsRobbery[i].name, salvageSlotsRobbery[i].type, salvageSlotsRobbery[i].desc, function(f)
    end)
        :SetList(salvageSlotsRobbery[i].list:GetNames())

    FeatureMgr.AddFeature(salvageSlotsVehicle[i].hash, salvageSlotsVehicle[i].name, salvageSlotsVehicle[i].type, salvageSlotsVehicle[i].desc, function(f)
    end)
        :SetList(salvageSlotsVehicle[i].list:GetNames())

    FeatureMgr.AddFeature(salvageSlotsMod[i].hash, salvageSlotsMod[i].name, salvageSlotsMod[i].type, salvageSlotsMod[i].desc, function(f)
    end)
        :SetList(salvageSlotsMod[i].list:GetNames())

    FeatureMgr.AddFeature(salvageSlotsKeep[i].hash, salvageSlotsKeep[i].name, salvageSlotsKeep[i].type, salvageSlotsKeep[i].desc, function(f)
    end)
        :SetList(salvageSlotsKeep[i].list:GetNames())

    FeatureMgr.AddFeature(salvageSlotsApply[i].hash, salvageSlotsApply[i].name, salvageSlotsApply[i].type, salvageSlotsApply[i].desc, function(f)
        local robbery      = salvageSlotsRobbery[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsRobbery[i].hash) + 1].index
        local vehicle      = salvageSlotsVehicle[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsVehicle[i].hash) + 1].index
        local modification = salvageSlotsMod[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsMod[i].hash) + 1].index
        local keep         = salvageSlotsKeep[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsKeep[i].hash) + 1].index
        salvageSlotsApply[i].func(robbery, vehicle, modification, keep)
    end)
end

FeatureMgr.AddFeature(salvageApplyAll.hash, salvageApplyAll.name, salvageApplyAll.type, salvageApplyAll.desc, function(f)
    local params = {}
    for i = 1, 3 do
        local robbery      = salvageSlotsRobbery[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsRobbery[i].hash) + 1].index
        local vehicle      = salvageSlotsVehicle[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsVehicle[i].hash) + 1].index
        local modification = salvageSlotsMod[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsMod[i].hash) + 1].index
        local keep         = salvageSlotsKeep[i].list[FeatureMgr.GetFeatureListIndex(salvageSlotsKeep[i].hash) + 1].index
        table.insert(params, robbery)
        table.insert(params, vehicle)
        table.insert(params, modification)
        table.insert(params, keep)
    end
    salvageApplyAll.func(table.unpack(params))
end)

FeatureMgr.AddFeature(salvageComplete.hash, salvageComplete.name, salvageComplete.type, salvageComplete.desc, function(f)
    salvageComplete.func()
end)

FeatureMgr.AddFeature(salvageReset.hash, salvageReset.name, salvageReset.type, salvageReset.desc, function(f)
    salvageReset.func()
end)

FeatureMgr.AddFeature(salvageReload.hash, salvageReload.name, salvageReload.type, salvageReload.desc, function(f)
    salvageReload.func()
end)

FeatureMgr.AddFeature(salvageCooldown.hash, salvageCooldown.name, salvageCooldown.type, salvageCooldown.desc, function(f)
    salvageCooldown.func()
end)

FeatureMgr.AddFeature(salvageWeekly.hash, salvageWeekly.name, salvageWeekly.type, salvageWeekly.desc, function(f)
    salvageWeekly.func()
end)

for i = 1, 3 do
    FeatureMgr.AddFeature(salvageSlotsAvailable[i].hash, salvageSlotsAvailable[i].name, salvageSlotsAvailable[i].type, salvageSlotsAvailable[i].desc, function(f)
        salvageSlotsAvailable[i].func()
    end)
end

FeatureMgr.AddFeature(salvageSetup.hash, salvageSetup.name, salvageSetup.type, salvageSetup.desc, function(f)
    salvageSetup.func(f:IsToggled())
end)

FeatureMgr.AddFeature(salvageClaim.hash, salvageClaim.name, salvageClaim.type, salvageClaim.desc, function(f)
    salvageClaim.func(f:IsToggled())
end)

FeatureMgr.AddFeature(salvageSalvage.hash, salvageSalvage.name, salvageSalvage.type, salvageSalvage.desc, function(f)
end)
    :SetDefaultValue(0.8)
    :SetLimitValues(0.0, 3.0)
    :SetStepSize(0.1)
    :Reset()

for i = 1, 3 do
    FeatureMgr.AddFeature(salvageSlotsValue[i].hash, salvageSlotsValue[i].name, salvageSlotsValue[i].type, salvageSlotsValue[i].desc, function(f)
    end)
        :SetDefaultValue(0)
        :SetLimitValues(0, 1000000)
        :SetStepSize(100000)
        :Reset()
end

FeatureMgr.AddFeature(salvageApply.hash, salvageApply.name, salvageApply.type, salvageApply.desc, function(f)
    local salvageMultiplier = FeatureMgr.GetFeature(salvageSalvage.hash):GetFloatValue()
    local sellValues        = {}
    for i = 1, 3 do
        table.insert(sellValues, FeatureMgr.GetFeature(salvageSlotsValue[i].hash):GetIntValue())
    end
    salvageApply.func(salvageMultiplier, table.unpack(sellValues))
end)
