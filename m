Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17839664FDC
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 00:21:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ns6JT6hTZz3fDv
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 10:21:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.44; helo=mail-ot1-f44.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ns6DW6NCSz3c5D;
	Wed, 11 Jan 2023 10:18:03 +1100 (AEDT)
Received: by mail-ot1-f44.google.com with SMTP id k7-20020a056830168700b0067832816190so7911849otr.1;
        Tue, 10 Jan 2023 15:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PipTcdGJi3JzFB6MCvSNks1FIzBieh7o/0BWQgxG5o=;
        b=jgrU6KRvSe9cm7fsaKzWmmd3vq+g/3h7d4Tqjs+SFFEb5i8IIoabl0iikNN5BO8Y1B
         Los0OIOiWGwwlwnFAarP6t42IjclAwOCcCILaJEYDpijHS+5D1u86W6dpSoTE/5kGrKZ
         +SG6/X+G+SK9liO31u78oQxIlo+qrVsz9cJ17N3kSC5Tge6G+Lr5quQKnNL09HnsSr3F
         P8KCycnRBIl3FHH/VnrCNv95oixVaQZhqYQDbxXSLTCseOfTOiQQGE4t0oPmgIKEVtt1
         gah6SkIxTyK/CnPvixwBCOS23YMgp88cyyMPKi2tfV2DihIYa8zU1OWXJYVAnb26aPZs
         vH9w==
X-Gm-Message-State: AFqh2kpJvsE+Gp1vaFZLZz7UyExKgcsAB1kBZyobE8OIK/yyRpJof8kW
	8bn5ejteRT6vPDGFJAl7+g==
X-Google-Smtp-Source: AMrXdXvTxhp8j2XHzYR8yhUyqDawXHa82JUo3VRja1xqQmky8ZknrJFW42XywhUnepnso8RXS9rv6A==
X-Received: by 2002:a9d:480b:0:b0:670:9c6b:e684 with SMTP id c11-20020a9d480b000000b006709c6be684mr31539339otf.22.1673392681072;
        Tue, 10 Jan 2023 15:18:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 42-20020a9d012d000000b006619295af60sm2328250otu.70.2023.01.10.15.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 15:18:00 -0800 (PST)
Received: (nullmailer pid 3145664 invoked by uid 1000);
	Tue, 10 Jan 2023 23:17:55 -0000
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Jan 2023 17:17:47 -0600
Subject: [PATCH 4/4] dt-bindings: usb: Convert Nuvoton EHCI to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-dt-usb-v1-4-8e366e326513@kernel.org>
References: <20230110-dt-usb-v1-0-8e366e326513@kernel.org>
In-Reply-To: <20230110-dt-usb-v1-0-8e366e326513@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
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
index 85e41609b09b..1687c7e9302b 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -76,6 +76,8 @@ properties:
           - generic-ehci
           - marvell,armada-3700-ehci
           - marvell,orion-ehci
+          - nuvoton,npcm750-ehci
+          - nuvoton,npcm845-ehci
           - usb-ehci
 
   reg:
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

