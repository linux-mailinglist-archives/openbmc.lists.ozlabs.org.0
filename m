Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAEF686463
	for <lists+openbmc@lfdr.de>; Wed,  1 Feb 2023 11:36:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6JHw6NKpz3f4b
	for <lists+openbmc@lfdr.de>; Wed,  1 Feb 2023 21:36:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6JG8301bz3cNY;
	Wed,  1 Feb 2023 21:35:12 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 311AMJwS097433;
	Wed, 1 Feb 2023 18:22:19 +0800 (GMT-8)
	(envelope-from ryan_chen@aspeedtech.com)
Received: from aspeedtech.com (192.168.10.13) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Feb
 2023 18:34:04 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel
	<p.zabel@pengutronix.de>, <openbmc@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/3] Add ASPEED AST2600 I2C new controller driver
Date: Wed, 1 Feb 2023 18:33:56 +0800
Message-ID: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.13]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 311AMJwS097433
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series add AST2600 i2c new register set driver. The i2c new
register set have new clock divider option for more flexiable generation.
And also have separate i2c master and slave register set for control.

v4:
-fix i2c-ast2600.c driver buffer mode use single buffer conflit in
 master slave mode both enable.
-fix kmemleak issue when use dma mode.
-fix typo aspeed,i2c-ast2600.yaml compatible is "aspeed,ast2600-i2c"
-fix typo aspeed,i2c-ast2600.ymal to aspeed,i2c-ast2600.yaml

v3:
-fix i2c global clock divide default value.
-remove i2c slave no used dev_dbg info.

v2:
-add i2c global ymal file commit.
-rename file name from new to ast2600.
 aspeed-i2c-new-global.c -> i2c-ast2600-global.c
 aspeed-i2c-new-global.h -> i2c-ast2600-global.h
 i2c-new-aspeed.c -> i2c-ast2600.c
-rename all driver function name to ast2600.

Ryan Chen (3):
  dt-bindings: i2c-ast2600: Add support for AST2600 I2C global
    controller
  dt-bindings: i2c-ast2600: Add support for AST2600 i2C driver
  i2c: aspeed: support ast2600 i2c new register mode driver

 .../i2c/aspeed,i2c-ast2600-global.yaml        |   44 +
 .../bindings/i2c/aspeed,i2c-ast2600.yaml      |   78 +
 MAINTAINERS                                   |   10 +
 drivers/i2c/busses/Kconfig                    |   11 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/i2c-ast2600-global.c       |   94 +
 drivers/i2c/busses/i2c-ast2600-global.h       |   19 +
 drivers/i2c/busses/i2c-ast2600.c              | 1811 +++++++++++++++++
 8 files changed, 2068 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600-global.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.yaml
 create mode 100644 drivers/i2c/busses/i2c-ast2600-global.c
 create mode 100644 drivers/i2c/busses/i2c-ast2600-global.h
 create mode 100644 drivers/i2c/busses/i2c-ast2600.c

-- 
2.34.1

