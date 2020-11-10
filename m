Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE4B2AE1F3
	for <lists+openbmc@lfdr.de>; Tue, 10 Nov 2020 22:41:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CW1XB16z2zDqNV
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 08:41:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bUJ+IZPF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CW1Sy6l98zDqWN
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 08:38:42 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AALVwre132256; Tue, 10 Nov 2020 16:38:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=9ZBkJkDaaDMKJMBZ60dhiXY/aTm9yY5E60g9bkLwyw8=;
 b=bUJ+IZPFeWtZxSPBxRb6YxjbRae44W9tuyAc8v3g3z/2BeOM9R4M5HaWkwQYFpv8ptaP
 JCUu1paH/ogpcCnepEiWXAjLVhtuQEDpS9Cqf7FFsRWFQkjgML34Q9s2g5Hx6trMp/ib
 A1iAhXruz2/ac3or9mP4luD/P9l68r+wehXilujMHo7YlZg7hU+wZOsIcYMluG2qvNzu
 mkBDyD8pC6C/uN2FS1I9zKZ9wsI0DAtfO6BAFLCJTi9JMkb9yRMTrk39pW2NxcxapLbS
 bdi0y4XgHDVVMDawdNx58nr6U/8Tsrc7BmrBiKsFKXZ4+ol2bYaBzYsXzlh8WB7DpyOp Fg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34qsbd41an-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 16:38:37 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AALW54F007881;
 Tue, 10 Nov 2020 21:38:37 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 34nk7ab2au-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 21:38:36 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AALcZ5t8258172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Nov 2020 21:38:35 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 766ED6A054;
 Tue, 10 Nov 2020 21:38:35 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C51FE6A04D;
 Tue, 10 Nov 2020 21:38:34 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.65.201.129])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 10 Nov 2020 21:38:34 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8] spi: fsi: Fix transfer returning without
 finalizing message
Date: Tue, 10 Nov 2020 15:38:32 -0600
Message-Id: <20201110213832.24691-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-10_08:2020-11-10,
 2020-11-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=892
 mlxscore=0 priorityscore=1501 bulkscore=0 suspectscore=1 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100143
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In the case that the SPI mux isn't set, the transfer_one_message
function returns without finalizing the message. This means that
the transfer never completes, resulting in hung tasks and an
eventual kernel panic. Fix it by finalizing the transfer in this
case.

Fixes: 389874ec96e2 ("spi: fsi: Check mux status before transfers")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/spi/spi-fsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
index fec8f479687f..56b96bc16b7f 100644
--- a/drivers/spi/spi-fsi.c
+++ b/drivers/spi/spi-fsi.c
@@ -477,7 +477,7 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 
 	rc = fsi_spi_check_mux(ctx->fsi, ctx->dev);
 	if (rc)
-		return rc;
+		goto error;
 
 	list_for_each_entry(transfer, &mesg->transfers, transfer_list) {
 		struct fsi_spi_sequence seq;
-- 
2.26.2

