using System;
using Sirenix.OdinInspector;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace TheLight.Editor.EditorScripts
{
    [CreateAssetMenu(fileName = "AboutProject", menuName = "TheLightEditor/AboutProject", order = 0)]
    public class AboutProject : ScriptableObject
    {
        [BoxGroup("AboutProject")]
        [HorizontalGroup("AboutProject/Split", 80)]
        [VerticalGroup("AboutProject/Split/Left")]
        [HideLabel, PreviewField(80, ObjectFieldAlignment.Center)]
        public Texture Icon;

        [HorizontalGroup("AboutProject/Split", LabelWidth = 70)]
        [VerticalGroup("AboutProject/Split/Right")]
        [DisplayAsString]
        [LabelText("项目代号")]
        public string Name = "TheLight";

        [VerticalGroup("AboutProject/Split/Right")]
        [DisplayAsString]
        [LabelText("项目版本")]
        public string Version = "1.1";

        [VerticalGroup("AboutProject/Split/Right")]
        [DisplayAsString]
        [LabelText("项目作者")]
        public string Author = "概念：陈煜恒  策划：陆周凯  美术：宋飞翔 陈蓉蓉  程序：祖成龙";

        [VerticalGroup("AboutProject/Split/Right")]
        [DisplayAsString]
        [LabelText("项目地址")]
        public string Address = "https://github.com/chenglongzu/TheLight";
        
        
        [BoxGroup("DateRecord")]
        [TableList(ShowIndexLabels = true, AlwaysExpanded = true)]
        [HideLabel]
        public ModifiyDate[] data;

        //必须加上可序列化标记
        [Serializable]
        public class ModifiyDate
        {
            [TableColumnWidth(200, Resizable = false)]
            public string Data;

            public string Content;
        }
    }
}
