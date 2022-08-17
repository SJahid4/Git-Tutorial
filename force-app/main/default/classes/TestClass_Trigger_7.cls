public class TestClass_Trigger_7
{
	//OpportunityTrigger1 Its been called by the mentioned Opportunity Trigger.	
    /*public static void TriggerHandlerMethod(Map<Id,Opportunity> OldRecords, Map<Id,Opportunity> NewRecords){
     	Set<Id> keys = OldRecords.Keyset();
        //List<Opportunity> lstop = OldRecords.values();
        if(!keys.isempty()){
            for(Id op : keys){
                Opportunity oppOld = Oldrecords.get(op);
                Opportunity oppNew = Newrecords.get(op);
                if(oppOld.StageName != oppNew.StageName && oppNew.StageName == 'Closed Won'){
                    oppnew.CloseDate = system.today();
                }
            }
        }
    }*/
/*
 * @Author : S Jahid.
 * @Description : When ever Opportunity "Stage" is modified to "Closed Won" then set "Close Date" as "Today Date" and "Type" as "New Customer".
 * @Version : 1.0
 * @Reference : OpportunityTriggeer1.
 * @Created Date : July 16,2022.
 * @Modified By :
 * 					Modified By		Modified Date		Reason
* 					------------------------------------------		 
 */
  public static void OpptyMethodToPrePopulateBeforeUpdate(List<Opportunity> listOpp, Map<Id,Opportunity> MapOppty)
  {
      
      /*
       * @MethodName : OpptyMethodToPrePopulateBeforeUpdate
       * @Inputs : Trigger.New/Trigger.NewMap
       * @Returns : N/A
       * @Exceptions : N/A
       * @Description : TO Prepopulate values
       * @Reference : NA
       * @VERSION : 1.0
       * 
       */
      if(!listOpp.isEmpty())
      {
          for(Opportunity Oppty : listOpp)
          {
              if(Oppty.stageName != MapOppty.get(Oppty.Id).stageName)
              {
                  if(Oppty.stageName == 'Closed Won')
                      {
                          Oppty.CloseDate = system.today();
                          Oppty.Type = 'New Customer';
                      }
              }
          }
      }
  }
    
}