Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F364D664FD8
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 00:19:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ns6Gg5kf8z3fDS
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 10:19:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.47; helo=mail-oo1-f47.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ns6DT4hmFz3c5D;
	Wed, 11 Jan 2023 10:18:00 +1100 (AEDT)
Received: by mail-oo1-f47.google.com with SMTP id y194-20020a4a45cb000000b004a08494e4b6so3626280ooa.7;
        Tue, 10 Jan 2023 15:18:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FJcOTfsjwpdIljEO429tvKoOeEBhTBITWRzGMiqJAg=;
        b=IU1m/Z036uqX2yrGIsT/toQObIxZ9kG07XfCYtmrcgzmtLzJlkdINGuMC18FnglWzU
         F55xEHi97cIks93/5ZsolvQD2OTqxcPuIrzsjEbButj9Zvbl/5Fsz4yR30luRD5fLziQ
         8bc8UzbmfzlhLwZxqcv9ObbQW6ExKAhJGp4fACSsOsOa4JUl8oGOXduxFxdsqVL3tlK8
         FZhutRXSwF64QP8ag+ERfiiGpW2DsnACkePzY/41EABNFi7TAUfT7eeRvM6HYVlienvI
         zX0TE4Zd6hDeFdE7f099HUWlrxRKoB50qqdd/O/0HctpDuLzozZJhAvvRfDBEiuUGGGN
         46hA==
X-Gm-Message-State: AFqh2krvkGyzoqeBS7mX04Z2PmEIn7plq1Bq3oQgB9KFi2A2k2osddcb
	sDq1uJSFszSPS+kOCI4hag==
X-Google-Smtp-Source: AMrXdXugqEltNT0Rw61nCtbCf4o/oBzHuLjFst8x3k86C7Sd4CJKl6VsO9SIi06WLEmAFjEFGqHjDw==
X-Received: by 2002:a4a:ac88:0:b0:4a2:76a0:7677 with SMTP id b8-20020a4aac88000000b004a276a07677mr32202358oon.0.1673392677968;
        Tue, 10 Jan 2023 15:17:57 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n3-20020a4ad623000000b004908a9542f8sm6364787oon.31.2023.01.10.15.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 15:17:57 -0800 (PST)
Received: (nullmailer pid 3145658 invoked by uid 1000);
	Tue, 10 Jan 2023 23:17:55 -0000
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Jan 2023 17:17:44 -0600
Subject: [PATCH 1/4] dt-bindings: usb: Remove obsolete brcm,bcm3384-usb.txt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-dt-usb-v1-1-8e366e326513@kernel.org>
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

