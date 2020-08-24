Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 196D6250AD0
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 23:25:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb4sQ0gNlzDqLF
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 07:25:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QXxLh7Vt; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb4lQ1Cl2zDqRM;
 Tue, 25 Aug 2020 07:20:01 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id o13so5278884pgf.0;
 Mon, 24 Aug 2020 14:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rXBG77uZ+juZ55nF2nk//sAT0YipNn7g2EO+5+pDj1E=;
 b=QXxLh7Vt6vSOsYqAnE3CpFos70Yk4e3pu5/M0Pix5/hJ909bsaOIymUxSaW11DFDvT
 tXlYnpaWTyEHjGILHAq4GOuXRuKrWA0uafYsecqWN3lkZN9llUGOOyzyZNXvFJOO6VuI
 nXG1TIkS23PQpmbJ3vgmXjvBnwq4GNY37tHuHCv899iSG4tQ00pqYjct4OZS8OA9leHc
 paD2aMk0PgA5a7CZKbqlxsZraUp33AzRU97OI2UtyMF64gplUtNoCp16latnABJqVuxQ
 ZADC9RVxrryGuOiN3TvSAxIaKstLOldkMYwbDk8pxBYNMyMGp/4dTCS3e1v7UjjPmQVr
 THQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rXBG77uZ+juZ55nF2nk//sAT0YipNn7g2EO+5+pDj1E=;
 b=h2Jz459ftzbSSEPOozLbkWdAoeKzkl2qUYVBdWqCADWsEnUUEWk+BEm49BnDPgZKUN
 goo9GH6qHpdJwdp8VuAJjCRdjh4AC0e9dgCenkyS+r0CM0m56RcV4GSHF5FSxPMuxlq9
 w+LCkE8P2kLK4Mi/nPg7vsy3GloFNSaa1TrCK4QhoeybnlhAeTYklQMTy/Ie+3yPD2s8
 zJpKLuT1Y6iFsegjaKGN5T2VSTLy+TiMWuiZEG9e5d2ejRKKGM63X+97DG356Kq5TJS9
 aBGjAU5Xzjcq8RoQb1WTKHd5YUn5qR8aOS/X2BfGUU5AtaCugl+NEBt5LhZ4bQOpIEkJ
 sQdg==
X-Gm-Message-State: AOAM533gCYv+JwuAK6X+KLZlmNv7s/p3EFcLsmWk+94J/txWlrXjWunV
 t/K72pxJuMANAFOK9JdYBCNe6JXKCmqeDnJy
X-Google-Smtp-Source: ABdhPJz04w77u6/hGINaTXWQWFtFKH3m7WKP9npNSL5MEyNDMXnSp3StFRYm+WPchS3GBDJQxccaTA==
X-Received: by 2002:aa7:8285:: with SMTP id s5mr5365120pfm.226.1598303999175; 
 Mon, 24 Aug 2020 14:19:59 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id t10sm97788pfq.77.2020.08.24.14.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 14:19:58 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 3/5] ARM: dts: aspeed: yamp: Set 32MB FMC flash layout
Date: Mon, 24 Aug 2020 14:19:46 -0700
Message-Id: <20200824211948.12852-4-rentao.bupt@gmail.com>
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

Set 32MB FMC flash layout in Yamp device tree explicitly because flash
layout settings were removed from "ast2500-facebook-netbmc-common.dtsi".

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts
index fe2e11c2da15..5e6105874217 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts
@@ -108,3 +108,20 @@
 &i2c13 {
 	status = "okay";
 };
+
+&fmc_flash0 {
+#include "facebook-bmc-flash-layout.dtsi"
+};
+
+&fmc_flash1 {
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		flash1@0 {
+			reg = <0x0 0x2000000>;
+			label = "flash1";
+		};
+	};
+};
-- 
2.17.1

