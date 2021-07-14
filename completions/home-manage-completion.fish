# Completions for home-manage command
# Matainer: Ariel AxionL <i at axionl dot me>

### SubCommands
function __home_manager_generations
    for i in (home-manager generations)
        set -l gen_id (echo $i | cut -d " " -f 5)
        set -l gen_datetime (echo $i | cut -d " " -f 1-2)
        set -l gen_hash (echo $i | grep -o "\w*\-home" | cut -d " " -f 1)
        echo $gen_id\t$gen_datetime $gen_hash
    end
end

complete -c home-manager -n "__fish_use_subcommand" -f -a "help" -d "Print home-manager help"
complete -c home-manager -n "__fish_use_subcommand" -f -a "edit" -d "Open the home configuration in $EDITOR"
complete -c home-manager -n "__fish_use_subcommand" -f -a "build" -d "Build configuration into result directory"
complete -c home-manager -n "__fish_use_subcommand" -f -a "instantiate" -d "Instantiate the configuration and print the resulting derivation"
complete -c home-manager -n "__fish_use_subcommand" -f -a "switch" -d "Build and activate configuration"
complete -c home-manager -n "__fish_use_subcommand" -f -a "generations" -d "List all home environment generations"
complete -c home-manager -n "__fish_use_subcommand" -f -a "packages" -d "List all packages installed in home-manager-path"
complete -c home-manager -n "__fish_use_subcommand" -f -a "news" -d "Show news entries in a pager"
complete -c home-manager -n "__fish_use_subcommand" -f -a "uninstall" -d "Remove Home Manager"

complete -c home-manager -n "__fish_use_subcommand" -x -a "remove-generations" -d "Remove indicated generations"
complete -c home-manager -n "__fish_seen_subcommand_from remove-generations" -f -ka '(__home_manager_generations)'

complete -c home-manager -n "__fish_use_subcommand" -x -a "expire-generations" -d "Remove generations older than TIMESTAMP"

### Options
complete -c home-manager -n "__fish_no_arguments" -x -s f -d "The home configuration file"
complete -c home-manager -n "__fish_no_arguments" -x -s A -d "Optional attribute that selects a configuration expression in the configuration file"
complete -c home-manager -n "__fish_no_arguments" -x -s I -d "Add a path to the Nix expression search path"
complete -c home-manager -n "__fish_no_arguments" -x -s b -d "Move existing files to new path rather than fail"
complete -c home-manager -n "__fish_no_arguments" -f -s v -d "Verbose output"
complete -c home-manager -n "__fish_no_arguments" -f -s n -d "Do a dry run, only prints what actions would be taken"
complete -c home-manager -n "__fish_no_arguments" -f -s h -l "help" -d "Print this help"

complete -c home-manager -x -l cores -d "NUM"
complete -c home-manager -f -l "keep-failed"
complete -c home-manager -f -l "keep-going"
complete -c home-manager -x -s j -l "max-jobs" -d "NUM"
complete -c home-manager -x -l "option" -d "NAME VALUE"
complete -c home-manager -f -l "show-trace"
complete -c home-manager -f -l "substitute"
complete -c home-manager -f -l "no-substitute"
