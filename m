Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC8806317
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 00:50:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Jp8QyB5X;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=IrC/taxt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlHMy1xw9z3cbw
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 10:50:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Jp8QyB5X;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=IrC/taxt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlHLB319Tz3cCh
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 10:48:49 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 644F13200BAF
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 18:48:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 05 Dec 2023 18:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1701820125; x=1701906525; bh=sBflF0sBV3
	AfOM3OIs293hWtGRNIOMbSfe6yV3SepYQ=; b=Jp8QyB5X3X7Rdnv/DwG/cWvZOF
	g+aJQm2yurjyeO64mTDDbMKS5KhRWSK49asBxXhYktXQpHvEjjIV3wbJevwb27/D
	sksUu5ZHD+KgoWXjSoLsxbrl9ZZEgT6fBCvvDaH7BC9LzCj+G/Yy0EPIRzTzHjNh
	IXydo7gMb43VedCwuqOJM7NWwSQkVSXgG8TnMOfNmGR49OBDrZbMuJvqi28BJ0dD
	l4EOdidWTLd28oNgu+LyyLoKHrTDcRYgyAerI5icafvbFOjiCGKlRiooCUHPs5Ke
	MGJ0BbiIshWnx6gYJ+tOXgyRtV8G42uL/DnZYGWRLvk1ZwM1r8Wvbt/xcVew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1701820125; x=1701906525; bh=sBflF0sBV3AfOM3OIs293hWtGRNI
	OMbSfe6yV3SepYQ=; b=IrC/taxtmZU3qnMw+zfLL+ePTNghaNNNRE3y6EPfKoOO
	F+eN8Ut9FOJcpQcqtCMNfnXKK2jt/myEdpb2osRYvAu2KsaWJ9azv+rV0YtcDphA
	46fVl1tg6Rus/BRrmXG6Yeozn42uFUs1YT1aYH/XNIGkhma6rgcQvO04a6V3Vawo
	B6JJUZTUo5x0jTRV7odrwxH80LXLhuXEiXvAbAFYE5RFDR0OhHRUr/dgdjgB9DEb
	0uMKO0V9bSS40wbnUti3BXRu2exF3jYGFTexgDX43rbavYcy8BM42+69+OZiL29N
	LELrA5oiARvpYDndWDVzCzMGyfkMJUe+H/TiYwDobw==
X-ME-Sender: <xms:3bZvZU3WsNi0To5tr7SX_L1xvCkrbN5Orw4sc9haz8eL1leJptMxAA>
    <xme:3bZvZfGIxsACXqivcMUjc2KjtekMHpkf95ngXb4pwz_X1YOXRSYbkVXeE2mC4eTVK
    LoZeNjGgc3hexVs5rg>
X-ME-Received: <xmr:3bZvZc4sHac3Td4GB-9Zt_GBILSDNuBFkcH4WjE_8yklc-8aCPmE472Gw3oUd0rw4GuBoKXjcUmw8hRPTTTmg94nnYSd8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludegmdenucfjughrpefhvf
    fufffkofgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgr
    mhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepve
    dttdeiffevudevuefgffefveejgfevfefgvefhjedvfedvudetheffvdduffdvnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigt
    gidrgiihii
X-ME-Proxy: <xmx:3bZvZd2TeJSMW_Rxz9ykoe7fpoCQBrUvYSpQK9eOyOGG-I7nwS_vvw>
    <xmx:3bZvZXFHL76htnkd9FN9ik2m5ojR5sMi3gHusbXi7WuBAGXGWq_R8Q>
    <xmx:3bZvZW-NY883G6ajjaLJxSOn1xk6hd8QN1Wq24PHrZG7FfOrHymXkg>
    <xmx:3bZvZeyIPhKtVT2BGfET2BHd0pSM1JPSB8ejV-uS1R4E5UoATNfOOA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 5 Dec 2023 18:48:45 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.6 1/3] net/ncsi: Simplify Kconfig/dts control flow
Date: Tue,  5 Dec 2023 17:48:41 -0600
Message-ID: <20231205234843.4013767-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.41.0
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

From: Peter Delevoryas <peter@pjd.dev>

Background:

1. CONFIG_NCSI_OEM_CMD_KEEP_PHY

If this is enabled, we send an extra OEM Intel command in the probe
sequence immediately after discovering a channel (e.g. after "Clear
Initial State").

2. CONFIG_NCSI_OEM_CMD_GET_MAC

If this is enabled, we send one of 3 OEM "Get MAC Address" commands from
Broadcom, Mellanox (Nvidida), and Intel in the *configuration* sequence
for a channel.

3. mellanox,multi-host (or mlx,multi-host)

Introduced by this patch:

https://lore.kernel.org/all/20200108234341.2590674-1-vijaykhemka@fb.com/

Which was actually originally from cosmo.chou@quantatw.com:

https://github.com/facebook/openbmc-linux/commit/9f132a10ec48db84613519258cd8a317fb9c8f1b

Cosmo claimed that the Nvidia ConnectX-4 and ConnectX-6 NIC's don't
respond to Get Version ID, et. al in the probe sequence unless you send
the Set MC Affinity command first.

Problem Statement:

We've been using a combination of #ifdef code blocks and IS_ENABLED()
conditions to conditionally send these OEM commands.

It makes adding any new code around these commands hard to understand.

Solution:

In this patch, I just want to remove the conditionally compiled blocks
of code, and always use IS_ENABLED(...) to do dynamic control flow.

I don't think the small amount of code this adds to non-users of the OEM
Kconfigs is a big deal.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: David S. Miller <davem@davemloft.net>
(cherry picked from commit c797ce168930ce3d62a9b7fc4d7040963ee6a01e)
---
 net/ncsi/ncsi-manage.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index d9da942ad53d..f3d7fe86fea1 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -689,8 +689,6 @@ static int set_one_vid(struct ncsi_dev_priv *ndp, struct ncsi_channel *nc,
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_KEEP_PHY)
-
 static int ncsi_oem_keep_phy_intel(struct ncsi_cmd_arg *nca)
 {
 	unsigned char data[NCSI_OEM_INTEL_CMD_KEEP_PHY_LEN];
@@ -716,10 +714,6 @@ static int ncsi_oem_keep_phy_intel(struct ncsi_cmd_arg *nca)
 	return ret;
 }
 
-#endif
-
-#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC)
-
 /* NCSI OEM Command APIs */
 static int ncsi_oem_gma_handler_bcm(struct ncsi_cmd_arg *nca)
 {
@@ -856,8 +850,6 @@ static int ncsi_gma_handler(struct ncsi_cmd_arg *nca, unsigned int mf_id)
 	return nch->handler(nca);
 }
 
-#endif /* CONFIG_NCSI_OEM_CMD_GET_MAC */
-
 /* Determine if a given channel from the channel_queue should be used for Tx */
 static bool ncsi_channel_is_tx(struct ncsi_dev_priv *ndp,
 			       struct ncsi_channel *nc)
@@ -1039,20 +1031,18 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 			goto error;
 		}
 
-		nd->state = ncsi_dev_state_config_oem_gma;
+		nd->state = IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC)
+			  ? ncsi_dev_state_config_oem_gma
+			  : ncsi_dev_state_config_clear_vids;
 		break;
 	case ncsi_dev_state_config_oem_gma:
 		nd->state = ncsi_dev_state_config_clear_vids;
-		ret = -1;
 
-#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC)
 		nca.type = NCSI_PKT_CMD_OEM;
 		nca.package = np->id;
 		nca.channel = nc->id;
 		ndp->pending_req_num = 1;
 		ret = ncsi_gma_handler(&nca, nc->version.mf_id);
-#endif /* CONFIG_NCSI_OEM_CMD_GET_MAC */
-
 		if (ret < 0)
 			schedule_work(&ndp->work);
 
@@ -1404,7 +1394,6 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 
 		schedule_work(&ndp->work);
 		break;
-#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC)
 	case ncsi_dev_state_probe_mlx_gma:
 		ndp->pending_req_num = 1;
 
@@ -1429,7 +1418,6 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 
 		nd->state = ncsi_dev_state_probe_cis;
 		break;
-#endif /* CONFIG_NCSI_OEM_CMD_GET_MAC */
 	case ncsi_dev_state_probe_cis:
 		ndp->pending_req_num = NCSI_RESERVED_CHANNEL;
 
@@ -1447,7 +1435,6 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 		if (IS_ENABLED(CONFIG_NCSI_OEM_CMD_KEEP_PHY))
 			nd->state = ncsi_dev_state_probe_keep_phy;
 		break;
-#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_KEEP_PHY)
 	case ncsi_dev_state_probe_keep_phy:
 		ndp->pending_req_num = 1;
 
@@ -1460,7 +1447,6 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 
 		nd->state = ncsi_dev_state_probe_gvi;
 		break;
-#endif /* CONFIG_NCSI_OEM_CMD_KEEP_PHY */
 	case ncsi_dev_state_probe_gvi:
 	case ncsi_dev_state_probe_gc:
 	case ncsi_dev_state_probe_gls:
-- 
2.41.0

