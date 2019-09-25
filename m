Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7B3BDE6B
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 15:00:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ddSg4f1YzDqbg
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 23:00:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ddNb0852zDqDl
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 22:56:29 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH v4 linux dev-5.3 00/10] ARM: dts: aspeed-g6 lpc, rainier
Date: Wed, 25 Sep 2019 08:56:00 -0400
Message-Id: <20190925125610.12096-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> This is a quick attempt at wiring up some of the LPC bits on the
> AST2600, and then using it on a new board, Rainier, a new POWER system
> with an AST2600.  The only verification performed was ensuring the
> kernel still booted and the ibt device probed using the Rainier device
> tree atop the ast2600-evb qemu model.  Please review.

Changes since v3:
  - commit message updates
  - align rainier reserved memory
  - reviews, acks

Changes since v2:
  - split lpc, ipmi binding updates into separate patches
  - split soc, ipmi, reset compatibles into separate patches
  - moved sio_regs to separate G6 dtsi patch
  - moved i2c and mac additions from rainier DT to separate patches

Changes since v1:
  - split DT binding docs and driver changes into separate patches.
  - reordered rainier DT elements (alphabetized).
  - added rainier rtc, lpc-ctl, reserved memory, mac devices

Brad Bishop (10):
  dt-bindings: aspeed-lpc: Add G6 compatible strings
  dt-bindings: ipmi: Add aspeed-g6 compatible strings
  soc: aspeed: lpc: Add G6 compatible strings
  ipmi: aspeed-g6: Add compatible strings
  reset: simple: Add AST2600 compatibility string
  ARM: dts: aspeed-g6: Add lpc devices
  ARM: dts: aspeed: Add Rainier system
  ARM: dts: aspeed-g6: Expose SuperIO scratch registers
  ARM: dts: aspeed: rainier: Add mac devices
  ARM: dts: aspeed: rainier: Add i2c devices

 .../bindings/ipmi/aspeed,ast2400-ibt-bmc.txt  |   3 +-
 .../bindings/ipmi/aspeed-kcs-bmc.txt          |   7 +-
 .../devicetree/bindings/mfd/aspeed-lpc.txt    |   8 +-
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 464 ++++++++++++++++++
 arch/arm/boot/dts/aspeed-g6.dtsi              |  91 ++++
 drivers/char/ipmi/bt-bmc.c                    |   1 +
 drivers/char/ipmi/kcs_bmc_aspeed.c            |   1 +
 drivers/reset/reset-simple.c                  |   1 +
 drivers/soc/aspeed/aspeed-lpc-ctrl.c          |   1 +
 drivers/soc/aspeed/aspeed-lpc-snoop.c         |   2 +
 11 files changed, 575 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts

--=20
2.21.0
