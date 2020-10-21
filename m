Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3456E294C8E
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 14:27:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGVB36DRzzDqXL
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 23:27:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=ny498izy; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGV863196zDqXL
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 23:25:42 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id BC208412D8;
 Wed, 21 Oct 2020 12:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:date:date:from:from:subject:subject
 :message-id:received:received:received; s=mta-01; t=1603283133;
 x=1605097534; bh=pPJtAKSUqp8FtQFpZO0plycVNmV9eFUI3NDOaisQJro=; b=
 ny498izyAIqxwv3k3GZqlVYDX8pRrIqfQ9sbgf84KHz1NCmt2FIyr0ix4v8Ubu0D
 5w3XVrKfLAVEUHKg7h+ZKyAxA6P/0p8sP7Cs4XabDXFpmMM5rroN9iqqg5Zvlmln
 QofDHQymowkG5wfJHMPlHWJt2RuOuJGtUnnawRkx43Q=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RQLzsv-onsGc; Wed, 21 Oct 2020 15:25:33 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1A71F41280;
 Wed, 21 Oct 2020 15:25:32 +0300 (MSK)
Received: from [10.199.3.130] (10.199.3.130) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 21
 Oct 2020 15:25:32 +0300
Message-ID: <e6f4ab29854ac58a878189c1edece4e8eed2e7fd.camel@yadro.com>
Subject: [PATCH] peci: Set "Wake On PECI" mode when required
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Joel Stanley <joel@jms.id.au>, "Mihm,James" <james.mihm@intel.com>, "Jae
 Hyun Yoo" <jae.hyun.yoo@linux.intel.com>
Date: Wed, 21 Oct 2020 15:25:26 +0300
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.3.130]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

RdPCIConfigLocal(), WrPCIConfigLocal(), and RdPCIConfig() PECI commands
can return "hardware resources are in a low power state". This case
retrying likely will also fail since wakeup is required.
Enable "Wake On PECI" mode before retry if processor in low power
state.

Tested: run RdPCIConfigLocal requests and control that there in no more
timeouts when processor is in low power state. There is no measurable
impact on request processing time between request succeeded from first
try before patch and request with wakeup.

Signed-off-by: Andrei Kartashev <a.kartashev@yadro.com>
---
 drivers/peci/peci-core.c | 88 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 3 deletions(-)

diff --git a/drivers/peci/peci-core.c b/drivers/peci/peci-core.c
index ba561bf810f9..dbd33e0e3a1c 100644
--- a/drivers/peci/peci-core.c
+++ b/drivers/peci/peci-core.c
@@ -237,6 +237,10 @@ static int __peci_xfer(struct peci_adapter *adapter, struct peci_xfer_msg *msg,
 		    PECI_DEV_CC_NEED_RETRY)
 			break;
 
+		/* Wakeup is needed when completion code is 0x82 */
+		if (msg->rx_buf[0] == PECI_DEV_CC_UNAVAIL_RESOURCE)
+			break;
+
 		/* Set the retry bit to indicate a retry attempt */
 		msg->tx_buf[1] |= PECI_DEV_RETRY_BIT;
 
@@ -285,6 +289,84 @@ static int peci_xfer_with_retries(struct peci_adapter *adapter,
 	return __peci_xfer(adapter, msg, true, has_aw_fcs);
 }
 
+static int peci_xfer_with_wakeup(struct peci_adapter *adapter,
+				  struct peci_xfer_msg *msg,
+				  bool has_aw_fcs)
+{
+	struct peci_xfer_msg *wmsg = NULL;
+	u8 aw_fcs;
+	int ret;
+	int ret_tmp;
+
+	ret = __peci_xfer(adapter, msg, true, has_aw_fcs);
+
+	/* Wakeup is needed when completion code is 0x82 */
+	if (msg->rx_buf[0] == PECI_DEV_CC_UNAVAIL_RESOURCE) {
+		wmsg = peci_get_xfer_msg(PECI_WRPKGCFG_WRITE_LEN_BASE + 4,
+					PECI_WRPKGCFG_READ_LEN);
+		if (!wmsg)
+			return -ENOMEM;
+
+		wmsg->addr = msg->addr;
+		wmsg->tx_buf[0] = PECI_WRPKGCFG_CMD;
+		wmsg->tx_buf[1] = 0;  /* request byte for Host ID | Retry bit */
+				      /* Host ID is 0 for PECI 3.0 */
+		/* RdPkgConfig index */
+		wmsg->tx_buf[2] = PECI_MBX_INDEX_WAKE_MODE_BIT;
+		wmsg->tx_buf[3] = 1;  /* LSB - Config parameter */
+		wmsg->tx_buf[4] = 0;  /* MSB - Config parameter */
+		wmsg->tx_buf[5] = 0;  /* Data */
+		wmsg->tx_buf[6] = 0;  /* Data */
+		wmsg->tx_buf[7] = 0;  /* Data */
+		wmsg->tx_buf[8] = 0;  /* Data */
+
+		/* Add an Assured Write Frame Check Sequence byte */
+		ret_tmp = peci_aw_fcs(wmsg, 8 + 4, &aw_fcs);
+		if (ret_tmp) {
+			ret = ret_tmp;
+			goto out;
+		}
+
+		wmsg->tx_buf[9] = 0x80 ^ aw_fcs;
+
+		ret_tmp = __peci_xfer(adapter, wmsg, true, true);
+		if (ret_tmp) {
+			ret = ret_tmp;
+			goto out;
+		}
+
+		/* Resend command */
+		ret = __peci_xfer(adapter, msg, true, has_aw_fcs);
+
+		/*
+		 * Assume that if we got CC 0x82 then “Wake on PECI” mode
+		 * bit was not set, so no need to read and remember it
+		 */
+		wmsg->tx_buf[3] = 0;    /* LSB - Config parameter */
+		/* Recalculate an Assured Write Frame Check Sequence byte */
+		ret_tmp = peci_aw_fcs(wmsg, 8 + 4, &aw_fcs);
+		if (ret_tmp) {
+			if (ret == 0)
+				ret = ret_tmp;
+			goto out;
+		}
+
+		wmsg->tx_buf[9] = 0x80 ^ aw_fcs;
+
+		ret_tmp = __peci_xfer(adapter, wmsg, true, true);
+		if (ret_tmp) {
+			if (ret == 0)
+				ret = ret_tmp;
+			goto out;
+		}
+	}
+
+out:
+	if (wmsg)
+		peci_put_xfer_msg(wmsg);
+	return ret;
+}
+
 static int peci_scan_cmd_mask(struct peci_adapter *adapter)
 {
 	struct peci_xfer_msg *msg;
@@ -658,7 +740,7 @@ static int peci_cmd_rd_pci_cfg(struct peci_adapter *adapter, void *vmsg)
 	msg->tx_buf[4] = (u8)(address >> 16); /* PCI Config Address */
 	msg->tx_buf[5] = (u8)(address >> 24); /* MSB - PCI Config Address */
 
-	ret = peci_xfer_with_retries(adapter, msg, false);
+	ret = peci_xfer_with_wakeup(adapter, msg, false);
 	if (!ret)
 		memcpy(umsg->pci_config, &msg->rx_buf[1], 4);
 
@@ -706,7 +788,7 @@ static int peci_cmd_rd_pci_cfg_local(struct peci_adapter *adapter, void *vmsg)
 	msg->tx_buf[3] = (u8)(address >> 8);  /* PCI Configuration Address */
 	msg->tx_buf[4] = (u8)(address >> 16); /* PCI Configuration Address */
 
-	ret = peci_xfer_with_retries(adapter, msg, false);
+	ret = peci_xfer_with_wakeup(adapter, msg, false);
 	if (!ret)
 		memcpy(umsg->pci_config, &msg->rx_buf[1], umsg->rx_len);
 
@@ -758,7 +840,7 @@ static int peci_cmd_wr_pci_cfg_local(struct peci_adapter *adapter, void *vmsg)
 
 	msg->tx_buf[5 + i] = 0x80 ^ aw_fcs;
 
-	ret = peci_xfer_with_retries(adapter, msg, true);
+	ret = peci_xfer_with_wakeup(adapter, msg, true);
 
 out:
 	umsg->cc = msg->rx_buf[0];
-- 
2.26.2

