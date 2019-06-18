Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E81B54970B
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 03:42:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SW601PbpzDqY6
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 11:42:00 +1000 (AEST)
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
 header.b="GBsBFzu8"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QhqDtm5q"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SW1N28xSzDqSk
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 11:38:00 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 11D112224E;
 Mon, 17 Jun 2019 21:37:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 17 Jun 2019 21:37:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=fm3; bh=XWLMs1VN66BC840h6YlaQ6+saYxYtdCbsJ7O2p/S6ig=; b=GBsBF
 zu8DMVt8FCd9kgbt1dIAWP2LEeOXyeauOniiPd9n3vmBGerhVJGy1+JfrJ9oMHm+
 pYKT7zf1sYgmFgABnniKzl7vAT2/4uSffMhO1qBIsToRPWc/uWn/ZUCD+RDFdP9P
 uWD4oXEuWDxgekAmYfA1se2eMoTABvrF+2JGvn1TGS1rl0Fh4ZBdo3d3t5TBbwqI
 0TelC18lUeINrFkii92zWGY43BUBkLiib3o1Re3UCPeGjevk3006eosoKHz58sI8
 pNT5zMQCEY/pBtQF+DcnwJHGRKAjsBwj/r9i/nQ6fZTcecrDZOqFPMo8e+YTKwXu
 6BKPKxZ5yk9evFrmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=XWLMs1VN66BC840h6YlaQ6+saYxYtdCbsJ7O2p/S6ig=; b=QhqDtm5q
 BPTyL5nEPAtIRXRUdpG90KQqrBkE7f56lqMnWCm4aYxHCnjX0dOBu/0xy5N9f0mb
 Mpeny5q4LRoI6DYcLhjo7qOFgy3U0DBkPozzqwgSo3wN8YAMVjEZEy7P13VaMqZn
 wAV8oG+EriGlnDbIlbIvMnNQJeWoTVsxRYq8YHGCU+jm7K2Rn9ZDxuGpaPm+mqPr
 ctXX3WytQnxLyo1RE07UMkpx1ySiOr2Zn46CQyniIBsv0mWsv6whr4WArbc4zggz
 gi/12NqDCm0qa9oGCfSoKgMsJseNwFxJ2SYzOK/tAmqIf2XBrcX/ZTiEWAVlnD3j
 SYIOUS46cXo32A==
X-ME-Sender: <xms:dUAIXReQCG7mAHib_QLFT1uPFRqGOR_m9bqcvCBCLXL_rPD9dhKN7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeikedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepufgrmhhuvghlucfovghnughoiigrqdflohhnrghsuceoshgr
 mhesmhgvnhguohiirghjohhnrghsrdgtohhmqeenucfkphepuddvvddrleelrdekvddrud
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmsehmvghnughoiigrjhhonhgrshdr
 tghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:dUAIXfq572NJMfqfS84sWJ_ypVURRmDV7OfjYVCAEoe2JfBse3Uy1g>
 <xmx:dUAIXbPHp_X0zVsjJphrdI_iLQMptijNfeHrDU-emPPKmuncXe5ewQ>
 <xmx:dUAIXSjAqiDopuKaRDrUwUTispSFKklW32I_3ZMkzS1CcxdQo79XKw>
 <xmx:dkAIXeKW2YzqNF6Xt0RZ-r7swTAhJfi_Zq7bMYIdlQXcq1OPmVJPAA>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 509FF380073;
 Mon, 17 Jun 2019 21:37:55 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: u-boot@lists.denx.de
Subject: [PATCH v2 4/4] net: NC-SI setup and handling
Date: Tue, 18 Jun 2019 11:37:20 +1000
Message-Id: <20190618013720.2823-5-sam@mendozajonas.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190618013720.2823-1-sam@mendozajonas.com>
References: <20190618013720.2823-1-sam@mendozajonas.com>
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
v2: Update ncsi command help text

 cmd/Kconfig   |  8 ++++++++
 cmd/net.c     | 18 ++++++++++++++++++
 include/net.h |  2 +-
 net/net.c     | 27 ++++++++++++++++++++++++++-
 4 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/cmd/Kconfig b/cmd/Kconfig
index 0badcb3fe0..9851b04972 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -1332,6 +1332,14 @@ config CMD_LINK_LOCAL
 	help
 	  Acquire a network IP address using the link-local protocol
 
+config CMD_NCSI
+	bool "ncsi"
+	depends on PHY_NCSI
+	help
+	  Manually configure the attached NIC via NC-SI.
+	  Normally this happens automatically before other network
+	  operations.
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
index 20c448ee60..9189f0fb53 100644
--- a/include/net.h
+++ b/include/net.h
@@ -531,7 +531,7 @@ extern int		net_restart_wrap;	/* Tried all network devices */
 
 enum proto_t {
 	BOOTP, RARP, ARP, TFTPGET, DHCP, PING, DNS, NFS, CDP, NETCONS, SNTP,
-	TFTPSRV, TFTPPUT, LINKLOCAL, FASTBOOT, WOL
+	TFTPSRV, TFTPPUT, LINKLOCAL, FASTBOOT, WOL, NCSI
 };
 
 extern char	net_boot_file_name[1024];/* Boot File name */
diff --git a/net/net.c b/net/net.c
index 58b0417cbe..a59169a032 100644
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
@@ -407,6 +408,16 @@ int net_loop(enum proto_t protocol)
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
@@ -420,6 +431,7 @@ int net_loop(enum proto_t protocol)
 	} else {
 		eth_init_state_only();
 	}
+
 restart:
 #ifdef CONFIG_USB_KEYBOARD
 	net_busy_flag = 0;
@@ -526,6 +538,11 @@ restart:
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
@@ -637,7 +654,7 @@ restart:
 				env_set_hex("filesize", net_boot_file_size);
 				env_set_hex("fileaddr", load_addr);
 			}
-			if (protocol != NETCONS)
+			if (protocol != NETCONS && protocol != NCSI)
 				eth_halt();
 			else
 				eth_halt_state_only();
@@ -1318,6 +1335,11 @@ void net_process_received_packet(uchar *in_packet, int len)
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
@@ -1379,6 +1401,9 @@ common:
 
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

