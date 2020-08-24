Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A73250AD3
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 23:26:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb4v14hn8zDqRm
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 07:26:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D0eJ4Bth; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb4lR1fkhzDqHf;
 Tue, 25 Aug 2020 07:20:03 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id d4so90619pjx.5;
 Mon, 24 Aug 2020 14:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=g7VV/krJKjpl3fVXGlaNY9/0wsMNumXkPGYdDy0NLaw=;
 b=D0eJ4BthOJUjXlvokWibZqWoBGnjmf0N34bXsEzLNsxiDNvnx22WiQpvgVHLvrVg2U
 YtMPLVrC65sSNGnhPK8hhLrx2TmbixqTyYkl+hDWMJS03TR0g/F4wrt6vK77DrSFsbYS
 PaJ5e97HLwPuuhgK1fkMjLLmsJwzRm0ciHF/9yVqKVaRBUzKR39gdq1TsmsIqcg8koiG
 xqs+F9BBXUai+sDSwGOXIgRyxJneWpqfbckjXvKiWnU7z4h+6Jkw6U6pBbfFBnpFBkzN
 2UWWXngLvD7gZ/arZEHqxolP9I9/LMmrfPDpbUK9uObH7kcXWCOsh0vMK7/6RpBrWfrc
 BsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=g7VV/krJKjpl3fVXGlaNY9/0wsMNumXkPGYdDy0NLaw=;
 b=OxP7Ho9e/NgLR2M0hC0wjw29LAIe7AhCqpa0atyZ1YCvSKK21SNiC4bvqsZD9zfcWS
 KTzvdQ6yGL5u/Xf148vG8I+j3pfA27MhwDHB/6u+kNMs2+ST37EsP0TZsVPQRL2T86rN
 fjbKxXxdoXf6Ghj/of+5xiG3emYKXrIP6zT8W3DUpeo4zm43n7Cx56Xcwrxw1fOtNgdF
 4LtKR6xyoQ46Zt9NL5rfGWzoP1xezYzS/ZXfm7azPMDrXuIJqXMlVtD8nj40/u9a6O9X
 PGVA71MCqOYVWVBIeI0nE5q67pWDqby3azAmP+z+rFSHTry2p5xMBqJY2xHgoo9J4aBN
 gbsQ==
X-Gm-Message-State: AOAM531SewkkS5/rHpfhFvQXleW6cX77GxSSoIVR5wXFtvBhECOvbsgz
 ylve97FQ58w5Y9XUS+97q7g=
X-Google-Smtp-Source: ABdhPJyugdNrli9G6rRXQAqw0VEFn+pFbiLqtwFesKfsieewyGLJXfjSPVXdmt7qTmHtDJGOqkDPfg==
X-Received: by 2002:a17:90a:cb92:: with SMTP id
 a18mr883425pju.80.1598304000683; 
 Mon, 24 Aug 2020 14:20:00 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id t10sm97788pfq.77.2020.08.24.14.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 14:20:00 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 4/5] ARM: dts: aspeed: minipack: Update 64MB FMC flash layout
Date: Mon, 24 Aug 2020 14:19:47 -0700
Message-Id: <20200824211948.12852-5-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824211948.12852-1-rentao.bupt@gmail.com>
References: <20200824211948.12852-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Set 64Mb FMC flash layout in Minipack device tree explicitly because the
flash layout was removed from "ast2500-facebook-netbmc-common.dtsi".

Please note "data0" partition' size is updated to 4MB to be consistent
with other Facebook OpenBMC platforms.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../boot/dts/aspeed-bmc-facebook-minipack.dts | 47 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
index 88ce4ff9f47e..c34741dbd268 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
@@ -88,17 +88,60 @@
  */
 &fmc_flash0 {
 	partitions {
-		data0@1c00000 {
-			reg = <0x1c00000 0x2400000>;
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		/*
+		 * u-boot partition: 384KB.
+		 */
+		u-boot@0 {
+			reg = <0x0 0x60000>;
+			label = "u-boot";
 		};
+
+		/*
+		 * u-boot environment variables: 128KB.
+		 */
+		u-boot-env@60000 {
+			reg = <0x60000 0x20000>;
+			label = "env";
+		};
+
+		/*
+		 * FIT image: 59.5 MB.
+		 */
+		fit@80000 {
+			reg = <0x80000 0x3b80000>;
+			label = "fit";
+		};
+
+		/*
+		 * "data0" partition (4MB) is reserved for persistent
+		 * data store.
+		 */
+		data0@3800000 {
+			reg = <0x3c00000 0x400000>;
+			label = "data0";
+		};
+
+		/*
+		 * "flash0" partition (covering the entire flash) is
+		 * explicitly created to avoid breaking legacy applications.
+		 */
 		flash0@0 {
 			reg = <0x0 0x4000000>;
+			label = "flash0";
 		};
 	};
 };
 
 &fmc_flash1 {
 	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
 		flash1@0 {
 			reg = <0x0 0x4000000>;
 		};
-- 
2.17.1

