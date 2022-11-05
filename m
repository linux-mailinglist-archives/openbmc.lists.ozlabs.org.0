Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9178161A6AC
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 02:35:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N40RV2qfyz3cLX
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 12:35:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Jk7aKEiT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Jk7aKEiT;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N40Pp05HXz3bj1;
	Sat,  5 Nov 2022 12:33:34 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 85675F1;
	Fri,  4 Nov 2022 18:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1667612008;
	bh=0kVuSBCQW7dnCQkFGMlB2Vk2wcSiucoD2YkTfpm6/UE=;
	h=From:To:Cc:Subject:Date:From;
	b=Jk7aKEiTgjXw62nT31xtCXGFBdlrNRSFQ7kKgJfUIboZnpAnHCfBNkgFgeOLbU1YJ
	 7LQX+XtTq5P87Zznn2sw33zKvSquli93DmVKKR/F4PzmTEgMhU5woq3o33lOluErzW
	 0Vf781mWTnh83efDGWXvSyznyj8ipZtO7ReT5DyA=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	soc@kernel.org
Subject: [PATCH 0/2] ARM: dts: aspeed: Add Delta AHE-50DC BMC
Date: Fri,  4 Nov 2022 18:33:19 -0700
Message-Id: <20221105013321.2719-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.38.1
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
Cc: devicetree@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This series adds a device-tree for the BMCs of the Delta AHE-50DC
Open19 power shelf.  The first patch adds a compat entry to the Aspeed
bindings; the second adds the device-tree itself.


Thanks,
Zev

Zev Weiss (2):
  dt-bindings: arm: aspeed: document Delta AHE-50DC BMC
  ARM: dts: aspeed: Add Delta AHE-50DC BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/Makefile                    |    1 +
 .../arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts | 1094 +++++++++++++++++
 3 files changed, 1096 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts

-- 
2.38.1

