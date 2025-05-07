import 'package:flutter/material.dart';
import 'package:oso/app/navigation/routes.dart';

class ExampleScreen extends StatelessWidget {
  static final route = AppRoute.fromName(rName: 'example', requiresAuth: false);

  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Love Zone Theme')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration().copyWith(
                  hintText: 'Hint text',
                  helperText: 'Helper text',
                  labelText: 'Label text',
                ),
              ),

              SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('ElevatedButton'),
                ),
              ),

              SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(onPressed: () {}, child: Text('outline')),
              ),
              SizedBox(height: 12),
              CheckboxListTile(
                title: Text('Checked - check box tile'),
                value: true,
                onChanged: (state) {},
              ),
              SizedBox(height: 12),
              CheckboxListTile(
                title: Text('not check - check box tile'),
                value: false,
                onChanged: (state) {},
              ),

              SizedBox(height: 12),
              Row(
                children: [
                  OutlinedButton(onPressed: () {}, child: Text('outline row')),
                  Spacer(),
                  ElevatedButton(onPressed: () {}, child: Text('Elevated row')),
                ],
              ),

              SizedBox(height: 12),

              Chip(label: Text('Chip')),
              SizedBox(height: 4),
              ChoiceChip(label: Text('Selected - Choice chip'), selected: true),
              SizedBox(height: 4),
              ChoiceChip(
                label: Text('Not selected - Choice chip'),
                selected: false,
              ),

              /// display
              SizedBox(height: 12),
              Text(
                'displayLarge',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 12),
              Text(
                'displayMedium',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 12),
              Text(
                'displaySmall',
                style: Theme.of(context).textTheme.displaySmall,
              ),

              /// headline
              SizedBox(height: 12),
              Text(
                'headlineLarge',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 12),
              Text(
                'headlineMedium',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 12),
              Text(
                'headlineSmall',
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              /// title
              SizedBox(height: 12),
              Text('titleLarge', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 12),
              Text(
                'titleMedium',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 12),
              Text('titleSmall', style: Theme.of(context).textTheme.titleSmall),

              /// body
              SizedBox(height: 12),
              Text('bodyLarge', style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 12),
              Text('bodyMedium', style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 12),

              /// body
              Text('bodySmall', style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 12),
              Text('labelLarge', style: Theme.of(context).textTheme.labelLarge),
              SizedBox(height: 12),
              Text(
                'labelMedium',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 12),

              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
