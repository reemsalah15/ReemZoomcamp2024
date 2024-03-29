# WORKFLOW ORCHESTRATION WITH MAGE

## Workflow Orchestration 


**WHAT IS ORCHESTRATION**
<br>
Orchestration is the process of dependency management, facilitated through automation.
<br>

Every workflow requires sequential steps:
- Steps = tasks = blocks (mage lingo)
- Workflows = DAGs (directed acyclic graphs) or Pipeline


## Mage
### Mage is an open-source pipeline tool for orchestrating, transforming, and integrating data 

It's goal is to provide a good developer experience with the ability to quickly iterate on pipelines. 

Mage's main components are projects, pipelines, and blocks. Within an instance of Mage you can have many projects, each project can have many pipelines, and a pipeline is made up of one or more blocks. Blocks are written in SQL, Python, or R. They are mostly used for loading, exporting, and transforming data but can be customized to do whatever you want. 
<br>

### CORE COMPONENTS ###
**Projects**
- Are the basis for all work done in Mage (like a GitHub repo)
- Contain the code for pipelines, blocks, and other assets
- A Mage instance has one or more projects

**Pipelines**
- Workflow that perform some operation
- Are made up of blocks
- Are represented by a YAML

**Blocks**
- SQL, Python, or R files that can be executed independently or as part of a pipeline
- Can be used to performa a variety of actions from simple data transformations to complex ML models
- Are defined globally. Changing a block in one place will change the block everywhere it is used, but blocks can be detached to separate instances if needed. 
- Components of a block:  
     - Imports
     - Decorators
     - Function that returns dataframe
     - Assertions
        - tests that run on the output dataframe of the block
        - you can have zero to many assertions
<br>
<br>




