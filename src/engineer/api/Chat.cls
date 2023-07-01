Class engineer.api.Chat Extends REST.Base
{

Parameter CHARSET = "utf-8";

Parameter CONVERTINPUTSTREAM = 1;

Parameter CONTENTTYPE = "application/json";

Parameter Version = "1.0.0";

Parameter HandleCorsRequest = 1;

ClassMethod sendChat() As %Status
{
    Set data = %request.Content
    Set chatGPT = ##CLASS(engineer.ChatGPT).%New()
    Set response = chatGPT.generate(data.userInput, data.patientId, "analysis-fhir")
        
    Write {"botResponse": (response) }.%ToJSON()

    Return $$$OK
}

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>

    <Route Url="/send"    Method="POST"   Call="sendChat"   Cors="true"/>

</Routes>
}

}
