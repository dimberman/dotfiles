Vim�UnDo� �S�M��k�����b=���%91�����o�[	   �                                   [FS�    _�                     �        ����                                                                                                                                                                                                                                                                                                                                                             [FS�     �   �   �          <<<<<<< HEAD5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                             [FS�     �   �   �          =======5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             [FS�     �   �   �          "	metav1.TypeMeta  `json:",inline"`5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             [FS�     �   �   �          #	metav1.ListMeta  `json:"metadata"`5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             [FS�     �   �   �           	Items []SparkJob `json:"items"`5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                             [FS�     �   �   �          >>>>>>> 4836c585... fmt5�_�                     �        ����                                                                                                                                                                                                                                                                                                                                                             [FS�    �               �   
package v1       import (   	apiv1 "k8s.io/api/core/v1"   .	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"   )       }// SparkJob is a job which uses spark cluster spawned on Kubenetes cluster for in memory distributed parallelized processing.   // +genclient   F// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object       type SparkJob struct {   !	metav1.TypeMeta `json:",inline"`       $	metav1.ObjectMeta `json:"metadata"`       	// Spark job specification.    	Spec SparkJobSpec `json:"spec"`       U	// Spark job status, controller monitors the spark cluster pods state and update the   3	// parent spark job custom resource object status.   0	Status SparkJobStatus `json:"status,omitempty"`   }       2var _ metav1.ObjectMetaAccessor = (*SparkJob)(nil)       1func (p SparkJob) GetObjectMeta() metav1.Object {   	return &p.ObjectMeta   }       var _ Job = (*SparkJob)(nil)       (var _ HyperTunableJob = (*SparkJob)(nil)       1func (p SparkJob) GetTypeMeta() metav1.TypeMeta {   	return p.TypeMeta   }       +func (p SparkJob) GetJobState() StateType {   	return p.Status.State   }       &var _ StateProvider = (*SparkJob)(nil)       (func (p SparkJob) GetState() StateType {   	return p.Status.State   }       5func (p SparkJob) GetHyperTuneInfo() *HyperTuneInfo {   	return p.Spec.HyperTuneInfo   }       const (   %	SparkJobDriverRole string = "driver"   %	SparkJobMasterRole string = "master"   %	SparkJobWorkerRole string = "worker"   )       type SparkJobStatus struct {   	// Spark job state   )	State StateType `json:"state,omitempty"`       	// Spark job status message   *	Message string `json:"message,omitempty"`       	// Spark cluster state   ?	ClusterState SparkClusterState `json:"clusterstate,omitempty"`       H	// Spark job Web UI for monitoring and inspecting spark job executions.   4	EndPoints EndPointType `json:"endPoints,omitempty"`   }       type SparkClusterState string       const (   <	SparkClusterInitializing SparkClusterState = "Initializing"   5	SparkClusterReady        SparkClusterState = "Ready"   7	SparkClusterRemoved      SparkClusterState = "Removed"   5	SparkClusterError        SparkClusterState = "Error"   )       type SparkJobSize string       const (   %	TinySparkJob   SparkJobSize = "Tiny"   &	SmallSparkJob  SparkJobSize = "Small"   '	MediumSparkJob SparkJobSize = "Medium"   &	LargeSparkJob  SparkJobSize = "Large"   '	CustomSparkJob SparkJobSize = "Custom"   )       type SparkJobResources struct {   -	// CPU limit for spark job driver container.   %	DriverCores int `json:"driverCores"`       0	// Memory limit for spark job driver container.   *	DriverMemory string `json:"driverMemory"`       Y	// Spark standalone cluster workers count, this is corresponding to number of executors.   %	WorkerCount int `json:"workerCount"`       )	// CPU limit for spark worker container.   %	WorkerCores int `json:"workerCores"`       ,	// Memory limit for spark worker container.   *	WorkerMemory string `json:"workerMemory"`   }       type SparkJobSpec struct {   B	// Spark configuration arguments expressed as list of name=value.   3	// You can set various spark configuration params.   ,	ConfArgs []ConfType `json:"conf,omitempty"`       T	// Application jar along with other jars that will be transferred to spark cluster.   C	// This jar list is included in the driver and executor classpath.   (	// Following URL scheme are supported :   $	// ['hdfs:','http:','https:','s3:']   &	Jars []string `json:"jars,omitempty"`       Z	// Maven coordinates of additional dependencies, transitive dependencies will be handled.   .	Packages []string `json:"packages,omitempty"`       X	// Spark job to run a jar, should be only specified when you submit spark job as a jar.   $	Jar *JarType `json:"jar,omitempty"`       g	// Spark job to run a python script, should be only specified when you submit spark job with py files.   -	Python *PythonType `json:"python,omitempty"`       %	// Spark job to run a SQL statement.   $	Sql *SqlType `json:"sql,omitempty"`       5	// Spark job driver container environment variables.   6	DriverEnv []apiv1.EnvVar `json:"driverEnv,omitempty"`       1	// Spark framework docker distribution version :   *	// ['spark-1.6', 'spark-2.1', 'spark-2.2]   .	SparkFramework string `json:"sparkFramework"`       '	// Deprecated: use Identities instead.   8	HadoopIdentity string `json:"hadoopIdentity,omitempty"`       	// List of identity names.   4	Identities []Identity `json:"identities,omitempty"`       $	// Spark cluster size enumeration :   2	// ['Tiny', 'Small', 'Medium', 'Large', 'Custom']    	Size SparkJobSize `json:"size"`       /	// Spark cluster specification to run the job.   :	Resources *SparkJobResources `json:"resources,omitempty"`       8	// Spark child hypertune job of a hypertune parent job.   >	HyperTuneInfo *HyperTuneInfo `json:"hyperTuneInfo,omitempty"`       	// Application arguments.   0	Arguments []string `json:"arguments,omitempty"`   }       type ConfType struct {   	// Spark config key   	Name string `json:"name"`   	// Spark config value   	Value string `json:"value"`   }       type PackageType string       type JarType struct {   $	// URI of the application jar file.   (	// Following URL scheme are supported :   $	// ['hdfs:','http:','https:','s3:']   	JarUri string `json:"jarUri"`       	// Main class name of the job.   .	// e.g. com.bloomberg.ds.platform.examples.Pi   ,	JarClass string `json:"jarClass,omitempty"`   }       type PythonType struct {   %	// Location of the main python file.   (	// Following URL scheme are supported :   $	// ['hdfs:','http:','https:','s3:']   	PyUri string `json:"pyUri"`       &	// URIs of standalone python file(s).   (	// Following URL scheme are supported :   $	// ['hdfs:','http:','https:','s3:']   ,	PyFiles []string `json:"pyFiles,omitempty"`       9	// List of name(s) of pip-installable python package(s).   4	PipPackages []string `json:"pipPackages,omitempty"`       H	// URI(s) of pip-installable Python package(s) to download and install.   (	// Following URL scheme are supported :   $	// ['hdfs:','http:','https:','s3:']   :	PipPackageUris []string `json:"pipPackageUris,omitempty"`   }       type SqlType struct {   	// Spark SQL string.   .	SqlString string `json:"sqlString,omitempty"`       	// Spark SQL file URI.   (	SqlUri string `json:"sqlUri,omitempty"`   }       #// Represents a list of Spark jobs.   F// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object       type SparkJobList struct {   !	metav1.TypeMeta `json:",inline"`   "	metav1.ListMeta `json:"metadata"`   *	Items           []SparkJob `json:"items"`   }       const (   &	SparkJobResourceSingular = "SparkJob"   '	SparkJobResourcePlural   = "SparkJobs"   )5��