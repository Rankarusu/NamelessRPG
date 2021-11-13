. .\Classes\class_GM.ps1
. .\Classes\class_player.ps1
. .\Classes\class_enemies.ps1
. .\Classes\class_magic.ps1
. .\Classes\class_items.ps1

cls
$GM = [GM]::new()

Write-host "

 ███▄    █  ▄▄▄       ███▄ ▄███▓▓█████  ██▓    ▓█████   ██████   ██████     ██▀███   ██▓███    ▄████ 
 ██ ▀█   █ ▒████▄    ▓██▒▀█▀ ██▒▓█   ▀ ▓██▒    ▓█   ▀ ▒██    ▒ ▒██    ▒    ▓██ ▒ ██▒▓██░  ██▒ ██▒ ▀█▒
▓██  ▀█ ██▒▒██  ▀█▄  ▓██    ▓██░▒███   ▒██░    ▒███   ░ ▓██▄   ░ ▓██▄      ▓██ ░▄█ ▒▓██░ ██▓▒▒██░▄▄▄░
▓██▒  ▐▌██▒░██▄▄▄▄██ ▒██    ▒██ ▒▓█  ▄ ▒██░    ▒▓█  ▄   ▒   ██▒  ▒   ██▒   ▒██▀▀█▄  ▒██▄█▓▒ ▒░▓█  ██▓
▒██░   ▓██░ ▓█   ▓██▒▒██▒   ░██▒░▒████▒░██████▒░▒████▒▒██████▒▒▒██████▒▒   ░██▓ ▒██▒▒██▒ ░  ░░▒▓███▀▒
░ ▒░   ▒ ▒  ▒▒   ▓▒█░░ ▒░   ░  ░░░ ▒░ ░░ ▒░▓  ░░░ ▒░ ░▒ ▒▓▒ ▒ ░▒ ▒▓▒ ▒ ░   ░ ▒▓ ░▒▓░▒▓▒░ ░  ░ ░▒   ▒ 
░ ░░   ░ ▒░  ▒   ▒▒ ░░  ░      ░ ░ ░  ░░ ░ ▒  ░ ░ ░  ░░ ░▒  ░ ░░ ░▒  ░ ░     ░▒ ░ ▒░░▒ ░       ░   ░ 
   ░   ░ ░   ░   ▒   ░      ░      ░     ░ ░      ░   ░  ░  ░  ░  ░  ░       ░░   ░ ░░       ░ ░   ░ 
         ░       ░  ░       ░      ░  ░    ░  ░   ░  ░      ░        ░        ░                    ░ 
                                                                                                     " #ascii title

read-host "Press Enter to start the game."

cls

$Pname = Read-host "Please enter your name"

""
$yn=0

while ($yn -ne "y" -or $yn -eq "yes") #name selection
{
"Is $pname correct?"
$yn = read-host "answer with y for yes and n for no"
$yn


IF ($yn -eq "n" -or $yn -eq "no")
    {
    write-host "Can't you even write your own name correctly?"
    $pname = read-host "Try again then"
    }
ELSE
    {
    write-host "I didn't catch that. Could you speak up a little, please?"
    }

} 

cls

$Player=[player]::new("$Pname")
Write-host "So you're"$Pname "? Nice to meet you!"


$Potion = [Potion]::new()
$Player.Inventory.add("Potion",$Potion)

$Player.Spellbook += $Heal =   [Heal]::new(0)
$Player.spellbook += $Sparks = [Sparks]::new(1)

$GM.Battle($Player, $Mobs)