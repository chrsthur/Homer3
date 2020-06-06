function checkForHomerUpdates()
    url = 'http://bu.edu/neurophotonics/research/fnirs/homer3';
    cfg = ConfigFileClass();
    promptFlag = 0;
    try
        s = urlread(url,'timeout',2);
    catch
        % App is offline or server could not be reached
        return
    end
    updateTxt = ''; % Get information about potential update from s
    vrnnum = getVernum();  % Compare to current version and set promptFlag
    % if (vrnum < updateTxt) & (cfg.GetValue('LatestUpdateRefused') < updateTxt)
    %   promptFlag = 1;
    % end
    
    if (promptFlag)
        choice = questdlg(['An update for Homer3 is available: ',...
            updateTxt,...
            ' Would you like to download it?'],...
            'Update Available',...
            'Yes','Remind me later','Don''t show this again',...
            'Remind me later');
        switch choice
            case 'Yes'
                % Open browser to update page
                web(url);    
            case 'Don''t ask again'
                % Make sure user doesn't get asked about this particular
                % update again.
                %
                % cfg.SetValue('LatestUpdateRefused',updateTxt); 
        end
    end
end