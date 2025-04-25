import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbl_fitness_app/models/user_model.dart';
import 'package:pbl_fitness_app/providers/user_provider.dart';
import '../screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? get _errorTextName {
    if (_nameController.text.isEmpty) return 'name can\'t be empty';
    return null;
  }

  String? get _errorTextUsername {
    if (_usernameController.text.isEmpty) return 'username can\'t be empty';
    return null;
  }

  String? get _errorTextEmail {
    if (_emailController.text.isEmpty) return 'email can\'t be empty';
    if (!_emailController.text.contains('@')) return 'invalid email format';
    return null;
  }

  String? get _errorTextPhone {
    if (_phoneController.text.isEmpty) return 'phone can\'t be empty';
    return null;
  }

  String? get _errorTextPassword {
    if (_passwordController.text.isEmpty) return 'password can\'t be empty';
    if (_passwordController.text.length < 5) return 'password is too short';
    return null;
  }

  void _handleRegister(BuildContext context) {
    if (_errorTextName == null &&
        _errorTextUsername == null &&
        _errorTextEmail == null &&
        _errorTextPhone == null &&
        _errorTextPassword == null) {
      final user = UserModel(
        name: _nameController.text,
        username: _usernameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        profileImage:
            'https://cdn2.coachmag.co.uk/sites/coachmag/files/2016/07/4-1-overhead-press.jpg',
      );

      Provider.of<UserProvider>(context, listen: false).setUser(user);
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6C63FF), // Purple
              Color(0xFF4B45B2), // Deep Purple
              Color(0xFF2C387E), // Dark Blue
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.05),
                      Hero(
                        tag: 'logo',
                        child: Container(
                          height: 120,
                          child: Image.asset('assets/images/logo.jpg'),
                        ),
                      ),
                      SizedBox(height: 32.0),
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [
                            Colors.white,
                            Color(0xFFE0E0FF),
                          ],
                        ).createShader(bounds),
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "Sign up to get started",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFE0E0FF),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32.0),
                      _buildTextField(
                        controller: _nameController,
                        hintText: "Full Name",
                        icon: Icons.person_outline,
                        errorText: _errorTextName,
                      ),
                      SizedBox(height: 16.0),
                      _buildTextField(
                        controller: _usernameController,
                        hintText: "Username",
                        icon: Icons.person,
                        errorText: _errorTextUsername,
                      ),
                      SizedBox(height: 16.0),
                      _buildTextField(
                        controller: _emailController,
                        hintText: "Email",
                        icon: Icons.email,
                        errorText: _errorTextEmail,
                      ),
                      SizedBox(height: 16.0),
                      _buildTextField(
                        controller: _phoneController,
                        hintText: "Phone",
                        icon: Icons.phone,
                        errorText: _errorTextPhone,
                      ),
                      SizedBox(height: 16.0),
                      _buildPasswordField(),
                      SizedBox(height: 32.0),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFFFFFF),
                              Color(0xFFF0F0FF),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () => _handleRegister(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4B45B2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(color: Color(0xFFE0E0FF)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    String? errorText,
  }) {
    final hasError = errorText != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: hasError
                  ? Color(0xFFFF8A80).withOpacity(0.5)
                  : Colors.white.withOpacity(0.3),
              width: hasError ? 1.5 : 1,
            ),
          ),
          child: TextField(
            controller: controller,
            onChanged: (text) => setState(() {}),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
              errorStyle: TextStyle(height: 0),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              prefixIcon: Icon(
                icon,
                color: hasError
                    ? Color(0xFFFF8A80).withOpacity(0.7)
                    : Colors.white.withOpacity(0.7),
                size: 22,
              ),
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: EdgeInsets.only(left: 16, top: 8),
            child: Text(
              errorText,
              style: TextStyle(
                color: Color(0xFFFF8A80),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPasswordField() {
    final hasError = _errorTextPassword != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: hasError
                  ? Color(0xFFFF8A80).withOpacity(0.5)
                  : Colors.white.withOpacity(0.3),
              width: hasError ? 1.5 : 1,
            ),
          ),
          child: TextField(
            controller: _passwordController,
            onChanged: (text) => setState(() {}),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
              errorStyle: TextStyle(height: 0),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              prefixIcon: Icon(
                Icons.lock,
                color: hasError
                    ? Color(0xFFFF8A80).withOpacity(0.7)
                    : Colors.white.withOpacity(0.7),
                size: 22,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: hasError
                      ? Color(0xFFFF8A80).withOpacity(0.7)
                      : Colors.white.withOpacity(0.7),
                  size: 22,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: EdgeInsets.only(left: 16, top: 8),
            child: Text(
              _errorTextPassword!,
              style: TextStyle(
                color: Color(0xFFFF8A80),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}
