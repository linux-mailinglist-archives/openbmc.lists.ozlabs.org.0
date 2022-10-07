Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5663F5F72F6
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 04:58:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkCg512wTz3cBR
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 13:58:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O2cL/D8X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O2cL/D8X;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkCbS1kq9z2ywm
	for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2022 13:55:16 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id o9-20020a17090a0a0900b0020ad4e758b3so3503425pjo.4
        for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2022 19:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpUM4DPw4PRlVAAk+U/JNafDpQLlQw9oEkCZcgNX0RU=;
        b=O2cL/D8XypjmzxiiDJ0LRlolXP/zm0yuw/3NFnM6iads4UkPY42lGET59uofF88FRV
         i5TWGw8BFziXYTBLy3xTYFAP9Dzl/7wpp5XRZPtkJwWUlG3YNgMnC0r8KTIX2wBVcemy
         d1E6d0Cu0Y6eO96EI3OJysh44FkjAXJhVgWEgdGZOI4d3nxGP5FbE3AwG3Ji51HVovZZ
         JKbi9eFeECgCMXy0JDAsJ0iUkODVNlGqDMzlBrFUTADNlBP3fnxVbq4bhUc38+bVHnsR
         IaW9KtEU8IvI7rdbbosnDspTfTFgWs+hZqDPliQmFEX3kH1560oWk5TZUD3vgcjqvus6
         v2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpUM4DPw4PRlVAAk+U/JNafDpQLlQw9oEkCZcgNX0RU=;
        b=1UcX/ns6BzsBnwnaVrUy88BaSMS8QiFJI8zqmNFQexfLR4iJKvyNIENyIUX/b3Ucqw
         dyUqqpIBgDsffRB4okzjEcaQtIbkR56U4uP0xPZHmy9+dURIF0CSRd9jcq5sAEymwlTg
         6VHLmQz4JgVVQU7avDFTMUYQkc9pnB40jrNgiAjyFnEcJkfXES+0W9/Yo5GiInj0R8N3
         sOa6HFuGda9SsLqsHULzzJacqJVpan3mPqrNqtZIbsTA2YWtWVsJe1A0ASjsrj7dGLty
         yRFVhN0am7lb8stHuh9SkOlH3Ls/xjmCYcZRo0GT5aYU+aRbKk8C3yRi100O5gaOz4T9
         HH5A==
X-Gm-Message-State: ACrzQf2vcBzYk+RsD5/HgKt93RpsWtlgDgPqkq/iT6jEz6GF12MtMD/j
	iZA4ZSc4JVqNtxxz9NJkBjw5V1yFsHkP9w==
X-Google-Smtp-Source: AMsMyM4vUR4wmem6qAyqQm21jEAuXbAIud+10BqRGmmKaHsdxTY9YYJWCefJkw2sT2tZVDlg01YHtw==
X-Received: by 2002:a17:902:e54b:b0:178:75b9:f1e9 with SMTP id n11-20020a170902e54b00b0017875b9f1e9mr2598544plf.104.1665111314143;
        Thu, 06 Oct 2022 19:55:14 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id h12-20020a63574c000000b0041c0c9c0072sm476944pgm.64.2022.10.06.19.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 19:55:13 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v1 3/5] dt-bindings: arm/npcm: Add dt-bindings for Graphics Core Information
Date: Fri,  7 Oct 2022 10:54:11 +0800
Message-Id: <20221007025413.3549628-4-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221007025413.3549628-1-milkfafa@gmail.com>
References: <20221007025413.3549628-1-milkfafa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: andrew@aj.id.au, kflin@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, joel@jms.id.au, tmaimon77@gmail.com
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
2.34.1

