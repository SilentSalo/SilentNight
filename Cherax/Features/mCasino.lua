FeatureMgr.AddFeature(casinoLuckyWheelSelect.hash, casinoLuckyWheelSelect.name, casinoLuckyWheelSelect.type, casinoLuckyWheelSelect.desc, function(f)
end)
    :SetList(casinoLuckyWheelSelect.list:GetNames())

FeatureMgr.AddFeature(casinoLuckyWheelGive.hash, casinoLuckyWheelGive.name, casinoLuckyWheelGive.type, casinoLuckyWheelGive.desc, function(f)
    local prize = casinoLuckyWheelSelect.list[FeatureMgr.GetFeatureListIndex(casinoLuckyWheelSelect.hash) + 1].index
    casinoLuckyWheelGive.func(prize)
end)

FeatureMgr.AddFeature(casinoSlotsWin.hash, casinoSlotsWin.name, casinoSlotsWin.type, casinoSlotsWin.desc, function(f)
    casinoSlotsWin.func()
end)

FeatureMgr.AddFeature(casinoSlotsLose.hash, casinoSlotsLose.name, casinoSlotsLose.type, casinoSlotsLose.desc, function(f)
    casinoSlotsLose.func()
end)

FeatureMgr.AddFeature(casinoRouletteLand13.hash, casinoRouletteLand13.name, casinoRouletteLand13.type, casinoRouletteLand13.desc, function(f)
    casinoRouletteLand13.func()
end)

FeatureMgr.AddFeature(casinoRouletteLand16.hash, casinoRouletteLand16.name, casinoRouletteLand16.type, casinoRouletteLand16.desc, function(f)
    casinoRouletteLand16.func()
end)

FeatureMgr.AddFeature(casinoBlackjackCard.hash, casinoBlackjackCard.name, casinoBlackjackCard.type, casinoBlackjackCard.desc, function(f)
end)

FeatureMgr.AddFeature(casinoBlackjackReveal.hash, casinoBlackjackReveal.name, casinoBlackjackReveal.type, casinoBlackjackReveal.desc, function(f)
    if IsScriptRunning(eScript.World.Casino.Blackjack.name) then
        if eLocal.World.Casino.Blackjack.CurrentTable:Get() ~= -1 then
            local dealersCard = eLocal.World.Casino.Blackjack.Dealer.FirstCard:Get()
            FeatureMgr.GetFeature(casinoBlackjackCard.hash):SetStringValue(GetCardName(dealersCard))
        else
            FeatureMgr.GetFeature(casinoBlackjackCard.hash):SetStringValue("Not at a table!")
        end
    else
        FeatureMgr.GetFeature(casinoBlackjackCard.hash):SetStringValue("Not in Casino!")
    end
end)

FeatureMgr.AddFeature(casinoBlackjackTrick.hash, casinoBlackjackTrick.name, casinoBlackjackTrick.type, casinoBlackjackTrick.desc, function(f)
    casinoBlackjackTrick.func()
    casinoBlackjackReveal.func()
end)

FeatureMgr.AddFeature(casinoPokerMyCards.hash, casinoPokerMyCards.name, casinoPokerMyCards.type, casinoPokerMyCards.desc, function(f)
end)

FeatureMgr.AddFeature(casinoPokerCards.hash, casinoPokerCards.name, casinoPokerCards.type, casinoPokerCards.desc, function(f)
end)

FeatureMgr.AddFeature(casinoPokerReveal.hash, casinoPokerReveal.name, casinoPokerReveal.type, casinoPokerReveal.desc, function(f)
    if IsScriptRunning(eScript.World.Casino.Poker.name) then
        if eLocal.World.Casino.Poker.CurrentTable:Get() ~= -1 then
            local myCards      = GetPokerCards(PLAYER_ID)
            local dealersCards = GetPokerCards(GetPokerPlayersCount() + 1)
            FeatureMgr.GetFeature(casinoPokerMyCards.hash):SetStringValue(myCards)
            FeatureMgr.GetFeature(casinoPokerCards.hash):SetStringValue(dealersCards)
        else
            FeatureMgr.GetFeature(casinoPokerMyCards.hash):SetStringValue("Not at a table!")
            FeatureMgr.GetFeature(casinoPokerCards.hash):SetStringValue("Not at a table!")
        end
    else
        FeatureMgr.GetFeature(casinoPokerMyCards.hash):SetStringValue("Not in Casino!")
        FeatureMgr.GetFeature(casinoPokerCards.hash):SetStringValue("Not in Casino!")
    end
end)

FeatureMgr.AddFeature(casinoPokerGive.hash, casinoPokerGive.name, casinoPokerGive.type, casinoPokerGive.desc, function(f)
    casinoPokerGive.func()
    casinoPokerReveal.func()
end)

FeatureMgr.AddFeature(casinoPokerTrick.hash, casinoPokerTrick.name, casinoPokerTrick.type, casinoPokerTrick.desc, function(f)
    casinoPokerTrick.func()
    casinoPokerReveal.func()
end)

FeatureMgr.AddFeature(casinoBypass.hash, casinoBypass.name, casinoBypass.type, casinoBypass.desc, function(f)
    casinoBypass.func()
end)

FeatureMgr.AddFeature(casinoSelect.hash, casinoSelect.name, casinoSelect.type, casinoSelect.desc, function(f)
end)
    :SetDefaultValue(0)
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(50000)
    :Reset()

FeatureMgr.AddFeature(casinoApply.hash, casinoApply.name, casinoApply.type, casinoApply.desc, function(f)
    local limit = FeatureMgr.GetFeature(casinoSelect.hash):GetIntValue()
    casinoApply.func(limit)
end)
