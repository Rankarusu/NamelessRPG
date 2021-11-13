Class Enemy
{
    [int]$ID 
    [string]$Name
    [int]   $HP
    [int]   $ATK
    hidden[int]   $ATKMOD
    [int]   $BaseATKMOD
    [int]   $DEF
    hidden[int]   $ACC
    hidden[int]   $baseACC
    hidden[int]   $CRIT
    hidden[int]   $EXPreward

     enemy($ID ,$name, $hp, $atk, $atkmod, $baseatkmod, $def, $acc, $baseacc, $crit, $expreward)
    {
        $this.ID =          $ID
        $this.Name =        $name  
        $this.HP =          $hp
        $this.ATK =         $atk
        $this.ATKMOD =      $atkmod
        $this.BaseATKMOD =  $baseatkmod
        $this.DEF =         $def
        $this.ACC =         $acc
        $this.BaseACC =     $baseacc
        $this.CRIT =        $crit
        $this.EXPreward =   $expreward
    }

    enemy()
    {}
    
    calc()
    {
        $this.ATKMOD = get-random -minimum 1 -maximum ($this.BaseATKMOD +1)
        $this.ACC =    get-random -minimum 1 -maximum ($this.BaseACC +1)
    }
    
    [string]react()
    {
        $enemyreactions= "looks at you menacingly.", "tilts his head slightly to the left.", "stares towards the sky.", "looks on the ground as if it's seen something.", "hops around playfully.", "laughs at you.", "smiles mischieveaously.", "screeches autistically", "stares at you with murderous intent", "loafs around", "is chanting something.", "growls at you."
        $enemyreaction= get-random -inputobject $enemyreactions
       return "The $($this.name) $enemyreaction"           
    }

    EnemyAttack($Player)
    {
        $this.calc()
        IF ($this.ACC -eq $this.CRIT)
            {
                $EDMG=[math]::round(($this.ATK + $this.ATKMOD)*1.5)
                $Player.HP= $Player.HP - $EDMG

                write-host ""$this.name "attacks!"
                Write-host " Critical hit! You took $EDMG Damage!" -foregroundcolor red
            }

        ELSEIF ($this.ACC -lt $Player.DEF)
            {
                $Player.HP = $Player.HP

                write-host ""$this.name"'s attack missed!"
            }

        ELSE
            {
                $EDMG = $this.ATK + $this.ATKMOD - $Player.DEF
                $Player.HP= $Player.HP - $EDMG

                write-host ""$this.name "attacks! You take $EDMG damage."
            }
    }

    

}



Class Slime : Enemy
{
    [int]$ID = 1
    [string]$Name = "Slime"
    [int]   $HP = 20
    [int]   $ATK = 5
    hidden[int]   $ATKMOD = 0
    [int]   $BaseATKMOD = 4
    [int]   $DEF = 0
    hidden[int]   $ACC = 0
    hidden[int]   $baseACC = 20
    hidden[int]   $CRIT = 21
    hidden[int]   $EXPreward = 2
}

Class Shroom : Enemy
{
    [int]$ID = 2
    [string]$Name = "Shroom"
    [int]   $HP = 18
    [int]   $ATK = 6
    hidden[int]   $ATKMOD = 0
    [int]   $BaseATKMOD = 4
    [int]   $DEF = 2
    hidden[int]   $ACC = 0
    hidden[int]   $baseACC = 20
    hidden[int]   $CRIT = 20
    hidden[int]   $EXPreward = 2
}


Class Imp : Enemy
{
    [int]$ID = 3
    [string]$Name = "Imp"
    [int]   $HP = 12
    [int]   $ATK = 8
    hidden[int]   $ATKMOD = 0
    [int]   $BaseATKMOD = 4
    [int]   $DEF = 1
    hidden[int]   $ACC = 0
    hidden[int]   $baseACC = 20
    hidden[int]   $CRIT = 20
    hidden[int]   $EXPreward = 3
}

Class Goblin : Enemy
{
    [int]$ID = 4
    [string]$Name = "Goblin"
    [int]   $HP = 15
    [int]   $ATK = 8
    hidden[int]   $ATKMOD = 0
    [int]   $BaseATKMOD = 4
    [int]   $DEF = 2
    hidden[int]   $ACC = 0
    hidden[int]   $baseACC = 20
    hidden[int]   $CRIT = 18
    hidden[int]   $EXPreward = 4
}




#MOBS###########################Name        HP ATK AMOD BAMOD DEF ACC BACC CRIT  EXP###########################
$Mobs= @()
#$Mobs += $Slime=   [enemy]::new("Slime"  , 20, 5, (0),   4,   0, (0), 20,  21,  2) 
#$Mobs += $Shroom = [enemy]::new("Shroom" , 18, 6, (0),   4,   2, (0), 20,  20,  2) 
#$Mobs += $Imp =    [enemy]::new("Imp"    , 12, 8, (0),   4,   1, (0), 20,  20,  3)
#$Mobs += $Goblin=  [enemy]::new("Goblin" , 15, 8, (0),   4,   2, (0), 20,  18,  4) 


$Mobs += $Slime =  [Slime]::new()
$Mobs += $Shroom = [Shroom]::new()
$Mobs += $Imp =    [Imp]::new()
$Mobs += $Goblin = [Goblin]::new()


Function Refreshenemy
{
    $Slime =  [Slime]::new()
    $Shroom = [Shroom]::new()
    $Imp =    [Imp]::new()
    $Goblin = [Goblin]::new()
}