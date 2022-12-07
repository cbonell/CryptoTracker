using Newtonsoft.Json;

namespace MoonTrading.DataAccess.MLModelAccess;
public class BertInput
{
    [JsonProperty]
    public long[] input_ids { get; set; } = { };

    [JsonProperty]
    public long[] token_type_ids { get; set; } = { };

    [JsonProperty]
    public long[] attention_mask { get; set; } = { };
}
