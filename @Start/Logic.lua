function check()
    mVer = SKIN:GetMeasure('mVer')
    NekVer = tonumber(SKIN:GetVariable('Nek.Ver', '000000'))
    ParsedVer = tonumber(mVer:GetStringValue())
    ParsedVerFull = mVer:GetStringValue()
    SavePos = SKIN:GetVariable('@')..'Actions\\InstallData.ini'
    SaveLocation = SKIN:GetVariable('@')..'Actions'
    if ParsedVer == NekVer then
        print('Up2date - '..ParsedVer..'=='..NekVer)
        SKIN:Bang('!UpdateMeasure', 'NekStartYes')
    elseif ParsedVer <= NekVer then
        print('Beta - '..ParsedVer..'<='..NekVer)
        SKIN:Bang('!UpdateMeasure', 'NEkStartYes')
    else
        print('Update required - '..ParsedVer..'>='..NekVer)
        SKIN:Bang('!WriteKeyValue', 'Data', 'DownloadLink',  'https://github.com/Nek-Start/NekStart/releases/download/v'..ParsedVerFull..'/NekStart_v'..ParsedVerFull..'.rmskin', SavePos)
        SKIN:Bang('!WriteKeyValue', 'Data', 'SaveLocation', SaveLocation, SavePos)
        SKIN:Bang('!UpdateMeasure', 'NEkStartNo')
    end
end