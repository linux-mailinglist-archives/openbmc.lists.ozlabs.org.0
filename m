Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7275A161F69
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 04:17:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48M5dS6btpzDqVV
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 14:17:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.196;
 helo=mail-pg1-f196.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RfQkKQAV; dkim-atps=neutral
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48M5Yk5pMpzDqSw;
 Tue, 18 Feb 2020 14:14:34 +1100 (AEDT)
Received: by mail-pg1-f196.google.com with SMTP id b35so10075505pgm.13;
 Mon, 17 Feb 2020 19:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EQI/kEWqaRT05sdkpbc+otag3aOOl2fGYGdTqjeEub0=;
 b=RfQkKQAVEtw73teRP3nMOcC+47nA0yiJ4PiE8RrwCmIBAqJpYsq7mu2qzB+46qjTwC
 1mk9sU9Ne7GvPU88/TiuEHAiMFGe32f/GVMwPwqJQ0EuS44mUrbTgpzW047Ra8mgPQb6
 IuVthqAfXBWP50mkJhsyYZXlYwREhkaEK5ooDyZxoQOInwm0SGFkP50D3F21MSF1D+42
 5jywXnyJPJVd7mVLN2cbNIe/OrhrNHr5rgDYe0bGOR4c+nvuVNiQAWpnIGGvkrf1uroE
 D8GJwoqfLr5rUNAY5Jtp6kW+9VK7CLePxq+ggqtZm5bVCTgd5ab8HyfTbWaQCRPtMuxf
 kgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EQI/kEWqaRT05sdkpbc+otag3aOOl2fGYGdTqjeEub0=;
 b=OVYVJN1q3GpagXw1B3uMPPlepj+9qcOUzsRbks/Sg0X7TrBbcpnELMkhnnDI1Pw6Sr
 GbyACusQJudSIEh7kFh+vNyS2F4EkP8xcwnUzpuqzmNQ2Yu35e/GVNQF0wznRJj/DoQ5
 TLH980fVpFnVzkbEATi546RwfZpjR5hr2AZQ78PJh/H6zFmGTwDp3/IQAKE2q3zAaDZo
 7tCbIN33EazmgiAwEwj0ZTUOGgn6sNyFNcpt2VFBrhC+Sbd+rDz1waw13vuktrKOp6b+
 1ntu4NiWH0VSwrzyx2MwLYhSnPWxCKNEJHovV8wu4uqmgo24q4B1gpyBcbeA+iakDaoX
 1vdw==
X-Gm-Message-State: APjAAAUjUA8VG2aR+2bA85zIBMP2WNV4s4O+3VwddkGtacFvXbnfQwu+
 6L1jFrzMcJAvn8FdBdUsy2g=
X-Google-Smtp-Source: APXvYqwnUHiPwKDCgZewpALos3LF//BC5zWLk7GsTKsck7hxFh7pTlxPH2I3QfP2zhB1wSr/zmv7pg==
X-Received: by 2002:a63:5220:: with SMTP id g32mr20411835pgb.116.1581995612091; 
 Mon, 17 Feb 2020 19:13:32 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:180::6f94])
 by smtp.gmail.com with ESMTPSA id b18sm1812595pfd.63.2020.02.17.19.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 19:13:31 -0800 (PST)
From: rentao.bupt@gmail.com
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v3 4/5] ARM: dts: aspeed-g5: add vhub port and endpoint
 properties
Date: Mon, 17 Feb 2020 19:13:14 -0800
Message-Id: <20200218031315.562-5-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218031315.562-1-rentao.bupt@gmail.com>
References: <20200218031315.562-1-rentao.bupt@gmail.com>
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

Add "aspeed,vhub-downstream-ports" and "aspeed,vhub-generic-endpoints"
properties to describe supported number of vhub ports and endpoints.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 No changes in v2/v3.
   - It's given v3 to align with the version of the patch series.

 arch/arm/boot/dts/aspeed-g5.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index ebec0fa8baa7..f12ec04d3cbc 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -195,6 +195,8 @@
 			reg = <0x1e6a0000 0x300>;
 			interrupts = <5>;
 			clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
+			aspeed,vhub-downstream-ports = <5>;
+			aspeed,vhub-generic-endpoints = <15>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_usb2ad_default>;
 			status = "disabled";
-- 
2.17.1

