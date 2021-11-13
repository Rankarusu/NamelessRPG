class Player
{
    [string]$Name
    [int]$LVL = 1
    [int]$MaxHP = 20
    [int]$HP = 20
    [int]$MAXMP = 10
    [int]$MP = 10

    [int]$ATK = 5
    hidden [int]$ATKMOD = 0
    [int]$BaseATKMOD = 4
    [int]$DEF = 0

    hidden[int]$ACC = 0
    hidden[int]$BaseACC = 20
    hidden[int]$CRIT = 20
    hidden[int]$EXP = 0

    [array]$Spellbook= @()
    #[System.Collections.ArrayList]$Inventory =@()
    [hashtable]$inventory= @{}



    player($PName)
    {
        $this.name = $PName
    }

    calc()
    {
        $this.ATKMOD = get-random -minimum 1 -maximum ($this.BaseATKMOD +1)
        $this.ACC =    get-random -minimum 1 -maximum ($this.BaseACC +1)
    }

    PlayerAttack($cenemy)
    {
        $this.calc()
        IF ($this.ACC -eq $this.CRIT)
        {
            $PDMG=[math]::round(($this.ATK + $this.ATKMOD)*1.5)
            $cenemy.HP=$cenemy.HP-$PDMG
            Write-host " Critical hit!"$cenemy.name"took $PDMG Damage!" -foregroundcolor Cyan
        }
        ELSEIF ($this.ACC -lt $cenemy.DEF)
        {
            $cenemy.HP = $cenemy.HP

            write-host " You missed...?"
        }
        ELSE
        {
            $PDMG = $this.ATK + $this.ATKMOD - $cenemy.DEF
            $cenemy.HP = $cenemy.HP - $PDMG

            write-host " You attack the"$cenemy.name". You deal $PDMG Damage!"
        }
    }

    EXPCheck($cenemy) 
    {
        $this.EXP += $cenemy.EXPreward

        $nextlevel= [math]::round(([math]::POW($this.LVL,3)*4)/5)
        IF ($this.EXP -ge $nextlevel)
        {
            write-host " Congratulations! You leveled up! You feel stronger." -ForegroundColor Green
                $this.LVL++
                $this.MAXHP = $this.MAXHP+(get-random -min 1 -max 7)
                $this.HP = $this.MAXHP
                $this.MAXMP ++
                $this.MP = $this.MAXMP
                $this.ATK ++
                $this.DEF ++
                $this.EXP=0
        }
        ELSE
        {}
    }

    Flee($cenemy)
    {
        $this.calc()
        IF ($this.ACC -ge 15)
        {
            $cenemy.hp = 0
        }

        ELSE
        {
            write-host " You failed to escape!"
            $cenemy.Enemyattack($this)
        }
    }

    Magic($cenemy)
    {
        write-host ($this.Spellbook | Format-table | out-string)
        $cSpell = read-host " Please type in the ID of the spell you want to cast."
        IF($cSpell -lt $this.Spellbook.Count)
        {
            IF($this.MP -ge $this.spellbook[([int]$cspell)].MPCost)
            {
                cls
                $this.Spellbook[($cspell)].use($this, $cenemy) 
                $this.MP -= $this.spellbook[([int]$cspell)].MPCost
            }
            ELSE
            {
                cls
                write-host " You do not posess enough MP to cast this spell." -foregroundcolor yellow
                break
            }
        }
        ELSE 
        {
            cls
            write-host " Please select a valid spell." -foregroundcolor yellow
            break
        }   
    }


    Item($cenemy)
    {

        write-host ($this.Inventory.Values | Format-table | out-string)
        $cItem = read-host " Please type in the name of the item you want to use."
        IF ($this.inventory.Keys -contains $citem)
        {
            cls
            $this.inventory["$citem"].use($this, $cenemy)
            $this.inventory.remove("$citem")
        }
        ELSE
        {
            cls
            write-host " You can not use this item or misspelled it." -foregroundcolor yellow
            break
        }
    }

}


