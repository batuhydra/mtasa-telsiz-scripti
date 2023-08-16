addCommandHandler(config.comando,
    function(source)
        for _, v in ipairs(config.acl) do
            if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup(v)) then
                triggerClientEvent(source, "N3xT.onOpenRadio", resourceRoot, v)
                break
            end
        end
    end
)
