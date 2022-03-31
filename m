Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF234ED1B3
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 04:25:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTRx33739z2yPv
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 13:25:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=buwota9W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=buwota9W; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTRw06671z2y0B
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2022 13:24:48 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 5A6AF497;
 Wed, 30 Mar 2022 19:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1648693484;
 bh=5tqPMlfgjBS/krqHw0aXsQR0VZ6bcG/ODgpNFGKyDDQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=buwota9WVu/vdy8W/fApI7wu1pQpnKu5DyFBY+KAwlGhj43ZxoxVo4NwIgf79hp40
 y3cyKdFzaAT51+XsRQUKvCqqdeHRrBIc7bCUHFTxP82oqVYtIWYuOVs7aqwlXJy5dF
 SLMFOmMHxr3rFh7MUTkBO1KC7MILfZItH1KBv/Kc=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 2/2] ARM: dts: aspeed: romed8hm3: Fix GPIOB0 name
Date: Wed, 30 Mar 2022 19:24:25 -0700
Message-Id: <20220331022425.28606-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331022425.28606-1-zev@bewilderbeest.net>
References: <20220331022425.28606-1-zev@bewilderbeest.net>
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
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This GPIO was mislabeled as DDR_MEM_TEMP in the schematic; after a
correction from ASRock Rack its name now reflects its actual
functionality (POST_COMPLETE_N).

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
index 572a43e57cac..ff4c07c69af1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
@@ -198,7 +198,7 @@ &gpio {
 	gpio-line-names =
 		/*  A */ "LOCATORLED_STATUS_N", "BMC_MAC2_INTB", "NMI_BTN_N", "BMC_NMI",
 			"", "", "", "",
-		/*  B */ "DDR_MEM_TEMP", "", "", "", "", "", "", "",
+		/*  B */ "POST_COMPLETE_N", "", "", "", "", "", "", "",
 		/*  C */ "", "", "", "", "PCIE_HP_SEL_N", "PCIE_SATA_SEL_N", "LOCATORBTN", "",
 		/*  D */ "BMC_PSIN", "BMC_PSOUT", "BMC_RESETCON", "RESETCON",
 			"", "", "", "PSU_FAN_FAIL_N",
-- 
2.35.1

