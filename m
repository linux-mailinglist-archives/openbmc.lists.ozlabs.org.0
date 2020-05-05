Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D291C5001
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 10:15:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GXZn6CMkzDqXs
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 18:14:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=TxnK3+Z6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=t1YKRwHK; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWXc6PQ2zDqVZ
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 17:28:00 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 892265CD;
 Tue,  5 May 2020 03:27:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 05 May 2020 03:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=XoL+ntUtebZU4
 TteH5GhD5sAyqCV36nA4iemxbqkO78=; b=TxnK3+Z6ALgkrQ5tbOL4X+mdWyDOP
 dO8VURD3BFWNHQLis6Ik/+b+d3CbRDQN69sm/RzUZQ2HnMLpDB4FZ1XwXhG95BBk
 BrNtnopmyXgyiUxXkDKqouZk+f4qnLPQyx2fL681GmG7L+kRDfQgId+446yUfCB6
 OWSKgAvBAciLghtIx8QNZNILElgTejyhTeTEXxyuxmnAsEvwUnrqHwdIZ1PcUf2d
 e4nVwrvM7BKJZ6D+cnMxNKpf68tqwnOwdHJXvBarLLJfj69vsZ7NV8UzI5pjz3Az
 iurafxEunTNmMiNmnak73MR2GBU2XOcMGpU0QPoQkrfgDQtVV+0DsyAZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=XoL+ntUtebZU4TteH5GhD5sAyqCV36nA4iemxbqkO78=; b=t1YKRwHK
 g7NXfU1BHzDhVF1YX4sCSmmKIyNzI1pZvgN9Z64eMKbisljItgmdkfeHl7vdBtRW
 2LqicZE22WmrWA17G0a3R2fuzGKGJ/fRD+QUCEBTIScwhzhJeohcKLB/A/xdCBCA
 SQL5j2tXywXuYOKcdsrOUdxmrHYZm2yjGaf0AXy3K5+EkYRItrLkyg+lQ+Frgt0w
 GNQtpyEvSEcPC7TDNI6ibv8LgHTESCYxwQG7y9i9jYm2/8pGPewYTw4aXIpiPHWC
 jUOmnad3DPJg1KvFyaTO5aGJNTEVRrqZJq2U6Imd9AirDWZToFFssj8w8qMeZrI2
 UlE/7S3ePLFfvg==
X-ME-Sender: <xms:fhWxXqsHx3CMzU730vM-OtT9FTAwqd0rK6ZXNAbxPzFN9MrbMfsvaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeehgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddrjeehrdekgeenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:fhWxXhDiTPoYtOOXodkkWAXRH0_yX4jiw3oT-kIIICSlKgPgF04iwQ>
 <xmx:fhWxXsGHYmSSJs2Hjy0buzeflrrxH6W9h3s5X0ndwFoU18RWYo-wPQ>
 <xmx:fhWxXhBsfTtNDf_7VlYSVEgSmRQ0ymD1fXuQwOox1Vmmji-ub6T2ZA>
 <xmx:fhWxXutTzXvtdTlDY72sCQ8xTfmc8pdNgXZfP--lFn-PShhBG4Ih2A>
Received: from localhost.localdomain
 (ppp14-2-75-84.adl-apt-pir-bras31.tpg.internode.on.net [14.2.75.84])
 by mail.messagingengine.com (Postfix) with ESMTPA id B41883066033;
 Tue,  5 May 2020 03:27:56 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.4 2/3] pinctrl: aspeed: Describe the heartbeat
 function on ball Y23
Date: Tue,  5 May 2020 16:57:41 +0930
Message-Id: <20200505072742.350305-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200505072742.350305-1-andrew@aj.id.au>
References: <20200505072742.350305-1-andrew@aj.id.au>
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
Cc: elkowals@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The default pinmux configuration for Y23 is to route a heartbeat to
drive a LED. Previous revisions of the AST2600 datasheet did not include
a description of this function

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index fa32c3e9c9d1..7efe6dbe4398 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -46,6 +46,7 @@
 #define SCU634		0x634 /* Disable GPIO Internal Pull-Down #5 */
 #define SCU638		0x638 /* Disable GPIO Internal Pull-Down #6 */
 #define SCU694		0x694 /* Multi-function Pin Control #25 */
+#define SCU69C		0x69C /* Multi-function Pin Control #27 */
 #define SCUC20		0xC20 /* PCIE configuration Setting Control */
 
 #define ASPEED_G6_NR_PINS 256
@@ -819,11 +820,13 @@ FUNC_DECL_2(PWM14, PWM14G0, PWM14G1);
 #define Y23 127
 SIG_EXPR_LIST_DECL_SEMG(Y23, PWM15, PWM15G1, PWM15, SIG_DESC_SET(SCU41C, 31));
 SIG_EXPR_LIST_DECL_SESG(Y23, THRUOUT3, THRU3, SIG_DESC_SET(SCU4BC, 31));
-PIN_DECL_2(Y23, GPIOP7, PWM15, THRUOUT3);
+SIG_EXPR_LIST_DECL_SESG(Y23, HEARTBEAT, HEARTBEAT, SIG_DESC_SET(SCU69C, 31));
+PIN_DECL_3(Y23, GPIOP7, PWM15, THRUOUT3, HEARTBEAT);
 GROUP_DECL(PWM15G1, Y23);
 FUNC_DECL_2(PWM15, PWM15G0, PWM15G1);
 
 FUNC_GROUP_DECL(THRU3, AB24, Y23);
+FUNC_GROUP_DECL(HEARTBEAT, Y23);
 
 #define AA25 128
 SSSF_PIN_DECL(AA25, GPIOQ0, TACH0, SIG_DESC_SET(SCU430, 0));
@@ -1920,6 +1923,7 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(GPIU5),
 	ASPEED_PINCTRL_GROUP(GPIU6),
 	ASPEED_PINCTRL_GROUP(GPIU7),
+	ASPEED_PINCTRL_GROUP(HEARTBEAT),
 	ASPEED_PINCTRL_GROUP(HVI3C3),
 	ASPEED_PINCTRL_GROUP(HVI3C4),
 	ASPEED_PINCTRL_GROUP(I2C1),
@@ -2158,6 +2162,7 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
 	ASPEED_PINCTRL_FUNC(GPIU5),
 	ASPEED_PINCTRL_FUNC(GPIU6),
 	ASPEED_PINCTRL_FUNC(GPIU7),
+	ASPEED_PINCTRL_FUNC(HEARTBEAT),
 	ASPEED_PINCTRL_FUNC(I2C1),
 	ASPEED_PINCTRL_FUNC(I2C10),
 	ASPEED_PINCTRL_FUNC(I2C11),
-- 
2.25.1

