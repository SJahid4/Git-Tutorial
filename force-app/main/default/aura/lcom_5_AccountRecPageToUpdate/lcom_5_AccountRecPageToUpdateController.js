({
	call : function(component, event, helper) {
		var recordId = component.get("v.recordId");
        alert(recordId);
        var action = component.get("c.method2");
        action.setParams({accId:recordId});
        action.setCallback(this,function(response){
            var state = response.getState();
           if(state === 'SUCCESS')
           {
               var result=response.getReturnValue();
               component.set("v.acc",result);
           }
        });
        $A.enqueueAction(action);
	}
    
})