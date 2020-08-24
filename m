Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28483250AC7
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 23:24:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb4r21HKSzDqCV
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 07:24:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ufAGhVXR; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb4lN6YJQzDqKl;
 Tue, 25 Aug 2020 07:20:00 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id n3so239165pjq.1;
 Mon, 24 Aug 2020 14:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SHgVSjx2yqDsWyd1CehQGWoYGWtbaX9g6kRsRLnmAA0=;
 b=ufAGhVXRwbazRrjv7wmQP6zZfKBhVZ/beiIhEkc13v34Pt0yqZ/2CnBkHguihWs/I4
 YVrA86gIIEtYVI3RLiE7IMNmrM15lnPVEUP8o/YJVNw7IBZrpaxWgzfYom6WOu93MCYY
 nf8TSgt+JtkARl0PWkihCHzlivtDlEkBSpv76T/gVetbWpf8iPkMg2tWNL0Dg3b9PryQ
 pIyzQIVCjJVbblAmPOjevmlaielNQR6dsPZxZ3s2dYJ29chBvYbtlzqJj4C4UECvOrVs
 hZm6+LC5HmSfIHySDueERLRPOLGmt+7qy612erQL69iRL989e8R56E7KfA319IuVGj3x
 jMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SHgVSjx2yqDsWyd1CehQGWoYGWtbaX9g6kRsRLnmAA0=;
 b=Pp6Ypdaq9A+9+9Qne1YSwZYP828rLuBYXnet4uRNvS/9w1pHu9O7S+E+x7GlHQI+a7
 VZRnbzfdYbgfUtnt1GwpE8tNSXt5cAEWuUiFQojR16V/tob8hB/ecMji9Wgv6dz0kCEL
 5jX2QV2XGGIBwHY8P+5xNOEVOca0bRHqyNTAvl8Wt29PxAUerUIUgG1mitjW7fcI24SM
 kvQHCI4WrHHnnKCZqxyl4mvFUCQi39MHvY/0XeVSlPxMBpas7cFQlX1O+z1yslCK4+5Y
 248rO3EAE7mfXNMvs3crXnIdjcFzYaRKFXdKx+dYNZ0CY+PObOQOMGSOSYar5v0UmVc0
 eLJw==
X-Gm-Message-State: AOAM533h+SaRUPsX3nep14It/lPzNVXM8ITfrXo0oJ1pC9nCDIeo+OQc
 dnZPLVqSRYhriSLDmKIZtIo=
X-Google-Smtp-Source: ABdhPJxGThJ/l6QPVeLfdVw08wwd8JKo0aw6C6gkL9SSwjYxVH1u8R9NldM27eXVXWTW1M08FyOhfQ==
X-Received: by 2002:a17:90b:1004:: with SMTP id
 gm4mr912858pjb.26.1598303998089; 
 Mon, 24 Aug 2020 14:19:58 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id t10sm97788pfq.77.2020.08.24.14.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 14:19:57 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 2/5] ARM: dts: aspeed: cmm: Set 32MB FMC flash layout
Date: Mon, 24 Aug 2020 14:19:45 -0700
Message-Id: <20200824211948.12852-3-rentao.bupt@gmail.com>
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

Set 32MB FMC flash layout in CMM device tree explicitly because the flash
layout settings were removed from "ast2500-facebook-netbmc-common.dtsi".

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
index 7bc7df7ed428..2fb8b147f489 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
@@ -1571,3 +1571,20 @@
 &sdhci1 {
 	status = "disabled";
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

