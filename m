Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C0D3FE293
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 20:55:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0CtQ3715z2yNY
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 04:55:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ikuBBMdh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=blisaac91@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ikuBBMdh; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0Csz2Mlrz2xsg
 for <openbmc@lists.ozlabs.org>; Thu,  2 Sep 2021 04:55:01 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id y144so542463qkb.6
 for <openbmc@lists.ozlabs.org>; Wed, 01 Sep 2021 11:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1XPQ/97NsHF8D/uarkf4dsaNcuMR2eIi7Y5JjjR8CKI=;
 b=ikuBBMdhpyQC6E3bqLxH1y36nZ9pIzJT7qi5Vwu8VN+u+Imjo/zv/x1+TdIhvSDRoE
 Ihsa+e/3VUKusNDWIQC1ZuIXcF+BZ1lTbw6WvQuDsuGaXDBmky/s+jT4S5lJrjN9UvCa
 /n2OherLEIFjZrqli0GXZABUcUZnea2hmVKjujbbpk1T5HzXOhHujkG3khpm3KGS0XQB
 gnxeHlHVAtdIJNn34KBcd5MqTiSTe1+Ncs4co+g2Iv0z6AnicZBo+bj16YkoxXc94YJs
 ZNHuNnjoJVG/Uv8VtZRcguqTQjjZzoSpUScdcZqAJleJAWQdt9F5IiD27VhbzGQ5zUg4
 ntQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1XPQ/97NsHF8D/uarkf4dsaNcuMR2eIi7Y5JjjR8CKI=;
 b=JmbZdyt80C5woTNHDUlyis/3CheU7EdR9SRa7EEJet0L4S8WBqrFMqJU+Z3HKS0rk8
 nLtbvz+JdxVfrQNdV2qKKhuuRksji4Q8NmGLVFCZfOGpPvTEpERxofWQcyc0xtvJg6xu
 KDZ6jYtBtktAPM+iSzJlGMszx0QUWvj0KgUT6bl1BA+eWos8Em+j2y9O0u5Za6+GMl21
 cL5cx2ybvT+LgFyaraVc4FzK8S3XJ/x9rfVaUjl0XG8oWOrM5MJwmEKiSryrduLcs2ju
 dGcWhJ8oLo6tTdvWBpBAvUp3/qvmk6j0C0CoaZfpC66xo5U0BAsgWTAfcP91hSi3Uzse
 zIwg==
X-Gm-Message-State: AOAM530Yyr+lNSqM4qGgLYjEpskEQ/QQ6MJVbB7YCUofvgLsuJOIYqqc
 S13yd6LDESKK9g0VgzTV6fU=
X-Google-Smtp-Source: ABdhPJzvupRco3v/5iknTehXw2Zvooy5OTff5zNntS6C9V7Ldd0f2qAz52hHlgWNhpVU0mZkLS5MSw==
X-Received: by 2002:a37:90b:: with SMTP id 11mr1065230qkj.419.1630522497833;
 Wed, 01 Sep 2021 11:54:57 -0700 (PDT)
Received: from fstone04p1.aus.stglabs.ibm.com ([129.41.86.7])
 by smtp.gmail.com with ESMTPSA id g7sm421316qtj.28.2021.09.01.11.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 11:54:57 -0700 (PDT)
From: Isaac Kurth <blisaac91@gmail.com>
X-Google-Original-From: Isaac Kurth <isaac.kurth@ibm.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10] ARM: dts: everest: Add 'factory-reset-toggle'
 as GPIOF6
Date: Wed,  1 Sep 2021 18:52:37 +0000
Message-Id: <20210901185236.558771-1-isaac.kurth@ibm.com>
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
Cc: Isaac Kurth <isaac.kurth@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The state of this GPIO determines whether a factory reset has been
requested. If a physical switch is used, it can be high or low. During boot,
the software checks and records the state of this switch. If it is different
than the previous recorded state, then the read-write portions of memory are
reformatted.

Signed-off-by: Isaac Kurth <isaac.kurth@ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 83fc29309154..73c8f780e5b1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -241,7 +241,8 @@ &gpio0 {
 	/*D0-D7*/	"","","","","","","","",
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"PIN_HOLE_RESET_IN_N","","",
-				"PIN_HOLE_RESET_OUT_N","","","","",
+				"PIN_HOLE_RESET_OUT_N","","",
+				"factory-reset-toggle","",
 	/*G0-G7*/	"","","","","","","","",
 	/*H0-H7*/	"led-rtc-battery","led-bmc","led-rear-enc-id0","led-rear-enc-fault0","","","","",
 	/*I0-I7*/	"","","","","","","","",
-- 
2.25.1

