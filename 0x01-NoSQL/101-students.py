#!/usr/bin/env python3
"""
Python script that returns all students sorted by average score
"""

import pymongo


def top_students(mongo_collection):
    """
    top_students - returns all students sorted by average score
    Args:
     - mongo_collection: pymongo collection object
    Return: list of students sorted by average score
    """
    students = []
    
    students = mongo_collection.aggregate([
        {
            "$project": {
                'id': 1,
                'name': 1,
                'averageScore': {"$avg": "$topics.score"},
                'topics': 1,
            },
        },
        {
            "$sort": {'averageScore': -1},
        },
        ])
    
    return students
