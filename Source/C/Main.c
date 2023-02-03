#include "header.h"


int main(int argc,char **argv){


    // Launch the correct sorting depending of the arguments


    if(! strcmp(argv[1],"--tab")){
        for (int i=3;i<argc;i++){
            if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherT1.csv")){
                tabT1(argv[i],argv[2]);
            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherT2.csv")){
                tabT2(argv[i],argv[2]);
            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherT3.csv")){
                tabT3(argv[i],argv[2]);
            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherP1.csv")){
                tabP1(argv[i],argv[2]);
            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherP2.csv")){
                tabP2(argv[i],argv[2]);
            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherP3.csv")){
                tabP3(argv[i],argv[2]);
            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherW.csv")){
                tabW(argv[i],argv[2]);
            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherM.csv")){
                tabM(argv[i],argv[2]);
            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherH.csv")){
                tabH(argv[i],argv[2]);
            }
        }
    }

    else if(! strcmp(argv[1],"--abr")){
        for (int i=3;i<argc;i++){

            if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherT1.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherT2.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherT3.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherP1.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherP2.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherP3.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherW.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherM.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherH.csv")){
        

            }

        }

    }
    else if(! strcmp(argv[1],"--avl")){
        for (int i=3;i<argc;i++){

            if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherT1.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherT2.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherT3.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherP1.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherP2.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherP3.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherW.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherM.csv")){
        

            }
            else if(! strcmp(argv[i],"./Data/ReadyToSort/WeatherH.csv")){
        

            }

        }

    }


}



