Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB9641C3FF
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 13:58:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKFJk5l2gz2yWR
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 21:58:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=gZgRjbpv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=gZgRjbpv; 
 dkim-atps=neutral
X-Greylist: delayed 61020 seconds by postgrey-1.36 at boromir;
 Wed, 29 Sep 2021 21:54:32 AEST
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKFCr2rqkz2xtV;
 Wed, 29 Sep 2021 21:54:32 +1000 (AEST)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 87F68C85;
 Wed, 29 Sep 2021 04:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1632916470;
 bh=8ZmLBz7D/sbq84QJ7vQOxYGraYtGThjNvOcKVo+RF4o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gZgRjbpv0EC0S8V6wVnuUrHB5EN8Kfa4AFQZWHAkb5f5F/Xz8UtB18GhLfgYS1rh5
 w0H9GjeVe/tPLZ/i1gucxKd3zp6DisjwE002E7lZNvgCjWkrnzKMf8dMiujx8cku4x
 4YQOmo/egYbTKBldqdgY4iIZn/42OhmBn8z6w7dU=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 6/6] ARM: dts: aspeed: Add e3c246d4i BIOS flash device
Date: Wed, 29 Sep 2021 04:54:08 -0700
Message-Id: <20210929115409.21254-7-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929115409.21254-1-zev@bewilderbeest.net>
References: <20210929115409.21254-1-zev@bewilderbeest.net>
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
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 .../arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
index 9b4cf5ebe6d5..456f4de53869 100644
--- a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
@@ -68,6 +68,22 @@ flash@0 {
 	};
 };
 
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+	flash@0 {
+		/*
+		 * The BIOS SPI flash is shared with the host via an
+		 * external mux, and is not accessible by the BMC by
+		 * default (hence "reserved" rather than "okay").
+		 */
+		status = "reserved";
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

