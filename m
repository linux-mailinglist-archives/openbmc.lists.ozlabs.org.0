Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DE56337C5
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 10:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGdXG5XyWz3cN5
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 20:01:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pnhW6tKc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pnhW6tKc;
	dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGdSg3WwFz3cJB
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 19:57:55 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 6so13512903pgm.6
        for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 00:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QxFvzBEseMTXAk5Jvzlkce9dFiJ2il9L5+/p6IBYfc=;
        b=pnhW6tKc7Iix9m89ow1QuJxbrLzebAZ4ATVfU3NcdQGTUgxy1NMQOg2lUfNFKKXYHU
         zLgmQBJ/mhN46QABh5yMzHvwxkKgB6EdzA+6I57r+JTP86LWYPAfrp0fLvRwVdJVRotn
         HaPK17BQ983IcUpTfsYMUBLtaLQl7rpDi8IgVzXdlBuswHRiYoQLEa0y7krQUy2Ur3ul
         B8w/OIHYBYSPGKLP5OgaqYOhaS8HQDQL0LMaKOLMeWa47tKlHPZK8+GUwSvx2rSocH/h
         kjeFVI0i2+f0twuTo1QsSj37uX3612wBElIyz924KxTyvdvEEvpaj/JWsjbn+gDGlz4D
         fsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QxFvzBEseMTXAk5Jvzlkce9dFiJ2il9L5+/p6IBYfc=;
        b=MPx5IpFCh4lmquaQaKmbBy3sRed8p8wAiYSYcvdP/A3RdS5Bd8lLKWPlZNls3B/2pM
         1RUx5bCk64ylB5tZUbhBr0DsnQQ2pDlFyStNbrAvEcdeiKGL+3SY/vI9DSni19S4QgFD
         idsLOnRbsjFBRld+wrtpncgtspyxquOXRrOp5Y7Hfv1m3RpU6CrOkzIjdCGHUJ4F5pVc
         5CeMvSZXLHACQpuVgdVQESjEBbgVj3WPUDviEsIO68/lnyiloIjxqciyKf2bK6LZfbgx
         8n6GP/icymVJL04GT1p1BH4Xpz0I4iZvHeQKy0sXFOkRGb4LNui486VISmXCuKiY6PEP
         lycw==
X-Gm-Message-State: ANoB5plZxCm+45gzDcLGwNb/r/CMChro/8OR/OZxg4a9M/Xjuj+CfPV4
	AgG7/ggpIAFqGvzl8oaIchI=
X-Google-Smtp-Source: AA0mqf79v+hNxUODIHjJkHCLqwtR6BYlOh8mu8/V/UZMVjP91iQc1EvU9lnDaviLyE/2ZR/mMHElag==
X-Received: by 2002:a05:6a00:21c8:b0:562:e0fb:3c79 with SMTP id t8-20020a056a0021c800b00562e0fb3c79mr3077062pfj.39.1669107473001;
        Tue, 22 Nov 2022 00:57:53 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090341c900b0017a0668befasm11400246ple.124.2022.11.22.00.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 00:57:52 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 3/7] dt-bindings: arm: nuvoton: Add bindings for NPCM GFXI
Date: Tue, 22 Nov 2022 16:57:20 +0800
Message-Id: <20221122085724.3245078-4-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122085724.3245078-1-milkfafa@gmail.com>
References: <20221122085724.3245078-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for Graphics Core Information (GFXI) node. It
is used by NPCM video driver to retrieve Graphics core information.

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

