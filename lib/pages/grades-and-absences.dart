// ignore: file_names
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:f290_dsm_pdm2_siga_2/main.dart';

class GradesAbsencesPage extends StatefulWidget {
  const GradesAbsencesPage({Key? key}) : super(key: key);

  @override
  _GradesAbsencesPageState createState() => _GradesAbsencesPageState();
}

class _GradesAbsencesPageState extends State<GradesAbsencesPage> {
  var _semesters = [];
  var _matters = [];
  int? _selectedSemesterId;
  int? _selectedMattersId;
  var _loading = true;
  var _gradesAbsences = {};

  @override
  void initState() {
    super.initState();
    _fetchSemesters();
  }

  Future<void> _fetchSemesters() async {
    setState(() {
      _loading = true;
    });
    _semesters = [];
    try {
      final data = await supabase.from('semester').select();
      _semesters = data;
    } on PostgrestException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Um erro inesperado aconteceu.'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _fetchMatters() async {
    _matters = [];
    _selectedMattersId = null;
    _gradesAbsences = {};
    setState(() {
      _loading = true;
    });
    try {
      final data = await supabase
          .from('matter')
          .select()
          .eq('semester_id', _selectedSemesterId);
      _matters = data;
    } on PostgrestException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Um erro inesperado aconteceu.'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _fetchGradesAbsences() async {
    _gradesAbsences = {};
    setState(() {
      _loading = true;
    });
    try {
      final userId = supabase.auth.currentUser!.id;
      final data = await supabase
          .from('grades_absences')
          .select()
          .eq('profile_id', userId)
          .eq('matter_id', _selectedMattersId)
          .single();

      _gradesAbsences = data;
      print(_gradesAbsences);
    } on PostgrestException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Um erro inesperado aconteceu.'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  void _handleSemesterSelection(int index) {
    setState(() {
      _selectedSemesterId = _semesters[index]['id'];
    });
    _fetchMatters();
  }

  void _handleMattersSelection(int index) {
    setState(() {
      _selectedMattersId = _matters[index]['id'];
    });
    _fetchGradesAbsences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Siga 2.0 - Notas e Faltas')),
      body: _loading || _semesters.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const SizedBox(height: 25),
                SizedBox(
                  child: Center(
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(
                        _semesters.length,
                        (index) => Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color:
                                _selectedSemesterId != _semesters[index]['id']
                                    ? Colors.red[900]
                                    : Colors.green[900],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child: ToggleButtons(
                              borderColor: Colors.transparent,
                              isSelected: [
                                _selectedSemesterId == _semesters[index]['id']
                              ],
                              onPressed: (intParam) =>
                                  _handleSemesterSelection(index),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    _semesters[index]['description'],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  child: Center(
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(
                        _matters.length,
                        (index) => Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: _selectedMattersId != _matters[index]['id']
                                ? Colors.red[900]
                                : Colors.green[900],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child: ToggleButtons(
                              borderColor: Colors.transparent,
                              isSelected: [
                                _selectedMattersId == _matters[index]['id']
                              ],
                              onPressed: (intParam) =>
                                  _handleMattersSelection(index),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    _matters[index]['description'],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  child: Center(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              _gradesAbsences['grades'] != null
                                  ? 'Nota: ${_gradesAbsences['grades']}'
                                  : '',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 24),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              _gradesAbsences['absences'] != null
                                  ? 'Faltas: ${_gradesAbsences['absences']}'
                                  : '',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
