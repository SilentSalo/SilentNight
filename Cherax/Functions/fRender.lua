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
                        ClickGUI.RenderFeature(hangarDelivered.hash)
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

function RenderSilentNight()
    if ImGui.BeginTabBar("Silent Night") then
        RenderHeistTool()
        RenderMoneyTool()
        ImGui.EndTabBar()   
    end
end

ClickGUI.AddTab("Silent Night v0.0.7", RenderSilentNight)
