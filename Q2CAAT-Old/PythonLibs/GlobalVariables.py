class globalvariables():
    glbldict = {'XLSheetName': '', 'XLFile': ''}

    def __init__(self):
        #glbldict = {'XLSheetName': '', 'XLFile': ''}
        #self.glbldict = glbldict
        #for k, v in glbldict.items():
        #   setattr(self, k, v)

        #print(glbldict)
        variablesfile = 'C:/QSTAF/Resources/QSTAFParameters.cfg'
        filehandle = open(variablesfile)
        parameter_dict = {}
        for Line in filehandle:

            Line = Line.strip()

            if not Line.startswith("#"):  # Ignore comments
                filekeyvalue = Line.split("=")
                if len(filekeyvalue) == 2:  # only select key value pair
                    parameter_dict[filekeyvalue[0].strip()] = filekeyvalue[1].strip()

        print(parameter_dict)

        pass

    def glbldictupdate(selfself,dictkey,dictvalue):
         upddict = Globalvariables.glbldict
         upddict[dictkey] = dictvalue
         #glbldict[dictkey] = dictvalue



    def  getdictvar(self):
        print(Globalvariables.glbldict)
        return Globalvariables.glbldict

    def setdictvar(self,dict):
        Globalvariables.glbldict = dict
        print(Globalvariables.glbldict)

    def Getdictvar(self):
        #Globalvariables.glbldict = dict
        #print(Globalvariables.glbldict)
        return Globalvariables.glbldict
    #def  setglobaldict: