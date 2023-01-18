Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 647836727AD
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 20:00:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxw872J2wz3fDj
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 06:00:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.43; helo=mail-oa1-f43.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxw6Z6y05z3c46;
	Thu, 19 Jan 2023 05:59:34 +1100 (AEDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-15085b8a2f7so36554926fac.2;
        Wed, 18 Jan 2023 10:59:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t21dCSgXMADUq1pWfl156WNqD9atSWj6SahX+ddDCFs=;
        b=7cy1jbQDtmGnMt6pYnpc8Nik21Fd3giwwMpVWfzgqsG2o6/WQ4ArA9dn7ZYpK2DfR9
         e2QYg5Fk58ARhvp+hGrSPtARSrbrOXD6WSbqfV3cppmmUJEOJDvingcSWnVKKhYHAGoy
         M/J7zNByr+x0yus/TnPD+rjGIDd75Dw/Zv2ENg01dww5pSwbv+OZAh/rC6mpxQ8zZ2vu
         GzIGgmm506glET1fCFPZqz6Aj7d8GEU+x9pFwEYcX/uooRgvoX5txF+Z5oA5oOXGKkQW
         tV8g1ZdvbtKKOLWGEhIiRFOduE7yo3fe6PRKWQ7agvnxBBYJAWQ9v9kpV6sKuKOaqwyO
         MhQA==
X-Gm-Message-State: AFqh2kpI6b833pY1MGYP/0sPgGrFuxK2FWwmOBF2hXx+Lf1j/pkBU4ej
	Vfm5ee1GKdpIDIkrM0D97Q==
X-Google-Smtp-Source: AMrXdXu1m2DIrv1ryGF/RTJllp6w43tl35oqGQcA5exBroeqivdYJaPoylgEUL5k6Lc/e6NTdaZI0g==
X-Received: by 2002:a05:6871:4207:b0:144:a774:15bf with SMTP id li7-20020a056871420700b00144a77415bfmr4223145oab.48.1674068372392;
        Wed, 18 Jan 2023 10:59:32 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id eq2-20020a056870a90200b0014fb4bdc746sm18661681oab.8.2023.01.18.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 10:59:31 -0800 (PST)
Received: (nullmailer pid 629754 invoked by uid 1000);
	Wed, 18 Jan 2023 18:59:29 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Jan 2023 12:59:27 -0600
Subject: [PATCH v2 5/5] dt-bindings: usb: Convert Nuvoton EHCI to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-dt-usb-v2-5-926bc1260e51@kernel.org>
References: <20230110-dt-usb-v2-0-926bc1260e51@kernel.org>
In-Reply-To: <20230110-dt-usb-v2-0-926bc1260e51@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Lee Jones <lee@kernel.org>
X-Mailer: b4 0.12-dev
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Nuvoton EHCI binding is just some compatible strings, so add it to the
generic-ehci.yaml schema.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/usb/generic-ehci.yaml        |  2 ++
 .../devicetree/bindings/usb/npcm7xx-usb.txt          | 20 --------------------
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index ebbb01b39a92..050cfd5acdaa 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -76,6 +76,8 @@ properties:
           - generic-ehci
           - marvell,armada-3700-ehci
           - marvell,orion-ehci
+          - nuvoton,npcm750-ehci
+          - nuvoton,npcm845-ehci
           - ti,ehci-omap
           - usb-ehci
 
diff --git a/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt b/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
deleted file mode 100644
index 352a0a1e2f76..000000000000
--- a/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Nuvoton NPCM7XX SoC USB controllers:
------------------------------
-
-EHCI:
------
-
-Required properties:
-- compatible: should be one of
-    "nuvoton,npcm750-ehci"
-    "nuvoton,npcm845-ehci"
-- interrupts: Should contain the EHCI interrupt
-- reg:        Physical address and length of the register set for the device
-
-Example:
-
-	ehci1: usb@f0806000 {
-		compatible = "nuvoton,npcm750-ehci";
-		reg = <0xf0806000 0x1000>;
-		interrupts = <0 61 4>;
-	};

-- 
2.39.0

