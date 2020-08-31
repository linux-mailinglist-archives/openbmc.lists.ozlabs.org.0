Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 774A525818F
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 21:08:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgKV5599ZzDqVl
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 05:08:13 +1000 (AEST)
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
 header.s=pp1 header.b=IE9Aig83; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgKMG0Zf2zDqJL
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 05:02:17 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07VJ2D2x186630; Mon, 31 Aug 2020 15:02:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sXt9bMiypqLrEHAK78jmnL5CEaYlSTvhgA3OzuYgFDQ=;
 b=IE9Aig83Rh8ParLwd+SeUvrFX3lrfQwDw8sFy2q/HsX/XlfmdnYtiNDbQ0wqRjqdu0ZU
 AMb838n9K4ba5/f0qLEirEOPJBnUJmNueXdnrWXUVNZseBdQ/9vUAYdS2gIEPOVMsUxV
 94A41GXuOAv27gD7vpnYq7TYgJJeoprZoSVzieOPU3tWCF91BcdTR1baW8KuRrorIn+T
 wKFTvtvZAYP28b4iz6k32OHXw5rWpkNFSVgVIr7pUj8RLmBcpbZ1Jrx3liEFnusPnYSO
 rzV4msIqz8UEKKFssT5CJsvuLzJeyIdJ6WvGGnHcZM3maGvp2cKp7Qsl3cgKTAZZ62rO /w== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3394chm7jw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 15:02:13 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07VIvu5E005301;
 Mon, 31 Aug 2020 19:01:39 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 337en8xs6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 19:01:39 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07VJ1cZA52232546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Aug 2020 19:01:38 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F7EFAE05C;
 Mon, 31 Aug 2020 19:01:38 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12E13AE062;
 Mon, 31 Aug 2020 19:01:38 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.23.184])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 31 Aug 2020 19:01:37 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/5] spl: mmc: Switch partition
 error to debug
Date: Mon, 31 Aug 2020 14:01:27 -0500
Message-Id: <20200831190130.47060-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200831190130.47060-1-eajames@linux.ibm.com>
References: <20200831190130.47060-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_09:2020-08-31,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 suspectscore=13 mlxlogscore=919 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310110
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

The partition error is normal when loading U-Boot from the eMMC
boot partition. This is because the partition is switched first,
and then the SPL attempts to get partition info, but it will read
it from the wrong spot. The raw load will still work after the
error, so make it a debug statement.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 common/spl/spl_mmc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/common/spl/spl_mmc.c b/common/spl/spl_mmc.c
index 324d91c884..aa0bcea937 100644
--- a/common/spl/spl_mmc.c
+++ b/common/spl/spl_mmc.c
@@ -173,9 +173,7 @@ static int mmc_load_image_raw_partition(struct spl_image_info *spl_image,
 
 	err = part_get_info(mmc_get_blk_desc(mmc), partition, &info);
 	if (err) {
-#ifdef CONFIG_SPL_LIBCOMMON_SUPPORT
-		puts("spl: partition error\n");
-#endif
+		debug("spl: partition error\n");
 		return -1;
 	}
 
-- 
2.26.2

