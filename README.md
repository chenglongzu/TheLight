# The Light 开发文档
# [TheLight项目地址](https://github.com/chenglongzu/TheLight) 

# The Light资源管理
### 资源管理
资源管理使用Assetbundle管理，使用Assetbundle管理的好处就是节省内存资源，资源在没被使用时及时从内存中清除出去，避免性能浪费。
### 项目资源管理
#### Bundles 
项目中游戏里会用到的资源（游戏场景中的资源或是需要动态生成的资源）会放到Bundle文件夹里，这里的资源都是需要单独打包出来并且会在游戏运行时使用的，所以其他不会被使用到的资源可以放到一个新的文件夹比如“Arts”。
#### GameFramework 
开源的游戏客户端框架，存放开发中的常用类库和通用类。
#### Resources 
基本上不会用到，部分第三方插件可能会从中加载数据 
#### TheLight 
项目的编辑器扩展的部分会写在里面，菜单栏中多了一个TheLight选项是咱们自己扩展的。
#### ThirtParty 
第三方的插件；ConsolePro控制台插件，更方便的看日志；Demigiant代码动画补间插件；Sirenix编辑器扩展插件；Animancer第三方的动画控制系统，后面可能不会用，但一些部分相比传统Animator确实要好不少。

# The Light角色系统
### 角色配置
角色和相机是需要进行一些配置的，控制器面板还算详细，主要说一下配置环境，控制器面板上有个环境层的页面，EnvironmentLayerMask的下拉菜单，从中选一个Layer作为环境Layer，建议创建一个叫Environment的Layer。然后需要将所有场景物体设置成刚才选中的Layer，所以建议创建一个空物体将所有场景物体放到这个空物体下，将父物体设置成这个Layer，弹出框选择将所有子物体也设置成这个Layer。
### 相机配置
相机是脚本高度配置的，理论上来说相机的位置只有Z轴可以调。但是旋转值是可以在Transform组件上调整的，一般来说调成(0,360,0)，因为这样操作其他角色是往正方向运动的。首先将角色物体拖到脚本的FollowTarget的框中，相当于赋值了。Follow Offest是跟随角色的偏移值。Follow Weight其实是让相机跟随角色有个平滑的过渡，可以调着看看。

