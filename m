Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A50EAA6F
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 06:43:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473Z4P2q7zzF5Yr
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 16:43:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DhRNPd7+"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473Ywh344tzF42h
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 16:36:52 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id u23so3218664pgo.0
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 22:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/jWC14V/22BbyHuBpV3wgpYc60gByT9cBDF5UCMT+QU=;
 b=DhRNPd7+ImvMV+iX3rXFZCZYWfO4vUCgUcZ/9U5LAYRcUMKF/ctJz/RrwGpZbeI7O/
 5Yf4FwbNoNEDd5wrvxsEN6XkBjlE+MPTeRH5fDlKHAUCfcxYJGRAQ9lTDJLf3LUS3czg
 kqAAOmWU0jko6A6TgF+P3ruRRL6Lmu4K12IHEv8H0ngfhkFnQ2XCvw+Q4FCk0/c37yVP
 OEXZxTEM9uiSm0lxLCpguLIEhQs31HJGOrZWusjTZ/Cc7e/MFM9SpQzAX2SCXPBmg/Fk
 /2TM8zkiu4DGi3svwU5/j5xr9X+ns6Qe7emgaoEP6ykgOgu87lWrvHebdbBN6rv+Ka/9
 SwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/jWC14V/22BbyHuBpV3wgpYc60gByT9cBDF5UCMT+QU=;
 b=FaQuJ1br6IrbvWyTRdhZSdY8JQusfU1/nJS+zsw9ytW0Gi9F3amJyOvEkR0LNkzrcc
 K1zOyuXZC+Vj+wG6JXi7WQ5cB0iaBJuD47OranlvzO4sZL5Mi2ugTexcfggfoNwTDj49
 /T5lPdPmMKbDb2C//QxPuBGx3mrfXJv2abyOQQe4EI+VyvpRN/Po9gC5b9h5vUos0UOf
 qCsHoKmA1xu+mHlpIOBMWmUNSQet1Kwv9rsKjSkBem2IF6Nh+Vt+EG8ctgHR0uzpPd3a
 KlJTNMVZyzyR5bPeFBybyITVm4J7/KEkKt6a5T2aGRPsti9ReRUMV252vfNEj12hylfk
 H5VQ==
X-Gm-Message-State: APjAAAVpLfhqhvnBQPDiaOHba1tFGkq3b2reUTNVTl53/X+eboFgscSA
 czxcGPmCizBd3hRSj0pRDto=
X-Google-Smtp-Source: APXvYqxK/a76BgbloqFWHcJ28KUCtGXWH+w7bU5HHdUGWIBynb7XRDl4Qn04QO0sQNVVUK/IyK3O0w==
X-Received: by 2002:a17:90a:8592:: with SMTP id
 m18mr4502851pjn.118.1572500210174; 
 Wed, 30 Oct 2019 22:36:50 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l72sm5337829pjb.18.2019.10.30.22.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 22:36:49 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 v2 4/8] fsi: move defines to common header
Date: Thu, 31 Oct 2019 16:06:21 +1030
Message-Id: <20191031053625.422-5-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191031053625.422-1-joel@jms.id.au>
References: <20191031053625.422-1-joel@jms.id.au>
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

The FSI master registers are common to the hub and AST2600 master (and
the FSP2, if someone was to upstream a driver for that).

Add defines to the fsi-master.h header, and introduce headings to
delineate the existing low level details.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 55 -------------------------
 drivers/fsi/fsi-master-hub.c    | 46 ---------------------
 drivers/fsi/fsi-master.h        | 71 +++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+), 101 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 5b947c70c0f9..e38e1c2c4f15 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -17,61 +17,6 @@
 
 #include "fsi-master.h"
 
-/* TODO: these are copied from the hub master. Put them in a common header */
-
-/* Control Registers */
-#define FSI_MMODE		0x0		/* R/W: mode */
-#define FSI_MDLYR		0x4		/* R/W: delay */
-#define FSI_MCRSP		0x8		/* R/W: clock rate */
-#define FSI_MENP0		0x10		/* R/W: enable */
-#define FSI_MLEVP0		0x18		/* R: plug detect */
-#define FSI_MSENP0		0x18		/* S: Set enable */
-#define FSI_MCENP0		0x20		/* C: Clear enable */
-#define FSI_MAEB		0x70		/* R: Error address */
-#define FSI_MVER		0x74		/* R: master version/type */
-#define FSI_MSTAP0		0xd0		/* R: Port status */
-#define FSI_MRESP0		0xd0		/* W: Port reset */
-#define FSI_MESRB0		0x1d0		/* R: Master error status */
-#define FSI_MRESB0		0x1d0		/* W: Reset bridge */
-#define FSI_MSCSB0	 	0x1d4		/* R: Master sub command stack */
-#define FSI_MATRB0	 	0x1d8		/* R: Master address trace */
-#define FSI_MDTRB0	 	0x1dc		/* R: Master data trace */
-#define FSI_MECTRL		0x2e0		/* W: Error control */
-
-/* MMODE: Mode control */
-#define FSI_MMODE_EIP		0x80000000	/* Enable interrupt polling */
-#define FSI_MMODE_ECRC		0x40000000	/* Enable error recovery */
-#define FSI_MMODE_RELA		0x20000000	/* Enable relative address commands */
-#define FSI_MMODE_EPC		0x10000000	/* Enable parity checking */
-#define FSI_MMODE_P8_TO_LSB	0x00000010	/* Timeout value LSB */
-						/*   MSB=1, LSB=0 is 0.8 ms */
-						/*   MSB=0, LSB=1 is 0.9 ms */
-#define FSI_MMODE_CRS0SHFT	18		/* Clk rate selection 0 shift */
-#define FSI_MMODE_CRS0MASK	0x3ff		/* Clk rate selection 0 mask */
-#define FSI_MMODE_CRS1SHFT	8		/* Clk rate selection 1 shift */
-#define FSI_MMODE_CRS1MASK	0x3ff		/* Clk rate selection 1 mask */
-
-/* MRESB: Reset brindge */
-#define FSI_MRESB_RST_GEN	0x80000000	/* General reset */
-#define FSI_MRESB_RST_ERR	0x40000000	/* Error Reset */
-
-/* MRESB: Reset port */
-#define FSI_MRESP_RST_ALL_MASTER 0x20000000	/* Reset all FSI masters */
-#define FSI_MRESP_RST_ALL_LINK	0x10000000	/* Reset all FSI port contr. */
-#define FSI_MRESP_RST_MCR	0x08000000	/* Reset FSI master reg. */
-#define FSI_MRESP_RST_PYE	0x04000000	/* Reset FSI parity error */
-#define FSI_MRESP_RST_ALL	0xfc000000	/* Reset any error */
-
-/* MECTRL: Error control */
-#define FSI_MECTRL_EOAE		0x8000		/* Enable machine check when */
-						/* master 0 in error */
-#define FSI_MECTRL_P8_AUTO_TERM	0x4000		/* Auto terminate */
-
-#define FSI_ENGID_HUB_MASTER		0x1c
-#define FSI_HUB_LINK_OFFSET		0x80000
-#define FSI_HUB_LINK_SIZE		0x80000
-#define FSI_HUB_MASTER_MAX_LINKS	8
-
 #define FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
 
 #define FSI_NUM_DEBUGFS_ENTRIES		17
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index f158b1a88286..def35cf92571 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -13,53 +13,7 @@
 
 #include "fsi-master.h"
 
-/* Control Registers */
-#define FSI_MMODE		0x0		/* R/W: mode */
-#define FSI_MDLYR		0x4		/* R/W: delay */
-#define FSI_MCRSP		0x8		/* R/W: clock rate */
-#define FSI_MENP0		0x10		/* R/W: enable */
-#define FSI_MLEVP0		0x18		/* R: plug detect */
-#define FSI_MSENP0		0x18		/* S: Set enable */
-#define FSI_MCENP0		0x20		/* C: Clear enable */
-#define FSI_MAEB		0x70		/* R: Error address */
-#define FSI_MVER		0x74		/* R: master version/type */
-#define FSI_MRESP0		0xd0		/* W: Port reset */
-#define FSI_MESRB0		0x1d0		/* R: Master error status */
-#define FSI_MRESB0		0x1d0		/* W: Reset bridge */
-#define FSI_MECTRL		0x2e0		/* W: Error control */
-
-/* MMODE: Mode control */
-#define FSI_MMODE_EIP		0x80000000	/* Enable interrupt polling */
-#define FSI_MMODE_ECRC		0x40000000	/* Enable error recovery */
-#define FSI_MMODE_EPC		0x10000000	/* Enable parity checking */
-#define FSI_MMODE_P8_TO_LSB	0x00000010	/* Timeout value LSB */
-						/*   MSB=1, LSB=0 is 0.8 ms */
-						/*   MSB=0, LSB=1 is 0.9 ms */
-#define FSI_MMODE_CRS0SHFT	18		/* Clk rate selection 0 shift */
-#define FSI_MMODE_CRS0MASK	0x3ff		/* Clk rate selection 0 mask */
-#define FSI_MMODE_CRS1SHFT	8		/* Clk rate selection 1 shift */
-#define FSI_MMODE_CRS1MASK	0x3ff		/* Clk rate selection 1 mask */
-
-/* MRESB: Reset brindge */
-#define FSI_MRESB_RST_GEN	0x80000000	/* General reset */
-#define FSI_MRESB_RST_ERR	0x40000000	/* Error Reset */
-
-/* MRESB: Reset port */
-#define FSI_MRESP_RST_ALL_MASTER 0x20000000	/* Reset all FSI masters */
-#define FSI_MRESP_RST_ALL_LINK	0x10000000	/* Reset all FSI port contr. */
-#define FSI_MRESP_RST_MCR	0x08000000	/* Reset FSI master reg. */
-#define FSI_MRESP_RST_PYE	0x04000000	/* Reset FSI parity error */
-#define FSI_MRESP_RST_ALL	0xfc000000	/* Reset any error */
-
-/* MECTRL: Error control */
-#define FSI_MECTRL_EOAE		0x8000		/* Enable machine check when */
-						/* master 0 in error */
-#define FSI_MECTRL_P8_AUTO_TERM	0x4000		/* Auto terminate */
-
 #define FSI_ENGID_HUB_MASTER		0x1c
-#define FSI_HUB_LINK_OFFSET		0x80000
-#define FSI_HUB_LINK_SIZE		0x80000
-#define FSI_HUB_MASTER_MAX_LINKS	8
 
 #define FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
 
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index c7174237e864..6e8d4d4d5149 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -12,6 +12,71 @@
 #include <linux/device.h>
 #include <linux/mutex.h>
 
+/*
+ * Master registers
+ *
+ * These are used by hardware masters, such as the one in the FSP2, AST2600 and
+ * the hub master in POWER processors.
+ */
+
+/* Control Registers */
+#define FSI_MMODE		0x0		/* R/W: mode */
+#define FSI_MDLYR		0x4		/* R/W: delay */
+#define FSI_MCRSP		0x8		/* R/W: clock rate */
+#define FSI_MENP0		0x10		/* R/W: enable */
+#define FSI_MLEVP0		0x18		/* R: plug detect */
+#define FSI_MSENP0		0x18		/* S: Set enable */
+#define FSI_MCENP0		0x20		/* C: Clear enable */
+#define FSI_MAEB		0x70		/* R: Error address */
+#define FSI_MVER		0x74		/* R: master version/type */
+#define FSI_MSTAP0		0xd0		/* R: Port status */
+#define FSI_MRESP0		0xd0		/* W: Port reset */
+#define FSI_MESRB0		0x1d0		/* R: Master error status */
+#define FSI_MRESB0		0x1d0		/* W: Reset bridge */
+#define FSI_MSCSB0		0x1d4		/* R: Master sub command stack */
+#define FSI_MATRB0		0x1d8		/* R: Master address trace */
+#define FSI_MDTRB0		0x1dc		/* R: Master data trace */
+#define FSI_MECTRL		0x2e0		/* W: Error control */
+
+/* MMODE: Mode control */
+#define FSI_MMODE_EIP		0x80000000	/* Enable interrupt polling */
+#define FSI_MMODE_ECRC		0x40000000	/* Enable error recovery */
+#define FSI_MMODE_RELA		0x20000000	/* Enable relative address commands */
+#define FSI_MMODE_EPC		0x10000000	/* Enable parity checking */
+#define FSI_MMODE_P8_TO_LSB	0x00000010	/* Timeout value LSB */
+						/*   MSB=1, LSB=0 is 0.8 ms */
+						/*   MSB=0, LSB=1 is 0.9 ms */
+#define FSI_MMODE_CRS0SHFT	18		/* Clk rate selection 0 shift */
+#define FSI_MMODE_CRS0MASK	0x3ff		/* Clk rate selection 0 mask */
+#define FSI_MMODE_CRS1SHFT	8		/* Clk rate selection 1 shift */
+#define FSI_MMODE_CRS1MASK	0x3ff		/* Clk rate selection 1 mask */
+
+/* MRESB: Reset brindge */
+#define FSI_MRESB_RST_GEN	0x80000000	/* General reset */
+#define FSI_MRESB_RST_ERR	0x40000000	/* Error Reset */
+
+/* MRESP: Reset port */
+#define FSI_MRESP_RST_ALL_MASTER 0x20000000	/* Reset all FSI masters */
+#define FSI_MRESP_RST_ALL_LINK	0x10000000	/* Reset all FSI port contr. */
+#define FSI_MRESP_RST_MCR	0x08000000	/* Reset FSI master reg. */
+#define FSI_MRESP_RST_PYE	0x04000000	/* Reset FSI parity error */
+#define FSI_MRESP_RST_ALL	0xfc000000	/* Reset any error */
+
+/* MECTRL: Error control */
+#define FSI_MECTRL_EOAE		0x8000		/* Enable machine check when */
+						/* master 0 in error */
+#define FSI_MECTRL_P8_AUTO_TERM	0x4000		/* Auto terminate */
+
+#define FSI_HUB_LINK_OFFSET		0x80000
+#define FSI_HUB_LINK_SIZE		0x80000
+#define FSI_HUB_MASTER_MAX_LINKS	8
+
+/*
+ * Protocol definitions
+ *
+ * These are used by low level masters that bit-bang out the protocol
+ */
+
 /* Various protocol delays */
 #define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
 #define	FSI_SEND_DELAY_CLOCKS	16	/* Number clocks for send delay */
@@ -47,6 +112,12 @@
 /* fsi-master definition and flags */
 #define FSI_MASTER_FLAG_SWCLOCK		0x1
 
+/*
+ * Structures and function prototypes
+ *
+ * These are common to all masters
+ */
+
 struct fsi_master {
 	struct device	dev;
 	int		idx;
-- 
2.24.0.rc1

