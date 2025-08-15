import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { StatusBar } from 'expo-status-bar';
import { Text, View } from 'react-native';
import { Ionicons } from '@expo/vector-icons';

function Screen({ title }: { title: string }) {
	return (
		<View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
			<Text style={{ fontSize: 20 }}>{title}</Text>
			<StatusBar style="auto" />
		</View>
	);
}

const Tab = createBottomTabNavigator();

export default function App() {
	return (
		<NavigationContainer>
			<Tab.Navigator
				initialRouteName="Home"
				screenOptions={({ route }) => ({
					tabBarIcon: ({ color, size }) => {
						const nameMap: Record<string, keyof typeof Ionicons.glyphMap> = {
							Home: 'home',
							Search: 'search',
							Agent: 'sparkles',
							Benefits: 'gift',
							Me: 'person',
						};
						const iconName = nameMap[route.name] ?? 'ellipse';
						return <Ionicons name={iconName} size={size} color={color} />;
					},
					tabBarActiveTintColor: '#6F52ED',
					tabBarInactiveTintColor: '#6B7280',
					headerTitleAlign: 'center',
				})}
			>
				<Tab.Screen name="Home" children={() => <Screen title="Home" />} />
				<Tab.Screen name="Search" children={() => <Screen title="Search" />} />
				<Tab.Screen name="Agent" children={() => <Screen title="Agent" />} />
				<Tab.Screen name="Benefits" children={() => <Screen title="Benefits" />} />
				<Tab.Screen name="Me" children={() => <Screen title="Me" />} />
			</Tab.Navigator>
		</NavigationContainer>
	);
}
