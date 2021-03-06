Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD91932F9B5
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 12:29:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dt2SM62fZz3dCq
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 22:29:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fquMznex;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fquMznex; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dt2Rg2wlFz3cKQ
 for <openbmc@lists.ozlabs.org>; Sat,  6 Mar 2021 22:28:46 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 126B4Qc2008082; Sat, 6 Mar 2021 06:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qbOvxWcv8pli5WOMvUBc5fBPgzWW29AsO51C5RKP5dA=;
 b=fquMznexkDUtt+JvT/EnsTzIbHQuEfIgc8eUFeS+GvZkO5lOnMFAbc2wUMKFWbhqC8Aw
 QYsvS3aA3yMv3/bEkf9ZgS4iclkw0GAieVsjeq/JbSaKyc2vlEcg5zN0OgedyTC9zviY
 kga8lV0fpgb8ahKL82PkTtv6seo2k4HFwk9PfreT5FZU5F8se3PrVa3pl7nZfdhQlNjF
 9qsK5Pq8/MVFOCKJ2kA11zY/xQI8tlh7iX2C1jbCvDEbuUSWE7sXKJLUiadF5zjqiCyh
 OM7krrMG+IIZ2sNr0v6rHro8K4DP6gxCGW5mXLWOVIkyvaArCuNO5mFXHGbzeBa8dIDx kw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37480bguuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Mar 2021 06:28:36 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 126BR5E8030561;
 Sat, 6 Mar 2021 11:28:35 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 3741c8hyf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Mar 2021 11:28:35 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 126BSZIu22938038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 6 Mar 2021 11:28:35 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37AFBAE06B;
 Sat,  6 Mar 2021 11:28:35 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C13CAE06A;
 Sat,  6 Mar 2021 11:28:34 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.167.17])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat,  6 Mar 2021 11:28:34 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][RFC 0/3] u-boot: Support SPL Verified Boot
Date: Sat,  6 Mar 2021 08:28:19 -0300
Message-Id: <20210306112822.11668-1-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-06_05:2021-03-03,
 2021-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103060068
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series aims at extending U-Boot's verified boot support to
also include SPL signing.

The proposal is to some of the infrastructure (variables, functions)
used to sign the Kernel FitImage to more common locations, and then
essentially duplicate the method currently used to sign the Kernel
fitImage to also sign the U-Boot fitImage.

In the UBOOT_SIGN_ENABLE = "1" scenario, nothing really changes: The
Kernel fitImage is created, then signed, and the pubkey is added to
u-boot.dtb which is concatenated with the u-boot-nodtb.bin to create the
u-boot final image.

In case SPL_SIGN_ENABLE = "1", The U-Boot PN will take care of (re-)
creating the U-Boot fitImage (using custom .its script) after compile,
sign it, and contatenate the u-boot-spl.dtb (with the public key) with
u-boot-spl-nodtb.bin to create the final U-Boot SPl on deploy.

In case both UBOOT_SIGN_ENABLE and SPL_SIGN_ENABLE are set, the Kernel
PN will take care of creating and signing the U-Boot fitImage (becase we
need to also sign the FDT image containing the Kernel pubkey), and take
care of deploying it.

I tested all three scenarios using OpenBMC upstream, and although there
might be some areas of improvement (like deploying the new binaries and
symlinks with more useful names), it appears to work well.

One caveat is that when moving between the scenarios above, the user
might need to remove the tmp/ directory, since there could be a
collision for some of the files deployed into the images directory,
since the configuration may determine which PN does that.

Reviews, thoughts and comments are very very welcome,

Thanks,

 -Klaus


