Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C094C5BC3A0
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 09:47:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWGx24cdQz2yHT
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 17:47:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DdF20jXf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=pbrobinson@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DdF20jXf;
	dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTXtv3rfMz3bYM;
	Fri, 16 Sep 2022 22:09:43 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id 13so19986939ejn.3;
        Fri, 16 Sep 2022 05:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=odQlfFAggBoep0bulEhsQiWvf71yxfezg5yPb2FCPJE=;
        b=DdF20jXfX3RHny4PKdPH07To/UOXczoytVNCt5KtBkNTTiUFXThhjo3SS46w3f5Mq4
         KL+io10y+YRDU94+wtU2ZxQnXOzQ62ud6qAEK0Jt9Rnmti9DYJGdBt2hf7Crp2mHzLdl
         eIn3IPAk3ZV8c/uB+yg0HDcSb0V42TPEfPEfguHa0rw509aivIiwlCpDaKPJ1J9TTxSg
         EA5/+YfHku5DCHCP0PI5sOmpmoJ6zuUr4z1paaldAhm8yx37QHNGAMKpGy25aPMjMoyX
         ckl1JW+I5P1Bfr0J7EvPkDP9cB0cl7HpOMxbLppagpPKhjerWQvA3V7fa0DbpHj3HVr/
         /bzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=odQlfFAggBoep0bulEhsQiWvf71yxfezg5yPb2FCPJE=;
        b=dvhs9N6nr17sWUJrsignMhWF1fQd2zzGszRt+wYH3abw+uOsESAh1pH31AzRYSoMFe
         HQMvVia4sVlQoWiXGw+UYpK6WkljaeIwZrhBKRiBRjmVP5gEFzO6Nb/Fal3/KZEGolGl
         aiL4YdxP3eivQBxn/tCEhwinkMri1S75SNUh456298GeaQuopCImQJkx8Set9ZGkKaYH
         KiblZUaJNvD6qpRCZrGFKEcqxjrGAxt4cMgUyqUOF+SIKg7LEEMbCSscIO8Ef/cAsm8f
         bQqO+xYuHzY9osQ4ZolotlcfAqgscIkgzFOOyn2k42HbCeLlhs1tfStTydwEJYPUJofH
         SdKw==
X-Gm-Message-State: ACrzQf1hsdFCEmNI/3ttW8sSuZLe8TrkRLYmoncFDSuJ34mqUnPFShVV
	4S+hCm4izH1vmlr/3gCdRSA=
X-Google-Smtp-Source: AMsMyM7HoCgpsovcuex1n/Zf/gq9x/QGD+G0XV+PHdh+YEuwGenD2Jg5KWnLhp3guOi7jrpi1Pqa9w==
X-Received: by 2002:a17:907:70a:b0:750:bf91:caa3 with SMTP id xb10-20020a170907070a00b00750bf91caa3mr3399319ejb.711.1663330179239;
        Fri, 16 Sep 2022 05:09:39 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id 9-20020a170906310900b00779cde476e4sm10305590ejx.62.2022.09.16.05.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 05:09:38 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH] hwmon: (aspeed-pwm-tacho): Add dependency on ARCH_ASPEED
Date: Fri, 16 Sep 2022 13:09:36 +0100
Message-Id: <20220916120936.372591-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Sep 2022 17:45:24 +1000
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
Cc: Peter Robinson <pbrobinson@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The SENSORS_ASPEED is part of the Aspeed silicon so it makes
sense to depend on ARCH_ASPEED and for compile testing.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/hwmon/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e70d9614bec2..006af099955f 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -393,6 +393,7 @@ config SENSORS_ASB100
 
 config SENSORS_ASPEED
 	tristate "ASPEED AST2400/AST2500 PWM and Fan tach driver"
+	depends on ARCH_ASPEED || COMPILE_TEST
 	depends on THERMAL || THERMAL=n
 	select REGMAP
 	help
-- 
2.37.3

