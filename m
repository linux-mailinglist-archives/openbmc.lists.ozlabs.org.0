Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE07B527DD5
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 08:51:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1qfJ5P2Vz3c9H
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 16:51:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=ryan_chen@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1qcm4W6hz3bvl
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 16:50:00 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 24G6ZVWc064016;
 Mon, 16 May 2022 14:35:31 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 May
 2022 14:49:04 +0800
From: ryan_chen <ryan_chen@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Philipp
 Zabel <p.zabel@pengutronix.de>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: [PATCH v3 0/3] Add ASPEED AST2600 I2C new controller driver
Date: Mon, 16 May 2022 14:48:57 +0800
Message-ID: <20220516064900.30517-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24G6ZVWc064016
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series add AST2600 i2c new register set driver. The i2c new
register set have new clock divider option for more flexiable generation.
And also have separate i2c master and slave register set for control.

v3:
-fix i2c global clock divide default value
-remove i2c slave no used dev_dbg info.
 
v2:
-add i2c global ymal file commit
-rename file name from new to ast2600.
 aspeed-i2c-new-global.c -> i2c-ast2600-global.c
 aspeed-i2c-new-global.h -> i2c-ast2600-global.h
 i2c-new-aspeed.c -> i2c-ast2600.c
-rename all driver function name to ast2600

ryan_chen (3):
  dt-bindings: i2c-ast2600: Add bindings for AST2600 i2C global register
    controller
  dt-bindings: i2c-ast2600: Add bindings for AST2600 i2C driver
  i2c:aspeed:support ast2600 i2c new register mode driver

 .../i2c/aspeed,i2c-ast2600-global.ymal        |   44 +
 .../bindings/i2c/aspeed,i2c-ast2600.ymal      |   78 +
 drivers/i2c/busses/Kconfig                    |   11 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/i2c-ast2600-global.c       |   94 +
 drivers/i2c/busses/i2c-ast2600-global.h       |   19 +
 drivers/i2c/busses/i2c-ast2600.c              | 1703 +++++++++++++++++
 7 files changed, 1950 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600-global.ymal
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.ymal
 create mode 100644 drivers/i2c/busses/i2c-ast2600-global.c
 create mode 100644 drivers/i2c/busses/i2c-ast2600-global.h
 create mode 100644 drivers/i2c/busses/i2c-ast2600.c

-- 
2.17.1

