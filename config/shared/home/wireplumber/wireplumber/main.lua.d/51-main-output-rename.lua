rule = {
    matches = {
        {
            { "node.name", "equals", "alsa_output.pci-0000_0a_00.4.analog-stereo" },
        },
    },
    apply_properties = {
        ["node.description"] = "system output",
        ["node.nick"] = "system output",
    },
}

table.insert(alsa_monitor.rules, rule)
