import 'package:flutter/material.dart';

void main() {
  runApp(PaynestApp());
}

class PaynestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayNestor App',
      theme: ThemeData(
        primarySwatch: Colors.green, // Olive color for primary
        scaffoldBackgroundColor: Colors.grey[100], // Cream background
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFA8F805), // Olive AppBar
        ),
        textTheme: TextTheme(
          headlineMedium: TextStyle(color: Color(0xFF483C32)), // Taupe for titles
          bodyMedium: TextStyle(color: Color(0xFF483C32)), // Taupe for body text
        ),
      ),
      home: AccountSetupPage(),
    );
  }
}

class Account {
  final String accountNumber;

  Account(this.accountNumber);
}

class AccountSetupPage extends StatefulWidget {
  @override
  _AccountSetupPageState createState() => _AccountSetupPageState();
}

class _AccountSetupPageState extends State<AccountSetupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isAccountCreated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PayNestor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isAccountCreated
            ? HomePage()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.green[100], // Olive light fill for input
              ),
              style: TextStyle(color: Color(0xFF483C32)), // Taupe text
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.green[100], // Olive light fill
              ),
              obscureText: true,
              style: TextStyle(color: Color(0xFF483C32)), // Taupe text
            ),
            SizedBox(height: 10),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                filled: true,
                fillColor: Colors.green[100], // Olive light fill
              ),
              style: TextStyle(color: Color(0xFF483C32)), // Taupe text
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isAccountCreated = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA8F805), // Olive button color
              ),
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PayNestor - Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pop(context); // Log out
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome to PayNestor!', style: TextStyle(fontSize: 24, color: Color(0xFFA8F805))), // Olive text
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TransferMoneyPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA8F805), // Olive button
              ),
              child: Text('Transfer Money'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BalanceHistoryPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA8F805), // Olive button
              ),
              child: Text('Balance History'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MobileRechargePage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA8F805), // Olive button
              ),
              child: Text('Mobile Recharge'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookTicketsPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA8F805), // Olive button
              ),
              child: Text('Book Tickets'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CrossBorderPaymentPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA8F805), // Olive button
              ),
              child: Text('Cross-Border Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

class TransferMoneyPage extends StatefulWidget {
  @override
  _TransferMoneyPageState createState() => _TransferMoneyPageState();
}

class _TransferMoneyPageState extends State<TransferMoneyPage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _recipientController = TextEditingController();
  String _paymentMethod = 'Contact'; // Default payment method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer Money'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _paymentMethod,
              onChanged: (String? newValue) {
                setState(() {
                  _paymentMethod = newValue!;
                });
              },
              items: ['Contact', 'Phone Number'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _recipientController,
              decoration: InputDecoration(
                labelText: 'Recipient',
                filled: true,
                fillColor: Colors.green[100], // Olive light fill
              ),
              style: TextStyle(color: Color(0xFF483C32)), // Taupe text
            ),
            SizedBox(height: 10),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                filled: true,
                fillColor: Colors.green[100], // Olive light fill
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Color(0xFF483C32)), // Taupe text
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double amount = double.tryParse(_amountController.text) ?? 0;
                if (amount <= 0) {
                  _showErrorDialog(context, 'Please enter a valid amount!');
                } else {
                  _showSuccessDialog(context, _recipientController.text, amount);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA8F805), // Olive button color
              ),
              child: Text('Send Money'),
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, String recipient, double amount) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success'),
        content: Text('You sent ₹${amount.toStringAsFixed(2)} to $recipient.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

class BalanceHistoryPage extends StatefulWidget {
  @override
  _BalanceHistoryPageState createState() => _BalanceHistoryPageState();
}

class _BalanceHistoryPageState extends State<BalanceHistoryPage> {
  List<Map<String, dynamic>> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Balance History'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            title: Text('${transaction['type']} - ₹${transaction['amount']}'),
            subtitle: Text('Date: ${transaction['date']}'),
          );
        },
      ),
    );
  }
}

class MobileRechargePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Recharge'),
      ),
      body: Center(
        child: Text('Mobile Recharge Page'),
      ),
    );
  }
}

class BookTicketsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Tickets'),
      ),
      body: Center(
        child: Text('Book Tickets Page'),
      ),
    );
  }
}

class CrossBorderPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cross-Border Payment'),
      ),
      body: Center(
        child: Text('Cross-Border Payment Page'),
      ),
    );
  }
}
