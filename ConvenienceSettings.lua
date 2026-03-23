local f = CreateFrame("Frame")

f:RegisterEvent("AUCTION_HOUSE_SHOW")
f:RegisterEvent("CRAFTINGORDERS_SHOW_CUSTOMER")

f:SetScript("OnEvent", function(_, event)
    if event == "AUCTION_HOUSE_SHOW" then
        C_Timer.After(0, function()
            local searchBar = AuctionHouseFrame and AuctionHouseFrame.SearchBar
            if not searchBar or not searchBar.FilterButton then return end

            searchBar.FilterButton.filters[Enum.AuctionHouseFilter.CurrentExpansionOnly] = true
            searchBar:UpdateClearFiltersButton()

            print("ConvenienceSettings: AH filter enabled")
        end)

    elseif event == "CRAFTINGORDERS_SHOW_CUSTOMER" then
        C_Timer.After(0, function()
            local frame = ProfessionsCustomerOrdersFrame
            if not frame then return end

            local searchBar = frame.BrowseOrders and frame.BrowseOrders.SearchBar
            local filterDropdown = searchBar and searchBar.FilterDropdown
            if not filterDropdown then return end

            filterDropdown.filters[Enum.AuctionHouseFilter.CurrentExpansionOnly] = true
            filterDropdown:ValidateResetState()

            print("ConvenienceSettings: Work Orders filter enabled")
        end)
    end
end)