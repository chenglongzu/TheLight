using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BreakableRock : MonoBehaviour
{
    private BoxCollider _meshCollider;
    private MeshRenderer[] _meshRenderers;
    
    private void Start()
    {
        _meshCollider = GetComponent<BoxCollider>();
        _meshRenderers = GetComponentsInChildren<MeshRenderer>();
    }

    public void OnBroken()
    {
        _meshCollider.enabled = false;

        for (int i = 0; i < _meshRenderers.Length; i++)
        {
            _meshRenderers[i].gameObject.AddComponent<MeshCollider>().convex=true;
            _meshRenderers[i].gameObject.AddComponent<Rigidbody>().useGravity=true;
            //_meshRenderers[i].gameObject.layer = 0;
        }
    }
}
