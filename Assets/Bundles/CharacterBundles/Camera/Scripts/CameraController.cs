using System;
using System.Collections;
using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;
using Random = UnityEngine.Random;

[ExecuteAlways]
public class CameraController : MonoBehaviour
{
    [Title("目标跟随")]
    [SerializeField] 
    private Transform followTarget;
    [SerializeField]
    private Vector2 followOffest=new Vector2(-3.4f,1);
    [SerializeField] 
    private int followWeight=5;
    [SerializeField]
    [ReadOnly]
    private Vector3 oriPostion;

    [Title("相机震动")]
    [SerializeField]
    private float shakeSpeed=0.05f;
    [SerializeField]
    private float shakeIndensity=0.1f;
    [SerializeField]
    private float shakeLength=0.3f;

    [SerializeField]
    [ReadOnly]
    private float shakeTime;

    [Title("规范范围")]
    [SerializeField] 
    private Vector3 clampMaxScale;
    [SerializeField] 
    private Vector3 clampMinScale;

    void Start()
    {
        //GameEntry.Event.Subscribe(ShakeCameraEventArgs.EventId,ShakeCamera);
    }

    void Update()
    {
        if (shakeTime>0)
        {
            return;
        }
        
        transform.position = Vector3.Lerp(transform.position,new Vector3(followTarget.position.x+followOffest.x, followTarget.position.y+followOffest.y, transform.position.z),Time.deltaTime*followWeight);
        transform.position = new Vector3(Mathf.Clamp(transform.position.x, clampMinScale.x, clampMaxScale.x),
            Mathf.Clamp(transform.position.y, clampMinScale.y, clampMaxScale.y),
            Mathf.Clamp(transform.position.z, clampMinScale.z, clampMaxScale.z));
    }
}