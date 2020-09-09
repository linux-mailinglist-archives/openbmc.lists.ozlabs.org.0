Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AB0262DD3
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 13:30:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmfv95RM8zDqTW
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 21:29:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=fencsX/m; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=JVfXMDoz; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bmft52ZLhzDqBs
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 21:29:00 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 76CFAAB3;
 Wed,  9 Sep 2020 07:28:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 09 Sep 2020 07:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=lBxe8zPTiZyjBgRKcICYLYvN09
 FAy9qwWuYaDyoRqT0=; b=fencsX/mhJ8oWFUuZgo5aXHPR7XQ34uawRH16FfF/a
 y0BurZjYwhoBlEOM2S0DS6ms31VOUBDneMxByg4pZXJJj3CK0Zf6iS99MJ03a0UH
 ZAmGhCmZnplKsXtYDUW0WBqywymdvSm9HnHR2py4g9eeuQYdSuWfjtHj32HohUvI
 okJCaZBR6b230Xxw3Oa3eTOKXMsvzX7yPWyhid8DvxkewoNJoS0sdvf8EJ7KkQZG
 UBa4cP0LYOTByRVYPD7V/Humw9VUBY0kfifZZjLN6cdzb29K1twZFt+MyCrVCiou
 B2UUL6e5HDLzsCK0jrVGsqbC9GY3VHS0hLcamCH/d1hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lBxe8zPTiZyjBgRKc
 ICYLYvN09FAy9qwWuYaDyoRqT0=; b=JVfXMDozKehNTwn4KeFl2H7igPX9Eq/bW
 BRLfmJ/iCbhrclFWE2ZnZxowWMcyzr+oPL0TmWgfVsNO3jQvdWGZZwN1E3aslYa3
 NLzjYNnRUySFfngqssSQj6kvMf1xHNv6KWBK4ByrmVSM//VkRIcWFMHItw04JK7+
 sxzvY8qXxbxPw3CDAT2AngoqmFzxQYYm0QLHSL+45nuTPcIVBdfe8xUQx8dkeDny
 S4LOg/h3aWEgiauPD1qWV5ERhQPui5c0olde7EqS+xQBKhBFe/tR0UkQM67pVTj/
 KM7kWyX12ZAoQW1VvQ7rd0129n6f4RJbqGcbdfkoTc/hEYNlD7HUA==
X-ME-Sender: <xms:d7xYX2mBVHeIQp5IzUtBttAks2RkfCTySjuKlycZaf6m2BXHuNXOmw>
 <xme:d7xYX92LAV5TyqyrF8jxSxKcHjQjUs3cNE11K7Zei_WK9d7h24JnAZAhhEZqEy46x
 nA1MmHcTVDqd3GjsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehhedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
 dvvddthefftedujeethfeuueelfedtnecukfhppedugedrvddruddtledrkeehnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:d7xYX0pzbfcZx9DS3G9dw9igIbL7F22nmww42k1znovpnBnL9nDo9Q>
 <xmx:d7xYX6n-SWgCpbxr0DJkDhkk3RRauYY9-6Sr8vXhD6XDe2SlgF607Q>
 <xmx:d7xYX00IXXCz1-0y8hzDNbkPP5XxmbhV6Dn6GG7uga6yDjb0FDh4nA>
 <xmx:eLxYX1h9xv16hj8tDde8lj2zkgHQ8PEbF28DOasGOBxBsC5qSR8nbA>
Received: from localhost.localdomain
 (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
 by mail.messagingengine.com (Postfix) with ESMTPA id E92D03280065;
 Wed,  9 Sep 2020 07:28:53 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.8] ARM: dts: rainier: Disable internal pull-downs
 on eMMC pins
Date: Wed,  9 Sep 2020 20:58:25 +0930
Message-Id: <20200909112825.2862827-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
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

There's a veritable tug-of-war going on in the design, so disable one of
the warring parties.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index cbc64a1d14d1..04fd9e5a34de 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -231,6 +231,10 @@ &emmc_controller {
 	status = "okay";
 };
 
+&pinctrl_emmc_default {
+	bias-disable;
+};
+
 &emmc {
 	status = "okay";
 };
-- 
2.25.1

