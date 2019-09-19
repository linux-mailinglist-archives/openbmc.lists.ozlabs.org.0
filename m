Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AE1B7E1E
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 17:27:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z10y6DJGzF55H
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 01:26:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z0wx02n3zDrC9
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 01:23:27 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH v2 linux dev-5.3 0/5] ARM: dts: aspeed-g6 lpc, rainier
Date: Thu, 19 Sep 2019 11:23:31 -0400
Message-Id: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> This is a quick attempt at wiring up some of the LPC bits on the
> AST2600, and then using it on a new board, Rainier, a new POWER system
> with an AST2600.  The only verification performed was ensuring the
> kernel still booted and the ibt device probed using the Rainier device
> tree atop the ast2600-evb qemu model.  Please review.

Changes since v1:
  - split DT binding docs and driver changes into separate patches.
  - reordered rainier DT elements (alphabetized).
  - added rainier rtc, lpc-ctl, reserved memory, mac devices

Brad Bishop (4):
  dt-bindings: lpc: add aspeed-g6 compatible strings
  ARM: aspeed-g6: lpc: add compatible strings
  ARM: dts: aspeed-g6: Add lpc devices
  ARM: dts: aspeed: add Rainier system

 .../bindings/ipmi/aspeed,ast2400-ibt-bmc.txt  |   3 +-
 .../devicetree/bindings/mfd/aspeed-lpc.txt    |   8 +-
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts  | 485 ++++++++++++++++++
 arch/arm/boot/dts/aspeed-g6.dtsi              |  91 ++++
 drivers/char/ipmi/bt-bmc.c                    |   1 +
 drivers/char/ipmi/kcs_bmc_aspeed.c            |   1 +
 drivers/reset/reset-simple.c                  |   1 +
 drivers/soc/aspeed/aspeed-lpc-ctrl.c          |   1 +
 drivers/soc/aspeed/aspeed-lpc-snoop.c         |   2 +
 10 files changed, 593 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts

--=20
2.21.0
