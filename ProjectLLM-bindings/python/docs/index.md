# ProjectLLM Documentation

ProjectLLM runs large language models (LLMs) privately on everyday desktops & laptops. 

No API calls or GPUs required - you can just download the application and [get started](ProjectLLM_desktop/quickstart.md#quickstart).

!!! note "Desktop Application"
    ProjectLLM runs LLMs as an application on your computer. Nomic's embedding models can bring information from your local documents and files into your chats. It's fast, on-device, and completely **private**.

    <div style="text-align: center; margin-top: 20px;">
        [Download for Windows](https://ProjectLLM.io/installers/ProjectLLM-installer-win64.exe) &nbsp;&nbsp;&nbsp;&nbsp;
        [Download for Mac](https://ProjectLLM.io/installers/ProjectLLM-installer-darwin.dmg) &nbsp;&nbsp;&nbsp;&nbsp;
        [Download for Linux](https://ProjectLLM.io/installers/ProjectLLM-installer-linux.run)
    </div>

!!! note "Python SDK"
    Use ProjectLLM in Python to program with LLMs implemented with the [`llama.cpp`](https://github.com/ggerganov/llama.cpp) backend and [Nomic's C backend](https://github.com/nomic-ai/ProjectLLM/tree/main/ProjectLLM-backend). Nomic contributes to open source software like [`llama.cpp`](https://github.com/ggerganov/llama.cpp) to make LLMs accessible and efficient **for all**.

    ```bash
    pip install ProjectLLM
    ```

    ```python
    from ProjectLLM import ProjectLLM
    model = ProjectLLM("Meta-Llama-3-8B-Instruct.Q4_0.gguf") # downloads / loads a 4.66GB LLM
    with model.chat_session():
        print(model.generate("How can I run LLMs efficiently on my laptop?", max_tokens=1024))
    ```
