"""Provides corresponding single or plural values
"""

plurals = {
    'Opportunities':'Opportunity',
    'CPQ Quotes':'CPQ Quote'
    
    }

def get_single_or_plural(name):
    """Return corresponding to ``name`` single or plural value form global ``plurals`` dictionary     
    """
    print(name)
    for k, v in plurals.items():
        if k == name:
            return v
        if v == name:
            return k
        