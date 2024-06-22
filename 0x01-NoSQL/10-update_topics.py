#!/usr/bin/env python3
"""
Python script that changes all topics of a school document based on the name
"""

import pymongo


def update_topics(mongo_collection, name, topics):
    """
    update_topics - changes all topics of a school document based on the name
    Args:
     - mongo_collection: pymongo collection object
     - name: string - school name to update
     - topics: list of strings - list of topics approached in the school
    Return: nothing
    """
    if not mongo_collection:
        return

    mongo_collection.update_many({"name": name}, {"$set": {"topics": topics}})
