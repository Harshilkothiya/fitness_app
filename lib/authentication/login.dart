// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbl_fitness_app/authentication/register.dart';
import 'package:pbl_fitness_app/models/user_model.dart';
import 'package:pbl_fitness_app/providers/user_provider.dart';
import 'package:pbl_fitness_app/services/google_sign_in_service.dart';
import '../screens/home_screen.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  TextEditingController _usernameController = TextEditingController();
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

  String? get _errorTextUsername {
    if (_usernameController.text.isEmpty) return 'username can\'t be empty';
    return null;
  }

  String? get _errorTextPassword {
    if (_passwordController.text.isEmpty) return 'password can\'t be empty';
    if (_passwordController.text.length < 5) return 'password is too short';
    return null;
  }

  void _handleLogin(BuildContext context) {
    if (_errorTextUsername == null && _errorTextPassword == null) {
      final user = UserModel(
        name: _usernameController.text,
        username: _usernameController.text,
        email: '${_usernameController.text}@example.com',
        phone: '1234567890',
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

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      final googleSignInService = GoogleSignInService();
      final userCredential = await googleSignInService.signInWithGoogle();
      if (userCredential != null && userCredential.user != null) {
        final user = UserModel(
          name: userCredential.user!.displayName ?? 'User',
          username: userCredential.user!.email?.split('@')[0] ?? 'user',
          email: userCredential.user!.email ?? '',
          phone: userCredential.user!.phoneNumber ?? '',
          profileImage: userCredential.user!.photoURL ?? '',
        );

        Provider.of<UserProvider>(context, listen: false).setUser(user);
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing in with Google')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Gradient background always fills the screen
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF6C63FF),
                  Color(0xFF4B45B2),
                  Color(0xFF2C387E),
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),
          // Login content scrolls above the gradient
          FadeTransition(
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
                        SizedBox(height: size.height * 0.1),
                        Hero(
                          tag: 'logo',
                          child: Container(
                            height: 150,
                            child: Image.asset('assets/images/logo.jpg'),
                          ),
                        ),
                        SizedBox(height: 48.0),
                        ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: [
                              Colors.white,
                              Color(0xFFE0E0FF),
                            ],
                          ).createShader(bounds),
                          child: Text(
                            "Welcome Back!",
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
                          "Sign in to continue",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFE0E0FF),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 48.0),
                        _buildTextField(
                          controller: _usernameController,
                          hintText: "Username",
                          icon: Icons.person,
                          errorText: _errorTextUsername,
                        ),
                        SizedBox(height: 16.0),
                        _buildPasswordField(),
                        SizedBox(height: 24.0),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                              color: Color(0xFFE0E0FF),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.0),
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
                            onPressed: () => _handleLogin(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4B45B2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24.0),
                        // Google Sign-In Button
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () => _handleGoogleSignIn(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            icon: Image.asset(
                              'assets/images/google_logo.png',
                              height: 24,
                              errorBuilder: (context, error, stackTrace) => Icon(Icons.login, color: Colors.red),
                            ),
                            label: Text(
                              "Sign in with Google",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(color: Color(0xFFE0E0FF)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        RegisterScreen(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Sign up",
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
        ],
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
        TextField(
          controller: controller,
          onChanged: (text) => setState(() {}),
          style: TextStyle(
            color: Color(0xFF222B45),
            fontSize: 16,
          ),
          decoration: AppTheme.textFieldDecoration(hintText, icon).copyWith(
            errorText: null,
            errorStyle: TextStyle(height: 0),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(
              icon,
              color: hasError ? Color(0xFFD32F2F) : Color(0xFF1976D2),
              size: 22,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: hasError ? Color(0xFFFFB4B4) : Color(0xFFE0E0E0),
                width: 1.2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: hasError ? Color(0xFFD32F2F) : Color(0xFF1976D2),
                width: 1.5,
              ),
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: EdgeInsets.only(left: 8, top: 6),
            child: Text(
              errorText!,
              style: TextStyle(
                color: Color(0xFFD32F2F),
                fontSize: 12,
                fontWeight: FontWeight.w400,
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
        TextField(
          controller: _passwordController,
          onChanged: (text) => setState(() {}),
          style: TextStyle(
            color: Color(0xFF222B45),
            fontSize: 16,
          ),
          obscureText: !_isPasswordVisible,
          decoration:
              AppTheme.textFieldDecoration("Password", Icons.lock).copyWith(
            errorText: null,
            errorStyle: TextStyle(height: 0),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.lock,
              color: hasError ? Color(0xFFD32F2F) : Color(0xFF1976D2),
              size: 22,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: hasError ? Color(0xFFD32F2F) : Color(0xFF1976D2),
                size: 22,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: hasError ? Color(0xFFFFB4B4) : Color(0xFFE0E0E0),
                width: 1.2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: hasError ? Color(0xFFD32F2F) : Color(0xFF1976D2),
                width: 1.5,
              ),
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: EdgeInsets.only(left: 8, top: 6),
            child: Text(
              _errorTextPassword!,
              style: TextStyle(
                color: Color(0xFFD32F2F),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
      ],
    );
  }
}
