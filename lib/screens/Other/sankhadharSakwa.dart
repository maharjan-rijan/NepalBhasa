import 'package:flutter/material.dart';
import 'package:nepal_bhasa/main.dart';

class SankhadharInfoPage extends StatelessWidget {
  const SankhadharInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: CustomAppBar(
        bottomTitle: 'About Sankhadhar Sakhwa',
        showBackButton: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const SizedBox(height: 12),
          const Text(
            'The Nepal Sambat movement achieved its initial success on 18 November 1999 once the govt declared the founding father of the Nepal Sambat calendar, a merchandiser of Kathmandu named Sankhadhar Sakhwa (संखधर साख्वा), a national hero.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 12),
          Image.asset(
            'assets/images/sankhadar.png', // Add your image in assets and update pubspec.yaml
            height: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 4),

          const SizedBox(height: 16),
          const Text(
            'Sankhadhar Sakhwa: The leader of Kingdom of Asian nation Nepal, he\'s a Nepalese giver. He cleared the debts of all the individuals in Kingdom of Nepal. Sakhwa had collected the wealth through the gold that he panned from the sand of the Bishnumati watercourse. A brand-new era was initiated from the date throughout that he cleared the debts. Sakhwa then established his own stone image at the southern gate of Pashupatinath. On the premise of the data contained in "Bhasa Bamsali" and "Rajbhoogmala Bamsawali", a low-caste bourgeois spoken as Shangkhadhar freed the individuals of Kathmandu (capital of Nepal) from their debts throughout the region of Raghav Dav and commenced a brand-new era spoken as Nepal Era to commemorate it.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 12),
          const Text(
            'On 26 October 2003, the Department of Postal Service issued a ceremonial occasion postage stamp his portrait. A sculpture of Sankhadhar was erected in Tansen, Palpa in western Asian country on twenty eight January 2012. The govt has set to line up Sankhadhar Sakhwa National Academy within the name of the founding father of the age. Shangkhadhar Sakha\'s name has been basined among the list of "National Heroes Of Nepal"',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 12),
          const Text(
            'Shankhadhar Sakhwa is one from common Nepali citizen to get a national recognition posthumously. Though not fully accepted, records say that he was a lower caste Newar merchant who traced on gold. He freed the locals of Kathmandu by clearing their debts during the rule of King Raghav Dev. In 936 BS he started the Nepal Era in order to commemorate the incident.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
