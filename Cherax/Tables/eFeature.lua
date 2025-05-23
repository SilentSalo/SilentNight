--#region eFeature

eFeature = {
    Heist = {
        Generic = {
            Launch = {
                hash = J("SN_Generic_Launch"),
                name = "Solo Launch",
                type = eFeatureType.Toggle,
                desc = "Allows launching the heist alone.",
                func = function()
                    eLocal.Heist.Generic.Launch.Step1:Set(1)
                    ScriptGlobal.SetInt(794744 + 4 + 1 + (eLocal.Heist.Generic.Launch.Step2:Get() * 89) + 69, 1)
                    eGlobal.Heist.Generic.Launch.Step1:Set(1)
                    eGlobal.Heist.Generic.Launch.Step2:Set(1)
                    eGlobal.Heist.Generic.Launch.Step3:Set(1)
                    eGlobal.Heist.Generic.Launch.Step4:Set(0)
                    Script.Yield()
                end
            },

            Cutscene = {
                hash = J("SN_Generic_Cutscene"),
                name = "Skip Cutscene",
                type = eFeatureType.Button,
                desc = "Skips the current cutscene.",
                func = function()
                    eNative.CUTSCENE.STOP_CUTSCENE_IMMEDIATELY()
                end
            },

            Skip = {
                hash = J("SN_Generic_Skip"),
                name = "Skip Checkpoint",
                type = eFeatureType.Button,
                desc = "Skips the heist to the next checkpoint.",
                func = function()
                    eLocal.Heist.Generic.Skip.Old:Set(eLocal.Heist.Generic.Skip.Old:Get() | (1 << 17))
                    eLocal.Heist.Generic.Skip.New:Set(eLocal.Heist.Generic.Skip.New:Get() | (1 << 17))
                end
            },

            Finish = {
                hash = J("SN_Generic_Finish"),
                name = "Instant Finish",
                type = eFeatureType.Button,
                desc = "Finishes the heist instantly. Use after you can see the minimap.",
                func = function()
                    if GTA.IsScriptRunning(eScript.Heist.Old) then
                        GTA.ForceScriptHost(eScript.Heist.Old)
                        Script.Yield(1000)

                        eLocal.Heist.Generic.Finish.Old.Step1:Set(5)
                        eLocal.Heist.Generic.Finish.Old.Step2:Set(999999)

                        local value = eLocal.Heist.Generic.Finish.Old.Step3:Get()
                        value = Helper.SetBit(value, 9)
                        value = Helper.SetBit(value, 16)

                        eLocal.Heist.Generic.Finish.Old.Step3:Set(value)
                    elseif GTA.IsScriptRunning(eScript.Heist.New) then
                        GTA.ForceScriptHost(eScript.Heist.New)
                        Script.Yield(1000)

                        eLocal.Heist.Generic.Finish.New.Step1:Set(5)
                        eLocal.Heist.Generic.Finish.New.Step2:Set(999999)

                        local value = eLocal.Heist.Generic.Finish.New.Step3:Get()
                        value = Helper.SetBit(value, 9)
                        value = Helper.SetBit(value, 16)

                        eLocal.Heist.Generic.Finish.New.Step3:Set(value)
                    end
                end
            },

            Cut = {
                hash = J("SN_Generic_Cut"),
                name = "Self",
                type = eFeatureType.InputInt,
                desc = "Select the cut for yourself.",
                defv = 0,
                lims = { 0, 999 },
                step = 1
            },

            Apply = {
                hash = J("SN_Generic_Apply"),
                name = "Apply Cut",
                type = eFeatureType.Button,
                desc = "Applies the selected cut for yourself.",
                func = function(cut)
                    eGlobal.Heist.Generic.Cut:Set(cut)
                end
            }
        },

        Agency = {
            Preps = {
                Contract = {
                    hash = J("SN_Agency_Contract"),
                    name = "Contract",
                    type = eFeatureType.Combo,
                    desc = "Select the desired VIP contract.",
                    list = eTable.Heist.Agency.Contracts
                },

                Complete = {
                    hash = J("SN_Agency_Complete"),
                    name = "Apply & Complete Preps",
                    type = eFeatureType.Button,
                    desc = "Applies all changes and completes all preparations.",
                    func = function(contract)
                        if contract < 12 then
                            eStat.MPX_FIXER_STORY_BS:Set(contract)
                        else
                            eStat.MPX_FIXER_STORY_BS:Set(contract)
                            eStat.MPX_FIXER_FIXER_STORY_STRAND:Set(-1)
                        end
                        eStat.MPX_FIXER_GENERAL_BS:Set(-1)
                        eStat.MPX_FIXER_COMPLETED_BS:Set(-1)
                        eStat.MPX_FIXER_STORY_COOLDOWN:Set(-1)
                    end
                }
            },

            Misc = {
                Cooldown = {
                    hash = J("SN_Agency_Cooldown"),
                    name = "Kill Cooldowns",
                    type = eFeatureType.Button,
                    desc = "Skips the heist's cooldowns. Doesn't skip the cooldown between transactions (20 min).",
                    func = function()
                        eTunable.Heist.Agency.Cooldown.Story:Set(0)
                        eTunable.Heist.Agency.Cooldown.Security:Set(0)
                        eTunable.Heist.Agency.Cooldown.Reward:Set(0)
                        eTunable.Heist.Agency.Cooldown.Payphone:Set(0)
                    end
                }
            },

            Payout = {
                Select = {
                    hash = J("SN_Agency_Select"),
                    name = "Payout",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired payout.",
                    defv = 0,
                    lims = { 0, 3000000 },
                    step = 100000
                },

                Max = {
                    hash = J("SN_Agency_Max"),
                    name = "Max",
                    type = eFeatureType.Button,
                    desc = "Maximizes the payout, but doesn't apply it."
                },

                Apply = {
                    hash = J("SN_Agency_Apply"),
                    name = "Apply Payout",
                    type = eFeatureType.Button,
                    desc = "Applies the selected payout. Use after you can see the minimap.",
                    func = function(payout)
                        eTunable.Heist.Agency.Payout:Set(payout)
                    end
                }
            }
        },

        Apartment = {
            Preps = {
                Complete = {
                    hash = J("SN_Apartment_Complete"),
                    name = "Complete Preps",
                    type = eFeatureType.Button,
                    desc = "Completes all preparations.",
                    func = function()
                        eStat.MPX_HEIST_PLANNING_STAGE:Set(-1)
                    end
                },

                Reload = {
                    hash = J("SN_Apartment_Reload"),
                    name = "Redraw Board",
                    type = eFeatureType.Button,
                    desc = "Redraws the planning board.",
                    func = function()
                        eGlobal.Heist.Apartment.Reload:Set(22)
                    end
                }
            },

            Misc = {
                Force = {
                    hash = J("SN_Apartment_Force"),
                    name = "Force Ready",
                    type = eFeatureType.Button,
                    desc = "Forces everyone to be «Ready».",
                    func = function()
                        GTA.ForceScriptHost(eScript.Heist.Apartment)
                        Script.Yield(1000)
                        for i = 2, 4 do
                            eGlobal.Heist.Apartment.Ready[F("Player%d", i)]:Set(6)
                        end
                    end
                },

                Finish = {
                    hash = J("SN_Apartment_Finish"),
                    name = "Instant Finish",
                    type = eFeatureType.Button,
                    desc = "Finishes the heist instantly. Use after you can see the minimap.",
                    func = function()
                        GTA.ForceScriptHost(eScript.Heist.Apartment)
                        Script.Yield(1000)

                        local heist = eGlobal.Heist.Apartment.Heist.Type:Get()

                        if heist == eTable.Heist.Apartment.Heists.PacificJob then
                            eLocal.Heist.Apartment.Finish.Step2:Set(5)
                            eLocal.Heist.Apartment.Finish.Step3:Set(80)
                            eLocal.Heist.Apartment.Finish.Step4:Set(10000000)
                            eLocal.Heist.Apartment.Finish.Step5:Set(99999)
                            eLocal.Heist.Apartment.Finish.Step6:Set(99999)
                        else
                            eLocal.Heist.Apartment.Finish.Step1:Set(12)
                            eLocal.Heist.Apartment.Finish.Step4:Set(99999)
                            eLocal.Heist.Apartment.Finish.Step5:Set(99999)
                            eLocal.Heist.Apartment.Finish.Step6:Set(99999)
                        end
                    end
                },

                FleecaHack = {
                    hash = J("SN_Apartment_FleecaHack"),
                    name = "Bypass Fleeca Hack",
                    type = eFeatureType.Button,
                    desc = "Skips the hacking process of The Fleeca Job heist.",
                    func = function()
                        eLocal.Heist.Apartment.Bypass.Fleeca.Hack:Set(7)
                    end
                },

                FleecaDrill = {
                    hash = J("SN_Apartment_FleecaDrill"),
                    name = "Bypass Fleeca Drill",
                    type = eFeatureType.Button,
                    desc = "Skips the drilling process of The Fleeca Job.",
                    func = function()
                        eLocal.Heist.Apartment.Bypass.Fleeca.Drill:Set(100)
                    end
                },

                PacificHack = {
                    hash = J("SN_Apartment_PacificHack"),
                    name = "Bypass Pacific Hack",
                    type = eFeatureType.Button,
                    desc = "Skips the hacking process of The Pacific Standard Job heist.",
                    func = function()
                        eLocal.Heist.Apartment.Bypass.Pacific.Hack:Set(9)
                    end
                },

                Cooldown = {
                    hash = J("SN_Apartment_Cooldown"),
                    name = "Kill Cooldown",
                    type = eFeatureType.Button,
                    desc = "Skips the heist's cooldown.",
                    func = function()
                        eGlobal.Heist.Apartment.Cooldown:Set(-1)
                        Script.Yield()
                    end
                },

                Play = {
                    hash = J("SN_Apartment_Play"),
                    name = "Play Unavailable Jobs",
                    type = eFeatureType.Button,
                    desc = "Allows you to play unavailable jobs temporarily.",
                    func = function()
                        eGlobal.Heist.Apartment.Cooldown:Set(-1)
                    end
                },

                Unlock = {
                    hash = J("SN_Apartment_Unlock"),
                    name = "Unlock All Jobs",
                    type = eFeatureType.Button,
                    desc = "Unlocks all jobs without playing every heist one by one. Restart the game to apply.",
                    func = function()
                        eStat.MPX_HEIST_SAVED_STRAND_0:Set(eTunable.Heist.Apartment.RootIdHash.Fleeca:Get())
                        eStat.MPX_HEIST_SAVED_STRAND_0_L:Set(5)
                        eStat.MPX_HEIST_SAVED_STRAND_1:Set(eTunable.Heist.Apartment.RootIdHash.Prison:Get())
                        eStat.MPX_HEIST_SAVED_STRAND_1_L:Set(5)
                        eStat.MPX_HEIST_SAVED_STRAND_2:Set(eTunable.Heist.Apartment.RootIdHash.Humane:Get())
                        eStat.MPX_HEIST_SAVED_STRAND_2_L:Set(5)
                        eStat.MPX_HEIST_SAVED_STRAND_3:Set(eTunable.Heist.Apartment.RootIdHash.Series:Get())
                        eStat.MPX_HEIST_SAVED_STRAND_3_L:Set(5)
                        eStat.MPX_HEIST_SAVED_STRAND_4:Set(eTunable.Heist.Apartment.RootIdHash.Pacific:Get())
                        eStat.MPX_HEIST_SAVED_STRAND_4_L:Set(5)
                    end
                }
            },

            Cuts = {
                Team = {
                    hash = J("SN_Apartment_Team"),
                    name = "Team",
                    type = eFeatureType.Combo,
                    desc = "Select your number of players.",
                    list = eTable.Heist.Generic.Team
                },

                Receivers = {
                    hash = J("SN_Apartment_Receivers"),
                    name = "Receivers",
                    type = eFeatureType.Combo,
                    desc = "Decide who will receive the money.",
                    list = eTable.Heist.Apartment.Receivers
                },

                Presets = {
                    hash = J("SN_Apartment_Presets"),
                    name = "Presets",
                    type = eFeatureType.Combo,
                    desc = "Select one of the ready-made presets.",
                    list = eTable.Heist.Apartment.Presets,
                    func = function(bool)
                        Helper.SetApartmentMaxPayout(bool)
                        Script.Yield()
                    end
                },

                Bonus = {
                    hash = J("SN_Apartment_Bonus"),
                    name = "12mil Bonus",
                    type = eFeatureType.Toggle,
                    desc = "Allows only you to get 12 millions bonus for The Pacific Standard Job on hard difficulty, even if you're not the host. Enable before starting the heist. Has a cooldown of about 1 hour.",
                    func = function(ftr)
                        local bool = ftr:IsToggled()
                        eStat.MPPLY_HEISTFLOWORDERPROGRESS:Set((bool) and 268435455 or 134217727)
                        eStat.MPPLY_AWD_HST_ORDER:Set((bool) and true or false)
                        eStat.MPPLY_HEISTTEAMPROGRESSBITSET:Set((bool) and 268435455 or 134217727)
                        eStat.MPPLY_AWD_HST_SAME_TEAM:Set((bool) and true or false)
                        eStat.MPPLY_HEISTNODEATHPROGREITSET:Set((bool) and 268435455 or 134217727)
                        eStat.MPPLY_AWD_HST_ULT_CHAL:Set((bool) and true or false)
                    end
                },

                Double = {
                    hash = J("SN_Apartment_Double"),
                    name = "Double Rewards Week",
                    type = eFeatureType.Toggle,
                    desc = "Enable this during double rewards week."
                },

                Player1 = {
                    hash = J("SN_Apartment_Player1"),
                    name = "Player 1",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 1.",
                    defv = 0,
                    lims = { 0, 10000 },
                    step = 1
                },

                Player2 = {
                    hash = J("SN_Apartment_Player2"),
                    name = "Player 2",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 2.",
                    defv = 0,
                    lims = { 0, 10000 },
                    step = 1
                },

                Player3 = {
                    hash = J("SN_Apartment_Player3"),
                    name = "Player 3",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 3.",
                    defv = 0,
                    lims = { 0, 10000 },
                    step = 1
                },

                Player4 = {
                    hash = J("SN_Apartment_Player4"),
                    name = "Player 4",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 4.",
                    defv = 0,
                    lims = { 0, 10000 },
                    step = 1
                },

                Apply = {
                    hash = J("SN_Apartment_Apply"),
                    name = "Apply Cuts",
                    type = eFeatureType.Button,
                    desc = "Applies the selected cuts for players.",
                    func = function(team, receivers, cuts)
                        GUI.Toggle()
                        Script.Yield(1000)

                        local function SetCuts()
                            eGlobal.Heist.Apartment.Cut.Player1.Global:Set(100 - (cuts[1] * team))
                            eGlobal.Heist.Apartment.Cut.Player2.Global:Set(cuts[2])
                            eGlobal.Heist.Apartment.Cut.Player3.Global:Set(cuts[3])
                            eGlobal.Heist.Apartment.Cut.Player4.Global:Set(cuts[4])
                            eNative.PAD.SET_CURSOR_POSITION(0.775, 0.175)
                            GTA.SimulatePlayerControl(237)
                            GTA.SimulateFrontendControl(202)
                        end

                        if team ~= 1 and receivers == 0 then
                            SetCuts()
                            Script.Yield(1000)
                            eGlobal.Heist.Apartment.Cut.Player1.Local:Set(cuts[1])
                        elseif team ~= 1 and receivers == 1 then
                            SetCuts()
                        elseif team == 1 or receivers == 2 then
                            eGlobal.Heist.Apartment.Cut.Player1.Local:Set(cuts[1])
                        end

                        GUI.Toggle()
                    end
                }
            }
        },

        AutoShop = {
            Preps = {
                Contract = {
                    hash = J("SN_AutoShop_Contract"),
                    name = "Contract",
                    type = eFeatureType.Combo,
                    desc = "Select the desired contract.",
                    list = eTable.Heist.AutoShop.Contracts
                },

                Complete = {
                    hash = J("SN_AutoShop_Complete"),
                    name = "Apply & Complete Preps",
                    type = eFeatureType.Button,
                    desc = "Applies all changes and completes all preparations. Also, redraws the planning board.",
                    func = function(contract)
                        eStat.MPX_TUNER_CURRENT:Set(contract)
                        eStat.MPX_TUNER_GEN_BS:Set((contract == 1) and 4351 or 12543)
                        eLocal.Heist.AutoShop.Reload:Set(2)
                    end
                },

                Reload = {
                    hash = J("SN_AutoShop_Reload"),
                    name = "Redraw Board",
                    type = eFeatureType.Button,
                    desc = "Redraws the planning board.",
                    func = function()
                        eLocal.Heist.AutoShop.Reload:Set(2)
                    end
                }
            },

            Misc = {
                Cooldown = {
                    hash = J("SN_AutoShop_Cooldown"),
                    name = "Kill Cooldown",
                    type = eFeatureType.Button,
                    desc = "Skips the heist's cooldown. Doesn't skip the cooldown between transactions (20 min).",
                    func = function()
                        for i = 0, 7 do
                            eStat[F("MPX_TUNER_CONTRACT%d_POSIX", i)]:Set(0)
                        end
                        eTunable.Heist.AutoShop.Cooldown:Set(0)
                    end
                }
            },

            Payout = {
                Select = {
                    hash = J("SN_AutoShop_Select"),
                    name = "Payout",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired payout.",
                    defv = 0,
                    lims = { 0, 2000000 },
                    step = 100000
                },

                Max = {
                    hash = J("SN_AutoShop_Max"),
                    name = "Max",
                    type = eFeatureType.Button,
                    desc = "Maximizes the payout, but doesn't apply it."
                },

                Apply = {
                    hash = J("SN_AutoShop_Apply"),
                    name = "Apply Payout",
                    type = eFeatureType.Button,
                    desc = "Applies the selected payout. Use after you can see the minimap.",
                    func = function(payout)
                        eTunable.Heist.AutoShop.Payout.First:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Second:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Third:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Fourth:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Fifth:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Sixth:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Seventh:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Eight:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Fee:Set(0.0)
                    end
                }
            }
        },

        CayoPerico = {
            Preps = {
                Difficulty = {
                    hash = J("SN_CayoPerico_Difficulty"),
                    name = "Difficulty",
                    type = eFeatureType.Combo,
                    desc = "Select the desired difficulty.",
                    list = eTable.Heist.CayoPerico.Difficulties
                },

                Approach = {
                    hash = J("SN_CayoPerico_Approach"),
                    name = "Approach",
                    type = eFeatureType.Combo,
                    desc = "Select the desired approach.",
                    list = eTable.Heist.CayoPerico.Approaches
                },

                Loadout = {
                    hash = J("SN_CayoPerico_Loadout"),
                    name = "Loadout",
                    type = eFeatureType.Combo,
                    desc = "Select the desired loadout.",
                    list = eTable.Heist.CayoPerico.Loadouts
                },

                Target = {
                    Primary = {
                        hash = J("SN_CayoPerico_PrimaryTarget"),
                        name = "Target",
                        type = eFeatureType.Combo,
                        desc = "Select the desired primary target.",
                        list = eTable.Heist.CayoPerico.Targets.Primary
                    },

                    Secondary = {
                        Compound = {
                            hash = J("SN_CayoPerico_CompoundTarget"),
                            name = "Com. Target",
                            type = eFeatureType.Combo,
                            desc = "Select the desired compound target.",
                            list = eTable.Heist.CayoPerico.Targets.Secondary
                        },

                        Island = {
                            hash = J("SN_CayoPerico_IslandTarget"),
                            name = "Isl. Target",
                            type = eFeatureType.Combo,
                            desc = "Select the desired island target.",
                            list = eTable.Heist.CayoPerico.Targets.Secondary
                        }
                    },

                    Amount = {
                        Compound = {
                            hash = J("SN_CayoPerico_CompoundAmount"),
                            name = "Com. Amount",
                            type = eFeatureType.Combo,
                            desc = "Select the desired compound target amount.",
                            list = eTable.Heist.CayoPerico.Targets.Amounts.Compound
                        },

                        Island = {
                            hash = J("SN_CayoPerico_IslandAmount"),
                            name = "Isl. Amount",
                            type = eFeatureType.Combo,
                            desc = "Select the desired island target amount.",
                            list = eTable.Heist.CayoPerico.Targets.Amounts.Island
                        },

                        Arts = {
                            hash = J("SN_CayoPerico_ArtsAmount"),
                            name = "Arts Amount",
                            type = eFeatureType.Combo,
                            desc = "Select the desired compound arts amount.",
                            list = eTable.Heist.CayoPerico.Targets.Amounts.Arts
                        }
                    }
                },

                Complete = {
                    hash = J("SN_CayoPerico_Complete"),
                    name = "Apply & Complete Preps",
                    type = eFeatureType.Button,
                    desc = "Applies all changes and completes all preparations. Also, reloads the planning screen.",
                    func = function(difficulty, approach, loadout, primaryTarget, compoundTarget, compoundAmount, artsAmount, islandTarget, islandAmount)
                        eStat.MPX_H4_PROGRESS:Set(difficulty)
                        eStat.MPX_H4_MISSIONS:Set(approach)
                        eStat.MPX_H4CNF_WEAPONS:Set(loadout)
                        eStat.MPX_H4CNF_TARGET:Set(primaryTarget)
                        eStat.MPX_H4LOOT_CASH_C:Set((eStat.MPX_H4LOOT_CASH_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_CASH_C_SCOPED:Set((eStat.MPX_H4LOOT_CASH_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_WEED_C:Set((eStat.MPX_H4LOOT_WEED_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_WEED_C_SCOPED:Set((eStat.MPX_H4LOOT_WEED_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_COKE_C:Set((eStat.MPX_H4LOOT_COKE_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_COKE_C_SCOPED:Set((eStat.MPX_H4LOOT_COKE_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_GOLD_C:Set((eStat.MPX_H4LOOT_GOLD_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_GOLD_C_SCOPED:Set((eStat.MPX_H4LOOT_GOLD_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_PAINT:Set((artsAmount ~= 0) and artsAmount or 0)
                        eStat.MPX_H4LOOT_PAINT_SCOPED:Set((artsAmount ~= 0) and artsAmount or 0)
                        eStat.MPX_H4LOOT_CASH_I:Set((eStat.MPX_H4LOOT_CASH_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_CASH_I_SCOPED:Set((eStat.MPX_H4LOOT_CASH_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_WEED_I:Set((eStat.MPX_H4LOOT_WEED_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_WEED_I_SCOPED:Set((eStat.MPX_H4LOOT_WEED_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_COKE_I:Set((eStat.MPX_H4LOOT_COKE_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_COKE_I_SCOPED:Set((eStat.MPX_H4LOOT_COKE_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_GOLD_I:Set((eStat.MPX_H4LOOT_GOLD_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_GOLD_I_SCOPED:Set((eStat.MPX_H4LOOT_GOLD_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_CASH_V:Set((compoundTarget ~= 0 or islandTarget ~= 0) and 83250 or 0)
                        eStat.MPX_H4LOOT_WEED_V:Set((compoundTarget ~= 0 or islandTarget ~= 0) and 135000 or 0)
                        eStat.MPX_H4LOOT_COKE_V:Set((compoundTarget ~= 0 or islandTarget ~= 0) and 202500 or 0)
                        eStat.MPX_H4LOOT_GOLD_V:Set((compoundTarget ~= 0 or islandTarget ~= 0) and 333333 or 0)
                        eStat.MPX_H4LOOT_PAINT_V:Set((artsAmount ~= 0) and 180000 or 0)
                        eStat.MPX_H4CNF_UNIFORM:Set(-1)
                        eStat.MPX_H4CNF_GRAPPEL:Set(-1)
                        eStat.MPX_H4CNF_TROJAN:Set(5)
                        eStat.MPX_H4CNF_WEP_DISRP:Set(3)
                        eStat.MPX_H4CNF_ARM_DISRP:Set(3)
                        eStat.MPX_H4CNF_HEL_DISRP:Set(3)
                        eStat.MPX_H4_PLAYTHROUGH_STATUS:Set(10)
                        eLocal.Heist.CayoPerico.Reload:Set(2)
                    end
                },

                Reset = {
                    hash = J("SN_CayoPerico_Reset"),
                    name = "Reset Preps",
                    type = eFeatureType.Button,
                    desc = "Resets all preparations. Also, reloads the planning screen.",
                    func = function()
                        eStat.MPX_H4_PROGRESS:Set(0)
                        eStat.MPX_H4_MISSIONS:Set(0)
                        eStat.MPX_H4CNF_APPROACH:Set(0)
                        eStat.MPX_H4CNF_TARGET:Set(-1)
                        eStat.MPX_H4CNF_BS_GEN:Set(0)
                        eStat.MPX_H4CNF_BS_ENTR:Set(0)
                        eStat.H4_PLAYTHROUGH_STATUS:Set(0)
                        eLocal.Heist.CayoPerico.Reload:Set(2)
                    end
                },

                Reload = {
                    hash = J("SN_CayoPerico_Reload"),
                    name = "Reload Screen",
                    type = eFeatureType.Button,
                    desc = "Reloads the planning screen.",
                    func = function()
                        eLocal.Heist.CayoPerico.Reload:Set(2)
                    end
                }
            },

            Misc = {
                Force = {
                    hash = J("SN_CayoPerico_Force"),
                    name = "Force Ready",
                    type = eFeatureType.Button,
                    desc = "Forces everyone to be «Ready».",
                    func = function()
                        GTA.ForceScriptHost(eScript.Heist.CayoPerico)
                        Script.Yield(1000)
                        for i = 2, 4 do
                            eGlobal.Heist.CayoPerico.Ready[F("Player%d", i)]:Set(1)
                        end
                    end
                },

                FingerprintHack = {
                    hash = J("SN_CayoPerico_FingerprintHack"),
                    name = "Bypass Fingerprint Hack",
                    type = eFeatureType.Button,
                    desc = "Skips the fingerprint hacking process.",
                    func = function()
                        eLocal.Heist.CayoPerico.Bypass.FingerprintHack:Set(5)
                    end
                },

                PlasmaCutterCut = {
                    hash = J("SN_CayoPerico_PlasmaCutterCut"),
                    name = "Bypass Plasma Cutter Cut",
                    type = eFeatureType.Button,
                    desc = "Skips the cutting process.",
                    func = function()
                        eLocal.Heist.CayoPerico.Bypass.PlasmaCutterCut:Set(100)
                    end
                },

                DrainagePipeCut = {
                    hash = J("SN_CayoPerico_DrainagePipeCut"),
                    name = "Bypass Drainage Pipe Cut",
                    type = eFeatureType.Button,
                    desc = "Skips the cutting process.",
                    func = function()
                        eLocal.Heist.CayoPerico.Bypass.DrainagePipeCut:Set(6)
                    end
                },

                Bag = {
                    hash = J("SN_CayoPerico_Bag"),
                    name = "Woman's Bag",
                    type = eFeatureType.Toggle,
                    desc = "Increases the size of the bag. Use with caution.",
                    func = function(ftr)
                        if ftr:IsToggled() then
                            eTunable.Heist.CayoPerico.Bag.MaxCapacity:Set(99999)
                        else
                            eTunable.Heist.CayoPerico.Bag.MaxCapacity:Reset()
                        end
                    end
                },

                Cooldown = {
                    Solo = {
                        hash = J("SN_CayoPerico_SoloCooldown"),
                        name = "Kill Cooldown (after solo)",
                        type = eFeatureType.Button,
                        desc = "Skips the heist's cooldown after you have played solo. Doesn't skip the cooldown between transactions (20 min). Go offline and online after using.",
                        func = function()
                            eStat.MPX_H4_TARGET_POSIX:Set(1659643454)
                            eStat.MPX_H4_COOLDOWN:Set(0)
                            eStat.MPX_H4_COOLDOWN_HARD:Set(0)
                        end
                    },

                    Team = {
                        hash = J("SN_CayoPerico_TeamCooldown"),
                        name = "Kill Cooldown (after team)",
                        type = eFeatureType.Button,
                        desc = "Skips the heist's cooldown after you have played with a team. Doesn't skip the cooldown between transactions (20 min). Go offline and online after using.",
                        func = function()
                            eStat.MPX_H4_TARGET_POSIX:Set(1659429119)
                            eStat.MPX_H4_COOLDOWN:Set(0)
                            eStat.MPX_H4_COOLDOWN_HARD:Set(0)
                        end
                    },

                    Offline = {
                        hash = J("SN_CayoPerico_Offline"),
                        name = "Go Offline",
                        type = eFeatureType.Button,
                        desc = "Leaves from GTA Online.",
                        func = function()
                            eGlobal.Session.Switch:Set(1)
                            eGlobal.Session.Quit:Set(-1)
                        end
                    },

                    Online = {
                        hash = J("SN_CayoPerico_Online"),
                        name = "Go Online",
                        type = eFeatureType.Button,
                        desc = "Connects to GTA Online.",
                        func = function()
                            GTA.StartSession(eTable.Session.Types.NewPublic)
                        end
                    }
                },

                Unlock = {
                    hash = J("SN_CayoPerico_Unlock"),
                    name = "Unlock All POI",
                    type = eFeatureType.Button,
                    desc = "Unlocks all points of interest. Also, reloads the planning screen.",
                    func = function()
                        eStat.MPX_H4CNF_BS_GEN:Set(-1)
                        eStat.MPX_H4CNF_BS_ENTR:Set(63)
                        eStat.MPX_H4CNF_BS_ABIL:Set(63)
                        eStat.MPX_H4CNF_APPROACH:Set(-1)
                        eLocal.Heist.CayoPerico.Reload:Set(2)
                    end
                }
            },

            Cuts = {
                Team = {
                    hash = J("SN_CayoPerico_Team"),
                    name = "Team",
                    type = eFeatureType.Combo,
                    desc = "Select your number of players.",
                    list = eTable.Heist.Generic.Team
                },

                Presets = {
                    hash = J("SN_CayoPerico_Presets"),
                    name = "Presets",
                    type = eFeatureType.Combo,
                    desc = "Select one of the ready-made presets. 2.55mil Payout only works if you've set the Difficulty through the script and you don't have any Secondary Targets.",
                    list = eTable.Heist.CayoPerico.Presets,
                    func = function()
                        Helper.SetCayoMaxPayout()
                        Script.Yield()
                    end
                },

                Crew = {
                    hash = J("SN_CayoPerico_Crew"),
                    name = "Remove Crew Cuts",
                    type = eFeatureType.Toggle,
                    desc = "Removes fencing fee and Pavel's cut. Can't be used with «2.55mil Payout».",
                    func = function(ftr)
                        if ftr:IsToggled() then
                            eTunable.Heist.CayoPerico.Cut.Pavel:Set(0)
                            eTunable.Heist.CayoPerico.Cut.Fee:Set(0)
                        else
                            eTunable.Heist.CayoPerico.Cut.Pavel:Reset()
                            eTunable.Heist.CayoPerico.Cut.Fee:Reset()
                        end
                    end
                },

                Player1 = {
                    hash = J("SN_CayoPerico_Player1"),
                    name = "Player 1",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 1.",
                    defv = 0,
                    lims = { 0, 999 },
                    step = 1
                },

                Player2 = {
                    hash = J("SN_CayoPerico_Player2"),
                    name = "Player 2",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 2.",
                    defv = 0,
                    lims = { 0, 999 },
                    step = 1
                },

                Player3 = {
                    hash = J("SN_CayoPerico_Player3"),
                    name = "Player 3",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 3.",
                    defv = 0,
                    lims = { 0, 999 },
                    step = 1
                },

                Player4 = {
                    hash = J("SN_CayoPerico_Player4"),
                    name = "Player 4",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 4.",
                    defv = 0,
                    lims = { 0, 999 },
                    step = 1
                },

                Apply = {
                    hash = J("SN_CayoPerico_Apply"),
                    name = "Apply Cuts",
                    type = eFeatureType.Button,
                    desc = "Applies the selected cuts for players.",
                    func = function(cuts)
                        for i = 1, 4 do
                            eGlobal.Heist.CayoPerico.Cut[F("Player%d", i)]:Set(cuts[i])
                        end
                    end
                }
            },

            Presets = {
                File = {
                    hash = J("SN_CayoPerico_File"),
                    name = "File",
                    type = eFeatureType.Combo,
                    desc = "Select the desired preset.",
                    list = eTable.Heist.CayoPerico.Files
                },

                Load = {
                    hash = J("SN_CayoPerico_Load"),
                    name = "Load",
                    type = eFeatureType.Button,
                    desc = "Loads the selected preset.",
                    func = function(file)
                        local path = F("%s\\%s.json", CAYO_DIR, file)
                        if FileMgr.DoesFileExist(path) then
                            local preps = Json.DecodeFromFile(path)
                            Helper.ApplyCayoPreset(preps)
                        end
                    end
                },

                Remove = {
                    hash = J("SN_CayoPerico_Remove"),
                    name = "Remove",
                    type = eFeatureType.Button,
                    desc = "Removes the selected preset.",
                    func = function(file)
                        local path = F("%s\\%s.json", CAYO_DIR, file)
                        if FileMgr.DoesFileExist(path) then
                            FileMgr.DeleteFile(path)
                            Helper.RefreshPresetsFiles()
                        end
                    end
                },

                Refresh = {
                    hash = J("SN_CayoPerico_Refresh"),
                    name = "Refresh",
                    type = eFeatureType.Button,
                    desc = "Refreshes the list of presets.",
                    func = function()
                        Helper.RefreshPresetsFiles()
                    end
                },

                Name = {
                    hash = J("SN_CayoPerico_Name"),
                    name = "QuickPreset",
                    type = eFeatureType.InputText,
                    desc = "Input the desired preset name."
                },

                Save = {
                    hash = J("SN_CayoPerico_Save"),
                    name = "Save",
                    type = eFeatureType.Button,
                    desc = "Saves the current preparations to the file.",
                    func = function(file, preps)
                        local path = F("%s\\%s.json", CAYO_DIR, file)
                        FileMgr.CreateHeistPresetsDirs()
                        Json.EncodeToFile(path, preps)
                        Helper.RefreshPresetsFiles()
                    end
                },

                Copy = {
                    hash = J("SN_CayoPerico_Copy"),
                    name = "Copy Folder Path",
                    type = eFeatureType.Button,
                    desc = "Copies the presets folder path to the clipboard.",
                    func = function()
                        FileMgr.CreateHeistPresetsDirs()
                        ImGui.SetClipboardText(CAYO_DIR)
                    end
                }
            }
        },

        DiamondCasino = {
            Preps = {
                Difficulty = {
                    hash = J("SN_DiamondCasino_Difficulty"),
                    name = "Difficulty",
                    type = eFeatureType.Combo,
                    desc = "Select the desired difficulty.",
                    list = eTable.Heist.DiamondCasino.Difficulties
                },

                Approach = {
                    hash = J("SN_DiamondCasino_Approach"),
                    name = "Approach",
                    type = eFeatureType.Combo,
                    desc = "Select the desired approach.",
                    list = eTable.Heist.DiamondCasino.Approaches
                },

                Gunman = {
                    hash = J("SN_DiamondCasino_Gunman"),
                    name = "Gunman",
                    type = eFeatureType.Combo,
                    desc = "Select the desired gunman.",
                    list = eTable.Heist.DiamondCasino.Gunmans
                },

                Loadout = {
                    hash = J("SN_DiamondCasino_Loadout"),
                    name = "Loadout",
                    type = eFeatureType.Combo,
                    desc = "Select the desired loadout.",
                    list = eTable.Heist.DiamondCasino.Loadouts
                },

                Driver = {
                    hash = J("SN_DiamondCasino_Driver"),
                    name = "Driver",
                    type = eFeatureType.Combo,
                    desc = "Select the desired driver.",
                    list = eTable.Heist.DiamondCasino.Drivers
                },

                Vehicles = {
                    hash = J("SN_DiamondCasino_Vehicles"),
                    name = "Vehicles",
                    type = eFeatureType.Combo,
                    desc = "Select the desired vehicles.",
                    list = eTable.Heist.DiamondCasino.Vehicles
                },

                Hacker = {
                    hash = J("SN_DiamondCasino_Hacker"),
                    name = "Hacker",
                    type = eFeatureType.Combo,
                    desc = "Select the desired hacker.",
                    list = eTable.Heist.DiamondCasino.Hackers
                },

                Masks = {
                    hash = J("SN_DiamondCasino_Masks"),
                    name = "Masks",
                    type = eFeatureType.Combo,
                    desc = "Select the desired masks.",
                    list = eTable.Heist.DiamondCasino.Masks
                },

                Keycards = {
                    hash = J("SN_DiamondCasino_Keycards"),
                    name = "Keycards",
                    type = eFeatureType.Combo,
                    desc = "Select the desired keycards level.",
                    list = eTable.Heist.DiamondCasino.Keycards
                },

                Guards = {
                    hash = J("SN_DiamondCasino_Guards"),
                    name = "Guards",
                    type = eFeatureType.Combo,
                    desc = "Select the desired guards strength.",
                    list = eTable.Heist.DiamondCasino.Guards
                },

                Target = {
                    hash = J("SN_DiamondCasino_Target"),
                    name = "Target",
                    type = eFeatureType.Combo,
                    desc = "Select the desired target.",
                    list = eTable.Heist.DiamondCasino.Targets
                },

                Complete = {
                    hash = J("SN_DiamondCasino_Complete"),
                    name = "Apply & Complete Preps",
                    type = eFeatureType.Button,
                    desc = "Applies all changes and completes all preparations. Also, redraws the planning board.",
                    func = function(difficulty, approach, gunman, driver, hacker, masks, guards, keycards, target, loadout, vehicles)
                        local function SetApproach(lastApproach, hardApproach, normalApproach)
                            eStat.MPX_H3_LAST_APPROACH:Set(lastApproach)
                            eStat.MPX_H3_HARD_APPROACH:Set(hardApproach)
                            eStat.MPX_H3_APPROACH:Set(normalApproach)
                            eStat.MPX_H3OPT_APPROACH:Set(approach)
                        end

                        local normalApproaches = {
                            [1] = { 3, 2, 1 },
                            [2] = { 3, 1, 2 },
                            [3] = { 1, 2, 3 }
                        }

                        local hardApproaches = {
                            [1] = { 2, 1, 3 },
                            [2] = { 1, 2, 3 },
                            [3] = { 2, 3, 1 }
                        }

                        if difficulty == 0 then
                            SetApproach(U(normalApproaches[approach]))
                        else
                            SetApproach(U(hardApproaches[approach]))
                        end

                        eStat.MPX_H3OPT_CREWWEAP:Set(gunman)
                        eStat.MPX_H3OPT_WEAPS:Set(loadout)
                        eStat.MPX_H3OPT_CREWDRIVER:Set(driver)
                        eStat.MPX_H3OPT_VEHS:Set(vehicles)
                        eStat.MPX_H3OPT_CREWHACKER:Set(hacker)
                        eStat.MPX_H3OPT_TARGET:Set(target)
                        eStat.MPX_H3OPT_MASKS:Set(masks)
                        eStat.MPX_H3OPT_DISRUPTSHIP:Set(guards)
                        eStat.MPX_H3OPT_KEYLEVELS:Set(keycards)
                        eStat.MPX_H3OPT_BODYARMORLVL:Set(-1)
                        eStat.MPX_H3OPT_BITSET0:Set(-1)
                        eStat.MPX_H3OPT_BITSET1:Set(-1)
                        eStat.MPX_H3OPT_COMPLETEDPOSIX:Set(-1)
                        eLocal.Heist.DiamondCasino.Reload:Set(2)
                    end
                },

                Reset = {
                    hash = J("SN_DiamondCasino_Reset"),
                    name = "Reset Preps",
                    type = eFeatureType.Button,
                    desc = "Resets all preparations. Also, redraws the planning board.",
                    func = function()
                        eStat.MPX_H3_LAST_APPROACH:Set(0)
                        eStat.MPX_H3_HARD_APPROACH:Set(0)
                        eStat.MPX_H3_APPROACH:Set(0)
                        eStat.MPX_H3OPT_APPROACH:Set(0)
                        eStat.MPX_H3OPT_CREWWEAP:Set(0)
                        eStat.MPX_H3OPT_WEAPS:Set(0)
                        eStat.MPX_H3OPT_CREWDRIVER:Set(0)
                        eStat.MPX_H3OPT_VEHS:Set(0)
                        eStat.MPX_H3OPT_CREWHACKER:Set(0)
                        eStat.MPX_H3OPT_MASKS:Set(0)
                        eStat.MPX_H3OPT_TARGET:Set(0)
                        eStat.MPX_H3OPT_DISRUPTSHIP:Set(0)
                        eStat.MPX_H3OPT_BODYARMORLVL:Set(01)
                        eStat.MPX_H3OPT_KEYLEVELS:Set(0)
                        eStat.MPX_H3OPT_BITSET0:Set(0)
                        eStat.MPX_H3OPT_BITSET1:Set(0)
                        eStat.MPX_H3OPT_POI:Set(0)
                        eStat.MPX_H3OPT_ACCESSPOINTS:Set(0)
                        eStat.MPX_CAS_HEIST_NOTS:Set(0)
                        eStat.MPX_CAS_HEIST_FLOW:Set(0)
                        eStat.MPX_H3_BOARD_DIALOGUE0:Set(0)
                        eStat.MPX_H3_BOARD_DIALOGUE1:Set(0)
                        eStat.MPX_H3_BOARD_DIALOGUE2:Set(0)
                        eStat.MPPLY_H3_COOLDOWN:Set(0)
                        eStat.MPX_H3OPT_COMPLETEDPOSIX:Set(0)
                        eLocal.Heist.DiamondCasino.Reload:Set(2)
                    end
                },

                Reload = {
                    hash = J("SN_DiamondCasino_Reload"),
                    name = "Redraw Board",
                    type = eFeatureType.Button,
                    desc = "Redraws the planning board.",
                    func = function()
                        eLocal.Heist.DiamondCasino.Reload:Set(2)
                    end
                }
            },

            Misc = {
                Force = {
                    hash = J("SN_DiamondCasino_Force"),
                    name = "Force Ready",
                    type = eFeatureType.Button,
                    desc = "Forces everyone to be «Ready».",
                    func = function()
                        GTA.ForceScriptHost(eScript.Heist.DiamondCasino)
                        Script.Yield(1000)
                        for i = 2, 4 do
                            eGlobal.Heist.DiamondCasino.Ready[F("Player%d", i)]:Set(1)
                        end
                    end
                },

                Finish = {
                    hash = J("SN_DiamondCasino_Finish"),
                    name = "Instant Finish",
                    type = eFeatureType.Button,
                    desc = "Finishes the heist instantly. Set the buyer to Low. Use after you can see the minimap.",
                    func = function()
                        GTA.ForceScriptHost(eScript.Heist.DiamondCasino)
                        Script.Yield(1000)

                        if eStat.MPX_H3OPT_APPROACH:Get() == 3 then
                            eLocal.Heist.DiamondCasino.Finish.Step1:Set(12)
                            eLocal.Heist.DiamondCasino.Finish.Step3:Set(80)
                            eLocal.Heist.DiamondCasino.Finish.Step4:Set(10000000)
                            eLocal.Heist.DiamondCasino.Finish.Step5:Set(99999)
                            eLocal.Heist.DiamondCasino.Finish.Step6:Set(99999)
                        else
                            eLocal.Heist.DiamondCasino.Finish.Step2:Set(5)
                            eLocal.Heist.DiamondCasino.Finish.Step3:Set(80)
                            eLocal.Heist.DiamondCasino.Finish.Step4:Set(10000000)
                            eLocal.Heist.DiamondCasino.Finish.Step5:Set(99999)
                            eLocal.Heist.DiamondCasino.Finish.Step6:Set(99999)
                        end
                    end
                },

                FingerprintHack = {
                    hash = J("SN_DiamondCasino_FingerprintHack"),
                    name = "Bypass Fingerprint Hack",
                    type = eFeatureType.Button,
                    desc = "Skips the fingerprint hacking process.",
                    func = function()
                        eLocal.Heist.DiamondCasino.Bypass.FingerprintHack:Set(5)
                    end
                },

                KeypadHack = {
                    hash = J("SN_DiamondCasino_KeypadHack"),
                    name = "Bypass Keypad Hack",
                    type = eFeatureType.Button,
                    desc = "Skips the keypad hacking process.",
                    func = function()
                        eLocal.Heist.DiamondCasino.Bypass.KeypadHack:Set(5)
                    end
                },

                VaultDoorDrill = {
                    hash = J("SN_DiamondCasino_VaultDoorDrill"),
                    name = "Bypass Vault Door Drill",
                    type = eFeatureType.Button,
                    desc = "Skips the vault door drilling process.",
                    func = function()
                        eLocal.Heist.DiamondCasino.Bypass.VaultDrill1:Set(eLocal.Heist.DiamondCasino.Bypass.VaultDrill2:Get())
                    end
                },

                Autograbber = {
                    hash = J("SN_DiamondCasino_Autograbber"),
                    name = "Autograbber",
                    type = eFeatureType.Toggle,
                    desc = "Grabs cash/gold/diamonds automatically. Might be slower than manually.",
                    func = function(ftr)
                        if ftr:IsToggled() then
                            if eLocal.Heist.DiamondCasino.Autograbber.Grab:Get() == 3 then
                                eLocal.Heist.DiamondCasino.Autograbber.Grab:Set(4)
                            elseif eLocal.Heist.DiamondCasino.Autograbber.Grab:Get() == 4 then
                                eLocal.Heist.DiamondCasino.Autograbber.Speed:Set(2.0)
                            end
                            Script.Yield()
                        end
                    end
                },

                Cooldown = {
                    hash = J("SN_DiamondCasino_Cooldown"),
                    name = "Kill Cooldown",
                    type = eFeatureType.Button,
                    desc = "Skips the heist's cooldown. Doesn't skip the cooldown between transactions (20 min). Use outside of your arcade.",
                    func = function()
                        eStat.MPX_H3_COMPLETEDPOSIX:Set(-1)
                        eStat.MPPLY_H3_COOLDOWN:Set(-1)
                    end
                },

                Unlock = {
                    hash = J("SN_DiamondCasino_Unlock"),
                    name = "Unlock All POI",
                    type = eFeatureType.Button,
                    desc = "Unlocks all points of interest. Also, redraws the planning board.",
                    func = function()
                        eStat.MPX_H3OPT_POI:Set(-1)
                        eStat.MPX_H3OPT_ACCESSPOINTS:Set(-1)
                        eStat.MPX_CAS_HEIST_NOTS:Set(-1)
                        eStat.MPX_CAS_HEIST_FLOW:Set(-1)
                        eLocal.Heist.DiamondCasino.Reload:Set(2)
                    end
                },

                Setup = {
                    hash = J("SN_DiamondCasino_Setup"),
                    name = "Skip Setup",
                    type = eFeatureType.Button,
                    desc = "Skips the setup mission for your Arcade. Change the session to apply.",
                    func = function()
                        ePackedBool.Business.Arcade.Setup:Set(true)
                    end
                }
            },

            Cuts = {
                Team = {
                    hash = J("SN_DiamondCasino_Team"),
                    name = "Team",
                    type = eFeatureType.Combo,
                    desc = "Select your number of players.",
                    list = eTable.Heist.Generic.Team
                },

                Presets = {
                    hash = J("SN_DiamondCasino_Presets"),
                    name = "Presets",
                    type = eFeatureType.Combo,
                    desc = "Select one of the ready-made presets.",
                    list = eTable.Heist.DiamondCasino.Presets,
                    func = function()
                        Helper.SetDiamondMaxPayout()
                        Script.Yield()
                    end
                },

                Crew = {
                    hash = J("SN_DiamondCasino_Crew"),
                    name = "Remove Crew Cuts",
                    type = eFeatureType.Toggle,
                    desc = "Removes crew cuts and Lester's cut. Should be used with «Instant Finish».",
                    func = function(ftr)
                        local bool = ftr:IsToggled()

                        local function SetOrResetCuts(tbl, bool)
                            for _, v in pairs(tbl) do
                                if type(v) == "table" and v.Set then
                                    if bool then
                                        v:Set(0)
                                    else
                                        v:Reset()
                                    end
                                elseif type(v) == "table" then
                                    SetOrResetCuts(v, bool)
                                end
                            end
                        end

                        SetOrResetCuts(eTunable.Heist.DiamondCasino.Cut, bool)
                    end
                },

                Player1 = {
                    hash = J("SN_DiamondCasino_Player1"),
                    name = "Player 1",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 1.",
                    defv = 0,
                    lims = { 0, 999 },
                    step = 1
                },

                Player2 = {
                    hash = J("SN_DiamondCasino_Player2"),
                    name = "Player 2",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 2.",
                    defv = 0,
                    lims = { 0, 999 },
                    step = 1
                },

                Player3 = {
                    hash = J("SN_DiamondCasino_Player3"),
                    name = "Player 3",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 3.",
                    defv = 0,
                    lims = { 0, 999 },
                    step = 1
                },

                Player4 = {
                    hash = J("SN_DiamondCasino_Player4"),
                    name = "Player 4",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 4.",
                    defv = 0,
                    lims = { 0, 999 },
                    step = 1
                },

                Apply = {
                    hash = J("SN_DiamondCasino_Apply"),
                    name = "Apply Cuts",
                    type = eFeatureType.Button,
                    desc = "Applies the selected cuts for players. If solo, apply near the planning board.",
                    func = function(cuts)
                        for i = 1, 4 do
                            eGlobal.Heist.DiamondCasino.Cut[F("Player%d", i)]:Set(cuts[i])
                        end
                    end
                }
            },

            Presets = {
                File = {
                    hash = J("SN_DiamondCasino_File"),
                    name = "File",
                    type = eFeatureType.Combo,
                    desc = "Select the desired preset.",
                    list = eTable.Heist.DiamondCasino.Files
                },

                Load = {
                    hash = J("SN_DiamondCasino_Load"),
                    name = "Load",
                    type = eFeatureType.Button,
                    desc = "Loads the selected preset.",
                    func = function(file)
                        local path = F("%s\\%s.json", DIAMOND_DIR, file)
                        if FileMgr.DoesFileExist(path) then
                            local preps = Json.DecodeFromFile(path)
                            Helper.ApplyDiamondPreset(preps)
                        end
                    end
                },

                Remove = {
                    hash = J("SN_DiamondCasino_Remove"),
                    name = "Remove",
                    type = eFeatureType.Button,
                    desc = "Removes the selected preset.",
                    func = function(file)
                        local path = F("%s\\%s.json", DIAMOND_DIR, file)
                        if FileMgr.DoesFileExist(path) then
                            FileMgr.DeleteFile(path)
                            Helper.RefreshPresetsFiles()
                        end
                    end
                },

                Refresh = {
                    hash = J("SN_DiamondCasino_Refresh"),
                    name = "Refresh",
                    type = eFeatureType.Button,
                    desc = "Refreshes the list of presets.",
                    func = function()
                        Helper.RefreshPresetsFiles()
                    end
                },

                Name = {
                    hash = J("SN_DiamondCasino_Name"),
                    name = "QuickPreset",
                    type = eFeatureType.InputText,
                    desc = "Input the desired preset name."
                },

                Save = {
                    hash = J("SN_DiamondCasino_Save"),
                    name = "Save",
                    type = eFeatureType.Button,
                    desc = "Saves the current preparations to the file.",
                    func = function(file, preps)
                        FileMgr.CreateHeistPresetsDirs()
                        local path = F("%s\\%s.json", DIAMOND_DIR, file)
                        Json.EncodeToFile(path, preps)
                        Helper.RefreshPresetsFiles()
                    end
                },

                Copy = {
                    hash = J("SN_DiamondCasino_Copy"),
                    name = "Copy Folder Path",
                    type = eFeatureType.Button,
                    desc = "Copies the presets folder path to the clipboard.",
                    func = function()
                        FileMgr.CreateHeistPresetsDirs()
                        ImGui.SetClipboardText(DIAMOND_DIR)
                    end
                }
            }
        },

        Doomsday = {
            Preps = {
                Act = {
                    hash = J("SN_Doomsday_Act"),
                    name = "Act",
                    type = eFeatureType.Combo,
                    desc = "Select the desired doomsday act.",
                    list = eTable.Heist.Doomsday.Acts
                },

                Complete = {
                    hash = J("SN_Doomsday_Complete"),
                    name = "Apply & Complete Preps",
                    type = eFeatureType.Button,
                    desc = "Applies all changes and completes all preparations. Also, reloads the planning screen.",
                    func = function(act)
                        local acts = {
                            [1] = { 503,   -229383 },
                            [2] = { 240,   -229378 },
                            [3] = { 16368, -229380 }
                        }

                        eStat.MPX_GANGOPS_FLOW_MISSION_PROG:Set(acts[act][1])
                        eStat.MPX_GANGOPS_HEIST_STATUS:Set(acts[act][2])
                        eStat.MPX_GANGOPS_FLOW_NOTIFICATIONS:Set(1557)
                        eLocal.Heist.Doomsday.Reload:Set(6)
                    end
                },

                Reset = {
                    hash = J("SN_Doomsday_Reset"),
                    name = "Reset Preps",
                    type = eFeatureType.Button,
                    desc = "Resets all preparations. Also, reloads the planning screen.",
                    func = function()
                        eStat.MPX_GANGOPS_FLOW_MISSION_PROG:Set(503)
                        eStat.MPX_GANGOPS_HEIST_STATUS:Set(0)
                        eStat.MPX_GANGOPS_FLOW_NOTIFICATIONS:Set(1557)
                        eLocal.Heist.Doomsday.Reload:Set(6)
                    end
                },

                Reload = {
                    hash = J("SN_Doomsday_Reload"),
                    name = "Reload Screen",
                    type = eFeatureType.Button,
                    desc = "Reloads the planning screen.",
                    func = function()
                        eLocal.Heist.Doomsday.Reload:Set(6)
                    end
                }
            },

            Misc = {
                Force = {
                    hash = J("SN_Doomsday_Force"),
                    name = "Force Ready",
                    type = eFeatureType.Button,
                    desc = "Forces everyone to be «Ready».",
                    func = function()
                        GTA.ForceScriptHost(eScript.Heist.Doomsday)
                        Script.Yield(1000)
                        for i = 2, 4 do
                            eGlobal.Heist.Doomsday.Ready[F("Player%d", i)]:Set(1)
                        end
                    end
                },

                DataHack = {
                    hash = J("SN_Doomsday_DataHack"),
                    name = "Bypass Data Breaches Hack",
                    type = eFeatureType.Button,
                    desc = "Skips the hacking process of The Data Breaches heist.",
                    func = function()
                        eLocal.Heist.Doomsday.Bypass.DataHack:Set(2)
                    end
                },

                DoomsdayHack = {
                    hash = J("SN_Doomsday_DoomsdayHack"),
                    name = "Bypass Dooms. Scen. Hack",
                    type = eFeatureType.Button,
                    desc = "Skips the hacking process of The Doomsday Scenario heist.",
                    func = function()
                        eLocal.Heist.Doomsday.Bypass.DoomsdayHack:Set(3)
                    end
                }
            },

            Cuts = {
                Team = {
                    hash = J("SN_Doomsday_Team"),
                    name = "Team",
                    type = eFeatureType.Combo,
                    desc = "Select your number of players.",
                    list = eTable.Heist.Generic.Team
                },

                Presets = {
                    hash = J("SN_Doomsday_Presets"),
                    name = "Presets",
                    type = eFeatureType.Combo,
                    desc = "Select one of the ready-made presets. 2.55mil Payout only works if you've set the Act through the script.",
                    list = eTable.Heist.Doomsday.Presets,
                    func = function()
                        Helper.SetDoomsdayMaxPayout()
                        Script.Yield()
                    end
                },

                Player1 = {
                    hash = J("SN_Doomsday_Player1"),
                    name = "Player 1",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 1.",
                    defv = 0,
                    lims = { 0, 999 },
                    step = 1
                },

                Player2 = {
                    hash = J("SN_Doomsday_Player2"),
                    name = "Player 2",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 2.",
                    defv = 0,
                    lims = { 0, 999 },
                    step = 1
                },

                Player3 = {
                    hash = J("SN_Doomsday_Player3"),
                    name = "Player 3",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 3.",
                    defv = 0,
                    lims = { 0, 999 },
                    step = 1
                },

                Player4 = {
                    hash = J("SN_Doomsday_Player4"),
                    name = "Player 4",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 4.",
                    defv = 0,
                    lims = { 0, 999 },
                    step = 1
                },

                Apply = {
                    hash = J("SN_Doomsday_Apply"),
                    name = "Apply Cuts",
                    type = eFeatureType.Button,
                    desc = "Applies the selected cuts for players.",
                    func = function(cuts)
                        for i = 1, 4 do
                            eGlobal.Heist.Doomsday.Cut[F("Player%d", i)]:Set(cuts[i])
                        end
                    end
                }
            }
        },

        SalvageYard = {
            Slot1 = {
                Robbery = {
                    hash = J("SN_SalvageYard_RobberySlot1"),
                    name = "Robbery",
                    type = eFeatureType.Combo,
                    desc = "Select the desired robbery type for slot 1.",
                    list = eTable.Heist.SalvageYard.Robberies
                },

                Vehicle = {
                    hash = J("SN_SalvageYard_VehicleSlot1"),
                    name = "Vehicle",
                    type = eFeatureType.Combo,
                    desc = "Select the desired vehicle type for slot 1.",
                    list = eTable.Heist.SalvageYard.Vehicles
                },

                Modification = {
                    hash = J("SN_SalvageYard_ModificationSlot1"),
                    name = "Modification",
                    type = eFeatureType.Combo,
                    desc = "Select the desired vehicle modification for slot 1.",
                    list = eTable.Heist.SalvageYard.Modifications
                },

                Keep = {
                    hash = J("SN_SalvageYard_KeepSlot1"),
                    name = "Status",
                    type = eFeatureType.Combo,
                    desc = "Select whether you can keep the vehicle for slot 1.",
                    list = eTable.Heist.SalvageYard.Keeps
                },

                Apply = {
                    hash = J("SN_SalvageYard_ApplySlot1"),
                    name = "Apply Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes for the slot 1. Also, reloads the planning screen. Use before you start the preparation.",
                    func = function(robbery, vehicle, modification, keep)
                        eGlobal.Heist.SalvageYard.Robbery.Slot1.Type:Set(robbery)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot1.Type:Set(vehicle + modification * 100)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot1.CanKeep:Set(keep)
                        eLocal.Heist.SalvageYard.Reload:Set(2)
                    end
                }
            },

            Slot2 = {
                Robbery = {
                    hash = J("SN_SalvageYard_RobberySlot2"),
                    name = "Robbery",
                    type = eFeatureType.Combo,
                    desc = "Select the desired robbery type for slot 2.",
                    list = eTable.Heist.SalvageYard.Robberies
                },

                Vehicle = {
                    hash = J("SN_SalvageYard_VehicleSlot2"),
                    name = "Vehicle",
                    type = eFeatureType.Combo,
                    desc = "Select the desired vehicle type for slot 2.",
                    list = eTable.Heist.SalvageYard.Vehicles
                },

                Modification = {
                    hash = J("SN_SalvageYard_ModificationSlot2"),
                    name = "Modification",
                    type = eFeatureType.Combo,
                    desc = "Select the desired vehicle modification for slot 2.",
                    list = eTable.Heist.SalvageYard.Modifications
                },

                Keep = {
                    hash = J("SN_SalvageYard_KeepSlot2"),
                    name = "Status",
                    type = eFeatureType.Combo,
                    desc = "Select whether you can keep the vehicle for slot 2.",
                    list = eTable.Heist.SalvageYard.Keeps
                },

                Apply = {
                    hash = J("SN_SalvageYard_ApplySlot2"),
                    name = "Apply Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes for the slot 2. Also, reloads the planning screen. Use before you start the preparation.",
                    func = function(robbery, vehicle, modification, keep)
                        eGlobal.Heist.SalvageYard.Robbery.Slot2.Type:Set(robbery)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot2.Type:Set(vehicle + modification * 100)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot2.CanKeep:Set(keep)
                        eLocal.Heist.SalvageYard.Reload:Set(2)
                    end
                }
            },

            Slot3 = {
                Robbery = {
                    hash = J("SN_SalvageYard_RobberySlot3"),
                    name = "Robbery",
                    type = eFeatureType.Combo,
                    desc = "Select the desired robbery type for slot 3.",
                    list = eTable.Heist.SalvageYard.Robberies
                },

                Vehicle = {
                    hash = J("SN_SalvageYard_VehicleSlot3"),
                    name = "Vehicle",
                    type = eFeatureType.Combo,
                    desc = "Select the desired vehicle type for slot 3.",
                    list = eTable.Heist.SalvageYard.Vehicles
                },

                Modification = {
                    hash = J("SN_SalvageYard_ModificationSlot3"),
                    name = "Modification",
                    type = eFeatureType.Combo,
                    desc = "Select the desired vehicle modification for slot 3.",
                    list = eTable.Heist.SalvageYard.Modifications
                },

                Keep = {
                    hash = J("SN_SalvageYard_KeepSlot3"),
                    name = "Status",
                    type = eFeatureType.Combo,
                    desc = "Select whether you can keep the vehicle for slot 3.",
                    list = eTable.Heist.SalvageYard.Keeps
                },

                Apply = {
                    hash = J("SN_SalvageYard_ApplySlot3"),
                    name = "Apply Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes for the slot 3. Also, reloads the planning screen. Use before you start the preparation.",
                    func = function(robbery, vehicle, modification, keep)
                        eGlobal.Heist.SalvageYard.Robbery.Slot3.Type:Set(robbery)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot3.Type:Set(vehicle + modification * 100)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot3.CanKeep:Set(keep)
                        eLocal.Heist.SalvageYard.Reload:Set(2)
                    end
                }
            },

            Preps = {
                Apply = {
                    hash = J("SN_SalvageYard_ApplyAll"),
                    name = "Apply All Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes. Also, reloads the planning screen. Use before you start the preparation.",
                    func = function(robbery1, vehicle1, mod1, keep1, robbery2, vehicle2, mod2, keep2, robbery3, vehicle3, mod3, keep3)
                        eGlobal.Heist.SalvageYard.Robbery.Slot1.Type:Set(robbery1)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot1.Type:Set(vehicle1 + mod1 * 100)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot1.CanKeep:Set(keep1)
                        eGlobal.Heist.SalvageYard.Robbery.Slot2.Type:Set(robbery2)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot2.Type:Set(vehicle2 + mod2 * 100)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot2.CanKeep:Set(keep2)
                        eGlobal.Heist.SalvageYard.Robbery.Slot3.Type:Set(robbery3)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot3.Type:Set(vehicle3 + mod3 * 100)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot3.CanKeep:Set(keep3)
                        eLocal.Heist.SalvageYard.Reload:Set(2)
                    end
                },

                Complete = {
                    hash = J("SN_SalvageYard_Complete"),
                    name = "Complete Preps",
                    type = eFeatureType.Button,
                    desc = "Completes all preparations. Also, reloads the planning screen.",
                    func = function()
                        eStat.MPX_SALV23_GEN_BS:Set(-1)
                        eStat.MPX_SALV23_SCOPE_BS:Set(-1)
                        eStat.MPX_SALV23_FM_PROG:Set(-1)
                        eStat.MPX_SALV23_INST_PROG:Set(-1)
                        eLocal.Heist.SalvageYard.Reload:Set(2)
                    end
                },

                Reset = {
                    hash = J("SN_SalvageYard_Reset"),
                    name = "Reset Preps",
                    type = eFeatureType.Button,
                    desc = "Resets all preparations. Also, reloads the planning screen.",
                    func = function()
                        eStat.MPX_SALV23_GEN_BS:Set(0)
                        eStat.MPX_SALV23_SCOPE_BS:Set(0)
                        eStat.MPX_SALV23_FM_PROG:Set(0)
                        eStat.MPX_SALV23_INST_PROG:Set(0)
                        eLocal.Heist.SalvageYard.Reload:Set(2)
                    end
                },

                Reload = {
                    hash = J("SN_SalvageYard_Reload"),
                    name = "Reload Screen",
                    type = eFeatureType.Button,
                    desc = "Reloads the planning screen.",
                    func = function()
                        eLocal.Heist.SalvageYard.Reload:Set(2)
                    end
                }
            },

            Misc = {
                Cooldown = {
                    Kill = {
                        hash = J("SN_SalvageYard_Cooldown"),
                        name = "Kill Cooldowns",
                        type = eFeatureType.Button,
                        desc = "Skips the heist's cooldowns. Use outside of your salvage yard.",
                        func = function()
                            eTunable.Heist.SalvageYard.Cooldown.Robbery:Set(0)
                            eTunable.Heist.SalvageYard.Cooldown.Cfr:Set(0)
                        end
                    },

                    Skip = {
                        hash = J("SN_SalvageYard_Weekly"),
                        name = "Skip Weekly Cooldown",
                        type = eFeatureType.Button,
                        desc = "Skips the heist's weekly cooldown. Also, reloads the planning screen.",
                        func = function()
                            eTunable.Heist.SalvageYard.Cooldown.Weekly:Set(eStat.MPX_SALV23_WEEK_SYNC:Get() + 1)
                            eLocal.Heist.SalvageYard.Reload:Set(2)
                        end
                    }
                },

                Availability = {
                    Slot1 = {
                        hash = J("SN_SalvageYard_AvailableSlot1"),
                        name = "Make Slot 1 Available",
                        type = eFeatureType.Button,
                        desc = "Makes the slot 1 «Available». Also, reloads the planning screen.",
                        func = function()
                            eStat.MPX_SALV23_VEHROB_STATUS0:Set(0)
                            eLocal.Heist.SalvageYard.Reload:Set(2)
                        end
                    },

                    Slot2 = {
                        hash = J("SN_SalvageYard_AvailableSlot2"),
                        name = "Make Slot 2 Available",
                        type = eFeatureType.Button,
                        desc = "Makes the slot 2 «Available». Also, reloads the planning screen.",
                        func = function()
                            eStat.MPX_SALV23_VEHROB_STATUS1:Set(0)
                            eLocal.Heist.SalvageYard.Reload:Set(2)
                        end
                    },

                    Slot3 = {
                        hash = J("SN_SalvageYard_AvailableSlot3"),
                        name = "Make Slot 3 Available",
                        type = eFeatureType.Button,
                        desc = "Makes the slot 3 «Available». Also, reloads the planning screen.",
                        func = function()
                            eStat.MPX_SALV23_VEHROB_STATUS2:Set(0)
                            eLocal.Heist.SalvageYard.Reload:Set(2)
                        end
                    }
                },

                Free = {
                    Setup = {
                        hash = J("SN_SalvageYard_Setup"),
                        name = "Free Setup",
                        type = eFeatureType.Toggle,
                        desc = "Allows setuping the heist for free.",
                        func = function(ftr)
                            local bool = ftr:IsToggled()
                            eTunable.Heist.SalvageYard.Robbery.SetupPrice:Set((bool) and 0 or 20000)
                        end
                    },

                    Claim = {
                        hash = J("SN_SalvageYard_Claim"),
                        name = "Free Claim",
                        type = eFeatureType.Toggle,
                        desc = "Allows claiming the vehicles for free.",
                        func = function(ftr)
                            local bool = ftr:IsToggled()
                            eTunable.Heist.SalvageYard.Vehicle.ClaimPrice.Standard:Set((bool) and 0 or 20000)
                            eTunable.Heist.SalvageYard.Vehicle.ClaimPrice.Discounted:Set((bool) and 0 or 10000)
                        end
                    }
                }
            },

            Payout = {
                Salvage = {
                    hash = J("SN_SalvageYard_Salvage"),
                    name = "Salvage Value Multiplier",
                    type = eFeatureType.InputFloat,
                    desc = "Select the desired salvage value multiplier.",
                    defv = eGlobal.Heist.SalvageYard.Vehicle.SalvageValueMultiplier:Get(),
                    lims = { 0.0, 5.0 },
                    step = 0.1
                },

                Slot1 = {
                    hash = J("SN_SalvageYard_SelectSlot1"),
                    name = "Sell Value Slot 1",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sell value for the vehicle in slot 1.",
                    defv = eGlobal.Heist.SalvageYard.Vehicle.Slot1.Value:Get(),
                    lims = { 0, 2100000 },
                    step = 100000
                },

                Slot2 = {
                    hash = J("SN_SalvageYard_SelectSlot2"),
                    name = "Sell Value Slot 2",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sell value for the vehicle in slot 2.",
                    defv = eGlobal.Heist.SalvageYard.Vehicle.Slot2.Value:Get(),
                    lims = { 0, 2100000 },
                    step = 100000
                },

                Slot3 = {
                    hash = J("SN_SalvageYard_SelectSlot3"),
                    name = "Sell Value Slot 3",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sell value for the vehicle in slot 3.",
                    defv = eGlobal.Heist.SalvageYard.Vehicle.Slot3.Value:Get(),
                    lims = { 0, 2100000 },
                    step = 100000
                },

                Apply = {
                    hash = J("SN_SalvageYard_Apply"),
                    name = "Apply Sell Values",
                    type = eFeatureType.Button,
                    desc = "Applies the selected sell values for the vehicles. Also, reloads the planning screen. Use before you start the preparation.",
                    func = function(salvageMultiplier, sellValue1, sellValue2, sellValue3)
                        eGlobal.Heist.SalvageYard.Vehicle.SalvageValueMultiplier:Set(salvageMultiplier)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot1.Value:Set(sellValue1)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot2.Value:Set(sellValue2)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot3.Value:Set(sellValue3)
                        eLocal.Heist.SalvageYard.Reload:Set(2)
                    end
                }
            }
        }
    },

    Business = {
        Bunker = {
            Sale = {
                Price = {
                    hash = J("SN_Bunker_Price"),
                    name = "Maximize Price",
                    type = eFeatureType.Toggle,
                    desc = "MIGHT BE UNSAFE. Applies the maximum price for your stock.",
                    func = function(ftr)
                        if ftr:IsToggled() then
                            if not GTA.IsInSessionAlone() then
                                GTA.EmptySession()
                            end

                            if eStat.MPX_PRODTOTALFORFACTORY5:Get() == 0 then
                                eGlobal.Business.Supplies.Bunker:Set(1)
                                Script.Yield(1000)
                                eGlobal.Business.Bunker.Production.Trigger1:Set(0)
                                eGlobal.Business.Bunker.Production.Trigger2:Set(true)
                            end

                            eTunable.Business.Bunker.Product.Value:Set(math.floor((2500000 / 1.5) / eStat.MPX_PRODTOTALFORFACTORY5:Get()))
                            eTunable.Business.Bunker.Product.StaffUpgraded:Set(0)
                            eTunable.Business.Bunker.Product.EquipmentUpgraded:Set(0)
                            Script.Yield()
                        else
                            eTunable.Business.Bunker.Product.Value:Reset()
                            eTunable.Business.Bunker.Product.StaffUpgraded:Reset()
                            eTunable.Business.Bunker.Product.EquipmentUpgraded:Reset()
                        end
                    end
                },

                NoXp = {
                    hash = J("SN_Bunker_NoXp"),
                    name = "No XP Gain",
                    type = eFeatureType.Toggle,
                    desc = "Disables the xp gain for sell missions."
                },

                Sell = {
                    hash = J("SN_Bunker_Sell"),
                    name = "Instant Sell",
                    type = eFeatureType.Button,
                    desc = "Finishes the sell mission instantly. Use after you can see the minimap.",
                    func = function(bool)
                        eGlobal.World.Multiplier.Xp:Set((bool) and 0.0 or 1.0)
                        eLocal.Business.Bunker.Sell.Finish:Set(0)
                    end
                }
            },

            Misc = {
                Open = {
                    hash = J("SN_Bunker_Open"),
                    name = "Open Laptop",
                    type = eFeatureType.Button,
                    desc = "Opens the Bunker's laptop screen.",
                    func = function()
                        GTA.StartScript(eScript.Business.Bunker.Laptop)
                    end
                },

                Supply = {
                    hash = J("SN_Bunker_Supply"),
                    name = "Get Supplies",
                    type = eFeatureType.Button,
                    desc = "Gets supplies for your Bunker.",
                    func = function()
                        eGlobal.Business.Supplies.Bunker:Set(1)
                    end
                },

                Trigger = {
                    hash = J("SN_Bunker_Trigger"),
                    name = "Trigger Production",
                    type = eFeatureType.Button,
                    desc = "Triggers production of your stock.",
                    func = function()
                        if not GTA.IsScriptRunning(eScript.Business.Bunker.Laptop) then
                            eGlobal.Business.Bunker.Production.Trigger1:Set(0)
                            eGlobal.Business.Bunker.Production.Trigger2:Set(true)
                        end
                    end
                },

                Supplier = {
                    hash = J("SN_Bunker_Supplier"),
                    name = "Turkish Supplier",
                    type = eFeatureType.Toggle,
                    desc = "Fills your Bunker stock. Also, gets supplies for your Bunker repeatedly.",
                    func = function()
                        if not GTA.IsScriptRunning(eScript.Business.Bunker.Laptop) then
                            eGlobal.Business.Supplies.Bunker:Set(1)
                            eGlobal.Business.Bunker.Production.Trigger1:Set(0)
                            eGlobal.Business.Bunker.Production.Trigger2:Set(true)
                            Script.Yield(1000)
                        end
                    end
                }
            },

            Stats = {
                SellMade = {
                    hash = J("SN_Bunker_Sell Made"),
                    name = "Sell Made",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sales made.",
                    defv = eStat.MPX_LIFETIME_BKR_SEL_COMPLETBC5:Get(),
                    lims = { 0, INT32_MAX },
                    step = 10
                },

                SellUndertaken = {
                    hash = J("SN_Bunker_Undertaken"),
                    name = "Sell Undertaken",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sales undertaken.",
                    defv = eStat.MPX_LIFETIME_BKR_SEL_UNDERTABC5:Get(),
                    lims = { 0, INT32_MAX },
                    step = 10
                },

                Earnings = {
                    hash = J("SN_Bunker_Earnings"),
                    name = "Earnings",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired earnings.",
                    defv = eStat.MPX_LIFETIME_BKR_SELL_EARNINGS5:Get(),
                    lims = { 0, INT32_MAX },
                    step = 1000000
                },

                NoSell = {
                    hash = J("SN_Bunker_NoSell"),
                    name = "Don't Apply Sell",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new sell missions or not."
                },

                NoEarnings = {
                    hash = J("SN_Bunker_NoEarnings"),
                    name = "Don't Apply Earnings",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new earnings or not."
                },

                Apply = {
                    hash = J("SN_Bunker_Apply"),
                    name = "Apply All Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes.",
                    func = function(bool1, bool2, sellMade, sellUndertaken, earnings)
                        if not bool1 then
                            eStat.MPX_LIFETIME_BKR_SEL_COMPLETBC5:Set(sellMade)
                            eStat.MPX_LIFETIME_BKR_SEL_UNDERTABC5:Set(sellUndertaken)
                            eStat.MPX_BUNKER_UNITS_MANUFAC:Set(sellMade * 100)
                        end
                        if not bool2 then
                            eStat.MPX_LIFETIME_BKR_SELL_EARNINGS5:Set(earnings)
                        end
                    end
                }
            }
        },

        Hangar = {
            Sale = {
                Price = {
                    hash = J("SN_Hangar_Price"),
                    name = "Maximize Price",
                    type = eFeatureType.Toggle,
                    desc = "MIGHT BE UNSAFE. Applies the maximum price for your cargo.",
                    func = function(ftr)
                        if not GTA.IsScriptRunning(eScript.Business.Hangar.Sell) then
                            if ftr:IsToggled() then
                                if not GTA.IsInSessionAlone() then
                                    GTA.EmptySession()
                                end

                                if eStat.MPX_HANGAR_CONTRABAND_TOTAL:Get() < 4 then
                                    ePackedBool.Business.Hangar.Cargo:Set(true)
                                    Script.Yield(1000)
                                end

                                eTunable.Business.Hangar.Price:Set(math.floor(4000000 / eStat.MPX_HANGAR_CONTRABAND_TOTAL:Get()))
                                eTunable.Business.Hangar.RonsCut:Set(0.0)
                                Script.Yield()
                            else
                                eTunable.Business.Hangar.Price:Reset()
                                eTunable.Business.Hangar.RonsCut:Reset()
                            end
                        end
                    end
                },

                NoXp = {
                    hash = J("SN_Hangar_NoXp"),
                    name = "No XP Gain",
                    type = eFeatureType.Toggle,
                    desc = "Disables the xp gain for sell missions."
                },

                Sell = {
                    hash = J("SN_Hangar_Sell"),
                    name = "Instant Air Cargo Sell",
                    type = eFeatureType.Button,
                    desc = "Finishes the air cargo sell mission instantly. Use after you can see the minimap.",
                    func = function(bool)
                        eGlobal.World.Multiplier.Xp:Set((bool) and 0.0 or 1.0)
                        eLocal.Business.Hangar.Sell.Finish:Set(eLocal.Business.Hangar.Sell.Delivered:Get())
                    end
                }
            },

            Misc = {
                Open = {
                    hash = J("SN_Hangar_Open"),
                    name = "Open Laptop",
                    type = eFeatureType.Button,
                    desc = "Opens the Hangar's laptop screen.",
                    func = function()
                        GTA.StartScript(eScript.Business.Hangar.Laptop)
                    end
                },

                Supply = {
                    hash = J("SN_Hangar_Supply"),
                    name = "Get Cargo",
                    type = eFeatureType.Button,
                    desc = "Gets cargo for your Hangar.",
                    func = function()
                        if not GTA.IsScriptRunning(eScript.Business.Hangar.Laptop) then
                            ePackedBool.Business.Hangar.Cargo:Set(true)
                        end
                    end
                },

                Supplier = {
                    hash = J("SN_Hangar_Supplier"),
                    name = "Turkish Supplier",
                    type = eFeatureType.Toggle,
                    desc = "Fills your Hangar stock repeatedly.",
                    func = function()
                        if not GTA.IsScriptRunning(eScript.Business.Hangar.Laptop) then
                            ePackedBool.Business.Hangar.Cargo:Set(true)
                            Script.Yield(1000)
                        end
                    end
                },

                Cooldown = {
                    hash = J("SN_Hangar_Cooldown"),
                    name = "Kill Cooldowns",
                    type = eFeatureType.Toggle,
                    desc = "Skips almost all cooldowns.",
                    func = function(ftr)
                        if ftr:IsToggled() then
                            eTunable.Business.Hangar.Cooldown.Steal.Easy:Set(0)
                            eTunable.Business.Hangar.Cooldown.Steal.Medium:Set(0)
                            eTunable.Business.Hangar.Cooldown.Steal.Hard:Set(0)
                            eTunable.Business.Hangar.Cooldown.Steal.Additional:Set(0)
                            eTunable.Business.Hangar.Cooldown.Sell:Set(0)
                        else
                            eTunable.Business.Hangar.Cooldown.Steal.Easy:Reset()
                            eTunable.Business.Hangar.Cooldown.Steal.Medium:Reset()
                            eTunable.Business.Hangar.Cooldown.Steal.Hard:Reset()
                            eTunable.Business.Hangar.Cooldown.Steal.Additional:Reset()
                            eTunable.Business.Hangar.Cooldown.Sell:Reset()
                        end
                    end
                }
            },

            Stats = {
                BuyMade = {
                    hash = J("SN_Hangar_BuyMade"),
                    name = "Buy Made",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired buy made.",
                    defv = eStat.MPX_LFETIME_HANGAR_BUY_COMPLET:Get(),
                    lims = { 0, INT32_MAX },
                    step = 10
                },

                BuyUndertaken = {
                    hash = J("SN_Hangar_BuyUndertaken"),
                    name = "Buy Undertaken",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired buy undertaken.",
                    defv = eStat.MPX_LFETIME_HANGAR_BUY_UNDETAK:Get(),
                    lims = { 0, INT32_MAX },
                    step = 10
                },

                SellMade = {
                    hash = J("SN_Hangar_SellMade"),
                    name = "Sell Made",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sales made.",
                    defv = eStat.MPX_LFETIME_HANGAR_SEL_COMPLET:Get(),
                    lims = { 0, INT32_MAX },
                    step = 10
                },

                SellUndertaken = {
                    hash = J("SN_Hangar_SellUndertaken"),
                    name = "Sell Undertaken",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sales undertaken.",
                    defv = eStat.MPX_LFETIME_HANGAR_SEL_UNDETAK:Get(),
                    lims = { 0, INT32_MAX },
                    step = 10
                },

                Earnings = {
                    hash = J("SN_Hangar_Earnings"),
                    name = "Earnings",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired earnings.",
                    defv = eStat.MPX_LFETIME_HANGAR_EARNINGS:Get(),
                    lims = { 0, INT32_MAX },
                    step = 1000000
                },

                NoBuy = {
                    hash = J("SN_Hangar_NoBuy"),
                    name = "Don't Apply Buy",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new buy missions or not."
                },

                NoSell = {
                    hash = J("SN_Hangar_NoSell"),
                    name = "Don't Apply Sell",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new sell missions or not."
                },

                NoEarnings = {
                    hash = J("SN_Hangar_NoEarnings"),
                    name = "Don't Apply Earnings",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new earnings or not."
                },

                Apply = {
                    hash = J("SN_Hangar_Apply"),
                    name = "Apply All Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes.",
                    func = function(bool1, bool2, bool3, buyMade, buyUndertaken, sellMade, sellUndertaken, earnings)
                        if not bool1 then
                            eStat.MPX_LFETIME_HANGAR_BUY_COMPLET:Set(buyMade)
                            eStat.MPX_LFETIME_HANGAR_BUY_UNDETAK:Set(buyUndertaken)
                        end
                        if not bool2 then
                            eStat.MPX_LFETIME_HANGAR_SEL_COMPLET:Set(sellMade)
                            eStat.MPX_LFETIME_HANGAR_SEL_UNDETAK:Set(sellUndertaken)
                        end
                        if not bool3 then
                            eStat.MPX_LFETIME_HANGAR_EARNINGS:Set(earnings)
                        end
                    end
                }
            }
        },

        Nightclub = {
            Sale = {
                Price = {
                    hash = J("SN_Nightclub_Price"),
                    name = "Maximize Price",
                    type = eFeatureType.Toggle,
                    desc = "MIGHT BE UNSAFE. Applies the maximum price for goods. Don't sell «All Goods».",
                    func = function(ftr)
                        if ftr:IsToggled() then
                            if not GTA.IsInSessionAlone() then
                                GTA.EmptySession()
                            end

                            local price = 4000000

                            eTunable.Business.Nightclub.Price.Weapons:Set(math.floor(price / eStat.MPX_HUB_PROD_TOTAL_1:Get()))
                            eTunable.Business.Nightclub.Price.Coke:Set(math.floor(price / eStat.MPX_HUB_PROD_TOTAL_2:Get()))
                            eTunable.Business.Nightclub.Price.Meth:Set(math.floor(price / eStat.MPX_HUB_PROD_TOTAL_3:Get()))
                            eTunable.Business.Nightclub.Price.Weed:Set(math.floor(price / eStat.MPX_HUB_PROD_TOTAL_4:Get()))
                            eTunable.Business.Nightclub.Price.Documents:Set(math.floor(price / eStat.MPX_HUB_PROD_TOTAL_5:Get()))
                            eTunable.Business.Nightclub.Price.Cash:Set(math.floor(price / eStat.MPX_HUB_PROD_TOTAL_6:Get()))
                            eTunable.Business.Nightclub.Price.Cargo:Set(math.floor(price / eStat.MPX_HUB_PROD_TOTAL_0:Get()))
                            Script.Yield()
                        else
                            eTunable.Business.Nightclub.Price.Weapons:Reset()
                            eTunable.Business.Nightclub.Price.Coke:Reset()
                            eTunable.Business.Nightclub.Price.Meth:Reset()
                            eTunable.Business.Nightclub.Price.Weed:Reset()
                            eTunable.Business.Nightclub.Price.Documents:Reset()
                            eTunable.Business.Nightclub.Price.Cash:Reset()
                            eTunable.Business.Nightclub.Price.Cargo:Reset()
                        end
                    end
                }
            },

            Misc = {
                Open = {
                    hash = J("SN_Nightclub_Open"),
                    name = "Open Computer",
                    type = eFeatureType.Button,
                    desc = "Opens the Nightclub's computer screen.",
                    func = function()
                        GTA.StartScript(eScript.Business.Nightclub)
                    end
                },

                Cooldown = {
                    hash = J("SN_Nighclub_Cooldown"),
                    name = "Kill Cooldowns",
                    type = eFeatureType.Toggle,
                    desc = "Skips almost all cooldowns.",
                    func = function(ftr)
                        if ftr:IsToggled() then
                            eTunable.Business.Nightclub.Cooldown.ClubManagement:Set(0)
                            eTunable.Business.Nightclub.Cooldown.Sell:Set(0)
                            eTunable.Business.Nightclub.Cooldown.SellDelivery:Set(0)
                        else
                            eTunable.Business.Nightclub.Cooldown.ClubManagement:Reset()
                            eTunable.Business.Nightclub.Cooldown.Sell:Reset()
                            eTunable.Business.Nightclub.Cooldown.SellDelivery:Reset()
                        end
                    end
                },

                Setup = {
                    hash = J("SN_Nightclub_Setup"),
                    name = "Skip Setup",
                    type = eFeatureType.Button,
                    desc = "Skips the setup missions for your Nightclub. Change the session to apply.",
                    func = function()
                        ePackedBool.Business.Nightclub.Setup.Staff:Set(true)
                        ePackedBool.Business.Nightclub.Setup.Equipment:Set(true)
                        ePackedBool.Business.Nightclub.Setup.DJ:Set(true)
                    end
                }
            },

            Stats = {
                SellMade = {
                    hash = J("SN_Nightclub_SellMade"),
                    name = "Sell Made",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sales made.",
                    defv = eStat.MPX_HUB_SALES_COMPLETED:Get(),
                    lims = { 0, INT32_MAX },
                    step = 10
                },

                Earnings = {
                    hash = J("SN_Nightclub_Earnings"),
                    name = "Earnings",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired earnings.",
                    defv = eStat.MPX_HUB_EARNINGS:Get(),
                    lims = { 0, INT32_MAX },
                    step = 1000000
                },

                NoSell = {
                    hash = J("SN_Nightclub_NoSell"),
                    name = "Don't Apply Sell",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new sell missions or not."
                },

                NoEarnings = {
                    hash = J("SN_Nightclub_NoEarnings"),
                    name = "Don't Apply Earnings",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new earnings or not."
                },

                Apply = {
                    hash = J("SN_Nightclub_Apply"),
                    name = "Apply All Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes.",
                    func = function(bool1, bool2, buyMade, earnings)
                        if not bool1 then
                            eStat.MPX_HUB_SALES_COMPLETED:Set(buyMade)
                        end
                        if not bool2 then
                            eStat.MPX_HUB_EARNINGS:Set(earnings)
                        end
                    end
                }
            },

            Safe = {
                Fill = {
                    hash = J("SN_Nightclub_Fill"),
                    name = "Fill Safe",
                    type = eFeatureType.Button,
                    desc = "Fills your Nightclub safe with money.",
                    func = function()
                        local top5     = eGlobal.Business.Nightclub.Safe.Income.Top5.global
                        local top100   = eGlobal.Business.Nightclub.Safe.Income.Top100.global
                        local maxValue = 300000

                        eTunable.Business.Nightclub.Safe.MaxCapacity:Set(maxValue)

                        for i = top5, top100 do
                            ScriptGlobal.SetInt(i, maxValue)
                        end

                        eStat.MPX_CLUB_PAY_TIME_LEFT:Set(-1)
                    end
                },

                Collect = {
                    hash = J("SN_Nightclub_Collect"),
                    name = "Collect Safe",
                    type = eFeatureType.Button,
                    desc = "Collects money from your safe. Use inside your Nightclub.",
                    func = function()
                        if eGlobal.Business.Nightclub.Safe.Value:Get() > 0 then
                            eLocal.Business.Nightclub.Safe.Type:Set(3)
                            eLocal.Business.Nightclub.Safe.Collect:Set(1)
                        end
                    end
                },

                Unbrick = {
                    hash = J("SN_Nightclub_Unbrick"),
                    name = "Unbrick Safe",
                    type = eFeatureType.Button,
                    desc = "Unbricks your safe if it shows a dollar sign with $0 inside. Use inside your Nightclub.",
                    func = function()
                        local top5   = eGlobal.Business.Nightclub.Safe.Income.Top5.global
                        local top100 = eGlobal.Business.Nightclub.Safe.Income.Top100.global

                        for i = top5, top100 do
                            ScriptGlobal.SetInt(i, 1)
                        end

                        eStat.MPX_CLUB_PAY_TIME_LEFT:Set(-1)
                        Script.Yield(3000)
                        eLocal.Business.Nightclub.Safe.Type:Set(3)
                        eLocal.Business.Nightclub.Safe.Collect:Set(1)
                    end
                }
            },

            Popularity = {
                Max = {
                    hash = J("SN_Nightclub_Max"),
                    name = "Max Popularity",
                    type = eFeatureType.Button,
                    desc = "Makes your Nightclub popular.",
                    func = function()
                        eStat.MPX_CLUB_POPULARITY:Set(1000)
                    end
                },

                Min = {
                    hash = J("SN_Nightclub_Min"),
                    name = "Min Populatiry",
                    type = eFeatureType.Button,
                    desc = "Makes your Nightclub unpopular.",
                    func = function()
                        eStat.MPX_CLUB_POPULARITY:Set(0)
                    end
                },

                Lock = {
                    hash = J("SN_Nightclub_Lock"),
                    name = "Lock Popularity",
                    type = eFeatureType.Toggle,
                    desc = "Locks the popularity of your Nightclub on the current level.",
                    func = function(ftr)
                        if ftr:IsToggled() then
                            if NPOPULARITY == "TEMP" then
                                NPOPULARITY = eStat.MPX_CLUB_POPULARITY:Get()
                            end
                            eStat.MPX_CLUB_POPULARITY:Set(NPOPULARITY)
                            Script.Yield(1000)
                        else
                            NPOPULARITY = "TEMP"
                        end
                    end
                }
            }
        },

        CrateWarehouse = {
            Sale = {
                Price = {
                    hash = J("SN_CrateWarehouse_Price"),
                    name = "Maximize Price",
                    type = eFeatureType.Toggle,
                    desc = "UNSAFE. Applies the maximum price for your crates.",
                    func = function(ftr)
                        if ftr:IsToggled() then
                            if not GTA.IsInSessionAlone() then
                                GTA.EmptySession()
                            end

                            local price = 6000000

                            eTunable.Business.CrateWarehouse.Price.Threshold1:Set(price)
                            eTunable.Business.CrateWarehouse.Price.Threshold2:Set(math.floor(price / 2))
                            eTunable.Business.CrateWarehouse.Price.Threshold3:Set(math.floor(price / 3))
                            eTunable.Business.CrateWarehouse.Price.Threshold4:Set(math.floor(price / 5))
                            eTunable.Business.CrateWarehouse.Price.Threshold5:Set(math.floor(price / 7))
                            eTunable.Business.CrateWarehouse.Price.Threshold6:Set(math.floor(price / 9))
                            eTunable.Business.CrateWarehouse.Price.Threshold7:Set(math.floor(price / 14))
                            eTunable.Business.CrateWarehouse.Price.Threshold8:Set(math.floor(price / 19))
                            eTunable.Business.CrateWarehouse.Price.Threshold9:Set(math.floor(price / 24))
                            eTunable.Business.CrateWarehouse.Price.Threshold10:Set(math.floor(price / 29))
                            eTunable.Business.CrateWarehouse.Price.Threshold11:Set(math.floor(price / 34))
                            eTunable.Business.CrateWarehouse.Price.Threshold12:Set(math.floor(price / 39))
                            eTunable.Business.CrateWarehouse.Price.Threshold13:Set(math.floor(price / 44))
                            eTunable.Business.CrateWarehouse.Price.Threshold14:Set(math.floor(price / 49))
                            eTunable.Business.CrateWarehouse.Price.Threshold15:Set(math.floor(price / 59))
                            eTunable.Business.CrateWarehouse.Price.Threshold16:Set(math.floor(price / 69))
                            eTunable.Business.CrateWarehouse.Price.Threshold17:Set(math.floor(price / 79))
                            eTunable.Business.CrateWarehouse.Price.Threshold18:Set(math.floor(price / 89))
                            eTunable.Business.CrateWarehouse.Price.Threshold19:Set(math.floor(price / 99))
                            eTunable.Business.CrateWarehouse.Price.Threshold20:Set(math.floor(price / 110))
                            eTunable.Business.CrateWarehouse.Price.Threshold21:Set(math.floor(price / 111))
                            Script.Yield()
                        else
                            for i = 1, 21 do
                                eTunable.Business.CrateWarehouse.Price[F("Threshold%d", i)]:Reset()
                            end
                        end
                    end
                },

                NoXp = {
                    hash = J("SN_CrateWarehouse_NoXp"),
                    name = "No XP Gain",
                    type = eFeatureType.Toggle,
                    desc = "Disables the xp gain for sell missions."
                },

                NoCrateback = {
                    hash = J("SN_CrateWarehouse_NoCrateback"),
                    name = "No CrateBack",
                    type = eFeatureType.Toggle,
                    desc = "Disables auto refill of the crates after «Instant Sell»."
                },

                Sell = {
                    hash = J("SN_CrateWarehouse_Sell"),
                    name = "Instant Sell",
                    type = eFeatureType.Button,
                    desc = "Finishes the sell mission instantly. Use after you can see the minimap.",
                    func = function(bool1, bool2)
                        if not bool2 then
                            if GTA.IsScriptRunning(eScript.Business.CrateWarehouse.Sell) then
                                ePackedBool.Business.CrateWarehouse.Cargo:Set(true)
                            end
                        end
                        eGlobal.World.Multiplier.Xp:Set((bool1) and 0.0 or 1.0)
                        eLocal.Business.CrateWarehouse.Sell.Type:Set(7)
                        eLocal.Business.CrateWarehouse.Sell.Finish:Set(99999)
                        Script.Yield(2000)
                        eLocal.Business.CrateWarehouse.Sell.Finish:Set(99999)
                    end
                }
            },

            Misc = {
                Supply = {
                    hash = J("SN_CrateWarehouse_Supply"),
                    name = "Get Crates",
                    type = eFeatureType.Button,
                    desc = "Gets crates for your Crate Warehouse.",
                    func = function()
                        ePackedBool.Business.CrateWarehouse.Cargo:Set(true)
                    end
                },

                Select = {
                    hash = J("SN_CrateWarehouse_Select"),
                    name = "Crates Amount",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired crates amount to buy.",
                    defv = 0,
                    lims = { 0, 111 },
                    step = 1
                },

                Max = {
                    hash = J("SN_CrateWarehouse_Max"),
                    name = "Max",
                    type = eFeatureType.Button,
                    desc = "Maximizes the crates amount, but not buying them."
                },

                Buy = {
                    hash = J("SN_CrateWarehouse_Buy"),
                    name = "Instant Buy",
                    type = eFeatureType.Button,
                    desc = "Finishes the buy mission instantly. Use after you can see the minimap.",
                    func = function(amount)
                        eLocal.Business.CrateWarehouse.Buy.Amount:Set(amount)
                        eLocal.Business.CrateWarehouse.Buy.Finish1:Set(1)
                        eLocal.Business.CrateWarehouse.Buy.Finish2:Set(6)
                        eLocal.Business.CrateWarehouse.Buy.Finish3:Set(4)
                    end
                },

                Supplier = {
                    hash = J("SN_CrateWarehouse_Supplier"),
                    name = "Turkish Supplier",
                    type = eFeatureType.Toggle,
                    desc = "Fills your Crate Warehouse stock repeatedly.",
                    func = function()
                        ePackedBool.Business.CrateWarehouse.Cargo:Set(true)
                        Script.Yield(1000)
                    end
                },

                Cooldown = {
                    hash = J("SN_CrateWarehouse_Cooldown"),
                    name = "Kill Cooldowns",
                    type = eFeatureType.Toggle,
                    desc = "Skips almost all cooldowns.",
                    func = function(ftr)
                        if ftr:IsToggled() then
                            eTunable.Business.CrateWarehouse.Cooldown.Buy:Set(0)
                            eTunable.Business.CrateWarehouse.Cooldown.Sell:Set(0)
                        else
                            eTunable.Business.CrateWarehouse.Cooldown.Buy:Reset()
                            eTunable.Business.CrateWarehouse.Cooldown.Sell:Reset()
                        end
                    end
                }
            },

            Stats = {
                BuyMade = {
                    hash = J("SN_CrateWarehouse_BuyMade"),
                    name = "Buy Made",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired buy made.",
                    defv = eStat.MPX_LIFETIME_BUY_COMPLETE:Get(),
                    lims = { 0, INT32_MAX },
                    step = 10
                },

                BuyUndertaken = {
                    hash = J("SN_CrateWarehouse_BuyUndertaken"),
                    name = "Buy Undertaken",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired buy undertaken.",
                    defv = eStat.MPX_LIFETIME_BUY_UNDERTAKEN:Get(),
                    lims = { 0, INT32_MAX },
                    step = 10
                },

                SellMade = {
                    hash = J("SN_CrateWarehouse_SellMade"),
                    name = "Sell Made",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sales made.",
                    defv = eStat.MPX_LIFETIME_SELL_COMPLETE:Get(),
                    lims = { 0, INT32_MAX },
                    step = 10
                },

                SellUndertaken = {
                    hash = J("SN_CrateWarehouse_SellUndertaken"),
                    name = "Sell Undertaken",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sales undertaken.",
                    defv = eStat.MPX_LIFETIME_SELL_UNDERTAKEN:Get(),
                    lims = { 0, INT32_MAX },
                    step = 10
                },

                Earnings = {
                    hash = J("SN_CrateWarehouse_Earnings"),
                    name = "Earnings",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired earnings.",
                    defv = eStat.MPX_LIFETIME_CONTRA_EARNINGS:Get(),
                    lims = { 0, INT32_MAX },
                    step = 1000000
                },

                NoBuy = {
                    hash = J("SN_CrateWarehouse_NoBuy"),
                    name = "Don't Apply Buy",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new buy missions or not."
                },

                NoSell = {
                    hash = J("SN_CrateWarehouse_NoSell"),
                    name = "Don't Apply Sell",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new sell missions or not."
                },

                NoEarnings = {
                    hash = J("SN_CrateWarehouse_NoEarnings"),
                    name = "Don't Apply Earnings",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new earnings or not."
                },

                Apply = {
                    hash = J("SN_CrateWarehouse_Apply"),
                    name = "Apply All Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes.",
                    func = function(bool1, bool2, bool3, buyMade, buyUndertaken, sellMade, sellUndertaken, earnings)
                        print("Called func with values:", bool1, bool2, bool3, buyMade, buyUndertaken, sellMade, sellUndertaken, earnings)
                        if not bool1 then
                            eStat.MPX_LIFETIME_BUY_COMPLETE:Set(buyMade)
                            eStat.MPX_LIFETIME_BUY_UNDERTAKEN:Set(buyUndertaken)
                        end
                        if not bool2 then
                            eStat.MPX_LIFETIME_SELL_COMPLETE:Set(sellMade)
                            eStat.MPX_LIFETIME_SELL_UNDERTAKEN:Set(sellUndertaken)
                        end
                        if not bool3 then
                            eStat.MPX_LIFETIME_CONTRA_EARNINGS:Set(earnings)
                        end
                    end
                }
            }
        },

        Misc = {
            Supplies = {
                Business = {
                    hash = J("SN_Misc_SuppliesBusiness"),
                    name = "Business",
                    type = eFeatureType.Combo,
                    desc = "Select the desired business. If you don't see all the businesses, change the session.",
                    list = eTable.Business.Supplies
                },

                Resupply = {
                    hash = J("SN_Misc_SuppliesResupply"),
                    name = "Resupply",
                    type = eFeatureType.Button,
                    desc = "Resupplies the selected business.",
                    func = function(business)
                        if business == -1 then return end

                        local businesses = {
                            [0] = eGlobal.Business.Supplies.Slot0,
                            [1] = eGlobal.Business.Supplies.Slot1,
                            [2] = eGlobal.Business.Supplies.Slot2,
                            [3] = eGlobal.Business.Supplies.Slot3,
                            [4] = eGlobal.Business.Supplies.Slot4,
                            [5] = eGlobal.Business.Supplies.Bunker,
                            [6] = eGlobal.Business.Supplies.Acid
                        }

                        if business == 7 then
                            for _, index in ipairs(eTable.Business.Supplies:GetIndexes()) do
                                if index ~= 7 then
                                    businesses[index]:Set(1)
                                end
                            end

                            return
                        end

                        businesses[business]:Set(1)
                    end
                }
            }
        }
    },

    Money = {
        Casino = {
            LuckyWheel = {
                Select = {
                    hash = J("SN_Casino_LuckyWheelSelect"),
                    name = "Prize",
                    type = eFeatureType.Combo,
                    desc = "Select the desired prize.",
                    list = eTable.World.Casino.Prizes
                },

                Give = {
                    hash = J("SN_Casino_LuckyWheelGive"),
                    name = "Give Prize",
                    type = eFeatureType.Button,
                    desc = "Gives the selected prize instantly. Use once per day.",
                    func = function(prize)
                        eLocal.World.Casino.LuckyWheel.WinState:Set(prize)
                        eLocal.World.Casino.LuckyWheel.PrizeState:Set(11)
                    end
                }
            },

            Slots = {
                Win = {
                    hash = J("SN_Casino_SlotsWin"),
                    name = "Rig Slots",
                    type = eFeatureType.Button,
                    desc = "UNSAFE. Forces the slots to give you the jackpot.",
                    func = function()
                        local randomResultTable = eLocal.World.Casino.Slots.RandomResultTable.vLocal
                        for i = 3, 196 do
                            if i ~= 67 and i ~= 132 then
                                ScriptLocal.SetInt(eScript.World.Casino.Slots.hash, randomResultTable + i, 6)
                            end
                        end
                    end
                },

                Lose = {
                    hash = J("SN_Casino_SlotsLoose"),
                    name = "Lose Slots",
                    type = eFeatureType.Button,
                    desc = "Forces the slots to always lose.",
                    func = function()
                        local randomResultTable = eLocal.World.Casino.Slots.RandomResultTable.vLocal
                        for i = 3, 196 do
                            if i ~= 67 and i ~= 132 then
                                ScriptLocal.SetInt(eScript.World.Casino.Slots.hash, randomResultTable + i, 0)
                            end
                        end
                    end
                }
            },

            Roulette = {
                Land13 = {
                    hash = J("SN_Casino_RouletteLand13"),
                    name = "Land On Black 13",
                    type = eFeatureType.Button,
                    desc = "Forces the ball to land on Black 13. Use after there is no time for betting.",
                    func = function()
                        GTA.ForceScriptHost(eScript.World.Casino.Roulette)
                        local masterTable   = eLocal.World.Casino.Roulette.MasterTable.vLocal
                        local outcomesTable = eLocal.World.Casino.Roulette.OutcomesTable.vLocal
                        local ballTable     = eLocal.World.Casino.Roulette.BallTable.vLocal
                        for i = 0, 5 do
                            ScriptLocal.SetInt(eScript.World.Casino.Roulette.hash, masterTable + outcomesTable + ballTable + i, 13)
                        end
                    end
                },

                Land16 = {
                    hash = J("SN_Casino_RouletteLand16"),
                    name = "Land On Red 16",
                    type = eFeatureType.Button,
                    desc = "Forces the ball to land on Red 16. Use after there is no time for betting.",
                    func = function()
                        local masterTable   = eLocal.World.Casino.Roulette.MasterTable.vLocal
                        local outcomesTable = eLocal.World.Casino.Roulette.OutcomesTable.vLocal
                        local ballTable     = eLocal.World.Casino.Roulette.BallTable.vLocal
                        for i = 0, 5 do
                            ScriptLocal.SetInt(eScript.World.Casino.Roulette.hash, masterTable + outcomesTable + ballTable + i, 16)
                        end
                    end
                }
            },

            Blackjack = {
                Card = {
                    hash = J("SN_Casino_BlackjackCard"),
                    name = "Dealer's Face Down Card",
                    type = eFeatureType.InputText,
                    desc = "Shows the dealer's face down card."
                },

                Reveal = {
                    hash = J("SN_Casino_BlackjackReveal"),
                    name = "Reveal Card",
                    type = eFeatureType.Button,
                    desc = "Reveals the dealer's face down card. Works better in solo session.",
                },

                Trick = {
                    hash = J("SN_Casino_BlackjackTrick"),
                    name = "Trick The Dealer",
                    type = eFeatureType.Button,
                    desc = "Forces the dealer's hand to lose. Also, reveals the dealer's cards. Works better in solo session.",
                    func = function()
                        GTA.ForceScriptHost(eScript.World.Casino.Blackjack)
                        if eLocal.World.Casino.Blackjack.CurrentTable:Get() ~= -1 then
                            eLocal.World.Casino.Blackjack.Dealer.FirstCard:Set(11)
                            eLocal.World.Casino.Blackjack.Dealer.SecondCard:Set(12)
                            eLocal.World.Casino.Blackjack.Dealer.ThirdCard:Set(13)
                            eLocal.World.Casino.Blackjack.VisibleCards:Set(3)
                        end
                    end
                }
            },

            Poker = {
                MyCards = {
                    hash = J("SN_Casino_PokerMyCards"),
                    name = "Your Cards",
                    type = eFeatureType.InputText,
                    desc = "Shows your cards."
                },

                Cards = {
                    hash = J("SN_Casino_PokerCards"),
                    name = "Dealer's Cards",
                    type = eFeatureType.InputText,
                    desc = "Shows the dealer's cards."
                },

                Reveal = {
                    hash = J("SN_Casino_PokerReveal"),
                    name = "Reveal Cards",
                    type = eFeatureType.Button,
                    desc = "Reveals your and the dealer's cards. Works better in solo session.",
                },

                Give = {
                    hash = J("SN_Casino_PokerGive"),
                    name = "Give Straight Flush",
                    type = eFeatureType.Button,
                    desc = "Forces your hand to win. Also, reveals your and the dealer's cards. Use during the animation of your character getting at a table. Works better in solo session.",
                    func = function()
                        GTA.ForceScriptHost(eScript.World.Casino.Poker)
                        local id = 0
                        Helper.SetPokerCards(id, 50, 51, 52)
                    end
                },

                Trick = {
                    hash = J("SN_Casino_PokerTrick"),
                    name = "Trick The Dealer",
                    type = eFeatureType.Button,
                    desc = "Forces the dealer's hand to lose. Also, reveals your and the dealer's cards. Use during the animation of your character getting at a table. Works better in solo session.",
                    func = function()
                        GTA.ForceScriptHost(eScript.World.Casino.Poker)
                        if eLocal.World.Casino.Poker.CurrentTable:Get() ~= -1 then
                            local id = Helper.GetPokerPlayersCount() + 1
                            Helper.SetPokerCards(id, 2, 17, 32)
                        end
                    end
                }
            },

            Misc = {
                Bypass = {
                    hash = J("SN_Casino_Bypass"),
                    name = "Bypass Casino Limits",
                    type = eFeatureType.Toggle,
                    desc = "Bypasses the casino limits. Might be unsafe if used to earn more chips.",
                    func = function()
                        eStat.MPPLY_CASINO_CHIPS_WON_GD:Set(0)
                        eStat.MPPLY_CASINO_CHIPS_WONTIM:Set(0)
                        eStat.MPPLY_CASINO_GMBLNG_GD:Set(0)
                        eStat.MPPLY_CASINO_BAN_TIME:Set(0)
                        eStat.MPPLY_CASINO_CHIPS_PURTIM:Set(0)
                        eStat.MPPLY_CASINO_CHIPS_PUR_GD:Set(0)
                    end
                },

                Limit = {
                    Select = {
                        hash = J("SN_Casino_Select"),
                        name = "Chips Limit",
                        type = eFeatureType.InputInt,
                        desc = "Select the desired chips limit.",
                        defv = 0,
                        lims = { 0, INT32_MAX },
                        step = 1000000
                    },

                    Acquire = {
                        hash = J("SN_Casino_Acquire"),
                        name = "Apply Acquire Limit",
                        type = eFeatureType.Button,
                        desc = "Applies the selected acquire chips limit.",
                        func = function(limit)
                            eTunable.World.Casino.Chips.Limit.Acquire:Set(limit)
                            eTunable.World.Casino.Chips.Limit.AcquirePenthouse:Set(limit)
                        end
                    },

                    Trade = {
                        hash = J("SN_Casino_Sell"),
                        name = "Apply Trade In Limit",
                        type = eFeatureType.Button,
                        desc = "MIGHT BE UNSAFE. Applies the selected sell chips limit.",
                        func = function(limit)
                            eTunable.World.Casino.Chips.Limit.Sell:Set(limit)
                        end
                    }
                }
            }
        },

        EasyMoney = {
            Instant = {
                Give30m = {
                    hash = J("SN_EasyMoney_30m"),
                    name = "Give 30mil",
                    type = eFeatureType.Button,
                    desc = "MIGHT BE UNSAFE. Gives 30mil dollars in a few seconds. Has a cooldown of about 1 hour.",
                    func = function()
                        GTA.TriggerTransaction(0xA174F633)
                        Script.Yield(3000)
                        GTA.TriggerTransaction(0xED97AFC1)
                        Script.Yield(3000)
                        GTA.TriggerTransaction(0x176D9D54)
                        Script.Yield(3000)
                        GTA.TriggerTransaction(0x4B6A869C)
                        Script.Yield(3000)
                        GTA.TriggerTransaction(0x921FCF3C)
                        Script.Yield(3000)
                        GTA.TriggerTransaction(0x314FB8B0)
                    end
                }
            },

            Freeroam = {
                Loop5k = {
                    hash = J("SN_EasyMoney_5k"),
                    name = "5k Loop",
                    type = eFeatureType.Toggle,
                    desc = "MIGHT BE UNSAFE. Toggles the 5k chips loop.",
                    func = function(delay)
                        eGlobal.World.Casino.Chips.Bonus:Set(1)
                        Script.Yield(math.floor(delay * 1000))
                    end
                },

                Loop50k = {
                    hash = J("SN_EasyMoney_50k"),
                    name = "50k Loop",
                    type = eFeatureType.Toggle,
                    desc = "MIGHT BE UNSAFE. Toggles the 50k dollars loop.",
                    func = function(delay)
                        GTA.TriggerTransaction(0x610F9AB4)
                        Script.Yield(math.floor(delay * 1000))
                    end
                },

                Loop100k = {
                    hash = J("SN_EasyMoney_100k"),
                    name = "100k Loop",
                    type = eFeatureType.Toggle,
                    desc = "MIGHT BE UNSAFE. Toggles the 100k dollars loop.",
                    func = function(delay)
                        GTA.TriggerTransaction(J("SERVICE_EARN_AMBIENT_JOB_AMMUNATION_DELIVERY"))
                        Script.Yield(math.floor(delay * 1000))
                    end
                },

                Loop180k = {
                    hash = J("SN_EasyMoney_180k"),
                    name = "180k Loop",
                    type = eFeatureType.Toggle,
                    desc = "MIGHT BE UNSAFE. Toggles the 180k dollars loop. Has a cooldown after gaining a certain amount of money.",
                    func = function(delay)
                        GTA.TriggerTransaction(0x615762F1)
                        Script.Yield(math.floor(delay * 1000))
                    end
                }
            },

            Property = {
                Loop300k = {
                    hash = J("SN_EasyMoney_300k"),
                    name = "300k Loop",
                    type = eFeatureType.Toggle,
                    desc = "MIGHT BE UNSAFE. Toggles the 300k dollars loop. Use inside your Nightclub. Has a cooldown after gaining a certain amount of money.",
                    func = function(delay)
                        local top5      = eGlobal.Business.Nightclub.Safe.Income.Top5.global
                        local top100    = eGlobal.Business.Nightclub.Safe.Income.Top100.global
                        local safeValue = eGlobal.Business.Nightclub.Safe.Value:Get()
                        local maxValue  = 300000

                        eTunable.Business.Nightclub.Safe.MaxCapacity:Set(maxValue)

                        for i = top5, top100 do
                            ScriptGlobal.SetInt(i, maxValue)
                        end

                        if safeValue <= maxValue and safeValue ~= 0 then
                            eLocal.Business.Nightclub.Safe.Type:Set(3)
                            eLocal.Business.Nightclub.Safe.Collect:Set(1)
                        elseif safeValue == 0 then
                            eStat.MPX_CLUB_PAY_TIME_LEFT:Set(-1)
                        end

                        Script.Yield(math.floor(delay * 1000))
                    end
                }
            },

            Delay = {
                Loop5k = {
                    hash = J("SN_EasyMoney_5kDelay"),
                    name = "5k Loop",
                    type = eFeatureType.SliderFloat,
                    desc = "Changes the delay between transactions. Try to increase if you get transaction errors.",
                    defv = 1.5,
                    lims = { 1.0, 5.0 }
                },

                Loop50k = {
                    hash = J("SN_EasyMoney_50kDelay"),
                    name = "50k Loop",
                    type = eFeatureType.SliderFloat,
                    desc = "Changes the delay between transactions. Try to increase if you get transaction errors.",
                    defv = 0.333,
                    lims = { 0.333, 5.0 }
                },

                Loop100k = {
                    hash = J("SN_EasyMoney_100kDelay"),
                    name = "100k Loop",
                    type = eFeatureType.SliderFloat,
                    desc = "Changes the delay between transactions. Try to increase if you get transaction errors.",
                    defv = 0.333,
                    lims = { 0.333, 5.0 }
                },

                Loop180k = {
                    hash = J("SN_EasyMoney_180kDelay"),
                    name = "180k Loop",
                    type = eFeatureType.SliderFloat,
                    desc = "Changes the delay between transactions. Try to increase if you get transaction errors.",
                    defv = 0.333,
                    lims = { 0.333, 5.0 }
                },

                Loop300k = {
                    hash = J("SN_EasyMoney_300kDelay"),
                    name = "300k Loop",
                    type = eFeatureType.SliderFloat,
                    desc = "Changes the delay between transactions. Try to increase if you get transaction errors.",
                    defv = 1.0,
                    lims = { 1.0, 5.0 }
                }
            }
        },

        Misc = {
            Edit = {
                Select = {
                    hash = J("SN_Misc_EditSelect"),
                    name = "Money Amount",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired money amount.",
                    defv = 0,
                    lims = { 0, INT32_MAX },
                    step = 1000000
                },

                Deposit = {
                    hash = J("SN_Misc_EditDeposit"),
                    name = "Deposit",
                    type = eFeatureType.Button,
                    desc = "Deposits the selected money amount to your bank.",
                    func = function(amount)
                        local charSlot    = eStat.MPPLY_LAST_MP_CHAR:Get()
                        local walletMoney = eNative.MONEY.NETWORK_GET_VC_WALLET_BALANCE(charSlot)
                        local amount      = (amount > walletMoney) and walletMoney or amount
                        eNative.NETSHOPPING.NET_GAMESERVER_TRANSFER_WALLET_TO_BANK(charSlot, amount)
                    end
                },

                Withdraw = {
                    hash = J("SN_Misc_EditWithdraw"),
                    name = "Withdraw",
                    type = eFeatureType.Button,
                    desc = "Withdraws the selected money amount from your bank.",
                    func = function(amount)
                        local charSlot  = eStat.MPPLY_LAST_MP_CHAR:Get()
                        local bankMoney = eNative.MONEY.NETWORK_GET_VC_BANK_BALANCE()
                        local amount    = (amount > bankMoney) and bankMoney or amount
                        eNative.NETSHOPPING.NET_GAMESERVER_TRANSFER_BANK_TO_WALLET(charSlot, amount)
                    end
                },

                Remove = {
                    hash = J("SN_Misc_Remove"),
                    name = "Remove",
                    type = eFeatureType.Button,
                    desc = "Removes the selected money amount from your character.",
                    func = function(amount)
                        local charSlot    = eStat.MPPLY_LAST_MP_CHAR:Get()
                        local bankMoney   = eNative.MONEY.NETWORK_GET_VC_BANK_BALANCE()
                        local walletMoney = eNative.MONEY.NETWORK_GET_VC_WALLET_BALANCE(charSlot)
                        local amount      = (amount > bankMoney + walletMoney) and bankMoney + walletMoney or amount
                        eGlobal.Player.Cash.Remove:Set(amount)
                    end
                },

                DepositAll = {
                    hash = J("SN_Misc_EditDepositAll"),
                    name = "Deposit All",
                    type = eFeatureType.Button,
                    desc = "Deposits all money to your bank.",
                    func = function()
                        local charSlot    = eStat.MPPLY_LAST_MP_CHAR:Get()
                        local walletMoney = eNative.MONEY.NETWORK_GET_VC_WALLET_BALANCE(charSlot)
                        eNative.NETSHOPPING.NET_GAMESERVER_TRANSFER_WALLET_TO_BANK(charSlot, walletMoney)
                    end
                },

                WithdrawAll = {
                    hash = J("SN_Misc_EditWithdrawAll"),
                    name = "Withdraw All",
                    type = eFeatureType.Button,
                    desc = "Withdraws all money from your bank.",
                    func = function()
                        local charSlot  = eStat.MPPLY_LAST_MP_CHAR:Get()
                        local bankMoney = eNative.MONEY.NETWORK_GET_VC_BANK_BALANCE()
                        eNative.NETSHOPPING.NET_GAMESERVER_TRANSFER_BANK_TO_WALLET(charSlot, bankMoney)
                    end
                }
            },

            Story = {
                Character = {
                    hash = J("SN_Misc_StoryCharacter"),
                    name = "Character",
                    type = eFeatureType.Combo,
                    desc = "Select the desired story character.",
                    list = eTable.Story.Characters
                },

                Select = {
                    hash = J("SN_Misc_StorySelect"),
                    name = "Money Amount",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired money amount.",
                    defv = eStat.SP0_TOTAL_CASH:Get(),
                    lims = { 0, INT32_MAX },
                    step = 1000000
                },

                Apply = {
                    hash = J("SN_Misc_StoryApply"),
                    name = "Apply Money Amount",
                    type = eFeatureType.Button,
                    desc = "Applies the selected money amount to the selected story character.",
                    func = function(charIndex, amount)
                        eStat[F("SP%d_TOTAL_CASH", charIndex)]:Set(amount)
                    end
                }
            },

            Stats = {
                Earned = {
                    hash = J("SN_Misc_StatsEarned"),
                    name = "Earned",
                    type = eFeatureType.Combo,
                    desc = "Select the desired «Earned» stat.",
                    list = eTable.Cash.Stats.Earneds
                },

                Spent = {
                    hash = J("SN_Misc_StatsSpent"),
                    name = "Spent",
                    type = eFeatureType.Combo,
                    desc = "Select the desired «Spent» stat.",
                    list = eTable.Cash.Stats.Spents
                },

                Select = {
                    hash = J("SN_Misc_StatsSelect"),
                    name = "Money Amount",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired money amount.",
                    defv = 0,
                    lims = { 0, INT32_MAX },
                    step = 1000000
                },

                Apply = {
                    hash = J("SN_Misc_StatsApply"),
                    name = "Apply Money Amount",
                    type = eFeatureType.Button,
                    desc = "Applies the selected money amount to the selected stat.",
                    func = function(earnedStat, spentStat, amount)
                        if earnedStat ~= 0 then
                            earnedStat:Set(amount)
                        end
                        if spentStat ~= 0 then
                            spentStat:Set(amount)
                        end
                    end
                }
            }
        }
    },

    Dev = {
        Editor = {
            Globals = {
                Type = {
                    hash = J("SN_Editor_GlobalsType"),
                    name = "Type",
                    type = eFeatureType.Combo,
                    desc = "Select the desired global type.",
                    list = eTable.Editor.Globals.Types
                },

                Global = {
                    hash = J("SN_Editor_GlobalsGlobal"),
                    name = "262145 + 9415",
                    type = eFeatureType.InputText,
                    desc = "Input your global here."
                },

                Value = {
                    hash = J("SN_Editor_GlobalsValue"),
                    name = "100",
                    type = eFeatureType.InputText,
                    desc = "Input your value here."
                },

                Read = {
                    hash = J("SN_Editor_GlobalsRead"),
                    name = "Read",
                    type = eFeatureType.Button,
                    desc = "Reads the entered global value."
                },

                Write = {
                    hash = J("SN_Editor_GlobalsWrite"),
                    name = "Write",
                    type = eFeatureType.Button,
                    desc = "Writes the selected value to the entered global.",
                    func = function(type, global, value)
                        local SetValue = {
                            ["int"]   = ScriptGlobal.SetInt,
                            ["float"] = ScriptGlobal.SetFloat,
                            ["bool"]  = ScriptGlobal.SetBool
                        }
                        SetValue[type](global, value)
                    end
                },

                Revert = {
                    hash = J("SN_Editor_GlobalsRevert"),
                    name = "Revert",
                    type = eFeatureType.Button,
                    desc = "Reverts the previous value you've written to the entered global.",
                    func = function(type, global)
                        local SetValue = {
                            ["int"]   = ScriptGlobal.SetInt,
                            ["float"] = ScriptGlobal.SetFloat,
                            ["bool"]  = ScriptGlobal.SetBool
                        }

                        if TEMP_GLOBAL ~= "TEMP" then
                            SetValue[type](global, TEMP_GLOBAL)
                            TEMP_GLOBAL = "TEMP"
                        end
                    end
                }
            },

            Locals = {
                Type = {
                    hash = J("SN_Editor_LocalsType"),
                    name = "Type",
                    type = eFeatureType.Combo,
                    desc = "Select the desired local type.",
                    list = eTable.Editor.Locals.Types
                },

                Script = {
                    hash = J("SN_Editor_LocalsScript"),
                    name = "fm_mission_controller",
                    type = eFeatureType.InputText,
                    desc = "Input your script here."
                },

                Local = {
                    hash = J("SN_Editor_LocalsLocal"),
                    name = "10291",
                    type = eFeatureType.InputText,
                    desc = "Input your local here."
                },

                Value = {
                    hash = J("SN_Editor_LocalsValue"),
                    name = "4",
                    type = eFeatureType.InputText,
                    desc = "Input your value here."
                },

                Read = {
                    hash = J("SN_Editor_LocalsRead"),
                    name = "Read",
                    type = eFeatureType.Button,
                    desc = "Reads the entered local value."
                },

                Write = {
                    hash = J("SN_Editor_LocalsWrite"),
                    name = "Write",
                    type = eFeatureType.Button,
                    desc = "Writes the selected value to the entered local.",
                    func = function(type, hash, vLocal, value)
                        local SetValue = {
                            ["int"]   = ScriptLocal.SetInt,
                            ["float"] = ScriptLocal.SetFloat
                        }
                        SetValue[type](hash, vLocal, value)
                    end
                },

                Revert = {
                    hash = J("SN_Editor_LocalsRevert"),
                    name = "Revert",
                    type = eFeatureType.Button,
                    desc = "Reverts the previous value you've written to the entered local.",
                    func = function(type, hash, vLocal)
                        local SetValue = {
                            ["int"]   = ScriptLocal.SetInt,
                            ["float"] = ScriptLocal.SetFloat
                        }

                        if TEMP_LOCAL ~= "TEMP" then
                            SetValue[type](hash, vLocal, TEMP_LOCAL)
                            TEMP_LOCAL = "TEMP"
                        end
                    end
                }
            },

            Stats = {
                From = {
                    hash = J("SN_Editor_StatsFrom"),
                    name = "From File",
                    type = eFeatureType.Toggle,
                    desc = "Allows to write the stats from the file."
                },

                Type = {
                    hash = J("SN_Editor_StatsType"),
                    name = "Type",
                    type = eFeatureType.Combo,
                    desc = "Select the desired stat type.",
                    list = eTable.Editor.Stats.Types
                },

                Stat = {
                    hash = J("SN_Editor_StatsStat"),
                    name = "MPX_KILLS",
                    type = eFeatureType.InputText,
                    desc = "Input your stat here."
                },

                Value = {
                    hash = J("SN_Editor_StatsValue"),
                    name = "7777",
                    type = eFeatureType.InputText,
                    desc = "Input your value here."
                },

                Read = {
                    hash = J("SN_Editor_StatsRead"),
                    name = "Read",
                    type = eFeatureType.Button,
                    desc = "Reads the entered stat value."
                },

                Write = {
                    hash = J("SN_Editor_StatsWrite"),
                    name = "Write",
                    type = eFeatureType.Button,
                    desc = "Writes the selected value to the entered stat.",
                    func = function(type, hash, value)
                        local SetValue = {
                            ["int"]   = Stats.SetInt,
                            ["float"] = Stats.SetFloat,
                            ["bool"]  = Stats.SetBool
                        }
                        SetValue[type](hash, value)
                    end
                },

                Revert = {
                    hash = J("SN_Editor_StatsRevert"),
                    name = "Revert",
                    type = eFeatureType.Button,
                    desc = "Reverts the previous value you've written to the entered stat.",
                    func = function(type, hash)
                        local SetValue = {
                            ["int"]   = Stats.SetInt,
                            ["float"] = Stats.SetFloat,
                            ["bool"]  = Stats.SetBool
                        }

                        if TEMP_STAT ~= "TEMP" then
                            SetValue[type](hash, TEMP_STAT)
                            TEMP_STAT = "TEMP"
                        end
                    end
                },

                File = {
                    hash = J("SN_Editor_StatsFile"),
                    name = "File",
                    type = eFeatureType.Combo,
                    desc = "Select the desired stat file.",
                    list = eTable.Editor.Stats.Files
                },

                WriteAll = {
                    hash = J("SN_Editor_StatsWriteAll"),
                    name = "Write",
                    type = eFeatureType.Button,
                    desc = "Writes all the stats from the selected file.",
                    func = function(file)
                        local path = F("%s\\%s.json", STATS_DIR, file)

                        if FileMgr.DoesFileExist(path) then
                            local json = Json.DecodeFromFile(path)

                            for stat, value in pairs(json.stats) do
                                if stat:sub(1, 3) == "MPX" then
                                    stat = stat:gsub("MPX", F("MP%d", eStat.MPPLY_LAST_MP_CHAR:Get()))
                                end

                                if type(value) == "number" then
                                    if math.type(value) == "integer" then
                                        Stats.SetInt(J(stat), value)
                                    else
                                        Stats.SetFloat(J(stat), value)
                                    end
                                elseif type(value) == "boolean" then
                                    Stats.SetBool(J(stat), value)
                                end
                            end
                        end
                    end
                },

                Remove = {
                    hash = J("SN_Editor_StatsRemove"),
                    name = "Remove",
                    type = eFeatureType.Button,
                    desc = "Removes the selected stats file.",
                    func = function(file)
                        local path = F("%s\\%s.json", STATS_DIR, file)
                        if FileMgr.DoesFileExist(path) then
                            FileMgr.DeleteFile(path)
                            Helper.RefreshPresetsFiles()
                        end
                    end
                },

                Refresh = {
                    hash = J("SN_Editor_StatsRefresh"),
                    name = "Refresh",
                    type = eFeatureType.Button,
                    desc = "Refreshes the list of stats files.",
                    func = function()
                        Helper.RefreshPresetsFiles()
                    end
                },

                Copy = {
                    hash = J("SN_Editor_StatsCopy"),
                    name = "Copy Folder Path",
                    type = eFeatureType.Button,
                    desc = "Copies the stats folder path to the clipboard.",
                    func = function()
                        FileMgr.CreateStatsPresetsDir()
                        Helper.RefreshPresetsFiles()
                        ImGui.SetClipboardText(STATS_DIR)
                    end
                },

                Generate = {
                    hash = J("SN_Editor_StatsGenerate"),
                    name = "Generate Example File",
                    type = eFeatureType.Button,
                    desc = "Generates the example stats file.",
                    func = function()
                        FileMgr.CreateStatsPresetsDir(true)
                        Helper.RefreshPresetsFiles()
                    end
                }
            },

            PackedStats = {
                Range = {
                    hash = J("SN_Editor_PackedStatsRange"),
                    name = "Range",
                    type = eFeatureType.Toggle,
                    desc = "Allows to set a range of packed stats."
                },

                Type = {
                    hash = J("SN_Editor_PackedStatsType"),
                    name = "Type",
                    type = eFeatureType.Combo,
                    desc = "Select the desired packed stat type.",
                    list = eTable.Editor.PackedStats.Types
                },

                PackedStat = {
                    hash = J("SN_Editor_PackedStatsPackedStat"),
                    name = "22050",
                    type = eFeatureType.InputText,
                    desc = "Input your packed stat here."
                },

                Value = {
                    hash = J("SN_Editor_PackedStatsValue"),
                    name = "5",
                    type = eFeatureType.InputText,
                    desc = "Input your value here."
                },

                Read = {
                    hash = J("SN_Editor_PackedStatsRead"),
                    name = "Read",
                    type = eFeatureType.Button,
                    desc = "Reads the entered packed stat value."
                },

                Write = {
                    hash = J("SN_Editor_PackedStatsWrite"),
                    name = "Write",
                    type = eFeatureType.Button,
                    desc = "Writes the selected value to the entered packed stat.",
                    func = function(type, firstPStat, lastPStat, value)
                        local SetValue = {
                            ["int"]  = eNative.STATS.SET_PACKED_STAT_INT_CODE,
                            ["bool"] = eNative.STATS.SET_PACKED_STAT_BOOL_CODE
                        }

                        if lastPStat == nil then
                            SetValue[type](firstPStat, value, eStat.MPPLY_LAST_MP_CHAR:Get())
                            return
                        end

                        for i = firstPStat, lastPStat do
                            SetValue[type](i, value, eStat.MPPLY_LAST_MP_CHAR:Get())
                        end

                        TEMP_PSTAT = "TEMP"
                    end
                },

                Revert = {
                    hash = J("SN_Editor_PackedStatsRevert"),
                    name = "Revert",
                    type = eFeatureType.Button,
                    desc = "Reverts the previous value you've written to the entered packed stat.",
                    func = function(type, packedStat)
                        local SetValue = {
                            ["int"]  = eNative.STATS.SET_PACKED_STAT_INT_CODE,
                            ["bool"] = eNative.STATS.SET_PACKED_STAT_BOOL_CODE
                        }

                        if TEMP_PSTAT ~= "TEMP" then
                            SetValue[type](packedStat, TEMP_PSTAT, eStat.MPPLY_LAST_MP_CHAR:Get())
                            TEMP_PSTAT = "TEMP"
                        end
                    end
                }
            }
        }
    },

    Settings = {
        Discord = {
            CopyLink = {
                hash = J("SN_Settings_DiscordCopyLink"),
                name = "Copy Server Invite Link",
                type = eFeatureType.Button,
                desc = "Copies Discord server invite link to your clipboard.",
                func = function()
                    ImGui.SetClipboardText(DISCORD)
                end
            }
        }
    }
}

--#endregion
