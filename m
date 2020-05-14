Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E79551D3154
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 15:32:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NCBD6kPbzDqrq
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 23:31:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Gx2q8tpn; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Nl1njM/C; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NC5503Z0zDqRZ
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 23:27:20 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1555E5C024C;
 Thu, 14 May 2020 09:27:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 14 May 2020 09:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=fUP6A/K1FIK2r
 h9qH8ysYloPmlT+BjBU/JULJRPHZSQ=; b=Gx2q8tpnqKc1bnbs4ETXpsFo7/lIe
 W8nb3oe0ihoIirlwRngaPSJWTHMMPc5smL44AxmG5X6/3J7ju2379zLQK/zc5qzT
 JHdL71PYSTkENBfLXEzhevEzSN+qIcOSZlwdoNFCdWdI/7bXmPPYk3R565k3LvkB
 xDl5shel0bPJjbFZdhLFjJcjH/4mvuR6lOc5FmERD7xkI6jevJfAOeeT1Hb3NmT+
 /czOycz0JpPgICEPSKAeO8RJ39o55wNigNt0qWgPvliSL4xJAtLkfEjxqjxVYHLQ
 9RipYjwYrKoTgOYqUGh8s9bTCcIGC2cgReBu2GFliA2O5CQUqK3/zycxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=fUP6A/K1FIK2rh9qH8ysYloPmlT+BjBU/JULJRPHZSQ=; b=Nl1njM/C
 1UXdJG25QMxs+fhyQb87WgZkCy62e9UwLAG4Q0/1boh0zHT47P8gsmbWvR9x3tsy
 iPXARDLoWzbklEo1biFmq7khfVs1Zvm+sKBoO8zS/dtFJOS45Pvu2YbqpXMgCBms
 cIubnIzipGxETbVq3QpL7NpNJ8+yvZEoyynQn7KnZq9jFfU8YMVWDrEKYw0FL+ic
 Z4psoFce21k/zLZkuV8tqqto1xQUsViVfC3FrwsbT1mb8qnxHG8dmOpZrAX8pt5V
 K7X4l1L4UpoPA4GJUPF0snW+qGTA9Nsa2mI5+4iQ1noX5CYTxYaNRnw+Nw2wfD+H
 /ObdJRNYKZV50g==
X-ME-Sender: <xms:NUe9XjRGxY18knV7OzwV_5mfADYTVrE0_CIy7Mql_nFKvt1xYUKrJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeigdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdelhedrfedunecuvehl
 uhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:NUe9Xky497FwRuRmQjYsJTOczUgPBtU37IJT7lpmOqk81JqU2M05Ig>
 <xmx:NUe9Xo0YfhsqZl0FWN8opkHDxIgmGglehDfX5PpJChTTaunOpGXlxg>
 <xmx:NUe9XjCOnivTC9TcUqZvvh5iX2xOKmFU693CEvJMjuVYIWgEMzTYAg>
 <xmx:Nke9XnvD3MrxfuGbZT3Q0IOCePWEctMzSLThBoIY3Jjom9BS-O4Uww>
Received: from localhost.localdomain
 (ppp14-2-95-31.adl-apt-pir-bras31.tpg.internode.on.net [14.2.95.31])
 by mail.messagingengine.com (Postfix) with ESMTPA id C58D43060EF2;
 Thu, 14 May 2020 09:27:16 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [RFC PATCH linux dev-5.4 3/4] ARM: configs: aspeed-g5: Enable kprobes
Date: Thu, 14 May 2020 22:57:02 +0930
Message-Id: <20200514132703.448317-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200514132703.448317-1-andrew@aj.id.au>
References: <20200514132703.448317-1-andrew@aj.id.au>
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

Enable kprobes to improve the debugging experience on the AST2500 and
later.

Setting CONFIG_KPROBES=y results in the following change in kernel size:

Before:
         $ size vmlinux
            text    data     bss     dec     hex filename
         8240349 2388862  172304 10801515         a4d16b vmlinux
         $ stat --printf '%s\n' *.zImage
         3458368

After:
         $ size vmlinux
            text    data     bss     dec     hex filename
         8279214 2399530  176912 10855656         a5a4e8 vmlinux
         $ stat --printf '%s\n' *.zImage
         3471880

This gives a 54,141 byte increase to vmlinux and a 13,512 byte increase
to the size of the compressed kernel image. In the most constrained BMC
flash layout (arch/arm/boot/dts/openbmc-flash-layout.dtsi) this change
decreases the free space in the kernel partition from 998,080 bytes to
984,568 bytes.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index e30f27a413f4..254fb7562738 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -45,6 +45,7 @@ CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_KERNEL_MODE_NEON=y
 CONFIG_FIRMWARE_MEMMAP=y
+CONFIG_KPROBES=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
-- 
2.25.1

