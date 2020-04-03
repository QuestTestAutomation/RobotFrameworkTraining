

class HandleException():

    def __init__(self):

        pass

    @staticmethod
    def handle_exception(ErrorMessage,FunctionName):

        print("Error : " + ErrorMessage + " ; raised while executing the function  " + FunctionName)