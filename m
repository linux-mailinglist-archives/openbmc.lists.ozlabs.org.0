Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B11132D6EFB
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 05:01:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CscXs6F79zDqnT
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 15:01:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=gocXr98B; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CscWH4NnvzDqnT
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 15:00:09 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id iq13so1545099pjb.3
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 20:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a3Wsx6qapcaZnknKQGUu6tO5X9POo4RKy6s1GfIrFoI=;
 b=gocXr98Befg0v1xW0Ys3v7vzSmeZ1yrG5WTOTenAjAVG72C1ZumFUDBBpMrnm2SxSW
 mFVHQy+WW/2z3+qglqwkMcuu1mGzXtk1ZYp3xp0RVN0S3KCr9l9oCy3l/HJaiSan08o1
 OfzkxRq+sMilHk9g0rEXsLCw2dipHhI6vkYNegmkM7NUJOi/W3Dw4YrUDlvzwPtk0wTm
 7vbmXa5d9mRaH9P6RJcQpXtQYV3RwDLFuxkWPBD2ZiUn+FYrtG1b10UPoZHVOxNEAXLd
 YzdDJ3O3udc2zl2ixdlNAaabYPV3N8yjEHyH4M9KId5iw7UAlJqUdX8vg7ap7Jsp8nu9
 F8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a3Wsx6qapcaZnknKQGUu6tO5X9POo4RKy6s1GfIrFoI=;
 b=fIw0K4BaReogaFikeFWiGXja83g3bRjhw+UCuQWDbc6OmDcF53Cyx5xe6ORNSoSEFP
 AMm7qcKLSX9FLlrSSRiRxLmCBZVHnK1mkftIaneMXxq5eZiXln2pZq54hVtYov1wfiYy
 AA/uEd9EAByz/zjTzEKo5S7iRQ2DQaaG8zw0e26G720NIRUbNqUvLFO5ZVrBrH+L8y3C
 wl9IQZ2mpHwvlZw5O5q9bLkXx4bWlihPQmCVOieiZbO6LE/PGvp7LB7EOK/YII1S6czV
 EZMNN/pJQYs+ZsJShVBENY8d8O++1tsja+uq1Jjom8rlWSLXCtlt88rY6yHr7QX+jwBt
 u1tQ==
X-Gm-Message-State: AOAM530vSelsIF/W6kq4k30UEp1EGDiZDVh1pQWX70sz6xUyo/o7ZA2A
 XyqRWvSCrWwdCZnN/7O4xEzY2w==
X-Google-Smtp-Source: ABdhPJzByat1X2OPyYjbWl4ekwpWb3p5HNHbok1TRxQi1itFmCepL2LX4kRVYQsjtK5g5/lCssLVSA==
X-Received: by 2002:a17:902:c20c:b029:da:b4d4:4f42 with SMTP id
 12-20020a170902c20cb02900dab4d44f42mr9465002pll.85.1607659205345; 
 Thu, 10 Dec 2020 20:00:05 -0800 (PST)
Received: from localhost ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id h20sm7686827pgv.23.2020.12.10.20.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 20:00:04 -0800 (PST)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: xuxiaohan@bytedance.com, yulei.sh@bytedance.com, openbmc@lists.ozlabs.org,
 joel@jms.id.au
Subject: [PATCH 1/2] ARM: dts: aspeed: g220a: Enable ipmb
Date: Fri, 11 Dec 2020 12:00:01 +0800
Message-Id: <20201211040002.1030-1-wangzhiqiang.bj@bytedance.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Lotus Xu <xuxiaohan@bytedance.com>

Enable ipmb on i2c4

Signed-off-by: Lotus Xu <xuxiaohan@bytedance.com>
Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
---
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
index 89916a2eec18..3a4bf3db400c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
@@ -453,7 +453,11 @@ channel_3_3: i2c@3 {
 
 &i2c4 {
 	status = "okay";
-
+	ipmb0@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
 };
 
 &i2c5 {
-- 
2.25.1

