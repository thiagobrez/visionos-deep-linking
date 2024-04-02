import React, {useEffect, useState} from 'react';
import {Linking, StyleSheet, Text, View} from 'react-native';

function App() {
  const [initialUrl, setInitialUrl] = useState<string | null>(null);

  useEffect(() => {
    const listener = Linking.addEventListener('url', event => {
      console.log('event.url', event.url);
    });

    Linking.getInitialURL().then(url => {
      console.log('initial url:', url);
      setInitialUrl(url);
    });

    return () => {
      listener.remove();
    };
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.text}>Initial URL: {initialUrl}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  text: {
    fontSize: 30,
  },
});

export default App;
