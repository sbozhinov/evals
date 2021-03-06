
<?php
  /*
    Copyright 2010 Persistent Systems Limited

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
   */

    /**
    * This code was generated by the tool 'PHPDataSvcUtil.php'.
    * Runtime Version:1.0
    *
    * Changes to this file may cause incorrect behavior and will be lost if
    * the code is regenerated.
    */

    require_once 'Context/ObjectContext.php';
    /**
    * Defines default OData Service URL for this proxy class
    */
    define("DEFAULT_ODATA_SERVICE_URL", "https://webapps.eastern.ewu.edu/datainterfaces/CourseEnrollment.svc");
    
   /**
    * @class:COURSES
    * @type:EntityType
    * @key:TERM
    * @key:CRN
    */
    class COURSES extends Object
    {
        protected $_entityMap = array();
        protected $_entityKey = array();
        protected $_relLinks  = array();
        protected $_baseURI;

    
       /**
        * @Type:EntityProperty
        * NotNullable
        * @EdmType:Edm.String
        * @MaxLength:6
        * @FixedLength:false
        */
        public $TERM;
    
       /**
        * @Type:EntityProperty
        * NotNullable
        * @EdmType:Edm.String
        * @MaxLength:5
        * @FixedLength:false
        */
        public $CRN;
    
       /**
        * @Type:EntityProperty
        * NotNullable
        * @EdmType:Edm.String
        * @MaxLength:4
        * @FixedLength:false
        */
        public $SUBJ;
    
       /**
        * @Type:EntityProperty
        * NotNullable
        * @EdmType:Edm.String
        * @MaxLength:5
        * @FixedLength:false
        */
        public $CRSENUMB;
    
       /**
        * @Type:EntityProperty
        * NotNullable
        * @EdmType:Edm.String
        * @MaxLength:3
        * @FixedLength:false
        */
        public $SECTION;
    
       /**
        * @Type:EntityProperty
        * @EdmType:Edm.String
        * @MaxLength:30
        * @FixedLength:false
        */
        public $TITLE;
    
       /**
        * @Type:EntityProperty
        * @EdmType:Edm.DateTime
        */
        public $START_DATE;
    
       /**
        * @Type:EntityProperty
        * @EdmType:Edm.DateTime
        */
        public $END_DATE;
    
       /**
        * @Type:NavigationProperty
        * @Relationship:COURSEEVAL_COURSESCOURSEEVAL_MEMBERS
        * @FromRole:COURSEEVAL_COURSES
        * @ToRole:COURSEEVAL_MEMBERS
        */
        public $MEMBERS;
    

       /**
        * Function to create an instance of COURSES
        * @param Edm.String $TERM
        * @param Edm.String $CRN
        * @param Edm.String $SUBJ
        * @param Edm.String $CRSENUMB
        * @param Edm.String $SECTION
        */
        public static function CreateCOURSES(
            $TERM, 
            $CRN, 
            $SUBJ, 
            $CRSENUMB, 
            $SECTION)
        {   
            $COURSES = new COURSES();
            $COURSES->TERM = $TERM;
            $COURSES->CRN = $CRN;
            $COURSES->SUBJ = $SUBJ;
            $COURSES->CRSENUMB = $CRSENUMB;
            $COURSES->SECTION = $SECTION;
            return $COURSES;
        }

       /**
        * Constructor for COURSES
        */
        public function __construct($uri = "")
        {
            $this->_objectID = Guid::NewGuid();
            $this->_baseURI = $uri;
    
            $this->_entityMap['MEMBERS'] = 'COURSEEVAL_MEMBERS';
            $this->MEMBERS = array();
        }

       /**
        * overring getObjectID() functon of Object class
        */
        public function getObjectID()
        {
            return $this->_objectID;
        }

       /**
        * This function returns the entity keys of this entity.
        */
        public function getEntityKeys()
        {
            return $this->_entityKey;
        }

       /**
        * This function set the entity keys of this entity.
        */
        public function setEntityKeys($entityKey)
        {
            $this->_entityKey = $entityKey;
        }

       /**
        * This function returns the related links of this entity.
        */
        public function getRelatedLinks()
        {
            return $this->_relLinks;
        }

       /**
        * This function set the related links of this entity.
        */
        public function setRelatedLinks($relLinks)
        {
            $this->_relLinks = $relLinks;
        }

       /**
        * Function for getting Entity Type Name corrosponding to navigation Name
        */
        public function getActualEntityTypeName($key)
        {
            if (array_key_exists($key, $this->_entityMap))
            {
                return ($this->_entityMap[$key]);
            }
            return $key;
        }
    }
  
   /**
    * @class:MEMBERS
    * @type:EntityType
    * @key:TERM
    * @key:CRN
    * @key:ID
    */
    class MEMBERS extends Object
    {
        protected $_entityMap = array();
        protected $_entityKey = array();
        protected $_relLinks  = array();
        protected $_baseURI;

    
       /**
        * @Type:EntityProperty
        * NotNullable
        * @EdmType:Edm.String
        * @MaxLength:6
        * @FixedLength:false
        */
        public $TERM;
    
       /**
        * @Type:EntityProperty
        * NotNullable
        * @EdmType:Edm.String
        * @MaxLength:5
        * @FixedLength:false
        */
        public $CRN;
    
       /**
        * @Type:EntityProperty
        * NotNullable
        * @EdmType:Edm.String
        * @MaxLength:8
        * @FixedLength:false
        */
        public $ID;
    
       /**
        * @Type:EntityProperty
        * NotNullable
        * @EdmType:Edm.String
        * @MaxLength:7
        * @FixedLength:false
        */
        public $ROLE;
    
       /**
        * @Type:EntityProperty
        * @EdmType:Edm.String
        * @MaxLength:60
        * @FixedLength:
        */
        public $LAST_NAME;
    
       /**
        * @Type:EntityProperty
        * @EdmType:Edm.String
        * @MaxLength:60
        * @FixedLength:
        */
        public $FIRST_NAME;
    
       /**
        * @Type:NavigationProperty
        * @Relationship:COURSEEVAL_COURSESCOURSEEVAL_MEMBERS
        * @FromRole:COURSEEVAL_MEMBERS
        * @ToRole:COURSEEVAL_COURSES
        */
        public $COURSES;
    

       /**
        * Function to create an instance of MEMBERS
        * @param Edm.String $TERM
        * @param Edm.String $CRN
        * @param Edm.String $ID
        * @param Edm.String $ROLE
        */
        public static function CreateMEMBERS(
            $TERM, 
            $CRN, 
            $ID, 
            $ROLE)
        {   
            $MEMBERS = new MEMBERS();
            $MEMBERS->TERM = $TERM;
            $MEMBERS->CRN = $CRN;
            $MEMBERS->ID = $ID;
            $MEMBERS->ROLE = $ROLE;
            return $MEMBERS;
        }

       /**
        * Constructor for MEMBERS
        */
        public function __construct($uri = "")
        {
            $this->_objectID = Guid::NewGuid();
            $this->_baseURI = $uri;
    
            $this->_entityMap['COURSES'] = 'COURSEEVAL_COURSES';
            $this->COURSES = array();
        }

       /**
        * overring getObjectID() functon of Object class
        */
        public function getObjectID()
        {
            return $this->_objectID;
        }

       /**
        * This function returns the entity keys of this entity.
        */
        public function getEntityKeys()
        {
            return $this->_entityKey;
        }

       /**
        * This function set the entity keys of this entity.
        */
        public function setEntityKeys($entityKey)
        {
            $this->_entityKey = $entityKey;
        }

       /**
        * This function returns the related links of this entity.
        */
        public function getRelatedLinks()
        {
            return $this->_relLinks;
        }

       /**
        * This function set the related links of this entity.
        */
        public function setRelatedLinks($relLinks)
        {
            $this->_relLinks = $relLinks;
        }

       /**
        * Function for getting Entity Type Name corrosponding to navigation Name
        */
        public function getActualEntityTypeName($key)
        {
            if (array_key_exists($key, $this->_entityMap))
            {
                return ($this->_entityMap[$key]);
            }
            return $key;
        }
    }
  
   /**
    * Container class CourseEnrollmentEntities, Namespace: CourseEnrollmentModel
    */
    class CourseEnrollmentEntities extends ObjectContext
    {
    
        protected $_COURSES;
        protected $_MEMBERS;
        
       /**
        * The constructor for CourseEnrollmentEntities accepting service URI
        */
        public function __construct($uri = "")
        {
            if(strlen($uri) == 0)
            {
                $uri = DEFAULT_ODATA_SERVICE_URL;
            }

            if (Utility::reverseFind($uri, '/') != strlen($uri) - 1)
            {
                $uri = $uri . '/';
            }

            $this->_baseURI = $uri;
            parent::__construct($this->_baseURI);
            $this->_entities = array(
                                "COURSES",
                                "MEMBERS");
            $this->_entitySet2Type = array(
                                            "courses" => "COURSES", 
                                            "members" => "MEMBERS");
            $this->_entityType2Set = array(
                                            "courses" => "COURSES", 
                                            "members" => "MEMBERS");

            $this->_association = array();

    
            $this->_COURSES = new DataServiceQuery('/'.'COURSES', $this);
            $this->_MEMBERS = new DataServiceQuery('/'.'MEMBERS', $this);

        }

    
        /**
         * Function returns DataServiceQuery reference for
         * the entityset COURSES
         * @return DataServiceQuery
         */
        public function COURSES()
        {
            $this->_COURSES->ClearAllOptions();
            return $this->_COURSES;
        }
    
        /**
         * Function returns DataServiceQuery reference for
         * the entityset MEMBERS
         * @return DataServiceQuery
         */
        public function MEMBERS()
        {
            $this->_MEMBERS->ClearAllOptions();
            return $this->_MEMBERS;
        }
    
       /**
        * Functions for adding object to the entityset/collection
        */
    
       /**
        * Add COURSES
        * @param COURSES $object
        */
      public function AddToCOURSES($object)
        {
            return parent::AddObject('COURSES', $object);
        }
    
       /**
        * Add MEMBERS
        * @param MEMBERS $object
        */
      public function AddToMEMBERS($object)
        {
            return parent::AddObject('MEMBERS', $object);
        }
    

       /**
        * This function returns the entities.
        */
        public function getEntities()
        {
            return $this->_entities;
        }
    }
  
?>
  