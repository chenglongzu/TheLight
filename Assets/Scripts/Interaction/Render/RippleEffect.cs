using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

public class RippleEffect : MonoBehaviour
{
    void Start()
    {
        StartCoroutine(DelayToFade());
    }

    private IEnumerator DelayToFade()
    {
        yield return new WaitForSeconds(3f);
        transform.DOScale(Vector3.zero,1).OnComplete(() =>
        {
            Destroy(gameObject);
        });
    }
}
