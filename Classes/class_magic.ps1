Class Magic
{
    [string]$ID
    [string]$Name
    [string]$Type
    [string]$Description
    hidden[Int]$HealValue 
    hidden[int]$DMGValue
    [int]$MPCost

    Magic($ID)
    {
        $this.ID = $ID
    }

    Use([Player]$Player,$cenemy)
    {}

}

Class Heal : Magic
{
    [string]$Name = "Heal"
    [string]$Type = "Healing"
    [string]$Description = "Heals 20 HP"
    hidden[Int]$HealValue = 20
    [int]$MPCost = 5

    Heal($id) : base ($ID)
    {}

    Use([Player]$Player, $cEnemy)
    {
      $hptemp = $Player.HP
      $player.hp = [math]::min($player.hp + $this.healValue, $player.maxHp)
      write-host " You used Lesser Heal.`n You feel refreshed. Recovered" ($Player.HP-$hptemp) "HP."
    }
}

Class Sparks : Magic
{
    [string]$Name = "Sparks"
    [string]$Type = "Offense"
    [string]$Description = "Deals 10 Damage."
    hidden[int]$DMGValue = "10"
    [int]$MPCost = 5

    Sparks($id) : base ($ID)
    {}

    [bool]Use([Player]$Player, $Cenemy)
    {
        $Cenemy.HP -= 10
        $player.MP -= 5
        write-host " Your hands start to feel hot and sparks start to erupt from your palms. `n You deal" $this.DMGValue "Damage to the" $cenemy.name.
        return $true
    }
}