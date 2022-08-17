({
    callme : function(component, event, helper)
    {
       // alert('fuckoff');
        var action = component.get("c.method1");
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS')
            {
                debugger;
                var result= response.getReturnValue();
                alert(result);
                var action = component.get("c.method2");
                action.setCallback(this,function(response){
                    var state = response.getState();
                    if(state === "SUCCESS")
                    {
                        var result=response.getReturnValue();
                        alert(result);
                    }
                });
                $A.enqueueAction(action);
        		
            }
        });
        $A.enqueueAction(action);
        
        
    },
    toast : function(component, event, helper)
    {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Success',
            message: 'This is a success message',
            duration:' 5000',
            key: 'info_alt',
            type: 'success',
            mode: 'pester'
        });
        toastEvent.fire();
        
    }
    
})