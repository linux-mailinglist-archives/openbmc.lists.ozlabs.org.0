Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E943BEA9F
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 04:32:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dzV05Wp8zDqlW
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 12:32:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dzTS1bR6zDqfk
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 12:31:55 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 0/2] ARM: dts: aspeed: tacoma partitions
Date: Wed, 25 Sep 2019 22:32:28 -0400
Message-Id: <20190926023230.29810-1-bradleyb@fuzziesquirrel.com>
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

Add a layout suitable for 128MiB raw flash devices, and use it the
Tacoma system.

Needs to be applied atop these series:
https://lists.ozlabs.org/pipermail/openbmc/2019-September/018517.html
https://lists.ozlabs.org/pipermail/openbmc/2019-September/018500.html

Tested by booting and mounting filesystems on the Tacoma system with
7624e846f5 of https://github.com/legoater/qemu although I had to use a
128MiB flash part.

Brad Bishop (2):
  ARM: dts: Add 128MiB OpenBMC flash layout
  ARM: dts: aspeed: tacoma: Add fmc and partitions

 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   | 11 +++++++
 .../boot/dts/openbmc-flash-layout-128.dtsi    | 32 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-128.dtsi

--=20
2.21.0
