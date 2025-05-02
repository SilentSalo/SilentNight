FeatureMgr.AddFeature(miscSuppliesBusiness.hash, miscSuppliesBusiness.name, miscSuppliesBusiness.type, miscSuppliesBusiness.desc, function(f)
end)
    :SetList(miscSuppliesBusiness.list:GetNames())

FeatureMgr.AddFeature(miscSuppliesResupply.hash, miscSuppliesResupply.name, miscSuppliesResupply.type, miscSuppliesResupply.desc, function(f)
    local business = miscSuppliesBusiness.list[FeatureMgr.GetFeatureListIndex(miscSuppliesBusiness.hash) + 1].index
    miscSuppliesResupply.func(business)
end)
