import ITAFTestRailLibrary
import Utillib
import XLLib

class QSTAFrameworkLib():
   # Variablesfile = 'C:/QSTAF/Resources/QSTAFParameters.cfg'

    def __init__(self):
        pass


    @staticmethod
    def initializevariables(self,variablesfile):
        filehandle = open(variablesfile)
        parameter_dict = {}
        for Line in filehandle:

            Line = Line.strip()


            if not Line.startswith("#"): #Ignore comments
                filekeyvalue = Line.split("=")
                if len(filekeyvalue) == 2: #only select key value pair
                    parameter_dict[filekeyvalue[0].strip()] = filekeyvalue[1].strip()

        print(parameter_dict)





