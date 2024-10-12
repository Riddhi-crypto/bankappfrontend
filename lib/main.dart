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
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: TextTheme(
          headlineMedium: TextStyle(color: Colors.white), // For titles
          bodyMedium: TextStyle(color: Colors.white), // For body text
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
              decoration: InputDecoration(labelText: 'Email', filled: true, fillColor: Colors.teal[600]),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password', filled: true, fillColor: Colors.teal[600]),
              obscureText: true,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number', filled: true, fillColor: Colors.teal[600]),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isAccountCreated = true;
                });
              },
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
            Text('Welcome to PayNestor!', style: TextStyle(fontSize: 24, color: Colors.teal[700])),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TransferMoneyPage()));
              },
              child: Text('Transfer Money'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BalanceHistoryPage()));
              },
              child: Text('Balance History'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MobileRechargePage()));
              },
              child: Text('Mobile Recharge'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookTicketsPage()));
              },
              child: Text('Book Tickets'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CrossBorderPaymentPage()));
              },
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
              decoration: InputDecoration(labelText: 'Recipient', filled: true, fillColor: Colors.teal[600]),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount', filled: true, fillColor: Colors.teal[600]),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
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
    child: Text('OK'),),
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
  child: Text('OK'),),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: transactions.isEmpty
            ? Center(child: Text('No transaction history found.', style: TextStyle(color: Colors.white)))
            : ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return ListTile(
              title: Text(transaction['recipient'] ?? 'Unknown', style: TextStyle(color: Colors.white)),
              subtitle: Text(transaction['date'] ?? 'No Date', style: TextStyle(color: Colors.white)),
              trailing: Text('₹${transaction['amount']?.toStringAsFixed(2) ?? '0.00'}', style: TextStyle(color: Colors.white)),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTransaction();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }

  void _addTransaction() {
    // Example transaction data, you can modify this to accept user input
    final newTransaction = {
      'recipient': 'New User',
      'amount': 1000.00,
      'date': DateTime.now().toLocal().toString().split(' ')[0], // Just the date part
    };

    setState(() {
      transactions.add(newTransaction); // Add the new transaction to the list
    });
  }
}


class MobileRechargePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Recharge'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Mobile Number', filled: true, fillColor: Colors.teal[600]),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Amount', filled: true, fillColor: Colors.teal[600]),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add mobile recharge functionality here
              },
              child: Text('Recharge'),
            ),
          ],
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text('Ticket booking functionality goes here.', style: TextStyle(color: Colors.white)),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text('Cross-border payment functionality goes here.', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
