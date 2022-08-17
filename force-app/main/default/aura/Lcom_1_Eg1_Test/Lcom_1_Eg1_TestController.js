({
    call : function(component, event, helper)
    {
        var name = component.get("v.name");
        var password = component.get("v.password");
        alert('Error : '+name + password);
    }
})