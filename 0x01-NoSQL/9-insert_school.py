#!/usr/bin/env python3
"""
Python script that inserts a new document in a collection
in a MongoDB database
"""

import pymongo


def insert_school(mongo_collection, **kwargs):
    """
    insert_school - insert a new document in a collection
    Args:
     - mongo_collection: pymongo collection object
     - kwargs: dictionary with key-value pairs
    Return: new document's _id
    """
    if not mongo_collection:
        return None

    return mongo_collection.insert_one(kwargs).inserted_id
