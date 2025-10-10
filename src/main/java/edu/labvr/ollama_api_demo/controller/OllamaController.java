package edu.labvr.ollama_api_demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import edu.labvr.ollama_api_demo.service.LlamaAIService;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
public class OllamaController {

    @Autowired
    private LlamaAIService llamaAIService;

    @GetMapping("/api/v1/generate")
    public String generate(@RequestParam(value = "promptMessage") String promptMessage) {
        return llamaAIService.generateResult(promptMessage);
    }
}
