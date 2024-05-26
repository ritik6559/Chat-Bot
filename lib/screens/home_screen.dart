import 'package:chatbot/utils/pallete.dart';
import 'package:chatbot/widgets/feature_box.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("ChatJPT"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Pallete.firstSuggestionBoxColor,
        child: const Icon(Icons.mic),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      margin: const EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(
                          color: Pallete.assistantCircleColor,
                          shape: BoxShape.circle),
                    ),
                  ),
                  Container(
                    height: 125,
                    width: 121,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset('assets/images/virtualAssistant.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      border: Border.all(width: 3, color: Pallete.borderColor)),
                  child: const Text(
                    'Good Morning, what task can I do for you?',
                    style: TextStyle(
                        color: Pallete.mainFontColor,
                        fontFamily: 'Cera Pro',
                        fontSize: 25,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Here are a few commands',
                  style: TextStyle(
                    fontFamily: 'Cera Pro',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              const Column(
                children: [
                  FeatureBox(
                      description:
                          'A smarter way to stay organised and informed with ChatGPT.',
                      color: Pallete.firstSuggestionBoxColor,
                      title: 'ChatGpt'),
                  FeatureBox(
                    color: Pallete.secondSuggestionBoxColor,
                    title: 'Dall-E',
                    description:
                        'Get inspired and stay creative with your personal assistant powered by Dall-E',
                  ),
                  FeatureBox(
                    color: Pallete.thirdSuggestionBoxColor,
                    title: 'Smart Voice Assistant',
                    description:
                        'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
