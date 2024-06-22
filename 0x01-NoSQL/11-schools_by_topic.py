#!/usr/bin/env python3
"""
Python script that returns the list of school having a specific topic
"""

import pymongo


def schools_by_topic(mongo_collection, topic):
    """
    schools_by_topic - returns the list of school having a specific topic
    Args:
     - mongo_collection: pymongo collection object
     - topic: string - topic to search
    Return: list of schools having the topic
    """
    if not mongo_collection:
        return []

    return list(mongo_collection.find({"topics": topic}))
