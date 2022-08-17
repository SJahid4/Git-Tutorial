({
    call : function(component, event, helper) {
        var tablecolumns = [
            			{label:"Id", fieldName:"Id", type:"Id"},
            			{label:"FirstName", fieldName:"FirstName", type:"text", editable:true},
            			{label:"LastName", fieldName:"LastName", type:"text", editable:true}];
         component.set("v.columns",tablecolumns);
        
		console.log('Table ---'+tablecolumns);
        var recordId = component.get("v.recordId");
       // alert(recordId);
        console.log('Record Id-- '+recordId);
        var action=component.get("c.retrieveChildContacts");
        action.setParams({"accId":recordId});
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log('State of the controller is -'+state)
            if(state === "SUCCESS")
            {
                debugger;
                var result = response.getReturnValue();
                console.log('Result is -'+result);
              //  alert(result);
              //  component.set("v.flag",true);
                component.set("v.conList",response.getReturnValue());
                
                var toastMessage = $A.get("e.force:showToast");
                toastMessage.setParams({
                    "title":"Success",
                    "message":"Child CONTACTS Retrieved Successfully"
                });
                toastMessage.fire();
            }
        });
        $A.enqueueAction(action);
    },
    
    SaveUpdatedContacts : function(component, event, helper)
    {
        var UpdatedList = event.getParam("draftValues");
        debugger;
        console.log(UpdatedList);
        var UpdateContacts = component.get("c.updateRelatedList");
        UpdateContacts.setParams({"UpdateCons":UpdatedList});
        UpdateContacts.setCallback(this,function(response){
            var state = response.getState();
            debugger;
            console.log('State of the callback is ---- '+state);
            if(state ==='SUCCESS')
            {
				$A.enqueueAction(component.get("c.call"));
                $A.get("e.force:refreshView").fire();                
            }
            else
            {
                alert('failed to perform as the state is not SUCCEED');
            }
        });
        $A.enqueueAction(UpdateContacts);
    }
})