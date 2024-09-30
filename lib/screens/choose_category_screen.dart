import 'package:flutter/material.dart';
import 'scrub_team_screen.dart';
import 'collection_billing_screen.dart';
import 'runner_team_screen.dart';
import 'sales_team_screen.dart'; // Import the SalesTeamScreen

class ChooseCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Category'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF00C9FF), // Light blue
                  Color(0xFF92FE9D), // Light green
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Who you are',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _buildCategoryCard(
                        context,
                        'Scrub Team',
                        Icons.local_hospital,
                        ScrubTeamScreen(),
                      ),
                      _buildCategoryCard(
                        context,
                        'Collection & Billing Team',
                        Icons.account_balance_wallet,
                        CollectionBillingScreen(),
                      ),
                      _buildCategoryCard(
                        context,
                        'Runner Team',
                        Icons.directions_run,
                        RunnerTeamScreen(),
                      ),
                      _buildCategoryCard(
                        context,
                        'Sales Team',
                        Icons.group,
                        SalesTeamScreen(), // Updated to actual screen for Sales Team
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, String title, IconData icon, Widget nextScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: Card(
        color: Colors.white.withOpacity(0.8),
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blueAccent),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
