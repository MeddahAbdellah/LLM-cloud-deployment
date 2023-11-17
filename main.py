from fastapi import FastAPI, Body
from typing import List
import spacy
import json

app = FastAPI()

nlp = spacy.load("fr_core_news_lg")

@app.post("/extract_business_names/")
async def extract_business_names(text: str = Body(..., embed=True)) -> List[str]:
    doc = nlp(text)
    business_names = [ent.text.encode('unicode_escape').decode().replace('"', "'") 
                      for ent in doc.ents if ent.label_ == "ORG"]
    return business_names
