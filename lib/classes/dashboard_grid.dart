import 'package:flutter/material.dart';

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
            _buildDashboardItem(
                context, Icons.payment_sharp, 'Buy Goods', '/goods'),
            _buildDashboardItem(
                context, Icons.send, 'Send Money', '/sendmoney'),
            _buildDashboardItem(
                context, Icons.payment, 'Pay Bills', '/paybills'),
            _buildDashboardItem(
                context, Icons.phone, 'Buy Airtime', '/buyairtime'),
            _buildDashboardItem(
                context, Icons.attach_money, 'Withdraw', '/withdraw'),
            _buildDashboardItem(
                context, Icons.sync_alt, 'Bank Transfer', '/banktransfer'),
            _buildDashboardItem(
                context, Icons.account_balance_wallet, 'Deposit', '/deposit'),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(
      BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        color: Colors.white,
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
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
              style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
