Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D04D038E52A
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 13:14:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpZNf5prgz306K
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 21:14:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpZNQ3Sjqz2yxq;
 Mon, 24 May 2021 21:14:11 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14OB0oks024990;
 Mon, 24 May 2021 19:00:50 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 May 2021 19:13:44 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 "moderated list:ASPEED PINCTRL DRIVERS" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
 "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/3] pinctrl: pinctrl-g6: Add the 2nd sgpio
Date: Mon, 24 May 2021 19:13:34 +0800
Message-ID: <20210524111338.16049-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14OB0oks024990
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
Cc: billy_tsai@aspeedtech.com, ryan_chen@aspeedtech.com,
 steven_lee@aspeedtech.com, Hongweiz@ami.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

AST2600 has 2 SGPIO master interfaces one with 128 pins and another one
has 80 pins, it also supports 2 SGPIO slave interfaces.
However, there is only the first sgpio master/slave interface defined in
dtsi and pinctrl driver.
The patch series adds the second SGPIO master and slave interfaces
in dt-bindings, dtsi and pinctrl driver.

Please help to review.

Thanks,
Steven

Steven Lee (3):
  dt-bindings: pinctrl: Update enum for adding SGPM2 and SGPS2
  ARM: dts: aspeed-g6: Add pinctrl settings
  pinctrl: pinctrl-aspeed-g6: Add sgpio pinctrl settings

 .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 10 ++++----
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi      | 10 ++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    | 24 +++++++++++++++----
 drivers/pinctrl/aspeed/pinmux-aspeed.h        |  9 +++++++
 4 files changed, 44 insertions(+), 9 deletions(-)

-- 
2.17.1

