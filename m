Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBCC496D3
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 03:38:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SW212lDxzDqYP
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 11:38:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="UO4ITQXu"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pSfwDhLS"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SW1D6ZYmzDqSk
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 11:37:51 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id E4313220E1;
 Mon, 17 Jun 2019 21:37:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 17 Jun 2019 21:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=fm3; bh=ZCSWS7rnjGhMt
 ZznxL5iEHi6NT3RyZyxefyWEKOVkbs=; b=UO4ITQXu4huo6IMo3gEc/rw7gvSso
 oNwIqvEeHgqgiYDzqPrLIXoIkXTpUbSMQT9T1ulBRcGUnSx+K981sR59+K5+T1NK
 KiHxK5K5cqDeMGtbHRTMOMP7uK2PhIzbWnN4cVBUSEQs9ji8hMWP+3AfSiA+nDXq
 KKIHRU3Qal1QGw9quzH+PKfkczUbHTtDaVosHDVxkMc8TWLhQJSOxllVSqLGXqrs
 THDYd0VAMd5ST7Djd7k4apuXJZMqLBMQM/SIROhlk1xGrzWGjGBX/wPK3uBTvvk8
 BCNQg0GuMwtFtBYXTJCLASRTr0z2bpB/5y2SsS91yrL1b6UnMe21egoLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZCSWS7rnjGhMtZznx
 L5iEHi6NT3RyZyxefyWEKOVkbs=; b=pSfwDhLSPSX2T0HJizWxu/lh6TQ4JwsfG
 zjKgwsjj44a3sWOiEAzkrCEqU0V/Tpu2LvGTPKCahv1qQbR+5fP4jgNOC9G8N7Ht
 obSMGFQssKW3RwX+xX1nejNplhIHKFPFbZMmJcoocdXgxP4f4QDO/9eIosLqsc3U
 orB1lnZd/xCAFza2UyFcnVIJzIFHPADmCAkfbXOl3TrxGcOVKx4yDsZyVlP4TiJ1
 k8+VNigwzbQOhYMuj/F0Hdml8bmuyune+HkfcSf2+bDMu/ISSCZEpYRnZXxZRAuy
 cdmgPzA9JsArzqQu/8KYxpPP1Brct9ppXCf2q5rC40XMCh9nPXLLA==
X-ME-Sender: <xms:aUAIXTcLmKr0tohgV1hQ66hcHhW7NWL9GBPCvXrdIqkfkU7LCn38Wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeikedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepufgrmhhuvghlucfovghnughoiigrqdflohhnrghsuceoshgrmhes
 mhgvnhguohiirghjohhnrghsrdgtohhmqeenucffohhmrghinhepohiilhgrsghsrdhorh
 hgnecukfhppeduvddvrdelledrkedvrddutdenucfrrghrrghmpehmrghilhhfrhhomhep
 shgrmhesmhgvnhguohiirghjohhnrghsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:aUAIXQ2pOz0nIrjszKY4ZOuWOlSj8q4Te3Sp2JoyKGEqFqlEtPJzow>
 <xmx:aUAIXcuvDeDsaAvGZQcH6RMjCfeg8pr5-_h9tETvdCT_V5SpqnmVjg>
 <xmx:aUAIXc8gqjF0ZvWvaJpuXF6nwaTQ4u3NfhlShyaPkelCNsR9P_Ixig>
 <xmx:bEAIXZKtLaICtp8Ggfs5RKs24s-cs5lsaHUiSEBaUn2T6RJWUZnLGg>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id CC1D1380083;
 Mon, 17 Jun 2019 21:37:42 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: u-boot@lists.denx.de
Subject: [PATCH v2 0/4] NC-SI PHY Support
Date: Tue, 18 Jun 2019 11:37:16 +1000
Message-Id: <20190618013720.2823-1-sam@mendozajonas.com>
X-Mailer: git-send-email 2.21.0
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
Cc: openbmc@lists.ozlabs.org, joe.hershberger@ni.com,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, sjg@chromium.org, clg@kaod.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series introduces support for the NC-SI protocol to u-boot,
functionality which so far has only been available in vendor trees.

NC-SI (Network Controller Sideband Interface) is a protocol to manage a
sideband connection to a proper network interface, for example a BMC
(Baseboard Management Controller) sharing the NIC of the host system.
Probing and configuration occurs by communicating with the "remote" NIC
via NC-SI control frames (Ethernet header 0x88f8).

Since the RFC[0] the changes have been split out into a few different
patches to make the overall changes more obvious. Additionally a few
small improvements have been added including adding a check to see if
NC-SI is already configured, and marking the PHY bus "reset" as invalid
since it does not define a bus.

An example of NC-SI setup before a normal network command:

=> dhcp
net_loop: configuring NCSI first
ethernet@1e660000: link up, 100 Mbps full-duplex mac:0c:c4:7a:d5:48:43
NCSI: probing channels
NCSI: configuring channel 0
NCSI: configuration done!
BOOTP broadcast 1
BOOTP broadcast 2
DHCP client bound to address 10.61.161.188 (255 ms)

[0]: https://patchwork.ozlabs.org/patch/1107087/

Changes in v2:
- Fix endianess issue when setting MAC address
- Make checksum offsets easier to read
- Instantiate per-phy ncsi_priv structures
- Update ncsi command help text
- Used update ncsi-pkt.h version to include SPDX header


Samuel Mendoza-Jonas (4):
  phy: Add support for the NC-SI protocol
  phy: Include NC-SI in phy setup
  net/ftgmac100: Add NC-SI mode support
  net: NC-SI setup and handling

 cmd/Kconfig              |   8 +
 cmd/net.c                |  18 +
 drivers/net/ftgmac100.c  |  39 +-
 drivers/net/phy/Kconfig  |   4 +
 drivers/net/phy/Makefile |   1 +
 drivers/net/phy/ncsi.c   | 896 +++++++++++++++++++++++++++++++++++++++
 drivers/net/phy/phy.c    |   7 +
 include/net.h            |   3 +-
 include/net/ncsi-pkt.h   | 442 +++++++++++++++++++
 include/net/ncsi.h       |  14 +
 include/phy.h            |  12 +
 include/phy_interface.h  |   2 +
 net/net.c                |  27 +-
 13 files changed, 1461 insertions(+), 12 deletions(-)
 create mode 100644 drivers/net/phy/ncsi.c
 create mode 100644 include/net/ncsi-pkt.h
 create mode 100644 include/net/ncsi.h

-- 
2.21.0

