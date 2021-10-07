Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F51424B08
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 02:16:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPsLw13Wvz308w
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 11:16:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=EitWl8Ql;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=EitWl8Ql; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPsCW2nWkz2yxj;
 Thu,  7 Oct 2021 11:10:15 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 8A47BC9D;
 Wed,  6 Oct 2021 17:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1633565413;
 bh=XbnBokbU4ntbWci1KrAbGbAkUYozeIlG0GRIL9z3qXo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EitWl8QleIUt2OPZiPMJHveL8FiAN7YvAna53lj/V5pHG85jwRgWKeB0Wul/1oG+R
 UK2CqTSLh+QHrGhAwU8tWk6lV+2b9ykqCNlrtjz/Q2VlW7CkoV2BXGK1Yns/FebXek
 MK4ZnWkn9bRJ0AIs3j9nJ8x5SEtyaU6WmkO0dO+U=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 9/9] ARM: dts: aspeed: Add e3c246d4i BIOS flash device
Date: Wed,  6 Oct 2021 17:09:54 -0700
Message-Id: <20211007000954.30621-10-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007000954.30621-1-zev@bewilderbeest.net>
References: <20211007000954.30621-1-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@codeconstruct.com.au>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This uses a dynamic DT node because the BIOS SPI flash requires
significant coordination with the host system (power state tracking,
GPIOs, IPMI messages) before the BMC can touch it, and needs to be
relinquished back to the host when the BMC is done accessing it.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 .../boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
index 9b4cf5ebe6d5..428198703824 100644
--- a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
@@ -68,6 +68,29 @@ flash@0 {
 	};
 };
 
+&spi1 {
+	/*
+	 * The BIOS SPI flash is shared with the host via an external mux, and
+	 * is not accessible by the BMC by default (hence reserved/dynamic
+	 * here rather than okay).  This would ideally be done on the flash@0
+	 * node instead of the spi1 controller, but the driver infrastructure
+	 * to support dynamic devices at that level of the device tree isn't
+	 * currently in place, and it's the only flash chip on this
+	 * controller, so we can get away with the coarser granularity here
+	 * until support for making individual flash chips dynamic is
+	 * available.
+	 */
+	status = "reserved";
+	dynamic;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+	flash@0 {
+		status = "okay";
+		label = "bios";
+		m25p,fast-read;
+	};
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
2.33.0

