Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E7A78A8D5
	for <lists+openbmc@lfdr.de>; Mon, 28 Aug 2023 11:22:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=mh7Hp0R/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZ4pm0xpPz3c28
	for <lists+openbmc@lfdr.de>; Mon, 28 Aug 2023 19:22:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=mh7Hp0R/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ4lD4lBWz3bt2
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 19:19:52 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bdf4752c3cso15844685ad.2
        for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693214390; x=1693819190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OHbfvvmaSbzlb/vBLJ9aFEGcvRSExJ6vAXO7h1XWQ4=;
        b=mh7Hp0R/kf8Ws+jTMclnO2QDTU/wesK2pROJO9sHkrEaWW0eIPii5oiVQORAAFS9No
         rzrXQYT1PPug9skQf+6QNijsN/MzCHyQTzPLGX8YP+gKN6FZlN3sP3yNmwVc5HRpg79F
         R4un3r4WjfVIlCiY1icU6nS86Mg6s7AxgP5zHquH2TuXyGTWgeTmKOTJ4hGZW2M25Ofa
         RkL6tFuLET1WyuSlvIM3GLukK/yCHUUp7rxXvJBuxhgAtSc4IeGT4BITkX+Cc++fieUh
         J5Z9pLVTxEA773GsTHUyswClufBpoLPPDdORTH/lFxhcajJERDHEJL2GCpgUcPbWQ5/b
         2GUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693214390; x=1693819190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OHbfvvmaSbzlb/vBLJ9aFEGcvRSExJ6vAXO7h1XWQ4=;
        b=XMAsCgNTvfYz7XGsH0Sus/gYqWAQWzLNy54S9pBYBbyE5oypMdO1mTgoWF6ipJcNAu
         JccnfsVbKtiCz3m3DUdQWCt1Xk6RHqZHZFwU0Nidw/ZITzUXfP6f4+Z7pQqNkzm1Z0v6
         G8cLH+k7uyDOISlDk/jtrktJ2H7iv0YDghSm4QaNa3e9GAX/oxS5W4yIKFjFgHUWFLHl
         ghhCt/IPxn85TZW/w/tPIjrRdoK+3xHnW8m/Hhsb5YRoWSsYjuajkLJpmAEcJ3vcQqPd
         tb5Ri82vcuMiIa2nxUcRWj71FXIuU2X+Yf71HOtJOhbLzUWGNlPmynZjvJGIKt0S/pAK
         YOnw==
X-Gm-Message-State: AOJu0YwMbszlaZbtHwN5xGjtpQe6uunexd6odEH6qZHNKUbC0s6gkkFJ
	wVUtW1EMZ+A/efNzgtV2m2c=
X-Google-Smtp-Source: AGHT+IHOC5XdHJ8CtmcsbvcH3h1wkF6dmjhu/NfrVoER9ICsuph4ojjJIRDBeNQTrQc9gzwgTuR46g==
X-Received: by 2002:a17:903:234e:b0:1b5:64a4:bea0 with SMTP id c14-20020a170903234e00b001b564a4bea0mr20910114plh.10.1693214390421;
        Mon, 28 Aug 2023 02:19:50 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t9-20020a170902e84900b001bf8779e051sm6749403plg.289.2023.08.28.02.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 02:19:50 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andrzej.p@collabora.com
Subject: [PATCH v14 3/7] dt-bindings: soc: nuvoton: Add NPCM GFXI
Date: Mon, 28 Aug 2023 17:18:55 +0800
Message-Id: <20230828091859.3889817-4-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230828091859.3889817-1-milkfafa@gmail.com>
References: <20230828091859.3889817-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for Graphics Core Information (GFXI) node. It
is used by NPCM video driver to retrieve Graphics core information.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/nuvoton/nuvoton,gfxi.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/nuvoton,gfxi.yaml

diff --git a/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,gfxi.yaml b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,gfxi.yaml
new file mode 100644
index 000000000000..0222a43977ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,gfxi.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,gfxi.yaml#
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
+  that analyzes Graphics core behavior and provides information in registers.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nuvoton,npcm750-gfxi
+          - nuvoton,npcm845-gfxi
+      - const: syscon
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
+      compatible = "nuvoton,npcm750-gfxi", "syscon";
+      reg = <0xe000 0x100>;
+    };
-- 
2.34.1

