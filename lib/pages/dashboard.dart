import 'package:flutter/material.dart';
import 'savings_page.dart'; 
import 'loan_page.dart'; 
import 'account_page.dart'; 

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const DashboardGrid(),
    const SavingsPage(),
    LoanPage(),
    const AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PocketWallet', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.teal.shade700,
          elevation: 10,
        ),
        body: AnimatedSwitcher( // Smooth transition between pages
          duration: const Duration(milliseconds: 300),
          child: _pages[_selectedIndex],
        ),
        bottomNavigationBar: Container( 
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
            boxShadow: [ 
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
              ),
            ],
          ),
          child: ClipRRect( 
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: Colors.teal.shade800,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 14,
              unselectedFontSize: 12,
              iconSize: 28,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.savings), label: 'Savings'),
                BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Loan'),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
              ],
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Reduced to two for a more balanced view
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: <Widget>[
            _buildDashboardItem(context, Icons.send, 'Send Money', '/sendmoney'),
            _buildDashboardItem(context, Icons.payment, 'Pay Bills', '/paybills'),
            _buildDashboardItem(context, Icons.phone, 'Buy Airtime', '/buyairtime'),
            _buildDashboardItem(context, Icons.attach_money, 'Withdraw', '/withdraw'),
            _buildDashboardItem(context, Icons.sync_alt, 'Bank Transfer', '/banktransfer'),
            _buildDashboardItem(context, Icons.account_balance_wallet, 'Deposit', '/deposit'),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        color: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.teal.shade400, Colors.teal.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Icon(icon, size: 36.0, color: Colors.white),
            ),
            const SizedBox(height: 12.0),
            Text(
              label,
              style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
