#!/usr/bin/env python3
"""
Scrpipt to improve '12-log_stats.py' by adding the top 10 of the most
present IPs in the collection 'nginx' of the database 'logs'
"""

from pymongo import MongoClient


def log_stats(mongo_collection) -> None:
    """
    log_stats - provides some stats about Nginx logs stored in MongoDB
    Args:
     - mongo_collection: pymongo collection object
    Return: nothing
    """
    if not mongo_collection:
        return

    total = mongo_collection.count_documents({})
    get = mongo_collection.count_documents({"method": "GET"})
    post = mongo_collection.count_documents({"method": "POST"})
    put = mongo_collection.count_documents({"method": "PUT"})
    patch = mongo_collection.count_documents({"method": "PATCH"})
    delete = mongo_collection.count_documents({"method": "DELETE"})
    path = mongo_collection.count_documents(
        {"method": "GET", "path": "/status"}
    )

    print(f"{total} logs")
    print("Methods:")
    print(f"\tmethod GET: {get}")
    print(f"\tmethod POST: {post}")
    print(f"\tmethod PUT: {put}")
    print(f"\tmethod PATCH: {patch}")
    print(f"\tmethod DELETE: {delete}")
    print(f"{path} status check")
    print("IPs:")
    ips = mongo_collection.aggregate([
        {"$group": {"_id": "$ip", "count": {"$sum": 1}}},
        {"$sort": {"count": -1}},
        {"$limit": 10}
    ])
    for ip in ips:
        print(f"\t{ip.get('_id')}: {ip.get('count')}")
    return None


def run():
    """
    Run the script
    """
    client = MongoClient('mongodb://127.0.0.1:27017')
    logs = client.logs.nginx
    log_stats(logs)


if __name__ == "__main__":
    run()
