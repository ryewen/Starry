echo %1

python parse_log.py %1 .

python plot_training_log.py.example 6 %1.png %1
