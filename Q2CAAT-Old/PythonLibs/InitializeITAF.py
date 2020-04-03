

class initializeITAF():

    def __init__(self):
        pass



    def set_global_dictionary(self,ITAFfile):
        print(ITAFfile)
        filehandle = open(ITAFfile)
        parameter_dict = {}
        for Line in filehandle:
            #print(Line)
            Line = Line.strip()
            #print(Line)
            # Initiatlize a parameter Dictinoary
            if not Line.startswith("#"):
                filekeyvalue = Line.split("=")
                if len(filekeyvalue) == 2:
                    parameter_dict[filekeyvalue[0].strip()] = filekeyvalue[1].strip()
        #print(parameter_dict)
        return parameter_dict

