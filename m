Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7A09037E5
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2024 11:33:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz3Py11Spz3cYP
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2024 19:33:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=gmail.com (client-ip=62.142.5.84; helo=fgw23-7.mail.saunalahti.fi; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vz3P767TFz3cLQ
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2024 19:32:42 +1000 (AEST)
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 61bcbe87-27d5-11ef-80ea-005056bdfda7;
	Tue, 11 Jun 2024 12:31:31 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v1 0/4] pinctrl: nuvoton: A few cleanups
Date: Tue, 11 Jun 2024 12:30:21 +0300
Message-ID: <20240611093127.90210-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.2
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, Shan-Chun Hung <schung@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Convert Nuvoton drivers to use pin control provided data types
and more of device property APIs.

Not tested.

Andy Shevchenko (4):
  pinctrl: nuvoton: Convert to use struct pingroup and
    PINCTRL_PINGROUP()
  pinctrl: nuvoton: Make use of struct pinfunction and
    PINCTRL_PINFUNCTION()
  pinctrl: nuvoton: Convert to use struct group_desc
  pinctrl: nuvoton: Reduce use of OF-specific APIs

 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 116 ++++++++++------------
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c  |   1 -
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c |  43 ++------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c |  29 ++----
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c |  11 +-
 5 files changed, 71 insertions(+), 129 deletions(-)

-- 
2.45.2

