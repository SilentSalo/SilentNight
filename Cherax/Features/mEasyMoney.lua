FeatureMgr.AddFeature(easyGive30m.hash, easyGive30m.name, easyGive30m.type, easyGive30m.desc, function(f)
    easyGive30m.func()
end)

for i = 1, 5 do
    FeatureMgr.AddFeature(easyLoops[i].hash, easyLoops[i].name, easyLoops[i].type, easyLoops[i].desc, function(f)
    end)
end
