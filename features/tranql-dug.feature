Feature: Test dug queries
  # ----------------- Disease -> Phenotypic feature ------------
  Scenario: Test TranQL's answer when querying robokop with disease (intracerebral hemorrhage) from topmed
      Given the TranQL query:
      """
        select disease->phenotypic_feature
          FROM "/graph/gamma/quick"
         WHERE disease="MONDO:0013792"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Phenotypic abnormality"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Abnormality of blood circulation"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Abnormal cardiovascular system physiology"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0004968"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0011029"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0012443"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Abnormality of head or neck"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Organ abnormality"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Abnormality of cardiovascular "

  Scenario: Test TranQL's answer when querying schema with disease (intracerebral hemorrhage)  from topmed
      Given the TranQL query:
      """
        select disease->phenotypic_feature
          FROM "/schema"
         WHERE disease="MONDO:0013792"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Phenotypic abnormality"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Abnormality of blood circulation"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Abnormal cardiovascular system physiology"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0004968"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0011029"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0012443"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Organ abnormality"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Blood circulation disorder"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Abnormally shaped skeletal"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Abnormality of cardiovascular system physiology"


   Scenario: Test TranQL's answer when querying robokjop with disease (hypertensive disorder)  from topmed
      Given the TranQL query:
      """
        select disease->phenotypic_feature
          FROM "/graph/gamma/quick"
         WHERE disease="MONDO:0005044"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Fetal distress"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Heart murmur"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Anasarca"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "has_phenotype"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0100735"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0000875"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0000017"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Snore"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Snores"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Snoring symptoms"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Spasms on one side of the face"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Hemifacial spasms"

   Scenario: Test TranQL's answer when querying schema with disease (hypertensive disorder)  from topmed
      Given the TranQL query:
      """
        select disease->phenotypic_feature
          FROM "/schema"
         WHERE disease="MONDO:0005044"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Fetal distress"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Heart murmur"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Anasarca"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "has_phenotype"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0100735"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0000875"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0000017"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Snore"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Snores"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Snoring symptoms"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Spasms on one side of the face"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Hemifacial spasms"
   # ---------- End  Disease -> phenotypic_feature -------------------

   # ---------- start Phenotypic_feature -> disease -------------------
   Scenario: Test TranQL's answer when querying schema with phenotypic feature (HP:0002140/Ischemic stroke) from topmed
      Given the TranQL query:
      """
        select phenotypic_feature->disease
          FROM "/graph/gamma/quick"
         WHERE phenotypic_feature="HP:0002140"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "brain ischemia"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "stroke disorder"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "pulmonary arteriovenous malformation (disease)"

      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "has_phenotype"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0014936"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0008535"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "HHT4"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "telangiectasia, hereditary hemorrhagic, type 4"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "telangiectasia, hereditary hemorrhagic, type 4; HHT4"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Degos disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Kohlmeier-Degos disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Köhlmeier-Degos disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Kohlmeier-Degos-Delort-Tricort syndrome"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Köhlmeier-Degos-Delort-Tricort syndrome"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "malignant atrophic papulosis"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "papulosis atrophican maligna"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "atrophic papulosis, malignant"


  Scenario: Test TranQL's answer when querying schema with phenotypic feature (HP:0002140/Ischemic stroke) from topmed
      Given the TranQL query:
      """
        select phenotypic_feature->disease
          FROM "/schema"
         WHERE phenotypic_feature="HP:0002140"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "brain ischemia"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "stroke disorder"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "pulmonary arteriovenous malformation (disease)"

      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "has_phenotype"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0014936"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0008535"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "HHT4"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "telangiectasia, hereditary hemorrhagic, type 4"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "telangiectasia, hereditary hemorrhagic, type 4; HHT4"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Degos disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Kohlmeier-Degos disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Köhlmeier-Degos disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Kohlmeier-Degos-Delort-Tricort syndrome"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Köhlmeier-Degos-Delort-Tricort syndrome"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "malignant atrophic papulosis"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "papulosis atrophican maligna"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "atrophic papulosis, malignant"



  Scenario: Test TranQL's answer when querying robokop with phenotypic feature (HP:0001907/Thromboembolism) from topmed
      Given the TranQL query:
      """
        select phenotypic_feature->disease
          FROM "/graph/gamma/quick"
         WHERE phenotypic_feature="HP:0001907"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some disease
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "hematologic disease"

      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "has_phenotype"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0019959"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0010602"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "HAT"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "heparin-associated thrombocytopenia"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "heparin-induced thrombocytopenia"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "heparin-induced thrombocytopenia type 2"

  Scenario: Test TranQL's answer when querying schema with phenotypic feature (HP:0001907/Thromboembolism) from topmed
      Given the TranQL query:
      """
        select phenotypic_feature->disease
          FROM "/schema"
         WHERE phenotypic_feature="HP:0001907"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some disease
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "hematologic disease"

      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "has_phenotype"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "subclass_of"

      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0019959"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0010602"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "heparin-associated thrombocytopenia"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "heparin-induced thrombocytopenia"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "heparin-induced thrombocytopenia type 2"

  # ---------- end  Phenotypic_feature -> disease -------------------

  # ---------- start disease -> anatomical_entity -------------------

  Scenario: Test TranQL's answer when querying robokop with disease  (MONDO:0005275/lung disease) from topmed
      Given the TranQL query:
      """
        select disease->anatomical_entity
          FROM "/graph/gamma/quick"
         WHERE disease="MONDO:0005275"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some anatomical entity
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "trunk"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "UBERON:0000915"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "anatomical tube"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "lungs"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "lungs pair"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "pulmones"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "set of lungs"

  Scenario: Test TranQL's answer when querying schema with disease  (MONDO:0005275/lung disease) from topmed
      Given the TranQL query:
      """
        select disease->anatomical_entity
          FROM "/schema"
         WHERE disease="MONDO:0005275"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some anatomical entity
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "trunk"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "UBERON:0000915"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "anatomical tube"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "lungs"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "lungs pair"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "pulmones"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "set of lungs"


  Scenario: Test TranQL's answer when querying robokop with disease  (MONDO:0005098/stroke disorder) from topmed
      Given the TranQL query:
      """
        select disease->anatomical_entity
          FROM "/graph/gamma/quick"
         WHERE disease="MONDO:0005098"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some anatomical entity
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "vessel"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "related_to"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "UBERON:0003499"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "vas sanguineum"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "blood vessel of brain"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "blood vascular network"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "set of blood vessels"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "blood system"


  Scenario: Test TranQL's answer when querying schema with disease  (MONDO:0005098/stroke disorder) from topmed
      Given the TranQL query:
      """
        select disease->anatomical_entity
          FROM "/schema"
         WHERE disease="MONDO:0005098"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some anatomical entity
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "vessel"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "related_to"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "UBERON:0003499"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "vas sanguineum"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "blood vessel of brain"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "blood vascular network"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "set of blood vessels"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "blood system"


  # --------- end disease -> anatomical_entity ---------------------
  # --------- start chemical_substance -> disease ---------------------
  Scenario: Test TranQL's answer when querying robokop with chemical substance  (CHEBI:16737/creatinine) from topmed
      Given the TranQL query:
      """
        select chemical_substance->disease
          FROM "/graph/gamma/quick"
         WHERE chemical_substance="CHEBI:16737"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "chemical_substance"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "cystic fibrosis"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "contributes_to"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0009563"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Creatine anhydride"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "creatinina"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Kreatinin"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Acute kidney failure"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Acute renal failure"

  Scenario: Test TranQL's answer when querying robokop with chemical substance  (CHEBI:16737/creatinine) from topmed
      Given the TranQL query:
      """
        select chemical_substance->disease
          FROM "/schema"
         WHERE chemical_substance="CHEBI:16737"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some disease
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "chemical_substance"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "cystic fibrosis"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "contributes_to"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0009563"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Creatine anhydride"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "creatinina"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Kreatinin"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Acute kidney failure"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Acute renal failure"

  Scenario: Test TranQL's answer when querying robokop with chemical substance  (CHEBI:17855/triglyceride) from topmed
      Given the TranQL query:
      """
        select chemical_substance->disease
          FROM "/graph/gamma/quick"
         WHERE chemical_substance="CHEBI:17855"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "chemical_substance"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "metabolic disease"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "contributes_to"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "contributes_to"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "treats"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004946"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Triacylglycerol"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "triacylglycerols"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Triglycerid"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Triglyzerid"

  Scenario: Test TranQL's answer when querying schema with chemical substance  (CHEBI:17855/triglyceride) from topmed
      Given the TranQL query:
      """
        select chemical_substance->disease
          FROM "/schema"
         WHERE chemical_substance="CHEBI:17855"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some phenotypic features
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "chemical_substance"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "metabolic disease"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "contributes_to"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "contributes_to"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "treats"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0004946"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Triacylglycerol"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "triacylglycerols"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Triglycerid"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Triglyzerid"


  # --------- end chemical_substance -> disease ---------------------

  #---------- start phenotypic_feature -> anatomical_entity --------------
  Scenario: Test TranQL's answer when querying schema with phenotypic feature  from topmed
      Given the TranQL query:
      """
        select phenotypic_feature->anatomical_entity
          FROM "/graph/gamma/quick"
         WHERE phenotypic_feature="HP:0002140"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
    # here no data seems to available in gamma for such hop

  Scenario: Test TranQL's answer when querying schema with phenotypic feature from topmed
      Given the TranQL query:
      """
        select phenotypic_feature->anatomical_entity
          FROM "/schema"
         WHERE phenotypic_feature="HP:0002140"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"




  #---------- end phenotypic_feature -> anatomical_entity --------------

  #-------------- start anatomical_entity -> disease ---------------
  Scenario: Test TranQL's answer when querying robokop with anatomical entity  (UBERON:0000948/heart) from topmed
      Given the TranQL query:
      """
        select anatomical_entity->disease
          FROM "/graph/gamma/quick"
         WHERE anatomical_entity="UBERON:0000948"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some disease
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "myocardial disorder"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "related_to"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0002869"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0005310"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "disorder of cardiac ventricle"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "disease of myocardium"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "disease or disorder of myocardium"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "disorder of myocardium"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "myocardial disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "myocardial disorder"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "myocardium disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "myocardium disease or disorder"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "disorder of heart muscle"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "carditis"



  Scenario: Test TranQL's answer when querying schema with anatomical entity  (UBERON:0000948/heart) from topmed
      Given the TranQL query:
      """
        select anatomical_entity->disease
          FROM "/schema"
         WHERE anatomical_entity="UBERON:0000948"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some disease
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "myocardial disorder"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "related_to"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0002869"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0005310"

     # Synonyms are not coming back from Robokop due to the fact that robokop doesn't produce the link anatomical_entity ->
     # disease link

  Scenario: Test TranQL's answer when querying robokop with anatomical entity  (CL:0000738/leukocyte) from topmed
      Given the TranQL query:
      """
        select anatomical_entity->disease
          FROM "/graph/gamma/quick"
         WHERE anatomical_entity="CL:0000738"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some disease
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "hemophagocytic syndrome"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "gastric mucosa-associated lymphoid tissue lymphoma"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "related_to"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "located_in"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "causes"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0002724"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0005402"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "MALT lymphoma of stomach"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "MALT lymphoma of the stomach"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "MALToma of stomach"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "MALToma of the stomach"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "primary gastric B-cell MALT lymphoma"


  Scenario: Test TranQL's answer when querying schema with anatomical entity  (CL:0000738/leukocyte) from topmed
      Given the TranQL query:
      """
        select anatomical_entity->disease
          FROM "/schema"
         WHERE anatomical_entity="CL:0000738"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some disease
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "disease"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "hemophagocytic syndrome"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "gastric mucosa-associated lymphoid tissue lymphoma"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "related_to"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0002724"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "MONDO:0005402"


  #-------------- end anatomical_entity -> disease ---------------

  #-------------- start anatomical_entity -> phenotypic_feature ---------------
  Scenario: Test TranQL's answer when querying robokop with anatomical entity  (UBERON:0001621/coronary artery) from topmed
      Given the TranQL query:
      """
      select anatomical_entity->phenotypic_feature
          FROM "/graph/gamma/quick"
         WHERE anatomical_entity="UBERON:0001621"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some phenotype
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery calcification"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery raised atherosclerotic lesion"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "EFO:0004723"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "EFO:0005616"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "coronary arterial tree"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "coronary vessel"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "coronary artery raised lesions"

  Scenario: Test TranQL's answer when querying schema with anatomical entity  (UBERON:0001621/coronary artery) from topmed
      Given the TranQL query:
      """
      select anatomical_entity->phenotypic_feature
          FROM "/schema"
         WHERE anatomical_entity="UBERON:0001621"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some phenotype
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery calcification"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "coronary artery raised atherosclerotic lesion"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "EFO:0004723"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "EFO:0005616"


  Scenario: Test TranQL's answer when querying robokop with anatomical entity  (UBERON:0001088/urine) from topmed
      Given the TranQL query:
      """
      select anatomical_entity->phenotypic_feature
          FROM "/graph/gamma/quick"
         WHERE anatomical_entity="UBERON:0001088"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some phenotype
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Abnormal urinary copper concentration"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Increased urinary glycerol"
      Then the response should have some JSONPath "knowledge_graph.edges[*].type[*]" with "string" "affects"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0012127"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0010473"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "High urine sarcosine levels"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Abnormality of urine hormone level"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "High urine glycopeptide levels"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Ketone bodies in urine"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Ketonaciduria"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Acetonuria"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Ketoaciduria"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].synonyms[*]" containing "string" "Abnormal urine Cl concentration"

  Scenario: Test TranQL's answer when querying schema with anatomical entity  (UBERON:0001088/urine) from topmed
      Given the TranQL query:
      """
      select anatomical_entity->phenotypic_feature
          FROM "/schema"
         WHERE anatomical_entity="UBERON:0001088"
      """
      When we fire the query to TranQL we expect a HTTP "200"
      Then the response should contain "knowledge_graph"
#      # there should be some phenotype
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "phenotypic_feature"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].type[*]" with "string" "anatomical_entity"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Abnormal urinary copper concentration"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].name" with "string" "Increased urinary glycerol"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0012127"
      Then the response should have some JSONPath "knowledge_graph.nodes[*].id" with "string" "HP:0010473"
  #-------------- end anatomical_entity -> phenotypic_feature ---------------