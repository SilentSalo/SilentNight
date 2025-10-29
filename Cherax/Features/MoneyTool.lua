--#region Money Tool

--#region Casino

FeatureMgr.AddFeature(eFeature.Money.Casino.LuckyWheel.Select)

FeatureMgr.AddFeature(eFeature.Money.Casino.LuckyWheel.Give, function(f)
    local ftr   = eFeature.Money.Casino.LuckyWheel.Select
    local prize = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index
    eFeature.Money.Casino.LuckyWheel.Give.func(prize)
end)

FeatureMgr.AddFeature(eFeature.Money.Casino.Slots.Win)

FeatureMgr.AddFeature(eFeature.Money.Casino.Slots.Lose)

FeatureMgr.AddFeature(eFeature.Money.Casino.Roulette.Land13)

FeatureMgr.AddFeature(eFeature.Money.Casino.Roulette.Land16)

FeatureMgr.AddFeature(eFeature.Money.Casino.Blackjack.Card)

FeatureMgr.AddFeature(eFeature.Money.Casino.Blackjack.Reveal, function(f)
    if GTA.IsScriptRunning(eScript.World.Casino.Blackjack) then
        if eLocal.World.Casino.Blackjack.CurrentTable:Get() ~= -1 then
            local dealersCard = eLocal.World.Casino.Blackjack.Dealer.FirstCard:Get()
            FeatureMgr.GetFeature(eFeature.Money.Casino.Blackjack.Card):SetStringValue(Helper.GetCardName(dealersCard))
        else
            FeatureMgr.GetFeature(eFeature.Money.Casino.Blackjack.Card):SetStringValue("Not at a table!")
        end
    else
        FeatureMgr.GetFeature(eFeature.Money.Casino.Blackjack.Card):SetStringValue("Not in Casino!")
    end
    eFeature.Money.Casino.Blackjack.Reveal.func()
end)

FeatureMgr.AddFeature(eFeature.Money.Casino.Blackjack.Trick, function(f)
    eFeature.Money.Casino.Blackjack.Trick.func()
    FeatureMgr.GetFeature(eFeature.Money.Casino.Blackjack.Reveal):OnClick()
end)

FeatureMgr.AddFeature(eFeature.Money.Casino.Poker.MyCards)

FeatureMgr.AddFeature(eFeature.Money.Casino.Poker.Cards)

FeatureMgr.AddFeature(eFeature.Money.Casino.Poker.Reveal, function(f)
    if GTA.IsScriptRunning(eScript.World.Casino.Poker) then
        if eLocal.World.Casino.Poker.CurrentTable:Get() ~= -1 then
            local myCards      = Helper.GetPokerCards(PLAYER_ID)
            local dealersCards = Helper.GetPokerCards(Helper.GetPokerPlayersCount() + 1)
            FeatureMgr.GetFeature(eFeature.Money.Casino.Poker.MyCards):SetStringValue(myCards)
            FeatureMgr.GetFeature(eFeature.Money.Casino.Poker.Cards):SetStringValue(dealersCards)
        else
            FeatureMgr.GetFeature(eFeature.Money.Casino.Poker.MyCards):SetStringValue("Not at a table!")
            FeatureMgr.GetFeature(eFeature.Money.Casino.Poker.Cards):SetStringValue("Not at a table!")
        end
    else
        FeatureMgr.GetFeature(eFeature.Money.Casino.Poker.MyCards):SetStringValue("Not in Casino!")
        FeatureMgr.GetFeature(eFeature.Money.Casino.Poker.Cards):SetStringValue("Not in Casino!")
    end
    eFeature.Money.Casino.Poker.Reveal.func()
end)

FeatureMgr.AddFeature(eFeature.Money.Casino.Poker.Give, function(f)
    eFeature.Money.Casino.Poker.Give.func()
    FeatureMgr.GetFeature(eFeature.Money.Casino.Poker.Reveal):OnClick()
end)

FeatureMgr.AddFeature(eFeature.Money.Casino.Poker.Trick, function(f)
    eFeature.Money.Casino.Poker.Trick.func()
    FeatureMgr.GetFeature(eFeature.Money.Casino.Poker.Reveal):OnClick()
end)

FeatureMgr.AddLoop(eFeature.Money.Casino.Misc.Bypass, nil, function(f)
    eFeature.Money.Casino.Misc.Bypass.func(f)
end)

FeatureMgr.AddFeature(eFeature.Money.Casino.Misc.Limit.Select)

FeatureMgr.AddFeature(eFeature.Money.Casino.Misc.Limit.Acquire, function(f)
    local limit = FeatureMgr.GetFeature(eFeature.Money.Casino.Misc.Limit.Select):GetIntValue()
    eFeature.Money.Casino.Misc.Limit.Acquire.func(limit)
end)

FeatureMgr.AddFeature(eFeature.Money.Casino.Misc.Limit.Trade, function(f)
    local limit = FeatureMgr.GetFeature(eFeature.Money.Casino.Misc.Limit.Select):GetIntValue()
    eFeature.Money.Casino.Misc.Limit.Trade.func(limit)
end)

--#endregion

--#region Easy Money

FeatureMgr.AddFeature(eFeature.Money.EasyMoney.Acknowledge):Toggle(CONFIG.easy_money.acknowledge)

FeatureMgr.AddFeature(eFeature.Money.EasyMoney.Instant.Give30m)

for i = 1, #easyLoops do
    FeatureMgr.AddLoop(easyLoops[i], function(f)
        local delay = FeatureMgr.GetFeature(settingsEasyDelays[i]):GetFloatValue()
        easyLoops[i].func(f, delay)
    end, function(f)
        local delay = FeatureMgr.GetFeature(settingsEasyDelays[i]):GetFloatValue()
        easyLoops[i].func(f, delay)
    end)
end

--#endregion

--#region Misc

FeatureMgr.AddFeature(eFeature.Money.Misc.Edit.Select)

FeatureMgr.AddFeature(eFeature.Money.Misc.Edit.Deposit, function(f)
    local amount = FeatureMgr.GetFeature(eFeature.Money.Misc.Edit.Select):GetIntValue()
    eFeature.Money.Misc.Edit.Deposit.func(amount)
end)

FeatureMgr.AddFeature(eFeature.Money.Misc.Edit.Withdraw, function(f)
    local amount = FeatureMgr.GetFeature(eFeature.Money.Misc.Edit.Select):GetIntValue()
    eFeature.Money.Misc.Edit.Withdraw.func(amount)
end)

FeatureMgr.AddFeature(eFeature.Money.Misc.Edit.Remove, function(f)
    local amount = FeatureMgr.GetFeature(eFeature.Money.Misc.Edit.Select):GetIntValue()
    eFeature.Money.Misc.Edit.Remove.func(amount)
end)

FeatureMgr.AddFeature(eFeature.Money.Misc.Edit.DepositAll)

FeatureMgr.AddFeature(eFeature.Money.Misc.Edit.WithdrawAll)

FeatureMgr.AddFeature(eFeature.Money.Misc.Story.Select)

FeatureMgr.AddFeature(eFeature.Money.Misc.Story.Character, function(f)
    local charIndex = eFeature.Money.Misc.Story.Character.list[f:GetListIndex() + 1].index
    FeatureMgr.GetFeature(eFeature.Money.Misc.Story.Select):SetIntValue(eStat[F("SP%d_TOTAL_CASH", charIndex)]:Get())
    eFeature.Money.Misc.Story.Character.func(f)
end)

FeatureMgr.AddFeature(eFeature.Money.Misc.Story.Apply, function(f)
    local ftr       = eFeature.Money.Misc.Story.Character
    local charIndex = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index
    local amount    = FeatureMgr.GetFeature(eFeature.Money.Misc.Story.Select):GetIntValue()
    eFeature.Money.Misc.Story.Apply.func(charIndex, amount)
end)

FeatureMgr.AddFeature(eFeature.Money.Misc.Stats.Select)

FeatureMgr.AddFeature(eFeature.Money.Misc.Stats.Earned, function(f)
    local ftr        = eFeature.Money.Misc.Stats.Earned
    local earnedStat = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index

    FeatureMgr.GetFeature(eFeature.Money.Misc.Stats.Select):SetIntValue((earnedStat ~= 0) and earnedStat:Get() or 0)

    if f:GetListIndex() > 0 then
        FeatureMgr.GetFeature(eFeature.Money.Misc.Stats.Spent):SetListIndex(0)
    end

    eFeature.Money.Misc.Stats.Earned.func(f)
end)

FeatureMgr.AddFeature(eFeature.Money.Misc.Stats.Spent, function(f)
    local ftr       = eFeature.Money.Misc.Stats.Spent
    local spentStat = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index

    FeatureMgr.GetFeature(eFeature.Money.Misc.Stats.Select):SetIntValue((spentStat ~= 0) and spentStat:Get() or 0)

    if f:GetListIndex() > 0 then
        FeatureMgr.GetFeature(eFeature.Money.Misc.Stats.Earned):SetListIndex(0)
    end

    eFeature.Money.Misc.Stats.Spent.func(f)
end)

FeatureMgr.AddFeature(eFeature.Money.Misc.Stats.Apply, function(f)
    local ftr        = eFeature.Money.Misc.Stats.Earned
    local earnedStat = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index

    local ftr       = eFeature.Money.Misc.Stats.Spent
    local spentStat = ftr.list[FeatureMgr.GetFeatureListIndex(ftr) + 1].index

    local amount = FeatureMgr.GetFeature(eFeature.Money.Misc.Stats.Select):GetIntValue()
    eFeature.Money.Misc.Stats.Apply.func(earnedStat, spentStat, amount)
end)

--#endregion

--#endregion
