Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF06786A698
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 03:34:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m3jdhoVY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkz2L3pYBz3cZN
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 13:34:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m3jdhoVY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkXHt45Dpz30gM;
	Tue, 27 Feb 2024 20:29:29 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e54ebf867aso120415b3a.1;
        Tue, 27 Feb 2024 01:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709026168; x=1709630968; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=canrtwhVAgevvzPaKnrmGzi3BBVp/VV3jvjlMXIMo5M=;
        b=m3jdhoVYMV+k0jnuknDMVAtXK8f31jrWbSp7N1kR/gyKtYBPgoBuS1OuflfwjrxFs+
         y/UtOgwntfxYMIrR4f1Ow2k+IhHecnyn8RGAdMQ2sNWSnh8fAmbdYoEaQfUEqkobCcZr
         TWOWZcNxQRnahPJOBoZyqtwjxuNlNq3JSh1M5uo1g6blxJ+/mFISwfKCdP2a8pXdA29M
         8T6FH7z/L+z5s7mAkt4iEKrudnGq0HJ42JCG4e7boUUswMlZmVl/WM6oXu4PGM95YCZ3
         RLvR8v+5UNbBGrRNFF2xMRmOJ7cQhnC7DN/RO92GSkhm0+oAO3lGqrxfNVT0zc5irRTx
         3MTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709026168; x=1709630968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=canrtwhVAgevvzPaKnrmGzi3BBVp/VV3jvjlMXIMo5M=;
        b=NRQENI0qKM9s3h56L5gcBMEfcuWMaWPWDXVQPanVNo3al+OswxSk+ibRSL11f1Elnm
         VHPo+4jJBkc2BGLKktcmxlUDR1jnCo9jdMkLTrBmq/ELk/NeqgE6YCCVd4Mr6olL7vpH
         p3POXpbAlcvDy355S8m1B8cOPhcIm3DLcwej+5So5LQeLIqbabnd1F2HlVPRqjIoyF5e
         XUEShCHSZK2ncq8jwYWPeirtCRSJtjka2wyO6NDRuGQ24NT9nygKE8AiZy5rn7TV86A8
         Q1elzg/rO70St6JbAPCAdFHUyJTcZGHAnx+3SJgqz/WeIa3JIbxR6m8Xe2cEa6Ik/lnV
         y3nw==
X-Forwarded-Encrypted: i=1; AJvYcCXFaNn9R98Vhq9hCNotY/480I54O3oWRmNLt989OLLHIFBzmE1UDIZX8ojui/cR49Cko1JMoRHCXzMHkFrsHhmkFZ2EQpG3kjkHevMvIJtqLrC9V11zQZmbHdPxexQkqINcR7W4ZLBd
X-Gm-Message-State: AOJu0YwdYWHTC6KTqYTovQpCbkAhFTJBnR7u8rGx6/vCLF50LCwa8Its
	CZtbs9ep33DHJ/JlWZblyEit4DhdYYmEGrcFWuZIWUQ5cbl7Q1wx
X-Google-Smtp-Source: AGHT+IF2cuiK/7Cs5xtPRW97LK4Jz/nL7N1txsyOo2PjySUhueK8cbGMj9jrU/+BSRvH8k1lsdEhKA==
X-Received: by 2002:a05:6a00:1883:b0:6e4:8294:e0e5 with SMTP id x3-20020a056a00188300b006e48294e0e5mr13670221pfh.6.1709026167895;
        Tue, 27 Feb 2024 01:29:27 -0800 (PST)
Received: from localhost.localdomain (125-229-150-10.hinet-ip.hinet.net. [125.229.150.10])
        by smtp.gmail.com with ESMTPSA id g6-20020a62f946000000b006e53cc789c3sm2167169pfm.107.2024.02.27.01.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 01:29:27 -0800 (PST)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: robh+dt@kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Date: Tue, 27 Feb 2024 17:29:21 +0800
Message-Id: <20240227092922.1734998-1-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Feb 2024 13:28:58 +1100
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kelly Hung <Kelly_Hung@asus.com>, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on ASUS X4TF.

Changelog
Changes in v3
- correct string to asus,x4tf-bmc

Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 749ee54a3..0d72a1a9d 100644
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

