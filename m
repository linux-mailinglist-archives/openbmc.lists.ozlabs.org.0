Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DB05A1F00
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 04:44:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDPL51mhjz3bkb
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 12:44:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lTi2yQTg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lTi2yQTg;
	dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDPHg2kqMz3bTZ
	for <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2022 12:42:07 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id r69so218096pgr.2
        for <openbmc@lists.ozlabs.org>; Thu, 25 Aug 2022 19:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=GEI1FA1mQ9xGFS7EtSwjOQXPWUXeFadWZPerzpqwRAc=;
        b=lTi2yQTgmzHejEIWCtvdcyLoL81OolmQ75eQLXma5WZCLHSAGujGvHacP5dN0ROPnv
         infaQlkv5eVZQbAmowRG9kTDCr2d97tlghdu39OBOowNamjJb7HkjnbIOkTNly0XHW3j
         nBE/OcoowBo4HmLTU+eb/78VUnNEnl6Oq5uQHwAkYXe68YdR6lIr9iBRowearErW04lx
         0jwW/OvcOe1LPBxIUQuvxyekvgIgoA+8VdEg1etW76GSUh4VTKLDQ6Kg+Lc/pks5PHFW
         txOj35lnWwa6e0q7EF0Neg/b6EJk9B362ifE3aNizroJAuK4Nr7LOpqJ3mpWgNdTqU2J
         xakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=GEI1FA1mQ9xGFS7EtSwjOQXPWUXeFadWZPerzpqwRAc=;
        b=Jnmrt2jTSFRlgYQ4ZzXdv6hnYI2XAmTUi6GaEHY5AJSnpLxVFEJgP6YfIHWDyd5gIi
         KwK9WsWm93KfYyYl+sEMyRB5GjzDOGoMCTPgDg6gdX/MV0ukKUsHPz0naS5wcTNEOivd
         34CdYLXSW/rNT4yG/aazii+ew1h61BxxttuqCWuyqK1fd6xgE+p84KLSE+hB7oAWRcJX
         XWXs4p71oU+9a/5R53/gwT6JF/o/5QRKG2Nap7nuYLrmaXnaQWDFXfCwbVzaMWZH4/TL
         rP7X5k+I55v1bbikBdoAUrr1nPmY1vA759dkMjAXl+D03+dE3yKF7Av5qN/cnniVX5rq
         foxQ==
X-Gm-Message-State: ACgBeo0fh2mNlksKxXhm88F0A6ivVAkWExl7yJ7ze5FvYhUScixk8wPC
	TRcneAomWXCsjG0nGk45axE=
X-Google-Smtp-Source: AA6agR67rBv6+FhMk6AxnRgAPADvznHO5LhvB/IMh7Ea1QNP+S9PD6+fZnePPKP1wA+yDJIc0xvVFA==
X-Received: by 2002:a63:6a48:0:b0:42a:3cab:cc36 with SMTP id f69-20020a636a48000000b0042a3cabcc36mr1581147pgc.135.1661481725147;
        Thu, 25 Aug 2022 19:42:05 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id s34-20020a17090a69a500b001f021cdd73dsm444473pjj.10.2022.08.25.19.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:42:04 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/5] dt-bindings: arm/npcm: Add dt-bindings for Graphics Core Information
Date: Fri, 26 Aug 2022 10:41:22 +0800
Message-Id: <20220826024124.22747-4-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220826024124.22747-1-milkfafa@gmail.com>
References: <20220826024124.22747-1-milkfafa@gmail.com>
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

