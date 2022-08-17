({
	loadTable : function(component, event, helper) 
    {
		var fields = [
            			{label:"ID", fieldName:"Id", type:"Id"},
            			{label:"Rating", fieldName:"Rating", type:"Text", editable:true},
                        {label:"AnnualRevenue", fieldName:"AnnualRevenue", type:"Number"},
                        {label:"Industry", fieldName:"Industry", type:"Text"},
                        {label:"Name", fieldName:"Name", type:"Text"},
            {label:"Owner", fieldName:"Ownername", type:"Text"}
            		
        			  ];
            component.set("v.fields",fields);	
	
        var action=component.get("c.retrieveAccounts");
        action.setCallback(this,function(response){
        var state=response.getState();
            if(state === 'SUCCESS')
            {
                var result = response.getReturnValue();
                component.set("v.flag",true);
                component.set("v.acc",result);
            }
        });
        $A.enqueueAction(action);
    }
})