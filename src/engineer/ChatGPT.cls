Class engineer.ChatGPT Extends %RegisteredObject [ Language = python ]
{

ClassMethod generate(command, patientKey, engine) As %String
{
    import json
    import iris
    import requests

    fhir_data = iris.cls("engineer.Fhir").ReadFHIR(patientKey)

    payload = {
            "model": iris.gref("GPT.model")[None],
            "messages": [
                {
                    "role": "system",
                    "content": iris.cls("engineer.ChatGPT").ReadPromptEngine(engine)
                },
                {
                    "role": "user",
                    "content": "FHIR data :\n{fhir_data}\n "
                }
            ]
        }
    
    request_header = {
        "Authorization": "Bearer " + iris.gref("GPT.openAI.APIKeys")[None],
        "Content-Type": "application/json"
    }

    initial_command = iris.cls("engineer.ChatGPT").ReadPromptEngineInitial(engine)
    payload["messages"].append({"role": "user", "content": f'{initial_command} : {command}'})

    json_payload = json.dumps(payload)

    url = "https://api.openai.com/v1/chat/completions"
    response = requests.post(url, headers=request_header, data=json_payload)
    if response.status_code == 200:
        content =  iris.cls("engineer.ChatGPT").ExtractContentFromResponse(response.json())
        return f"{content}"
    
    return "None"
}

ClassMethod ExtractContentFromResponse(response) As %String
{
    import iris
    try:
        choices = response.get("choices")
        if choices and len(choices) > 0:
            first_choice = choices[0]
            message = first_choice.get("message")
            if message:
                content = message.get("content")
                return content
    except Exception as e:
        print("[ChatGPT] Error: Unable to parse response:", str(e))
    return None
}

ClassMethod ReadPromptEngine(engine) As %String
{
    import iris
    GPT_engine = iris.gref('GPT.engine')

    if engine == "": engine = "analysis-fhir"
    engine_file_path = GPT_engine[engine] or GPT_engine["analysis-fhir"]

    with open(engine_file_path, 'r') as file:
        file_content = file.read()
        file.close()
        content_string = str(file_content)

    return content_string
}

ClassMethod ReadPromptEngineInitial(engine) As %String
{
    import iris
    GPT_engine_initial = iris.gref('GPT.engine.initial')

    if engine == "": engine = "analysis-fhir"
    return GPT_engine_initial[engine] or GPT_engine_initial["analysis-fhir"]
}

}
