package com.criticalarc.safezonelauncher;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

public class SafeZoneLauncher extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_safe_zone_launcher);

        findViewById(R.id.button).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                launchSafeZone();
            }
        });
    }

    private void launchSafeZone() {
        final Uri safeZoneUri = Uri.parse("com.criticalarc.safezoneapp://launch");
        final Uri safeZoneMarketUri = Uri.parse("market://details?id=com.criticalarc.safezoneapp");

        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(safeZoneUri);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

        if(intent.resolveActivity(getPackageManager()) != null) {
            startActivity(intent);
        }else {
            Intent marketIntent = new Intent(Intent.ACTION_VIEW);
            marketIntent.setData(safeZoneMarketUri);
            try {
                startActivity(marketIntent);
            } catch (ActivityNotFoundException exception) {
                // Android Market not available.
                Toast.makeText(this,
                        "Please install SafeZone from the Android Market.",
                        Toast.LENGTH_SHORT).show();
            }
        }
    }
}
