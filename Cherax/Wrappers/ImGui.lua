--#region ImGui

_textColored = ImGui.TextColored

function ImGui.BeginColumns(columns)
    if ImGui.BeginTable("main", columns, ImGuiTableFlags.SizingStretchSame) then
        ImGui.TableNextRow()
        ImGui.TableSetColumnIndex(0)

        return true
    end

    return false
end

function ImGui.EndColumns()
    ImGui.EndTable()
end

eBtnStyle = {
    DISCORD = {
        Normal  = { (114 / 255), (137 / 255), (218 / 255), (150 / 255) },
        Hovered = { (114 / 255), (137 / 255), (218 / 255), (255 / 255) },
        Active  = { (114 / 255), (137 / 255), (218 / 255), (105 / 255) }
    },

    RED = {
        Normal  = { (183 / 255), (0 / 255), (0 / 255), (150 / 255) },
        Hovered = { (183 / 255), (0 / 255), (0 / 255), (255 / 255) },
        Active  = { (183 / 255), (0 / 255), (0 / 255), (105 / 255) }
    },

    ORANGE = {
        Normal  = { (255 / 255), (127 / 255), (0 / 255), (150 / 255) },
        Hovered = { (255 / 255), (127 / 255), (0 / 255), (255 / 255) },
        Active  = { (255 / 255), (127 / 255), (0 / 255), (105 / 255) }
    },

    GREEN = {
        Normal  = { (0 / 255), (183 / 255), (0 / 255), (150 / 255) },
        Hovered = { (0 / 255), (183 / 255), (0 / 255), (255 / 255) },
        Active  = { (0 / 255), (183 / 255), (0 / 255), (105 / 255) }
    },

    PINK = {
        Normal  = { (255 / 255), (0 / 255), (127 / 255), (150 / 255) },
        Hovered = { (255 / 255), (0 / 255), (127 / 255), (255 / 255) },
        Active  = { (255 / 255), (0 / 255), (127 / 255), (105 / 255) }
    }
}

function ImGui.PushButtonStyle(btnStyle)
    ImGui.PushStyleColor(ImGuiCol.Button, U(btnStyle.Normal))
    ImGui.PushStyleColor(ImGuiCol.ButtonHovered, U(btnStyle.Hovered))
    ImGui.PushStyleColor(ImGuiCol.ButtonActive, U(btnStyle.Active))
end

function ImGui.ResetButtonStyle()
    ImGui.PopStyleColor(3)
end

eFrameBgStyle = {
    RED = {
        Normal  = { (70 / 255),  (0 / 255), (0 / 255), (255 / 255) },
        Hovered = { (180 / 255), (0 / 255), (0 / 255), (50 / 255)  },
        Active  = { (180 / 255), (0 / 255), (0 / 255), (25 / 255)  },
        Checked = { (183 / 255), (0 / 255), (0 / 255), (255 / 255) }
    },

    ORANGE = {
        Normal  = { (70 / 255),  (30 / 255),  (0 / 255), (255 / 255) },
        Hovered = { (180 / 255), (80 / 255),  (0 / 255), (50 / 255)  },
        Active  = { (180 / 255), (80 / 255),  (0 / 255), (25 / 255)  },
        Checked = { (255 / 255), (127 / 255), (0 / 255), (255 / 255) }
    },

    GREEN = {
        Normal  = { (0 / 255), (70 / 255),  (0 / 255), (255 / 255) },
        Hovered = { (0 / 255), (180 / 255), (0 / 255), (50 / 255)  },
        Active  = { (0 / 255), (180 / 255), (0 / 255), (25 / 255)  },
        Checked = { (0 / 255), (183 / 255), (0 / 255), (255 / 255) }
    }
}

function ImGui.PushFrameBgStyle(frameBgStyle)
    ImGui.PushStyleColor(ImGuiCol.FrameBg, U(frameBgStyle.Normal))
    ImGui.PushStyleColor(ImGuiCol.FrameBgHovered, U(frameBgStyle.Hovered))
    ImGui.PushStyleColor(ImGuiCol.FrameBgActive, U(frameBgStyle.Active))
    ImGui.PushStyleColor(ImGuiCol.CheckMark, U(frameBgStyle.Checked))
end

function ImGui.ResetFrameBgStyle()
    ImGui.PopStyleColor(4)
end

function ImGui.TextColored(text, color_r, color_g, color_b, color_a, textAfter)
    color_r = color_r or 1
    color_g = color_g or 1
    color_b = color_b or 1
    color_a = color_a or 1

    if textAfter ~= nil then
        _textColored(1, 1, 1, 1, text)
        ImGui.SameLine()
        _textColored(color_r, color_g, color_b, color_a, S(textAfter))
    else
        _textColored(color_r, color_g, color_b, color_a, S(text))
    end
end

--#endregion
