/// Variables

///Keys
kLeft        = false;
kRight       = false;
kUp          = false;
kDown        = false;

kJump        = false;
kJumpRelease = false;

kAction      = false;
kActionHeld  = false;
kActionRel   = false;
    
kBlock       = false;
kRollL       = false;
kRollR       = false;


//Damage
contactDamage = 1;

//Hitpoints
hp = hpMax;
canBeHit = true;


// Inherit Entity
entityVariables();
RIGHT = 1;
LEFT = -1;
facingPrev = 0;
facing = image_xscale;

canMove = true;
turnAtLedge = false;
hasTurned = false;

// Movement ///////////////////////////////////////////////////////////////////
//m = 0.2;

groundAccel = 1.00 * m;
groundFric  = 2.00 * m;
airAccel    = 0.75 * m;
airFric     = 0.1 * m;
vxMax       = 5.50 * m;
vyMax       = 9.0 * m;
jumpHeight  = 9.00 * m;
gravNorm    = 0.66 * m;
gravRise    = 0.5 * m;
gravFall    = 0.3 * m;
gravSlide   = 0.08 * m; 

clingTime   = 4;

// Misc ///////////////////////////////////////////////////////////////////////

// States
STAND           = 10;
RUN             = 11;
JUMP            = 12;
actionState     = STAND;

idle            = "idle";
walking         = "walking";
jumping         = "jumping";
turning         = "turning";
attacking1      = "attacking1";
attacking2      = "attacking2";
attacking3      = "attacking3";
attacking4      = "attacking4";
shoot1          = "shoot1";
shoot2          = "shoot2";
shoot3          = "shoot3";
shoot4          = "shoot4";
trans1          = "trans1";
trans2          = "trans2";
trans3          = "trans3";
trans4          = "trans4";
isHit           = "isHit";

state           = idle;
nState          = true;
animStateSwitch = false;

// Initialize properties
facing = image_xscale; // Change xscale in editor to adjust initial facing

// For squash + stretch
xscale = 1;
yscale = 1;
slantAngle = 0;

//Detection
hSight          = 0;
vSight          = 0;
closeQuarters   = 0;
foundHim        = false;
isClose         = false;

//For Making Relative Objects
creationID  = 0;
creatorID   = 0;

//Special Attack Masks
attMask1 = -1;
attMask2 = -1;
attMask3 = -1;
attMask4 = -1;

//Chance of Droping Stuff on Death
baseValue = 85;

//Generic Timer
coolDownTimer       = 0;
coolDownTimerMax    = 1;


///////////////////////////////////////////////////////////////////////////////


