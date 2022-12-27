Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF865693B
	for <lists+openbmc@lfdr.de>; Tue, 27 Dec 2022 10:55:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nh94Z3Gm8z3bZl
	for <lists+openbmc@lfdr.de>; Tue, 27 Dec 2022 20:55:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pn9bWV2m;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pn9bWV2m;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nh90x6dQSz3bcN
	for <openbmc@lists.ozlabs.org>; Tue, 27 Dec 2022 20:52:01 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id gv5-20020a17090b11c500b00223f01c73c3so14013000pjb.0
        for <openbmc@lists.ozlabs.org>; Tue, 27 Dec 2022 01:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxkElKmgrqtTP5be0jVrJHJmBiDppX9Zdl7lKzzovCQ=;
        b=pn9bWV2mFXImcDnXT/ZYc6mZuqBpqqHEMG2I8uDVhburANDTQ6g3gqHSk60xuAbOxN
         YbgJFlGmUFRLXXWtexwTRev0H2jrHYcC6sHRyaIvbK7Pc3hVg5bhiM/aE71tKR7/RzFt
         3KkvMRJ8el/7lhHHxDpi24IL5q3Zudz/JdbHKxbS5+753Sa3AEVBB2ScCm6N+GiwzOLO
         zRwW0TKEsv7tY9J+QCJUfrTxDYIwlweZn2xuPqMMjCxXsFqO4OMkaghE3g+ZPY+yIujK
         /zWnfCU91J168dDEgBz4wAyZmli9BvIcpY38jIYKMmw93dDQKGL3zs88T9oBVNMyfh9a
         1/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxkElKmgrqtTP5be0jVrJHJmBiDppX9Zdl7lKzzovCQ=;
        b=EvcHp1nbd6Oh+1FOLPb5Ons6w1uPuYOpxqk9cLa1DgPFHhcRF9gHiW9jW0ZcCf7Sum
         1aLLfwjRnyzBgwULoK6mIADE/3UgD3tcxkKL45xt1VZccByUUXmdzUzqkh9w0Xr2vyqT
         fzM89tNme86dr3VTRbWVfQX4beEPwyD74Ez5nFKb8dmef+BhuEcpQaCATjokJlkWAOZ1
         TpeGj+q7rlwc8D0reXmfvaijKNHRAgpjZ/sFjnvZbnzZOhZ1LY+MVSRZ7M+CGv5u71Gs
         EMKG/hZpX/EU30zdkQI6mbziojZgxr8RY3W7D4AGsmU0GeUaootI5h/jG803ITB7GYuJ
         f7WA==
X-Gm-Message-State: AFqh2kqHe4AJ807u116ckBip2YfqbacHWj4GVS01Y+g2JSoc+o4zI/Of
	TwZ6nPkrjbW7KbqGjdB9T3w=
X-Google-Smtp-Source: AMrXdXsO4mwO6dEWP1kCE+jo1tgiPFW/xdFHtO3FRdvRNEq4twaFH2IXpwVYCWlwM8Ot8o8mr03p7w==
X-Received: by 2002:a05:6a21:1507:b0:9d:efbe:529a with SMTP id nq7-20020a056a21150700b0009defbe529amr25598732pzb.10.1672134719625;
        Tue, 27 Dec 2022 01:51:59 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 21-20020a621515000000b005813aec74bdsm2619052pfv.139.2022.12.27.01.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 01:51:59 -0800 (PST)
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
Subject: [PATCH v10 3/7] dt-bindings: arm: nuvoton: Add bindings for NPCM GFXI
Date: Tue, 27 Dec 2022 17:51:19 +0800
Message-Id: <20221227095123.2447948-4-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227095123.2447948-1-milkfafa@gmail.com>
References: <20221227095123.2447948-1-milkfafa@gmail.com>
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
 .../bindings/arm/npcm/nuvoton,gfxi.yaml       | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml

diff --git a/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
new file mode 100644
index 000000000000..c033128e567a
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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

