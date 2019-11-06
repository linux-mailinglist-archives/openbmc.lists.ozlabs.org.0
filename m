Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1E5F11FC
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 10:19:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477LbG2M0gzF3dF
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 20:19:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cQpY/s5r"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477LXM0nkRzDqJq
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 20:17:22 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id l24so16711091pgh.10
 for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2019 01:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xBPKhGichj8OQ9DTklgejmVVV3qOA6fTF81ryDQr0jU=;
 b=cQpY/s5rMfi5EqwDPHF2QERpntSS/o10idS9nSjEAF3Ds5lqsx03Hw2z1szhqWVCHx
 C9KX3WweaWKanmMGUCkU/V9h5+mHBVpGGFBMkxtywIfv3KgprWttODhCkjAHqItm/vfV
 cg9mQtPsZT3MO4TPKw3UDZ4MZ2x8MagVNeoVkQdKvNz586xo8j79jDj7iTTHlox6Wcdo
 5/lf9x8OeGTRbdFDGDtGQe6VyeZTlkmJt9jDjSd/c7Y1XuCPy8FasONYd/pogpDuQJCi
 M/I1N8JdNfchu6vn9uGFOKNBk/iSAeSVImzQ2fOySzONxE3tz40lAPqT3ybD1Fwafaqe
 nLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xBPKhGichj8OQ9DTklgejmVVV3qOA6fTF81ryDQr0jU=;
 b=uQUZkQG+WJCR5Y2prlcenc7ylpcmrQQ77JZvO1hOsYGKPXEGnP5uTFxNaZH/JDASju
 L59MxYTcfWZI4QlKe7225WrEbX/+qqWpUyRWeRgIqS3iaGqa775ytF4yCUwejyDFwiRx
 lgrx22W6x21hHqPCVWSiIRgPD815PKSLEOJM84efhQ77O0ua22lTk1mPKf/GHYiOwGR5
 vWxkgu0s017pEn2LNeZBfQLK04r5FtIP3eBkFgWZzySnmTdZY091Q7u4GjxaHPze6miq
 YzuY3Z0WpUV4l2cSRWp48cqkb7IyN3cDM9VbrkaBdYCJrlrNALw0TvtGojsdGm8FmHrI
 zPpA==
X-Gm-Message-State: APjAAAUThyfMr0HjaJCyU+pXfwXtRJynLDu1ccgPygHtXhZKYcC7UVtq
 SFXE/U9YJx9RqTyfS+dRR0DgaG+FiA0=
X-Google-Smtp-Source: APXvYqyom/R6D61dhgVqsnGRLdTbimrO7RkzoaYUob51jM+aXUk0/NTmwHQAKTC46v8UuVx/wtkzOw==
X-Received: by 2002:a63:e60e:: with SMTP id g14mr1237809pgh.80.1573031839947; 
 Wed, 06 Nov 2019 01:17:19 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id j25sm21144182pfi.113.2019.11.06.01.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 01:17:19 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-5.3 1/4] ARM: dts: aspeed-g6: Add timer description
Date: Wed,  6 Nov 2019 19:47:02 +1030
Message-Id: <20191106091705.7416-2-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191106091705.7416-1-joel@jms.id.au>
References: <20191106091705.7416-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The AST2600 has 8 32-bit timers on the APB bus.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 6db29ee769d5..e574254f298d 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -310,6 +310,21 @@
 				status = "disabled";
 			};
 
+			timer: timer@1e782000 {
+				compatible = "aspeed,ast2600-timer";
+				reg = <0x1e782000 0x90>;
+				interrupts-extended = <&gic  GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+						<&gic  GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+						<&gic  GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+						<&gic  GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+						<&gic  GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+						<&gic  GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+						<&gic  GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
+						<&gic  GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				clock-names = "PCLK";
+                        };
+
 			uart1: serial@1e783000 {
 				compatible = "ns16550a";
 				reg = <0x1e783000 0x20>;
-- 
2.24.0.rc1

