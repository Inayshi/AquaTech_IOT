import 'package:aquatech/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

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
            child: PdfViewerPage(),
          ),
        ],
      ),
    );
  }
}

class PdfViewerPage extends StatefulWidget {
  const PdfViewerPage({Key? key}) : super(key: key);

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  int _pageNumber = 1;
  bool _isLoading = true;
  int _totalPages = 0;

  late PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PDFView(
          filePath:
              'assets/pdf/Information.pdf', // Replace with your PDF file path
          autoSpacing: true,
          pageFling: true,
          onRender: (_pages) {
            print('PDF Rendered: $_pages pages');
            setState(() {
              _totalPages = _pages!;
              _isLoading = false;
            });
          },
          onViewCreated: (PDFViewController viewController) {
            _pdfViewController = viewController;
          },
        ),
        if (_isLoading)
          Center(
            child: CircularProgressIndicator(),
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_pageNumber > 1) {
                    _pageNumber--;
                    _pdfViewController.setPage(_pageNumber);
                  }
                },
                child: Icon(Icons.chevron_left),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_pageNumber < _totalPages) {
                    _pageNumber++;
                    _pdfViewController.setPage(_pageNumber);
                  }
                },
                child: Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
