Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0190D197390
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 06:50:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rKkr5xjrzDqBx
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 15:49:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sd6FpU05; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rKgx4gl0zDqWW
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 15:47:25 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id j1so8022691pfe.0
 for <openbmc@lists.ozlabs.org>; Sun, 29 Mar 2020 21:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DhwPfzaz2g9EG0GOVe87Wha6FA6DWEuicUqyz1rsA7o=;
 b=sd6FpU05vb7AOr3M9fjkq/IijTkclHi80B6bBGvzc8qkCofDK+QZatEk3biDxf30qu
 NCvR8DubIbcW6v0eVyvQ6cQL6DBY26e4Xu0D5AwAWRvnWorQvnOLISPuTDx4DTnJP7eC
 M9PA4nrITg8VS5oHI5jE9Xl2nkNRbf0m+U8owEp3o6B6Lb3PIeoW7ylQRga6/FmPILzf
 5i7OOeVXwfRHWd4NZKLm1hRKN5wrZSvChuPn0qhWJdR2pN997y+r8r6DcdkyqhY9wnBe
 G19GK453WWK3MLB2uOzQESQWhQR9NCBXsvcopfgRmwwrgTCvNGKkef+6/qRaw2hY4WMX
 Na/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DhwPfzaz2g9EG0GOVe87Wha6FA6DWEuicUqyz1rsA7o=;
 b=Xzyxp8Q7t9+84oz/yNZEkZ5rpnmQHakBmqVlRDQsHH/2qC2yvxw3WPjMZGkwYXcuyq
 yywkTMhOGMieC9RujLaIpsBKCk4meUBVJIU5Opye+wOpmb6LfPfa/IyVOzmieu17LGev
 lqJrP+gzyP525ArFUGMhqzjhD1JWHM6G2/CbSNzE4H1zW/E20Ze/AXqGfaY9ouLLXpcA
 16On1ZMbFiaqmRkt5b65645fWPY8vPkJlaSX/8ioNL+z2KbbGQvltaT+m/V+94udYpec
 Te/96HRRNQj92gcjsaqXgdy+yiAqurRqXZ3JeYHVrs2FSq6njVrzCMiagmchtt6fSkRt
 gV3g==
X-Gm-Message-State: ANhLgQ3v1UXolEd5YJb4V2WL1yqkfYtqf5EbYCmtX3U203KwJq9P+zYL
 XM6B3HZZOlsqM6yp6ovmUlA=
X-Google-Smtp-Source: ADFU+vvqrrFK9pHkl05bnubJ819DUESILvd/2BSmAP9loIioRLi9hPxl5MZLN0pmSJiqxOt/b/GVBg==
X-Received: by 2002:a63:e80a:: with SMTP id s10mr10952835pgh.189.1585543643037; 
 Sun, 29 Mar 2020 21:47:23 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id x27sm9239537pfj.74.2020.03.29.21.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 21:47:22 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Eddie James <eajames@linux.ibm.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] ARM: dts: aspeed: raininer: Enable XDMA
Date: Mon, 30 Mar 2020 15:17:08 +1030
Message-Id: <20200330044708.195184-3-joel@jms.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330044708.195184-1-joel@jms.id.au>
References: <20200330044708.195184-1-joel@jms.id.au>
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

The XDMA device uses the VGA reserved memory region.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 708924fe42cb..a8095aa88dbe 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -748,3 +748,8 @@
 		spi-max-frequency = <100000000>;
 	};
 };
+
+&xdma {
+        status = "okay";
+        memory-region = <&vga_memory>;
+};
-- 
2.25.1

