Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1F8678ED6
	for <lists+openbmc@lfdr.de>; Tue, 24 Jan 2023 04:09:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1BlP0rDrz3cfK
	for <lists+openbmc@lfdr.de>; Tue, 24 Jan 2023 14:09:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.174; helo=mail-oi1-f174.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1Bfw0zmbz3bh6;
	Tue, 24 Jan 2023 14:05:27 +1100 (AEDT)
Received: by mail-oi1-f174.google.com with SMTP id p185so12213871oif.2;
        Mon, 23 Jan 2023 19:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t21dCSgXMADUq1pWfl156WNqD9atSWj6SahX+ddDCFs=;
        b=nHsziz/xLaymkoZLkzu7zMoEFb/2swuiZv6PfnUdEJ8hOZ980QvFiuMeuUSGvRoTje
         8t+r24+2oQBdiyE5nNqSNBJzE6JgFyTAhSu1EpS7fq6mYX0we4S/r2TSMZxaQqRdh6cg
         Lt/y8qy8gePdDKkMHd4chGDbcMYMn2uyUNLfoiwiKm0LzQRyfwLDU/Hk1IPz/kSIlDbL
         B14YxRjZGcmPhx0SBRY7ZDBpNWcLHWZul+Hg+JQDXxHLRZ2xU0Gn/xWt2vSjLaegoY6G
         dcO58/b49GSBXpNWKun0SSjoI41zh34fqrtVz2xFpjASLPAfZIwtqRo+Ko4JZtIhaIms
         Wp8w==
X-Gm-Message-State: AFqh2krja3whq5Qh2Q8pVnKcn2m8Bp+WSZlFJqYXzNEF6a+ULfbBYy/S
	T5c8fM25DOJ3ND2NhCGpsjxyUGjZRA==
X-Google-Smtp-Source: AMrXdXsQxU+g4VkhTO6PSGz2Uzgx2PhXFUQ4vF3YFaAwscF0LSrRJQAelA7PCrv0Epi3/ObSdAJ3mA==
X-Received: by 2002:a05:6808:2a8c:b0:36a:8422:d962 with SMTP id fc12-20020a0568082a8c00b0036a8422d962mr10569363oib.2.1674529525545;
        Mon, 23 Jan 2023 19:05:25 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s26-20020a056808009a00b003645ec41412sm492545oic.27.2023.01.23.19.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 19:05:24 -0800 (PST)
Received: (nullmailer pid 3266348 invoked by uid 1000);
	Tue, 24 Jan 2023 03:05:20 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Jan 2023 21:05:19 -0600
Subject: [PATCH v3 5/5] dt-bindings: usb: Convert Nuvoton EHCI to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-dt-usb-v3-5-5af0541fcf8c@kernel.org>
References: <20230110-dt-usb-v3-0-5af0541fcf8c@kernel.org>
In-Reply-To: <20230110-dt-usb-v3-0-5af0541fcf8c@kernel.org>
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

