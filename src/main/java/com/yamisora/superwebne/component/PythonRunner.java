package com.yamisora.superwebne.component;

import java.io.StringWriter;

import javax.script.ScriptContext;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.SimpleScriptContext;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.FileReader;

public class PythonRunner {
    private ProcessBuilder processBuilder;
    private Process process;

    public PythonRunner() {
        this.processBuilder = new ProcessBuilder();
    }

    public void runScript(String filename) {
        try {
            processBuilder.command("python3", resolvePythonScriptPath(filename));
            processBuilder.redirectErrorStream(true);
            this.process = processBuilder.start();
            int exitCode = process.waitFor();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String resolvePythonScriptPath(String scriptName) {
        return "src/main/resources/python/" + scriptName;
    }
}
