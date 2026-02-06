# Using ProjectLLM to Privately Chat with your Microsoft Excel Spreadsheets
Local and Private AI Chat with your Microsoft Excel Spreadsheets

Microsoft Excel allows you to create, manage, and analyze data in spreadsheet format. By attaching your spreadsheets directly to ProjectLLM, you can privately chat with the AI to query and explore the data, enabling you to summarize, generate reports, and glean insights from your files—all within your conversation.

<div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden;">
  <iframe src="../../assets/ProjectLLM_xlsx_attachment.mp4" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; border:0;" allowfullscreen title="YouTube Video"></iframe>
</div>


## Attach Microsoft Excel to your ProjectLLM Conversation

!!! note "Attach Microsoft Excel to your ProjectLLM Conversation"

    1. **Install ProjectLLM and Open **:

        - Go to [nomic.ai/ProjectLLM](https://nomic.ai/ProjectLLM) to install ProjectLLM for your operating system.

        - Navigate to the Chats view within ProjectLLM.

        <table>
            <tr>
               <td>
                  <!-- Screenshot of Chat view -->
                  <img width="1348" alt="Chat view" src="../../assets/chat_window.png">
               </td>
            </tr>
         </table>

    2. **Example Spreadsheet **:

        <table>
            <tr>
               <td>
                  <!-- Screenshot of Spreadsheet view -->
                  <img width="1348" alt="Spreadsheet view" src="../../assets/disney_spreadsheet.png">
               </td>
            </tr>
         </table>

    3. **Attach to ProjectLLM conversration**
        <table>
            <tr>
               <td>
                  <!-- Screenshot of Attach view -->
                  <img width="1348" alt="Attach view" src="../../assets/attach_spreadsheet.png">
               </td>
            </tr>
         </table>

    4. **Have ProjectLLM Summarize and Generate a Report**
        <table>
            <tr>
               <td>
                  <!-- Screenshot of Attach view -->
                  <img width="1348" alt="Attach view" src="../../assets/spreadsheet_chat.png">
               </td>
            </tr>
         </table>


## How It Works

ProjectLLM parses your attached excel spreadsheet into Markdown, a format understandable to LLMs, and adds the markdown text to the context for your LLM chat. You can view the code that converts `.xslx` to Markdown [here](https://github.com/nomic-ai/ProjectLLM/blob/main/ProjectLLM-chat/src/xlsxtomd.cpp) in the ProjectLLM github repo.

For example, the above spreadsheet titled `disney_income_stmt.xlsx` would be formatted the following way:

```markdown
## disney_income_stmt

|Walt Disney Co.|||||||
|---|---|---|---|---|---|---|
|Consolidated Income Statement|||||||
|||||||||
|US$ in millions|||||||
|12 months ended:|2023-09-30 00:00:00|2022-10-01 00:00:00|2021-10-02 00:00:00|2020-10-03 00:00:00|2019-09-28 00:00:00|2018-09-29 00:00:00|
|Services|79562|74200|61768|59265|60542|50869|
...
...
...
```

## Limitations

It is important to double-check the claims LLMs make about the spreadsheets you provide. LLMs can make mistakes about the data they are presented, particularly for the LLMs with smaller parameter counts (~8B) that fit within the memory of consumer hardware.