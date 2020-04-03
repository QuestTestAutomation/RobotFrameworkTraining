from testrail import APIClient
from TestRailLibrary import TestRailLibrary

import string
import re
import pprint


class TestRailLibraryExt:
    """
    Intercommunication with TestRail

    """

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    ROBOT_LIBRARY_VERSION = '0.1'

    #__all__ = ['Add_Result_To_TestRail_Case']

    def __init__(self, TestRailURL='', user='', APIkey=''):
        self._client = APIClient(TestRailURL)
        self._client.user = user
        self._client.password = APIkey

    def __str__(self):
        return 'RobotFramework TestRailLibrary'

    def Add_Result_To_TestRail_Case(self, project_name, test_run_name, caseID, status, **kwargs):
        runID = self.Get_TestRail_RunID(self, project_name, test_run_name)
        body = {}
        for key in kwargs:
            body[key] = kwargs[key]

        statusID = 5
        if status == 'PASS':
            statusID = 1

        body['status_id'] = statusID
        result = self._client.send_post(
            'add_result_for_case/' + str(runID) + '/' + str(caseID),
            body
        )
        return result

    def Add_Result_To_TestRail_Case_Run_Config(self, project_name, plan_name, test_run_name, config, caseID, status,
                                               **kwargs):
        runID = self.Get_TestRail_RunID_by_plan_configs(self, project_name, plan_name, test_run_name, config)
        body = {}
        for key in kwargs:
            body[key] = kwargs[key]

        statusID = 5
        if status == 'PASS':
            statusID = 1

        body['status_id'] = statusID
        result = self._client.send_post(
            'add_result_for_case/' + str(runID) + '/' + str(caseID),
            body
        )
        return result

    @staticmethod
    def Get_TestRail_ProjectID(self, name):
        projects = self._client.send_get(
            'get_projects'
        )
        for project in projects:
            if project['name'] == name:
                return project['id']
        return 0

    @staticmethod
    def Get_TestRail_ProjectRuns(self, project_name):
        projectID = self.Get_TestRail_ProjectID(self, project_name)
        runs = self._client.send_get(
            'get_runs/' + str(projectID)
        )
        return runs

    @staticmethod
    def Get_TestRail_RunID(self, project_name, run_name):
        runs = self.Get_TestRail_ProjectRuns(self, project_name)
        for run in runs:
            if run['name'] == run_name:
                return run['id']
        return 0

    @staticmethod
    def Get_TestRail_Plans(self, project_name):
        projectID = self.Get_TestRail_ProjectID(self, project_name)
        plans = self._client.send_get(
            'get_plans/' + str(projectID)

        )
        print(projectID)
        print(plans)
        print("I am in plans")
        return plans

    @staticmethod
    def Get_TestRail_PlanID(self, project_name, plan_name):
        plans = self.Get_TestRail_Plans(self, project_name)
        for plan in plans:
            print(plan)
            if plan['name'] == plan_name:
                return plan['id']
        return 0

    @staticmethod
    def Get_TestRail_PlanRuns(self, project_name, plan_name):
        planID = self.Get_TestRail_PlanID(self, project_name, plan_name)
        planRuns = self._client.send_get(
            'get_plan/' + str(planID)
        )
        return planRuns['entries']

    @staticmethod
    def Get_TestRail_RunID_by_plan_configs(self, project_name, plan_name, run_name, configs):
        planRuns = self.Get_TestRail_PlanRuns(self, project_name, plan_name)
        for run in planRuns:
            if configs is None:
                if run['name'] == run_name:
                    return run['runs'][0]['id']
            else:
                for subrun in run['runs']:
                    if subrun['name'] == run_name and subrun['config'] == configs:
                        return subrun['id']
        return 0

    @staticmethod
    def Get_TestRail_configIDs_by_names(self, project_name, names):
        projectID = self.Get_TestRail_ProjectID(self, project_name)
        config_groups = self._client.send_get(
            'get_configs/' + str(projectID)
        )
        ids = []
        for group in config_groups:
            for config in group['configs']:
                if config['name'] in names:
                    ids.append(config['id'])
        return ids

    @staticmethod
    def Get_TestRail_Suite(self, project_name, name):
        projectID = self.Get_TestRail_ProjectID(self, project_name)
        suites = self._client.send_get(
            'get_suites/' + str(projectID)

        )
        print('printing suites')
        print(suites)
        for suite in suites:
            if suite['name'] == name:
                return suite

        return None

    @staticmethod
    def Create_Test_Run_with_all_cases(self, project_name, run_name, description):
        projectID = self.Get_TestRail_ProjectID(self, project_name)
        data = {}
        data['name'] = run_name
        data['description'] = description

        result = self._client.send_post(
            'add_run/' + str(projectID),
            data
        )
        return result

    @staticmethod
    def Add_Test_Run_to_Plan_with_all_cases_configs(self, project_name, suite, plan_name, run_name, description,
                                                    configs):
        planID = self.Get_TestRail_PlanID(self, project_name, plan_name)
        configIDs = self.Get_TestRail_configIDs_by_names(self, project_name, configs)
        suite = self.Get_TestRail_Suite(self, project_name, suite)
        run = {}
        plan = {}
        plan['suite_id'] = suite['id']
        plan['name'] = run_name
        plan['config_ids'] = configIDs
        # run['name'] = run_name
        run['description'] = description
        run['include_all'] = True
        run['config_ids'] = configIDs
        # run['suite_id'] = suite['id']
        plan['runs'] = [run]

        result = self._client.send_post(
            'add_plan_entry/' + str(planID),
            plan
        )
        return result

    @staticmethod
    def Add_Test_Run_to_Plan_with_all_cases_configs_set(self, project_name, suite, plan_name, run_name, description,
                                                        configs_set):

        allPlanRuns = self.Get_TestRail_PlanRuns(self, project_name, plan_name)

        for existingRun in allPlanRuns:
            if existingRun['name'] == run_name:
                return 'Test Run already created. No actions needed'

        planID = self.Get_TestRail_PlanID(self, project_name, plan_name)
        allConfigIds = []
        for conf in configs_set:
            configIDs = self.Get_TestRail_configIDs_by_names(self, project_name, conf)
            allConfigIds.extend(configIDs)

        suite = self.Get_TestRail_Suite(self, project_name, suite)
        plan = {}
        plan['suite_id'] = suite['id']
        plan['name'] = run_name
        plan['config_ids'] = list(set(allConfigIds))

        runs = []
        for conf in configs_set:
            run = {}
            confIDs = self.Get_TestRail_configIDs_by_names(self, project_name, conf)
            run['description'] = description
            run['include_all'] = True
            run['config_ids'] = confIDs
            runs.append(run)

        plan['runs'] = runs
        pprint.pprint(plan)

        result = self._client.send_post(
            'add_plan_entry/' + str(planID),
            plan
        )
        return result

    def Pretty_Print_Test_Comment(self, header='EXECUTION INFO', **kwargs):
        comment = header + '\n\n'
        for key in kwargs:
            val = ''
            if isinstance(kwargs[key], list):
                val = ', '.join(str(x) for x in kwargs[key])
            else:
                val = kwargs[key]

            comment = comment + str(key) + ": " + val + '\n\n'
        return comment

    def Extract_CaseID_From_Robot_Tags(self, tags):
        for tag in tags:
            st = str(tag)
            match = re.findall(r'^C(\d{0,}\d$)', st)
            if len(match) > 0:
                return int(match[0])
            else:
                return 0
        return 0

    def get_case(self, caseID):
        case = self._client.send_get('get_case/' + str(caseID))
        return case

    def get_testrail_test_details(self, testID):
        test = self._client.send_get('get_test/' + str(testID))
        return test


    def Get_TestRail_Milestones(self,project_name):

        projectID = self.Get_TestRail_ProjectID(self,project_name)
        print(projectID)
        Milestones = self._client.send_get(
            'get_milestones/' + str(projectID)
        )
        print(Milestones)
        return Milestones


    def Get_TestRail_Milestoneid(self, project_name,milestone_name):
        milestones = self.Get_TestRail_Milestones(project_name)
        for milestone in milestones:
            if milestone['name'] == milestone_name:
                return milestone['id']
        return 0


    def Add_TestRail_Milestone(self, project_name, milestone_name,milestonedescription):

        projectID = self.Get_TestRail_ProjectID(self,project_name)
        milestoneid = self.Get_TestRail_Milestoneid(project_name,milestone_name)
        if milestoneid == 0:
            testrailurl = 'add_milestone/' + str(projectID)

            milestone = {
                "name": milestone_name,
                "Description": milestonedescription,
            }
            self._client.send_post(testrailurl, milestone)
            print("Milestone does not exist. It is added")
        else:
            print("Milestone already exists")


    def Get_TestRail_Cases(self,project_name):

        projectID = self.Get_TestRail_ProjectID(self,project_name)
        print(projectID)
        Milestones = self._client.send_get(
            'get_cases/' + str(projectID)
        )
        print(Milestones)
        return Milestones


    def Get_TestRail_Milestones(self,project_name):

        projectID = self.Get_TestRail_ProjectID(self,project_name)

        Milestones = self._client.send_get(
            'get_milestones/' + str(projectID)
        )
        print(Milestones)
        return Milestones


    def Get_TestRail_Runs(self,project_name):

        projectID = self.Get_TestRail_ProjectID(self,project_name)
        print(projectID)
        Milestones = self._client.send_get(
            'get_runs/' + str(projectID)
        )
        print(Milestones)
        return Milestones


    def Add_TestRail_TestPlan(self,project_name,plan_name,**kwargs):

        projectid = self.Get_TestRail_ProjectID(self,project_name)
        plans = self.Get_TestRail_Plans(self, project_name)
        if plans == 0:
            print("**Plans does not exist")
        else:
            print(plans)
        planid = self.Get_TestRail_PlanID(self, project_name, plan_name)
        print(planid)
        if planid == 0:
            print("Plan does not exist")
        else:
            print(planid)
        trurl = 'add_plan/' + str( projectid)
        print(trurl)
        body = {}
        for key in kwargs:
            body[key] = kwargs[key]
        body["name"] = plan_name
        body["Description"] = plan_name
        '''
        dict_plan = {
            "name": plan_name,
            "Description": plan_name,
            body

         }
        result = self._client.send_post(trurl, body)
        '''
        result = self._client.send_post('add_plan/' + str(projectid),body)
        return result

    def Add_TestRail_TestRun_to_TestPlan(self,project_name,**kwargs):

        projectid = self.Get_TestRail_ProjectID(self,project_name)


        body = {}
        for key in kwargs:
            body[key] = kwargs[key]

        print(body)
        result = self._client.send_post('add_run/' + str(projectid),body)
        return result

    def Add_TestRail_Result_to_TestCase(self,project_name,**kwargs):

        projectid = self.Get_TestRail_ProjectID(self,project_name)


        body = {}
        for key in kwargs:
            body[key] = kwargs[key]

        print(body)
        result = self._client.send_post('add_result_for_case/' + str(projectid),body)
        return result

    def Add_Result_To_TestRail_Case_Run_Config(self, project_name, plan_name, test_run_name, config, caseID, status,
                                               **kwargs):
        runID = self.Get_TestRail_RunID_by_plan_configs(self, project_name, plan_name, test_run_name, config)
        body = {}
        for key in kwargs:
            body[key] = kwargs[key]

        statusID = 5
        if status == 'PASS':
            statusID = 1

        body['status_id'] = statusID
        result = self._client.send_post(
            'add_result_for_case/' + str(runID) + '/' + str(caseID),
            body
        )
        return result

    def Get_Result_for_TestRail_Case_Run_Config(self, project_name, test_run_name, caseID):
        runID = self.Get_TestRail_RunID(self,project_name,test_run_name)
        print(runID)


        results = self._client.send_get(
            'get_results_for_case/' + str(runID) + '/' + str(caseID)

        )
        return results
    def Add_Result_To_TestRail_Case_details(self, project_name, test_run_name, caseID, testresult):
        runID = self.Get_TestRail_RunID(self, project_name, test_run_name)

        result = self._client.send_post(
            'add_result_for_case/' + str(runID) + '/' + str(caseID),
            testresult
        )
        return result

    def add_custom_test_result_step(self,result,step,actualresult,expectedresult,):
        pass
