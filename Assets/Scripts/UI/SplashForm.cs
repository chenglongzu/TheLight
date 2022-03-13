using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using TheLight;
using UnityEngine;
using UnityEngine.UI;

public class SplashForm : UiForm
{
    private Text _title;
    
    protected override void OnOpen(object userData)
    {
        base.OnOpen(userData);
        
        _title = transform.GetComponentInChildren<Text>();
        _title.color = new Color(0, 0, 0, 0);
        _title.transform.localScale=new Vector3(0.3f,0.3f,0.3f);
        
        _title.DOColor(new Color(0,0,0,1), 1);
        _title.transform.DOScale(Vector3.one, 1);
        
        Invoke("DelayToFade",2);
    }

    protected override void OnClose(bool isShutdown, object userData)
    {
        base.OnClose(isShutdown, userData);
    }
    
    private void DelayToFade()
    {
        _title.DOColor(new Color(0,0,0,0), 1).OnComplete(() =>
        {
            Close();
        });
    }
}
