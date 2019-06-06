Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED1136B33
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 06:53:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KCwc3YLjzDqQ9
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 14:53:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="lPOa+YM5"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="buLrDRU0"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KCrs60VszDqf1
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 14:50:21 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C82B22205;
 Thu,  6 Jun 2019 00:50:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 06 Jun 2019 00:50:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=fm3; bh=2zLc2NthYSUGPFPHaK3K1M6GLfATeH2484DpKlv53mU=; b=lPOa+
 YM5NDjxBNMpwJa+/Y0SC6Q/39MpG0SK7QFvK0PoNkDTOVmkurOS10HjVY19TbWA4
 162KYr1RQYyKyxZK1E2DLYhzJLWxDhLA+xnOMu5ef3oIv5hAxTDeIoXrRYZytlQE
 K8sc4XhSPVFtx+AcSygiLkgCuapJyzscTYGC4unaflj7xM5Vt47AHlDmiukOoVjT
 Ce9SZEn2VBC+PAcUjTg9ApDfDIPNrD4yJjXvdRi6o2EbM5cXHLzB4xQ0qZOL4WRr
 kcERSsAillNhT7pQKDxyENScaSL8xpx0AyLZH0QrUyZsTRARb7/XEElMiBBNjj85
 LDgN4n8zhtgykn1gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=2zLc2NthYSUGPFPHaK3K1M6GLfATeH2484DpKlv53mU=; b=buLrDRU0
 6PHdLsCXqKk8rFY1vxBNy8bHZCyeBZqHowJa6pl14RoxKNAr9AkNYFGJsXeeLxfH
 clR9PQndSHbGrUshVMPuQBamzM/z8zchm7Uz3+zNoQ2fEVd427DVzekahD2M2cJa
 EpGbTh+TY/hdKuVcmEP3eG6qlTzsuglEWiQTw+jhWsG1qrf6KpLCh5+RtALtmSzK
 UUy3C5hdYzZyzdfpYTsL+BQtUp3ya27Gf+4Ufoi2z6JOVf41LK94/1DxGY4kR5hb
 xroQxlh18KfeVdLoUht9QqcDCEwexq09kSBvNnTRspeJFJkI23Yu83Lj71RFs4Ja
 /EQ0i9OFWuVtQA==
X-ME-Sender: <xms:i5v4XFVpxyD8ppMD9AR7m1neWuVE2FzgkJlEwYqWEk0pHKIwygc7-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudegfedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepufgrmhhuvghlucfovghnughoiigrqdflohhnrghsuceoshgr
 mhesmhgvnhguohiirghjohhnrghsrdgtohhmqeenucfkphepuddvvddrleelrdekvddrud
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmsehmvghnughoiigrjhhonhgrshdr
 tghomhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:i5v4XEHMRiwG5z1VrIVg5Bx62rF6dw6Y7CrPWmWrUWzXiTEtWNpdtQ>
 <xmx:i5v4XHmWhLu4ZsOUIO2aSqOE35kRlffRNhavmYjV4yX00X5O70GaCQ>
 <xmx:i5v4XNFzdZlerbcuTt8UpYUQg0NkglnMAXmrICW23yXp3iZbamG9Kw>
 <xmx:i5v4XMxsJr_Js6cLiVkJLqeM_0wnkPvverz39oM994SHf6NLfg9ENQ>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id EBBD7380073;
 Thu,  6 Jun 2019 00:50:16 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: u-boot@lists.denx.de
Subject: [PATCH 4/4] net: NC-SI setup and handling
Date: Thu,  6 Jun 2019 14:49:50 +1000
Message-Id: <20190606044950.5930-5-sam@mendozajonas.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606044950.5930-1-sam@mendozajonas.com>
References: <20190606044950.5930-1-sam@mendozajonas.com>
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

Add the handling of NC-SI ethernet frames, and add a check at the start
of net_loop() to configure NC-SI before starting other network commands.
This also adds an "ncsi" command to manually start NC-SI configuration.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 cmd/Kconfig   |  6 ++++++
 cmd/net.c     | 18 ++++++++++++++++++
 include/net.h |  2 +-
 net/net.c     | 27 ++++++++++++++++++++++++++-
 4 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/cmd/Kconfig b/cmd/Kconfig
index ea1a325eb3..0b5df0db90 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -1296,6 +1296,12 @@ config CMD_LINK_LOCAL
 	help
 	  Acquire a network IP address using the link-local protocol
 
+config CMD_NCSI
+	bool "ncsi"
+	depends on PHY_NCSI
+	help
+	  Configure the attached NIC via NC-SI
+
 endif
 
 config CMD_ETHSW
diff --git a/cmd/net.c b/cmd/net.c
index 89721b8f8b..7d2c21ba4d 100644
--- a/cmd/net.c
+++ b/cmd/net.c
@@ -457,3 +457,21 @@ U_BOOT_CMD(
 );
 
 #endif  /* CONFIG_CMD_LINK_LOCAL */
+
+#if defined(CONFIG_CMD_NCSI)
+static int do_ncsi(cmd_tbl_t *cmdtp, int flag, int argc,
+		   char * const argv[])
+{
+	if (net_loop(NCSI) < 0)
+		return CMD_RET_FAILURE;
+
+	return CMD_RET_SUCCESS;
+}
+
+U_BOOT_CMD(
+	ncsi,	1,	1,	do_ncsi,
+	"Configure attached NIC via NC-SI",
+	""
+);
+
+#endif  /* CONFIG_CMD_NCSI */
diff --git a/include/net.h b/include/net.h
index 4f7ba211b6..82a71c5219 100644
--- a/include/net.h
+++ b/include/net.h
@@ -538,7 +538,7 @@ extern int		net_restart_wrap;	/* Tried all network devices */
 
 enum proto_t {
 	BOOTP, RARP, ARP, TFTPGET, DHCP, PING, DNS, NFS, CDP, NETCONS, SNTP,
-	TFTPSRV, TFTPPUT, LINKLOCAL, FASTBOOT, WOL
+	TFTPSRV, TFTPPUT, LINKLOCAL, FASTBOOT, WOL, NCSI
 };
 
 extern char	net_boot_file_name[1024];/* Boot File name */
diff --git a/net/net.c b/net/net.c
index a5a216c3ee..16ca2b0e18 100644
--- a/net/net.c
+++ b/net/net.c
@@ -95,6 +95,7 @@
 #include <net.h>
 #include <net/fastboot.h>
 #include <net/tftp.h>
+#include <net/ncsi.h>
 #if defined(CONFIG_LED_STATUS)
 #include <miiphy.h>
 #include <status_led.h>
@@ -411,6 +412,16 @@ int net_loop(enum proto_t protocol)
 	net_try_count = 1;
 	debug_cond(DEBUG_INT_STATE, "--- net_loop Entry\n");
 
+#ifdef CONFIG_PHY_NCSI
+	if (protocol != NCSI && !ncsi_active()) {
+		printf("%s: configuring NCSI first\n", __func__);
+		if (net_loop(NCSI) < 0)
+			return ret;
+		eth_init_state_only();
+		goto restart;
+	}
+#endif
+
 	bootstage_mark_name(BOOTSTAGE_ID_ETH_START, "eth_start");
 	net_init();
 	if (eth_is_on_demand_init() || protocol != NETCONS) {
@@ -424,6 +435,7 @@ int net_loop(enum proto_t protocol)
 	} else {
 		eth_init_state_only();
 	}
+
 restart:
 #ifdef CONFIG_USB_KEYBOARD
 	net_busy_flag = 0;
@@ -530,6 +542,11 @@ restart:
 		case WOL:
 			wol_start();
 			break;
+#endif
+#if defined(CONFIG_CMD_NCSI)
+		case NCSI:
+			ncsi_probe_packages();
+			break;
 #endif
 		default:
 			break;
@@ -641,7 +658,7 @@ restart:
 				env_set_hex("filesize", net_boot_file_size);
 				env_set_hex("fileaddr", load_addr);
 			}
-			if (protocol != NETCONS)
+			if (protocol != NETCONS && protocol != NCSI)
 				eth_halt();
 			else
 				eth_halt_state_only();
@@ -1324,6 +1341,11 @@ void net_process_received_packet(uchar *in_packet, int len)
 	case PROT_WOL:
 		wol_receive(ip, len);
 		break;
+#endif
+#ifdef CONFIG_PHY_NCSI
+	case PROT_NCSI:
+		ncsi_receive(et, ip, len);
+		break;
 #endif
 	}
 }
@@ -1385,6 +1407,9 @@ common:
 
 #ifdef CONFIG_CMD_RARP
 	case RARP:
+#endif
+#ifdef CONFIG_CMD_NCSI
+	case NCSI:
 #endif
 	case BOOTP:
 	case CDP:
-- 
2.21.0

