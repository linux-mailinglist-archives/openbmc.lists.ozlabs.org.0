Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC68D80631A
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 00:51:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=HJYYMJJV;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=1S+TsDMO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlHNz2b5Qz3cZq
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 10:51:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=HJYYMJJV;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=1S+TsDMO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlHLF016dz3cGb
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 10:48:52 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.west.internal (Postfix) with ESMTP id 1ED6E3200BB3
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 18:48:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 05 Dec 2023 18:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1701820130; x=
	1701906530; bh=dGRfQPHbH+hCsPasmEgHJuH24V42vp4/rDlLldr2Icg=; b=H
	JYYMJJVtg669Jk/xah8rpjJZ+ZAlLpiUwVVt3fxhQ4hA5MAlz8nqMk17UdAMlwmx
	2KBy6ztZeSJtjbFs19/YPn5gkIjG1NV1VefmlLhQvssJiMI2Lys12JT3Ce1av/b6
	jrFi6/DdtcVZZ73x3xdy4NTwlzr5GMAqvwYzP7mWFYjT+FsL2IJkA918+rWQXj6i
	+q63WTg2vbiWk4+9yRpWlCcB9CeJ0CTceUtWObvZnvv1jVIL1Rf8AtBk3a8Qwuju
	xyLLwpi+KiA/m/Bgn42/86/fE2IAYsMDu3vklh3AYCRuwRINxuMcqI9kRw0wq3br
	k/OuKIhqICYYR79q2IToQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1701820130; x=1701906530; bh=d
	GRfQPHbH+hCsPasmEgHJuH24V42vp4/rDlLldr2Icg=; b=1S+TsDMOd6WPx2B+n
	dOPuG71hqjNCOUWF+VBnRq16Ra0o0AtqgcNVoAAZux34opE1FkLmMAVEeeugvbR3
	4nQWDA7dyqHldOkvDF2CLKHAmmxMV9tHvcnmGdjgbo0FVeTsuN4ZQHf4MkLQos6S
	7zP+aWoj+eEPVNG/GScbZGPMpQEfhduoUPX71rNcU157r87a2AQSc8kmasEFWlUh
	mOqIsC5BTaFVh/6BPQdNGOVU178fl94TvUZajvXdVxKuPq221fAnyA/YIEywyCSL
	QAOTmwfiUFQ0TQuFg8FWZv5hfnge5RLwM1ocq1epVS0LoY/zH+coQCdBmCde0VdP
	AI5kA==
X-ME-Sender: <xms:4rZvZZOSoLe29mKRukP3Z10R_22coaPPytnHnIG97B1ddOm_Wml9lQ>
    <xme:4rZvZb-WiFTrDcZxIWPNijmJ_1RCt9iip5nOW55dsTLSeRBqaDTJPX2TUp764gstA
    B0OFQulX9c_e68Zepo>
X-ME-Received: <xmr:4rZvZYQhDEd84NejdzZSKJxGMxO25pUjld0_3MF9uudJ0WzqfSo1YpvWaJbz5XAbYVHGWY2CvV3LOpNZowrOlCJKik1i1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludejmdenucfjughrpefhvf
    fufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
    ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
    epfefhtdefteffvdelkefhvdehvdehuddtudegteeghfeigeegveevieevfefggfetnecu
    ffhomhgrihhnpegumhhtfhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:4rZvZVtJ2sj2Vag0oghfLaBRFmv1baL-xrURysghiw4samWtG2Xj4g>
    <xmx:4rZvZRfCAGlGMBEnSvMWYq2My2EO4eVC_GnoX03t003mw-Qyy09Z0A>
    <xmx:4rZvZR3qzcPYVQ-vIkgaPVQOfZmbIjd-YwF84-hhl7PXNv1In92O4w>
    <xmx:4rZvZXpCm5XGLx9Ewjndyg1vv0Bl9HA3XCD0aqISeB3xZis5G8931w>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 5 Dec 2023 18:48:50 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.6 3/3] net/ncsi: Add NC-SI 1.2 Get MC MAC Address command
Date: Tue,  5 Dec 2023 17:48:43 -0600
Message-ID: <20231205234843.4013767-3-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231205234843.4013767-1-patrick@stwcx.xyz>
References: <20231205234843.4013767-1-patrick@stwcx.xyz>
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

This change adds support for the NC-SI 1.2 Get MC MAC Address command,
specified here:

https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.2.0.pdf

It serves the exact same function as the existing OEM Get MAC Address
commands, so if a channel reports that it supports NC-SI 1.2, we prefer
to use the standard command rather than the OEM command.

Verified with an invalid MAC address and 2 valid ones:

[   55.137072] ftgmac100 1e690000.ftgmac eth0: NCSI: Received 3 provisioned MAC addresses
[   55.137614] ftgmac100 1e690000.ftgmac eth0: NCSI: MAC address 0: 00:00:00:00:00:00
[   55.138026] ftgmac100 1e690000.ftgmac eth0: NCSI: MAC address 1: fa:ce:b0:0c:20:22
[   55.138528] ftgmac100 1e690000.ftgmac eth0: NCSI: MAC address 2: fa:ce:b0:0c:20:23
[   55.139241] ftgmac100 1e690000.ftgmac eth0: NCSI: Unable to assign 00:00:00:00:00:00 to device
[   55.140098] ftgmac100 1e690000.ftgmac eth0: NCSI: Set MAC address to fa:ce:b0:0c:20:22

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Signed-off-by: David S. Miller <davem@davemloft.net>
(cherry picked from commit b8291cf3d1180b5b61299922f17c9441616a805a)
---
 net/ncsi/ncsi-cmd.c    |  3 ++-
 net/ncsi/ncsi-manage.c |  9 +++++++--
 net/ncsi/ncsi-pkt.h    | 10 ++++++++++
 net/ncsi/ncsi-rsp.c    | 41 ++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index fd2236ee9a79..b3ff37a181d7 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -270,7 +270,8 @@ static struct ncsi_cmd_handler {
 	{ NCSI_PKT_CMD_GPS,    0, ncsi_cmd_handler_default },
 	{ NCSI_PKT_CMD_OEM,   -1, ncsi_cmd_handler_oem     },
 	{ NCSI_PKT_CMD_PLDM,   0, NULL                     },
-	{ NCSI_PKT_CMD_GPUUID, 0, ncsi_cmd_handler_default }
+	{ NCSI_PKT_CMD_GPUUID, 0, ncsi_cmd_handler_default },
+	{ NCSI_PKT_CMD_GMCMA,  0, ncsi_cmd_handler_default }
 };
 
 static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index f3d7fe86fea1..745c788f1d1d 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -1038,11 +1038,16 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 	case ncsi_dev_state_config_oem_gma:
 		nd->state = ncsi_dev_state_config_clear_vids;
 
-		nca.type = NCSI_PKT_CMD_OEM;
 		nca.package = np->id;
 		nca.channel = nc->id;
 		ndp->pending_req_num = 1;
-		ret = ncsi_gma_handler(&nca, nc->version.mf_id);
+		if (nc->version.major >= 1 && nc->version.minor >= 2) {
+			nca.type = NCSI_PKT_CMD_GMCMA;
+			ret = ncsi_xmit_cmd(&nca);
+		} else {
+			nca.type = NCSI_PKT_CMD_OEM;
+			ret = ncsi_gma_handler(&nca, nc->version.mf_id);
+		}
 		if (ret < 0)
 			schedule_work(&ndp->work);
 
diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
index c9d1da34dc4d..f2f3b5c1b941 100644
--- a/net/ncsi/ncsi-pkt.h
+++ b/net/ncsi/ncsi-pkt.h
@@ -338,6 +338,14 @@ struct ncsi_rsp_gpuuid_pkt {
 	__be32                  checksum;
 };
 
+/* Get MC MAC Address */
+struct ncsi_rsp_gmcma_pkt {
+	struct ncsi_rsp_pkt_hdr rsp;
+	unsigned char           address_count;
+	unsigned char           reserved[3];
+	unsigned char           addresses[][ETH_ALEN];
+};
+
 /* AEN: Link State Change */
 struct ncsi_aen_lsc_pkt {
 	struct ncsi_aen_pkt_hdr aen;        /* AEN header      */
@@ -398,6 +406,7 @@ struct ncsi_aen_hncdsc_pkt {
 #define NCSI_PKT_CMD_GPUUID	0x52 /* Get package UUID                 */
 #define NCSI_PKT_CMD_QPNPR	0x56 /* Query Pending NC PLDM request */
 #define NCSI_PKT_CMD_SNPR	0x57 /* Send NC PLDM Reply  */
+#define NCSI_PKT_CMD_GMCMA	0x58 /* Get MC MAC Address */
 
 
 /* NCSI packet responses */
@@ -433,6 +442,7 @@ struct ncsi_aen_hncdsc_pkt {
 #define NCSI_PKT_RSP_GPUUID	(NCSI_PKT_CMD_GPUUID + 0x80)
 #define NCSI_PKT_RSP_QPNPR	(NCSI_PKT_CMD_QPNPR   + 0x80)
 #define NCSI_PKT_RSP_SNPR	(NCSI_PKT_CMD_SNPR   + 0x80)
+#define NCSI_PKT_RSP_GMCMA	(NCSI_PKT_CMD_GMCMA  + 0x80)
 
 /* NCSI response code/reason */
 #define NCSI_PKT_RSP_C_COMPLETED	0x0000 /* Command Completed        */
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 480e80e3c283..bee290d0f48b 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -1091,6 +1091,44 @@ static int ncsi_rsp_handler_netlink(struct ncsi_request *nr)
 	return ret;
 }
 
+static int ncsi_rsp_handler_gmcma(struct ncsi_request *nr)
+{
+	struct ncsi_dev_priv *ndp = nr->ndp;
+	struct net_device *ndev = ndp->ndev.dev;
+	struct ncsi_rsp_gmcma_pkt *rsp;
+	struct sockaddr saddr;
+	int ret = -1;
+	int i;
+
+	rsp = (struct ncsi_rsp_gmcma_pkt *)skb_network_header(nr->rsp);
+	saddr.sa_family = ndev->type;
+	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
+
+	netdev_info(ndev, "NCSI: Received %d provisioned MAC addresses\n",
+		    rsp->address_count);
+	for (i = 0; i < rsp->address_count; i++) {
+		netdev_info(ndev, "NCSI: MAC address %d: %02x:%02x:%02x:%02x:%02x:%02x\n",
+			    i, rsp->addresses[i][0], rsp->addresses[i][1],
+			    rsp->addresses[i][2], rsp->addresses[i][3],
+			    rsp->addresses[i][4], rsp->addresses[i][5]);
+	}
+
+	for (i = 0; i < rsp->address_count; i++) {
+		memcpy(saddr.sa_data, &rsp->addresses[i], ETH_ALEN);
+		ret = ndev->netdev_ops->ndo_set_mac_address(ndev, &saddr);
+		if (ret < 0) {
+			netdev_warn(ndev, "NCSI: Unable to assign %pM to device\n",
+				    saddr.sa_data);
+			continue;
+		}
+		netdev_warn(ndev, "NCSI: Set MAC address to %pM\n", saddr.sa_data);
+		break;
+	}
+
+	ndp->gma_flag = ret == 0;
+	return ret;
+}
+
 static struct ncsi_rsp_handler {
 	unsigned char	type;
 	int             payload;
@@ -1127,7 +1165,8 @@ static struct ncsi_rsp_handler {
 	{ NCSI_PKT_RSP_PLDM,   -1, ncsi_rsp_handler_pldm    },
 	{ NCSI_PKT_RSP_GPUUID, 20, ncsi_rsp_handler_gpuuid  },
 	{ NCSI_PKT_RSP_QPNPR,  -1, ncsi_rsp_handler_pldm    },
-	{ NCSI_PKT_RSP_SNPR,   -1, ncsi_rsp_handler_pldm    }
+	{ NCSI_PKT_RSP_SNPR,   -1, ncsi_rsp_handler_pldm    },
+	{ NCSI_PKT_RSP_GMCMA,  -1, ncsi_rsp_handler_gmcma   },
 };
 
 int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
-- 
2.41.0

