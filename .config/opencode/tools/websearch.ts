import { tool } from "@opencode-ai/plugin"

export const v1 = tool({
  description: "Search engine to search the web using private SearXNG instance",
  args: {
    query: tool.schema.string().describe("The search query to look up"),
  },
  async execute({ query }) {
    const baseUrl = "https://search.lilay.dev/search";

    // Construct the search URL with required JSON parameters
    const params = new URLSearchParams({
      q: query,
      format: "json",
      language: "en-US", // Optional: specify your preferred language
      categories: "general" // Optional: focus on general web results
    });

    try {
      const response = await fetch(`${baseUrl}?${params.toString()}`);

      if (!response.ok) {
        throw new Error(`SearXNG error: ${response.status} ${response.statusText}`);
      }

      const data = await response.json();

      // SearXNG returns results in a 'results' array
      if (!data.results || data.results.length === 0) {
        return `No results found for: ${query}`;
      }

      // Map the results to a concise string format for the AI to process
      const formattedResults = data.results
        .slice(0, 5) // Limit to top 5 results to keep context window clean
        .map((res: any) => `Title: ${res.title}\nURL: ${res.url}\nContent: ${res.content}\n---`)
        .join("\n");

      return `Search results for "${query}":\n\n${formattedResults}\n\n---\n\n**Next Step**: Use the \`webfetch\` tool to fetch the full content from the most relevant URL(s) above. Select URL(s) that best match your search intent for detailed information.`;

    } catch (error) {
      return `Error performing search: ${error instanceof Error ? error.message : String(error)}`;
    }
  },
})
