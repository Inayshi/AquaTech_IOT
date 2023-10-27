import 'package:aquatech/drawer.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Add an app bar title if needed
      ),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color(0xFF0081C9), // Top part color
              height: MediaQuery.of(context).size.height * 0.2, // 10% of screen height
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'What is pH?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '• pH is a measure of the acidity or alkalinity of a substance, quantifying the concentration of hydrogen ions (H+) in a solution. The pH scale ranges from 0 to 14, with 7 being neutral. Values below 7 indicate acidity, with lower numbers being more acidic, and values above 7 indicate alkalinity, with higher numbers being more alkaline. pH is essential in chemistry, biology, and environmental science for its impact on chemical reactions and living organisms.',
              ),
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'What is Ammonia?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '• Ammonia (NH3) is a chemical compound known for its distinctive pungent odor. It exists as a colorless gas at room temperature but is easily liquefied under pressure. Ammonia consists of one nitrogen atom bonded to three hydrogen atoms (NH3). It has a strong, recognizable odor often described as "ammoniacal" or "fishy." Ammonia is highly soluble in water, forming ammonium hydroxide (NH4OH) when dissolved in water. While commonly used, ammonia can be toxic in high concentrations and should be handled with care.',
              ),
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'What is Water Temperature?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '• In aquaculture, temperature is a critical environmental factor that significantly impacts the health and success of aquatic organisms being raised. Maintaining the right water temperature is essential because it affects:\n'
                    '  - Metabolism and Growth: Temperature influences the metabolic rate of aquatic species, with higher temperatures generally leading to faster growth and increased energy requirements.\n'
                    '  - Reproduction: Many aquatic species have specific temperature requirements for successful reproduction, making temperature control crucial for breeding programs.\n'
                    '  - Oxygen Levels: Water temperature affects the solubility of oxygen, so proper aeration and oxygen management are necessary, especially in warmer waters.\n'
                    '  - Disease Susceptibility: Temperature extremes can weaken the immune systems of aquatic organisms, making them more susceptible to diseases.\n'
                    '  - Seasonal Adaptations: Aquaculturists must often adapt to seasonal temperature fluctuations, which can impact production strategies and species selection.\n'
                    '  - Temperature Control: Heating or cooling systems may be used to maintain the desired water temperature range, and constant monitoring is essential for successful aquaculture.',
              ),
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Why is pH, Ammonia, and water temperature crucial in a fish tank?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '• pH, ammonia, and water temperature are crucial in a fish tank for the following reasons:\n'
                    '  - pH (Acidity/Alkalinity): pH affects fish health and water chemistry. Maintaining the right pH ensures fish comfort and prevents harmful chemical imbalances.\n'
                    '  - Ammonia: High ammonia levels are toxic to fish. Monitoring and controlling ammonia is essential to prevent fish stress and health issues.\n'
                    '  - Water Temperature: Fish have specific temperature requirements. Proper temperature regulation supports their metabolism, growth, and overall well-being.\n'
                    '• So, balancing these factors is vital for creating a suitable and healthy environment for the fish and other aquatic life in the tank.',
              ),
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'What is a pH buffer?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '• A pH buffer in aquaculture is a substance or system that helps maintain a stable and suitable pH level in the water where aquatic organisms are raised. Here\'s a brief description of a pH buffer in aquaculture:\n'
                    '  - Function: A pH buffer acts as a stabilizing agent, preventing rapid or significant fluctuations in the acidity (pH) of the water in aquaculture systems. This stability is crucial for the health and well-being of aquatic organisms, as many species are sensitive to pH changes.\n'
                    '  - Importance: Maintaining the right pH level is essential because aquatic organisms have specific pH tolerances. Fluctuations outside these tolerances can stress or harm the organisms, affecting their growth, reproduction, and overall health.\n'
                    '  - Mechanism: pH buffers typically consist of chemical compounds or systems that can absorb or release hydrogen ions (H+) to resist changes in pH. Common pH buffers in aquaculture include substances like calcium carbonate (CaCO₃) and bicarbonate (HCO₃-) ions.\n'
                    '  - Benefits: pH buffers provide a more stable and controlled environment, reducing the risk of pH-related stress or mortality among aquatic species. This stability also enhances the effectiveness of water treatment processes and the overall success of aquaculture operations.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
