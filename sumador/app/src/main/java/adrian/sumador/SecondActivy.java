package adrian.sumador;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class SecondActivy extends AppCompatActivity {
        TextView texto;






    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second_activy);

        texto = (TextView) findViewById(R.id.textView);
        Intent valor = getIntent();
        Bundle suma = valor.getExtras();
        String dato = suma.getString("dato");
        texto.setText(dato);

    }
}
