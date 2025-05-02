FeatureMgr.AddFeature(easyGive30m.hash, easyGive30m.name, easyGive30m.type, easyGive30m.desc, function(f)
    easyGive30m.func()
end)

for i = 1, #easyLoops do
    FeatureMgr.AddFeature(easyLoops[i].hash, easyLoops[i].name, easyLoops[i].type, easyLoops[i].desc, function(f)
    end)
end

FeatureMgr.AddFeature(easyLoop5kDelay.hash, easyLoop5kDelay.name, easyLoop5kDelay.type, easyLoop5kDelay.desc, function(f)
end)
    :SetDefaultValue(1.5)
    :SetLimitValues(1.0, 5.0)
    :Reset()

for i = 1, #easyLoopDelays do
    FeatureMgr.AddFeature(easyLoopDelays[i].hash, easyLoopDelays[i].name, easyLoopDelays[i].type, easyLoopDelays[i].desc, function(f)
    end)
        :SetDefaultValue(0.333)
        :SetLimitValues(0.333, 5.0)
        :Reset()
end

FeatureMgr.AddFeature(easyLoop300kDelay.hash, easyLoop300kDelay.name, easyLoop300kDelay.type, easyLoop300kDelay.desc, function(f)
end)
    :SetDefaultValue(1.0)
    :SetLimitValues(1.0, 5.0)
    :Reset()
