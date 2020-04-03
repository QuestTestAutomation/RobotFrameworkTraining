from guerrillamail import *

class guerillamaillib:

    def ___init__(self):
        #sessionmain = GuerrillaMailSession()
        pass

    def create_session(self):
        sessionmain = GuerrillaMailSession()
        return sessionmain
    @staticmethod
    def get_temporary_email():
        session = GuerrillaMailSession()
        print(session.get_session_state()['email_address'])
        print(session.get_email_list()[0].guid)
        return session.get_email_list()[0].guid

    @staticmethod
    def set_temporary_email(email):
        session = GuerrillaMailSession()
        session.set_email_address(email)
        return session.get_email_list()[0].guid

    @staticmethod
    def get_email_list(self,session):
        emaillist = session.get_email_list()
        for email in emaillist:
            print(email.guid)
            emailattr = session.get_email(email.guid)
            print(emailattr.sender)
            print(emailattr.body)
            print(emailattr.subject)