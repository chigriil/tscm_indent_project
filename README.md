# tscm_indent_project
Этот репозиторий был создан для проекта по технологиям суперкомпьютерных вычислений ЛФИ МФТИ 4 семестр.

## Информация о структуре:
Структура проекта из себя представляет следующее:

В папке ellipse проект находится целиком.
 
    В папке data находятся файлы необходимы для функцонирования скриптов.
    
        Changing_k необходима для выполнения скрипта с перебором параметра и дальнешим получения графика зависимости.
        
        data_1000 и data_1000000 необходимы для выполнеия ngl-view построения, где постфиксы папок означают какой коэффициент k 
        использовался в вычислениях
        
        остальные файлы были необходимы для самого первого запуска.
        
        pickle файл содержит в себе plotly график (преобразованный pickle'ом)
        
    В папке slurms находятся некоторые результаты выполнения задач.
   
    В папке scripts находятся как bash так и sbatch (для slurm) скрипты для запуска всего проекта. 
   
        В папке python_scripts находятся питоновские скрипты (в частности один для построения plotly графика)
      
    То, ради чего мы сегодня собрались - то есть юпитер ноутбук находится прямл в папке ellipse.
