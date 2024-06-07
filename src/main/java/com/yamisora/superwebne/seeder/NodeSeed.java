package com.yamisora.superwebne.seeder;

import java.io.FileReader;
import java.io.StringWriter;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.SimpleScriptContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import com.yamisora.superwebne.repository.NodeRepository;
import com.yamisora.superwebne.component.PythonRunner;
import javax.script.ScriptContext;

@Component
public class NodeSeed implements CommandLineRunner {
    public NodeSeed() {
        super();
    }

    @Autowired
    private NodeRepository nodeRepository;

    @Override
    public void run(String... args) throws Exception {
        NodeData();
    }

    public void NodeData() throws Exception {
        if (nodeRepository.count() == 0) {
            PythonRunner pythonRunner = new PythonRunner();
            pythonRunner.runScript("node_data.py");
            System.out.println("Node data has been seeded");
        }
    }
}
