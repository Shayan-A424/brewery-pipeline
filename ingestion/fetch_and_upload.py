import requests
import boto3
import json
import os
from datetime import datetime
from dotenv import load_dotenv

load_dotenv(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '.env'))

def fetch_breweries():
    url = "https://api.openbrewerydb.org/v1/breweries?per_page=200"
    response = requests.get(url)
    return response.json()

def upload_to_s3(data):
    s3 = boto3.client(
        's3',
        aws_access_key_id=os.getenv('AWS_ACCESS_KEY_ID'),
        aws_secret_access_key=os.getenv('AWS_SECRET_ACCESS_KEY'),
        region_name=os.getenv('AWS_REGION')
    )
    timestamp = datetime.now().strftime('%Y_%m_%d_%H%M%S')
    filename = f'breweries_{timestamp}.json'
    s3.put_object(
        Bucket=os.getenv('AWS_BUCKET_NAME'),
        Body=json.dumps(data),
        Key=filename
    )
    print(f'Uploaded {filename} to S3 successfully')

if __name__ == '__main__':
    print('Fetching brewery data...')
    data = fetch_breweries()
    print(f'Fetched {len(data)} breweries')
    upload_to_s3(data)