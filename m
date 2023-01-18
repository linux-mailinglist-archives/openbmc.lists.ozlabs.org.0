Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B283A6727B9
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 20:02:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxw9v4d5Zz3fGY
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 06:02:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.49; helo=mail-oa1-f49.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxw6c6GK5z3c46;
	Thu, 19 Jan 2023 05:59:36 +1100 (AEDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-15eec491b40so15592104fac.12;
        Wed, 18 Jan 2023 10:59:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FJcOTfsjwpdIljEO429tvKoOeEBhTBITWRzGMiqJAg=;
        b=H3RlozPo8Bc0pD5DXL9WvRWjcvWMm6h0VSIqPCy2LdeLuuKvk4Y9c07zA0uaBAGw1N
         6OmnQ5eBnSY6nKOT7FE2WL5KXEoXW/BMxARiFW8YUs1yquoaJ74SwtCpl6ZI16GSBTIC
         eRNskJowP1QXdKOZPxOxoHQBdvRmUbGfTUDPzQXjGGWK4m/qiHvcBQ6h0mX0oukxjeXa
         J3o/6qobtjs3gh9G6HsrzdN8tpolTlbop/age1617alKIHJnEXuUP9E0diqWvMBDTQsV
         WGTv1gOqjye0njEf/8qZBMxA2kEB3bFvAutPFopw8/3PbZ0oGtLD5+wR64wyleEuBx8N
         S7ZA==
X-Gm-Message-State: AFqh2kpRj7NdnI/gvKLLkn2gOW2e+5sQ51Jw15mrkhjnT6hndQgv68y2
	gn3iSH1QGCZCDI2pStFgbg==
X-Google-Smtp-Source: AMrXdXscaED9/2tSNc/EWmCUoL6KUA5ro4vcmZupKkFZp8aHQrNSo7DtQPDnUsLGeCcrB99X4bhVlw==
X-Received: by 2002:a05:6870:b6a5:b0:14c:68df:833e with SMTP id cy37-20020a056870b6a500b0014c68df833emr5764905oab.15.1674068374366;
        Wed, 18 Jan 2023 10:59:34 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id y34-20020a05687045a200b00143ae7d4ccesm5057713oao.45.2023.01.18.10.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 10:59:33 -0800 (PST)
Received: (nullmailer pid 629746 invoked by uid 1000);
	Wed, 18 Jan 2023 18:59:29 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Jan 2023 12:59:23 -0600
Subject: [PATCH v2 1/5] dt-bindings: usb: Remove obsolete
 brcm,bcm3384-usb.txt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-dt-usb-v2-1-926bc1260e51@kernel.org>
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

