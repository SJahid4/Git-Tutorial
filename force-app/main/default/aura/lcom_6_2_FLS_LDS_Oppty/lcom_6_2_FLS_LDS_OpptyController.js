({
	call : function(component, event, helper) {
		var recordId = component.get("v.recordId");
     //   var amount = component.get("v.Opp.Amount");
        alert(recordId);
        var action = component.get("c.method1");
        action.setParams({"accId":recordId});
        action.setCallback(this,function(response){
            var state = response.getState();
           if(state === 'SUCCESS')
           {
               var result=response.getReturnValue();
               alert(result);
               component.set("v.Opp",result);
           }
        });
        $A.enqueueAction(action);
	
	},
    Update : function(component, event, helper)
    {
        var amount = component.get("v.Amount");
        var recordId = component.get("v.recordId");
        var action = component.get("c.method2");
        action.setParams({"accId":recordId, "Amount":amount});
        action.setCallback(this,function(response){
           var state = response.getState();
           if(state === 'SUCCESS')
           {
               var result=response.getReturnValue();
               alert(result);
           }
        });
        $A.enqueueAction(action);
    }
})