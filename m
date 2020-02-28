Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2549A172EB2
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 03:16:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TCnX66PszDqwJ
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 13:16:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UZutASD0; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TCcd15y9zDqvr;
 Fri, 28 Feb 2020 13:08:17 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id o24so836966pfp.13;
 Thu, 27 Feb 2020 18:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=S4kJGuEJfAjfPYh/Ew20Fs75jjdr/lDPxEC7XvHdiQ4=;
 b=UZutASD0HqaUsmZQ28/j4nBb0ea4qnMjWg42ddLNpUQYkPvicXpWWaj+s0HbQjY6UE
 rcOytnas6HACXzfJ5qU6ObxXqRQdL4vZJPEIQDJlMXPh+LU6m2g3a1iL2d26ImThm4dn
 V9pDMYHqNXEWA7T7Lm+c3vITxW0NmH0bUckrlby8M4g2CZY3uwbLeyJfqQFZhMWHwXa+
 ZiMNMP/6oZd7iVbJd8WKby+deNCmiz/TqUzsw79RXaWJ5k4dVQhcp4skiqJXB2AOyANz
 cM7IopAYZcZxoAY9bFG9vt/ENAhgu70gjFRm7ILiD8A5xlaPqo3BGudTld5x6mE9Lg4f
 INLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=S4kJGuEJfAjfPYh/Ew20Fs75jjdr/lDPxEC7XvHdiQ4=;
 b=LZiInMvuKDI4RwqwxTqfNF6m7N3rzfqlpXJ6FqwZ7V0f3ZY7BZcpmGU8iq2sO+UTWU
 tRcvzNVELdogJPCm39VbsHJaR03fMXRc+Yf+J5PrHc3VDjpO4vzELqBdSV+2mABTp2B8
 /Uo6AlL9SsvulIml5+eT+T2w7dv0hHe4gh49a55yMXseY77EzMXTuvhqFbVUebIy96JO
 2CGg+7Oq9TXnJykPC/uZmoFVEVgeKgZs7ZhFIOaXUulnuRdrHgo/9Jkoji80NxVvJjTC
 bGfnPI7uZVGJgeKBA+dnrP+bfccyDjWKESgi7xSulvp3/5hHUsIfcZw7F4QWqjepNZj4
 W3Qg==
X-Gm-Message-State: APjAAAVYNqCxNduJqHtxBij6OnbyaZ2CWkPXUevNiPRGa9vR1+qQfezs
 PXEe0x10WJN3eKgh6oaV6ks=
X-Google-Smtp-Source: APXvYqyyuwzFsaoesPovGGYPfNjv0U27sfwo1cNSj3VSdjUokF67ekm0yo1YUh2GET9uSjk0VZpl5w==
X-Received: by 2002:a62:f251:: with SMTP id y17mr2111805pfl.204.1582855695286; 
 Thu, 27 Feb 2020 18:08:15 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::4:d8f5])
 by smtp.gmail.com with ESMTPSA id k24sm4931972pgm.61.2020.02.27.18.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 18:08:14 -0800 (PST)
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
Subject: [PATCH v6 5/7] ARM: dts: aspeed-g5: add vhub port and endpoint
 properties
Date: Thu, 27 Feb 2020 18:07:55 -0800
Message-Id: <20200228020757.10513-6-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228020757.10513-1-rentao.bupt@gmail.com>
References: <20200228020757.10513-1-rentao.bupt@gmail.com>
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
Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 No change in v2/v3/v4/v5/v6.
   - It's given v6 to align with the version of the patch series.

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

