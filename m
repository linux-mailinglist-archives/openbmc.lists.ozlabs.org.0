Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B3D331AA5
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 00:02:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYkv4P0xz3dSX
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 10:02:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qxaKp4Io;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qxaKp4Io; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYYx6y4Rz3cLY
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:28 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128MYadN068167; Mon, 8 Mar 2021 17:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=q2wBd9kSWkIN4op6RMhOl4kYh/s88q6b+9non7NgftQ=;
 b=qxaKp4IoKNtCZB3viOFCmE0pVzaagUI7hkUfeopjAx97MN4456t2hSnJDuCVbNBq363R
 +gRtcYYZHEENyjXLeg894W3J0a5YrRp5T8rCvFliu/d6Sp7mfohDvJooTMGTzH48a924
 Adq8PSbEhPm8PNa3+5CXWZwxDmhIlF4zCMsI1VKoPi5vq4iMNig7UsrevZhEJ5fkoFg0
 SJ8PcX+ZB6R5FmbYE9hrtjduV49+gQgNddwj9whW93idGB0Fc+G1KP0knhTd9vintCP9
 LJmK25Npvi/io0OpHxTk5ww93gatUY/ecNaWlJG9RLPHk8fc9ck//wqycfHEgU+URKEo XA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375u8raw2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:26 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128MqoNk017971;
 Mon, 8 Mar 2021 22:54:26 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 3741c96eu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:25 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsOl126214786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:24 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94806C605B;
 Mon,  8 Mar 2021 22:54:24 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66AC4C6057;
 Mon,  8 Mar 2021 22:54:24 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:24 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 15/35] ARM: dts: aspeed: tacoma: Add data
 sample phase delay for eMMC
Date: Mon,  8 Mar 2021 16:53:59 -0600
Message-Id: <20210308225419.46530-16-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210308225419.46530-1-eajames@linux.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_20:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103080118
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Andrew Jeffery <andrew@aj.id.au>

Adjust the phase delay to avoid data timeout splats like the following:

[  731.368601] mmc0: Timeout waiting for hardware interrupt.
[  731.374644] mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
[  731.381828] mmc0: sdhci: Sys addr:  0x00000020 | Version:  0x00000002
[  731.389012] mmc0: sdhci: Blk size:  0x00007200 | Blk cnt:  0x00000020
[  731.396194] mmc0: sdhci: Argument:  0x00462a18 | Trn mode: 0x0000002b
[  731.403377] mmc0: sdhci: Present:   0x01f70106 | Host ctl: 0x00000017
[  731.410559] mmc0: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[  731.417733] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00000107
[  731.424915] mmc0: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
[  731.432098] mmc0: sdhci: Int enab:  0x03ff008b | Sig enab: 0x03ff008b
[  731.439282] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[  731.446464] mmc0: sdhci: Caps:      0x01f80080 | Caps_1:   0x00000007
[  731.453647] mmc0: sdhci: Cmd:       0x0000193a | Max curr: 0x001f0f08
[  731.460829] mmc0: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0xffffffff
[  731.468013] mmc0: sdhci: Resp[2]:   0x320f5913 | Resp[3]:  0x00000900
[  731.475195] mmc0: sdhci: Host ctl2: 0x0000008b
[  731.480139] mmc0: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0xbe040200
[  731.487321] mmc0: sdhci: ============================================

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 57508b9e264d..8bd21921c691 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -185,6 +185,8 @@ &mac2 {
 
 &emmc_controller {
 	status = "okay";
+	aspeed,input-phase = <0x7>;
+	aspeed,output-phase = <0x1f>;
 };
 
 &emmc {
-- 
2.27.0

