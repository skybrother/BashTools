 branch(){
        echo Current Branch : $(git rev-parse --abbrev-ref HEAD)
        branchArr=(`git for-each-ref refs/heads | cut -d/ -f3-`)

        for gb in ${!branchArr[@]};
        do
                echo $gb - ${branchArr[$gb]}
        done

        echo Switch to branch number?

        read brNum

        case $brNum in
                ''|*[!0-9]*)
                        echo Branch number not recognized. ;;
                *)
                        git checkout ${branchArr[$brNum]} ;;
        esac
} 
