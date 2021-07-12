Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F883C670C
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 01:37:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP0YD5wvgz3048
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 09:37:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=SpQErTos;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uIENXPi+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=SpQErTos; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=uIENXPi+; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP0Xr46CSz2yMF;
 Tue, 13 Jul 2021 09:37:00 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A6A85C00DD;
 Mon, 12 Jul 2021 19:36:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 12 Jul 2021 19:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=+BNkO5oPeCKv2/k/LAZvSprn4t
 sxNwwXz5/B+8a2gEc=; b=SpQErTosGQw+IIkr3q4p8erjarP8BFvu31IKxtt0Zv
 PIbZG+MXrZN6npgOCkcpUeDHwTFupCi2p2X2ccn611tNKkTd2JQklxe4gVCGgcA+
 99cRaOnb4v03tBPKM3P4yKDFRpcpn03+STqazFUUROCpVXqJFIvS3s93LiwXnSMp
 1iq9WDmVoqoSahZsgUJFRJ/f26UUZukzn1UR45yGA2fv3j28rTIEMa/uxO0ZGpBy
 BMt1+T1NLpab9OeXFzDyJAI2Waab1vB83nF8rOXIT14tH4WruqXDHbmRORtgOQ5b
 TeaUbgcbLvwCNaN9dVooe4Axc1iOcZ5DXJUmj8+N6CgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+BNkO5oPeCKv2/k/L
 AZvSprn4tsxNwwXz5/B+8a2gEc=; b=uIENXPi+aH0t4Ss+XGg2YUQEUA2BpMLrB
 0AAiba1LeKHQhOuxlDOLFy0b7o0MtOHmCAhYH/T6CK9j48hQCcwCLQfLjXkpy4X0
 8iR+L+gt9UCVrZJNyZkrY1Kdss1gJl+OO0dOLDEeEtLSpO22p6k3ktcN7zIcvfdD
 Z7Igjn4Q1yy+C8RLE7wjXVOexjs5y+/9AF3KPME0oLpK8VgKd8mWhpt8yBlCTunV
 V2I5jksgNhD+UPzhCgR2RF52P7aERVr24SaH6dm2dn5+XBXZBNVPUtZrdpb9PyLE
 Cm1zJraEfP1OuWh9VzIP+BjhF1UZVoOs/BLn8f3VP6/1E01LWbfOw==
X-ME-Sender: <xms:FtLsYN0nVMdf8btv0spkVoU9w2RKWDIsU_B3BzdkZ7uNFBgd1LCM9Q>
 <xme:FtLsYEGjVyhj_f31fCziFyS3qISgsmelLMm-51ptyNfBnzSyBZbdPvVCsu4DuDvlX
 CdHj1Yq3gwG8pGTRw>
X-ME-Received: <xmr:FtLsYN5ASb9Bi_ScrwU_WYu-c4lga3Yuv3UAGk7PQvah28VKgk8SgKqginlBqa66kjTXy9q0vMLGBrr30J4_qHpD4Kl0dVpChunR9A0kYqCIuJvCHqpXpw5K_wDpt-PYw9VPTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeggdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeekhfeiffejveefveehtdeiiefhfedvjeelvd
 dvtdehffetudejtefhueeuleeftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:FtLsYK1-A9jdnnp_4R1hTCAk6vfAshSJYd9mZAgDx130u39NaXcI4g>
 <xmx:FtLsYAEiDCcukKDu9k0nhA9RINtYvxZBErfknq7kbPPHuPHXVZMvzg>
 <xmx:FtLsYL_8iT59U7uJSnIqwWkLxbIIXKpXEXM5l65dt128ru9EF8yDPg>
 <xmx:F9LsYFNAB7dHAgO5AUi5-5zCcw1g0n8OdHcgWW2xt03a3bL2DNn1Ew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Jul 2021 19:36:51 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2] ARM: dts: everest: Add phase corrections for eMMC
Date: Tue, 13 Jul 2021 09:06:42 +0930
Message-Id: <20210712233642.3119722-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The values were determined via scope measurements.

With the patch we can write and read data without issue where as booting
the system without the patch failed at the point of mounting the rootfs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index d26a9e16ff7c..5f141c3d9c3f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -2832,6 +2832,7 @@ &pinctrl_emmc_default {
 
 &emmc {
 	status = "okay";
+	clk-phase-mmc-hs200 = <210>, <228>;
 };
 
 &fsim0 {
-- 
2.30.2

