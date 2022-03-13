using GameFramework;
using Sirenix.OdinInspector;
using TheLight.Editor.DataTableTools;
using UnityEditor;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace TheLight.Editor.EditorScripts
{
    [CreateAssetMenu(fileName = "ProjectSetting", menuName = "TheLightEditor/ProjectSetting", order = 1)]
    public class ProjectSetting : ScriptableObject
    {
        [BoxGroup("ProjectSetting")]
        [LabelText("从初始化场景运行")]
        public bool isRunByLaunchScene;
        
        [RuntimeInitializeOnLoadMethod] 
        static void Initialize()
        {
            if (SceneManager.GetActiveScene().name == "GameLauncher")
            {
                return;
            }
            SceneManager.LoadScene("GameLauncher");
        }
        
        [BoxGroup("AssetSetting")]
        [VerticalGroup("Common/Right")]
        [Button(ButtonSizes.Small)]
        [LabelText("编译表格")]
        public void UpdateResourceVersion()
        {
            foreach (string dataTableName in ProcedurePreload.DataTableNames)
            {
                DataTableProcessor dataTableProcessor = DataTableGenerator.CreateDataTableProcessor(dataTableName);
                if (!DataTableGenerator.CheckRawData(dataTableProcessor, dataTableName))
                {
                    Debug.LogError(Utility.Text.Format("Check raw data failure. DataTableName='{0}'", dataTableName));
                    break;
                }

                DataTableGenerator.GenerateDataFile(dataTableProcessor, dataTableName);
                DataTableGenerator.GenerateCodeFile(dataTableProcessor, dataTableName);
            }

            AssetDatabase.Refresh();
        }
    }
}