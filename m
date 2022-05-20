Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE1052E2B3
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 04:50:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4B6S10hLz3bkL
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 12:50:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PFB4ILbR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PFB4ILbR; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4B3p1Swzz3bkQ
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 12:48:05 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 t11-20020a17090a6a0b00b001df6f318a8bso10308820pjj.4
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 19:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GEI1FA1mQ9xGFS7EtSwjOQXPWUXeFadWZPerzpqwRAc=;
 b=PFB4ILbRJm810cLegeLEsWT5rWG8WzpqER/rUGpXWgeZDbCZ/HRYrYX4wrPB/OG/bc
 fsoVNQDDprQmh9gNG7qVq11cg25gDw0VM7TsjUuiq4iaIXKTmiJEB5wK/EWMcr7u79BD
 ac3imQejy0qvvQ8N/9mbgsJnE3/1vcK+jsviEKwR2ywPck/sJhUsnqyGeoxtmDgf2BcE
 OcIZLxNjj2G6XcqN/0Nmunu4HhT9EuBtThnmjmt2Ison+dxCf+Ks+EAzYIpNR5NtY6bY
 70uyLc9gzN2iYSI2dbjYu7E5HHoHry3knPH3Gy+rkv2JJyAJcIRXRuZ05zNv8ignxcis
 fqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GEI1FA1mQ9xGFS7EtSwjOQXPWUXeFadWZPerzpqwRAc=;
 b=L0ytrtRm52665pb8+vFJT5Zt0OoWHwRj3qBCUlUU3e7BRNng0Tl9hK21mpVDX13V1b
 PtstEyP22rmwD2jSBwKHetK4YDiYXBHU+8krb7KrPG5aZx0g2xqIueeA75yOLpeKUVLb
 sI3wVXX4mDsqUJCHxOoZPx8lPxYts0rDTTwS5uU3a78sg7KZ3ybHVklM1BqBO4tYzoTF
 845uUBmMDgLXaPZBbUhvUV1zYuVk82V1bn6Gla0WbFc8J16g7RE8gezZRMnZVWD9jVRw
 Fz6y2nGInPpqhfB4YQO5q1qJ8769g1HwhqVFRbdzFU1VE/C/KMizu5X55+dQIeGq3gwi
 ncdQ==
X-Gm-Message-State: AOAM532hNkMITwrHLjepalXtpHlIXsx7yLLuXnXlwck3OKLpLBqCig6r
 fpN7WUUswLO29o7FACZeciI=
X-Google-Smtp-Source: ABdhPJzk268kD3hn+Ms+ZO5nQxmcrhq05zAdpEhaA4A37txo4wODOIaonE0GUjVc3BtPpsgoNQJluA==
X-Received: by 2002:a17:903:230e:b0:15e:d0a1:922f with SMTP id
 d14-20020a170903230e00b0015ed0a1922fmr7649488plh.75.1653014883673; 
 Thu, 19 May 2022 19:48:03 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 n9-20020a629709000000b0050df474e4d2sm379406pfe.218.2022.05.19.19.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 19:48:03 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] dt-bindings: arm/npcm: Add dt-bindings for Graphics
 Core Information
Date: Fri, 20 May 2022 10:47:42 +0800
Message-Id: <20220520024744.25655-4-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220520024744.25655-1-milkfafa@gmail.com>
References: <20220520024744.25655-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com,
 avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com,
 kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for Graphics Core Information (GFXI) node. It is
necessary for the NPCM Video Capture/Encode Engine driver to retrieve
Graphics core information.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 .../bindings/arm/npcm/nuvoton,gfxi.yaml       | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml

diff --git a/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
new file mode 100644
index 000000000000..5b785bda5739
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/npcm/nuvoton,gfxi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Graphics Core Information block in Nuvoton SoCs
+
+maintainers:
+  - Joseph Liu <kwliu@nuvoton.com>
+  - Marvin Lin <kflin@nuvoton.com>
+
+description:
+  The Graphics Core Information (GFXI) are a block of registers in Nuvoton SoCs
+  that analyzes Graphics core behavior and provides inforomation in registers.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nuvoton,npcm750-gfxi
+          - nuvoton,npcm845-gfxi
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    gfxi: gfxi@e000 {
+      compatible = "nuvoton,npcm750-gfxi", "syscon", "simple-mfd";
+      reg = <0xe000 0x100>;
+    };
-- 
2.17.1

