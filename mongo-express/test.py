import pymongo
conn = pymongo.MongoClient('mongodb://admin:pass@localhost:27017/')
db = conn['database']
coll = db['collection']
