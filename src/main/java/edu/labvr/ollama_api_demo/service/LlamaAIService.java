package edu.labvr.ollama_api_demo.service;

import org.springframework.ai.chat.model.ChatResponse;
import org.springframework.ai.chat.prompt.Prompt;
import org.springframework.ai.ollama.OllamaChatModel;
import org.springframework.ai.ollama.api.OllamaOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LlamaAIService {

    @Autowired
    private OllamaChatModel chatModel;

    public String generateResult(String prompt) {
        OllamaOptions options = new OllamaOptions();

        options.setModel("llama3.2:1b");

        ChatResponse response = chatModel.call(new Prompt(prompt, options));

        if (response != null) {
            return response.getResult().getOutput().getText();
        }

        return "Error: No hay respuesta recibida de Ollama API";
    }
}
