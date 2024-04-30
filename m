Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 754068B69A9
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2024 06:59:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hbmZhSmq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VT7KN5TBvz3cR9
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2024 14:59:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hbmZhSmq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VT7Jr0fXsz30fm;
	Tue, 30 Apr 2024 14:59:06 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3c709e5e4f9so3298238b6e.3;
        Mon, 29 Apr 2024 21:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714453141; x=1715057941; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZZX64UHLicig7cDGx/C8G/73Ljj8FABVKYw2s5cknE=;
        b=hbmZhSmqsyckFOJsqZBQEPJr11NVHrTQwRXA2r6WKmwLmcxRiPGeVJf1yf5OEp7DT3
         FTo3PTUdoWHZoyxESOFDsdVGYCaAZtCUsQuQSoMtRPuC0AdsR+Psx6s06aBogcyRsJj7
         OWn28H3E/3Zl1Y6OSu7S/NYW9bfYQl9Hybbb4Tqpjl4SODoTjuaS5e+7spOdYvbvjj12
         mWc1euR7wQKqlFJ5SpsWs50j4XdyD5TnuTLN7gQfnd4sswIVxPKH19DK/NUqCDugR+dr
         7ltA0KUh1xtxwBzIACwqTHS++mdUuDlRhGIbRLf8kWUNw+xO82XACZPQKt5VLR+mThXf
         wZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714453141; x=1715057941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZZX64UHLicig7cDGx/C8G/73Ljj8FABVKYw2s5cknE=;
        b=VFo/eh5o3Pj6+cwnIFn1Xxe3+I5Jn89MIR8+Qlv4c0BDtPzQDsqwMri8slTEVDG4lp
         gCJfPlKhqpeSM7Sf3EI2ouChezXngpnnpjwAO9Rq3+NKJgILHd2T8QBqDXU6qXNfJvmB
         +1EEAaEV19agts5y9F/5buHkUzwxye8Zz9SKUXuwnmArFJgOPln0XpF23Ax2VdMxyZOg
         qhmH4TOSxCdfpZXYQhdHIDQGf/UIFbtsy/zsUO7Lgv74aX69GQCpL9W2H3caGl/Zgktk
         nwkz4suQkYyZihy1Sq5Mm7kwvyq5sJeHP67dJSZc5CUWctVOzlWEcnDJLv30bs8V66uC
         xCiA==
X-Forwarded-Encrypted: i=1; AJvYcCVbiSQLC1epO3TIKMEOUd3XdCt/H/vMK9gCqXEBrfgn+YX0VkL4soDY0BFButnb5F1OXCqbuIIFtd0W0s6pU7qkFbEJW0cMLF7/JAvIq7pTtLywFDHiUXe79zdvktYdwINbDzSI52g7
X-Gm-Message-State: AOJu0YysBuvn3ZEViMabSqlRofSS5F6DuedQERzR9g7jJTnL2DW+4qZc
	YjoeIArjUYlKT9eDU3y4F6VdndQx8Cijyi4CG9rsaOvqnJXNFBff
X-Google-Smtp-Source: AGHT+IGfAY1Ufnkf1ZxBwe8KUhbMjBJdvnBPDZRufU4lSXsZbA2ge+W9oxfULHpysQpjwGPpE5ZoXw==
X-Received: by 2002:aca:180f:0:b0:3c7:4f9e:ec0c with SMTP id h15-20020aca180f000000b003c74f9eec0cmr12955532oih.32.1714453141505;
        Mon, 29 Apr 2024 21:59:01 -0700 (PDT)
Received: from localhost.localdomain (125-229-150-10.hinet-ip.hinet.net. [125.229.150.10])
        by smtp.gmail.com with ESMTPSA id e15-20020a62aa0f000000b006ece85910edsm20226483pff.152.2024.04.29.21.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 21:59:01 -0700 (PDT)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: robh+dt@kernel.org
Subject: [PATCH v7 0/2] modify Signed-off-by field
Date: Tue, 30 Apr 2024 12:58:51 +0800
Message-Id: <20240430045853.3894633-1-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kelly Hung <Kelly_Hung@asus.com>, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

For the warning message: 
From: Kelly Hung '<ppighouse@gmail.com>' != 'Signed-off-by: Kelly Hung
<Kelly_Hung@asus.com>'

I replaced Kelly_Hung@asus.com with my private Gmail account.

Due to a security issue with ASUS's mail server, I am unable to use 
ASUS's mail system to send patches out from my build server.
So I executed git send-email using my private gmail accoutt.

Kelly Hung (2):
  dt-bindings: arm: aspeed: add ASUS X4TF board
  ARM: dts: aspeed: x4tf: Add dts for asus x4tf project

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts  | 581 ++++++++++++++++++
 3 files changed, 583 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts

-- 
2.25.1

