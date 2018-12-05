Control = {}
local this = Control
local GameObject = UnityEngine.GameObject
local Transform=UnityEngine.Transform
local Resources=UnityEngine.Resources
local Input = UnityEngine.Input
local Rigidbody = UnityEngine.Rigidbody
local shell
local rigid
local shellSpeed
local base--炮台
local Barrel --炮管
local Muzzle--炮口

function this.Start(obj)
    base = obj
    --shell =obj1
    Muzzle = GameObject.Find('Muzzle')
print(Muzzle)
    --Barre1=GameObject.Find('Barre1')

    --shell=Resources.Load('shell').gameObject
    --print(shell)
    --shell : AddComponent(typeof(Rigidbody))
    --rigid = shell : GetComponent('Rigidbody')
    Barrel = Muzzle.transform.parent.gameObject

    shellSpeed=100
end
function this.Update()
    local h = Input.GetAxis("Horizontal")
    if h ~= 0 then
        base.transform:RotateAround(base.transform.position, Vector3.up, 360 * h * UnityEngine.Time.deltaTime)
        Barrel.transform:RotateAround(base.transform.position,Vector3.up, 360 * h *UnityEngine.Time.deltaTime)

    end

    if Input.GetButtonDown("Fire1") then
        	--local shellinst = GameObject.Instantiate(shell, Muzzle.transform.position, Muzzle.transform.rotation, nil)
        	--shellinst.AddForce(shellinst.transform.forward * shellSpeed + shellinst.transform.up * shellSpeed);
        	--GameObject.Destroy(shellinst.gameObject, 2);
    end

end