Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B1AEBD91
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 07:07:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474BYb47wCzF5HS
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 17:07:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gUMBITHj"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dmj8bHr7"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474BVt4G5dzF6W3
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 17:05:09 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8CC12256;
 Fri,  1 Nov 2019 02:05:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 01 Nov 2019 02:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=udYzz6uzw3q4c
 8LdCo531wViE7YIlthkSbUrwPGxVts=; b=gUMBITHjB4mw3LG2/Q5uSN0SoBroo
 UEuK/I2tNWxy2zmCoLejbfGSDZSueSi3AFsDjpWfocHuyirYbkQKm68XzUNE4+DY
 NXkXyrYSod/OJhDrzmWx131uTOZvtIqoxZz92Mrox8KxZ/QYCR9xfa4C7GmTmV7c
 fSuRAw3rHip1qm8mad1asIgVFXZJLCe+Y9Os1MRi8cAZLnN0xqSWX2rddcqXSGnM
 qJq8P0x0udl5x/jd7NfQnp70Q87uM6H/5NM6iksYmhBU68fcBY764DKNBAzDmKXN
 xtqcHXLC/9dkCa9UI4J3c+xmjredumWLoRwHb6E7MwRP/HlwBpuGodbgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=udYzz6uzw3q4c8LdCo531wViE7YIlthkSbUrwPGxVts=; b=dmj8bHr7
 6M5uIGTFgh6td0Q8KS7NHb3z+vchKv0lFKU8sEBNy+LaP2o0f5jONGBwsk4c4mL1
 PAIzqoyMy2UDAUfYZfv4P5tifymk96enqKeVIblwMkBn9P/63y/Ac52019kkfUS1
 5vabPnXiO/rAZlQJb/81ghuKl5oepJQ/7B63r7bYNuVL9RLbcjXW6sO4acTewjOf
 2l5Y3CTVOxQxMXxWlbbUdcDUCPdvsUeVani4FjIjlLC/dFGUy3KrRZv4bTjNaxAn
 vw/eihMHZIl8flVOl1UdIZg7GJSPQ5iNI4yc+7CVOnZ1nLDwZdJLUNcDHX3gPlG9
 +JY8ODcEULIWtA==
X-ME-Sender: <xms:Esu7XV6dRlsBu9QyXF5lZjdy207CYnKFBEBlKjG7I5gnfhaTHfOnRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtiedgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvddtvd
 drkedurddukedrfedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Esu7XbnCildJX-zgkl4u4_eZpEPyft9dEdIKwLgLkZJ3ixHGYNCINw>
 <xmx:Esu7XcazGNWUi3-8NuEu1XKxv_I8OnB8EiDL6NxybR0bsPRSZkUS_Q>
 <xmx:Esu7Xapn8iirLZwIsHJpBB5Ay6HcbCN9kRVCIMb1oWi8WuBVIbeaFg>
 <xmx:Esu7XQwPtlrV1ePH_6xOtvyI63VUpwKyEFXdq3Lo6EmztTQF7iOE4Q>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04D43306005C;
 Fri,  1 Nov 2019 02:05:04 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v2 1/3] fsi: aspeed: Fix OPB0 byte order
 register values
Date: Fri,  1 Nov 2019 16:35:59 +1030
Message-Id: <20191101060601.24896-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191101060601.24896-1-andrew@aj.id.au>
References: <20191101060601.24896-1-andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The data byte order selection registers in the APB2OPB primarily expose some
internal plumbing necessary to get correct write accesses onto the OPB.
OPB write cycles require "data mirroring" across the 32-bit data bus to
support variable data width slaves that don't implement "byte enables".
For slaves that do implement byte enables the master can signal which
bytes on the data bus the slave should consider valid.

The data mirroring behaviour is specified by the following table:

    +-----------------+----------+-----------------------------------+
    |                 |          |          32-bit Data Bus          |
    +---------+-------+----------+---------+---------+-------+-------+
    |         |       |          |         |         |       |       |
    |   ABus  | Mn_BE |  Request |   Dbus  |   Dbus  |  Dbus |  Dbus |
    | (30:31) | (0:3) | Transfer |   0:7   |   8:15  | 16:23 | 24:31 |
    |         |       |   Size   |  byte0  |  byte1  | byte2 | byte3 |
    +---------+-------+----------+---------+---------+-------+-------+
    |    00   |  1111 | fullword |  byte0  |  byte1  | byte2 | byte3 |
    +---------+-------+----------+---------+---------+-------+-------+
    |    00   |  1110 | halfword |  byte0  |  byte1  | byte2 |       |
    +---------+-------+----------+---------+---------+-------+-------+
    |    01   |  0111 |   byte   | _byte1_ |  byte1  | byte2 | byte3 |
    +---------+-------+----------+---------+---------+-------+-------+
    |    00   |  1100 | halfword |  byte0  |  byte1  |       |       |
    +---------+-------+----------+---------+---------+-------+-------+
    |    01   |  0110 |   byte   | _byte1_ |  byte1  | byte2 |       |
    +---------+-------+----------+---------+---------+-------+-------+
    |    10   |  0011 | halfword | _byte2_ | _byte3_ | byte2 | byte3 |
    +---------+-------+----------+---------+---------+-------+-------+
    |    00   |  1000 |   byte   |  byte0  |         |       |       |
    +---------+-------+----------+---------+---------+-------+-------+
    |    01   |  0100 |   byte   | _byte1_ |  byte1  |       |       |
    +---------+-------+----------+---------+---------+-------+-------+
    |    10   |  0010 |   byte   | _byte2_ |         | byte2 |       |
    +---------+-------+----------+---------+---------+-------+-------+
    |    11   |  0001 |   byte   | _byte3_ | _byte3_ |       | byte3 |
    +---------+-------+----------+---------+---------+-------+-------+

Mirrored data values are highlighted by underscores in the Dbus columns.
The values in the ABus and Request Transfer Size columns correspond to
values in the field names listed in the write data order select register
descriptions.

Similar configuration registers are exposed for reads which enables the
secondary purpose of configuring hardware endian conversions. It appears the
data bus byte order is switched around in hardware so set the registers such
that we can access the correct values for all widths. The values were
determined by experimentation on hardware against fixed CFAM register
values to configure the read data order, then in combination with the
table above and the register layout documentation in the AST2600
datasheet performing write/read cycles to configure the write data order
registers.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Joel: Note that this replaces https://patchwork.ozlabs.org/patch/1187189/
---
 drivers/fsi/fsi-master-aspeed.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index b571628be525..94e9b4f3418a 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -583,11 +583,11 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	writel(fsi_base, aspeed->base + OPB_FSI_BASE);
 
 	/* Set read data order */
-	writel(0x0011bb1b, aspeed->base + OPB0_R_ENDIAN);
+	writel(0x00030b1b, aspeed->base + OPB0_R_ENDIAN);
 
 	/* Set write data order */
-	writel(0x0011bb1b, aspeed->base + OPB0_W_ENDIAN);
-	writel(0xffaa5500, aspeed->base + 0x50);
+	writel(0x0011101b, aspeed->base + OPB0_W_ENDIAN);
+	writel(0x0c330f3f, aspeed->base + 0x50);
 
 	/*
 	 * Select OPB0 for all operations.
-- 
2.20.1

