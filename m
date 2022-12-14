Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC3A64C5FA
	for <lists+openbmc@lfdr.de>; Wed, 14 Dec 2022 10:30:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NX98N1pchz2yxB
	for <lists+openbmc@lfdr.de>; Wed, 14 Dec 2022 20:30:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pqjQzeUx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pqjQzeUx;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NX94h6TSxz3bdl
	for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 20:27:32 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id q71so1573649pgq.8
        for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 01:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oDp0Y4hNKtuwWRzIl64XHBZWtkU1cebMe5ez5uOfwA=;
        b=pqjQzeUx5dqr1YIv0SnnHz+AquJUATPTy0QMtyTeqzG9ciXi8VFJ36NfszsDd0V3cM
         S1Z4RoLH7CDUhblnqxpNSMLEqp6SRFAA5uu1JPb3qjdY5OxzAQBfhjna8Tme/vakjNIa
         GpkLzn8VdJTC4/jTDayDwPJ2zCsAUkhupMRswh9l2IyKDZE822VrJyTtmC8HVuoXBBJJ
         J/wFRyXOb/HueYi4BZ+OuW8J8j5hOb3dw6OBKHVDlfe7oGqwqu04h6a4Yef3Sp1xRXE5
         yMUrXJ64S0KIQ7PVo5r9fTcqYa2bFHH3r6121GniS/820+VBXcLZeNYBz2c1E/7kTS+y
         u7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oDp0Y4hNKtuwWRzIl64XHBZWtkU1cebMe5ez5uOfwA=;
        b=sB8r1AYnROAXN7FFJa2rAJJigRJr7J7oI/pYnxuZU4lfB9KrjenTWoDjb5TOQfDgUh
         BR2e4AE+q6TN+5vRjy213zbZ7QIkyMcuY5+RWpr829Jh37lhx3NAz9oNpIcUwNHRDnHE
         0plCKk2dHQoIjRGx0RsNbticCjB0l+UYDG8Dalup7wKjqjdbhsRpi6TaUThSqlH4fYCn
         94XfSNs4ssHQRA8hqIyVZEIJkSaGW1r3HAa3tgldcFyXwxKOy3P+DA3HXJeDSzVi2hXX
         /hO8iywzJ93dnsLyk0215cc32hSYyDnSnrhe1NKMO+ZK1BJRbAJdxywxR8JdkfTAAcGY
         6Qfg==
X-Gm-Message-State: ANoB5plzPZMUK/qrmPu0fkmvSL0Fe5G3h65lJgh9xArew/Tp4Is9Xqd9
	hOfnMDtcN/IdjRlIrvLPs7M=
X-Google-Smtp-Source: AA0mqf7/dk4aWxX6iQbCbpBPPdJL/vG217lPXQbhmyLUP9sqy+fuXL1uh2qQphzUnvPObHLbPRZFfw==
X-Received: by 2002:aa7:83d7:0:b0:56c:cde:1a44 with SMTP id j23-20020aa783d7000000b0056c0cde1a44mr20623117pfn.11.1671010051011;
        Wed, 14 Dec 2022 01:27:31 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t123-20020a628181000000b00576145a9bd0sm9003312pfd.127.2022.12.14.01.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 01:27:30 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v8 3/7] dt-bindings: arm: nuvoton: Add bindings for NPCM GFXI
Date: Wed, 14 Dec 2022 17:26:32 +0800
Message-Id: <20221214092636.810883-4-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221214092636.810883-1-milkfafa@gmail.com>
References: <20221214092636.810883-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kflin@nuvoton.com, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for Graphics Core Information (GFXI) node. It
is used by NPCM video driver to retrieve Graphics core information.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 .../bindings/arm/npcm/nuvoton,gfxi.yaml       | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml

diff --git a/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
new file mode 100644
index 000000000000..7c8e5f99cc50
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
@@ -0,0 +1,40 @@
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

