class GM
{
    [string]$soos = "saas"
    Battle ($Player, $mobs)
    {
Refreshenemy
$cenemy = $mobs | get-random
cls


write-host " -------------------------------------------------"
write-host ""$cenemy.name"appeared!" -foregroundcolor yellow
write-host " -------------------------------------------------"
write-host " What are you gonna do?"                      
write-host " -------------------------------------------------"
write-host "|       HP:"$Player.HP"/"$Player.MAXHP"     |      MP:"$Player.MP"/"$Player.MAXMP"      |"           
write-host "-------------------------------------------------"
write-host "|        [A] - Attack           [I] - Item        |"
write-host "|        [M] - Magic            [F] - Flee        |"
write-host " -------------------------------------------------" 
write-host "                                                  "
            $move=read-host "Type in the corresponding starting letter for the command you want to use"


while($Player.HP -gt 0 -and $cenemy.HP -gt 0)
    {

    switch ($move)
    {
        {$_ -eq "a"} #attack         
             {
                 cls
                 write-host " -------------------------------------------------" 
                 $Player.PlayerAttack($cenemy)
                 write-host ""
                 IF ($cenemy.HP -gt 0)
                 {
                     start-sleep 1
                     $cenemy.Enemyattack($Player)
                 }
                 ELSE
                 {} 
             }


        {$_ -eq "m"} #magic
             {
                 cls
                 write-host " -------------------------------------------------" 
                 $Player.Magic($cenemy)
                 write-host ""
                 IF ($cenemy.HP -gt 0)
                 {
                     start-sleep 1
                     $cenemy.Enemyattack($Player)
                 }
                 ELSE
                 {}             
             }

        {$_ -eq "i"} #Items
             {
                 cls
                 write-host " -------------------------------------------------" 
                 $Player.Item($cenemy)
                 write-host ""
                 IF ($cenemy.HP -gt 0)
                 {
                     start-sleep 1
                     $cenemy.Enemyattack($Player)
                 }             
                 ELSE
                 {}
             }

        {$_ -eq "f"} #flee
             {
                 cls
                 write-host " -------------------------------------------------" 
                 $Player.Flee($cenemy)
             }

        {$move -eq "kill"} #cheat
             {
                 cls
                 write-host " -------------------------------------------------" 
                 write-host $cenemy.name "commited suicide. How strange."  -ForegroundColor Red
                 write-host ""
                 $cenemy.hp = 0
             }

        default #being bad
             {
                 cls
                 write-host " -------------------------------------------------" 
                 write-host "You failed to execute any command. Please be more careful next time."
                 $cenemy.EnemyAttack($Player)
             }
             
    }
    


########################################################################
         IF ($cenemy.HP -gt 0)
         {
             write-host  " -------------------------------------------------" 
             write-host  "" $cenemy.react()
             write-host  " What are you gonna do?"                 
             write-host  " -------------------------------------------------" 
             write-host  "|       HP:"$Player.HP"/"$Player.MAXHP"     |      MP:"$Player.MP"/"$Player.MAXMP"      |"           
             write-host  " -------------------------------------------------" 
             write-host  "|        [A] - Attack           [I] - Item        |"
             write-host  "|        [M] - Magic            [F] - Flee        |"
             write-host  " -------------------------------------------------" 
             write-host  "                                                  "
         }
         ELSE
         {}


         IF($cenemy.hp -le 0 -and $move -eq "f")
         {
            write-host " Escape successful!"
         }

         ELSEIF($cenemy.hp -le 0 -and $move -ne "kill") 
         { 
             start-sleep 1
             write-host "You dealt the finishing blow to your opponent. You won!" -foregroundcolor green
             $Player.EXPCheck($cenemy)
         }

         ELSEIF ($player.HP -le 0) 
         {
             start-sleep 1
             write-host "You were defeated. Game Over." -foregroundcolor red
             
             start-sleep 3
             #exit
         }

         ELSEIF ($cenemy.hp -le 0 -and $move -eq "kill") 
         {
             start-sleep 1
             write-host "You defeated the enemy, but where was the fun?"  -foregroundcolor red
             
         }

         ELSE 
         { 
            $move=read-host "Type in the corresponding starting letter for the command you want to use"
         }
}

    }
}