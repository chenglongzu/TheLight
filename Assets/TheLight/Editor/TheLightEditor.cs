using UnityEditor;
using Sirenix.OdinInspector.Editor;
using Sirenix.Utilities;
using Sirenix.Utilities.Editor;


public class TheLightEditor : OdinMenuEditorWindow
{
    [MenuItem("The Light/LightEditor")]
    private static void OpenWindow()
    {
        var window = GetWindow<TheLightEditor>();
        window.position = GUIHelper.GetEditorWindowRect().AlignCenter(1000, 700);
    }
    
    protected override OdinMenuTree BuildMenuTree()
    {
        var tree = new OdinMenuTree(true);
        
        //项目信息
        tree.AddAssetAtPath("AboutProject", "TheLight/Editor/EditorAsset/AboutProject.asset").AddIcon(EditorIcons.Airplane);
        //项目设置
        tree.AddAssetAtPath("ProjectSetting", "TheLight/Editor/EditorAsset/ProjectSetting.asset").AddIcon(EditorIcons.AlertCircle);
        return tree;
    }


}
