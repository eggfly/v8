# Copyright 2020 the V8 project authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

load("//lib/lib.star", "GOMA", "RECLIENT", "v8_builder")

def chromium_builder(name):
    v8_builder(
        name = name,
        bucket = "ci",
        triggered_by = ["chromium-trigger"],
        executable = "recipe:chromium",
        dimensions = {"os": "Ubuntu-18.04", "cpu": "x86-64"},
        properties = {"builder_group": "client.v8.chromium"},
        use_goma = GOMA.NO,
        use_remoteexec = RECLIENT.DEFAULT,
        in_console = "chromium/Future",
        disable_resultdb_exports = True,
    )

chromium_builder("Linux - Future")

chromium_builder("Linux - Future (dbg)")

chromium_builder("Linux V8 API Stability")