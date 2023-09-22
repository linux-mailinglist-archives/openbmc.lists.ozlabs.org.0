Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 739567AAFC8
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 12:43:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=HYc56Al+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsTQ72XcTz3dmB
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 20:43:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=HYc56Al+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsTPS5cSrz3clZ;
	Fri, 22 Sep 2023 20:42:52 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 6859F71B;
	Fri, 22 Sep 2023 03:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1695379370;
	bh=38Kbb7gGkyqodA4KPBC9VNUY13Zo33fOgrid7RcPgZk=;
	h=From:To:Cc:Subject:Date:From;
	b=HYc56Al+GgE8ZqC0VehhO511PydhQ4g4f5KY6ViILEw0QgrT2tblOlRIzu0eUZHGa
	 7fraUyodeYrjrGDHc6K/tF7pQyj6TifG6UbfnIi3QllNLMaCNKGia/7HQAtQrmuYF4
	 0/JyPoFfJ92u+7u5RNG7qbRzDTYPrlEOouyh66Oo=
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@aj.id.au>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"Milton D. Miller II" <mdmii@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] watchdog: aspeed: Add aspeed,reset-mask property
Date: Fri, 22 Sep 2023 03:42:32 -0700
Message-ID: <20230922104231.1434-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.42.0
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
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>, Eddie James <eajames@linux.ibm.com>, =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

These patches add a new aspeed,reset-mask DT property for the Aspeed
watchdog timer, which specifies exactly which peripherals should be
reset by the watchdog timer.

This series is a replacement for a patch I sent earlier [0], though
using an entirely different (DT-based) approach and hence not exactly
a v2.

I've tested these patches on ast2500 hardware and a qemu ast2600
model; test results on actual ast2600 hardware would be welcome.


Thanks,
Zev


[0] https://lore.kernel.org/linux-watchdog/20230922013542.29136-2-zev@bewilderbeest.net/

Zev Weiss (2):
  dt-bindings: watchdog: aspeed-wdt: Add aspeed,reset-mask property
  watchdog: aspeed: Add support for aspeed,reset-mask DT property

 .../bindings/watchdog/aspeed-wdt.txt          | 18 +++-
 drivers/watchdog/aspeed_wdt.c                 | 11 +++
 include/dt-bindings/watchdog/aspeed-wdt.h     | 92 +++++++++++++++++++
 3 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/watchdog/aspeed-wdt.h

-- 
2.40.0.5.gf6e3b97ba6d2.dirty

