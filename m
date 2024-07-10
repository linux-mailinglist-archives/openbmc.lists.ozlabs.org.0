Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C8E92D1CF
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2024 14:42:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJyDr5mgPz3fQw
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2024 22:42:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJyDV4wftz3dSr
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2024 22:42:14 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 46ACg4ET023718
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2024 15:42:04 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 15:42:03 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 20:42:01 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 10 Jul 2024 20:42:01 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id A4EAD5F617;
	Wed, 10 Jul 2024 15:41:59 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 97523DC1A01; Wed, 10 Jul 2024 15:41:59 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v1] usb: chipidea: udc: enforce write to the memory.
Date: Wed, 10 Jul 2024 15:41:57 +0300
Message-ID: <20240710124157.2106609-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In the prime endpoint function, we need to read from qh.ptr->td.token
to ensure that the previous write to it has indeed been committed
to memory.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/usb/chipidea/udc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 0b7bd3c643c3..0b14a1d54d59 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -190,12 +190,21 @@ static int hw_ep_get_halt(struct ci_hdrc *ci, int num, int dir)
  *
  * This function returns an error code
  */
-static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
+static int hw_ep_prime(struct ci_hdrc *ci, struct ci_hw_ep *hwep, int num,
+		       int dir, int is_ctrl)
 {
 	int n = hw_ep_bit(num, dir);
 
 	/* Synchronize before ep prime */
 	wmb();
+	
+	/* 
+	 * We add the read from qh.ptr->td.token to make sure the previous
+	 * write to it indeed got into the mamory so when we prime the DMA
+	 * will read the updated data
+	 */ 
+	if (hwep->qh.ptr->td.token & 0x80000000)
+		pr_info("%s(): hwep->qh.ptr->td.token=%08x\n", __func__, hwep->qh.ptr->td.token);
 
 	if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
 		return -EAGAIN;
@@ -632,7 +641,7 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 		hwep->qh.ptr->cap |= cpu_to_le32(mul << __ffs(QH_MULT));
 	}
 
-	ret = hw_ep_prime(ci, hwep->num, hwep->dir,
+	ret = hw_ep_prime(ci, hwep, hwep->num, hwep->dir,
 			   hwep->type == USB_ENDPOINT_XFER_CONTROL);
 done:
 	return ret;
@@ -658,7 +667,7 @@ static int reprime_dtd(struct ci_hdrc *ci, struct ci_hw_ep *hwep,
 	hwep->qh.ptr->td.token &=
 		cpu_to_le32(~(TD_STATUS_HALTED | TD_STATUS_ACTIVE));
 
-	return hw_ep_prime(ci, hwep->num, hwep->dir,
+	return hw_ep_prime(ci, hwep, hwep->num, hwep->dir,
 				hwep->type == USB_ENDPOINT_XFER_CONTROL);
 }
 
-- 
2.34.1

