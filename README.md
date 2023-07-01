# FHIR-CHATGPT Application: A Virtual Healthcare Assistant

The FHIR-CHATGPT application is a virtual healthcare assistant that leverages the power of FHIR (Fast Healthcare Interoperability Resources) to seamlessly retrieve patient data from the Intersystems IRIS database. By analyzing this data and utilizing its vast knowledge base, FHIR-CHATGPT assists both patients and medical professionals in various healthcare-related tasks.

FHIR-CHATGPT is designed to facilitate efficient and personalized healthcare interactions by providing accurate and relevant information. Leveraging the FHIR standard ensures interoperability, allowing the application to retrieve comprehensive patient data from the Intersystems IRIS database. This data includes medical records, treatment history, laboratory results, and other relevant information required for comprehensive healthcare support.

Using its advanced natural language processing capabilities, FHIR-CHATGPT can understand and interpret patient queries and provide appropriate responses. The application can assist patients by answering questions regarding symptoms, medications, treatment options, and general healthcare advice. FHIR-CHATGPT also assists healthcare professionals by presenting relevant patient information, suggesting potential diagnoses, and providing evidence-based recommendations for treatment plans.

FHIR-CHATGPT benefits from its vast knowledge base, which includes a wide range of medical literature, clinical guidelines, and research findings. This knowledge allows the application to offer reliable and up-to-date information, contributing to the overall quality of patient care and medical decision-making.

By harnessing the power of FHIR and incorporating artificial intelligence, FHIR-CHATGPT aims to bridge the gap between patients and healthcare professionals, providing timely and accurate support. This virtual healthcare assistant has the potential to improve healthcare outcomes, enhance patient satisfaction, and streamline the delivery of healthcare services.

In conclusion, the FHIR-CHATGPT application is an innovative virtual healthcare assistant that utilizes FHIR and AI technologies to provide comprehensive and personalized healthcare support. By leveraging patient data from the Intersystems IRIS database and utilizing its extensive knowledge base, FHIR-CHATGPT assists both patients and medical professionals in navigating the complexities of healthcare, ultimately improving the overall quality of care provided.

## Prerequisites
Make sure you have : 
- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
- [Docker desktop](https://www.docker.com/products/docker-desktop).
- [openai api key](https://platform.openai.com/account/api-keys).

## Installation 

Clone/git pull the repo into any local directory

```
$ git clone https://github.com/Davi-Massaru/fhir-chatGPT.git
```

Replace a <OPENIA.key> tag to your openia api key on iris.script

```
Set ^GPT.openAI.APIKeys = "<OPENIA.key>"
```


You can change a GPT.model, change the iris.script. defined "gpt-3.5-turbo-0613"

```
Set ^GPT.model = "gpt-3.5-turbo-0613"
```

Open the terminal in this directory and run:

```
$ docker-compose build && docker-compose up -d
```

## Functioning of FHIR-CHATGPT

FHIR-CHATGPT utilizes the ChatGPT language model, configured with specific rules for the context of FHIR analysis and engineering. These rules are defined in the `text_prompt/prompt-analysis-fhir-engineer.txt` file.

When FHIR-CHATGPT receives the patient ID, it queries the Intersystems IRIS database, loading all the FHIR data from the patient's history. This data includes information about medical conditions, medications, allergies, test results, and other relevant aspects of the patient's health.

Users can ask questions to Chat GPT related to health and the patient's history. The FHIR-CHATGPT language model has been trained to behave as a virtual healthcare assistant and responds based on the available FHIR data. Chat GPT utilizes its general knowledge and the specific context of the patient to provide relevant and helpful answers.

Upon receiving a question, FHIR-CHATGPT analyzes the text and utilizes the knowledge present in its training to generate an appropriate response. This response may include information about symptoms, treatments, medications, general health guidance, or other health-related information.

It is important to note that FHIR-CHATGPT does not replace professional medical consultation. It provides information based on the available data and general knowledge, but it is always recommended to seek guidance from a qualified healthcare professional for personalized medical diagnosis, treatment, and advice.

Through the combination of natural language technology and the FHIR framework, FHIR-CHATGPT aims to provide comprehensive virtual support and assist both patients and healthcare professionals in accessing relevant and reliable information.

## Testing FHIR API calls in simple frontend APP

the very basic front-end application enables interactions with the
FHIR-CHAT : http://localhost:32783/fhirUI/FHIRAppDemo.html or from VSCode ObjectScript menu:

<img width="616" alt="Screenshot 2020-08-07 at 17 34 49" src="https://user-images.githubusercontent.com/2781759/89657546-ea5fc500-d8d5-11ea-97ed-6fbbf84da655.png">

Is possible call a CHAT by command line. call ##class(engineer.ChatGPT).generate(command,PatientID,"analysis-fhir")

```
zw ##class(engineer.ChatGPT).generate("analyze my vital-signs","1","analysis-fhir")
```
