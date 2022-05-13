Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15774525A2E
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 05:37:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzvVC6tk9z3bqT
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 13:37:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZgzgYr/7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZgzgYr/7; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzvS535FRz3c88
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 13:35:49 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so7297011pjb.0
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 20:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xTHRu8kouNwhCxQDkX6+/ir1de51U8hSVFEEAos2UZc=;
 b=ZgzgYr/7IwtIwX17Nl80RJQkuH42xgVL2X8NHC+oLVlZeYzBJ9f+cLZu5enRwZ/IDb
 GIo6VG63M4e7uMrsslPxwg18nfDJ31TNFEpjsIvoPMCGLaCvi3KxlYx4s76ooByBe3zv
 YgMd6I3QYW5PwqrkqHPRuSrAjud7PUBirXub6VMDq7VWf5Zp4eGjdTLophshUxpHysOt
 OLbQE9JAZ0bdcm0pgfIJbIifDarBPXo+yIR0jeZOeYoDKPItAeYpl/NPzhACDyxGxiHo
 P1h8/lTP8EkfwjGZoIR5u0yrVQ2lU0e2WfwqS08aHEaAmb1XtsOqjOMnk0zbaEQdyJ6O
 7Myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xTHRu8kouNwhCxQDkX6+/ir1de51U8hSVFEEAos2UZc=;
 b=DqSWfoahwnXvkt+AunMi9I4E5RaVrwNlH+/fgrbOXblxAUnLc4Cg2ExWbGifB2+QI9
 zSxV3qL7N3NLFB366kQy+KO/fTJ4AIQHBqR1Yf8zYMN54uBIeck9UnYox1YDa+j1vSGb
 L/OwEYtVMuYehU/wR1mZa8boZ3fL562rfK0B+d/hiuVcyFwM6M/VC+O4EnIQR4bY+sCB
 TFeGNMIeiit+9SW7oMZhbacjjRsIN51VbghwUQFq8kbl5xX5TIhIZYS6+kYMPJItq6Kk
 n57IHtPswlAAWcCul9kWEBnat1tGHHMHJfA2S5jY7EsV76/NoqAtsDg9YeJ63OULXVPo
 vbKA==
X-Gm-Message-State: AOAM531Yz3yR/K4fpImp3pW71/H3vQ2NcPYumgVdgA5Npl2JBvi5ZSQt
 pI85o5By8GgXEyFkghFnt0g=
X-Google-Smtp-Source: ABdhPJyNEXhQeQ+VVIUQz4CI/DLo26wwI0/f5yoSq3Y6+jRozND3s2pZBaBFwMSv5cHeJXLDxAo5Fw==
X-Received: by 2002:a17:90b:380d:b0:1dc:8dc2:bb2c with SMTP id
 mq13-20020a17090b380d00b001dc8dc2bb2cmr13943721pjb.236.1652412947645; 
 Thu, 12 May 2022 20:35:47 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 b7-20020a1709027e0700b0015e8d4eb1c7sm685133plm.17.2022.05.12.20.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 20:35:44 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
X-Google-Original-From: Marvin Lin <kflin@nuvoton.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] dt-bindings: arm/npcm: Add dt-bindings for Graphics
 Core Information
Date: Fri, 13 May 2022 11:34:48 +0800
Message-Id: <20220513033450.7038-4-kflin@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220513033450.7038-1-kflin@nuvoton.com>
References: <20220513033450.7038-1-kflin@nuvoton.com>
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for Graphics Core Information (GFXI) node. It is
necessary for the NPCM Video Capture/Encode Engine driver to retrieve
Graphics core information.

Signed-off-by: Marvin Lin <kflin@nuvoton.com>
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

