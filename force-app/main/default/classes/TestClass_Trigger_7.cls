public class TestClass_Trigger_7{
	public static void TriggerHandlerMethod(Map<Id,Opportunity> OldRecords, Map<Id,Opportunity> NewRecords){
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
    }
}