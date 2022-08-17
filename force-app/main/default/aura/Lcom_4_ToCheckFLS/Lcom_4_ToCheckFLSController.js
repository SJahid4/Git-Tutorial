({
	call : function(component, event, helper) 
    {
		 var action = component.get("c.method1");
         action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS")
            {
                debugger;
                var result = response.getReturnValue();
                component.set("v.acc",result);
            }
        });
        $A.enqueueAction(action);
	}
})