hz2py
=====

Transform the Chinese characters Name to English Name.

USAGE:
    ch2enName.sh -c CHINESE_CHARACTER
    ch2enName.sh -f CHINESE_CHARACTER_FILE

OPTIONS:
    -c: the Chinese characters to be transformed
    -f: the file contains the Chinese characters to be transformed
    
EXAMPLES:
    (1) ch2enName.sh -c "张三"
    
    Output:
          -c value is 张三
          San Zhang
          
    OR
    
    (2) ch2enName.sh -f namesFile
    
        namesFile content is:
          张三
          李四
          王五
         
    
        Output to the ENname file:
          San Zhang
          Si Li
          Wu Wang
