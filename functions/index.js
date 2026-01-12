const { onRequest } = require("firebase-functions/v2/https");
const { defineSecret } = require("firebase-functions/params");
const { GoogleGenerativeAI } = require("@google/generative-ai");

const GEMINI_API_KEY = defineSecret("GEMINI_API_KEY");

const APP_GUIDE = `
APP GUIDE:
- Home: Weather, Market Prices, Tips.
- Weather: Home → Weather card → Tap for details.
- Market Prices: Home → Market.
- Profile: Menu (top right) → Profile.
- Support: Bottom navigation → Help.
- Language: Profile → Settings → Language.
Rules:
- Answer only app navigation and "how to use" questions.
- Keep answers short, numbered steps if needed.
- If asked for farming advice, say: "Open Tips on Home for safe advice."
`;

exports.askChatbot = onRequest(
  {
    region: "us-central1",
    cors: true,
    timeoutSeconds: 30,
    memory: "512MiB",
    secrets: [GEMINI_API_KEY],
  },
  async (req, res) => {
    try {
      if (req.method === "OPTIONS") return res.status(204).send("");
      if (req.method !== "POST") return res.status(405).json({ error: "Use POST" });

      const { question = "", lang = "en" } = req.body || {};
      if (!question.trim()) return res.status(400).json({ error: "Missing 'question'" });

      // Debug: check if secret is loaded
      console.log("GEMINI_API_KEY exists?", !!GEMINI_API_KEY.value());

      const genAI = new GoogleGenerativeAI(GEMINI_API_KEY.value());
      const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

      const prompt = `You are an in-app assistant that helps farmers navigate the app.
Use ${lang} for your reply.
${APP_GUIDE}

Farmer question: ${question}
Reply clearly. If a task has multiple taps, give step-by-step steps.
      `.trim();

      const result = await model.generateContent(prompt);
      const answer = result.response.text();

      return res.status(200).json({ answer });
    } catch (err) {
      console.error("Chatbot function error:", err);
      return res.status(500).json({ error: err.message || "Server error" });
    }
  }
);
