#!/bin/bash

usage() {
    echo "Usage $0 -s MainScreen OR $0 -c PrimaryButton"
}

template_name='Template.js'
template_styles_name='Template.styles.js'
components_dir='./components'
screens_dir='./screens'

while getopts c:s: option
do
    case "${option}" in
        c) 
            component=${OPTARG}
            echo "Creating component $component..."
            component_name=$component'.js'
            component_styles=$component'.styles.js'
            mkdir -p $components_dir/$component
            sed "s/Template/${component}/g" $template_name > $components_dir/$component/$component_name

            [ -f $components_dir/$component/$component_name ] &&\
                echo "Created component template $components_dir/$component/$component_name" ||\
                echo "Could not create component";               

            cp $template_styles_name $components_dir/$component/$component_styles 

            [ -f $components_dir/$component/$component_styles ] &&\
                echo "Created styles template $components_dir/$component/$component_styles" ||\
                echo "Could not create styles file";
            ;;
        s) 
            screen=${OPTARG}
            echo "Creating screen $screen..."
            screen_name=$screen'.js'
            screen_styles=$screen'.styles.js'
            mkdir -p $screens_dir/$screen
            sed "s/Template/${screen}/g" $template_name > $screens_dir/$screen/$screen_name

            [ -f $screens_dir/$screen/$screen_name ] &&\
                echo "Created screen template $screens_dir/$screen/$screen_name" ||\
                echo "Could not create screen";               

            cp $template_styles_name $screens_dir/$screen/$screen_styles 

            [ -f $screens_dir/$screen/$screen_styles ] &&\
                echo "Created styles template $screens_dir/$screen/$screen_styles" ||\
                echo "Could not create styles file";
            ;;
        *)
            usage
            ;;
    esac
done


