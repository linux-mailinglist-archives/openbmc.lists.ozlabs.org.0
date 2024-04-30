Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E258B69AA
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2024 07:00:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T4C7bNvY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VT7LK0hVrz3cTt
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2024 15:00:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T4C7bNvY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VT7Jr2FXQz30gK;
	Tue, 30 Apr 2024 14:59:08 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3c8317d1f25so3086366b6e.3;
        Mon, 29 Apr 2024 21:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714453145; x=1715057945; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeaYT5g7d9utEUSwKoSkLuLBwRnRBLyYUxuEzkcAcCw=;
        b=T4C7bNvYCJSLV1R2p+XJyTBqm6viNRKN+s8Kex8YMGPKTYeggqO9rz31BNZfa6NC8T
         qhD31M72GakRfgE4Hre0ZFx4VJl1i4Wcoz9H2pq0ZTgkqSeRdFCHi681c77HZqT6vAL0
         uLBdda8WE+leYpb5qR34pupo1+Z0klVv/ginyqw7aDKdQA7EMZxMSQ8Cvk4JnpMadO7V
         lNmkD3SHkuEQ6RwsB/oTQzN52mEpcLtBTSGRQTGhlsE/39AyfTtxnSXLrTK018wtoqGQ
         ++Rsn2jcdXpniEGPBdH5SMEdF3GpNga+GGNdoA9IjSMkRiWwo5tZOWb3cDDr9TuANBRC
         9hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714453145; x=1715057945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeaYT5g7d9utEUSwKoSkLuLBwRnRBLyYUxuEzkcAcCw=;
        b=Z5t8QyJM/TUG2qEm+Nnkp5ics0bhh99yR30AI6nCOtkr43A4+88J+J7I/RhFNCy/wC
         2I/HRthllAJJSdlxUAosyDrekr80fH2Tv3LTW/hUF978e1pHG3xpsgtTsQK1TTDW+Sdp
         uGFyjd+TtajZd4JUtZZsdb1nPuVOCPwTYXYW1upJYcBDMRrCWHWH/jtdUBHi5TIiBJd1
         6F0zLWkBH/+YQLaxxY3m/m9sZ+NbJokux66NQSK0SC83OzhB3OjpQ/fPL7u6iCnkpc29
         Tw9TT8OQ6FMwRgh670XxhhRyKHKEF7hqZRiCzqywRzZ3C1JqI8gkPEfdSbiN4mpm7GTF
         g2HA==
X-Forwarded-Encrypted: i=1; AJvYcCXhDrdmNbupDZVdF85rcKiWC9rorDAPMiqDcxvAlxTFo5EiG+sxOwh/kfLny6kXnAhFFuj0lE+a5Wxu/+h3PxMGN0fuVveY5KupLHLFc3fW8IaQybP7AO+NU2Lwf7VxcPqFxdQTId1U
X-Gm-Message-State: AOJu0YybGalGUtMywF6epqbfdFowo28VgweYK/Pm8odLgd8qpja/U90i
	OUUo+VUDFahJ7TRsSe2wiuNjl5gfbjmH90VFKgZlaUniAeIlxwQD
X-Google-Smtp-Source: AGHT+IHmrSS+CBGU8XL0VitjdjUROW5sUl41rCN7wANbP+xrMvxqWiPNClTVDtzKqa8V1sbDHDNi1Q==
X-Received: by 2002:aca:912:0:b0:3c8:2c9c:6e8c with SMTP id 18-20020aca0912000000b003c82c9c6e8cmr12269648oij.48.1714453145194;
        Mon, 29 Apr 2024 21:59:05 -0700 (PDT)
Received: from localhost.localdomain (125-229-150-10.hinet-ip.hinet.net. [125.229.150.10])
        by smtp.gmail.com with ESMTPSA id e15-20020a62aa0f000000b006ece85910edsm20226483pff.152.2024.04.29.21.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 21:59:04 -0700 (PDT)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: robh+dt@kernel.org
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Date: Tue, 30 Apr 2024 12:58:52 +0800
Message-Id: <20240430045853.3894633-2-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430045853.3894633-1-Kelly_Hung@asus.com>
References: <20240430045853.3894633-1-Kelly_Hung@asus.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, Kelly Hung <ppighouse@gmail.com>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kelly Hung <Kelly_Hung@asus.com>, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on ASUS X4TF.

Signed-off-by: Kelly Hung <ppighouse@gmail.com>

---
V6 -> v7:
- Remove incorrect tags.
- Modify Signed-off-by field.
v5 -> v6:
- Add Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
- Add Reviewed-by: Rob Herring <robh@kernel.org>
- Add Reviewed-by: Zev Weiss <zweiss@equinix.com>
- Add Acked-by: Conor Dooley <conor.dooley@microchip.com>
V4 -> V5: Update all changelog from v1 to v5.
V3 -> V4: The new compatible is a BMC for a ASUS X4TF server which use
a ast2600-a3 chip, so correct string to asus,x4tf-bmc.
V2 -> V3: Add a label to indicate it is new compatible for bmc.
V1 -> V2: Remove blank in front of the string x4tf.
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 749ee54a3..0047eb4ab 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -74,6 +74,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
-- 
2.25.1

