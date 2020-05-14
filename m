Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 239FE1D3148
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 15:28:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NC6b29SMzDqqY
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 23:28:39 +1000 (AEST)
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
 header.s=fm2 header.b=FCLjPNyO; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=UJhjKaFX; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NC5507wvzDqRp
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 23:27:20 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 609D45C0252;
 Thu, 14 May 2020 09:27:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 14 May 2020 09:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=QYRTx4Cv/gMMC
 G+dids1aTVzJmc9ycHjZKfB4HD5HSo=; b=FCLjPNyOumNrXgLFTlAKaav5lsO8G
 yC18egYNivyCWacfsfAQvC/kO5AbL4vRmAZZwpIYlsL+3Ai7RZCiD1oqdpaY8Q/1
 LVvouXgkYoR5zZhBxbFDBacPvgtAh1Y6dDx1rL3zRn+OJr5SITadg4KFWYRpEuQT
 dNaTC/N46oKSDv/D+5Ax250uZbCmZYTV1rlqot8Wu5vmOg5UZAENe1w90MvhZGuI
 r6tnOwUjqEN+8CY1sgUGnMoVLS7SDZeyIhJM86JtbMmYbgbmpMeWiyD558GcmjCt
 CTwmc98HAQHUqfZyDzFpfiD/BtQUeV/VFINdE1X/3W8KH/1eaoXx/kEoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=QYRTx4Cv/gMMCG+dids1aTVzJmc9ycHjZKfB4HD5HSo=; b=UJhjKaFX
 G8ug5NBXyyMjFpuSZc142MHiEyCTUtQacisb83/JOSA9sgjhjFhHbiXczhXhtamC
 fZzwGe78iRsY+/Kcy4rzp4sTvJfXaFnHJUa6X5NhlWd42hEG0QohAzOSqug2Bs/p
 Ye0nAG1A2cM86T0OGWCwLKWnmhZdXRsVzMLBlzXXI6p23ghz2RE8+uhzhIjId6TE
 FiLJVPwdpX2dDN/g5NONqRjqbhPNo3nnavRYI5q4oIn2QLmu9lzE/9/LdJ1tnrnm
 PN/k9z0Chv1IKd0FW6j1eGvdjPK6ToH1Ai/muz8nysUvisOcfJfqx9uljo6McRuJ
 rKQaMwg9Mflm0g==
X-ME-Sender: <xms:NEe9XpZsqGjMo0WBnsnybFuxT9bl2eM7_8HeRktZZykr2E_5IIe9zw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeigdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdelhedrfedunecuvehl
 uhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:NEe9XgYcg1e6Q0AP82trKhQLVNVqhsF2bPnVGY6PKHnDrPOoz9daBQ>
 <xmx:NEe9Xr-q6A7T0SJpPa9ZE864VPnv3Mp8ywy72152coAcy9RRWFVm1g>
 <xmx:NEe9Xnq5b7Hqa5a3lIzqFYiWucp_BB5tgA7FUwBJ22BLMMZT_IoF1Q>
 <xmx:NEe9Xh2UJYF7Y0mHErP4xIOOzkoI0Vv9TbEGgQtYheQK_y_jG5akkA>
Received: from localhost.localdomain
 (ppp14-2-95-31.adl-apt-pir-bras31.tpg.internode.on.net [14.2.95.31])
 by mail.messagingengine.com (Postfix) with ESMTPA id 38DC73060EF2;
 Thu, 14 May 2020 09:27:14 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [RFC PATCH linux dev-5.4 2/4] ARM: configs: aspeed-g5: Enable modules
Date: Thu, 14 May 2020 22:57:01 +0930
Message-Id: <20200514132703.448317-3-andrew@aj.id.au>
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

This is a step on the path to enabling kprobes, which depend on
CONFIG_MODULES=y.

Setting CONFIG_MODULES=y results in the following change in kernel size:

Before:
         $ size vmlinux
            text    data     bss     dec     hex filename
         8140500 2440582  178904 10759986         a42f32 vmlinux
         $ stat --printf '%s\n' arch/arm/boot/zImage
         3445200

After:
         $ size vmlinux
            text    data     bss     dec     hex filename
         8240349 2388862  172304 10801515         a4d16b vmlinux
         $ stat --printf '%s\n' arch/arm/boot/zImage
         3458368

This gives a 41,529 byte increase to vmlinux and a 13,168 byte increase
to the size of the compressed kernel image. In the most constrained BMC
flash layout (arch/arm/boot/dts/openbmc-flash-layout.dtsi) this change
decreases the free space in the kernel partition from 1,011,248 bytes to
998,080 bytes.

CONFIG_HW_RANDOM=y seems to come along for the ride with the
`./scripts/config -e modules && make olddefconfig && make
savedefconfig`. The measurements above include it, I haven't
investigated why it gets enabled or what effect disabling it might have
on the numbers.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index e124b4ddd442..e30f27a413f4 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -46,6 +46,7 @@ CONFIG_NEON=y
 CONFIG_KERNEL_MODE_NEON=y
 CONFIG_FIRMWARE_MEMMAP=y
 CONFIG_JUMP_LABEL=y
+CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_BLK_DEBUG_FS is not set
 # CONFIG_MQ_IOSCHED_DEADLINE is not set
@@ -152,6 +153,7 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_ASPEED_KCS_IPMI_BMC=y
 CONFIG_ASPEED_BT_IPMI_BMC=y
+CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_TIMERIOMEM=y
 # CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
-- 
2.25.1

