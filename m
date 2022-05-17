Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3B7529E19
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 11:31:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2W92109lz3brt
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 19:31:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aXyC3ZS5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aXyC3ZS5; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2W721Ml2z3c7K
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 19:30:05 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso1782189pjg.0
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 02:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mFpRGtOmuIhiGD7D0FWLTSmGnj4Hu/mNhuuhhbY9Ebg=;
 b=aXyC3ZS5t7ipijq1PXlVXuX3XGBsirl0S7jfGDm4yUhUHLDQYRTd4R5YIQ8tLLRztB
 B5KPuRLsTMgTFr9zzE977+yCjloFEt++bS7dPBsgXAVfvWXopQOPXxS5Z9t4Ev4k6dfp
 iTW2jbRxT2B/SRkSs4FGw3SxFaYV+yY5XrXrwcwRZf93wD8GUYz+fZsDDT1lUnTk6cy4
 HSpBW502WQg+L435HiGmmmHKm6MeSYvgAlklcFt2PPVbwrsxeAJ3tL5BbHyM3F9NPZJB
 zAd+aX3S3sRo6R4bq2HaiQnx/W1Q50GKaHaH24bNGusqmkN8vbabSGrN7+W82qpkxpj0
 gCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mFpRGtOmuIhiGD7D0FWLTSmGnj4Hu/mNhuuhhbY9Ebg=;
 b=aAwMshxzWmCJRPoPK1xj6xohVDfakiSx5lK0f2U0oNlw2HjzKSgnbW40tabU89ePET
 tZq1oNbQ21w6XlfFpC+bxRs4Bx0B64G1ntdt+BwKWp6HbwgW64y4RZQIZBC/o+LwYOoo
 LM4tt2a32PqixL9ZLd8ZCE5WQoYSJ0JmZIp9xalqohzLg+hNuhDNYOGD4Q5u2UU7zqPV
 T/CWqosFzZx4o54VX8L2KD3RdoXfcIIXzvQalQUsLux9x2KKjQ2BaXPI/BJa5DiB9h9E
 URAxX9bIkE1FvjPksRwWG8ul6mbb1BDDiq8ffBWDudGUW8tav9Jmxse62UEqTkjHlUxK
 dG9w==
X-Gm-Message-State: AOAM5308HrV7+rMpCIdJfyJQxLK/jK1lER6nD0dT8BgllosfbnqPFDHE
 znRgcQ727x7f37YcOmxsT2k=
X-Google-Smtp-Source: ABdhPJwF8mVQzn32mkC4c739pbMqoY9M06OPC/8qZo1KmO0MYhQsrCFE63IMXhM1UsvIBWvt82xGNw==
X-Received: by 2002:a17:90b:3843:b0:1dc:3da2:7fd8 with SMTP id
 nl3-20020a17090b384300b001dc3da27fd8mr23870463pjb.219.1652779803774; 
 Tue, 17 May 2022 02:30:03 -0700 (PDT)
Received: from localhost.localdomain ([116.89.131.16])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a62b411000000b0050df474e4d2sm8399720pfn.218.2022.05.17.02.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:30:03 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: benjaminfair@google.com, yuenn@google.com, venture@google.com,
 tali.perry1@gmail.com, tmaimon77@gmail.com, avifishman70@gmail.com,
 robh+dt@kernel.org, alexandre.belloni@bootlin.com, a.zummo@towertech.it,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, ctcchien@nuvoton.com
Subject: [PATCH v2 2/3] dt-bindings: rtc: nuvoton: add NCT3018Y Real Time Clock
Date: Tue, 17 May 2022 17:29:25 +0800
Message-Id: <20220517092927.19537-3-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517092927.19537-1-ctcchien@nuvoton.com>
References: <20220517092927.19537-1-ctcchien@nuvoton.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document devicetree bindings for the Nuvoton NCT3018Y Real Time Clock.

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 .../bindings/rtc/nuvoton,nct3018y.yaml        | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
new file mode 100644
index 000000000000..788d92a32a70
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nuvoton,nct3018y.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NUVOTON NCT3018Y Real Time Clock
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Medad CChien <ctcchien@nuvoton.com>
+
+properties:
+  compatible:
+    const: nuvoton,nct3018y
+
+  reg:
+    maxItems: 1
+
+  start-year: true
+
+  reset-source: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@6f {
+            compatible = "nuvoton,nct3018y";
+            reg = <0x6f>;
+        };
+    };
+
+...
-- 
2.17.1

