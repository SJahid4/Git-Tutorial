public class Integration_Spoonacular 
{
    private static final string SPOONACULAR_API= 'https://api.spoonacular.com';
    private static final String API_KEY='674a8785e1e243ae81778edaa4dafcb9';
    
	public static String getRandonReciepe()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
                //request.setEndpoint('https://spoonacular.com/recipes/random?apiKey=674a8785e1e243ae81778edaa4dafcb9');
        request.setEndpoint(SPOONACULAR_API+'/recipes/random?apiKey='+API_KEY);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        system.debug('Response Code --- '+response.getStatusCode());
        if(response.getStatusCode() == 200) 
            {
               System.debug('response'+response.getBody());
               return response.getBody(); 
            }
        return '';
	}
	public static String getReciepe(String receipeId)
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
                //request.setEndpoint('https://spoonacular.com/recipes/random?apiKey=674a8785e1e243ae81778edaa4dafcb9');
                //GET https://api.spoonacular.com/recipes/{id}/information, It needs to be passed Id of the reciepe along with the URL.
        request.setEndpoint(SPOONACULAR_API+'/recipes/'+receipeId+'/information?apiKey='+API_KEY);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        system.debug('Response Code --- '+response.getStatusCode());
        if(response.getStatusCode() == 200) 
            {
               System.debug('response'+response.getBody());
                return response.getBody();
            }
        return '';
	}
    public static String getReciepebyIngredient(String Ingredients)
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
                //request.setEndpoint('https://spoonacular.com/recipes/random?apiKey=674a8785e1e243ae81778edaa4dafcb9');
                //GET https://api.spoonacular.com/recipes/findByIngredients
                //https://api.spoonacular.com/recipes/findByIngredients?ingredients=apples,+flour,+sugar&number=2

        request.setEndpoint(SPOONACULAR_API+'/recipes/findByIngredients?apiKey='+API_KEY+'&ingredients='+ingredients);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        system.debug('Response Code --- '+response.getStatusCode());
        if(response.getStatusCode() == 200) 
            {
               System.debug('response'+response.getBody());
                return response.getBody();
            }
        return '';
	}


}