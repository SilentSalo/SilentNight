--#region Renderer

Renderer = {}

function Renderer.RenderHeistTool()
    if ImGui.BeginTabItem("Heist Tool") then
        if ImGui.BeginTabBar("Heist Tabs") then
            if ImGui.BeginTabItem("Agency") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Preps.Contract)
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Preps.Complete)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cutscene)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Skip)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Finish)
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Misc.Cooldown)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Payout") then
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Payout.Select)
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Payout.Max)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Payout.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Apartment") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Preps.Complete)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Preps.Reload)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Launch)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cutscene)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Skip)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.Force)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.Finish)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.FleecaHack)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.FleecaDrill)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.PacificHack)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.Cooldown)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.Play)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.Unlock)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Cuts") then
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Team)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Receivers)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Presets)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Bonus)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Double)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Player1)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Player2)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Player3)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Player4)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Auto Shop") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Preps.Contract)
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Preps.Complete)
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Preps.Reload)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cutscene)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Skip)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Finish)
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Misc.Cooldown)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Payout") then
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Payout.Select)
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Payout.Max)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Payout.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Cayo Perico") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Difficulty)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Approach)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Loadout)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Primary)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Secondary.Compound)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Compound)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Arts)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Secondary.Island)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Island)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Complete)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Reload)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Presets") then
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Presets.File)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Presets.Load)
                        ImGui.SameLine()
                        ImGui.RedButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Presets.Remove)
                        ImGui.ResetButtonStyle()
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Presets.Refresh)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Presets.Name)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Presets.Save)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Presets.Copy)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cutscene)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Skip)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Force)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Finish)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.FingerprintHack)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.PlasmaCutterCut)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.DrainagePipeCut)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Bag)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Solo)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Team)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Offline)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Online)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Unlock)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Cuts") then
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Team)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Presets)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Crew)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Player1)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Player2)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Player3)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Player4)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Non-Host") then
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Diamond Casino") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Difficulty)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Approach)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Gunman)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Loadout)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Driver)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Vehicles)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Hacker)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Masks)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Keycards)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Guards)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Target)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Complete)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Reload)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Presets") then
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Presets.File)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Presets.Load)
                        ImGui.SameLine()
                        ImGui.RedButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Presets.Remove)
                        ImGui.ResetButtonStyle()
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Presets.Refresh)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Presets.Name)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Presets.Save)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Presets.Copy)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Launch)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cutscene)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Skip)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.Force)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.Finish)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.FingerprintHack)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.KeypadHack)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.VaultDoorDrill)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.Autograbber)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.Cooldown)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.Unlock)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.Setup)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Cuts") then
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Team)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Presets)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Crew)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Player1)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Player2)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Player3)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Player4)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Non-Host") then
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Doomsday") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Preps.Act)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Preps.Complete)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Preps.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Preps.Reload)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Launch)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cutscene)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Skip)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Misc.Force)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Finish)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Misc.DataHack)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Misc.DoomsdayHack)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Cuts") then
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Team)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Presets)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Player1)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Player2)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Player3)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Player4)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Non-Host") then
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Salvage Yard") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Slot 1") then
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot1.Robbery)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot1.Vehicle)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot1.Modification)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot1.Keep)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot1.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Preps.Apply)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Preps.Complete)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Preps.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Preps.Reload)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Slot 2") then
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot2.Robbery)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot2.Vehicle)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot2.Modification)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot2.Keep)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot2.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cutscene)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Misc.Cooldown.Kill)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Misc.Cooldown.Skip)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Misc.Availability.Slot1)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Misc.Availability.Slot2)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Misc.Availability.Slot3)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Misc.Free.Setup)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Misc.Free.Claim)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Slot 3") then
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot3.Robbery)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot3.Vehicle)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot3.Modification)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot3.Keep)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot3.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Payout") then
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Payout.Salvage)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Payout.Slot1)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Payout.Slot2)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Payout.Slot3)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Payout.Apply)
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

function Renderer.RenderBusinessTool()
    if ImGui.BeginTabItem("Business Tool") then
        if ImGui.BeginTabBar("Business Tabs") then
            if ImGui.BeginTabItem("Bunker") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Sale") then
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Sale.Price)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Sale.NoXp)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Sale.Sell)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Misc.Open)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Misc.Supply)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Misc.Trigger)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Misc.Supplier)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Stats.SellMade)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Stats.SellUndertaken)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Stats.Earnings)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Stats.NoSell)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Stats.NoEarnings)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Stats.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Hangar Cargo") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Sale") then
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Sale.Price)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Sale.NoXp)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Sale.Sell)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Misc.Open)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Misc.Supply)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Misc.Supplier)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Misc.Cooldown)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.BuyMade)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.BuyUndertaken)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.SellMade)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.SellUndertaken)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.Earnings)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.NoBuy)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.NoSell)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.NoEarnings)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Nightclub") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Sale") then
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Sale.Price)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Safe") then
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Safe.Fill)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Safe.Collect)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Safe.Unbrick)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Misc.Open)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Misc.Cooldown)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Misc.Setup)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Popularity") then
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Popularity.Max)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Popularity.Min)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Popularity.Lock)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Stats.SellMade)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Stats.Earnings)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Stats.NoSell)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Stats.NoEarnings)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Stats.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Special Cargo") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Sale") then
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Sale.Price)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Sale.NoXp)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Sale.NoCrateback)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Sale.Sell)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Supply)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Select)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Max)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Buy)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Supplier)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Cooldown)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.BuyMade)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.BuyUndertaken)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.SellMade)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.SellUndertaken)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.Earnings)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.NoBuy)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.NoSell)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.NoEarnings)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Misc") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Supplies") then
                        ClickGUI.RenderFeature(eFeature.Business.Misc.Supplies.Business)
                        ClickGUI.RenderFeature(eFeature.Business.Misc.Supplies.Resupply)
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

function Renderer.RenderMoneyTool()
    if ImGui.BeginTabItem("Money Tool") then
        if ImGui.BeginTabBar("Money Tabs") then
            if ImGui.BeginTabItem("Casino") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Lucky Wheel") then
                        ClickGUI.RenderFeature(eFeature.Money.Casino.LuckyWheel.Select)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.LuckyWheel.Give)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Blackjack") then
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Blackjack.Card)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Blackjack.Reveal)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Blackjack.Trick)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Slot Machines") then
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Slots.Win)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Slots.Lose)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Poker") then
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Poker.MyCards)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Poker.Cards)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Poker.Reveal)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Poker.Give)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Poker.Trick)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Roulette") then
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Roulette.Land13)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Roulette.Land16)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Misc.Bypass)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Misc.Limit.Select)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Misc.Limit.Acquire)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Misc.Limit.Trade)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Easy Money") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Instant") then
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Instant.Give30m)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Delays") then
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Delay.Loop5k)
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Delay.Loop50k)
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Delay.Loop100k)
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Delay.Loop180k)
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Delay.Loop300k)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Freeroam") then
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Freeroam.Loop5k)
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Freeroam.Loop50k)
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Freeroam.Loop100k)
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Freeroam.Loop180k)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Property") then
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Property.Loop300k)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Misc") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Edit") then
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Edit.Select)
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Edit.Deposit)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Edit.Withdraw)
                        ImGui.RedButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Edit.Remove)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Edit.DepositAll)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Edit.WithdrawAll)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Story") then
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Story.Select)
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Story.Character)
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Story.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Stats.Select)
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Stats.Earned)
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Stats.Spent)
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Stats.Apply)
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

function Renderer.RenderDevTool()
    if ImGui.BeginTabItem("Dev Tool") then
        if ImGui.BeginTabBar("Dev Tabs") then
            if ImGui.BeginTabItem("Editor") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Globals") then
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Globals.Type)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Globals.Global)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Globals.Value)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Globals.Read)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Globals.Write)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Globals.Revert)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Packed Stats") then
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.PackedStats.Range)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.PackedStats.Type)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.PackedStats.PackedStat)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.PackedStats.Value)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.PackedStats.Read)

                        if FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Read):IsVisible() then
                            ImGui.SameLine()
                        end

                        ClickGUI.RenderFeature(eFeature.Dev.Editor.PackedStats.Write)

                        if FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Write):GetName() == "Write" then
                            ImGui.SameLine()
                        end

                        ClickGUI.RenderFeature(eFeature.Dev.Editor.PackedStats.Revert)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Locals") then
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Locals.Type)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Locals.Script)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Locals.Local)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Locals.Value)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Locals.Read)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Locals.Write)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Locals.Revert)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.From)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Type)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Stat)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Value)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Read)

                        if FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Read):IsVisible() then
                            ImGui.SameLine()
                        end

                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Write)

                        if FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Write):IsVisible() then
                            ImGui.SameLine()
                        end

                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Revert)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.File)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.WriteAll)

                        if FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.WriteAll):IsVisible() then
                            ImGui.SameLine()
                        end

                        ImGui.RedButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Remove)
                        ImGui.ResetButtonStyle()

                        if FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Remove):IsVisible() then
                            ImGui.SameLine()
                        end

                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Refresh)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Copy)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Generate)
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

function Renderer.RenderSettings()
    if ImGui.BeginTabItem("Settings") then
        if ImGui.BeginTabBar("Settings Tabs") then
            if ImGui.BeginTabItem("General") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Discord") then
                        ClickGUI.RenderFeature(eFeature.Settings.Discord.CopyLink)
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

function Renderer.RenderClickGUI()
    if ImGui.BeginTabBar(SCRIPT_NAME) then
        Renderer.RenderHeistTool()
        Renderer.RenderBusinessTool()
        Renderer.RenderMoneyTool()
        Renderer.RenderDevTool()
        Renderer.RenderSettings()
        ImGui.EndTabBar()
    end
end

ClickGUI.AddTab(F("%s %s", SCRIPT_NAME, SCRIPT_VER), Renderer.RenderClickGUI)

function Renderer.RenderListGUI()
    local root = ListGUI.GetRootTab()
    if not root then return end

    local SilentNightTab = root:AddSubTab(F("%s %s", SCRIPT_NAME, SCRIPT_VER), SCRIPT_NAME)

    local HeistToolTab = SilentNightTab:AddSubTab("Heist Tool", "Heist Tool")
    if HeistToolTab then
        local AgencyTab = HeistToolTab:AddSubTab("Agency", "Agency")
        if AgencyTab then
            AgencyTab:AddSeperator("Preps")
            AgencyTab:AddFeature(eFeature.Heist.Agency.Preps.Contract)
            AgencyTab:AddFeature(eFeature.Heist.Agency.Preps.Complete)

            AgencyTab:AddSeperator("Misc")
            AgencyTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            AgencyTab:AddFeature(eFeature.Heist.Generic.Skip)
            AgencyTab:AddFeature(eFeature.Heist.Generic.Finish)
            AgencyTab:AddFeature(eFeature.Heist.Agency.Misc.Cooldown)

            AgencyTab:AddSeperator("Payout")
            AgencyTab:AddFeature(eFeature.Heist.Agency.Payout.Select)
            AgencyTab:AddFeature(eFeature.Heist.Agency.Payout.Max)
            AgencyTab:AddFeature(eFeature.Heist.Agency.Payout.Apply)
        end

        local ApartmentTab = HeistToolTab:AddSubTab("Apartment", "Apartment")
        if ApartmentTab then
            ApartmentTab:AddSeperator("Preps")
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Preps.Complete)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Preps.Reload)

            ApartmentTab:AddSeperator("Misc")
            ApartmentTab:AddFeature(eFeature.Heist.Generic.Launch)
            ApartmentTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            ApartmentTab:AddFeature(eFeature.Heist.Generic.Skip)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Misc.Force)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Misc.Finish)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Misc.FleecaHack)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Misc.FleecaDrill)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Misc.PacificHack)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Misc.Cooldown)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Misc.Play)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Misc.Unlock)

            ApartmentTab:AddSeperator("Cuts")
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Cuts.Team)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Cuts.Receivers)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Cuts.Presets)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Cuts.Bonus)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Cuts.Double)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Cuts.Player1)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Cuts.Player2)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Cuts.Player3)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Cuts.Player4)
            ApartmentTab:AddFeature(eFeature.Heist.Apartment.Cuts.Apply)
        end

        local AutoShopTab = HeistToolTab:AddSubTab("Auto Shop", "Auto Shop")
        if AutoShopTab then
            AutoShopTab:AddSeperator("Preps")
            AutoShopTab:AddFeature(eFeature.Heist.AutoShop.Preps.Contract)
            AutoShopTab:AddFeature(eFeature.Heist.AutoShop.Preps.Complete)
            AutoShopTab:AddFeature(eFeature.Heist.AutoShop.Preps.Reload)

            AutoShopTab:AddSeperator("Misc")
            AutoShopTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            AutoShopTab:AddFeature(eFeature.Heist.Generic.Skip)
            AutoShopTab:AddFeature(eFeature.Heist.Generic.Finish)
            AutoShopTab:AddFeature(eFeature.Heist.AutoShop.Misc.Cooldown)

            AutoShopTab:AddSeperator("Payout")
            AutoShopTab:AddFeature(eFeature.Heist.AutoShop.Payout.Select)
            AutoShopTab:AddFeature(eFeature.Heist.AutoShop.Payout.Max)
            AutoShopTab:AddFeature(eFeature.Heist.AutoShop.Payout.Apply)
        end

        local CayoPericoTab = HeistToolTab:AddSubTab("Cayo Perico", "Cayo Perico")
        if CayoPericoTab then
            CayoPericoTab:AddSeperator("Preps")
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Difficulty)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Approach)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Loadout)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Primary)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Secondary.Compound)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Compound)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Arts)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Secondary.Island)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Island)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Complete)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Reset)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Reload)

            CayoPericoTab:AddSeperator("Presets")
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Presets.File)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Presets.Load)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Presets.Remove)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Presets.Refresh)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Presets.Name)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Presets.Save)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Presets.Copy)

            CayoPericoTab:AddSeperator("Misc")
            CayoPericoTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            CayoPericoTab:AddFeature(eFeature.Heist.Generic.Skip)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Force)
            CayoPericoTab:AddFeature(eFeature.Heist.Generic.Finish)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Misc.FingerprintHack)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Misc.PlasmaCutterCut)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Misc.DrainagePipeCut)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Bag)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Solo)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Team)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Offline)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Online)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Unlock)

            CayoPericoTab:AddSeperator("Cuts")
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Team)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Presets)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Crew)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Player1)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Player2)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Player3)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Player4)
            CayoPericoTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Apply)

            CayoPericoTab:AddSeperator("Non-Host")
            CayoPericoTab:AddFeature(eFeature.Heist.Generic.Cut)
            CayoPericoTab:AddFeature(eFeature.Heist.Generic.Apply)
        end

        local CasinoHeistTab = HeistToolTab:AddSubTab("Diamond Casino", "Diamond Casino")
        if CasinoHeistTab then
            CasinoHeistTab:AddSeperator("Preps")
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Difficulty)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Approach)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Gunman)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Loadout)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Driver)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Vehicles)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Hacker)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Masks)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Target)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Complete)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Reset)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Reload)

            CasinoHeistTab:AddSeperator("Presets")
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Presets.File)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Presets.Load)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Presets.Remove)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Presets.Refresh)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Presets.Name)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Presets.Save)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Presets.Copy)

            CasinoHeistTab:AddSeperator("Misc")
            CasinoHeistTab:AddFeature(eFeature.Heist.Generic.Launch)
            CasinoHeistTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            CasinoHeistTab:AddFeature(eFeature.Heist.Generic.Skip)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.Force)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.Finish)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.FingerprintHack)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.KeypadHack)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.VaultDoorDrill)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.Autograbber)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.Cooldown)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.Unlock)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.Setup)

            CasinoHeistTab:AddSeperator("Cuts")
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Team)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Presets)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Crew)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Player1)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Player2)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Player3)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Player4)
            CasinoHeistTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Apply)

            CasinoHeistTab:AddSeperator("Non-Host")
            CasinoHeistTab:AddFeature(eFeature.Heist.Generic.Cut)
            CasinoHeistTab:AddFeature(eFeature.Heist.Generic.Apply)
        end

        local DoomsdayTab = HeistToolTab:AddSubTab("Doomsday", "Doomsday")
        if DoomsdayTab then
            DoomsdayTab:AddSeperator("Preps")
            DoomsdayTab:AddFeature(eFeature.Heist.Doomsday.Preps.Act)
            DoomsdayTab:AddFeature(eFeature.Heist.Doomsday.Preps.Complete)
            DoomsdayTab:AddFeature(eFeature.Heist.Doomsday.Preps.Reset)
            DoomsdayTab:AddFeature(eFeature.Heist.Doomsday.Preps.Reload)

            DoomsdayTab:AddSeperator("Misc")
            DoomsdayTab:AddFeature(eFeature.Heist.Generic.Launch)
            DoomsdayTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            DoomsdayTab:AddFeature(eFeature.Heist.Generic.Skip)
            DoomsdayTab:AddFeature(eFeature.Heist.Doomsday.Misc.Force)
            DoomsdayTab:AddFeature(eFeature.Heist.Generic.Finish)
            DoomsdayTab:AddFeature(eFeature.Heist.Doomsday.Misc.DataHack)
            DoomsdayTab:AddFeature(eFeature.Heist.Doomsday.Misc.DoomsdayHack)

            DoomsdayTab:AddSeperator("Cuts")
            DoomsdayTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Team)
            DoomsdayTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Presets)
            DoomsdayTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Player1)
            DoomsdayTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Player2)
            DoomsdayTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Player3)
            DoomsdayTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Player4)
            DoomsdayTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Apply)

            DoomsdayTab:AddSeperator("Non-Host")
            DoomsdayTab:AddFeature(eFeature.Heist.Generic.Cut)
            DoomsdayTab:AddFeature(eFeature.Heist.Generic.Apply)
        end

        local SalvageYardTab = HeistToolTab:AddSubTab("Salvage Yard", "Salvage Yard")
        if SalvageYardTab then
            SalvageYardTab:AddSeperator("Slot 1")
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot1.Robbery)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot1.Vehicle)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot1.Modification)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot1.Keep)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot1.Apply)

            SalvageYardTab:AddSeperator("Slot 2")
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot2.Robbery)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot2.Vehicle)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot2.Modification)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot2.Keep)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot2.Apply)

            SalvageYardTab:AddSeperator("Slot 3")
            SalvageYardTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            SalvageYardTab:AddFeature(eFeature.Heist.Generic.Skip)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot3.Robbery)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot3.Vehicle)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot3.Modification)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot3.Keep)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Slot3.Apply)

            SalvageYardTab:AddSeperator("Preps")
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Preps.Apply)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Preps.Complete)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Preps.Reset)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Preps.Reload)

            SalvageYardTab:AddSeperator("Misc")
            SalvageYardTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Misc.Cooldown.Kill)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Misc.Cooldown.Skip)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Misc.Availability.Slot1)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Misc.Availability.Slot2)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Misc.Availability.Slot3)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Misc.Free.Setup)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Misc.Free.Claim)

            SalvageYardTab:AddSeperator("Payout")
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Payout.Salvage)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Payout.Slot1)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Payout.Slot2)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Payout.Slot3)
            SalvageYardTab:AddFeature(eFeature.Heist.SalvageYard.Payout.Apply)
        end
    end

    local BusinessToolTab = SilentNightTab:AddSubTab("Business Tool", "Business Tool")
    if BusinessToolTab then
        local BunkerTab = BusinessToolTab:AddSubTab("Bunker", "Bunker")
        if BunkerTab then
            BunkerTab:AddSeperator("Sale")
            BunkerTab:AddFeature(eFeature.Business.Bunker.Sale.Price)
            BunkerTab:AddFeature(eFeature.Business.Bunker.Sale.NoXp)
            BunkerTab:AddFeature(eFeature.Business.Bunker.Sale.Sell)

            BunkerTab:AddSeperator("Misc")
            BunkerTab:AddFeature(eFeature.Business.Bunker.Misc.Open)
            BunkerTab:AddFeature(eFeature.Business.Bunker.Misc.Supply)
            BunkerTab:AddFeature(eFeature.Business.Bunker.Misc.Trigger)
            BunkerTab:AddFeature(eFeature.Business.Bunker.Misc.Supplier)

            BunkerTab:AddSeperator("Stats")
            BunkerTab:AddFeature(eFeature.Business.Bunker.Stats.SellMade)
            BunkerTab:AddFeature(eFeature.Business.Bunker.Stats.SellUndertaken)
            BunkerTab:AddFeature(eFeature.Business.Bunker.Stats.Earnings)
            BunkerTab:AddFeature(eFeature.Business.Bunker.Stats.NoSell)
            BunkerTab:AddFeature(eFeature.Business.Bunker.Stats.NoEarnings)
            BunkerTab:AddFeature(eFeature.Business.Bunker.Stats.Apply)
        end

        local HangarCargoTab = BusinessToolTab:AddSubTab("Hangar Cargo", "Hangar Cargo")
        if HangarCargoTab then
            HangarCargoTab:AddSeperator("Sale")
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Sale.Price)
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Sale.NoXp)
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Sale.Sell)

            HangarCargoTab:AddSeperator("Misc")
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Misc.Open)
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Misc.Supply)
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Misc.Supplier)
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Misc.Cooldown)

            HangarCargoTab:AddSeperator("Stats")
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Stats.BuyMade)
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Stats.BuyUndertaken)
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Stats.SellMade)
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Stats.SellUndertaken)
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Stats.Earnings)
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Stats.NoBuy)
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Stats.NoSell)
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Stats.NoEarnings)
            HangarCargoTab:AddFeature(eFeature.Business.Hangar.Stats.Apply)
        end

        local NightclubTab = BusinessToolTab:AddSubTab("Nightclub", "Nightclub")
        if NightclubTab then
            NightclubTab:AddSeperator("Sale")
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Sale.Price)

            NightclubTab:AddSeperator("Safe")
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Safe.Fill)
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Safe.Collect)
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Safe.Unbrick)

            NightclubTab:AddSeperator("Misc")
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Misc.Open)
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Misc.Cooldown)
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Misc.Setup)

            NightclubTab:AddSeperator("Popularity")
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Popularity.Max)
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Popularity.Min)
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Popularity.Lock)

            NightclubTab:AddSeperator("Stats")
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Stats.SellMade)
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Stats.Earnings)
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Stats.NoSell)
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Stats.NoEarnings)
            NightclubTab:AddFeature(eFeature.Business.Nightclub.Stats.Apply)
        end

        local SpecialCargoTab = BusinessToolTab:AddSubTab("Special Cargo", "Special Cargo")
        if SpecialCargoTab then
            SpecialCargoTab:AddSeperator("Sale")
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Sale.Price)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Sale.NoXp)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Sale.NoCrateback)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Sale.Sell)

            SpecialCargoTab:AddSeperator("Misc")
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Supply)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Select)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Max)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Buy)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Supplier)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Cooldown)

            SpecialCargoTab:AddSeperator("Stats")
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.BuyMade)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.BuyUndertaken)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.SellMade)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.SellUndertaken)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.Earnings)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.NoBuy)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.NoSell)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.NoEarnings)
            SpecialCargoTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.Apply)
        end

        local MiscTab = BusinessToolTab:AddSubTab("Misc", "Misc")
        if MiscTab then
            MiscTab:AddSeperator("Supplies")
            MiscTab:AddFeature(eFeature.Business.Misc.Supplies.Business)
            MiscTab:AddFeature(eFeature.Business.Misc.Supplies.Resupply)
        end
    end

    local MoneyToolTab = SilentNightTab:AddSubTab("Money Tool", "Money Tool")
    if MoneyToolTab then
        local CasinoTab = MoneyToolTab:AddSubTab("Casino", "Casino")
        if CasinoTab then
            CasinoTab:AddSeperator("Lucky Wheel")
            CasinoTab:AddFeature(eFeature.Money.Casino.LuckyWheel.Select)
            CasinoTab:AddFeature(eFeature.Money.Casino.LuckyWheel.Give)

            CasinoTab:AddSeperator("Blackjack")
            CasinoTab:AddFeature(eFeature.Money.Casino.Blackjack.Card)
            CasinoTab:AddFeature(eFeature.Money.Casino.Blackjack.Reveal)
            CasinoTab:AddFeature(eFeature.Money.Casino.Blackjack.Trick)

            CasinoTab:AddSeperator("Slot Machines")
            CasinoTab:AddFeature(eFeature.Money.Casino.Slots.Win)
            CasinoTab:AddFeature(eFeature.Money.Casino.Slots.Lose)

            CasinoTab:AddSeperator("Poker")
            CasinoTab:AddFeature(eFeature.Money.Casino.Poker.MyCards)
            CasinoTab:AddFeature(eFeature.Money.Casino.Poker.Cards)
            CasinoTab:AddFeature(eFeature.Money.Casino.Poker.Reveal)
            CasinoTab:AddFeature(eFeature.Money.Casino.Poker.Give)
            CasinoTab:AddFeature(eFeature.Money.Casino.Poker.Trick)

            CasinoTab:AddSeperator("Roulette")
            CasinoTab:AddFeature(eFeature.Money.Casino.Roulette.Land13)
            CasinoTab:AddFeature(eFeature.Money.Casino.Roulette.Land16)

            CasinoTab:AddSeperator("Misc")
            CasinoTab:AddFeature(eFeature.Money.Casino.Misc.Bypass)
            CasinoTab:AddFeature(eFeature.Money.Casino.Misc.Limit.Select)
            CasinoTab:AddFeature(eFeature.Money.Casino.Misc.Limit.Acquire)
            CasinoTab:AddFeature(eFeature.Money.Casino.Misc.Limit.Trade)
        end

        local MiscTab = MoneyToolTab:AddSubTab("Misc", "Misc")
        if MiscTab then
            local EasyMoneyTab = MiscTab:AddSubTab("Easy Money", "Easy Money")
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Instant.Give30m)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Freeroam.Loop5k)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Freeroam.Loop50k)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Freeroam.Loop100k)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Freeroam.Loop180k)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Property.Loop300k)

            EasyMoneyTab:AddSeperator("Delays")
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Delay.Loop5k)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Delay.Loop50k)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Delay.Loop100k)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Delay.Loop180k)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Delay.Loop300k)

            MiscTab:AddSeperator("Edit")
            MiscTab:AddFeature(eFeature.Money.Misc.Edit.Select)
            MiscTab:AddFeature(eFeature.Money.Misc.Edit.Deposit)
            MiscTab:AddFeature(eFeature.Money.Misc.Edit.Withdraw)
            MiscTab:AddFeature(eFeature.Money.Misc.Edit.Remove)
            MiscTab:AddFeature(eFeature.Money.Misc.Edit.DepositAll)
            MiscTab:AddFeature(eFeature.Money.Misc.Edit.WithdrawAll)

            MiscTab:AddSeperator("Story")
            MiscTab:AddFeature(eFeature.Money.Misc.Story.Select)
            MiscTab:AddFeature(eFeature.Money.Misc.Story.Character)
            MiscTab:AddFeature(eFeature.Money.Misc.Story.Apply)

            MiscTab:AddSeperator("Stats")
            MiscTab:AddFeature(eFeature.Money.Misc.Stats.Select)
            MiscTab:AddFeature(eFeature.Money.Misc.Stats.Earned)
            MiscTab:AddFeature(eFeature.Money.Misc.Stats.Spent)
            MiscTab:AddFeature(eFeature.Money.Misc.Stats.Apply)
        end
    end

    local DevToolTab = SilentNightTab:AddSubTab("Dev Tool", "Dev Tool")
    if DevToolTab then
        local EditorTab = DevToolTab:AddSubTab("Editor", "Editor")
        if EditorTab then
            EditorTab:AddSeperator("Globals")
            EditorTab:AddFeature(eFeature.Dev.Editor.Globals.Type)
            EditorTab:AddFeature(eFeature.Dev.Editor.Globals.Global)
            EditorTab:AddFeature(eFeature.Dev.Editor.Globals.Value)
            EditorTab:AddFeature(eFeature.Dev.Editor.Globals.Read)
            EditorTab:AddFeature(eFeature.Dev.Editor.Globals.Write)
            EditorTab:AddFeature(eFeature.Dev.Editor.Globals.Revert)

            EditorTab:AddSeperator("Locals")
            EditorTab:AddFeature(eFeature.Dev.Editor.Locals.Type)
            EditorTab:AddFeature(eFeature.Dev.Editor.Locals.Script)
            EditorTab:AddFeature(eFeature.Dev.Editor.Locals.Local)
            EditorTab:AddFeature(eFeature.Dev.Editor.Locals.Value)
            EditorTab:AddFeature(eFeature.Dev.Editor.Locals.Read)
            EditorTab:AddFeature(eFeature.Dev.Editor.Locals.Write)
            EditorTab:AddFeature(eFeature.Dev.Editor.Locals.Revert)

            EditorTab:AddSeperator("Stats")
            EditorTab:AddFeature(eFeature.Dev.Editor.Stats.From)
            EditorTab:AddFeature(eFeature.Dev.Editor.Stats.Type)
            EditorTab:AddFeature(eFeature.Dev.Editor.Stats.Stat)
            EditorTab:AddFeature(eFeature.Dev.Editor.Stats.Value)
            EditorTab:AddFeature(eFeature.Dev.Editor.Stats.Read)
            EditorTab:AddFeature(eFeature.Dev.Editor.Stats.Write)
            EditorTab:AddFeature(eFeature.Dev.Editor.Stats.Revert)
            EditorTab:AddFeature(eFeature.Dev.Editor.Stats.File)
            EditorTab:AddFeature(eFeature.Dev.Editor.Stats.WriteAll)
            EditorTab:AddFeature(eFeature.Dev.Editor.Stats.Remove)
            EditorTab:AddFeature(eFeature.Dev.Editor.Stats.Refresh)
            EditorTab:AddFeature(eFeature.Dev.Editor.Stats.Copy)
            EditorTab:AddFeature(eFeature.Dev.Editor.Stats.Generate)

            EditorTab:AddSeperator("Packed Stats")
            EditorTab:AddFeature(eFeature.Dev.Editor.PackedStats.Range)
            EditorTab:AddFeature(eFeature.Dev.Editor.PackedStats.Type)
            EditorTab:AddFeature(eFeature.Dev.Editor.PackedStats.PackedStat)
            EditorTab:AddFeature(eFeature.Dev.Editor.PackedStats.Value)
            EditorTab:AddFeature(eFeature.Dev.Editor.PackedStats.Read)
            EditorTab:AddFeature(eFeature.Dev.Editor.PackedStats.Write)
            EditorTab:AddFeature(eFeature.Dev.Editor.PackedStats.Revert)
        end
    end

    local SettingsTab = SilentNightTab:AddSubTab("Settings", "Settings")
    if SettingsTab then
        SettingsTab:AddSeperator("Discord")
        SettingsTab:AddFeature(eFeature.Settings.Discord.CopyLink)
    end
end

Renderer.RenderListGUI()

--#endregion
