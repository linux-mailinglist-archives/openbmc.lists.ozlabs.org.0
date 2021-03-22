Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 189A53449F6
	for <lists+openbmc@lfdr.de>; Mon, 22 Mar 2021 16:58:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3zg50gFZz3037
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 02:58:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hcV1yQxM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hcV1yQxM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3zfr6QrLz2y8B
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 02:57:55 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12MFXWOD094464; Mon, 22 Mar 2021 11:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=c6vRmmtUGUJlx017UalS2ChY9nfv4US7GTgVD+etBJI=;
 b=hcV1yQxM+M7sCpqoL1beMIYfRFudxRoqKB4Zizi38Kj1NXZ59AGyWzYM4feInUrB8gGr
 YjDsrWb08n/h2sGuXz6iOoylmBKOY3C3BfXdw7jsnrdEOlGS+VMPIftxcY7ojbiXCYhh
 veE7ceMmbPhz4trt8u2jDyf8Cju8D1w2D7gGGKe+yodcpgMfB9g9PLpcBvYK//ODdZ/G
 IMnqbWINVzlJRm9plIDnrnspIj5B1Pvq/b6vlo4NDybP15qTH5IPnH3TvJo7HKlwYysx
 bXazOR6QDFaNqF2wYRs/KRqTKA16GOSuT6OitTUYbYq0wXyuCHozT+8o1bzFAmK5FYeP YQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ef6medk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 11:57:52 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12MFqU8s002647;
 Mon, 22 Mar 2021 15:57:51 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 37d9amb76w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 15:57:51 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12MFvoiX35783024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Mar 2021 15:57:50 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ABE4C6059;
 Mon, 22 Mar 2021 15:57:50 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1999CC605B;
 Mon, 22 Mar 2021 15:57:50 +0000 (GMT)
Received: from fstone06p1.aus.stglabs.ibm.com (unknown [9.3.116.158])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 22 Mar 2021 15:57:49 +0000 (GMT)
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: [PATCH linux-next tag: next-20210322] ARM: aspeed: Add CPU hotplug
 callbacks for kexec support
Date: Mon, 22 Mar 2021 15:57:20 +0000
Message-Id: <20210322155720.2161941-1-bruce.mitchell@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_08:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103220111
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
Cc: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

These callbacks are required for kexec to function. The AST2600 does not
expose any controls for powering down it's CPU cores, so we borrow the
approach taken from socfpga and wait in the idle loop.

Author: Joel Stanley <joel@jms.id.au>

Signed-off-by: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
---
 arch/arm/mach-aspeed/platsmp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/mach-aspeed/platsmp.c b/arch/arm/mach-aspeed/platsmp.c
index 2324becf7991..1ae3ff5a9701 100644
--- a/arch/arm/mach-aspeed/platsmp.c
+++ b/arch/arm/mach-aspeed/platsmp.c
@@ -7,6 +7,8 @@
 #include <linux/of.h>
 #include <linux/smp.h>
 
+#include <asm/proc-fns.h>
+
 #define BOOT_ADDR	0x00
 #define BOOT_SIG	0x04
 
@@ -53,9 +55,27 @@ static void __init aspeed_g6_smp_prepare_cpus(unsigned int max_cpus)
 	iounmap(base);
 }
 
+#ifdef CONFIG_HOTPLUG_CPU
+static void aspeed_g6_cpu_die(unsigned int cpu)
+{
+        /* Do WFI. If we wake up early, go back into WFI */
+        while (1)
+                cpu_do_idle();
+}
+
+static int aspeed_g6_cpu_kill(unsigned int cpu)
+{
+        return 1;
+}
+#endif
+
 static const struct smp_operations aspeed_smp_ops __initconst = {
 	.smp_prepare_cpus	= aspeed_g6_smp_prepare_cpus,
 	.smp_boot_secondary	= aspeed_g6_boot_secondary,
+#ifdef CONFIG_HOTPLUG_CPU
+	.cpu_die		= aspeed_g6_cpu_die,
+	.cpu_kill		= aspeed_g6_cpu_kill,
+#endif
 };
 
 CPU_METHOD_OF_DECLARE(aspeed_smp, "aspeed,ast2600-smp", &aspeed_smp_ops);
-- 
2.25.1

