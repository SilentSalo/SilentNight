function RenderHeistTool()
    if ImGui.BeginTabItem("Heist Tool") then
        if ImGui.BeginTabBar("Heist Tabs") then
            if ImGui.BeginTabItem("Agency") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(agencyContract.hash)
                        ClickGUI.RenderFeature(agencyComplete.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(genericCutscene.hash)
                        ClickGUI.RenderFeature(agencyFinish.hash)
                        ClickGUI.RenderFeature(agencyCooldown.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Payout") then
                        ClickGUI.RenderFeature(agencySelect.hash)
                        ClickGUI.RenderFeature(agencyApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            if ImGui.BeginTabItem("Apartment") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(apartmentComplete.hash)
                        ClickGUI.RenderFeature(apartmentReload.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(genericLaunch.hash)
                        ClickGUI.RenderFeature(genericCutscene.hash)
                        ClickGUI.RenderFeature(apartmentForce.hash)
                        ClickGUI.RenderFeature(apartmentFinish.hash)
                        ClickGUI.RenderFeature(apartmentFleecaHack.hash)
                        ClickGUI.RenderFeature(apartmentFleecaDrill.hash)
                        ClickGUI.RenderFeature(apartmentPacificHack.hash)
                        ClickGUI.RenderFeature(apartmentPlay.hash)
                        ClickGUI.RenderFeature(apartmentUnlock.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Cuts") then
                        ClickGUI.RenderFeature(apartmentTeam.hash)
                        ClickGUI.RenderFeature(apartmentReceivers.hash)
                        ClickGUI.RenderFeature(apartmentPresets.hash)
                        ClickGUI.RenderFeature(apartmentPlayer1.hash)
                        ClickGUI.RenderFeature(apartmentPlayer2.hash)
                        ClickGUI.RenderFeature(apartmentPlayer3.hash)
                        ClickGUI.RenderFeature(apartmentPlayer4.hash)
                        ClickGUI.RenderFeature(apartmentApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            if ImGui.BeginTabItem("Auto Shop") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(autoContract.hash)
                        ClickGUI.RenderFeature(autoComplete.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(genericCutscene.hash)
                        ClickGUI.RenderFeature(autoFinish.hash)
                        ClickGUI.RenderFeature(autoCooldown.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Payout") then
                        ClickGUI.RenderFeature(autoSelect.hash)
                        ClickGUI.RenderFeature(autoApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            if ImGui.BeginTabItem("Cayo Perico") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(cayoDifficulty.hash)
                        ClickGUI.RenderFeature(cayoApproach.hash)
                        ClickGUI.RenderFeature(cayoLoadout.hash)
                        ClickGUI.RenderFeature(cayoPrimaryTarget.hash)
                        ClickGUI.RenderFeature(cayoCompoundTarget.hash)
                        ClickGUI.RenderFeature(cayoCompoundAmount.hash)
                        ClickGUI.RenderFeature(cayoArtsAmount.hash)
                        ClickGUI.RenderFeature(cayoIslandTarget.hash)
                        ClickGUI.RenderFeature(cayoIslandAmount.hash)
                        ClickGUI.RenderFeature(cayoComplete.hash)
                        ClickGUI.RenderFeature(cayoReload.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(genericCutscene.hash)
                        ClickGUI.RenderFeature(cayoForce.hash)
                        ClickGUI.RenderFeature(cayoFinish.hash)
                        ClickGUI.RenderFeature(cayoFingerprintHack.hash)
                        ClickGUI.RenderFeature(cayoPlasmaCutterCut.hash)
                        ClickGUI.RenderFeature(cayoDrainagePipeCut.hash)
                        ClickGUI.RenderFeature(cayoBag.hash)
                        ClickGUI.RenderFeature(cayoSoloCooldown.hash)
                        ClickGUI.RenderFeature(cayoTeamCooldown.hash)
                        ClickGUI.RenderFeature(cayoOffline.hash)
                        ClickGUI.RenderFeature(cayoOnline.hash)
                        ClickGUI.RenderFeature(cayoUnlock.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Cuts") then
                        ClickGUI.RenderFeature(cayoTeam.hash)
                        ClickGUI.RenderFeature(cayoPresets.hash)
                        ClickGUI.RenderFeature(cayoPlayer1.hash)
                        ClickGUI.RenderFeature(cayoPlayer2.hash)
                        ClickGUI.RenderFeature(cayoPlayer3.hash)
                        ClickGUI.RenderFeature(cayoPlayer4.hash)
                        ClickGUI.RenderFeature(cayoApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    if ClickGUI.BeginCustomChildWindow("Non-Host") then
                        ClickGUI.RenderFeature(genericCut.hash)
                        ClickGUI.RenderFeature(genericApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            if ImGui.BeginTabItem("Diamond Casino") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(diamondDifficulty.hash)
                        ClickGUI.RenderFeature(diamondApproach.hash)
                        ClickGUI.RenderFeature(diamondGunman.hash)
                        ClickGUI.RenderFeature(diamondLoadout.hash)
                        ClickGUI.RenderFeature(diamondDriver.hash)
                        ClickGUI.RenderFeature(diamondVehicles.hash)
                        ClickGUI.RenderFeature(diamondHacker.hash)
                        ClickGUI.RenderFeature(diamondMasks.hash)
                        ClickGUI.RenderFeature(diamondTarget.hash)
                        ClickGUI.RenderFeature(diamondComplete.hash)
                        ClickGUI.RenderFeature(diamondReload.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(genericLaunch.hash)
                        ClickGUI.RenderFeature(genericCutscene.hash)
                        ClickGUI.RenderFeature(diamondForce.hash)
                        ClickGUI.RenderFeature(diamondFinish.hash)
                        ClickGUI.RenderFeature(diamondFingerprintHack.hash)
                        ClickGUI.RenderFeature(diamondKeypadHack.hash)
                        ClickGUI.RenderFeature(diamondVaultDoorDrill.hash)
                        ClickGUI.RenderFeature(diamondAutograbber.hash)
                        ClickGUI.RenderFeature(diamondCooldown.hash)
                        ClickGUI.RenderFeature(diamondUnlock.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Cuts") then
                        ClickGUI.RenderFeature(diamondTeam.hash)
                        ClickGUI.RenderFeature(diamondPresets.hash)
                        ClickGUI.RenderFeature(diamondPlayer1.hash)
                        ClickGUI.RenderFeature(diamondPlayer2.hash)
                        ClickGUI.RenderFeature(diamondPlayer3.hash)
                        ClickGUI.RenderFeature(diamondPlayer4.hash)
                        ClickGUI.RenderFeature(diamondApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    if ClickGUI.BeginCustomChildWindow("Non-Host") then
                        ClickGUI.RenderFeature(genericCut.hash)
                        ClickGUI.RenderFeature(genericApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            if ImGui.BeginTabItem("Doomsday") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(doomsdayAct.hash)
                        ClickGUI.RenderFeature(doomsdayComplete.hash)
                        ClickGUI.RenderFeature(doomsdayReset.hash)
                        ClickGUI.RenderFeature(doomsdayReload.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(genericLaunch.hash)
                        ClickGUI.RenderFeature(genericCutscene.hash)
                        ClickGUI.RenderFeature(doomsdayForce.hash)
                        ClickGUI.RenderFeature(doomsdayFinish.hash)
                        ClickGUI.RenderFeature(doomsdayDataHack.hash)
                        ClickGUI.RenderFeature(doomsdayDoomsdayHack.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Cuts") then
                        ClickGUI.RenderFeature(doomsdayTeam.hash)
                        ClickGUI.RenderFeature(doomsdayPresets.hash)
                        ClickGUI.RenderFeature(doomsdayPlayer1.hash)
                        ClickGUI.RenderFeature(doomsdayPlayer2.hash)
                        ClickGUI.RenderFeature(doomsdayPlayer3.hash)
                        ClickGUI.RenderFeature(doomsdayPlayer4.hash)
                        ClickGUI.RenderFeature(doomsdayApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    if ClickGUI.BeginCustomChildWindow("Non-Host") then
                        ClickGUI.RenderFeature(genericCut.hash)
                        ClickGUI.RenderFeature(genericApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            if ImGui.BeginTabItem("Salvage Yard") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Slot 1") then
                        ClickGUI.RenderFeature(salvageSlot1Robbery.hash)
                        ClickGUI.RenderFeature(salvageSlot1Vehicle.hash)
                        ClickGUI.RenderFeature(salvageSlot1Mod.hash)
                        ClickGUI.RenderFeature(salvageSlot1Keep.hash)
                        ClickGUI.RenderFeature(salvageSlot1Apply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(salvageApplyAll.hash)
                        ClickGUI.RenderFeature(salvageComplete.hash)
                        ClickGUI.RenderFeature(salvageReset.hash)
                        ClickGUI.RenderFeature(salvageReload.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Slot 2") then
                        ClickGUI.RenderFeature(salvageSlot2Robbery.hash)
                        ClickGUI.RenderFeature(salvageSlot2Vehicle.hash)
                        ClickGUI.RenderFeature(salvageSlot2Mod.hash)
                        ClickGUI.RenderFeature(salvageSlot2Keep.hash)
                        ClickGUI.RenderFeature(salvageSlot2Apply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(salvageCooldown.hash)
                        ClickGUI.RenderFeature(salvageWeekly.hash)
                        ClickGUI.RenderFeature(salvageSlot1Available.hash)
                        ClickGUI.RenderFeature(salvageSlot2Available.hash)
                        ClickGUI.RenderFeature(salvageSlot3Available.hash)
                        ClickGUI.RenderFeature(salvageSetup.hash)
                        ClickGUI.RenderFeature(salvageClaim.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Slot 3") then
                        ClickGUI.RenderFeature(salvageSlot3Robbery.hash)
                        ClickGUI.RenderFeature(salvageSlot3Vehicle.hash)
                        ClickGUI.RenderFeature(salvageSlot3Mod.hash)
                        ClickGUI.RenderFeature(salvageSlot3Keep.hash)
                        ClickGUI.RenderFeature(salvageSlot3Apply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    if ClickGUI.BeginCustomChildWindow("Payout") then
                        ClickGUI.RenderFeature(salvageSalvage.hash)
                        ClickGUI.RenderFeature(salvageSlot1Value.hash)
                        ClickGUI.RenderFeature(salvageSlot2Value.hash)
                        ClickGUI.RenderFeature(salvageSlot3Value.hash)
                        ClickGUI.RenderFeature(salvageApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            ImGui.EndTabBar()
        end
        ImGui.EndTabItem()
    end
end

function RenderMoneyTool()
    if ImGui.BeginTabItem("Money Tool") then
        if ImGui.BeginTabBar("Money Tabs") then
            if ImGui.BeginTabItem("Bunker") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Sale") then
                        ClickGUI.RenderFeature(bunkerPrice.hash)
                        ClickGUI.RenderFeature(bunkerNoXp.hash)
                        ClickGUI.RenderFeature(bunkerSell.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(bunkerOpen.hash)
                        ClickGUI.RenderFeature(bunkerSupply.hash)
                        ClickGUI.RenderFeature(bunkerTrigger.hash)
                        ClickGUI.RenderFeature(bunkerSupplier.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(bunkerMade.hash)
                        ClickGUI.RenderFeature(bunkerUndertaken.hash)
                        ClickGUI.RenderFeature(bunkerEarnings.hash)
                        ClickGUI.RenderFeature(bunkerNoSell.hash)
                        ClickGUI.RenderFeature(bunkerNoEarnings.hash)
                        ClickGUI.RenderFeature(bunkerApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            if ImGui.BeginTabItem("Casino") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Lucky Wheel") then
                        ClickGUI.RenderFeature(casinoLuckyWheelSelect.hash)
                        ClickGUI.RenderFeature(casinoLuckyWheelGive.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    if ClickGUI.BeginCustomChildWindow("Blackjack") then
                        ClickGUI.RenderFeature(casinoBlackjackCard.hash)
                        ClickGUI.RenderFeature(casinoBlackjackReveal.hash)
                        ClickGUI.RenderFeature(casinoBlackjackTrick.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Slot Machines") then
                        ClickGUI.RenderFeature(casinoSlotsWin.hash)
                        ClickGUI.RenderFeature(casinoSlotsLose.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    if ClickGUI.BeginCustomChildWindow("Poker") then
                        ClickGUI.RenderFeature(casinoPokerMyCards.hash)
                        ClickGUI.RenderFeature(casinoPokerCards.hash)
                        ClickGUI.RenderFeature(casinoPokerReveal.hash)
                        ClickGUI.RenderFeature(casinoPokerGive.hash)
                        ClickGUI.RenderFeature(casinoPokerTrick.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Roulette") then
                        ClickGUI.RenderFeature(casinoRouletteLand13.hash)
                        ClickGUI.RenderFeature(casinoRouletteLand16.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(casinoBypass.hash)
                        ClickGUI.RenderFeature(casinoSelect.hash)
                        ClickGUI.RenderFeature(casinoApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            if ImGui.BeginTabItem("Hangar") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Sale") then
                        ClickGUI.RenderFeature(hangarPrice.hash)
                        ClickGUI.RenderFeature(hangarNoXp.hash)
                        ClickGUI.RenderFeature(hangarSell.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(hangarOpen.hash)
                        ClickGUI.RenderFeature(hangarSupply.hash)
                        ClickGUI.RenderFeature(hangarSupplier.hash)
                        ClickGUI.RenderFeature(hangarCooldown.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(hangarBuyMade.hash)
                        ClickGUI.RenderFeature(hangarBuyUndertaken.hash)
                        ClickGUI.RenderFeature(hangarSellMade.hash)
                        ClickGUI.RenderFeature(hangarSellUndertaken.hash)
                        ClickGUI.RenderFeature(hangarEarnings.hash)
                        ClickGUI.RenderFeature(hangarNoBuy.hash)
                        ClickGUI.RenderFeature(hangarNoSell.hash)
                        ClickGUI.RenderFeature(hangarNoEarnings.hash)
                        ClickGUI.RenderFeature(hangarApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            if ImGui.BeginTabItem("Nightclub") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Sale") then
                        ClickGUI.RenderFeature(nightclubPrice.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    if ClickGUI.BeginCustomChildWindow("Safe") then
                        ClickGUI.RenderFeature(nightclubFill.hash)
                        ClickGUI.RenderFeature(nightclubCollect.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(nightclubOpen.hash)
                        ClickGUI.RenderFeature(nightclubTrigger.hash)
                        ClickGUI.RenderFeature(nightclubSupplier.hash)
                        ClickGUI.RenderFeature(nightclubCooldown.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    if ClickGUI.BeginCustomChildWindow("Popularity") then
                        ClickGUI.RenderFeature(nightclubMax.hash)
                        ClickGUI.RenderFeature(nightclubMin.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(nightclubSellMade.hash)
                        ClickGUI.RenderFeature(nightclubEarnings.hash)
                        ClickGUI.RenderFeature(nightclubNoSell.hash)
                        ClickGUI.RenderFeature(nightclubNoEarnings.hash)
                        ClickGUI.RenderFeature(nightclubApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            if ImGui.BeginTabItem("Special Cargo") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Sale") then
                        ClickGUI.RenderFeature(specialPrice.hash)
                        ClickGUI.RenderFeature(specialNoXp.hash)
                        ClickGUI.RenderFeature(specialNoCrateback.hash)
                        ClickGUI.RenderFeature(specialSell.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(specialOpen.hash)
                        ClickGUI.RenderFeature(specialSupply.hash)
                        ClickGUI.RenderFeature(specialSelect.hash)
                        ClickGUI.RenderFeature(specialBuy.hash)
                        ClickGUI.RenderFeature(specialSupplier.hash)
                        ClickGUI.RenderFeature(specialCooldown.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(specialBuyMade.hash)
                        ClickGUI.RenderFeature(specialBuyUndertaken.hash)
                        ClickGUI.RenderFeature(specialSellMade.hash)
                        ClickGUI.RenderFeature(specialSellUndertaken.hash)
                        ClickGUI.RenderFeature(specialEarnings.hash)
                        ClickGUI.RenderFeature(specialNoBuy.hash)
                        ClickGUI.RenderFeature(specialNoSell.hash)
                        ClickGUI.RenderFeature(specialNoEarnings.hash)
                        ClickGUI.RenderFeature(specialApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            if ImGui.BeginTabItem("Easy Money") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Instant") then
                        ClickGUI.RenderFeature(easyGive40m.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Freeroam") then
                        ClickGUI.RenderFeature(easyLoop5k.hash)
                        ClickGUI.RenderFeature(easyLoop50k.hash)
                        ClickGUI.RenderFeature(easyLoop100k.hash)
                        ClickGUI.RenderFeature(easyLoop180k.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Property") then
                        ClickGUI.RenderFeature(easyLoop300k.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            if ImGui.BeginTabItem("Misc") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Edit") then
                        ClickGUI.RenderFeature(miscEditSelect.hash)
                        ClickGUI.RenderFeature(miscEditDeposit.hash)
                        ClickGUI.RenderFeature(miscEditWithdraw.hash)
                        ClickGUI.RenderFeature(miscEditRemove.hash)
                        ClickGUI.RenderFeature(miscEditDepositAll.hash)
                        ClickGUI.RenderFeature(miscEditWithdrawAll.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Story") then
                        ClickGUI.RenderFeature(miscStorySelect.hash)
                        ClickGUI.RenderFeature(miscStoryCharacter.hash)
                        ClickGUI.RenderFeature(miscStoryApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(miscStatsSelect.hash)
                        ClickGUI.RenderFeature(miscStatsEarned.hash)
                        ClickGUI.RenderFeature(miscStatsSpent.hash)
                        ClickGUI.RenderFeature(miscStatsApply.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            ImGui.EndTabBar()
        end
        ImGui.EndTabItem()
    end
end

function RenderSettings()
    if ImGui.BeginTabItem("Settings") then
        if ImGui.BeginTabBar("Settings Tabs") then
            if ImGui.BeginTabItem("General") then
                if ImGui.BeginColumns(2) then
                    if ClickGUI.BeginCustomChildWindow("Discord") then
                        ClickGUI.RenderFeature(settingsDiscordLink.hash)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.TableNextColumn()
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            ImGui.EndTabBar()
        end
        ImGui.EndTabItem()
    end
end

function RenderClickGUI()
    if ImGui.BeginTabBar("Silent Night") then
        RenderHeistTool()
        RenderMoneyTool()
        RenderSettings()
        ImGui.EndTabBar()
    end
end

ClickGUI.AddTab("Silent Night v0.0.8", RenderClickGUI)

function RenderListGUI()
    local root = ListGUI.GetRootTab()
    if not root then return end

    local SilentNightTab = root:AddSubTab("Silent Night v0.0.8", "Silent Night")

    local HeistToolTab = SilentNightTab:AddSubTab("Heist Tool", "Heist Tool")
    if HeistToolTab then
        local AgencyTab = HeistToolTab:AddSubTab("Agency", "Agency")
        if AgencyTab then
            AgencyTab:AddSeperator("Preps")
            AgencyTab:AddFeature(agencyContract.hash)
            AgencyTab:AddFeature(agencyComplete.hash)

            AgencyTab:AddSeperator("Misc")
            AgencyTab:AddFeature(genericCutscene.hash)
            AgencyTab:AddFeature(agencyFinish.hash)
            AgencyTab:AddFeature(agencyCooldown.hash)

            AgencyTab:AddSeperator("Payout")
            AgencyTab:AddFeature(agencySelect.hash)
            AgencyTab:AddFeature(agencyApply.hash)
        end

        local ApartmentTab = HeistToolTab:AddSubTab("Apartment", "Apartment")
        if ApartmentTab then
            ApartmentTab:AddSeperator("Preps")
            ApartmentTab:AddFeature(apartmentComplete.hash)
            ApartmentTab:AddFeature(apartmentReload.hash)

            ApartmentTab:AddSeperator("Misc")
            ApartmentTab:AddFeature(genericLaunch.hash)
            ApartmentTab:AddFeature(genericCutscene.hash)
            ApartmentTab:AddFeature(apartmentForce.hash)
            ApartmentTab:AddFeature(apartmentFinish.hash)
            ApartmentTab:AddFeature(apartmentFleecaHack.hash)
            ApartmentTab:AddFeature(apartmentFleecaDrill.hash)
            ApartmentTab:AddFeature(apartmentPacificHack.hash)
            ApartmentTab:AddFeature(apartmentPlay.hash)
            ApartmentTab:AddFeature(apartmentUnlock.hash)

            ApartmentTab:AddSeperator("Cuts")
            ApartmentTab:AddFeature(apartmentTeam.hash)
            ApartmentTab:AddFeature(apartmentReceivers.hash)
            ApartmentTab:AddFeature(apartmentPresets.hash)
            ApartmentTab:AddFeature(apartmentPlayer1.hash)
            ApartmentTab:AddFeature(apartmentPlayer2.hash)
            ApartmentTab:AddFeature(apartmentPlayer3.hash)
            ApartmentTab:AddFeature(apartmentPlayer4.hash)
            ApartmentTab:AddFeature(apartmentApply.hash)
        end

        local AutoShopTab = HeistToolTab:AddSubTab("Auto Shop", "Auto Shop")
        if AutoShopTab then
            AutoShopTab:AddSeperator("Preps")
            AutoShopTab:AddFeature(autoContract.hash)
            AutoShopTab:AddFeature(autoComplete.hash)

            AutoShopTab:AddSeperator("Misc")
            AutoShopTab:AddFeature(genericCutscene.hash)
            AutoShopTab:AddFeature(autoFinish.hash)
            AutoShopTab:AddFeature(autoCooldown.hash)

            AutoShopTab:AddSeperator("Payout")
            AutoShopTab:AddFeature(autoSelect.hash)
            AutoShopTab:AddFeature(autoApply.hash)
        end

        local CayoPericoTab = HeistToolTab:AddSubTab("Cayo Perico", "Cayo Perico")
        if CayoPericoTab then
            CayoPericoTab:AddSeperator("Preps")
            CayoPericoTab:AddFeature(cayoDifficulty.hash)
            CayoPericoTab:AddFeature(cayoApproach.hash)
            CayoPericoTab:AddFeature(cayoLoadout.hash)
            CayoPericoTab:AddFeature(cayoPrimaryTarget.hash)
            CayoPericoTab:AddFeature(cayoCompoundTarget.hash)
            CayoPericoTab:AddFeature(cayoCompoundAmount.hash)
            CayoPericoTab:AddFeature(cayoArtsAmount.hash)
            CayoPericoTab:AddFeature(cayoIslandTarget.hash)
            CayoPericoTab:AddFeature(cayoIslandAmount.hash)
            CayoPericoTab:AddFeature(cayoComplete.hash)
            CayoPericoTab:AddFeature(cayoReload.hash)

            CayoPericoTab:AddSeperator("Misc")
            CayoPericoTab:AddFeature(genericCutscene.hash)
            CayoPericoTab:AddFeature(cayoForce.hash)
            CayoPericoTab:AddFeature(cayoFinish.hash)
            CayoPericoTab:AddFeature(cayoFingerprintHack.hash)
            CayoPericoTab:AddFeature(cayoPlasmaCutterCut.hash)
            CayoPericoTab:AddFeature(cayoDrainagePipeCut.hash)
            CayoPericoTab:AddFeature(cayoBag.hash)
            CayoPericoTab:AddFeature(cayoSoloCooldown.hash)
            CayoPericoTab:AddFeature(cayoTeamCooldown.hash)
            CayoPericoTab:AddFeature(cayoOffline.hash)
            CayoPericoTab:AddFeature(cayoOnline.hash)
            CayoPericoTab:AddFeature(cayoUnlock.hash)

            CayoPericoTab:AddSeperator("Cuts")
            CayoPericoTab:AddFeature(cayoTeam.hash)
            CayoPericoTab:AddFeature(cayoPresets.hash)
            CayoPericoTab:AddFeature(cayoPlayer1.hash)
            CayoPericoTab:AddFeature(cayoPlayer2.hash)
            CayoPericoTab:AddFeature(cayoPlayer3.hash)
            CayoPericoTab:AddFeature(cayoPlayer4.hash)
            CayoPericoTab:AddFeature(cayoApply.hash)

            CayoPericoTab:AddSeperator("Non-Host")
            CayoPericoTab:AddFeature(genericCut.hash)
            CayoPericoTab:AddFeature(genericApply.hash)
        end

        local CasinoHeistTab = HeistToolTab:AddSubTab("Diamond Casino", "Diamond Casino")
        if CasinoHeistTab then
            CasinoHeistTab:AddSeperator("Preps")
            CasinoHeistTab:AddFeature(diamondDifficulty.hash)
            CasinoHeistTab:AddFeature(diamondApproach.hash)
            CasinoHeistTab:AddFeature(diamondGunman.hash)
            CasinoHeistTab:AddFeature(diamondLoadout.hash)
            CasinoHeistTab:AddFeature(diamondDriver.hash)
            CasinoHeistTab:AddFeature(diamondVehicles.hash)
            CasinoHeistTab:AddFeature(diamondHacker.hash)
            CasinoHeistTab:AddFeature(diamondMasks.hash)
            CasinoHeistTab:AddFeature(diamondTarget.hash)
            CasinoHeistTab:AddFeature(diamondComplete.hash)
            CasinoHeistTab:AddFeature(diamondReload.hash)

            CasinoHeistTab:AddSeperator("Misc")
            CasinoHeistTab:AddFeature(genericLaunch.hash)
            CasinoHeistTab:AddFeature(genericCutscene.hash)
            CasinoHeistTab:AddFeature(diamondForce.hash)
            CasinoHeistTab:AddFeature(diamondFingerprintHack.hash)
            CasinoHeistTab:AddFeature(diamondKeypadHack.hash)
            CasinoHeistTab:AddFeature(diamondVaultDoorDrill.hash)
            CasinoHeistTab:AddFeature(diamondAutograbber.hash)
            CasinoHeistTab:AddFeature(diamondCooldown.hash)
            CasinoHeistTab:AddFeature(diamondUnlock.hash)

            CasinoHeistTab:AddSeperator("Cuts")
            CasinoHeistTab:AddFeature(diamondTeam.hash)
            CasinoHeistTab:AddFeature(diamondPresets.hash)
            CasinoHeistTab:AddFeature(diamondPlayer1.hash)
            CasinoHeistTab:AddFeature(diamondPlayer2.hash)
            CasinoHeistTab:AddFeature(diamondPlayer3.hash)
            CasinoHeistTab:AddFeature(diamondPlayer4.hash)
            CasinoHeistTab:AddFeature(diamondApply.hash)

            CasinoHeistTab:AddSeperator("Non-Host")
            CasinoHeistTab:AddFeature(genericCut.hash)
            CasinoHeistTab:AddFeature(genericApply.hash)
        end

        local DoomsdayTab = HeistToolTab:AddSubTab("Doomsday", "Doomsday")
        if DoomsdayTab then
            DoomsdayTab:AddSeperator("Preps")
            DoomsdayTab:AddFeature(doomsdayAct.hash)
            DoomsdayTab:AddFeature(doomsdayComplete.hash)
            DoomsdayTab:AddFeature(doomsdayReset.hash)
            DoomsdayTab:AddFeature(doomsdayReload.hash)

            DoomsdayTab:AddSeperator("Misc")
            DoomsdayTab:AddFeature(genericLaunch.hash)
            DoomsdayTab:AddFeature(genericCutscene.hash)
            DoomsdayTab:AddFeature(doomsdayForce.hash)
            DoomsdayTab:AddFeature(doomsdayFinish.hash)
            DoomsdayTab:AddFeature(doomsdayDataHack.hash)
            DoomsdayTab:AddFeature(doomsdayDoomsdayHack.hash)

            DoomsdayTab:AddSeperator("Cuts")
            DoomsdayTab:AddFeature(doomsdayTeam.hash)
            DoomsdayTab:AddFeature(doomsdayPresets.hash)
            DoomsdayTab:AddFeature(doomsdayPlayer1.hash)
            DoomsdayTab:AddFeature(doomsdayPlayer2.hash)
            DoomsdayTab:AddFeature(doomsdayPlayer3.hash)
            DoomsdayTab:AddFeature(doomsdayPlayer4.hash)
            DoomsdayTab:AddFeature(doomsdayApply.hash)

            DoomsdayTab:AddSeperator("Non-Host")
            DoomsdayTab:AddFeature(genericCut.hash)
            DoomsdayTab:AddFeature(genericApply.hash)
        end

        local SalvageYardTab = HeistToolTab:AddSubTab("Salvage Yard", "Salvage Yard")
        if SalvageYardTab then
            SalvageYardTab:AddSeperator("Slot 1")
            SalvageYardTab:AddFeature(salvageSlot1Robbery.hash)
            SalvageYardTab:AddFeature(salvageSlot1Vehicle.hash)
            SalvageYardTab:AddFeature(salvageSlot1Mod.hash)
            SalvageYardTab:AddFeature(salvageSlot1Keep.hash)
            SalvageYardTab:AddFeature(salvageSlot1Apply.hash)

            SalvageYardTab:AddSeperator("Preps")
            SalvageYardTab:AddFeature(salvageApplyAll.hash)
            SalvageYardTab:AddFeature(salvageComplete.hash)
            SalvageYardTab:AddFeature(salvageReset.hash)
            SalvageYardTab:AddFeature(salvageReload.hash)

            SalvageYardTab:AddSeperator("Slot 2")
            SalvageYardTab:AddFeature(salvageSlot2Robbery.hash)
            SalvageYardTab:AddFeature(salvageSlot2Vehicle.hash)
            SalvageYardTab:AddFeature(salvageSlot2Mod.hash)
            SalvageYardTab:AddFeature(salvageSlot2Keep.hash)
            SalvageYardTab:AddFeature(salvageSlot2Apply.hash)

            SalvageYardTab:AddSeperator("Misc")
            SalvageYardTab:AddFeature(salvageCooldown.hash)
            SalvageYardTab:AddFeature(salvageWeekly.hash)
            SalvageYardTab:AddFeature(salvageSlot1Available.hash)
            SalvageYardTab:AddFeature(salvageSlot2Available.hash)
            SalvageYardTab:AddFeature(salvageSlot3Available.hash)
            SalvageYardTab:AddFeature(salvageSetup.hash)
            SalvageYardTab:AddFeature(salvageClaim.hash)

            SalvageYardTab:AddSeperator("Slot 3")
            SalvageYardTab:AddFeature(salvageSlot3Robbery.hash)
            SalvageYardTab:AddFeature(salvageSlot3Vehicle.hash)
            SalvageYardTab:AddFeature(salvageSlot3Mod.hash)
            SalvageYardTab:AddFeature(salvageSlot3Keep.hash)
            SalvageYardTab:AddFeature(salvageSlot3Apply.hash)

            SalvageYardTab:AddSeperator("Payout")
            SalvageYardTab:AddFeature(salvageSalvage.hash)
            SalvageYardTab:AddFeature(salvageSlot1Value.hash)
            SalvageYardTab:AddFeature(salvageSlot2Value.hash)
            SalvageYardTab:AddFeature(salvageSlot3Value.hash)
            SalvageYardTab:AddFeature(salvageApply.hash)
        end
    end

    local MoneyToolTab = SilentNightTab:AddSubTab("Money Tool", "Money Tool")
    if MoneyToolTab then
        local BunkerTab = MoneyToolTab:AddSubTab("Bunker", "Bunker")
        if BunkerTab then
            BunkerTab:AddSeperator("Sale")
            BunkerTab:AddFeature(bunkerPrice.hash)
            BunkerTab:AddFeature(bunkerNoXp.hash)
            BunkerTab:AddFeature(bunkerSell.hash)

            BunkerTab:AddSeperator("Misc")
            BunkerTab:AddFeature(bunkerOpen.hash)
            BunkerTab:AddFeature(bunkerSupply.hash)
            BunkerTab:AddFeature(bunkerTrigger.hash)
            BunkerTab:AddFeature(bunkerSupplier.hash)

            BunkerTab:AddSeperator("Stats")
            BunkerTab:AddFeature(bunkerMade.hash)
            BunkerTab:AddFeature(bunkerUndertaken.hash)
            BunkerTab:AddFeature(bunkerEarnings.hash)
            BunkerTab:AddFeature(bunkerNoSell.hash)
            BunkerTab:AddFeature(bunkerNoEarnings.hash)
            BunkerTab:AddFeature(bunkerApply.hash)
        end

        local CasinoTab = MoneyToolTab:AddSubTab("Casino", "Casino")
        if CasinoTab then
            CasinoTab:AddSeperator("Lucky Wheel")
            CasinoTab:AddFeature(casinoLuckyWheelSelect.hash)
            CasinoTab:AddFeature(casinoLuckyWheelGive.hash)

            CasinoTab:AddSeperator("Blackjack")
            CasinoTab:AddFeature(casinoBlackjackCard.hash)
            CasinoTab:AddFeature(casinoBlackjackReveal.hash)
            CasinoTab:AddFeature(casinoBlackjackTrick.hash)

            CasinoTab:AddSeperator("Slot Machines")
            CasinoTab:AddFeature(casinoSlotsWin.hash)
            CasinoTab:AddFeature(casinoSlotsLose.hash)

            CasinoTab:AddSeperator("Poker")
            CasinoTab:AddFeature(casinoPokerMyCards.hash)
            CasinoTab:AddFeature(casinoPokerCards.hash)
            CasinoTab:AddFeature(casinoPokerReveal.hash)
            CasinoTab:AddFeature(casinoPokerGive.hash)
            CasinoTab:AddFeature(casinoPokerTrick.hash)

            CasinoTab:AddSeperator("Roulette")
            CasinoTab:AddFeature(casinoRouletteLand13.hash)
            CasinoTab:AddFeature(casinoRouletteLand16.hash)

            CasinoTab:AddSeperator("Misc")
            CasinoTab:AddFeature(casinoBypass.hash)
            CasinoTab:AddFeature(casinoSelect.hash)
            CasinoTab:AddFeature(casinoApply.hash)
        end

        local HangarTab = MoneyToolTab:AddSubTab("Hangar", "Hangar")
        if HangarTab then
            HangarTab:AddSeperator("Sale")
            HangarTab:AddFeature(hangarPrice.hash)
            HangarTab:AddFeature(hangarNoXp.hash)
            HangarTab:AddFeature(hangarSell.hash)

            HangarTab:AddSeperator("Misc")
            HangarTab:AddFeature(hangarOpen.hash)
            HangarTab:AddFeature(hangarSupply.hash)
            HangarTab:AddFeature(hangarSupplier.hash)
            HangarTab:AddFeature(hangarCooldown.hash)

            HangarTab:AddSeperator("Stats")
            HangarTab:AddFeature(hangarBuyMade.hash)
            HangarTab:AddFeature(hangarBuyUndertaken.hash)
            HangarTab:AddFeature(hangarSellMade.hash)
            HangarTab:AddFeature(hangarSellUndertaken.hash)
            HangarTab:AddFeature(hangarEarnings.hash)
            HangarTab:AddFeature(hangarNoBuy.hash)
            HangarTab:AddFeature(hangarNoSell.hash)
            HangarTab:AddFeature(hangarNoEarnings.hash)
            HangarTab:AddFeature(hangarApply.hash)
        end

        local NightclubTab = MoneyToolTab:AddSubTab("Nightclub", "Nightclub")
        if NightclubTab then
            NightclubTab:AddSeperator("Sale")
            NightclubTab:AddFeature(nightclubPrice.hash)

            NightclubTab:AddSeperator("Safe")
            NightclubTab:AddFeature(nightclubFill.hash)
            NightclubTab:AddFeature(nightclubCollect.hash)

            NightclubTab:AddSeperator("Misc")
            NightclubTab:AddFeature(nightclubOpen.hash)
            NightclubTab:AddFeature(nightclubTrigger.hash)
            NightclubTab:AddFeature(nightclubSupplier.hash)
            NightclubTab:AddFeature(nightclubCooldown.hash)

            NightclubTab:AddSeperator("Popularity")
            NightclubTab:AddFeature(nightclubMax.hash)
            NightclubTab:AddFeature(nightclubMin.hash)

            NightclubTab:AddSeperator("Stats")
            NightclubTab:AddFeature(nightclubSellMade.hash)
            NightclubTab:AddFeature(nightclubEarnings.hash)
            NightclubTab:AddFeature(nightclubNoSell.hash)
            NightclubTab:AddFeature(nightclubNoEarnings.hash)
            NightclubTab:AddFeature(nightclubApply.hash)
        end

        local SpecialCargoTab = MoneyToolTab:AddSubTab("Special Cargo", "Special Cargo")
        if SpecialCargoTab then
            SpecialCargoTab:AddSeperator("Sale")
            SpecialCargoTab:AddFeature(specialPrice.hash)
            SpecialCargoTab:AddFeature(specialNoXp.hash)
            SpecialCargoTab:AddFeature(specialNoCrateback.hash)
            SpecialCargoTab:AddFeature(specialSell.hash)

            SpecialCargoTab:AddSeperator("Misc")
            SpecialCargoTab:AddFeature(specialOpen.hash)
            SpecialCargoTab:AddFeature(specialSupply.hash)
            SpecialCargoTab:AddFeature(specialSelect.hash)
            SpecialCargoTab:AddFeature(specialBuy.hash)
            SpecialCargoTab:AddFeature(specialSupplier.hash)
            SpecialCargoTab:AddFeature(specialCooldown.hash)

            SpecialCargoTab:AddSeperator("Stats")
            SpecialCargoTab:AddFeature(specialBuyMade.hash)
            SpecialCargoTab:AddFeature(specialBuyUndertaken.hash)
            SpecialCargoTab:AddFeature(specialSellMade.hash)
            SpecialCargoTab:AddFeature(specialSellUndertaken.hash)
            SpecialCargoTab:AddFeature(specialEarnings.hash)
            SpecialCargoTab:AddFeature(specialNoBuy.hash)
            SpecialCargoTab:AddFeature(specialNoSell.hash)
            SpecialCargoTab:AddFeature(specialNoEarnings.hash)
            SpecialCargoTab:AddFeature(specialApply.hash)
        end

        local MiscTab = MoneyToolTab:AddSubTab("Misc", "Misc")
        if MiscTab then
            local EasyMoneyTab = MiscTab:AddSubTab("Easy Money", "Easy Money")
            EasyMoneyTab:AddFeature(easyGive40m.hash)
            EasyMoneyTab:AddFeature(easyLoop5k.hash)
            EasyMoneyTab:AddFeature(easyLoop50k.hash)
            EasyMoneyTab:AddFeature(easyLoop100k.hash)
            EasyMoneyTab:AddFeature(easyLoop180k.hash)
            EasyMoneyTab:AddFeature(easyLoop300k.hash)

            MiscTab:AddSeperator("Edit")
            MiscTab:AddFeature(miscEditSelect.hash)
            MiscTab:AddFeature(miscEditDeposit.hash)
            MiscTab:AddFeature(miscEditWithdraw.hash)
            MiscTab:AddFeature(miscEditRemove.hash)
            MiscTab:AddFeature(miscEditDepositAll.hash)
            MiscTab:AddFeature(miscEditWithdrawAll.hash)

            MiscTab:AddSeperator("Story")
            MiscTab:AddFeature(miscStorySelect.hash)
            MiscTab:AddFeature(miscStoryCharacter.hash)
            MiscTab:AddFeature(miscStoryApply.hash)

            MiscTab:AddSeperator("Stats")
            MiscTab:AddFeature(miscStatsSelect.hash)
            MiscTab:AddFeature(miscStatsEarned.hash)
            MiscTab:AddFeature(miscStatsSpent.hash)
            MiscTab:AddFeature(miscStatsApply.hash)
        end
    end

    local SettingsTab = SilentNightTab:AddSubTab("Settings", "Settings")
    if SettingsTab then
        SettingsTab:AddSeperator("Discord")
        SettingsTab:AddFeature(settingsDiscordLink.hash)
    end
end

RenderListGUI()
