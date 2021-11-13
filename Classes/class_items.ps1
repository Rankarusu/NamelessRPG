Class Item
{
    [int]$ID
    [string]$Name
    [string]$Description
    hidden[int]$HealValue
    hidden[int]$DMGValue

    Use($Player, $cenemy)
    {}
}

class Potion : Item
{
    [int]$ID = 1
    [string]$Name = "Potion"
    [string]$Description = "Heals 20 HP"
    hidden[int]$HealValue = 20

    Use($player, $cenemy)
    {
            $hptemp = $Player.HP
            $player.hp = [math]::min($player.hp + $this.healValue, $player.maxHp)
            write-host " You used a Potion. `n You feel refreshed. Recovered" ($Player.HP-$hptemp) "HP."
    }     
}