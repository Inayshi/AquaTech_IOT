import 'package:flutter/material.dart';
import 'drawer.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Add an app bar title if needed
          ),
      drawer: MenuDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color(0xFF0081C9), // Top part color
            height: MediaQuery.of(context).size.height *
                0.2, // 10% of screen height
            child: const Center(
              child: Text(
                'Information',
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0), // Add some spacing
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildParagraph(
                      'Welcome to the future of aquaculture management with Aquatech – the cutting-edge IoT system designed to transform the way we care for our fish tanks. Whether you\'re a seasoned aquarist or a newcomer to the world of fishkeeping, Aquatech is here to simplify and enhance your experience. We\'ll explore the features and benefits of Aquatech, a revolutionary system that combines advanced sensors and automation to monitor and maintain optimal water conditions for your aquatic friends.'),
                  _buildSectionTitle('Key Features'),
                  _buildFeatureItem('Real-time Monitoring',
                      'Aquatech takes the guesswork out of fish tank management by providing real-time data on crucial water parameters. With sensors, it continuously monitors the water temperature, pH level, and ammonia concentration. This comprehensive monitoring ensures a stable and healthy environment for your fish.'),
                  _buildFeatureItem('Automated Water Change',
                      'Say goodbye to the hassle of manual water changes. This system is equipped with automated water change mechanisms, allowing you to trigger changes based on specific water conditions. This not only saves you time but also ensures that your fish are swimming in pristine water at all times.'),
                  _buildFeatureItem('pH Balancing',
                      'Maintaining the right pH level is essential for the well-being of your aquatic pets. Aquatech streamlines this process by automating pH balancing procedures.'),
                  _buildFeatureItem('User-Friendly Interface',
                      'Aquatech is designed with user convenience in mind. The system comes with an intuitive interface accessible through a smartphone app. Check and control your fish tank conditions from anywhere, giving you peace of mind and control over your aquarium, even when you are away from home.'),
                  _buildFeatureItem('Notifications and Alerts',
                      'Stay informed about the health of your tank with the notification system. Receive alerts for critical changes in temperature, pH, or ammonia levels, allowing you to take prompt action and prevent potential issues.'),
                  _buildSectionTitle('What is pH?'),
                  _buildParagraph(
                      'pH is a measure of the acidity or alkalinity of a substance, quantifying the concentration of hydrogen ions (H+) in a solution. The pH scale ranges from 0 to 14, with 7 being neutral. Values below 7 indicate acidity, with lower numbers being more acidic, and values above 7 indicate alkalinity, with higher numbers being more alkaline. pH is essential in chemistry, biology, and environmental science for its impact on chemical reactions and living organisms.'),
                  _buildSectionTitle('What is Ammonia?'),
                  _buildParagraph(
                      'Ammonia (NH3) is a chemical compound known for its distinctive pungent odor. It exists as a colorless gas at room temperature but is easily liquefied under pressure. Ammonia consists of one nitrogen atom bonded to three hydrogen atoms (NH3). It has a strong, recognizable odor often described as "ammoniacal" or "fishy." Ammonia is highly soluble in water, forming ammonium hydroxide (NH4OH) when dissolved in water. While commonly used, ammonia can be toxic in high concentrations and should be handled with care.'),
                  _buildSectionTitle('What is Water Temperature?'),
                  _buildParagraph(
                      'In aquaculture, temperature is a critical environmental factor that significantly impacts the health and success of aquatic organisms being raised. Maintaining the right water temperature is essential because it affects: Metabolism and Growth, Reproduction, Oxygen Levels, Disease Susceptibility, Seasonal Adaptations, Temperature Control: Heating or cooling systems may be used to maintain the desired water temperature range, and constant monitoring is essential for successful aquaculture.'),
                  _buildSectionTitle(
                      'Why is pH, Ammonia, and water temperature crucial in a fish tank?'),
                  _buildParagraph(
                      'pH, ammonia, and water temperature are crucial in a fish tank for the following reasons: pH (Acidity/Alkalinity), Ammonia, Water Temperature: Fish have specific temperature requirements. Proper temperature regulation supports their metabolism, growth, and overall well-being. So, balancing these factors is vital for creating a suitable and healthy environment for the fish and other aquatic life in the tank.'),
                  _buildSectionTitle('What is a pH buffer?'),
                  _buildParagraph(
                      'A pH buffer in aquaculture is a substance or system that helps maintain a stable and suitable pH level in the water where aquatic organisms are raised. Here\'s a brief description of a pH buffer in aquaculture: Function, Importance, Mechanism, Benefits'),
                  _buildSectionTitle('What is calcium carbonate (CaCO₃)?'),
                  _buildParagraph(
                      'Calcium carbonate (CaCO₃) plays a significant role in aquaculture, particularly in maintaining water quality and providing essential minerals for aquatic organisms. Below are the key ways in which calcium carbonate is used in aquaculture: pH Regulation, Water Hardness, Alkalinity Control, Nutrient Source, Biofiltration'),
                  _buildSectionTitle('What is net shading?'),
                  _buildParagraph(
                      'In aquaculture, "net shading" refers to the use of shading devices or nets to control light and temperature in ponds or cages. It helps regulate water temperature, reduces algae growth, minimizes stress in aquatic species, and serves as a barrier against predators in outdoor aquaculture systems. Specialized shading materials are employed to create a controlled environment for optimal cultivation conditions.'),
                  _buildSectionTitle(
                      'Always remember! Maintaining good water quality in a fishpond is crucial for the health and well-being of your aquatic inhabitants.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(text),
    );
  }

  Widget _buildFeatureItem(String title, String description) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        title: Text(title),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(description),
          ),
        ],
      ),
    );
  }
}
