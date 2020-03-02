class sku_query_builder():

    ROBOT_LIBRARY_VERSION = 1.0

    def __init__(self):
        pass
    
    def _chunks(self, lst, step):
        for i in range(0, len(lst), step):
            #print(str(i))
            yield lst[i:i + step]

    def build_sku_query_by_product_name(self, lines, col_number=3, split_by=50):
        queries = []
        for chunk in self._chunks(lines, split_by):
            query = ''
            for line in chunk:
                columns = line.split(sep=',')
                #print(columns[int(col_number)])
                query = query + ' OR ' + str(columns[int(col_number)])
            queries.append(query.replace(' OR ', '', 1))
        return queries
