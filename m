Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 920AC2D8175
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 23:00:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ct4Tp6xM6zDqyP
	for <lists+openbmc@lfdr.de>; Sat, 12 Dec 2020 09:00:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com;
 envelope-from=3oertxwukb8o0a3eyw44w1u.s4245u3r2s1y898.4f1qr8.47w@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=gcJ3yqiJ; dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ct4MG48m6zDqwt
 for <openbmc@lists.ozlabs.org>; Sat, 12 Dec 2020 08:54:44 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 139so4241312pgd.11
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 13:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=Rd2S5ERIdpxDDi+uhK9cbjd0vF+3SVBwWriC0JcpU0w=;
 b=gcJ3yqiJW+gv6J7pXNellIYo6U1XVjhUnAoDf0KYKfq8Z48dh+sC5vdboDhaA2v7dc
 TKPgf+FFKcXPFTbfqrq3TZp01YbZ147AAU0vwFHu8SfF2JhCRMLpGdxGICdULZXprzIq
 IMZL836rPQhkRoipkuUo31PvlOYVa8pUzX+n9sl6YngFpIAVx79gvPRp4Lx5FSu5AJmG
 sCq5Ip77METDR0YTxE6GT9fvcLTLai4M7/mZdFkFyMW1SD+19yBv+BYHks232/kn5p9D
 SMKLWXUc3ZgueHEpv2jAFW16BYFIAtV2wa0G1NykSQM9veoT26ODprUixchAnkEjKgEj
 j/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Rd2S5ERIdpxDDi+uhK9cbjd0vF+3SVBwWriC0JcpU0w=;
 b=lky+hDC8IOvg7Irdx2DWioQOeuAguf/e+15T9B8JyUdcp7WqYlJBCfoZH1iX8god3i
 ur8TYOFKA7uhtbH23314RkuQRlAkUvKlkwsCYSixwc3i0totHSdM+GPg4p2KZh7tYlGL
 LxYeARk5OMRZCJhPAJTuEzkUzhC1XJsCbetiSLDYf+/qjHa0iiDlfbNQOdzEAVFNR/nI
 jqoOtwDt/8wS2JkKUtWk5qZ82FoqL8wwIBPT1Sy4U28E6ILWnVNxx7QWY/kaZb/Zc2r2
 G7XLMeIX/smx8YGHV+jdV2avWHfEMf44YtJM/+FwLOUJUL/tmqv2u12B5e6NSqmE3aXd
 7w3Q==
X-Gm-Message-State: AOAM532aqqv5f5m4dato8rToYFXM46fSn44A/glqwVLusWqAOhVnUJh+
 PE5p0wBOVtytoQ5jW7pstUqf5fKUng==
X-Google-Smtp-Source: ABdhPJxUhEx4SmtYdScxsFigf7h0fO4fVDEuEiEtJX/93EAJekijNmsU2fzEHRMav02QofkK1LRhvKb0Gw==
X-Received: from kunyi0.svl.corp.google.com
 ([2620:15c:2c5:3:9657:a5ff:fef2:53bd])
 (user=kunyi job=sendgmr) by 2002:a17:90a:4dcd:: with SMTP id
 r13mr14803802pjl.74.1607723681302; Fri, 11 Dec 2020 13:54:41 -0800 (PST)
Date: Fri, 11 Dec 2020 13:54:27 -0800
In-Reply-To: <20201211215427.3281681-1-kunyi@google.com>
Message-Id: <20201211215427.3281681-4-kunyi@google.com>
Mime-Version: 1.0
References: <20201211215427.3281681-1-kunyi@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH linux hwmon-next v5 3/3] dt-bindings: (hwmon/sbtsi_tmep) Add
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
2.29.2.684.gfbc64c5ab5-goog

