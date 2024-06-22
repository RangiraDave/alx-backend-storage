#!/usr/bin/env python3
"""
Python script that lists all documents in a collection
in a MongoDB database
"""

import pymongo


def list_all(mongo_collection):
    """
    list_all - list all documents in a collection
    Args:
     - mongo_collection: pymongo collection object
    return: list of documents if collection is not empty, otherwise []
    """
    if not mongo_collection:
        return []

    return list(mongo_collection.find())
