Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B44C46FDEE
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 10:37:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9Qlv6YK5z3c7R
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 20:36:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=2HZ8pFJ9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=2HZ8pFJ9; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9QlT3j5gz2xg3
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 20:36:37 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id m15so7551094pgu.11
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 01:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FFsQwjzhgSyKAUENvfBIFY+4uCH9mkGIaj8EHI/MgtM=;
 b=2HZ8pFJ96JZLj13duu4Zv3yCHVfq4Zvb5DObtluxYN8pRA1VHPgMn5e/SuxAL7/6gs
 8PP7cNkLq+G0iKZxU+8Nhy8efBi1gVoxsJ8GCrVdrqtlL8oF2tBhAW0PCxrKoV9eGh4K
 9gNDtwRri8Q8OvRKv/gG/jQ/8HvZiIw4kpMv+DIicaEAfG5RM16QsLKePuKPDQS84AY+
 lsJbF11WJCzp+Ny9jl1qFWpabfTll6zWZngYHtujZ5WtMYKJMxuHvvU76e3/+gWjYXxy
 hwKASuGz+uKCPSmOY5DUTGipvxCHMUu5X0gOs98LNqECU1qDq0k0/f3ls+z36jTtmIeA
 a2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FFsQwjzhgSyKAUENvfBIFY+4uCH9mkGIaj8EHI/MgtM=;
 b=Y30tyhKylsJFajWMI+dkF9FIfD7qROLORMZgV+R5Gx80UMyIJnchKzFt/Cjwq+kWdr
 VUI13GgIPLRfb3TkR7w5UCgack1SGZrDtuQ01H64noLZYq3MZAHr3N4TyA5KU1VEULYZ
 MxdywDWXo2/yO7laHA8drLbx3byJcQIN6Q48pSHD6MppD4kMy31KhuzN6Ppj3qkOhCGw
 2+8l8C4VIK5RfmHSkfzK6KghZ+xhgddO1mPKeOb05edLs8jUhRyzv6npdS07QE93fIqZ
 T0kYpr9hfnIpQu2zQlGVmHPqbUXIuNvNSYgpuBjHbxlZziTzJvY9yp5ip6URINrQhBpN
 hfLA==
X-Gm-Message-State: AOAM532uIJ615Dq6YW8m/aPH13DP7NHWEC6qu9tuzss+3iDzuN2NJYbo
 6syaFsCSfCy+2uPEKw4PTjTzog==
X-Google-Smtp-Source: ABdhPJxfgd7xqWpUed8nHPtc7th4BGQX/oU3cVlecMdpTmljzsHJb1raImLHfPrW51SVtK7EXikrhA==
X-Received: by 2002:a05:6a00:1783:b0:49f:c134:c6e2 with SMTP id
 s3-20020a056a00178300b0049fc134c6e2mr17192053pfg.0.1639128994705; 
 Fri, 10 Dec 2021 01:36:34 -0800 (PST)
Received: from localhost ([49.7.45.40])
 by smtp.gmail.com with ESMTPSA id mn15sm2263884pjb.35.2021.12.10.01.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 01:36:34 -0800 (PST)
From: Lei YU <yulei.sh@bytedance.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc <openbmc@lists.ozlabs.org>
Subject: [PATCH] ARM: dts: aspeed: g220a: Enable secondary flash
Date: Fri, 10 Dec 2021 17:36:23 +0800
Message-Id: <20211210093623.2140640-1-yulei.sh@bytedance.com>
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
Cc: Lei YU <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable the secondary flash of the g220a's BMC and the wdt2.

Signed-off-by: Lei YU <yulei.sh@bytedance.com>
---
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
index 01dace8f5e5f..05f392f42960 100644
--- a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
@@ -260,6 +260,13 @@ flash@0 {
 		spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout-64.dtsi"
 	};
+	flash@1 {
+		status = "okay";
+		label = "alt-bmc";
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64-alt.dtsi"
+	};
 };
 
 &spi1 {
@@ -278,6 +285,10 @@ &adc {
 	status = "okay";
 };
 
+&wdt2 {
+	aspeed,alt-boot;
+};
+
 &gpio {
 	status = "okay";
 	gpio-line-names =
-- 
2.25.1

