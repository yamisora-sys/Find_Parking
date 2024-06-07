from opencage.geocoder import OpenCageGeocode
import pandas as pd

API_KEY = '37115a7a77524c859abcd229d39a1b5b'
geocoder = OpenCageGeocode(API_KEY)



def get_coordinates(address):
    result = geocoder.geocode(address)
    if result and len(result):
        return (result[0]['geometry']['lat'], result[0]['geometry']['lng'])
    else:
        return (None, None)

