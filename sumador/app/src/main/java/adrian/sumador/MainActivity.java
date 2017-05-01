package adrian.sumador;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

     Button boton_mas,boton_menos;
      int counter =0;
      String valor = "";





    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        boton_mas = (Button) findViewById(R.id.button_mas);
        boton_menos = (Button) findViewById(R.id.button_menos);

        boton_mas.setOnClickListener(this);
        boton_menos.setOnClickListener(this);

    }

    @Override
    public void onClick(View v) {

        switch (v.getId()){

            case R.id.button_mas:
                counter=counter+10;
                valor = String.valueOf(counter);
                Intent actividad_2 = new Intent(MainActivity.this,SecondActivy.class);
                actividad_2.putExtra("dato",valor);
                startActivity(actividad_2);

                break;
            case R.id.button_menos:
                counter=counter-5;
                valor = String.valueOf(counter);
                Intent actividad_3 = new Intent(MainActivity.this,SecondActivy.class);
                actividad_3.putExtra("dato",valor);
                startActivity(actividad_3);

                break;

        }

    }
}
