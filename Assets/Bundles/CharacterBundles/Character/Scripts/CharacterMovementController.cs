using UnityEngine;

public class CharacterMovementController
{
    private Transform _characterTransform;
    private CharacterController _characterController;

    private UnityEngine.CharacterController _unityCharacterController;

    private SkinnedMeshRenderer[] _meshRenderers;

    private float targetRotationY=90;
    private float currtenRotationY=90;
    
    public CharacterMovementController() { }

    public CharacterMovementController(Transform characterTransform)
    {
        this._characterTransform = characterTransform;
        
        _characterController = _characterTransform.GetComponent<CharacterController>();
        _unityCharacterController = _characterTransform.GetComponent<UnityEngine.CharacterController>();

        _meshRenderers = this._characterTransform.GetComponentsInChildren<SkinnedMeshRenderer>();

        _characterController.isForward = true;
    }

    public void Move(Vector2 moveDir)
    {
        if (currtenRotationY>targetRotationY)
        {
            currtenRotationY -= Time.deltaTime*500;
            
            if (currtenRotationY -targetRotationY<=1)
            {
                _characterController.isForward = true;
                currtenRotationY = targetRotationY;
            }
        }
        else if (currtenRotationY<targetRotationY)
        {
            currtenRotationY += Time.deltaTime*500;

            if (targetRotationY-currtenRotationY <=1)
            {
                _characterController.isForward = false;
                currtenRotationY = targetRotationY;
            }
        }
        
        _characterTransform.eulerAngles = new Vector3(0, currtenRotationY, 0);
        _unityCharacterController.Move(new Vector3(moveDir.x,moveDir.y,-_characterTransform.position.z));
    }

    public void Turn(float x_Axis)
    {
        if (x_Axis > 0.1f && _characterTransform.localRotation.w>0)
        {
            targetRotationY = 270;
        }
        else if (x_Axis < -0.1f && _characterTransform.localRotation.w<0)
        {
            targetRotationY = 90;
        }
    }

    public void SprintStart()
    {
        for (int i = 0; i < _meshRenderers.Length; i++)
        {
            _meshRenderers[i].enabled = false;
        }
    }

    public void SprintOver()
    {
        for (int i = 0; i < _meshRenderers.Length; i++)
        {
            _meshRenderers[i].enabled = true;
        }
    }
}