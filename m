Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B1E359381
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 06:02:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGkwj25RQz3bTy
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 14:02:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=ZIonEL3d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=5733813a0f=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=ZIonEL3d; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGkwH6dr0z2xZh;
 Fri,  9 Apr 2021 14:01:50 +1000 (AEST)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1393vYN0012652; Fri, 9 Apr 2021 04:01:25 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by mx0a-00268f01.pphosted.com with ESMTP id 37t8pf1409-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 04:01:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWNeWfltrg2FkBx1vgkm/RDqAd3juqWKlrneXDDroCKaL6ULRVVQBY+n1/OCZnbucl4wSMntPDjolBD+yNL3kZEwiJoized6s5+4zqAkOyhttKC4UULKH+mZJ4yctMAIrD3GT6d+VS2iJPDDDx4jjVqr7maXRBccDu1Htb3+J9Adse1xNCies7Pnrp0h98EifPq1htDVVvLteyu51iU8sm8OB5MP6XbRHgXgrl4Z0r9Mqi7dGNMxX0gURfmyfsi0jbA3zOdCHddvT16MxBfoBkl6sGTuoFrgc663HHHhKtz3SkL/AXHKwcfenToeUv19YOQY8G0PLJBICS8MqoW4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYNNv0ZSkzU3ZvJehc5StX2sIr7WaNL3tAkBpYrbl7U=;
 b=F+kTb2/PIlL9pDgoFDXupeTmNAyO941yo5LbpYqRZ937NOvM2X8tTl5whILYYwTwzSTMMTNZel8svUfp9Iuq9vB/oGGcd2s06FNPRuYdGPWFo0vNm3Egfhe7gFs4kuBwzPRaAACi1QpUfWgzIKVSk8uR1lEb8KHUjJ6Jh9uFUYP4nVgt8NWWbdHJGCrViysv0oLkyMMN44mgLE/yK42yYBXxI8IIy6gY4IQaJH7pdGKq38QR4wvVxSuZn9RllTD7HfqQBtx+4OHqGTvH4b4W5I00+c2/1rmrhSkJrMPJQnA9zI2lmQzEaCMtGTcvnYMWWo/7npY4ALbeQatP1pn4ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYNNv0ZSkzU3ZvJehc5StX2sIr7WaNL3tAkBpYrbl7U=;
 b=ZIonEL3dmBH7OESqeuNxfRi8JAZRuCPu3eTDUqFp2WwHHrbDB63H0x4xRAw8dULOy+Tk5Oi3mYwIOHDbc8nLtDG14Rs3Lao7COzm8r1RPQ9Dsk0munE6EpJrmNGGlcoEHPVtjtCDYKnAWMWwnzrUpXK2DKSOsKzI5M0rlAiqoLg=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB5420.namprd04.prod.outlook.com (2603:10b6:5:105::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.29; Fri, 9 Apr 2021 04:01:21 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 04:01:21 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 11/21] ipmi: kcs_bmc: Split headers into device and
 client
Thread-Topic: [PATCH v2 11/21] ipmi: kcs_bmc: Split headers into device and
 client
Thread-Index: AQHXLPUAcNk3H3d+bUCgCJVA00RN8A==
Date: Fri, 9 Apr 2021 04:01:21 +0000
Message-ID: <YG/RkB07Wh69/xdu@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-11-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-11-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a660d812-8251-4c18-1d6a-08d8fb0c22e2
x-ms-traffictypediagnostic: DM6PR04MB5420:
x-microsoft-antispam-prvs: <DM6PR04MB5420E0DD7C95FFA759EC2CAAC3739@DM6PR04MB5420.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qujRAVZlxBgsNgHNK3Z3bTA85tYkD1rjWWDWZmDT3BW8Q1SuQZo1ut5FGuYlA7o+3RZD1A7oBgx2AwNHluAas2sieflTpJzsC0CAABVXtcvSr2Ux6jgwaCpwVkPnoTe3T6rL77JqOegrwKu+MNddMg2uIRIKaQKaszSUkF7lTmnoMgfGkmyMmyqkRMQinQnq1iIKMPmwrESPUlNPKceg0DsgwF8Ep+jJLvxIm3LXVNFP+m7SFiKBIfvlUU/LwDaGEPAyorIl/wQMOBBIE9H9/CnmY8pZfFDv68gTwt++R5UJraJ+MXdPOMNpDqKvuIyfZbxsYJIrtv6CY2+T0j7NI14eroFXHzo2d7JaPBGtdl+CWjA91IlDC6ah1/4NpqOiNCXoEediL8Yx1ZpbUhAUXkKded0vzTXABYoFEi5Hni1g0513ZviTm1N7UVAJUqxPTtOuGRQMXKHLg+josPlfyFocCTlixzvWG0LDKSWiOC6fEJ3GpoLaNBdVIf9jD0ZQyP7ixdX4SNVcpqoyEUResLtf/+CI3qih6iyqqVp1K1hLnqGwvLZaUP/qI5vMGyrVrW6h9jdJkXccTGVvOMA0lTunM/3OWFPDRGoaF9SnsiWWZDy0K2odSlhBbW259w83gtRKErECl72RBkpH/VsxtACtS4l62SuJh3DS96t+gv0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(346002)(376002)(366004)(136003)(39860400002)(396003)(38100700001)(6512007)(9686003)(66446008)(66556008)(64756008)(66476007)(76116006)(478600001)(316002)(54906003)(86362001)(66946007)(6506007)(71200400001)(5660300002)(6486002)(8936002)(8676002)(83380400001)(30864003)(4326008)(6916009)(7416002)(33716001)(186003)(26005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0rlI408dZC7SiGyghKCwa2GM79k3gHSaBWIWD3YYA6BLvKV6pAZxGQDir11H?=
 =?us-ascii?Q?qokZ4wtGT/Z35g6/8MWewro1aux8f1zH1jb+rXqch1+eJLBh7+zMB3SaXUaz?=
 =?us-ascii?Q?vsBFuNEwmeneGpwC50nDO+93Um/bEhrtiDMfH7T5qrXnzg9c36naO2FzD0uw?=
 =?us-ascii?Q?xoQNDSVUuhR8zRp53b957Cy2Uvxott7o9+2t/O6f4fRpEnNCnqXZwywPiG5H?=
 =?us-ascii?Q?JoNMaBffguxrN6y4xZqrG+W9EJVrKpaZ+wWiuXPwsfPeeK4SEpUh/gev26g+?=
 =?us-ascii?Q?OYHr8MXnQ38d37aevuTeDS8kSJg0dlE+EJahyVGPNm2hfHr+IVsxqIyo+/F9?=
 =?us-ascii?Q?9Bsfsh3FfPwfm8Mr++mRAfY6oowrnc8mOjwMlondFgxX+Wxz8+vfjzqWYe1J?=
 =?us-ascii?Q?yhB6pEjk2VOi7wbJAgZ8di2ZV8mMp7GSkP6zWvtRpJoqmztvM1KDnVxKgscz?=
 =?us-ascii?Q?PzCZ75xadaic+cRS5ATyYpfhKGO933vsMb8ZZmiSWLLtEA6m6IE9EYPkOQFT?=
 =?us-ascii?Q?bbJrX/e3yjRGRCQA60fMmM2CS5q/zE5viqwrRuSzAXOu4AL9/152JGTOlDxr?=
 =?us-ascii?Q?dZuMUyVTQUUJ+mIiXkQQTTVK5ZRHMbQ7GCY/eatglEnIYzElYqSPkH8XAdie?=
 =?us-ascii?Q?JDrUoH/XujEnh7Ep3h8gMxKVFiXVoWJ+A99HohxGpj1zkLYaAtbqHvt3OIv5?=
 =?us-ascii?Q?6xCPYlVCPqvOj+Gw8r8FEwP1eq3WFWM3hncs0St6GdXFQgPOefKPOQxpkkNE?=
 =?us-ascii?Q?mcGeoXtqo3TkPGN3pVdc+B74c7lCq+tquCrBMunQOUol5myPRH6b4B3JtP02?=
 =?us-ascii?Q?Qm5/aZPzfDiM8JMjo4G+CvmTgZjhThZ0pefHs0c4dgY9CMOXn1u/8nmxL6wE?=
 =?us-ascii?Q?ugdcK8ttgqtxdWcDT34xrLCqfcmt1Lnspu6Ipv3HsAbl03UaJ5WxkTakc3wK?=
 =?us-ascii?Q?XkxmQaiE0nSK27QL6nRKhurpNs/SsohWf0CC5E1v/S9kjs4aLus7tk5bHZJ0?=
 =?us-ascii?Q?nhSd4NYj1XJChbA0cbDS44dkPhhm5xGmIGvhyUMytpyq8jdtS/uIxHidchYa?=
 =?us-ascii?Q?qwwlw2cvSrvFlZ9UpI78aNWNCZnYHFxX9ahK793YsP8Rc2VanktZk46k/4gu?=
 =?us-ascii?Q?WtqznEmPglCGXg9rjrP2wkeyszSKeNPtXoRcq3fUvE9j7X9I+J3gHNaTFXsq?=
 =?us-ascii?Q?EiRKtpVtfIHhF5KC/VjB9SjgJN98kGpEUlKnO0oQmOckEHd4V71N7/vYLF95?=
 =?us-ascii?Q?CvefiUP8kQ0WwWk7d/g8CxQSsj9wpaHYgE0StQO92xy1sgxaQlD6CMHlcXj2?=
 =?us-ascii?Q?Y/+MgCCOWDNbS/dA/f/thXMUFZuAlECU6+v5q+Um8l5PZw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D20D87C509F3CF44A7C5D5F61F40112A@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a660d812-8251-4c18-1d6a-08d8fb0c22e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 04:01:21.4959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tu3D5O17jsz+gy3uBHbBx4o/x2aqD5gDz8Ay6Q6dbhI1nBIBOi+tjfTVg7QIc3m4X++sCS9Tomq0r2zzuaBTuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5420
X-Proofpoint-GUID: oyVuhMHmUtrptN4_e7HF9hmqY5UFf0zt
X-Proofpoint-ORIG-GUID: oyVuhMHmUtrptN4_e7HF9hmqY5UFf0zt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_03:2021-04-08,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090026
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>,
 "ryan_chen@aspeedtech.com" <ryan_chen@aspeedtech.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "minyard@acm.org" <minyard@acm.org>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "benjaminfair@google.com" <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 19, 2021 at 01:27:42AM CDT, Andrew Jeffery wrote:
>Strengthen the distinction between code that abstracts the
>implementation of the KCS behaviours (device drivers) and code that
>exploits KCS behaviours (clients). Neither needs to know about the APIs
>required by the other, so provide separate headers.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/kcs_bmc.c           | 21 ++++++++++-----
> drivers/char/ipmi/kcs_bmc.h           | 30 ++++++++++-----------
> drivers/char/ipmi/kcs_bmc_aspeed.c    | 20 +++++++++-----
> drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 39 ++++++++++++++++++---------
> drivers/char/ipmi/kcs_bmc_client.h    | 29 ++++++++++++++++++++
> drivers/char/ipmi/kcs_bmc_device.h    | 19 +++++++++++++
> drivers/char/ipmi/kcs_bmc_npcm7xx.c   | 20 +++++++++-----
> 7 files changed, 129 insertions(+), 49 deletions(-)
> create mode 100644 drivers/char/ipmi/kcs_bmc_client.h
> create mode 100644 drivers/char/ipmi/kcs_bmc_device.h
>
>diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
>index 709b6bdec165..1046ce2bbefc 100644
>--- a/drivers/char/ipmi/kcs_bmc.c
>+++ b/drivers/char/ipmi/kcs_bmc.c
>@@ -1,46 +1,52 @@
> // SPDX-License-Identifier: GPL-2.0
> /*
>  * Copyright (c) 2015-2018, Intel Corporation.
>+ * Copyright (c) 2021, IBM Corp.
>  */
>
> #include <linux/module.h>
>
> #include "kcs_bmc.h"
>
>+/* Implement both the device and client interfaces here */
>+#include "kcs_bmc_device.h"
>+#include "kcs_bmc_client.h"
>+
>+/* Consumer data access */
>+
> u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
> {
>-	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
>+	return kcs_bmc->ops->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
> }
> EXPORT_SYMBOL(kcs_bmc_read_data);
>
> void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
> {
>-	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
>+	kcs_bmc->ops->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
> }
> EXPORT_SYMBOL(kcs_bmc_write_data);
>
> u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
> {
>-	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
>+	return kcs_bmc->ops->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
> }
> EXPORT_SYMBOL(kcs_bmc_read_status);
>
> void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
> {
>-	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
>+	kcs_bmc->ops->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
> }
> EXPORT_SYMBOL(kcs_bmc_write_status);
>
> void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
> {
>-	kcs_bmc->io_updateb(kcs_bmc, kcs_bmc->ioreg.str, mask, val);
>+	kcs_bmc->ops->io_updateb(kcs_bmc, kcs_bmc->ioreg.str, mask, val);
> }
> EXPORT_SYMBOL(kcs_bmc_update_status);
>
>-int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc);
> int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
> {
>-	return kcs_bmc_ipmi_event(kcs_bmc);
>+	return kcs_bmc->client.ops->event(&kcs_bmc->client);
> }
> EXPORT_SYMBOL(kcs_bmc_handle_event);
>
>@@ -60,4 +66,5 @@ EXPORT_SYMBOL(kcs_bmc_remove_device);
>
> MODULE_LICENSE("GPL v2");
> MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
> MODULE_DESCRIPTION("KCS BMC to handle the IPMI request from system softwa=
re");
>diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
>index bf0ae327997f..a1350e567723 100644
>--- a/drivers/char/ipmi/kcs_bmc.h
>+++ b/drivers/char/ipmi/kcs_bmc.h
>@@ -8,6 +8,15 @@
>
> #include <linux/miscdevice.h>
>
>+#include "kcs_bmc_client.h"
>+
>+#define KCS_BMC_EVENT_NONE	0
>+#define KCS_BMC_EVENT_HANDLED	1

Is there a particular reason we're introducing these macros and using an
int return type for kcs_bmc_client_ops.event instead of just having it
be irqreturn_t?  Other event types or outcomes we're anticipating needing
to handle maybe?

>+
>+#define KCS_BMC_STR_OBF		BIT(0)
>+#define KCS_BMC_STR_IBF		BIT(1)
>+#define KCS_BMC_STR_CMD_DAT	BIT(3)

The first two of these macros are used later in the series, but the third
doesn't end up used at all I think?

>+
> /* Different phases of the KCS BMC module.
>  *  KCS_PHASE_IDLE:
>  *            BMC should not be expecting nor sending any data.
>@@ -66,19 +75,21 @@ struct kcs_ioreg {
> 	u32 str;
> };
>
>+struct kcs_bmc_device_ops;
>+
> struct kcs_bmc {
> 	struct device *dev;
>
>+	const struct kcs_bmc_device_ops *ops;
>+
>+	struct kcs_bmc_client client;
>+
> 	spinlock_t lock;
>
> 	u32 channel;
> 	int running;
>
>-	/* Setup by BMC KCS controller driver */
> 	struct kcs_ioreg ioreg;
>-	u8 (*io_inputb)(struct kcs_bmc *kcs_bmc, u32 reg);
>-	void (*io_outputb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 b);
>-	void (*io_updateb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 val);
>
> 	enum kcs_phases phase;
> 	enum kcs_errors error;
>@@ -97,15 +108,4 @@ struct kcs_bmc {
>
> 	struct miscdevice miscdev;
> };
>-
>-int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
>-int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc);
>-int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc);
>-
>-u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc);
>-void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data);
>-u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc);
>-void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data);
>-void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val);
>-
> #endif /* __KCS_BMC_H__ */
>diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bm=
c_aspeed.c
>index 0416ac78ce68..1b313355b1c8 100644
>--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
>+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
>@@ -21,7 +21,7 @@
> #include <linux/slab.h>
> #include <linux/timer.h>
>
>-#include "kcs_bmc.h"
>+#include "kcs_bmc_device.h"
>
>
> #define DEVICE_NAME     "ast-kcs-bmc"
>@@ -220,14 +220,22 @@ static void aspeed_kcs_enable_channel(struct kcs_bmc=
 *kcs_bmc, bool enable)
> 	}
> }
>
>+static const struct kcs_bmc_device_ops aspeed_kcs_ops =3D {
>+	.io_inputb =3D aspeed_kcs_inb,
>+	.io_outputb =3D aspeed_kcs_outb,
>+	.io_updateb =3D aspeed_kcs_updateb,
>+};
>+
> static irqreturn_t aspeed_kcs_irq(int irq, void *arg)
> {
> 	struct kcs_bmc *kcs_bmc =3D arg;
>+	int rc;
>
>-	if (!kcs_bmc_handle_event(kcs_bmc))
>-		return IRQ_HANDLED;
>+	rc =3D kcs_bmc_handle_event(kcs_bmc);
>+	if (rc < 0)
>+		dev_warn(kcs_bmc->dev, "Failed to service irq: %d\n", rc);
>
>-	return IRQ_NONE;
>+	return rc =3D=3D KCS_BMC_EVENT_HANDLED ? IRQ_HANDLED : IRQ_NONE;
> }
>
> static int aspeed_kcs_config_irq(struct kcs_bmc *kcs_bmc,
>@@ -362,9 +370,7 @@ static int aspeed_kcs_probe(struct platform_device *pd=
ev)
> 	kcs_bmc->dev =3D &pdev->dev;
> 	kcs_bmc->channel =3D channel;
> 	kcs_bmc->ioreg =3D ast_kcs_bmc_ioregs[channel - 1];
>-	kcs_bmc->io_inputb =3D aspeed_kcs_inb;
>-	kcs_bmc->io_outputb =3D aspeed_kcs_outb;
>-	kcs_bmc->io_updateb =3D aspeed_kcs_updateb;
>+	kcs_bmc->ops =3D &aspeed_kcs_ops;
>
> 	priv->map =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
> 	if (IS_ERR(priv->map)) {
>diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs=
_bmc_cdev_ipmi.c
>index 0ca71c135a1a..fd852d8abe48 100644
>--- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>@@ -22,7 +22,6 @@
>
> #define KCS_ZERO_DATA     0
>
>-
> /* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
> #define KCS_STATUS_STATE(state) (state << 6)
> #define KCS_STATUS_STATE_MASK   GENMASK(7, 6)
>@@ -179,12 +178,19 @@ static void kcs_bmc_ipmi_handle_cmd(struct kcs_bmc *=
kcs_bmc)
> 	}
> }
>
>-int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc);
>-int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc)
>+static inline struct kcs_bmc *client_to_kcs_bmc(struct kcs_bmc_client *cl=
ient)
> {
>+	return container_of(client, struct kcs_bmc, client);
>+}
>+
>+static int kcs_bmc_ipmi_event(struct kcs_bmc_client *client)
>+{
>+	struct kcs_bmc *kcs_bmc;
> 	unsigned long flags;
>-	int ret =3D -ENODATA;
> 	u8 status;
>+	int ret;
>+
>+	kcs_bmc =3D client_to_kcs_bmc(client);
>
> 	spin_lock_irqsave(&kcs_bmc->lock, flags);
>
>@@ -197,23 +203,28 @@ int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc)
> 		else
> 			kcs_bmc_ipmi_handle_data(kcs_bmc);
>
>-		ret =3D 0;
>+		ret =3D KCS_BMC_EVENT_HANDLED;
>+	} else {
>+		ret =3D KCS_BMC_EVENT_NONE;
> 	}
>
> 	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
>
> 	return ret;
> }
>-EXPORT_SYMBOL(kcs_bmc_ipmi_event);
>
>-static inline struct kcs_bmc *to_kcs_bmc(struct file *filp)
>+static const struct kcs_bmc_client_ops kcs_bmc_ipmi_client_ops =3D {
>+	.event =3D kcs_bmc_ipmi_event,
>+};
>+
>+static inline struct kcs_bmc *file_to_kcs_bmc(struct file *filp)
> {
> 	return container_of(filp->private_data, struct kcs_bmc, miscdev);
> }
>
> static int kcs_bmc_ipmi_open(struct inode *inode, struct file *filp)
> {
>-	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>+	struct kcs_bmc *kcs_bmc =3D file_to_kcs_bmc(filp);
> 	int ret =3D 0;
>
> 	spin_lock_irq(&kcs_bmc->lock);
>@@ -228,7 +239,7 @@ static int kcs_bmc_ipmi_open(struct inode *inode, stru=
ct file *filp)
>
> static __poll_t kcs_bmc_ipmi_poll(struct file *filp, poll_table *wait)
> {
>-	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>+	struct kcs_bmc *kcs_bmc =3D file_to_kcs_bmc(filp);
> 	__poll_t mask =3D 0;
>
> 	poll_wait(filp, &kcs_bmc->queue, wait);
>@@ -244,7 +255,7 @@ static __poll_t kcs_bmc_ipmi_poll(struct file *filp, p=
oll_table *wait)
> static ssize_t kcs_bmc_ipmi_read(struct file *filp, char __user *buf,
> 			    size_t count, loff_t *ppos)
> {
>-	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>+	struct kcs_bmc *kcs_bmc =3D file_to_kcs_bmc(filp);
> 	bool data_avail;
> 	size_t data_len;
> 	ssize_t ret;
>@@ -306,7 +317,7 @@ static ssize_t kcs_bmc_ipmi_read(struct file *filp, ch=
ar __user *buf,
> static ssize_t kcs_bmc_ipmi_write(struct file *filp, const char __user *b=
uf,
> 			     size_t count, loff_t *ppos)
> {
>-	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>+	struct kcs_bmc *kcs_bmc =3D file_to_kcs_bmc(filp);
> 	ssize_t ret;
>
> 	/* a minimum response size '3' : netfn + cmd + ccode */
>@@ -342,7 +353,7 @@ static ssize_t kcs_bmc_ipmi_write(struct file *filp, c=
onst char __user *buf,
> static long kcs_bmc_ipmi_ioctl(struct file *filp, unsigned int cmd,
> 			  unsigned long arg)
> {
>-	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>+	struct kcs_bmc *kcs_bmc =3D file_to_kcs_bmc(filp);
> 	long ret =3D 0;
>
> 	spin_lock_irq(&kcs_bmc->lock);
>@@ -372,7 +383,7 @@ static long kcs_bmc_ipmi_ioctl(struct file *filp, unsi=
gned int cmd,
>
> static int kcs_bmc_ipmi_release(struct inode *inode, struct file *filp)
> {
>-	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>+	struct kcs_bmc *kcs_bmc =3D file_to_kcs_bmc(filp);
>
> 	spin_lock_irq(&kcs_bmc->lock);
> 	kcs_bmc->running =3D 0;
>@@ -401,6 +412,8 @@ int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc)
> 	mutex_init(&kcs_bmc->mutex);
> 	init_waitqueue_head(&kcs_bmc->queue);
>
>+	kcs_bmc->client.dev =3D kcs_bmc;
>+	kcs_bmc->client.ops =3D &kcs_bmc_ipmi_client_ops;
> 	kcs_bmc->data_in =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERN=
EL);
> 	kcs_bmc->data_out =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KER=
NEL);
> 	kcs_bmc->kbuffer =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERN=
EL);
>diff --git a/drivers/char/ipmi/kcs_bmc_client.h b/drivers/char/ipmi/kcs_bm=
c_client.h
>new file mode 100644
>index 000000000000..140631d157d8
>--- /dev/null
>+++ b/drivers/char/ipmi/kcs_bmc_client.h
>@@ -0,0 +1,29 @@
>+/* SPDX-License-Identifier: GPL-2.0 */
>+/* Copyright (c) 2021, IBM Corp. */
>+
>+#ifndef __KCS_BMC_CONSUMER_H__
>+#define __KCS_BMC_CONSUMER_H__
>+
>+#include <linux/list.h>
>+#include <linux/notifier.h>
>+#include <stdbool.h>
>+
>+struct kcs_bmc;
>+struct kcs_bmc_client_ops;
>+
>+struct kcs_bmc_client {
>+	const struct kcs_bmc_client_ops *ops;
>+
>+	struct kcs_bmc *dev;
>+};
>+
>+struct kcs_bmc_client_ops {
>+	int (*event)(struct kcs_bmc_client *client);
>+};
>+
>+u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc);
>+void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data);
>+u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc);
>+void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data);
>+void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val);
>+#endif
>diff --git a/drivers/char/ipmi/kcs_bmc_device.h b/drivers/char/ipmi/kcs_bm=
c_device.h
>new file mode 100644
>index 000000000000..33462174516d
>--- /dev/null
>+++ b/drivers/char/ipmi/kcs_bmc_device.h
>@@ -0,0 +1,19 @@
>+/* SPDX-License-Identifier: GPL-2.0 */
>+/* Copyright (c) 2021, IBM Corp. */
>+
>+#ifndef __KCS_BMC_DEVICE_H__
>+#define __KCS_BMC_DEVICE_H__
>+
>+#include "kcs_bmc.h"
>+
>+struct kcs_bmc_device_ops {
>+	u8 (*io_inputb)(struct kcs_bmc *kcs_bmc, u32 reg);
>+	void (*io_outputb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 b);
>+	void (*io_updateb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 b);
>+};
>+
>+int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
>+int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc);
>+int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc);
>+
>+#endif
>diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_b=
mc_npcm7xx.c
>index 5d017498dc69..1d21697fc585 100644
>--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>@@ -17,7 +17,7 @@
> #include <linux/regmap.h>
> #include <linux/slab.h>
>
>-#include "kcs_bmc.h"
>+#include "kcs_bmc_device.h"
>
> #define DEVICE_NAME	"npcm-kcs-bmc"
> #define KCS_CHANNEL_MAX	3
>@@ -127,11 +127,13 @@ static void npcm7xx_kcs_enable_channel(struct kcs_bm=
c *kcs_bmc, bool enable)
> static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
> {
> 	struct kcs_bmc *kcs_bmc =3D arg;
>+	int rc;
>
>-	if (!kcs_bmc_handle_event(kcs_bmc))
>-		return IRQ_HANDLED;
>+	rc =3D kcs_bmc_handle_event(kcs_bmc);
>+	if (rc < 0)
>+		dev_warn(kcs_bmc->dev, "Failed to service irq: %d\n", rc);
>
>-	return IRQ_NONE;
>+	return rc =3D=3D KCS_BMC_EVENT_HANDLED ? IRQ_HANDLED : IRQ_NONE;
> }
>
> static int npcm7xx_kcs_config_irq(struct kcs_bmc *kcs_bmc,
>@@ -148,6 +150,12 @@ static int npcm7xx_kcs_config_irq(struct kcs_bmc *kcs=
_bmc,
> 				dev_name(dev), kcs_bmc);
> }
>
>+static const struct kcs_bmc_device_ops npcm7xx_kcs_ops =3D {
>+	.io_inputb =3D npcm7xx_kcs_inb,
>+	.io_outputb =3D npcm7xx_kcs_outb,
>+	.io_updateb =3D npcm7xx_kcs_updateb,
>+};
>+
> static int npcm7xx_kcs_probe(struct platform_device *pdev)
> {
> 	struct device *dev =3D &pdev->dev;
>@@ -179,9 +187,7 @@ static int npcm7xx_kcs_probe(struct platform_device *p=
dev)
> 	kcs_bmc->ioreg.idr =3D priv->reg->dib;
> 	kcs_bmc->ioreg.odr =3D priv->reg->dob;
> 	kcs_bmc->ioreg.str =3D priv->reg->sts;
>-	kcs_bmc->io_inputb =3D npcm7xx_kcs_inb;
>-	kcs_bmc->io_outputb =3D npcm7xx_kcs_outb;
>-	kcs_bmc->io_updateb =3D npcm7xx_kcs_updateb;
>+	kcs_bmc->ops =3D &npcm7xx_kcs_ops;
>
> 	platform_set_drvdata(pdev, priv);
>
>--=20
>2.27.0
>=
