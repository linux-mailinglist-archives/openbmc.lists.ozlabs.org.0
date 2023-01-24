Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD65678ECE
	for <lists+openbmc@lfdr.de>; Tue, 24 Jan 2023 04:07:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1Bjc2F7vz3cB9
	for <lists+openbmc@lfdr.de>; Tue, 24 Jan 2023 14:07:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.43; helo=mail-ot1-f43.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1Bft6ZCkz3bh6;
	Tue, 24 Jan 2023 14:05:26 +1100 (AEDT)
Received: by mail-ot1-f43.google.com with SMTP id f5-20020a9d5f05000000b00684c0c2eb3fso8480488oti.10;
        Mon, 23 Jan 2023 19:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FJcOTfsjwpdIljEO429tvKoOeEBhTBITWRzGMiqJAg=;
        b=bcXZsVOfAsHpVxW5S9tMPQsr4TSs7TRxYVzJOfkRIYukVvszG+hgpNN653OoBl9Ym6
         3gLJdV/UKtXUIQEnXWTPh+xZN+/MD7ziZ7WdEQpUPpwl3TVO3A79jpVS8QHS1XMZ8vB5
         owGTAL2JAmm/3ehXwx7B7iDeVWU0B4BozVNMazzdTY6Lo9tV5eN5Nu6IVljZXWMchGuw
         gBFQwJM3r/MqffgsByteZ3QQf8T8zwI1UYwzeRI1v1JmolQrXVPGeteANE/k4AUfZghv
         dPAyhABRbBdihcJislEVJO4jErhRumP5kSB3PQTunmoanScnDax8ZbpmcaSxC/PrwalU
         ia9A==
X-Gm-Message-State: AFqh2krLOrAO3DtARAgRKt7Riybk9RkI9BpzO6y5MODg3fu21rZNb1g+
	9q8k9ZjgPv9/Fpz9/y4r1w==
X-Google-Smtp-Source: AMrXdXtk4ESBvi3kPtNVN3s661xo1Y5KZZtfQ+KM3W+ytAIpqKVTTtgkQJaI3xv9A63V8+UpEsWh0A==
X-Received: by 2002:a9d:624a:0:b0:66d:a5f7:9adc with SMTP id i10-20020a9d624a000000b0066da5f79adcmr16670014otk.2.1674529524022;
        Mon, 23 Jan 2023 19:05:24 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s13-20020a05683004cd00b00686543d0f04sm449342otd.21.2023.01.23.19.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 19:05:23 -0800 (PST)
Received: (nullmailer pid 3266340 invoked by uid 1000);
	Tue, 24 Jan 2023 03:05:20 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Jan 2023 21:05:15 -0600
Subject: [PATCH v3 1/5] dt-bindings: usb: Remove obsolete
 brcm,bcm3384-usb.txt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-dt-usb-v3-1-5af0541fcf8c@kernel.org>
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

The "brcm,bcm3384-ohci" and "brcm,bcm3384-ehci" compatibles are already
documented in generic-ohci.yaml and generic-ehci.yaml, respectively, so
remove the old txt binding.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/brcm,bcm3384-usb.txt | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/brcm,bcm3384-usb.txt b/Documentation/devicetree/bindings/usb/brcm,bcm3384-usb.txt
deleted file mode 100644
index 452c45c7bf29..000000000000
--- a/Documentation/devicetree/bindings/usb/brcm,bcm3384-usb.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-* Broadcom USB controllers
-
-Required properties:
-- compatible: "brcm,bcm3384-ohci", "brcm,bcm3384-ehci"
-
-  These currently use the generic-ohci and generic-ehci drivers.  On some
-  systems, special handling may be needed in the following cases:
-
-  - Restoring state after systemwide power save modes
-  - Sharing PHYs with the USBD (UDC) hardware
-  - Figuring out which controllers are disabled on ASIC bondout variants

-- 
2.39.0

