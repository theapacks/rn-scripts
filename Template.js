import React from 'react';
import { View, Text } from 'react-native';

import styles from './Template.styles';

const Template = props => {
    return (
        <View style={styles.screen}>
            <Text>
                The Template Component
            </Text>
        </View>
    );
};

export default Template;