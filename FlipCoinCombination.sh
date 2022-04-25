#! /bin/bash -x

read -p "Enter the number of times to flip a combination:" no_of_flips
declare -A singlet_frequency=(

			    [H]=0
			    [T]=0

                             )
echo
echo " .......................Singlet Combination........................."
for(( flip=1; flip<=no_of_flips; flip++ ))
do
   echo -n "Flip-$flip is"
   (( toss=RANDOM%2 ))
   case $toss in
	0)
	   echo "Heads"
	   (( singlet_frequency[H]++))
	   ;;
	1)
	   echo "Tails"
	   (( singlet_frequency[T]++))
   esac
done

for combination in ${!siglet_frequency[@]}
do
   percentage=$(( ${singlet_frequency[$combination]}*100/no_of_flips ))
   singlet_frequency[$combination]=$percentage
   echo "percentage of $combination is ${singlet_frequency[$combination]}%"
done


echo "...................Doublet Combination............................."
declare -A doublet_frequency=(

                            [HH]=0
                            [HT]=0
			    [TH]=0
			    [TT]=0

                             )
for(( flip=1; flip<=no_of_flips; flip++ ))
do
   echo -n "Flip-$flip is"
   (( coin_1=RANDOM%2 ))
   (( coin_2=RANDOM%2 ))

   case $coin_1$coin_2 in
        00)
           echo "Heads Heads"
           (( doublet_frequency[HH]++))
           ;;
        01)
           echo "Heads Tails"
           (( doublet_frequency[HT]++))
	   ;;
	10)
	   echo "Tails Heads"
	   (( doublet_frequency[TH]++))
	   ;;
	11)
	   echo "Tails Tails"
	   (( doublet_frequency[TT]++))
	   ;;
   esac
done

for combination in ${!doublet_frequency[@]}
do
   percentage=$(( ${doublet_frequency[$combination]}*100/no_of_flips ))
   doublet_frequency[$combination]=$percentage
   echo "percentage of $combination is ${doublet_frequency[$combination]}%"
done
