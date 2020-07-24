Feature: Test TranQL's answer from a given TranQL when querying only ICEES

    Scenario: Test TranQL's answer when querying only ICEES for all ages drug exposure
      Given the TranQL query:
      """
        SELECT population_of_individual_organisms->chemical_substance
          FROM "/clinical/cohort/disease_to_chemical_exposure?provider=icees"
         WHERE icees.table = 'patient'
           AND icees.year = 2010
           AND icees.cohort_features.AgeStudyStart = '0-2'
           AND icees.feature.EstResidentialDensity = 1
           AND icees.maximum_p_value = 1
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "cohort"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name[*]" with "string" "fluticasone"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "association"


    Scenario: Test TranQL's answer when querying only ICEES
      Given the TranQL query:
      """
        SELECT population_of_individual_organisms->chemical_substance
          FROM "/clinical/cohort/disease_to_chemical_exposure?provider=icees"
         WHERE icees.table = 'patient'
           AND icees.year = 2010
           AND icees.cohort_features.AgeStudyStart = '3-17'
           AND icees.feature.EstResidentialDensity > 1
           AND icees.MaxDailyOzoneExposure_2_qcut > 2
           AND icees.AvgDailyPM25Exposure_2_qcut > 2
           AND icees.maximum_p_value = 1
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name[*]" with "string" "prednisone"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name[*]" with "string" "diphenhydramine"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "association"


    Scenario: Test TranQL's answer when querying only ICEES
      Given the TranQL query:
      """
        SELECT population_of_individual_organisms->chemical_substance
          FROM "/clinical/cohort/disease_to_chemical_exposure?provider=icees"
         WHERE icees.table = 'patient'
           AND icees.year = 2010
           AND icees.cohort_features.AgeStudyStart = '0-2'
           AND icees.feature.EstResidentialDensity = 1
           AND icees.feature.Race = 'African American'
           AND icees.feature.AsthmaDx = 1
           AND icees.maximum_p_value = 1
           AND drug_exposure = 'PUBCHEM.COMPOUND:5865'
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "cohort"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "ozone"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Particulate Matter"
