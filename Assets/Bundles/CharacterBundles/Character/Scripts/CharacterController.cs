using System;
using System.Collections;
using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;


public enum GroundLayer 
{ 
    NormalGround,
    WaterGround,
    GrassGround,
}

public class CharacterController : MonoBehaviour
{
    [ReadOnly]
    [SerializeField]
    [Title("常规输入")]
    private bool isNormalInput;
    
    [Space(10)]
    [SerializeField] 
    [MinValue(0)]
    [Title("移动值")]
    private float moveSpeed=7;
    [SerializeField]
    [MinValue(0)]
    private float airMoveSpeed=5;

    [SerializeField]
    [ReadOnly]
    public bool isForward;
    [SerializeField] 
    [ReadOnly]
    private Vector2 moveDir;
    [SerializeField] 
    [ReadOnly]
    private Vector2 tempSprintMoveDir;  //临时冲刺方向
    [SerializeField]
    [ReadOnly]
    private float moveTime;
    
    [SerializeField] 
    [Title("冲刺值")]
    [MinValue(0)]
    private float sprintSpeed=20;
    [SerializeField]
    [MinValue(0)]
    private float sprintDistance=4;
    [SerializeField]
    [ReadOnly]
    private float sprintPower;
    [SerializeField]
    [ReadOnly]
    private bool isOnSprint;    //冲刺状态

    [SerializeField]
    [MinValue(0)]
    private float sprintCoolingTime=2;
    [SerializeField]
    [ReadOnly]
    private float currSprintCoolingTime;

    [SerializeField] 
    [Title("反弹值")]
    [MinValue(0)]
    private float bounceDistance=2;
    [SerializeField] 
    [ReadOnly]
    private float bouncePower;
    [SerializeField]
    [ReadOnly]
    private bool isOnBounce;
    [SerializeField] 
    [ReadOnly] 
    private bool isOnHit;
    
    [Space(10)] 
    [Title("跳跃值")]
    [SerializeField] 
    private bool doubleJump;
    [SerializeField] 
    private float doubleJumpStrength;
    [SerializeField]
    [ReadOnly]
    private int jumpValue;
    [SerializeField]
    [MinValue(0)]
    private float jumpSpeed=10;
    [SerializeField]
    [MinValue(0)]
    private float nearJumpDistance = 2;
    [SerializeField]
    [MinValue(0)]
    private float farJumpDistance = 3;

    [SerializeField] 
    [Title("重力值")]
    [MinValue(0)]
    private float gravityValue=1;
    [SerializeField] 
    [ReadOnly]
    private bool isOnGround;
    [SerializeField]
    [ReadOnly]
    private bool isOnDown;      //主动下降状态
    [SerializeField]
    [ReadOnly]
    private float downTime;     //下降时间
    
    [Space(10)]
    [ReadOnly]
    [SerializeField]
    [Title("角色状态")]
    private CharacterState _characterState;
    
    [Space(10)]  
    [Title("碰撞检测")]
    [SerializeField] 
    private Vector3 collisionDetectionPostion;
    [SerializeField] 
    private Vector3 collisionDetectionScale;
    [Title("地面检测")]
    [SerializeField] 
    private Vector3 groundDetectionPostion;
    [SerializeField] 
    private float groundDetectionScale;

    [SerializeField] 
    [Title("环境层")]
    private LayerMask environmentLayerMask;
    [ReadOnly]
    public GroundLayer groundLayer;

    [Space(10)]
    [Title("角色视效")]
    public bool isOnRunRippleEffect;
    [Required]
    [AssetsOnly]
    [EnableIf("isOnRunRippleEffect")]
    public GameObject runRippleEffect;
    [EnableIf("isOnRunRippleEffect")]
    public Vector3 runRippleEffectPosion;
    [EnableIf("isOnRunRippleEffect")]
    public Vector3 runRippleEffectRotation;
    [Space(10)]
    public bool isOnSprintButterflyEffect;
    [Required]
    [AssetsOnly]
    [EnableIf("isOnSprintButterflyEffect")]
    public GameObject sprintButterflyEffect;
    [EnableIf("isOnSprintButterflyEffect")]
    public Vector3 sprintButterflyEffectPosion;
    [EnableIf("isOnSprintButterflyEffect")]
    public Vector3 sprintButterflyEffectRotation;
    [Space(10)]
    public bool isOnjumpSmokeEffect;
    [Required]
    [AssetsOnly]
    [EnableIf("isOnjumpSmokeEffect")]
    public GameObject jumpSmokeEffect;
    [EnableIf("isOnjumpSmokeEffect")]
    public Vector3 jumpSmokeEffectPosion;
    [EnableIf("isOnjumpSmokeEffect")]
    public Vector3 jumpSmokeEffectRotation;
    [Space(10)]
    public bool isOnSprintSmokeEffect;
    [Required]
    [AssetsOnly]
    [EnableIf("isOnSprintSmokeEffect")]
    public GameObject sprintSmokeEffect;
    [EnableIf("isOnSprintSmokeEffect")]
    public Vector3 sprintSmokeEffectPosion;
    [EnableIf("isOnSprintSmokeEffect")]
    public Vector3 sprintSmokeEffectRotation;

    /*
    [Space(10)]
    [Header("角色音效")]
    public bool isOnJumpUpAudioEffect;
    public AudioClip jumpUpAudioClip;
    [Space(10)]
    public bool isOnJumpDownAudioEffect;
    public AudioClip jumpDownAudioClip;
    [Space(10)]
    public bool isOnSprintAudioEffect;
    public AudioClip sprintAudioClip;
    [Space(10)]
    public bool isOnGroundAudioEffect;
    public AudioClip groundAudioClip;
    [Space(10)]
    public bool isOnWaterAudioEffect;
    public AudioClip waterAudioClip;
    [Space(10)]
    public bool isOnGrassAudioEffect;
    public AudioClip grassAudioClip;
    */

    [Title("引用")]
    [Space(10)]
    [SerializeField]
    [Required]
    [SceneObjectsOnly]
    public GameObject cloakObject;

    private UnityEngine.CharacterController _characterController;
    private CharacterMovementController _characterMovementController;
    private CharacterAnimatorController _characterAnimatorController;
    private CharacterEffectController _characterEffectController;
    

    void Start()
    {
        moveDir.y = -gravityValue;

        _characterState = CharacterState.Normal;
        
        _characterAnimatorController = new CharacterAnimatorController(transform);
        _characterMovementController = new CharacterMovementController(transform);
        _characterEffectController = new CharacterEffectController(transform);
        
        _characterController = GetComponent<UnityEngine.CharacterController>();
    }

    #region InputManager Listener

    private void NormalController()
    {
        if (Input.GetKeyDown(KeyCode.LeftShift))
        {
            OnCharacterSprint();
        }

        if (Input.GetKeyDown(KeyCode.Space))
        {
            OnCharacterJump(true);
        }
        if (Input.GetKeyUp(KeyCode.Space))
        {
            OnCharacterJump(false);
        }

        OnCharacterMove(new Vector2(-Input.GetAxis("Horizontal"),0));

    }
    private void OnCharacterSprint()
    {
        if (currSprintCoolingTime>0)
        {
            return;
        }
        OnSprintStart();
    }
    
    private void OnCharacterJump(bool isKeyDown)
    {
        if (isKeyDown)
        {
            if (doubleJump && jumpValue<2)
            {
                isOnDown = false;
                JumpStart();
            }
            else if (isOnGround)
            {
                isOnDown = false;
                JumpStart();
            }
        }
        else
        {
            if (_characterState != CharacterState.Jump)
            {
                return;
            }

            isOnDown = true;
        }
    }
    

    private void OnCharacterMove(Vector2 currMoveDir)
    {
        if (isOnSprint)
        {
            return;
        }

        if (currMoveDir.x==0)
        {
            moveTime = 0;
        }
        
        moveDir.x = -currMoveDir.x;
        _characterMovementController.Turn(-moveDir.x);

    }
    
    #endregion

    
    void Update()
    {
        if (isNormalInput)
        {
            NormalController();
        }
        Move();
    }

    public void Move()
    {
        isOnGround = IsOnGround();
        isOnHit = IsOnHit();
        
        //跳跃状态
        if (_characterState==CharacterState.Jump)
        {
            moveDir.y -= Time.deltaTime*jumpSpeed;
            
            //提前下降状态
            if (isOnDown && moveDir.y<=(farJumpDistance-nearJumpDistance) && jumpValue==1)
            {
                JumpDown();
            }
            
            //极值下降状态
            if (moveDir.y<=0)
            {
                JumpDown();
            }
        }
        //下降状态
        else
        {
            //普通下降
            moveDir.y -= Time.deltaTime*jumpSpeed;
            
            if (moveDir.y<=-gravityValue)
            {
                moveDir.y = -gravityValue;
            }

            if (!isOnGround)
            {
                downTime +=Time.deltaTime;
            }
            
            //落地状态
            if (isOnGround && _characterState == CharacterState.Down)
            {
                JumpOver();
            }
            
            //被动下降状态
            if (!isOnGround && _characterState!=CharacterState.Down && _characterController.velocity.y<0 && downTime>0.3f)
            {
                JumpDown();
            }
        }

        if (currSprintCoolingTime>0)
        {
            currSprintCoolingTime -= Time.deltaTime;
        }
        
        //冲刺状态
        if (isOnSprint)
        {
            sprintPower += Time.deltaTime*sprintSpeed;

            moveDir.x = transform.localRotation.w < 0 ? -sprintPower : sprintPower;
            
            if (sprintPower>=sprintDistance||isOnHit)
            {
                OnSprintOver();
            }
        }

        //反弹状态
        if (isOnBounce)
        {
            bouncePower += Time.deltaTime*sprintSpeed;

            if (bouncePower>=0)
            {
                bouncePower = 0;
                isOnBounce = false;
            }
            
            moveDir.x = transform.localRotation.w < 0 ? -bouncePower : bouncePower;
        }
        
        if (moveDir.x!=0)
        {
            moveTime += Time.deltaTime;
        }

        _characterMovementController.Move(new Vector2((moveDir.x* (isOnGround? moveSpeed: airMoveSpeed))*(isOnHit?0.7f:1), moveDir.y)*Time.deltaTime);

        _characterAnimatorController.Move(moveDir,isOnGround);
    }

    #region JumpFunction 跳跃
    private void JumpStart()
    {
        jumpValue++;

        if (jumpValue == 1)
        {
            moveDir.y = farJumpDistance;
        }
        else
        {
            moveDir.y = farJumpDistance-doubleJumpStrength;
        }
        
        _characterState = CharacterState.Jump;
        _characterAnimatorController.JumpUp();

        _characterEffectController.JumpStart();
    }
    
    private void JumpDown()
    {
        moveDir.y = 0;
        downTime = 0;
        
        _characterState = CharacterState.Down;
        _characterAnimatorController.JumpDown();
    }

    private void JumpOver()
    {
        jumpValue=0;

        _characterState = CharacterState.Normal;
        
        moveDir.y = -gravityValue;

        if (downTime<0.5f)
        {
            _characterAnimatorController.JumpLand();
        }
        else
        {
            _characterAnimatorController.JumpOver();
        }

        _characterEffectController.JumpOver();
                        
        CreatRippleEffect();
    }
    #endregion

    #region SprintFunction 冲刺
    private void OnSprintStart()
    {
        currSprintCoolingTime = sprintCoolingTime;
        isOnSprint=true;
        tempSprintMoveDir = moveDir;

        cloakObject.gameObject.SetActive(false);
        
        _characterMovementController.SprintStart();
        _characterAnimatorController.SprintStart();
        _characterEffectController.SprintStart();
    }

    private void OnSprintOver()
    {
        if (isOnHit)
        {
            isOnBounce = true;
            bouncePower = -bounceDistance;
        }

        moveDir=tempSprintMoveDir;
        isOnSprint = false;
        sprintPower = 0;

        cloakObject.gameObject.SetActive(true);

        _characterMovementController.SprintOver();
        _characterEffectController.SprintOver();
        _characterAnimatorController.SprintOver();
    }
    #endregion

    public void OnStampGround()
    {
        CreatRippleEffect();
    }

    private void CreatRippleEffect()
    {
        if (isOnGround)
        {
            _characterEffectController.CreatRippleEffect();
        }
    }
    
    private bool IsOnGround()
    {
        Collider[] cols = Physics.OverlapSphere(transform.position+groundDetectionPostion, groundDetectionScale, environmentLayerMask);
        
        if(cols.Length >0)
        {
            for (int i = 0; i < cols.Length; i++)
            {
                if (cols[i].gameObject.tag == "WaterGround")
                {
                    groundLayer = GroundLayer.WaterGround;
                    return true;
                }

                if (cols[i].gameObject.tag == "GrassGround")
                {
                    groundLayer = GroundLayer.GrassGround;
                    return true;
                }
            }


            groundLayer = GroundLayer.NormalGround;
            return true;
        }
        else
        {
            groundLayer = GroundLayer.NormalGround;
            return false;
        }
    }

    private bool IsOnHit()
    {
        Collider[] cols = Physics.OverlapBox(
            new Vector3(transform.position.x + (isForward ? collisionDetectionPostion.x : -collisionDetectionPostion.x), transform.position.y+collisionDetectionPostion.y, transform.position.z),
            collisionDetectionScale,Quaternion.identity, environmentLayerMask);
        if(cols.Length >0)
        {
            return true;
        }
        else
        {
            return false;
        }
        
    }

    private void OnDrawGizmos()
    {
        Gizmos.color=Color.red;
        Gizmos.DrawWireSphere(transform.position+groundDetectionPostion, groundDetectionScale);
        Gizmos.DrawWireCube(new Vector3(transform.position.x + (isForward ? collisionDetectionPostion.x : -collisionDetectionPostion.x), transform.position.y + collisionDetectionPostion.y, transform.position.z), collisionDetectionScale);
    }
}
