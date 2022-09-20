package com.example.bank_sbm

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        var button : Button = findViewById(R.id.to_sbm)

        button.setOnClickListener {
            onClick()
        }
    }

    private fun onClick() {
        val intent = Intent(this, dummy::class.java)
        startActivity(intent)
    }
}