import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/lesson_plan.dart';

class CreateLessonPlanScreen extends StatefulWidget {
  const CreateLessonPlanScreen({super.key});

  @override
  State<CreateLessonPlanScreen> createState() => _CreateLessonPlanScreenState();
}

class _CreateLessonPlanScreenState extends State<CreateLessonPlanScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _subjectController = TextEditingController();
  final _gradeController = TextEditingController();
  final _durationController = TextEditingController();
  final _objectivesController = TextEditingController();
  final _materialsController = TextEditingController();
  final _activitiesController = TextEditingController();
  final _assessmentController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedLevel = 'SD';
  final List<String> _levels = ['SD', 'SMP', 'SMA', 'Perguruan Tinggi'];

  @override
  void dispose() {
    _titleController.dispose();
    _subjectController.dispose();
    _gradeController.dispose();
    _durationController.dispose();
    _objectivesController.dispose();
    _materialsController.dispose();
    _activitiesController.dispose();
    _assessmentController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _saveLessonPlan() {
    if (_formKey.currentState!.validate()) {
      final lessonPlan = LessonPlan(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        subject: _subjectController.text,
        grade: _gradeController.text,
        level: _selectedLevel,
        duration: _durationController.text,
        objectives: _objectivesController.text,
        materials: _materialsController.text,
        activities: _activitiesController.text,
        assessment: _assessmentController.text,
        notes: _notesController.text,
        createdAt: DateTime.now(),
      );

      Navigator.pop(context, lessonPlan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buat Rencana Pembelajaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informasi Dasar',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Judul Pembelajaran *',
                        hintText: 'Contoh: Pengenalan Matematika Dasar',
                        prefixIcon: Icon(Icons.title),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Judul tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _subjectController,
                      decoration: const InputDecoration(
                        labelText: 'Mata Pelajaran *',
                        hintText: 'Contoh: Matematika',
                        prefixIcon: Icon(Icons.book),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mata pelajaran tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _selectedLevel,
                            decoration: const InputDecoration(
                              labelText: 'Tingkat Pendidikan *',
                              prefixIcon: Icon(Icons.school),
                              border: OutlineInputBorder(),
                            ),
                            items: _levels.map((String level) {
                              return DropdownMenuItem<String>(
                                value: level,
                                child: Text(level),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedLevel = newValue!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _gradeController,
                            decoration: const InputDecoration(
                              labelText: 'Kelas/Tingkat *',
                              hintText: 'Contoh: Kelas 1',
                              prefixIcon: Icon(Icons.class_),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Kelas tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _durationController,
                      decoration: const InputDecoration(
                        labelText: 'Durasi *',
                        hintText: 'Contoh: 2 x 45 menit',
                        prefixIcon: Icon(Icons.access_time),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Durasi tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tujuan Pembelajaran',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _objectivesController,
                      decoration: const InputDecoration(
                        labelText: 'Tujuan Pembelajaran *',
                        hintText: 'Tuliskan tujuan pembelajaran yang ingin dicapai...',
                        prefixIcon: Icon(Icons.flag),
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tujuan pembelajaran tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Materi & Sumber Belajar',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _materialsController,
                      decoration: const InputDecoration(
                        labelText: 'Materi & Sumber Belajar *',
                        hintText: 'Daftar materi, alat, dan sumber belajar yang digunakan...',
                        prefixIcon: Icon(Icons.library_books),
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Materi tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kegiatan Pembelajaran',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _activitiesController,
                      decoration: const InputDecoration(
                        labelText: 'Langkah-langkah Kegiatan *',
                        hintText: 'Tuliskan kegiatan pembukaan, inti, dan penutup...',
                        prefixIcon: Icon(Icons.checklist),
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 8,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kegiatan pembelajaran tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Penilaian & Evaluasi',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _assessmentController,
                      decoration: const InputDecoration(
                        labelText: 'Metode Penilaian *',
                        hintText: 'Tuliskan cara penilaian dan evaluasi pembelajaran...',
                        prefixIcon: Icon(Icons.assignment),
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Metode penilaian tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Catatan Tambahan',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(
                        labelText: 'Catatan (Opsional)',
                        hintText: 'Catatan tambahan atau refleksi...',
                        prefixIcon: Icon(Icons.note),
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _saveLessonPlan,
              icon: const Icon(Icons.save),
              label: const Text(
                'Simpan Rencana Pembelajaran',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}