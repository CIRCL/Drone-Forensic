
install Blackbox Explorer
https://github.com/betaflight/blackbox-tools

Extract CSV from dump

$ ../../blackbox-tools/obj/blackbox_decode blackbox.bin --debug                             
Decoding log 'blackbox.bin' to 'blackbox.01.csv'...                                                                                                                                      
Data file contained no events                                                                                                                                                            
                                                                                            
                                                                                            Log 1 of 6, start 00:21.243, end 01:15.041, duration 00:53.797                                                                                                                           
                                                                                                                                                                                        
                                                                                                                                                                                        Statistics                                                                                  
                                                                                                                                                                                        Looptime            491 avg           61.7 std dev (12.6%)                                                                                                                               
                                                                                                                                                                                        I frames    1684   56.7 bytes avg    95419 bytes total                                      
                                                                                                                                                                                        P frames  105976   28.3 bytes avg  3003159 bytes total
                                                                                                                                                                                        E frames       2    8.5 bytes avg       17 bytes total                                                                                                                                   
                                                                                                                                                                                        S frames       8    3.0 bytes avg       24 bytes total                                      
                                                                                                                                                                                        Frames    107660   28.8 bytes avg  3098578 bytes total        
                                                                                                                                                                                        Data rate 2001Hz  59724 bytes/s     597300 baud   
