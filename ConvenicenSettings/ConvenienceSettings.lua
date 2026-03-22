local f = CreateFrame("Frame")

f:RegisterEvent("AUCTION_HOUSE_SHOW")

f:SetScript("OnEvent", function()
    C_Timer.After(0, function()
        local searchBar = AuctionHouseFrame and AuctionHouseFrame.SearchBar
        if not searchBar or not searchBar.FilterButton then return end

        -- Set the filter directly
        searchBar.FilterButton.filters[Enum.AuctionHouseFilter.CurrentExpansionOnly] = true

        -- Refresh UI
        searchBar:UpdateClearFiltersButton()

        print("ConvenienceSettings.lua: Convenience Settings enabled")
    end)
end)
