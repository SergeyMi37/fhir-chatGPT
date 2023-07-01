Class engineer.Fhir
{

ClassMethod ReadFHIR(patientKey) [ Language = python ]
{
    import iris
    import requests
    
    url = f'http://127.0.0.1:52773/fhir/r4/Patient/{patientKey}/$everything'
    response = requests.get(url)

    if response.status_code == 200:
        fhir_data = response.json()
        return fhir_data
    else:
        print('Erro na solicitação: ', response.status_code)

    return {}
}

}
