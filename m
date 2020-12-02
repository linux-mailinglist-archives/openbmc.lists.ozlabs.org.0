Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0644E2CC2EE
	for <lists+openbmc@lfdr.de>; Wed,  2 Dec 2020 18:02:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmQHp0bP4zDqj1
	for <lists+openbmc@lfdr.de>; Thu,  3 Dec 2020 04:02:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com;
 envelope-from=3osfhxwukb-sxhalvtbbtyr.pbzbcraozpyvfgf.bmynof.bet@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=PYM0+hMc; dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmQ9H3L1gzDr3X
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2020 03:56:29 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id ba3so1383943plb.9
 for <openbmc@lists.ozlabs.org>; Wed, 02 Dec 2020 08:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=yv6jkOMVVu0NxKOBrd1YDUszNsTB64/IwLRfmacssjI=;
 b=PYM0+hMcoAZzkNbTQczmz7arAkA+YVllnBBKhKWWKcmGpJ1QOp4hhVjf43FBFF9n6S
 ydt8GpmEiSx3PU3+n3Eyjhwwf+3dMLLhl1PkXWbtsAfrW5xaCyJ6WW3WaAWLN6mbLW6+
 RbSPcHO8RyA92KQcn6J8wBjeuR/aMgUvBM9Qy7VHdvXL7R0a50xEFYy3Gntb6PUwBqMp
 NzzfOxvE+LMZNEdaUVBle9ELmAWhwVunHUDUYPYnRxoDGIVwcbSZ5Uea8zfJXuNduU9O
 cNBb62fOlNKhk+WmmrjwgVj5iHO2LPT7TIUWg8MZbxoejwZ70AMTh19mArWU9SWEX0Ia
 VPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=yv6jkOMVVu0NxKOBrd1YDUszNsTB64/IwLRfmacssjI=;
 b=GXk6sSkPDV8Xu8BldtNlLBRfPUcnoOrf29Zhqa6jH1LMHL78DgxYRGexAQsH0uSZ1Z
 O0bS7nme9yGZ0Ema1MEFwrDXpofZ89wpw7cqALeSIz3U0Bq9jsJov0XTpW16re7GuLnE
 jFEVay8Dy2VRLElX4dVbbZlDYxh2v0u/zHjlRs4QBoLzYw8+HqF+7G0ATNjlSVve1kYj
 4gblmLgCKBkPCm4RM1+wZW/kPCjaJl2gbgfrRIY30ff9vf92SyYN81yryap2NzxJQqRd
 RceyKKERRsGjY/RfLnaiYdGtxnc16HiN/OGNI7uQ5dYZfK/3ktq22Gj0MPL+HMOEev5Q
 FHWQ==
X-Gm-Message-State: AOAM531Q+//9valDj/T9vCf3YVxPcanyXkJffHnVjDYSPFyVfOCKgET/
 J0MmZc6NORAwnKnyL2/RbxEZ56+3zA==
X-Google-Smtp-Source: ABdhPJyuIA9Ylj0TkFWNUHgFriBZBpWCAwLq6S5wNq15FbwF2qPUczwByvyTGLSSlK1zs2GHSt2GKMIKPg==
X-Received: from kunyi0.svl.corp.google.com
 ([2620:15c:2c5:3:9657:a5ff:fef2:53bd])
 (user=kunyi job=sendgmr) by 2002:a17:90a:67cf:: with SMTP id
 g15mr723285pjm.24.1606928186050; Wed, 02 Dec 2020 08:56:26 -0800 (PST)
Date: Wed,  2 Dec 2020 08:56:01 -0800
In-Reply-To: <20201202165601.1532213-1-kunyi@google.com>
Message-Id: <20201202165601.1532213-4-kunyi@google.com>
Mime-Version: 1.0
References: <20201202165601.1532213-1-kunyi@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH linux hwmon-next v4 3/3] dt-bindings: (hwmon/sbtsi_tmep) Add
 SB-TSI hwmon driver bindings
From: Kun Yi <kunyi@google.com>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, 
 mark.rutland@arm.com, supreeth.venkatesh@amd.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document device tree bindings for AMD SB-TSI emulated temperature
sensor.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 .../devicetree/bindings/hwmon/amd,sbtsi.yaml  | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
new file mode 100644
index 000000000000..446b09f1ce94
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/amd,sbtsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: >
+  Sideband interface Temperature Sensor Interface (SB-TSI) compliant
+  AMD SoC temperature device
+
+maintainers:
+  - Kun Yi <kunyi@google.com>
+  - Supreeth Venkatesh <supreeth.venkatesh@amd.com>
+
+description: |
+  SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
+  interface that reports AMD SoC's Ttcl (normalized temperature),
+  and resembles a typical 8-pin remote temperature sensor's I2C interface
+  to BMC. The emulated thermal sensor can report temperatures in increments
+  of 0.125 degrees, ranging from 0 to 255.875.
+
+properties:
+  compatible:
+    enum:
+      - amd,sbtsi
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C bus address of the device as specified in Section 6.3.1 of the
+      SoC register reference. The SB-TSI address is normally 98h for socket
+      0 and 90h for socket 1, but it could vary based on hardware address
+      select pins.
+      \[open source SoC register reference\]
+        https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sbtsi@4c {
+                compatible = "amd,sbtsi";
+                reg = <0x4c>;
+        };
+    };
+...
-- 
2.29.2.454.gaff20da3a2-goog

