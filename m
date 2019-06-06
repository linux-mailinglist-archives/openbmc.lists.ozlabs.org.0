Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1A036B25
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 06:50:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KCsT6CFJzDqft
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 14:50:53 +1000 (AEST)
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
 header.b="y1R416+0"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TAG+y1Hp"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KCrj3Y6PzDqf3
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 14:50:13 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 431D3221BC;
 Thu,  6 Jun 2019 00:50:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 06 Jun 2019 00:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=fm3; bh=HWxR3LL6pgYUyR1+37/Wpg+MBqNROvPjNkHNkV2ivy0=; b=y1R41
 6+01fM/yBtDdovJOvHzrrRR+QSzJ7cpaMkRZE7iGkUQXkW188HXm84lhGEyKj6rM
 dsYIfN8n2vope2IEqZNWXMOKeuc2aUyP5JaE/G8RCJpfV44vUrhAK8ohNv556y7F
 aLISpg1LiVq6BoJr5Uw4G6JsXGlOCAZLcJJtra93ybZmIEFfQW81SpWaDR8XCsHm
 4UrOz+HcUtyOpJcsARHdDzGNaBN8MCBPY/D2j/KFUuVI2f06k6YKFUum1VcLVGuB
 4gMeJZCwHElEv4vlYAMgXagluiNXq7YB04PZS9+rtLDBjenVDT53zY2r38p3Wf1J
 9wXEX0ihAH7Pp+XfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=HWxR3LL6pgYUyR1+37/Wpg+MBqNROvPjNkHNkV2ivy0=; b=TAG+y1Hp
 2TcJ0YOYqWCR4a7Jx45Mlfm2Xqdq0Uxz2WbB+L+8LgVIHS7MT9MUzDygnTdlZi+j
 mVr++gP5dv+evaziWbdvYBwvzkeLhmzTXFCh0lWdRIaSJTUKoG0Y16nV7O7XeiAg
 cwvGBs63/FTbpOyzum8qnLvJ86F6sUc5A+SKPurbDwrZ2cnHVVFGO0JN5S/LrjBy
 X8cU6+wwlKfqKBN/hIabnEcDOxhruFBVVb1+Bxs7cg5hSVYBqjt7X6tgJYaIv1F2
 w3krwXOqXcb+r+Iep0cBjKlRafE3IxAES5fkHu2510iBWZiUOj8Hj3NCgCUSZR2J
 yc0nQwtqCh17/g==
X-ME-Sender: <xms:gpv4XFIldDjxAXGA7IUazys4EH4wzCc2cEaS9sGHdFDyH2Q2yUcE2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudegfedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepufgrmhhuvghlucfovghnughoiigrqdflohhnrghsuceoshgr
 mhesmhgvnhguohiirghjohhnrghsrdgtohhmqeenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecukfhppeduvddvrdelledrkedvrddutdenucfrrghrrghmpehmrghilhhfrhho
 mhepshgrmhesmhgvnhguohiirghjohhnrghsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptd
X-ME-Proxy: <xmx:g5v4XBAPdgdgURlTXJ0WDp-bOUb03S1BuHu6cps4FOC4i2E2JvJung>
 <xmx:g5v4XLDQZFiAL4upZVsGXmKk3ZG0FaY7bKyxNMpQlBlpaPzGaBXMWg>
 <xmx:g5v4XCmyWyCCcnYoHL3GqEBOMypHRNjvp7I4hE1xbJ1pAeQ5PbvFsQ>
 <xmx:g5v4XH3cLxHfELeehBpp2wh_5Z2ExnqC2BWJE6jJ4hpRmrsr5YC8Wg>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC98B38008B;
 Thu,  6 Jun 2019 00:50:07 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: u-boot@lists.denx.de
Subject: [PATCH 1/4] phy: Add support for the NC-SI protocol
Date: Thu,  6 Jun 2019 14:49:47 +1000
Message-Id: <20190606044950.5930-2-sam@mendozajonas.com>
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

This introduces support for the NC-SI protocol, modelled as a phy driver
for other ethernet drivers to consume.

NC-SI (Network Controller Sideband Interface) is a protocol to manage a
sideband connection to a proper network interface, for example a BMC
(Baseboard Management Controller) sharing the NIC of the host system.
Probing and configuration occurs by communicating with the "remote" NIC
via NC-SI control frames (Ethernet header 0x88f8).

This implementation is roughly based on the upstream Linux
implementation[0], with a reduced feature set and an emphasis on getting
a link up as fast as possible rather than probing the full possible
topology of the bus.
The current phy model relies on the network being "up", sending NC-SI
command frames via net_send_packet() and receiving them from the
net_loop() loop (added in a following patch).

The ncsi-pkt.h header[1] is copied from the Linux kernel for consistent
field definitions.

[0]: https://github.com/torvalds/linux/tree/master/net/ncsi
[1]: https://github.com/torvalds/linux/blob/master/net/ncsi/ncsi-pkt.h

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 drivers/net/phy/Kconfig  |   4 +
 drivers/net/phy/Makefile |   1 +
 drivers/net/phy/ncsi.c   | 892 +++++++++++++++++++++++++++++++++++++++
 include/net.h            |   1 +
 include/net/ncsi-pkt.h   | 415 ++++++++++++++++++
 include/net/ncsi.h       |  14 +
 include/phy.h            |   1 +
 7 files changed, 1328 insertions(+)
 create mode 100644 drivers/net/phy/ncsi.c
 create mode 100644 include/net/ncsi-pkt.h
 create mode 100644 include/net/ncsi.h

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 3dc0822d9c..f6dde8af1c 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -227,4 +227,8 @@ config PHY_FIXED
 	  on, the link is always up with fixed speed and fixed duplex-setting.
 	  More information: doc/device-tree-bindings/net/fixed-link.txt
 
+config PHY_NCSI
+	bool "NC-SI based PHY"
+	depends on DM_ETH
+
 endif #PHYLIB
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 555da83630..32a8409a85 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -30,3 +30,4 @@ obj-$(CONFIG_PHY_XILINX) += xilinx_phy.o
 obj-$(CONFIG_PHY_VITESSE) += vitesse.o
 obj-$(CONFIG_PHY_MSCC) += mscc.o
 obj-$(CONFIG_PHY_FIXED) += fixed.o
+obj-$(CONFIG_PHY_NCSI) += ncsi.o
diff --git a/drivers/net/phy/ncsi.c b/drivers/net/phy/ncsi.c
new file mode 100644
index 0000000000..b1b717ed5c
--- /dev/null
+++ b/drivers/net/phy/ncsi.c
@@ -0,0 +1,892 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * NC-SI protocol configuration
+ *
+ * Copyright (C) 2019, IBM Corporation.
+ */
+
+#include <common.h>
+#include <malloc.h>
+#include <phy.h>
+#include <net/ncsi.h>
+#include <net/ncsi-pkt.h>
+#include <asm/unaligned.h>
+
+#define NCSI_PACKAGE_MAX 8
+#define NCSI_CHANNEL_MAX 31
+
+#define NCSI_PACKAGE_SHIFT      5
+#define NCSI_PACKAGE_INDEX(c)   (((c) >> NCSI_PACKAGE_SHIFT) & 0x7)
+#define NCSI_RESERVED_CHANNEL   0x1f
+#define NCSI_CHANNEL_INDEX(c)   ((c) & ((1 << NCSI_PACKAGE_SHIFT) - 1))
+#define NCSI_TO_CHANNEL(p, c)   (((p) << NCSI_PACKAGE_SHIFT) | (c))
+
+#define NCSI_PKT_REVISION       0x01
+
+#define NCSI_CAP_GENERIC_MASK	0x7f
+#define NCSI_CAP_BC_MASK	0x0f
+#define NCSI_CAP_MC_MASK	0x3f
+#define NCSI_CAP_AEN_MASK	0x07
+#define NCSI_CAP_VLAN_MASK	0x07
+
+static void ncsi_send_ebf(unsigned int np, unsigned int nc);
+static void ncsi_send_ae(unsigned int np, unsigned int nc);
+static void ncsi_send_gls(unsigned int np, unsigned int nc);
+static int ncsi_send_command(unsigned int np, unsigned int nc, unsigned int cmd,
+			     uchar *payload, int len, bool wait);
+
+struct ncsi_channel {
+	unsigned int	id;
+	bool		has_link;
+
+	/* capabilities */
+	u32 cap_generic;
+	u32 cap_bc;
+	u32 cap_mc;
+	u32 cap_buffer;
+	u32 cap_aen;
+	u32 cap_vlan;
+
+	/* version information */
+	struct {
+		u32 version;            /* Supported BCD encoded NCSI version */
+		u32 alpha2;             /* Supported BCD encoded NCSI version */
+		u8  fw_name[12];        /* Firmware name string               */
+		u32 fw_version;         /* Firmware version                   */
+		u16 pci_ids[4];         /* PCI identification                 */
+		u32 mf_id;              /* Manufacture ID                     */
+	} version;
+
+};
+
+struct ncsi_package {
+	unsigned int		id;
+	unsigned int		n_channels;
+	struct ncsi_channel	*channels;
+};
+
+struct ncsi {
+	enum {
+		NCSI_PROBE_PACKAGE_SP,
+		NCSI_PROBE_PACKAGE_DP,
+		NCSI_PROBE_CHANNEL_SP,
+		NCSI_PROBE_CHANNEL,
+		NCSI_CONFIG,
+	} state;
+
+	unsigned int	pending_requests;
+	unsigned int	requests[256];
+	unsigned int	last_request;
+
+	unsigned int	current_package;
+	unsigned int	current_channel;
+
+	unsigned int		n_packages;
+	struct ncsi_package	*packages;
+};
+
+struct ncsi *ncsi_priv;
+
+bool ncsi_active(void)
+{
+	unsigned int np, nc;
+
+	if (!ncsi_priv)
+		return false;
+
+	np = ncsi_priv->current_package;
+	nc = ncsi_priv->current_channel;
+
+	if (ncsi_priv->state != NCSI_CONFIG)
+		return false;
+
+	return np < NCSI_PACKAGE_MAX && nc < NCSI_CHANNEL_MAX &&
+		ncsi_priv->packages[np].channels[nc].has_link;
+}
+
+static unsigned int cmd_payload(int cmd)
+{
+	switch (cmd) {
+	case NCSI_PKT_CMD_CIS:
+		return 0;
+	case NCSI_PKT_CMD_SP:
+		return 4;
+	case NCSI_PKT_CMD_DP:
+		return 0;
+	case NCSI_PKT_CMD_EC:
+		return 0;
+	case NCSI_PKT_CMD_DC:
+		return 4;
+	case NCSI_PKT_CMD_RC:
+		return 4;
+	case NCSI_PKT_CMD_ECNT:
+		return 0;
+	case NCSI_PKT_CMD_DCNT:
+		return 0;
+	case NCSI_PKT_CMD_AE:
+		return 8;
+	case NCSI_PKT_CMD_SL:
+		return 8;
+	case NCSI_PKT_CMD_GLS:
+		return 0;
+	case NCSI_PKT_CMD_SVF:
+		return 8;
+	case NCSI_PKT_CMD_EV:
+		return 4;
+	case NCSI_PKT_CMD_DV:
+		return 0;
+	case NCSI_PKT_CMD_SMA:
+		return 8;
+	case NCSI_PKT_CMD_EBF:
+		return 4;
+	case NCSI_PKT_CMD_DBF:
+		return 0;
+	case NCSI_PKT_CMD_EGMF:
+		return 4;
+	case NCSI_PKT_CMD_DGMF:
+		return 0;
+	case NCSI_PKT_CMD_SNFC:
+		return 4;
+	case NCSI_PKT_CMD_GVI:
+		return 0;
+	case NCSI_PKT_CMD_GC:
+		return 0;
+	case NCSI_PKT_CMD_GP:
+		return 0;
+	case NCSI_PKT_CMD_GCPS:
+		return 0;
+	case NCSI_PKT_CMD_GNS:
+		return 0;
+	case NCSI_PKT_CMD_GNPTS:
+		return 0;
+	case NCSI_PKT_CMD_GPS:
+		return 0;
+	default:
+		printf("NCSI: Unknown command 0x%02x\n", cmd);
+		return 0;
+	}
+}
+
+static u32 ncsi_calculate_checksum(unsigned char *data, int len)
+{
+	u32 checksum = 0;
+	int i;
+
+	for (i = 0; i < len; i += 2)
+		checksum += (((u32)data[i] << 8) | data[i + 1]);
+
+	checksum = (~checksum + 1);
+	return checksum;
+}
+
+static int ncsi_validate_rsp(struct ncsi_rsp_pkt *pkt, int payload)
+{
+	struct ncsi_rsp_pkt_hdr *hdr = &pkt->rsp;
+	__be32 pchecksum;
+	u32 checksum;
+
+	if (hdr->common.revision != 1) {
+		printf("NCSI: 0x%02x response has unsupported revision 0x%x\n",
+		       hdr->common.type, hdr->common.revision);
+		return -1;
+	}
+
+	if (hdr->code != 0) {
+		printf("NCSI: 0x%02x response returns error %d\n",
+		       hdr->common.type, __be16_to_cpu(hdr->code));
+		if (ntohs(hdr->reason) == 0x05)
+			printf("(Invalid command length)\n");
+		return -1;
+	}
+
+	if (ntohs(hdr->common.length) != payload) {
+		printf("NCSI: 0x%02x response has incorrect length %d\n",
+		       hdr->common.type, hdr->common.length);
+		return -1;
+	}
+
+	pchecksum = get_unaligned_be32((void *)(hdr + 1) + payload - 4);
+	if (pchecksum != 0) {
+		checksum = ncsi_calculate_checksum((unsigned char *)hdr,
+						   sizeof(*hdr) + payload - 4);
+		if (pchecksum != checksum) {
+			printf("NCSI: 0x%02x response has invalid checksum\n",
+			       hdr->common.type);
+			return -1;
+		}
+	}
+
+	return 0;
+}
+
+static void ncsi_rsp_ec(struct ncsi_rsp_pkt *pkt)
+{
+	struct ncsi_rsp_pkt_hdr *rsp = (struct ncsi_rsp_pkt_hdr *)&pkt->rsp;
+	unsigned int np, nc;
+
+	np = NCSI_PACKAGE_INDEX(rsp->common.channel);
+	nc = NCSI_CHANNEL_INDEX(rsp->common.channel);
+
+	if (ncsi_priv->packages[np].channels[nc].cap_aen != 0)
+		ncsi_send_ae(np, nc);
+	/* else, done */
+}
+
+static void ncsi_rsp_ecnt(struct ncsi_rsp_pkt *pkt)
+{
+	struct ncsi_rsp_pkt_hdr *rsp = (struct ncsi_rsp_pkt_hdr *)&pkt->rsp;
+	unsigned int np, nc;
+
+	np = NCSI_PACKAGE_INDEX(rsp->common.channel);
+	nc = NCSI_CHANNEL_INDEX(rsp->common.channel);
+
+	ncsi_send_command(np, nc, NCSI_PKT_CMD_EC, NULL, 0, true);
+}
+
+static void ncsi_rsp_ebf(struct ncsi_rsp_pkt *pkt)
+{
+	struct ncsi_rsp_pkt_hdr *rsp = (struct ncsi_rsp_pkt_hdr *)&pkt->rsp;
+	unsigned int np, nc;
+
+	np = NCSI_PACKAGE_INDEX(rsp->common.channel);
+	nc = NCSI_CHANNEL_INDEX(rsp->common.channel);
+
+	ncsi_send_command(np, nc, NCSI_PKT_CMD_ECNT, NULL, 0, true);
+}
+
+static void ncsi_rsp_sma(struct ncsi_rsp_pkt *pkt)
+{
+	struct ncsi_rsp_pkt_hdr *rsp = (struct ncsi_rsp_pkt_hdr *)&pkt->rsp;
+	unsigned int np, nc;
+
+	np = NCSI_PACKAGE_INDEX(rsp->common.channel);
+	nc = NCSI_CHANNEL_INDEX(rsp->common.channel);
+
+	ncsi_send_ebf(np, nc);
+}
+
+static void ncsi_rsp_gc(struct ncsi_rsp_pkt *pkt)
+{
+	struct ncsi_rsp_gc_pkt *gc = (struct ncsi_rsp_gc_pkt *)pkt;
+	struct ncsi_rsp_pkt_hdr *rsp = (struct ncsi_rsp_pkt_hdr *)&gc->rsp;
+	struct ncsi_channel *c;
+	unsigned int np, nc;
+
+	np = NCSI_PACKAGE_INDEX(rsp->common.channel);
+	nc = NCSI_CHANNEL_INDEX(rsp->common.channel);
+
+	if (np >= ncsi_priv->n_packages ||
+	    nc >= ncsi_priv->packages[np].n_channels) {
+		printf("NCSI: Invalid package / channel (0x%02x, 0x%02x)\n",
+		       np, nc);
+		return;
+	}
+
+	c = &ncsi_priv->packages[np].channels[nc];
+	c->cap_generic = ntohl(gc->cap) & NCSI_CAP_GENERIC_MASK;
+	c->cap_bc = ntohl(gc->bc_cap) & NCSI_CAP_BC_MASK;
+	c->cap_mc = ntohl(gc->mc_cap) & NCSI_CAP_MC_MASK;
+	c->cap_aen = ntohl(gc->aen_cap) & NCSI_CAP_AEN_MASK;
+	c->cap_vlan = ntohl(gc->vlan_mode) & NCSI_CAP_VLAN_MASK;
+
+	/* End of probe for this channel */
+}
+
+static void ncsi_rsp_gvi(struct ncsi_rsp_pkt *pkt)
+{
+	struct ncsi_rsp_gvi_pkt *gvi = (struct ncsi_rsp_gvi_pkt *)pkt;
+	struct ncsi_rsp_pkt_hdr *rsp = (struct ncsi_rsp_pkt_hdr *)&gvi->rsp;
+	struct ncsi_channel *c;
+	unsigned int np, nc, i;
+
+	np = NCSI_PACKAGE_INDEX(rsp->common.channel);
+	nc = NCSI_CHANNEL_INDEX(rsp->common.channel);
+
+	if (np >= ncsi_priv->n_packages ||
+	    nc >= ncsi_priv->packages[np].n_channels) {
+		printf("NCSI: Invalid package / channel (0x%02x, 0x%02x)\n",
+		       np, nc);
+		return;
+	}
+
+	c = &ncsi_priv->packages[np].channels[nc];
+	c->version.version = get_unaligned_be32(&gvi->ncsi_version);
+	c->version.alpha2 = gvi->alpha2;
+	memcpy(c->version.fw_name, gvi->fw_name, sizeof(c->version.fw_name));
+	c->version.fw_version = get_unaligned_be32(&gvi->fw_version);
+	for (i = 0; i < ARRAY_SIZE(c->version.pci_ids); i++)
+		c->version.pci_ids[i] = get_unaligned_be16(gvi->pci_ids + i);
+	c->version.mf_id = get_unaligned_be32(&gvi->mf_id);
+
+	if (ncsi_priv->state == NCSI_PROBE_CHANNEL)
+		ncsi_send_command(np, nc, NCSI_PKT_CMD_GC, NULL, 0, true);
+}
+
+static void ncsi_rsp_gls(struct ncsi_rsp_pkt *pkt)
+{
+	struct ncsi_rsp_gls_pkt *gls = (struct ncsi_rsp_gls_pkt *)pkt;
+	struct ncsi_rsp_pkt_hdr *rsp = (struct ncsi_rsp_pkt_hdr *)&gls->rsp;
+	unsigned int np, nc;
+
+	np = NCSI_PACKAGE_INDEX(rsp->common.channel);
+	nc = NCSI_CHANNEL_INDEX(rsp->common.channel);
+
+	if (np >= ncsi_priv->n_packages ||
+	    nc >= ncsi_priv->packages[np].n_channels) {
+		printf("NCSI: Invalid package / channel (0x%02x, 0x%02x)\n",
+		       np, nc);
+		return;
+	}
+
+	ncsi_priv->packages[np].channels[nc].has_link =
+					!!(get_unaligned_be32(&gls->status));
+
+	if (ncsi_priv->state == NCSI_PROBE_CHANNEL)
+		ncsi_send_command(np, nc, NCSI_PKT_CMD_GVI, NULL, 0, true);
+}
+
+static void ncsi_rsp_cis(struct ncsi_rsp_pkt *pkt)
+{
+	struct ncsi_rsp_pkt_hdr *rsp = (struct ncsi_rsp_pkt_hdr *)pkt;
+	struct ncsi_package *package;
+	unsigned int np, nc;
+
+	np = NCSI_PACKAGE_INDEX(rsp->common.channel);
+	nc = NCSI_CHANNEL_INDEX(rsp->common.channel);
+
+	if (np >= ncsi_priv->n_packages) {
+		printf("NCSI: Mystery package 0x%02x from CIS\n", np);
+		return;
+	}
+
+	package = &ncsi_priv->packages[np];
+
+	if (nc < package->n_channels) {
+		/*
+		 * This is fine in general but in the current design we
+		 * don't send CIS commands to known channels.
+		 */
+		debug("NCSI: Duplicate channel 0x%02x\n", nc);
+		return;
+	}
+
+	package->channels = realloc(package->channels,
+				    sizeof(struct ncsi_channel) *
+				    (package->n_channels + 1));
+	if (!package->channels) {
+		printf("NCSI: Could not allocate memory for new channel\n");
+		return;
+	}
+
+	debug("NCSI: New channel 0x%02x\n", nc);
+
+	package->channels[nc].id = nc;
+	package->channels[nc].has_link = false;
+	package->n_channels++;
+
+	ncsi_send_gls(np, nc);
+}
+
+static void ncsi_rsp_dp(struct ncsi_rsp_pkt *pkt)
+{
+	struct ncsi_rsp_pkt_hdr *rsp = (struct ncsi_rsp_pkt_hdr *)pkt;
+	unsigned int np;
+
+	/* No action needed */
+
+	np = NCSI_PACKAGE_INDEX(rsp->common.channel);
+	if (np >= ncsi_priv->n_packages)
+		debug("NCSI: DP response from unknown package %d\n", np);
+}
+
+static void ncsi_rsp_sp(struct ncsi_rsp_pkt *pkt)
+{
+	struct ncsi_rsp_pkt_hdr *rsp = (struct ncsi_rsp_pkt_hdr *)pkt;
+	unsigned int np;
+
+	np = NCSI_PACKAGE_INDEX(rsp->common.channel);
+
+	if (np < ncsi_priv->n_packages) {
+		/* Already know about this package */
+		debug("NCSI: package 0x%02x selected\n", np);
+		return;
+	}
+
+	debug("NCSI: adding new package %d\n", np);
+
+	ncsi_priv->packages = realloc(ncsi_priv->packages,
+				      sizeof(struct ncsi_package) *
+				      (ncsi_priv->n_packages + 1));
+	if (!ncsi_priv->packages) {
+		printf("NCSI: could not allocate memory for new package\n");
+		return;
+	}
+
+	ncsi_priv->packages[np].id = np;
+	ncsi_priv->packages[np].n_channels = 0;
+	ncsi_priv->packages[np].channels = NULL;
+	ncsi_priv->n_packages++;
+}
+
+static void ncsi_update_state(struct ncsi_rsp_pkt_hdr *nh)
+{
+	bool timeout = !nh;
+	int np, nc;
+
+	switch (ncsi_priv->state) {
+	case NCSI_PROBE_PACKAGE_SP:
+		if (!timeout &&
+		    ncsi_priv->current_package + 1 < NCSI_PACKAGE_MAX) {
+			ncsi_priv->current_package++;
+		} else {
+			ncsi_priv->state = NCSI_PROBE_PACKAGE_DP;
+			ncsi_priv->current_package = 0;
+		}
+		return ncsi_probe_packages();
+	case NCSI_PROBE_PACKAGE_DP:
+		if (ncsi_priv->current_package + 1 < ncsi_priv->n_packages &&
+		    !timeout) {
+			ncsi_priv->current_package++;
+		} else {
+			if (!ncsi_priv->n_packages) {
+				printf("NCSI: no packages found\n");
+				net_set_state(NETLOOP_FAIL);
+				return;
+			}
+			printf("NCSI: probing channels\n");
+			ncsi_priv->state = NCSI_PROBE_CHANNEL_SP;
+			ncsi_priv->current_package = 0;
+			ncsi_priv->current_channel = 0;
+		}
+		return ncsi_probe_packages();
+	case NCSI_PROBE_CHANNEL_SP:
+		if (!timeout && nh->common.type == NCSI_PKT_RSP_SP) {
+			ncsi_priv->state = NCSI_PROBE_CHANNEL;
+			return ncsi_probe_packages();
+		}
+		printf("NCSI: failed to select package 0x%0x2 or timeout\n",
+		       ncsi_priv->current_package);
+		net_set_state(NETLOOP_FAIL);
+		break;
+	case NCSI_PROBE_CHANNEL:
+		// TODO only does package 0 for now
+		if (ncsi_priv->pending_requests == 0) {
+			np = ncsi_priv->current_package;
+			nc = ncsi_priv->current_channel;
+
+			/* Configure first channel that has link */
+			if (ncsi_priv->packages[np].channels[nc].has_link) {
+				ncsi_priv->state = NCSI_CONFIG;
+			} else if (ncsi_priv->current_channel + 1 <
+				   NCSI_CHANNEL_MAX) {
+				ncsi_priv->current_channel++;
+			} else {
+				// XXX As above only package 0
+				printf("NCSI: no channel found with link\n");
+				net_set_state(NETLOOP_FAIL);
+				return;
+			}
+			return ncsi_probe_packages();
+		}
+		break;
+	case NCSI_CONFIG:
+		if (ncsi_priv->pending_requests == 0) {
+			printf("NCSI: configuration done!\n");
+			net_set_state(NETLOOP_SUCCESS);
+		} else if (timeout) {
+			printf("NCSI: timeout during configure\n");
+			net_set_state(NETLOOP_FAIL);
+		}
+		break;
+	default:
+		printf("NCSI: something went very wrong, nevermind\n");
+		net_set_state(NETLOOP_FAIL);
+		break;
+	}
+}
+
+static void ncsi_timeout_handler(void)
+{
+	if (ncsi_priv->pending_requests)
+		ncsi_priv->pending_requests--;
+
+	ncsi_update_state(NULL);
+}
+
+static int ncsi_send_command(unsigned int np, unsigned int nc, unsigned int cmd,
+			     uchar *payload, int len, bool wait)
+{
+	struct ncsi_pkt_hdr *hdr;
+	__be32 *pchecksum;
+	int eth_hdr_size;
+	u32 checksum;
+	uchar *pkt, *start;
+	int final_len;
+
+	pkt = calloc(1, PKTSIZE_ALIGN + PKTALIGN);
+	if (!pkt)
+		return -ENOMEM;
+	start = pkt;
+
+	eth_hdr_size = net_set_ether(pkt, net_bcast_ethaddr, PROT_NCSI);
+	pkt += eth_hdr_size;
+
+	/* Set NCSI command header fields */
+	hdr = (struct ncsi_pkt_hdr *)pkt;
+	hdr->mc_id = 0;
+	hdr->revision = NCSI_PKT_REVISION;
+	hdr->id = ++ncsi_priv->last_request;
+	ncsi_priv->requests[ncsi_priv->last_request] = 1;
+	hdr->type = cmd;
+	hdr->channel = NCSI_TO_CHANNEL(np, nc);
+	hdr->length = htons(len);
+
+	if (payload && len)
+		memcpy(pkt + sizeof(struct ncsi_pkt_hdr), payload, len);
+
+	/* Calculate checksum */
+	checksum = ncsi_calculate_checksum((unsigned char *)hdr,
+					   sizeof(*hdr) + len);
+	pchecksum = (__be32 *)((void *)(hdr + 1) + len);
+	put_unaligned_be32(htonl(checksum), pchecksum);
+
+	if (wait) {
+		net_set_timeout_handler(1000UL, ncsi_timeout_handler);
+		ncsi_priv->pending_requests++;
+	}
+
+	if (len < 26)
+		len = 26;
+	/* frame header, packet header, payload, checksum */
+	final_len = eth_hdr_size + sizeof(struct ncsi_cmd_pkt_hdr) + len + 4;
+
+	net_send_packet(start, final_len);
+	free(start);
+	return 0;
+}
+
+static void ncsi_handle_aen(struct ip_udp_hdr *ip, unsigned int len)
+{
+	struct ncsi_aen_pkt_hdr *hdr = (struct ncsi_aen_pkt_hdr *)ip;
+	int payload, i;
+	__be32 pchecksum;
+	u32 checksum;
+
+	switch (hdr->type) {
+	case NCSI_PKT_AEN_LSC:
+		printf("NCSI: link state changed\n");
+		payload = 12;
+		break;
+	case NCSI_PKT_AEN_CR:
+		printf("NCSI: re-configuration required\n");
+		payload = 4;
+		break;
+	case NCSI_PKT_AEN_HNCDSC:
+		/* Host notifcation - N/A but weird */
+		debug("NCSI: HNCDSC AEN received\n");
+		return;
+	default:
+		printf("%s: Invalid type 0x%02x\n", __func__, hdr->type);
+		return;
+	}
+
+	/* Validate packet */
+	if (hdr->common.revision != 1) {
+		printf("NCSI: 0x%02x response has unsupported revision 0x%x\n",
+		       hdr->common.type, hdr->common.revision);
+		return;
+	}
+
+	if (ntohs(hdr->common.length) != payload) {
+		printf("NCSI: 0x%02x response has incorrect length %d\n",
+		       hdr->common.type, hdr->common.length);
+		return;
+	}
+
+	pchecksum = get_unaligned_be32((void *)(hdr + 1) + payload - 4);
+	if (pchecksum != 0) {
+		checksum = ncsi_calculate_checksum((unsigned char *)hdr,
+						   sizeof(*hdr) + payload - 4);
+		if (pchecksum != checksum) {
+			printf("NCSI: 0x%02x response has invalid checksum\n",
+			       hdr->common.type);
+			return;
+		}
+	}
+
+	/* Link or configuration lost - just redo the discovery process */
+	ncsi_priv->state = NCSI_PROBE_PACKAGE_SP;
+	for (i = 0; i < ncsi_priv->n_packages; i++)
+		free(ncsi_priv->packages[i].channels);
+	free(ncsi_priv->packages);
+	ncsi_priv->n_packages = 0;
+
+	ncsi_priv->current_package = NCSI_PACKAGE_MAX;
+	ncsi_priv->current_channel = NCSI_CHANNEL_MAX;
+
+	ncsi_probe_packages();
+}
+
+void ncsi_receive(struct ethernet_hdr *et, struct ip_udp_hdr *ip,
+		  unsigned int len)
+{
+	struct ncsi_rsp_pkt *pkt = (struct ncsi_rsp_pkt *)ip;
+	struct ncsi_rsp_pkt_hdr *nh = (struct ncsi_rsp_pkt_hdr *)&pkt->rsp;
+	void (*handler)(struct ncsi_rsp_pkt *pkt) = NULL;
+	unsigned short payload;
+
+	if (ncsi_priv->pending_requests)
+		ncsi_priv->pending_requests--;
+
+	if (len < sizeof(struct ncsi_rsp_pkt_hdr)) {
+		printf("NCSI: undersized packet: %u bytes\n", len);
+		goto out;
+	}
+
+	if (nh->common.type == NCSI_PKT_AEN)
+		return ncsi_handle_aen(ip, len);
+
+	switch (nh->common.type) {
+	case NCSI_PKT_RSP_SP:
+		payload = 4;
+		handler = ncsi_rsp_sp;
+		break;
+	case NCSI_PKT_RSP_DP:
+		payload = 4;
+		handler = ncsi_rsp_dp;
+		break;
+	case NCSI_PKT_RSP_CIS:
+		payload = 4;
+		handler = ncsi_rsp_cis;
+		break;
+	case NCSI_PKT_RSP_GLS:
+		payload = 16;
+		handler = ncsi_rsp_gls;
+		break;
+	case NCSI_PKT_RSP_GVI:
+		payload = 40;
+		handler = ncsi_rsp_gvi;
+		break;
+	case NCSI_PKT_RSP_GC:
+		payload = 32;
+		handler = ncsi_rsp_gc;
+		break;
+	case NCSI_PKT_RSP_SMA:
+		payload = 4;
+		handler = ncsi_rsp_sma;
+		break;
+	case NCSI_PKT_RSP_EBF:
+		payload = 4;
+		handler = ncsi_rsp_ebf;
+		break;
+	case NCSI_PKT_RSP_ECNT:
+		payload = 4;
+		handler = ncsi_rsp_ecnt;
+		break;
+	case NCSI_PKT_RSP_EC:
+		payload = 4;
+		handler = ncsi_rsp_ec;
+		break;
+	case NCSI_PKT_RSP_AE:
+		payload = 4;
+		handler = NULL;
+		break;
+	default:
+		printf("NCSI: unsupported packet type 0x%02x\n",
+		       nh->common.type);
+		goto out;
+	}
+
+	if (ncsi_validate_rsp(pkt, payload) != 0) {
+		printf("NCSI: discarding invalid packet of type 0x%02x\n",
+		       nh->common.type);
+		goto out;
+	}
+
+	if (handler)
+		handler(pkt);
+out:
+	ncsi_update_state(nh);
+}
+
+static void ncsi_send_sp(unsigned int np)
+{
+	uchar payload[4] = {0};
+
+	ncsi_send_command(np, NCSI_RESERVED_CHANNEL, NCSI_PKT_CMD_SP,
+			  (unsigned char *)&payload,
+			  cmd_payload(NCSI_PKT_CMD_SP), true);
+}
+
+static void ncsi_send_dp(unsigned int np)
+{
+	ncsi_send_command(np, NCSI_RESERVED_CHANNEL, NCSI_PKT_CMD_DP, NULL, 0,
+			  true);
+}
+
+static void ncsi_send_gls(unsigned int np, unsigned int nc)
+{
+	ncsi_send_command(np, nc, NCSI_PKT_CMD_GLS, NULL, 0, true);
+}
+
+static void ncsi_send_cis(unsigned int np, unsigned int nc)
+{
+	ncsi_send_command(np, nc, NCSI_PKT_CMD_CIS, NULL, 0, true);
+}
+
+static void ncsi_send_ae(unsigned int np, unsigned int nc)
+{
+	struct ncsi_cmd_ae_pkt cmd;
+
+	memset(&cmd, 0, sizeof(cmd));
+	cmd.mode = htonl(ncsi_priv->packages[np].channels[nc].cap_aen);
+
+	ncsi_send_command(np, nc, NCSI_PKT_CMD_AE,
+			  ((unsigned char *)&cmd)
+			  + sizeof(struct ncsi_cmd_pkt_hdr),
+			  cmd_payload(NCSI_PKT_CMD_AE), true);
+}
+
+static void ncsi_send_ebf(unsigned int np, unsigned int nc)
+{
+	struct ncsi_cmd_ebf_pkt cmd;
+
+	memset(&cmd, 0, sizeof(cmd));
+	cmd.mode = htonl(ncsi_priv->packages[np].channels[nc].cap_bc);
+
+	ncsi_send_command(np, nc, NCSI_PKT_CMD_EBF,
+			  ((unsigned char *)&cmd)
+			  + sizeof(struct ncsi_cmd_pkt_hdr),
+			  cmd_payload(NCSI_PKT_CMD_EBF), true);
+}
+
+static void ncsi_send_sma(unsigned int np, unsigned int nc)
+{
+	struct ncsi_cmd_sma_pkt cmd;
+	unsigned char *addr;
+
+	addr = eth_get_ethaddr();
+	if (!addr) {
+		printf("NCSI: no MAC address configured\n");
+		return;
+	}
+
+	memset(&cmd, 0, sizeof(cmd));
+	memcpy(cmd.mac, addr, 6);
+	cmd.index = 1;
+	cmd.at_e = 1;
+
+	ncsi_send_command(np, nc, NCSI_PKT_CMD_SMA,
+			  ((unsigned char *)&cmd)
+			  + sizeof(struct ncsi_cmd_pkt_hdr),
+			  cmd_payload(NCSI_PKT_CMD_SMA), true);
+}
+
+void ncsi_probe_packages(void)
+{
+	struct ncsi_package *package;
+	unsigned int np, nc;
+
+	switch (ncsi_priv->state) {
+	case NCSI_PROBE_PACKAGE_SP:
+		if (ncsi_priv->current_package == NCSI_PACKAGE_MAX)
+			ncsi_priv->current_package = 0;
+		ncsi_send_sp(ncsi_priv->current_package);
+		break;
+	case NCSI_PROBE_PACKAGE_DP:
+		ncsi_send_dp(ncsi_priv->current_package);
+		break;
+	case NCSI_PROBE_CHANNEL_SP:
+		if (ncsi_priv->n_packages > 0)
+			ncsi_send_sp(ncsi_priv->current_package);
+		else
+			printf("NCSI: no packages discovered, configuration not possible\n");
+		break;
+	case NCSI_PROBE_CHANNEL:
+		/* Kicks off chain of channel discovery */
+		ncsi_send_cis(ncsi_priv->current_package,
+			      ncsi_priv->current_channel);
+		break;
+	case NCSI_CONFIG:
+		for (np = 0; np < ncsi_priv->n_packages; np++) {
+			package = &ncsi_priv->packages[np];
+			for (nc = 0; nc < package->n_channels; nc++)
+				if (package->channels[nc].has_link)
+					break;
+			if (nc < package->n_channels)
+				break;
+		}
+		if (np == ncsi_priv->n_packages) {
+			printf("NCSI: no link available\n");
+			return;
+		}
+
+		printf("NCSI: configuring channel %d\n", nc);
+		ncsi_priv->current_package = np;
+		ncsi_priv->current_channel = nc;
+		/* Kicks off rest of configure chain */
+		ncsi_send_sma(np, nc);
+		break;
+	default:
+		printf("NCSI: unknown state 0x%x\n", ncsi_priv->state);
+	}
+}
+
+int ncsi_probe(struct phy_device *phydev)
+{
+	// TODO Associate per device
+	if (!ncsi_priv) {
+		ncsi_priv = malloc(sizeof(struct ncsi));
+		if (!ncsi_priv)
+			return -ENOMEM;
+		memset(ncsi_priv, 0, sizeof(struct ncsi));
+	}
+
+	phydev->priv = ncsi_priv;
+
+	return 0;
+}
+
+int ncsi_startup(struct phy_device *phydev)
+{
+	/* Set phydev parameters */
+	phydev->speed = SPEED_100;
+	phydev->duplex = DUPLEX_FULL;
+	/* Normal phy reset is N/A */
+	phydev->flags |= PHY_FLAG_BROKEN_RESET;
+
+	/* Set initial probe state */
+	ncsi_priv->state = NCSI_PROBE_PACKAGE_SP;
+
+	/* No active package/channel yet */
+	ncsi_priv->current_package = NCSI_PACKAGE_MAX;
+	ncsi_priv->current_channel = NCSI_CHANNEL_MAX;
+
+	/* Pretend link works so ftgmac100 sets final bits up */
+	phydev->link = true;
+
+	return 0;
+}
+
+int ncsi_shutdown(struct phy_device *phydev)
+{
+	printf("NCSI: Disabling package %d\n", ncsi_priv->current_package);
+	ncsi_send_dp(ncsi_priv->current_package);
+	return 0;
+}
+
+static struct phy_driver ncsi_driver = {
+	.uid		= PHY_NCSI_ID,
+	.mask		= 0xffffffff,
+	.name		= "NC-SI",
+	.features	= PHY_100BT_FEATURES | PHY_DEFAULT_FEATURES | SUPPORTED_100baseT_Full | SUPPORTED_MII,
+	.probe		= ncsi_probe,
+	.startup	= ncsi_startup,
+	.shutdown	= ncsi_shutdown,
+};
+
+int phy_ncsi_init(void)
+{
+	phy_register(&ncsi_driver);
+	return 0;
+}
diff --git a/include/net.h b/include/net.h
index 51c099dae2..4f7ba211b6 100644
--- a/include/net.h
+++ b/include/net.h
@@ -350,6 +350,7 @@ struct vlan_ethernet_hdr {
 #define PROT_VLAN	0x8100		/* IEEE 802.1q protocol		*/
 #define PROT_IPV6	0x86dd		/* IPv6 over bluebook		*/
 #define PROT_PPP_SES	0x8864		/* PPPoE session messages	*/
+#define PROT_NCSI	0x88f8		/* NC-SI control packets        */
 
 #define IPPROTO_ICMP	 1	/* Internet Control Message Protocol	*/
 #define IPPROTO_UDP	17	/* User Datagram Protocol		*/
diff --git a/include/net/ncsi-pkt.h b/include/net/ncsi-pkt.h
new file mode 100644
index 0000000000..91b4b66438
--- /dev/null
+++ b/include/net/ncsi-pkt.h
@@ -0,0 +1,415 @@
+/*
+ * Copyright Gavin Shan, IBM Corporation 2016.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __NCSI_PKT_H__
+#define __NCSI_PKT_H__
+
+struct ncsi_pkt_hdr {
+	unsigned char mc_id;        /* Management controller ID */
+	unsigned char revision;     /* NCSI version - 0x01      */
+	unsigned char reserved;     /* Reserved                 */
+	unsigned char id;           /* Packet sequence number   */
+	unsigned char type;         /* Packet type              */
+	unsigned char channel;      /* Network controller ID    */
+	__be16        length;       /* Payload length           */
+	__be32        reserved1[2]; /* Reserved                 */
+};
+
+struct ncsi_cmd_pkt_hdr {
+	struct ncsi_pkt_hdr common; /* Common NCSI packet header */
+};
+
+struct ncsi_rsp_pkt_hdr {
+	struct ncsi_pkt_hdr common; /* Common NCSI packet header */
+	__be16              code;   /* Response code             */
+	__be16              reason; /* Response reason           */
+};
+
+struct ncsi_aen_pkt_hdr {
+	struct ncsi_pkt_hdr common;       /* Common NCSI packet header */
+	unsigned char       reserved2[3]; /* Reserved                  */
+	unsigned char       type;         /* AEN packet type           */
+};
+
+/* NCSI common command packet */
+struct ncsi_cmd_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;      /* Command header */
+	__be32                  checksum; /* Checksum       */
+	unsigned char           pad[26];
+};
+
+struct ncsi_rsp_pkt {
+	struct ncsi_rsp_pkt_hdr rsp;      /* Response header */
+	__be32                  checksum; /* Checksum        */
+	unsigned char           pad[22];
+};
+
+/* Select Package */
+struct ncsi_cmd_sp_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;            /* Command header */
+	unsigned char           reserved[3];    /* Reserved       */
+	unsigned char           hw_arbitration; /* HW arbitration */
+	__be32                  checksum;       /* Checksum       */
+	unsigned char           pad[22];
+};
+
+/* Disable Channel */
+struct ncsi_cmd_dc_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;         /* Command header  */
+	unsigned char           reserved[3]; /* Reserved        */
+	unsigned char           ald;         /* Allow link down */
+	__be32                  checksum;    /* Checksum        */
+	unsigned char           pad[22];
+};
+
+/* Reset Channel */
+struct ncsi_cmd_rc_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;      /* Command header */
+	__be32                  reserved; /* Reserved       */
+	__be32                  checksum; /* Checksum       */
+	unsigned char           pad[22];
+};
+
+/* AEN Enable */
+struct ncsi_cmd_ae_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;         /* Command header   */
+	unsigned char           reserved[3]; /* Reserved         */
+	unsigned char           mc_id;       /* MC ID            */
+	__be32                  mode;        /* AEN working mode */
+	__be32                  checksum;    /* Checksum         */
+	unsigned char           pad[18];
+};
+
+/* Set Link */
+struct ncsi_cmd_sl_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;      /* Command header    */
+	__be32                  mode;     /* Link working mode */
+	__be32                  oem_mode; /* OEM link mode     */
+	__be32                  checksum; /* Checksum          */
+	unsigned char           pad[18];
+};
+
+/* Set VLAN Filter */
+struct ncsi_cmd_svf_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;       /* Command header    */
+	__be16                  reserved;  /* Reserved          */
+	__be16                  vlan;      /* VLAN ID           */
+	__be16                  reserved1; /* Reserved          */
+	unsigned char           index;     /* VLAN table index  */
+	unsigned char           enable;    /* Enable or disable */
+	__be32                  checksum;  /* Checksum          */
+	unsigned char           pad[18];
+};
+
+/* Enable VLAN */
+struct ncsi_cmd_ev_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;         /* Command header   */
+	unsigned char           reserved[3]; /* Reserved         */
+	unsigned char           mode;        /* VLAN filter mode */
+	__be32                  checksum;    /* Checksum         */
+	unsigned char           pad[22];
+};
+
+/* Set MAC Address */
+struct ncsi_cmd_sma_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;      /* Command header          */
+	unsigned char           mac[6];   /* MAC address             */
+	unsigned char           index;    /* MAC table index         */
+	unsigned char           at_e;     /* Addr type and operation */
+	__be32                  checksum; /* Checksum                */
+	unsigned char           pad[18];
+};
+
+/* Enable Broadcast Filter */
+struct ncsi_cmd_ebf_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;      /* Command header */
+	__be32                  mode;     /* Filter mode    */
+	__be32                  checksum; /* Checksum       */
+	unsigned char           pad[22];
+};
+
+/* Enable Global Multicast Filter */
+struct ncsi_cmd_egmf_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;      /* Command header */
+	__be32                  mode;     /* Global MC mode */
+	__be32                  checksum; /* Checksum       */
+	unsigned char           pad[22];
+};
+
+/* Set NCSI Flow Control */
+struct ncsi_cmd_snfc_pkt {
+	struct ncsi_cmd_pkt_hdr cmd;         /* Command header    */
+	unsigned char           reserved[3]; /* Reserved          */
+	unsigned char           mode;        /* Flow control mode */
+	__be32                  checksum;    /* Checksum          */
+	unsigned char           pad[22];
+};
+
+/* Get Link Status */
+struct ncsi_rsp_gls_pkt {
+	struct ncsi_rsp_pkt_hdr rsp;        /* Response header   */
+	__be32                  status;     /* Link status       */
+	__be32                  other;      /* Other indications */
+	__be32                  oem_status; /* OEM link status   */
+	__be32                  checksum;
+	unsigned char           pad[10];
+};
+
+/* Get Version ID */
+struct ncsi_rsp_gvi_pkt {
+	struct ncsi_rsp_pkt_hdr rsp;          /* Response header */
+	__be32                  ncsi_version; /* NCSI version    */
+	unsigned char           reserved[3];  /* Reserved        */
+	unsigned char           alpha2;       /* NCSI version    */
+	unsigned char           fw_name[12];  /* f/w name string */
+	__be32                  fw_version;   /* f/w version     */
+	__be16                  pci_ids[4];   /* PCI IDs         */
+	__be32                  mf_id;        /* Manufacture ID  */
+	__be32                  checksum;
+};
+
+/* Get Capabilities */
+struct ncsi_rsp_gc_pkt {
+	struct ncsi_rsp_pkt_hdr rsp;         /* Response header   */
+	__be32                  cap;         /* Capabilities      */
+	__be32                  bc_cap;      /* Broadcast cap     */
+	__be32                  mc_cap;      /* Multicast cap     */
+	__be32                  buf_cap;     /* Buffering cap     */
+	__be32                  aen_cap;     /* AEN cap           */
+	unsigned char           vlan_cnt;    /* VLAN filter count */
+	unsigned char           mixed_cnt;   /* Mix filter count  */
+	unsigned char           mc_cnt;      /* MC filter count   */
+	unsigned char           uc_cnt;      /* UC filter count   */
+	unsigned char           reserved[2]; /* Reserved          */
+	unsigned char           vlan_mode;   /* VLAN mode         */
+	unsigned char           channel_cnt; /* Channel count     */
+	__be32                  checksum;    /* Checksum          */
+};
+
+/* Get Parameters */
+struct ncsi_rsp_gp_pkt {
+	struct ncsi_rsp_pkt_hdr rsp;          /* Response header       */
+	unsigned char           mac_cnt;      /* Number of MAC addr    */
+	unsigned char           reserved[2];  /* Reserved              */
+	unsigned char           mac_enable;   /* MAC addr enable flags */
+	unsigned char           vlan_cnt;     /* VLAN tag count        */
+	unsigned char           reserved1;    /* Reserved              */
+	__be16                  vlan_enable;  /* VLAN tag enable flags */
+	__be32                  link_mode;    /* Link setting          */
+	__be32                  bc_mode;      /* BC filter mode        */
+	__be32                  valid_modes;  /* Valid mode parameters */
+	unsigned char           vlan_mode;    /* VLAN mode             */
+	unsigned char           fc_mode;      /* Flow control mode     */
+	unsigned char           reserved2[2]; /* Reserved              */
+	__be32                  aen_mode;     /* AEN mode              */
+	unsigned char           mac[6];       /* Supported MAC addr    */
+	__be16                  vlan;         /* Supported VLAN tags   */
+	__be32                  checksum;     /* Checksum              */
+};
+
+/* Get Controller Packet Statistics */
+struct ncsi_rsp_gcps_pkt {
+	struct ncsi_rsp_pkt_hdr rsp;            /* Response header            */
+	__be32                  cnt_hi;         /* Counter cleared            */
+	__be32                  cnt_lo;         /* Counter cleared            */
+	__be32                  rx_bytes;       /* Rx bytes                   */
+	__be32                  tx_bytes;       /* Tx bytes                   */
+	__be32                  rx_uc_pkts;     /* Rx UC packets              */
+	__be32                  rx_mc_pkts;     /* Rx MC packets              */
+	__be32                  rx_bc_pkts;     /* Rx BC packets              */
+	__be32                  tx_uc_pkts;     /* Tx UC packets              */
+	__be32                  tx_mc_pkts;     /* Tx MC packets              */
+	__be32                  tx_bc_pkts;     /* Tx BC packets              */
+	__be32                  fcs_err;        /* FCS errors                 */
+	__be32                  align_err;      /* Alignment errors           */
+	__be32                  false_carrier;  /* False carrier detection    */
+	__be32                  runt_pkts;      /* Rx runt packets            */
+	__be32                  jabber_pkts;    /* Rx jabber packets          */
+	__be32                  rx_pause_xon;   /* Rx pause XON frames        */
+	__be32                  rx_pause_xoff;  /* Rx XOFF frames             */
+	__be32                  tx_pause_xon;   /* Tx XON frames              */
+	__be32                  tx_pause_xoff;  /* Tx XOFF frames             */
+	__be32                  tx_s_collision; /* Single collision frames    */
+	__be32                  tx_m_collision; /* Multiple collision frames  */
+	__be32                  l_collision;    /* Late collision frames      */
+	__be32                  e_collision;    /* Excessive collision frames */
+	__be32                  rx_ctl_frames;  /* Rx control frames          */
+	__be32                  rx_64_frames;   /* Rx 64-bytes frames         */
+	__be32                  rx_127_frames;  /* Rx 65-127 bytes frames     */
+	__be32                  rx_255_frames;  /* Rx 128-255 bytes frames    */
+	__be32                  rx_511_frames;  /* Rx 256-511 bytes frames    */
+	__be32                  rx_1023_frames; /* Rx 512-1023 bytes frames   */
+	__be32                  rx_1522_frames; /* Rx 1024-1522 bytes frames  */
+	__be32                  rx_9022_frames; /* Rx 1523-9022 bytes frames  */
+	__be32                  tx_64_frames;   /* Tx 64-bytes frames         */
+	__be32                  tx_127_frames;  /* Tx 65-127 bytes frames     */
+	__be32                  tx_255_frames;  /* Tx 128-255 bytes frames    */
+	__be32                  tx_511_frames;  /* Tx 256-511 bytes frames    */
+	__be32                  tx_1023_frames; /* Tx 512-1023 bytes frames   */
+	__be32                  tx_1522_frames; /* Tx 1024-1522 bytes frames  */
+	__be32                  tx_9022_frames; /* Tx 1523-9022 bytes frames  */
+	__be32                  rx_valid_bytes; /* Rx valid bytes             */
+	__be32                  rx_runt_pkts;   /* Rx error runt packets      */
+	__be32                  rx_jabber_pkts; /* Rx error jabber packets    */
+	__be32                  checksum;       /* Checksum                   */
+};
+
+/* Get NCSI Statistics */
+struct ncsi_rsp_gns_pkt {
+	struct ncsi_rsp_pkt_hdr rsp;           /* Response header         */
+	__be32                  rx_cmds;       /* Rx NCSI commands        */
+	__be32                  dropped_cmds;  /* Dropped commands        */
+	__be32                  cmd_type_errs; /* Command type errors     */
+	__be32                  cmd_csum_errs; /* Command checksum errors */
+	__be32                  rx_pkts;       /* Rx NCSI packets         */
+	__be32                  tx_pkts;       /* Tx NCSI packets         */
+	__be32                  tx_aen_pkts;   /* Tx AEN packets          */
+	__be32                  checksum;      /* Checksum                */
+};
+
+/* Get NCSI Pass-through Statistics */
+struct ncsi_rsp_gnpts_pkt {
+	struct ncsi_rsp_pkt_hdr rsp;            /* Response header     */
+	__be32                  tx_pkts;        /* Tx packets          */
+	__be32                  tx_dropped;     /* Tx dropped packets  */
+	__be32                  tx_channel_err; /* Tx channel errors   */
+	__be32                  tx_us_err;      /* Tx undersize errors */
+	__be32                  rx_pkts;        /* Rx packets          */
+	__be32                  rx_dropped;     /* Rx dropped packets  */
+	__be32                  rx_channel_err; /* Rx channel errors   */
+	__be32                  rx_us_err;      /* Rx undersize errors */
+	__be32                  rx_os_err;      /* Rx oversize errors  */
+	__be32                  checksum;       /* Checksum            */
+};
+
+/* Get package status */
+struct ncsi_rsp_gps_pkt {
+	struct ncsi_rsp_pkt_hdr rsp;      /* Response header             */
+	__be32                  status;   /* Hardware arbitration status */
+	__be32                  checksum;
+};
+
+/* Get package UUID */
+struct ncsi_rsp_gpuuid_pkt {
+	struct ncsi_rsp_pkt_hdr rsp;      /* Response header */
+	unsigned char           uuid[16]; /* UUID            */
+	__be32                  checksum;
+};
+
+/* AEN: Link State Change */
+struct ncsi_aen_lsc_pkt {
+	struct ncsi_aen_pkt_hdr aen;        /* AEN header      */
+	__be32                  status;     /* Link status     */
+	__be32                  oem_status; /* OEM link status */
+	__be32                  checksum;   /* Checksum        */
+	unsigned char           pad[14];
+};
+
+/* AEN: Configuration Required */
+struct ncsi_aen_cr_pkt {
+	struct ncsi_aen_pkt_hdr aen;      /* AEN header */
+	__be32                  checksum; /* Checksum   */
+	unsigned char           pad[22];
+};
+
+/* AEN: Host Network Controller Driver Status Change */
+struct ncsi_aen_hncdsc_pkt {
+	struct ncsi_aen_pkt_hdr aen;      /* AEN header */
+	__be32                  status;   /* Status     */
+	__be32                  checksum; /* Checksum   */
+	unsigned char           pad[18];
+};
+
+/* NCSI packet revision */
+#define NCSI_PKT_REVISION	0x01
+
+/* NCSI packet commands */
+#define NCSI_PKT_CMD_CIS	0x00 /* Clear Initial State              */
+#define NCSI_PKT_CMD_SP		0x01 /* Select Package                   */
+#define NCSI_PKT_CMD_DP		0x02 /* Deselect Package                 */
+#define NCSI_PKT_CMD_EC		0x03 /* Enable Channel                   */
+#define NCSI_PKT_CMD_DC		0x04 /* Disable Channel                  */
+#define NCSI_PKT_CMD_RC		0x05 /* Reset Channel                    */
+#define NCSI_PKT_CMD_ECNT	0x06 /* Enable Channel Network Tx        */
+#define NCSI_PKT_CMD_DCNT	0x07 /* Disable Channel Network Tx       */
+#define NCSI_PKT_CMD_AE		0x08 /* AEN Enable                       */
+#define NCSI_PKT_CMD_SL		0x09 /* Set Link                         */
+#define NCSI_PKT_CMD_GLS	0x0a /* Get Link                         */
+#define NCSI_PKT_CMD_SVF	0x0b /* Set VLAN Filter                  */
+#define NCSI_PKT_CMD_EV		0x0c /* Enable VLAN                      */
+#define NCSI_PKT_CMD_DV		0x0d /* Disable VLAN                     */
+#define NCSI_PKT_CMD_SMA	0x0e /* Set MAC address                  */
+#define NCSI_PKT_CMD_EBF	0x10 /* Enable Broadcast Filter          */
+#define NCSI_PKT_CMD_DBF	0x11 /* Disable Broadcast Filter         */
+#define NCSI_PKT_CMD_EGMF	0x12 /* Enable Global Multicast Filter   */
+#define NCSI_PKT_CMD_DGMF	0x13 /* Disable Global Multicast Filter  */
+#define NCSI_PKT_CMD_SNFC	0x14 /* Set NCSI Flow Control            */
+#define NCSI_PKT_CMD_GVI	0x15 /* Get Version ID                   */
+#define NCSI_PKT_CMD_GC		0x16 /* Get Capabilities                 */
+#define NCSI_PKT_CMD_GP		0x17 /* Get Parameters                   */
+#define NCSI_PKT_CMD_GCPS	0x18 /* Get Controller Packet Statistics */
+#define NCSI_PKT_CMD_GNS	0x19 /* Get NCSI Statistics              */
+#define NCSI_PKT_CMD_GNPTS	0x1a /* Get NCSI Pass-throu Statistics   */
+#define NCSI_PKT_CMD_GPS	0x1b /* Get package status               */
+#define NCSI_PKT_CMD_OEM	0x50 /* OEM                              */
+#define NCSI_PKT_CMD_PLDM	0x51 /* PLDM request over NCSI over RBT  */
+#define NCSI_PKT_CMD_GPUUID	0x52 /* Get package UUID                 */
+
+/* NCSI packet responses */
+#define NCSI_PKT_RSP_CIS	(NCSI_PKT_CMD_CIS    + 0x80)
+#define NCSI_PKT_RSP_SP		(NCSI_PKT_CMD_SP     + 0x80)
+#define NCSI_PKT_RSP_DP		(NCSI_PKT_CMD_DP     + 0x80)
+#define NCSI_PKT_RSP_EC		(NCSI_PKT_CMD_EC     + 0x80)
+#define NCSI_PKT_RSP_DC		(NCSI_PKT_CMD_DC     + 0x80)
+#define NCSI_PKT_RSP_RC		(NCSI_PKT_CMD_RC     + 0x80)
+#define NCSI_PKT_RSP_ECNT	(NCSI_PKT_CMD_ECNT   + 0x80)
+#define NCSI_PKT_RSP_DCNT	(NCSI_PKT_CMD_DCNT   + 0x80)
+#define NCSI_PKT_RSP_AE		(NCSI_PKT_CMD_AE     + 0x80)
+#define NCSI_PKT_RSP_SL		(NCSI_PKT_CMD_SL     + 0x80)
+#define NCSI_PKT_RSP_GLS	(NCSI_PKT_CMD_GLS    + 0x80)
+#define NCSI_PKT_RSP_SVF	(NCSI_PKT_CMD_SVF    + 0x80)
+#define NCSI_PKT_RSP_EV		(NCSI_PKT_CMD_EV     + 0x80)
+#define NCSI_PKT_RSP_DV		(NCSI_PKT_CMD_DV     + 0x80)
+#define NCSI_PKT_RSP_SMA	(NCSI_PKT_CMD_SMA    + 0x80)
+#define NCSI_PKT_RSP_EBF	(NCSI_PKT_CMD_EBF    + 0x80)
+#define NCSI_PKT_RSP_DBF	(NCSI_PKT_CMD_DBF    + 0x80)
+#define NCSI_PKT_RSP_EGMF	(NCSI_PKT_CMD_EGMF   + 0x80)
+#define NCSI_PKT_RSP_DGMF	(NCSI_PKT_CMD_DGMF   + 0x80)
+#define NCSI_PKT_RSP_SNFC	(NCSI_PKT_CMD_SNFC   + 0x80)
+#define NCSI_PKT_RSP_GVI	(NCSI_PKT_CMD_GVI    + 0x80)
+#define NCSI_PKT_RSP_GC		(NCSI_PKT_CMD_GC     + 0x80)
+#define NCSI_PKT_RSP_GP		(NCSI_PKT_CMD_GP     + 0x80)
+#define NCSI_PKT_RSP_GCPS	(NCSI_PKT_CMD_GCPS   + 0x80)
+#define NCSI_PKT_RSP_GNS	(NCSI_PKT_CMD_GNS    + 0x80)
+#define NCSI_PKT_RSP_GNPTS	(NCSI_PKT_CMD_GNPTS  + 0x80)
+#define NCSI_PKT_RSP_GPS	(NCSI_PKT_CMD_GPS    + 0x80)
+#define NCSI_PKT_RSP_OEM	(NCSI_PKT_CMD_OEM    + 0x80)
+#define NCSI_PKT_RSP_PLDM	(NCSI_PKT_CMD_PLDM   + 0x80)
+#define NCSI_PKT_RSP_GPUUID	(NCSI_PKT_CMD_GPUUID + 0x80)
+
+/* NCSI response code/reason */
+#define NCSI_PKT_RSP_C_COMPLETED	0x0000 /* Command Completed        */
+#define NCSI_PKT_RSP_C_FAILED		0x0001 /* Command Failed           */
+#define NCSI_PKT_RSP_C_UNAVAILABLE	0x0002 /* Command Unavailable      */
+#define NCSI_PKT_RSP_C_UNSUPPORTED	0x0003 /* Command Unsupported      */
+#define NCSI_PKT_RSP_R_NO_ERROR		0x0000 /* No Error                 */
+#define NCSI_PKT_RSP_R_INTERFACE	0x0001 /* Interface not ready      */
+#define NCSI_PKT_RSP_R_PARAM		0x0002 /* Invalid Parameter        */
+#define NCSI_PKT_RSP_R_CHANNEL		0x0003 /* Channel not Ready        */
+#define NCSI_PKT_RSP_R_PACKAGE		0x0004 /* Package not Ready        */
+#define NCSI_PKT_RSP_R_LENGTH		0x0005 /* Invalid payload length   */
+#define NCSI_PKT_RSP_R_UNKNOWN		0x7fff /* Command type unsupported */
+
+/* NCSI AEN packet type */
+#define NCSI_PKT_AEN		0xFF /* AEN Packet               */
+#define NCSI_PKT_AEN_LSC	0x00 /* Link status change       */
+#define NCSI_PKT_AEN_CR		0x01 /* Configuration required   */
+#define NCSI_PKT_AEN_HNCDSC	0x02 /* HNC driver status change */
+
+#endif /* __NCSI_PKT_H__ */
diff --git a/include/net/ncsi.h b/include/net/ncsi.h
new file mode 100644
index 0000000000..9637beab2a
--- /dev/null
+++ b/include/net/ncsi.h
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * NC-SI PHY
+ *
+ * Copyright (C) 2019, IBM Corporation.
+ */
+
+#include <common.h>
+#include <phy.h>
+
+bool ncsi_active(void);
+void ncsi_receive(struct ethernet_hdr *et, struct ip_udp_hdr *ip,
+		  unsigned int len);
+void ncsi_probe_packages(void);
diff --git a/include/phy.h b/include/phy.h
index b86fdfb2ce..f0c9df46c6 100644
--- a/include/phy.h
+++ b/include/phy.h
@@ -17,6 +17,7 @@
 #include <phy_interface.h>
 
 #define PHY_FIXED_ID		0xa5a55a5a
+#define PHY_NCSI_ID		0xbeefcafe
 
 #define PHY_MAX_ADDR 32
 
-- 
2.21.0

