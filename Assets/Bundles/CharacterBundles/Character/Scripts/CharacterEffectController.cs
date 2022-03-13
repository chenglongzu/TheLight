using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterEffectController
{    
    private Transform _characterTransform;
    private CharacterController _characterController;

    private Shader _XRayShader;
    
    public CharacterEffectController() { }
    public CharacterEffectController(Transform characterTransform)
    {
        this._characterTransform = characterTransform;
        
        _characterController = characterTransform.GetComponent<CharacterController>();

        _XRayShader = Shader.Find("TheLight/X_Ray");
    }
    
    private float lastTime = 0;
    private Vector3 lastPos = Vector3.zero;

    public void SprintStart()
    {
        if (_characterController.isOnSprintButterflyEffect)
        {
            //蝴蝶特效
            GameObject.Instantiate(_characterController.sprintButterflyEffect, _characterTransform.position + _characterController.sprintButterflyEffectPosion, Quaternion.identity, _characterTransform);
        }
    }

    public void SprintOver()
    {
        if (_characterController.isOnSprintSmokeEffect)
        {
            //冲刺烟雾
            GameObject.Instantiate(_characterController.sprintSmokeEffect, _characterTransform.position + _characterController.sprintSmokeEffectPosion, _characterController.isForward ? Quaternion.Euler(new Vector3(_characterController.sprintSmokeEffectRotation.x, -_characterController.sprintSmokeEffectRotation.y, _characterController.sprintSmokeEffectRotation.z)) : Quaternion.Euler(_characterController.sprintSmokeEffectRotation));
        }
    }


    public void JumpStart()
    {
        if (_characterController.isOnjumpSmokeEffect)
        {
            //起跳烟雾
            GameObject.Instantiate(_characterController.jumpSmokeEffect, _characterTransform.position + _characterController.jumpSmokeEffectPosion, Quaternion.Euler(_characterController.jumpSmokeEffectRotation));
        }
    }

    public void JumpOver()
    {
        if (_characterController.isOnjumpSmokeEffect)
        {
            //落地烟雾
            GameObject.Instantiate(_characterController.jumpSmokeEffect, _characterTransform.position + _characterController.jumpSmokeEffectPosion, Quaternion.Euler(_characterController.jumpSmokeEffectRotation));
        }
    }


    public void CreatRippleEffect()
    {
        if (_characterController.isOnRunRippleEffect && _characterController.groundLayer==GroundLayer.WaterGround)
        {
            //水波特效
            GameObject.Instantiate(_characterController.runRippleEffect, _characterTransform.position, Quaternion.Euler(_characterController.runRippleEffectRotation));
        }
    }

}