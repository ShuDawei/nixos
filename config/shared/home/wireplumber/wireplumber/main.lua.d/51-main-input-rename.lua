rule = {
    matches = {
        {
            { "node.name", "equals", "alsa_input.pci-0000_0a_00.4.analog-stereo" },
        },
    },
    apply_properties = {
        ["node.description"] = "system input",
        ["node.nick"] = "system input",
    },
}

table.insert(alsa_monitor.rules, rule)
