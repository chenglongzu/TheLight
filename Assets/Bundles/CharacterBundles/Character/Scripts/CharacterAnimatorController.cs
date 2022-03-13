using UnityEngine;

public class CharacterAnimatorController
{
    private Transform _characterTransform;
    private Animator _characterAnimator;

    private float startJumpTime;
    
    public CharacterAnimatorController(Transform characterTransform)
    {
        this._characterTransform = characterTransform;

        _characterAnimator = _characterTransform.GetComponent<Animator>();
    }

    public void Move(Vector2 moveDir,bool isOnGround)
    {
        _characterAnimator.SetFloat("Move",moveDir.x);
        _characterAnimator.SetBool("IsOnGround",isOnGround);
    }

    public void JumpUp()
    {
        _characterAnimator.SetTrigger("JumpUp");    

        startJumpTime = Time.time;
    }
    
    public void JumpDown()
    {
        _characterAnimator.SetTrigger("JumpDown");    
    }

    public void JumpLand()
    {
        _characterAnimator.SetTrigger("JumpLand");    
    }
    
    public void JumpOver()
    {
        _characterAnimator.SetTrigger("JumpOver");    
    }

    public void SprintStart()
    {
        //_characterAnimator.SetTrigger("Sprint");    
    }

    public void SprintOver()
    {
        
    }
}