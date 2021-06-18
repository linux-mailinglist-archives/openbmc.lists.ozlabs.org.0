Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1743AC1B4
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 05:59:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5lYk28r8z3c9D
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 13:59:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=hGyb2GTZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tV55PH0N;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=hGyb2GTZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=tV55PH0N; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5lXy23vXz2xZ2
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jun 2021 13:59:13 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 1BB955C01C4;
 Thu, 17 Jun 2021 23:59:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 17 Jun 2021 23:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=TuYXnsrLvv3cGQuo57OjwhrOdB
 7pCELITo6///H2d6c=; b=hGyb2GTZDSK4daX4gj7C6QSA6Nc8w83k8RtLIYHUOR
 HAdQHsbm5ixuSeA/t85RB6zzIKaV3adVWE1ZUGfoXpeTbX2INRGaTPlp/DdEvYrk
 6l2OVb/abFWlu3wzQlxKkB5fmXbaOaXdnzgp1jN1qA3vhbKI/kjQ/ryhICQH7QNz
 SGwZkhW2U1PikYNI9QZpXJ52YJshldv+pBPrINfPIsAJNgyIbJjY4bKyEURvGLlz
 lJhqJt3dLckgIDR8wMVNiX3ddXjzo3sBmVr5zqkGNvgLHB/UNbVGAAK0l2NpsmqH
 AjqFoZPZwUgJ8GNAnSdUHVoCFklBrhxvHx1siKFDvAbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TuYXnsrLvv3cGQuo5
 7OjwhrOdB7pCELITo6///H2d6c=; b=tV55PH0NqT5LXj8Kxl6i1R+3OIV5tnfiD
 E9FFMHQ4TgzA+iXTQGGLN/z4bC5j8uo0XWjSP+uC7Zwta7vPmVbD71yPpWQaFIQd
 RvEFBrFJ4dbe1/VPD51jHMp6PwzoYfGhVwVJtyhDHdDUCWz2Q2zoYsaQFd2RzsB/
 gW3epqBN4Gi/N0Putuv4MOOidVXud+fBu6R1w5mji7oFZTQ5q3lcw5lTm0u0aP4/
 tGUa/lYZ1iQHZXmNzd3yo+P+IXreoceAOipXKhPe4W68kiYEqgrUdhEgmWGX4ga3
 NvS5HZYy6KnLMbDN+7KmsgLsJ89fISy1xtqvJGZDCP6IVi8XPXztw==
X-ME-Sender: <xms:DBrMYFv-tOZigNju0yV_7sWTxLHqf82cx1XPs6Jk1Jd2CRvHvAmNww>
 <xme:DBrMYOcqcIUSKSVjVrUVwgG4OanZEN17hGAyqOgagd0VGYTFYfV0XRbQWIo-O5qi-
 kiVSWe21Vy5-CktuA>
X-ME-Received: <xmr:DBrMYIwmom0dC7W320V2pQwk0ZWdr7zqVUgsO0HBtWUHdJ476TefhkRTV2fwXsfnzTcJKU1CfBq7FnOauP3E3QsjdFNAcndR_AaRknYn3tkLKetFr6Jc995t>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefvddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
 dvvddthefftedujeethfeuueelfedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:DBrMYMOdn5J7Z9by-Q-QlJ5GPvbWK5XX7X-Npi5V3euRwjWVzLzxSQ>
 <xmx:DBrMYF8iu5sDDeadFsSwhwXaTJhNUwMGWQ6ZXvAOoRWsEnh8pa0-SA>
 <xmx:DBrMYMWYCQKTCaeka5M6b37HJqDfh3rtHuWlGpDqR63FCKCITjPlWg>
 <xmx:DRrMYCEJYYZ9VFuDtEqwKXL54vJ9eRA1j3nSntis_M3uRVsCHyZdrQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 23:59:06 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 0/7] Rework use of KCS devices for P10 platforms
Date: Fri, 18 Jun 2021 13:28:51 +0930
Message-Id: <20210618035858.4024689-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This is a bit of a cleanup series mostly specific to the OpenBMC kernel
tree, though there are some exceptions which I'll get to in a moment.

Firstly, v4 of the KCS series has been applied upstream by Corey, and this has
been backported by Joel into dev-5.10. There was a fix sent by Colin for a
signedness issue that was discovered, which is patch 1 in this series.

Patch 2 adds a raw KCS driver that was one of the original motivations for the
upstream series. This raw driver replaces the hacky mctp-lpc driver we've been
carrying in the OpenBMC tree. The mctp-lpc driver only worked with one of the
Aspeed BMC KCS devices and didn't integrate at all with the existing kcs_bmc
framework; the raw KCS driver fixes that by working with any of the KCS devices
on either the Aspeed or Nuvoton SoCs. For IBM's purposes, this allows us to
migrate the MCTP LPC binding between KCS devices on the Aspeed SoCs.

The raw KCS driver is a stopgap solution until we have Jeremy's in-kernel,
socket-based MCTP work merged, at which point we'll migrate the LPC MCTP binding
implementation into the kernel and drop the raw KCS driver altogether. Its
temporary nature is why I didn't push on getting it merged upstream.

From there we clean up the Rainier devicetree by removing the hacky
openbmc,mctp-lpc compatible node and replace it with the standard KCS 4 node
from aspeed-g6.dtsi in patch 4. Once that's removed, we drop the obsolete driver
in patch 5.

From there it's a clear run to switch the KCS device we use for MCTP from
channel 4 to channel 3 in patch 6 to avoid some conflicts with the reset state
of the status bits, and finally enable KCS channel 2 on Rainier which we're
using for the debug-trigger application.

Shortly I'll send upstream the patches to enable KCS channels 2 and 3 for
Rainier.

Please review!

Andrew

Andrew Jeffery (6):
  ipmi: kcs_bmc: Add a "raw" character device interface
  ARM: configs: Enable IPMI KCS raw chardev
  ARM: dts: rainier: Drop the openbmc,mctp-lpc node
  misc: Remove obsolete mctp-lpc chardev
  ARM: dts: rainier: Switch to KCS 3 for MCTP binding
  ARM: dts: rainier: Enable KCS channel 2

Colin Ian King (1):
  ipmi: kcs_bmc_aspeed: Fix less than zero comparison of a unsigned int

 Documentation/ABI/testing/dev-raw-kcs        |  25 ++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |  16 +-
 arch/arm/configs/aspeed_g5_defconfig         |   2 +-
 drivers/char/ipmi/Kconfig                    |  17 +
 drivers/char/ipmi/Makefile                   |   1 +
 drivers/char/ipmi/kcs_bmc_aspeed.c           |   8 +-
 drivers/char/ipmi/kcs_bmc_cdev_raw.c         | 441 ++++++++++++++++++
 drivers/misc/Kconfig                         |   7 -
 drivers/misc/Makefile                        |   1 -
 drivers/misc/mctp-lpc.c                      | 443 -------------------
 10 files changed, 501 insertions(+), 460 deletions(-)
 create mode 100644 Documentation/ABI/testing/dev-raw-kcs
 create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_raw.c
 delete mode 100644 drivers/misc/mctp-lpc.c

-- 
2.30.2

