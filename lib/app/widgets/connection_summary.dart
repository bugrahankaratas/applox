import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'connected_country_card.dart';
import 'connecting_time.dart';
import 'connection_network_information.dart';

class ConnectionSummary extends HookConsumerWidget {
  const ConnectionSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          ConnectingTime(),
          SizedBox(height: 24),
          ConnectedCountryCard(),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: ConnectionNetworkInformation()),
              const SizedBox(width: 16),
              // Connection Network Information
              Expanded(
                child: ConnectionNetworkInformation(
                  isDownload: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
