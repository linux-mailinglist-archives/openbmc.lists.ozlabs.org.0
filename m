Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 156A2527D87
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 08:24:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1q2r57Ytz3c7P
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 16:24:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=NhVHYjd/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6135bb9a91=pdel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=NhVHYjd/; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1q2Y6Y5xz2ypn
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 16:23:43 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 24G0KenR010287
 for <openbmc@lists.ozlabs.org>; Sun, 15 May 2022 23:23:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=2K6Opd5SvdIGvt1jTx4IabYk3CMsDcHjZDyO/pkQls0=;
 b=NhVHYjd/LEAO+hkwmI7yHsA4vuJ3mZ1j+ABjrPcpa0eePI618kx+z1q4Xe6sSSKVWfa0
 FIFII+mLQcoALHmTsd8ufFPsZfLqpAob5VoWja/9nrIghABrqJJa1I73no2SbeOVQOyr
 VPTcUnH/EALrjX4YquHiFQAytZTXuulLVcI= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net (PPS) with ESMTPS id 3g27x97pvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 15 May 2022 23:23:40 -0700
Received: from twshared13579.04.prn5.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:21d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 15 May 2022 23:23:38 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 026E864DCAC2; Sun, 15 May 2022 23:23:29 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
Subject: [PATCH v2 0/5] hw: aspeed: Init all UART's with serial devices
Date: Sun, 15 May 2022 23:23:23 -0700
Message-ID: <20220516062328.298336-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: e4ckwqJcre3q0_rorT3Kd_a79jcCK_zn
X-Proofpoint-ORIG-GUID: e4ckwqJcre3q0_rorT3Kd_a79jcCK_zn
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
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
Cc: peter.maydell@linaro.org, zev@bewilderbeest.net, andrew@aj.id.au,
 irischenlj@fb.com, openbmc@lists.ozlabs.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, pdel@fb.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

v2:
- Rebased on Cedric's irq proposal. [1]
- Added "Introduce common UART init function" patch
- Added "Add uarts_num SoC attribute" patch
- Rewrote last commit's message for clarity

I tried testing this by running acceptance tests, particularly the
boot_linux_console.py file, but I had to disable the raspi2_initrd case.
It's not related to my changes (A/B tested and it fails on upstream/master
too), but thought I would mention that.

I also manually tested several machines:

AST2400: https://github.com/facebook/openbmc/releases/download/v2021.49.0/w=
edge100.mtd
AST2500: https://github.com/facebook/openbmc/releases/download/v2021.49.0/f=
by3.mtd
AST2600: https://github.com/facebook/openbmc/releases/download/v2021.49.0/f=
uji.mtd
AST1030: https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35=
-cl-2022.13.01/Y35BCL.elf

[1] https://lore.kernel.org/qemu-devel/20220516055620.2380197-1-clg@kaod.or=
g/

Peter Delevoryas (5):
  hw: aspeed: Add missing UART's
  hw: aspeed: Add uarts_num SoC attribute
  hw: aspeed: Ensure AST1030 respects uart-default
  hw: aspeed: Introduce common UART init function
  hw: aspeed: Init all UART's with serial devices

 hw/arm/aspeed_ast10x0.c     | 32 +++++++++++++++++++++++++++-----
 hw/arm/aspeed_ast2600.c     | 27 ++++++++++++++++++++++-----
 hw/arm/aspeed_soc.c         | 33 +++++++++++++++++++++++++++++----
 include/hw/arm/aspeed_soc.h | 10 ++++++++++
 4 files changed, 88 insertions(+), 14 deletions(-)

--=20
2.30.2

