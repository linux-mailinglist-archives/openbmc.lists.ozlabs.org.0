Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A0F359395
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 06:09:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGl4x54Knz3bVG
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 14:09:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=YUxXcoHI;
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
 header.s=selector2-equinixinc-onmicrosoft-com header.b=YUxXcoHI; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGl4Z5Tcxz2yjD;
 Fri,  9 Apr 2021 14:09:02 +1000 (AEST)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13943nx5002656; Fri, 9 Apr 2021 04:07:17 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by mx0a-00268f01.pphosted.com with ESMTP id 37t48m27ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 04:07:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4a6Depx3KCjRaUqQnMpEmIl9aNZtVbWwdbodWmFpa63g6EWPJ1EwB8gGsUn6wjtRgWbpnxLYWCRFDmKLBKZXbL7PyLYKIrDbGO+cSejZ9wF1qdaI+sumLUoHZh4/+Dj01yg1Y6LXAr8soRNHHIuyNM/jaqFvumfSX44c86YJe34zmP+0BNydrc/KSPdgAcUtQkk+6UiAeFg/vPmjpc0cXuhqBRqTno0C1pLGGUNWU2AyxCMleg+dN7u8e6Rh1lKKqvr6jMtxNLl+NKDDR+UXEZxGLeVBmLn04rZd4Bb1x9m2bN7pQ0wKiCw+fgSZ/aoDfikamcxHMeAyioGKF+ePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgpPrDKFSvsYtDt6+O/YPx9KKBDcnPwZv2Lin3WBQY0=;
 b=F+LU7OdAJM2u4Qnw40Q3bT8GAB6k9FU0h30rrBVneyWStmjNXeift/RHNCIvK0bWquXfCf8pXuO2li2SjjzZBt/DE8Mlff5vZ8SWclrkltqCDole31Q4UPoT+Fh50pPUn258kJAcDJB5LlrJ5SiZZts0UQ3aSgSDguvyTd//ZRALIzOys1sA5I4yWbFh/pLD6Q3DLq1N6p1ZPJ1Wu2dEwq98eDSaghHGt0hhR5rkumRJClcX18wtW2DA/PZDmyTqo0JsmbTDHd2uGVA5AGTUHDfwyw6+3wWJcVqMngwNvC5UPFwrSA+1b150/hn3PxY5zAu+z651pz2ZJe+ACxkUQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgpPrDKFSvsYtDt6+O/YPx9KKBDcnPwZv2Lin3WBQY0=;
 b=YUxXcoHIbKrcdww8qdlN/pWa+rb384JWfOfyGpf0I+kBq6aIjGLRtmOtieqCERpQgHa6whd55deZkseCA+7rcxSJ6PHdvQn0T5sNKY9zfC2pdJoSg8dAk1m+Kt5/4kFqwJWtSh/l0RfpCVmtDfAIZF2wWpgOXqNdMc+JKa7LK64=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB5420.namprd04.prod.outlook.com (2603:10b6:5:105::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.29; Fri, 9 Apr 2021 04:07:14 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 04:07:14 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 12/21] ipmi: kcs_bmc: Strip private client data from
 struct kcs_bmc
Thread-Topic: [PATCH v2 12/21] ipmi: kcs_bmc: Strip private client data from
 struct kcs_bmc
Thread-Index: AQHXLPXSRMEgoYzEtEO2Fwa7SoYdsA==
Date: Fri, 9 Apr 2021 04:07:14 +0000
Message-ID: <YG/S8UdjT8TH6cqs@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-12-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-12-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88bc8c79-05a1-4791-8a6d-08d8fb0cf565
x-ms-traffictypediagnostic: DM6PR04MB5420:
x-microsoft-antispam-prvs: <DM6PR04MB5420B8CB2E3E1C278745FA66C3739@DM6PR04MB5420.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bm99C6FZeS0adiLxQMFNe94uNkX8EZcst8XstIX/+a9lRoC3kdDfyqmai2wHTt6+z90f8iQmwOO3ZmmK7VLkKl/JVgcpIb5Riaes/dTs2TCw6I7Cbi3golB4vFVvv5fnzygWYvjT7hnNqpJIHO2P8CjR8IqQ/YibQFyHn/SwQ4xk5lPf/Gp0YcD7NfiwX8l619LObznk1MK18w0b+epegmEJCUCm/B6NVxoZCju5MraJETUHrMWLeJjhQGME3gfIeQ+fw4gy34vDbzoLehpo9Oe0XX83RIp3jdGv3FqFIGS+oK5yCYMsevGEGIxBIN2R6f8JXM6KuHtzaaCuHeNarimIGsQC0wlwQP0One/0vqLZCmQ3b/wts8EnIAe290fxlk8cRR/XN4C8MalxsjGoyyjPLXQOa3yDjZgwK3RhlS1IjQpPYbqVRBh462Rf06JEPBRO7eUhNB+8qmgtbp5jqAghF27fP4CjNbT2Wecm87/eWlCWdAkbmH0c7NS3899eaJA6wqseEQr6enZM2f4eVgRjOwlPhKM/murbIshxh2bWNX0dbNXpl4YHF8VZaXrkgNPp+vhbpdx5Oi3WGs7jEcn1oiE+DfbTCf9RkXX2D7g1ufd7vKx8Ghl28X7A3rF1hXGRaVA44YvvoM44WFnrjz6n7El8XOOUNaTwvH7ptPo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(346002)(376002)(366004)(136003)(39860400002)(396003)(38100700001)(6512007)(9686003)(66446008)(66556008)(64756008)(66476007)(76116006)(478600001)(316002)(54906003)(86362001)(66946007)(6506007)(71200400001)(5660300002)(6486002)(8936002)(8676002)(83380400001)(30864003)(4326008)(6916009)(7416002)(33716001)(186003)(26005)(2906002)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+zuGSw31bj9VdXT1fCAHmtdcYMsogAP/y6WhVi3NVU/ROAwCtl8Qx4EsZjb+?=
 =?us-ascii?Q?HZGqujoUwpgjCF7Jh6Oa9zGh7K8H8Hz3jaRmyh/kLltw4/uyVL/isgJSy/RB?=
 =?us-ascii?Q?5JD2886HQUxR6NfORqjbJNK1L9E7ZresgHEkDPyAZHD59NutVz+khgfF2WF3?=
 =?us-ascii?Q?4o+ypiFvagp5+0Re2AS2BeiO1TU9Kpbox/UeTSCRJPX46vYdyn13pFnsW/hv?=
 =?us-ascii?Q?anoF+uxJkzG/d3DXU81Ea9iRbuQzsAIoidktfHRuu6qYHdDro3KkFHcBPMV+?=
 =?us-ascii?Q?20HT3GYmdpXdymqXos6KevR3rdo7SVfTvF4U75VQbCs0fZsNnmGYzfDlavMh?=
 =?us-ascii?Q?zRydcKy3O5xZP5UEPZYtJMFGD/V2F9k7hSiO1DL7b/abypjj/RzyISgYb3uD?=
 =?us-ascii?Q?dHizhMjWLBgoWii/1JRW/VXdmFbBGLfj1Ke8KwYYJhc0auZJNEf1H7aFtXtl?=
 =?us-ascii?Q?AvvmSZN6baAOjO+bce3VCTqUbB6RFqSAAZkFml8FLmS6gLIvmAs1naEmsfBh?=
 =?us-ascii?Q?WRCZVvFbSZfdWOy0yLYfzVu6B1jus4jwqi77pV85oapGyRBcFeEMrvDynoLp?=
 =?us-ascii?Q?bYV7fsR+d0oPbPeorvYLfzphJgwuJ0RLdfj7FiL922z0A2uyH+ngM1VCAhJV?=
 =?us-ascii?Q?HKttgygefqAyaEzPMa5Mp3Yyd/1RG2yiXRWqLKqBVsq5zREc8vTAw8f7lo1R?=
 =?us-ascii?Q?STCIqFmV75Zi4ftmVjHtCeMg4Ksu2wKQwpfmb9kIT3mMjWmZFjpP1RAPkx+E?=
 =?us-ascii?Q?wJBUJ3AtrXM6TI9PYAler+TGnqh/eZUp/Kqn365Za+3Y62hlJhc/5L4A5uJ5?=
 =?us-ascii?Q?IAPoZ2vH1QMDajcwdD27/HM1AieZP5MX/gfNhs+lSBnpIbdyiVDy5OgVatV8?=
 =?us-ascii?Q?BMxiovOh1dZwtegFpgCSTLcwGZfEvEO4b+kCi0rFupJ7iEivd3q9sCgnnVrv?=
 =?us-ascii?Q?2CYzy8h6XdFdQZgEnmxAHgxvyK92fBsYOiy9ML2fgC72ZzIaA0axIX1byMme?=
 =?us-ascii?Q?n1SnG+g4zkWG5YfVcpaFtQ8rGhyrUE7oSZN23n9qmSBU4DduokvOrBT+1lno?=
 =?us-ascii?Q?BeL//lZI+N3aZg6JDKcbdrs1I5ww83Mi9SZaLU+PEFu4Ylhh4yAR2FFWp0Ys?=
 =?us-ascii?Q?lvN9WOaQ1gJxHPrqG2qrnjX2l9U0wafloBwxN2aA2T43qhTbYn+Oi7qlZ3rU?=
 =?us-ascii?Q?8dMXRLcgDNr3GxnJK/fSKyuhos0EXkyjCpYptrEC4BFXwlantTJWz9vgKBAZ?=
 =?us-ascii?Q?np1czi+pMWZCcdhlLlpwUN6h0yMip2SYzPA8YNUXy8DWr9+c2bHaYv/x2ODb?=
 =?us-ascii?Q?Ywe4c4TkN3v3n/gKX0wrhut6vtzQhbYT9iFIJ6vOQa7NzQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B0812A8FF6AC3548B5214A4F13166CE7@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88bc8c79-05a1-4791-8a6d-08d8fb0cf565
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 04:07:14.6677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tR7PjM6razki9iiWPshgESZaErjSuBTJzzFtEkdDqjXsnWqIxLgJ+7sdjWQ/k8vg3EyzAnhEp39ob/+yZUqYZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5420
X-Proofpoint-ORIG-GUID: 7eQ0gON5k1frCHs0CQW-_4i_OmmreBSx
X-Proofpoint-GUID: 7eQ0gON5k1frCHs0CQW-_4i_OmmreBSx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_03:2021-04-08,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 mlxscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090027
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

On Fri, Mar 19, 2021 at 01:27:43AM CDT, Andrew Jeffery wrote:
>Move all client-private data out of `struct kcs_bmc` into the KCS client
>implementation.
>
>With this change the KCS BMC core code now only concerns itself with
>abstract `struct kcs_bmc` and `struct kcs_bmc_client` types, achieving
>expected separation of concerns. Further, the change clears the path for
>implementation of alternative userspace interfaces.
>
>The chardev data-structures are rearranged in the same manner applied to
>the KCS device driver data-structures in an earlier patch - `struct
>kcs_bmc_client` is embedded in the client's private data and we exploit
>container_of() to translate as required.
>
>Finally, now that it is free of client data, `struct kcs_bmc` is renamed
>to `struct kcs_bmc_device` to contrast `struct kcs_bmc_client`.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/kcs_bmc.c           |  68 +++-
> drivers/char/ipmi/kcs_bmc.h           |  86 +-----
> drivers/char/ipmi/kcs_bmc_aspeed.c    |  22 +-
> drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 428 ++++++++++++++++----------
> drivers/char/ipmi/kcs_bmc_client.h    |  28 +-
> drivers/char/ipmi/kcs_bmc_device.h    |  12 +-
> drivers/char/ipmi/kcs_bmc_npcm7xx.c   |  20 +-
> 7 files changed, 368 insertions(+), 296 deletions(-)
>
>diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
>index 1046ce2bbefc..266ebec71d6f 100644
>--- a/drivers/char/ipmi/kcs_bmc.c
>+++ b/drivers/char/ipmi/kcs_bmc.c
>@@ -4,6 +4,7 @@
>  * Copyright (c) 2021, IBM Corp.
>  */
>
>+#include <linux/device.h>
> #include <linux/module.h>
>
> #include "kcs_bmc.h"
>@@ -14,51 +15,96 @@
>
> /* Consumer data access */
>
>-u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
>+u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc)
> {
> 	return kcs_bmc->ops->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
> }
> EXPORT_SYMBOL(kcs_bmc_read_data);
>
>-void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
>+void kcs_bmc_write_data(struct kcs_bmc_device *kcs_bmc, u8 data)
> {
> 	kcs_bmc->ops->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
> }
> EXPORT_SYMBOL(kcs_bmc_write_data);
>
>-u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
>+u8 kcs_bmc_read_status(struct kcs_bmc_device *kcs_bmc)
> {
> 	return kcs_bmc->ops->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
> }
> EXPORT_SYMBOL(kcs_bmc_read_status);
>
>-void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
>+void kcs_bmc_write_status(struct kcs_bmc_device *kcs_bmc, u8 data)
> {
> 	kcs_bmc->ops->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
> }
> EXPORT_SYMBOL(kcs_bmc_write_status);
>
>-void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
>+void kcs_bmc_update_status(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 va=
l)
> {
> 	kcs_bmc->ops->io_updateb(kcs_bmc, kcs_bmc->ioreg.str, mask, val);
> }
> EXPORT_SYMBOL(kcs_bmc_update_status);
>
>-int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
>+int kcs_bmc_handle_event(struct kcs_bmc_device *kcs_bmc)
> {
>-	return kcs_bmc->client.ops->event(&kcs_bmc->client);
>+	struct kcs_bmc_client *client;
>+	int rc;
>+
>+	spin_lock(&kcs_bmc->lock);
>+	client =3D kcs_bmc->client;
>+	if (client) {
>+		rc =3D client->ops->event(client);
>+	} else {
>+		u8 status;
>+
>+		status =3D kcs_bmc_read_status(kcs_bmc);
>+		if (status & KCS_BMC_STR_IBF) {
>+			/* Ack the event by reading the data */
>+			kcs_bmc_read_data(kcs_bmc);
>+			rc =3D KCS_BMC_EVENT_HANDLED;
>+		} else {
>+			rc =3D KCS_BMC_EVENT_NONE;
>+		}
>+	}
>+	spin_unlock(&kcs_bmc->lock);
>+
>+	return rc;
> }
> EXPORT_SYMBOL(kcs_bmc_handle_event);
>
>-int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc);
>-int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc)
>+int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_=
client *client)
>+{
>+	int rc;
>+
>+	spin_lock_irq(&kcs_bmc->lock);
>+	if (kcs_bmc->client) {
>+		rc =3D -EBUSY;
>+	} else {
>+		kcs_bmc->client =3D client;
>+		rc =3D 0;
>+	}
>+	spin_unlock_irq(&kcs_bmc->lock);
>+
>+	return rc;
>+}
>+EXPORT_SYMBOL(kcs_bmc_enable_device);
>+
>+void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bm=
c_client *client)
>+{
>+	spin_lock_irq(&kcs_bmc->lock);
>+	if (client =3D=3D kcs_bmc->client)
>+		kcs_bmc->client =3D NULL;

Is there any situation in which a non-matching client could be passed in
here?  Might we consider issuing a warning of some sort or returning an
error to the caller if so?

>+	spin_unlock_irq(&kcs_bmc->lock);
>+}
>+EXPORT_SYMBOL(kcs_bmc_disable_device);
>+
>+int kcs_bmc_add_device(struct kcs_bmc_device *kcs_bmc)
> {
> 	return kcs_bmc_ipmi_attach_cdev(kcs_bmc);
> }
> EXPORT_SYMBOL(kcs_bmc_add_device);
>
>-int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc);
>-int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc)
>+int kcs_bmc_remove_device(struct kcs_bmc_device *kcs_bmc)
> {
> 	return kcs_bmc_ipmi_detach_cdev(kcs_bmc);
> }
>diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
>index a1350e567723..3f266740c759 100644
>--- a/drivers/char/ipmi/kcs_bmc.h
>+++ b/drivers/char/ipmi/kcs_bmc.h
>@@ -6,9 +6,7 @@
> #ifndef __KCS_BMC_H__
> #define __KCS_BMC_H__
>
>-#include <linux/miscdevice.h>
>-
>-#include "kcs_bmc_client.h"
>+#include <linux/list.h>
>
> #define KCS_BMC_EVENT_NONE	0
> #define KCS_BMC_EVENT_HANDLED	1
>@@ -17,53 +15,6 @@
> #define KCS_BMC_STR_IBF		BIT(1)
> #define KCS_BMC_STR_CMD_DAT	BIT(3)
>
>-/* Different phases of the KCS BMC module.
>- *  KCS_PHASE_IDLE:
>- *            BMC should not be expecting nor sending any data.
>- *  KCS_PHASE_WRITE_START:
>- *            BMC is receiving a WRITE_START command from system software=
.
>- *  KCS_PHASE_WRITE_DATA:
>- *            BMC is receiving a data byte from system software.
>- *  KCS_PHASE_WRITE_END_CMD:
>- *            BMC is waiting a last data byte from system software.
>- *  KCS_PHASE_WRITE_DONE:
>- *            BMC has received the whole request from system software.
>- *  KCS_PHASE_WAIT_READ:
>- *            BMC is waiting the response from the upper IPMI service.
>- *  KCS_PHASE_READ:
>- *            BMC is transferring the response to system software.
>- *  KCS_PHASE_ABORT_ERROR1:
>- *            BMC is waiting error status request from system software.
>- *  KCS_PHASE_ABORT_ERROR2:
>- *            BMC is waiting for idle status afer error from system softw=
are.
>- *  KCS_PHASE_ERROR:
>- *            BMC has detected a protocol violation at the interface leve=
l.
>- */
>-enum kcs_phases {
>-	KCS_PHASE_IDLE,
>-
>-	KCS_PHASE_WRITE_START,
>-	KCS_PHASE_WRITE_DATA,
>-	KCS_PHASE_WRITE_END_CMD,
>-	KCS_PHASE_WRITE_DONE,
>-
>-	KCS_PHASE_WAIT_READ,
>-	KCS_PHASE_READ,
>-
>-	KCS_PHASE_ABORT_ERROR1,
>-	KCS_PHASE_ABORT_ERROR2,
>-	KCS_PHASE_ERROR
>-};
>-
>-/* IPMI 2.0 - Table 9-4, KCS Interface Status Codes */
>-enum kcs_errors {
>-	KCS_NO_ERROR                =3D 0x00,
>-	KCS_ABORTED_BY_COMMAND      =3D 0x01,
>-	KCS_ILLEGAL_CONTROL_CODE    =3D 0x02,
>-	KCS_LENGTH_ERROR            =3D 0x06,
>-	KCS_UNSPECIFIED_ERROR       =3D 0xFF
>-};
>-
> /* IPMI 2.0 - 9.5, KCS Interface Registers
>  * @idr: Input Data Register
>  * @odr: Output Data Register
>@@ -76,36 +27,23 @@ struct kcs_ioreg {
> };
>
> struct kcs_bmc_device_ops;
>+struct kcs_bmc_client;
>+
>+struct kcs_bmc_device {
>+	struct list_head entry;
>
>-struct kcs_bmc {
> 	struct device *dev;
>-
>-	const struct kcs_bmc_device_ops *ops;
>-
>-	struct kcs_bmc_client client;
>-
>-	spinlock_t lock;
>-
> 	u32 channel;
>-	int running;
>
> 	struct kcs_ioreg ioreg;
>
>-	enum kcs_phases phase;
>-	enum kcs_errors error;
>+	const struct kcs_bmc_device_ops *ops;
>
>-	wait_queue_head_t queue;
>-	bool data_in_avail;
>-	int  data_in_idx;
>-	u8  *data_in;
>-
>-	int  data_out_idx;
>-	int  data_out_len;
>-	u8  *data_out;
>-
>-	struct mutex mutex;
>-	u8 *kbuffer;
>-
>-	struct miscdevice miscdev;
>+	spinlock_t lock;
>+	struct kcs_bmc_client *client;
> };
>+
>+/* Temporary exports while refactoring */
>+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc);
>+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc);
> #endif /* __KCS_BMC_H__ */
>diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bm=
c_aspeed.c
>index 1b313355b1c8..6f26e7366c0b 100644
>--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
>+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
>@@ -61,7 +61,7 @@
> #define LPC_STR4             0x11C
>
> struct aspeed_kcs_bmc {
>-	struct kcs_bmc kcs_bmc;
>+	struct kcs_bmc_device kcs_bmc;
>
> 	struct regmap *map;
> };
>@@ -71,12 +71,12 @@ struct aspeed_kcs_of_ops {
> 	int (*get_io_address)(struct platform_device *pdev);
> };
>
>-static inline struct aspeed_kcs_bmc *to_aspeed_kcs_bmc(struct kcs_bmc *kc=
s_bmc)
>+static inline struct aspeed_kcs_bmc *to_aspeed_kcs_bmc(struct kcs_bmc_dev=
ice *kcs_bmc)
> {
> 	return container_of(kcs_bmc, struct aspeed_kcs_bmc, kcs_bmc);
> }
>
>-static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
>+static u8 aspeed_kcs_inb(struct kcs_bmc_device *kcs_bmc, u32 reg)
> {
> 	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
> 	u32 val =3D 0;
>@@ -88,7 +88,7 @@ static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 re=
g)
> 	return rc =3D=3D 0 ? (u8) val : 0;
> }
>
>-static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
>+static void aspeed_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 d=
ata)
> {
> 	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
> 	int rc;
>@@ -97,7 +97,7 @@ static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32=
 reg, u8 data)
> 	WARN(rc !=3D 0, "regmap_write() failed: %d\n", rc);
> }
>
>-static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask,=
 u8 val)
>+static void aspeed_kcs_updateb(struct kcs_bmc_device *kcs_bmc, u32 reg, u=
8 mask, u8 val)
> {
> 	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
> 	int rc;
>@@ -119,7 +119,7 @@ static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc=
, u32 reg, u8 mask, u8 val
>  *     C. KCS4
>  *        D / C : CA4h / CA5h
>  */
>-static void aspeed_kcs_set_address(struct kcs_bmc *kcs_bmc, u16 addr)
>+static void aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u16 ad=
dr)
> {
> 	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>
>@@ -153,7 +153,7 @@ static void aspeed_kcs_set_address(struct kcs_bmc *kcs=
_bmc, u16 addr)
> 	}
> }
>
>-static void aspeed_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enabl=
e)
>+static void aspeed_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, boo=
l enable)
> {
> 	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>
>@@ -228,7 +228,7 @@ static const struct kcs_bmc_device_ops aspeed_kcs_ops =
=3D {
>
> static irqreturn_t aspeed_kcs_irq(int irq, void *arg)
> {
>-	struct kcs_bmc *kcs_bmc =3D arg;
>+	struct kcs_bmc_device *kcs_bmc =3D arg;
> 	int rc;
>
> 	rc =3D kcs_bmc_handle_event(kcs_bmc);
>@@ -238,7 +238,7 @@ static irqreturn_t aspeed_kcs_irq(int irq, void *arg)
> 	return rc =3D=3D KCS_BMC_EVENT_HANDLED ? IRQ_HANDLED : IRQ_NONE;
> }
>
>-static int aspeed_kcs_config_irq(struct kcs_bmc *kcs_bmc,
>+static int aspeed_kcs_config_irq(struct kcs_bmc_device *kcs_bmc,
> 			struct platform_device *pdev)
> {
> 	struct device *dev =3D &pdev->dev;
>@@ -338,8 +338,8 @@ static int aspeed_kcs_of_v2_get_io_address(struct plat=
form_device *pdev)
> static int aspeed_kcs_probe(struct platform_device *pdev)
> {
> 	const struct aspeed_kcs_of_ops *ops;
>+	struct kcs_bmc_device *kcs_bmc;
> 	struct aspeed_kcs_bmc *priv;
>-	struct kcs_bmc *kcs_bmc;
> 	struct device_node *np;
> 	int rc, channel, addr;
>
>@@ -400,7 +400,7 @@ static int aspeed_kcs_probe(struct platform_device *pd=
ev)
> static int aspeed_kcs_remove(struct platform_device *pdev)
> {
> 	struct aspeed_kcs_bmc *priv =3D platform_get_drvdata(pdev);
>-	struct kcs_bmc *kcs_bmc =3D &priv->kcs_bmc;
>+	struct kcs_bmc_device *kcs_bmc =3D &priv->kcs_bmc;
>
> 	kcs_bmc_remove_device(kcs_bmc);
>
>diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs=
_bmc_cdev_ipmi.c
>index fd852d8abe48..58c42e76483d 100644
>--- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>@@ -8,13 +8,88 @@
> #include <linux/errno.h>
> #include <linux/io.h>
> #include <linux/ipmi_bmc.h>
>+#include <linux/list.h>
>+#include <linux/miscdevice.h>
> #include <linux/module.h>
>+#include <linux/mutex.h>
> #include <linux/platform_device.h>
> #include <linux/poll.h>
> #include <linux/sched.h>
> #include <linux/slab.h>
>
>-#include "kcs_bmc.h"
>+#include "kcs_bmc_client.h"
>+
>+/* Different phases of the KCS BMC module.
>+ *  KCS_PHASE_IDLE:
>+ *            BMC should not be expecting nor sending any data.
>+ *  KCS_PHASE_WRITE_START:
>+ *            BMC is receiving a WRITE_START command from system software=
.
>+ *  KCS_PHASE_WRITE_DATA:
>+ *            BMC is receiving a data byte from system software.
>+ *  KCS_PHASE_WRITE_END_CMD:
>+ *            BMC is waiting a last data byte from system software.
>+ *  KCS_PHASE_WRITE_DONE:
>+ *            BMC has received the whole request from system software.
>+ *  KCS_PHASE_WAIT_READ:
>+ *            BMC is waiting the response from the upper IPMI service.
>+ *  KCS_PHASE_READ:
>+ *            BMC is transferring the response to system software.
>+ *  KCS_PHASE_ABORT_ERROR1:
>+ *            BMC is waiting error status request from system software.
>+ *  KCS_PHASE_ABORT_ERROR2:
>+ *            BMC is waiting for idle status afer error from system softw=
are.
>+ *  KCS_PHASE_ERROR:
>+ *            BMC has detected a protocol violation at the interface leve=
l.
>+ */
>+enum kcs_ipmi_phases {
>+	KCS_PHASE_IDLE,
>+
>+	KCS_PHASE_WRITE_START,
>+	KCS_PHASE_WRITE_DATA,
>+	KCS_PHASE_WRITE_END_CMD,
>+	KCS_PHASE_WRITE_DONE,
>+
>+	KCS_PHASE_WAIT_READ,
>+	KCS_PHASE_READ,
>+
>+	KCS_PHASE_ABORT_ERROR1,
>+	KCS_PHASE_ABORT_ERROR2,
>+	KCS_PHASE_ERROR
>+};
>+
>+/* IPMI 2.0 - Table 9-4, KCS Interface Status Codes */
>+enum kcs_ipmi_errors {
>+	KCS_NO_ERROR                =3D 0x00,
>+	KCS_ABORTED_BY_COMMAND      =3D 0x01,
>+	KCS_ILLEGAL_CONTROL_CODE    =3D 0x02,
>+	KCS_LENGTH_ERROR            =3D 0x06,
>+	KCS_UNSPECIFIED_ERROR       =3D 0xFF
>+};
>+
>+struct kcs_bmc_ipmi {
>+	struct list_head entry;
>+
>+	struct kcs_bmc_client client;
>+
>+	spinlock_t lock;
>+
>+	enum kcs_ipmi_phases phase;
>+	enum kcs_ipmi_errors error;
>+
>+	wait_queue_head_t queue;
>+	bool data_in_avail;
>+	int  data_in_idx;
>+	u8  *data_in;
>+
>+	int  data_out_idx;
>+	int  data_out_len;
>+	u8  *data_out;
>+
>+	struct mutex mutex;
>+	u8 *kbuffer;
>+
>+	struct miscdevice miscdev;
>+};
>
> #define DEVICE_NAME "ipmi-kcs"
>
>@@ -44,171 +119,169 @@ enum kcs_states {
> #define KCS_CMD_WRITE_END         0x62
> #define KCS_CMD_READ_BYTE         0x68
>
>-static inline void set_state(struct kcs_bmc *kcs_bmc, u8 state)
>+static inline void set_state(struct kcs_bmc_ipmi *priv, u8 state)
> {
>-	kcs_bmc_update_status(kcs_bmc, KCS_STATUS_STATE_MASK,
>-					KCS_STATUS_STATE(state));
>+	kcs_bmc_update_status(priv->client.dev, KCS_STATUS_STATE_MASK, KCS_STATU=
S_STATE(state));
> }
>
>-static void kcs_bmc_ipmi_force_abort(struct kcs_bmc *kcs_bmc)
>+static void kcs_bmc_ipmi_force_abort(struct kcs_bmc_ipmi *priv)
> {
>-	set_state(kcs_bmc, ERROR_STATE);
>-	kcs_bmc_read_data(kcs_bmc);
>-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>+	set_state(priv, ERROR_STATE);
>+	kcs_bmc_read_data(priv->client.dev);
>+	kcs_bmc_write_data(priv->client.dev, KCS_ZERO_DATA);
>
>-	kcs_bmc->phase =3D KCS_PHASE_ERROR;
>-	kcs_bmc->data_in_avail =3D false;
>-	kcs_bmc->data_in_idx =3D 0;
>+	priv->phase =3D KCS_PHASE_ERROR;
>+	priv->data_in_avail =3D false;
>+	priv->data_in_idx =3D 0;
> }
>
>-static void kcs_bmc_ipmi_handle_data(struct kcs_bmc *kcs_bmc)
>+static void kcs_bmc_ipmi_handle_data(struct kcs_bmc_ipmi *priv)
> {
>+	struct kcs_bmc_device *dev;
> 	u8 data;
>
>-	switch (kcs_bmc->phase) {
>+	dev =3D priv->client.dev;
>+
>+	switch (priv->phase) {
> 	case KCS_PHASE_WRITE_START:
>-		kcs_bmc->phase =3D KCS_PHASE_WRITE_DATA;
>+		priv->phase =3D KCS_PHASE_WRITE_DATA;
> 		fallthrough;
>
> 	case KCS_PHASE_WRITE_DATA:
>-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
>-			set_state(kcs_bmc, WRITE_STATE);
>-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =3D
>-						kcs_bmc_read_data(kcs_bmc);
>+		if (priv->data_in_idx < KCS_MSG_BUFSIZ) {
>+			set_state(priv, WRITE_STATE);
>+			kcs_bmc_write_data(dev, KCS_ZERO_DATA);
>+			priv->data_in[priv->data_in_idx++] =3D kcs_bmc_read_data(dev);
> 		} else {
>-			kcs_bmc_ipmi_force_abort(kcs_bmc);
>-			kcs_bmc->error =3D KCS_LENGTH_ERROR;
>+			kcs_bmc_ipmi_force_abort(priv);
>+			priv->error =3D KCS_LENGTH_ERROR;
> 		}
> 		break;
>
> 	case KCS_PHASE_WRITE_END_CMD:
>-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
>-			set_state(kcs_bmc, READ_STATE);
>-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =3D
>-						kcs_bmc_read_data(kcs_bmc);
>-			kcs_bmc->phase =3D KCS_PHASE_WRITE_DONE;
>-			kcs_bmc->data_in_avail =3D true;
>-			wake_up_interruptible(&kcs_bmc->queue);
>+		if (priv->data_in_idx < KCS_MSG_BUFSIZ) {
>+			set_state(priv, READ_STATE);
>+			priv->data_in[priv->data_in_idx++] =3D kcs_bmc_read_data(dev);
>+			priv->phase =3D KCS_PHASE_WRITE_DONE;
>+			priv->data_in_avail =3D true;
>+			wake_up_interruptible(&priv->queue);
> 		} else {
>-			kcs_bmc_ipmi_force_abort(kcs_bmc);
>-			kcs_bmc->error =3D KCS_LENGTH_ERROR;
>+			kcs_bmc_ipmi_force_abort(priv);
>+			priv->error =3D KCS_LENGTH_ERROR;
> 		}
> 		break;
>
> 	case KCS_PHASE_READ:
>-		if (kcs_bmc->data_out_idx =3D=3D kcs_bmc->data_out_len)
>-			set_state(kcs_bmc, IDLE_STATE);
>+		if (priv->data_out_idx =3D=3D priv->data_out_len)
>+			set_state(priv, IDLE_STATE);
>
>-		data =3D kcs_bmc_read_data(kcs_bmc);
>+		data =3D kcs_bmc_read_data(dev);
> 		if (data !=3D KCS_CMD_READ_BYTE) {
>-			set_state(kcs_bmc, ERROR_STATE);
>-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>+			set_state(priv, ERROR_STATE);
>+			kcs_bmc_write_data(dev, KCS_ZERO_DATA);
> 			break;
> 		}
>
>-		if (kcs_bmc->data_out_idx =3D=3D kcs_bmc->data_out_len) {
>-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>-			kcs_bmc->phase =3D KCS_PHASE_IDLE;
>+		if (priv->data_out_idx =3D=3D priv->data_out_len) {
>+			kcs_bmc_write_data(dev, KCS_ZERO_DATA);
>+			priv->phase =3D KCS_PHASE_IDLE;
> 			break;
> 		}
>
>-		kcs_bmc_write_data(kcs_bmc,
>-			kcs_bmc->data_out[kcs_bmc->data_out_idx++]);
>+		kcs_bmc_write_data(dev, priv->data_out[priv->data_out_idx++]);
> 		break;
>
> 	case KCS_PHASE_ABORT_ERROR1:
>-		set_state(kcs_bmc, READ_STATE);
>-		kcs_bmc_read_data(kcs_bmc);
>-		kcs_bmc_write_data(kcs_bmc, kcs_bmc->error);
>-		kcs_bmc->phase =3D KCS_PHASE_ABORT_ERROR2;
>+		set_state(priv, READ_STATE);
>+		kcs_bmc_read_data(dev);
>+		kcs_bmc_write_data(dev, priv->error);
>+		priv->phase =3D KCS_PHASE_ABORT_ERROR2;
> 		break;
>
> 	case KCS_PHASE_ABORT_ERROR2:
>-		set_state(kcs_bmc, IDLE_STATE);
>-		kcs_bmc_read_data(kcs_bmc);
>-		kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>-		kcs_bmc->phase =3D KCS_PHASE_IDLE;
>+		set_state(priv, IDLE_STATE);
>+		kcs_bmc_read_data(dev);
>+		kcs_bmc_write_data(dev, KCS_ZERO_DATA);
>+		priv->phase =3D KCS_PHASE_IDLE;
> 		break;
>
> 	default:
>-		kcs_bmc_ipmi_force_abort(kcs_bmc);
>+		kcs_bmc_ipmi_force_abort(priv);
> 		break;
> 	}
> }
>
>-static void kcs_bmc_ipmi_handle_cmd(struct kcs_bmc *kcs_bmc)
>+static void kcs_bmc_ipmi_handle_cmd(struct kcs_bmc_ipmi *priv)
> {
> 	u8 cmd;
>
>-	set_state(kcs_bmc, WRITE_STATE);
>-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>+	set_state(priv, WRITE_STATE);
>+	kcs_bmc_write_data(priv->client.dev, KCS_ZERO_DATA);
>
>-	cmd =3D kcs_bmc_read_data(kcs_bmc);
>+	cmd =3D kcs_bmc_read_data(priv->client.dev);
> 	switch (cmd) {
> 	case KCS_CMD_WRITE_START:
>-		kcs_bmc->phase =3D KCS_PHASE_WRITE_START;
>-		kcs_bmc->error =3D KCS_NO_ERROR;
>-		kcs_bmc->data_in_avail =3D false;
>-		kcs_bmc->data_in_idx =3D 0;
>+		priv->phase =3D KCS_PHASE_WRITE_START;
>+		priv->error =3D KCS_NO_ERROR;
>+		priv->data_in_avail =3D false;
>+		priv->data_in_idx =3D 0;
> 		break;
>
> 	case KCS_CMD_WRITE_END:
>-		if (kcs_bmc->phase !=3D KCS_PHASE_WRITE_DATA) {
>-			kcs_bmc_ipmi_force_abort(kcs_bmc);
>+		if (priv->phase !=3D KCS_PHASE_WRITE_DATA) {
>+			kcs_bmc_ipmi_force_abort(priv);
> 			break;
> 		}
>
>-		kcs_bmc->phase =3D KCS_PHASE_WRITE_END_CMD;
>+		priv->phase =3D KCS_PHASE_WRITE_END_CMD;
> 		break;
>
> 	case KCS_CMD_GET_STATUS_ABORT:
>-		if (kcs_bmc->error =3D=3D KCS_NO_ERROR)
>-			kcs_bmc->error =3D KCS_ABORTED_BY_COMMAND;
>+		if (priv->error =3D=3D KCS_NO_ERROR)
>+			priv->error =3D KCS_ABORTED_BY_COMMAND;
>
>-		kcs_bmc->phase =3D KCS_PHASE_ABORT_ERROR1;
>-		kcs_bmc->data_in_avail =3D false;
>-		kcs_bmc->data_in_idx =3D 0;
>+		priv->phase =3D KCS_PHASE_ABORT_ERROR1;
>+		priv->data_in_avail =3D false;
>+		priv->data_in_idx =3D 0;
> 		break;
>
> 	default:
>-		kcs_bmc_ipmi_force_abort(kcs_bmc);
>-		kcs_bmc->error =3D KCS_ILLEGAL_CONTROL_CODE;
>+		kcs_bmc_ipmi_force_abort(priv);
>+		priv->error =3D KCS_ILLEGAL_CONTROL_CODE;
> 		break;
> 	}
> }
>
>-static inline struct kcs_bmc *client_to_kcs_bmc(struct kcs_bmc_client *cl=
ient)
>+static inline struct kcs_bmc_ipmi *client_to_kcs_bmc_ipmi(struct kcs_bmc_=
client *client)
> {
>-	return container_of(client, struct kcs_bmc, client);
>+	return container_of(client, struct kcs_bmc_ipmi, client);
> }
>
> static int kcs_bmc_ipmi_event(struct kcs_bmc_client *client)
> {
>-	struct kcs_bmc *kcs_bmc;
>-	unsigned long flags;
>+	struct kcs_bmc_ipmi *priv;
> 	u8 status;
> 	int ret;
>
>-	kcs_bmc =3D client_to_kcs_bmc(client);
>+	priv =3D client_to_kcs_bmc_ipmi(client);
>+	if (!priv)
>+		return KCS_BMC_EVENT_NONE;
>
>-	spin_lock_irqsave(&kcs_bmc->lock, flags);
>+	spin_lock(&priv->lock);
>
>-	status =3D kcs_bmc_read_status(kcs_bmc);
>+	status =3D kcs_bmc_read_status(client->dev);
> 	if (status & KCS_STATUS_IBF) {
>-		if (!kcs_bmc->running)
>-			kcs_bmc_ipmi_force_abort(kcs_bmc);
>-		else if (status & KCS_STATUS_CMD_DAT)
>-			kcs_bmc_ipmi_handle_cmd(kcs_bmc);
>+		if (status & KCS_STATUS_CMD_DAT)
>+			kcs_bmc_ipmi_handle_cmd(priv);
> 		else
>-			kcs_bmc_ipmi_handle_data(kcs_bmc);
>+			kcs_bmc_ipmi_handle_data(priv);
>
> 		ret =3D KCS_BMC_EVENT_HANDLED;
> 	} else {
> 		ret =3D KCS_BMC_EVENT_NONE;
> 	}
>
>-	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
>+	spin_unlock(&priv->lock);
>
> 	return ret;
> }
>@@ -217,37 +290,29 @@ static const struct kcs_bmc_client_ops kcs_bmc_ipmi_=
client_ops =3D {
> 	.event =3D kcs_bmc_ipmi_event,
> };
>
>-static inline struct kcs_bmc *file_to_kcs_bmc(struct file *filp)
>+static inline struct kcs_bmc_ipmi *to_kcs_bmc(struct file *filp)
> {
>-	return container_of(filp->private_data, struct kcs_bmc, miscdev);
>+	return container_of(filp->private_data, struct kcs_bmc_ipmi, miscdev);
> }
>
> static int kcs_bmc_ipmi_open(struct inode *inode, struct file *filp)
> {
>-	struct kcs_bmc *kcs_bmc =3D file_to_kcs_bmc(filp);
>-	int ret =3D 0;
>+	struct kcs_bmc_ipmi *priv =3D to_kcs_bmc(filp);
>
>-	spin_lock_irq(&kcs_bmc->lock);
>-	if (!kcs_bmc->running)
>-		kcs_bmc->running =3D 1;
>-	else
>-		ret =3D -EBUSY;
>-	spin_unlock_irq(&kcs_bmc->lock);
>-
>-	return ret;
>+	return kcs_bmc_enable_device(priv->client.dev, &priv->client);
> }
>
> static __poll_t kcs_bmc_ipmi_poll(struct file *filp, poll_table *wait)
> {
>-	struct kcs_bmc *kcs_bmc =3D file_to_kcs_bmc(filp);
>+	struct kcs_bmc_ipmi *priv =3D to_kcs_bmc(filp);
> 	__poll_t mask =3D 0;
>
>-	poll_wait(filp, &kcs_bmc->queue, wait);
>+	poll_wait(filp, &priv->queue, wait);
>
>-	spin_lock_irq(&kcs_bmc->lock);
>-	if (kcs_bmc->data_in_avail)
>+	spin_lock_irq(&priv->lock);
>+	if (priv->data_in_avail)
> 		mask |=3D EPOLLIN;
>-	spin_unlock_irq(&kcs_bmc->lock);
>+	spin_unlock_irq(&priv->lock);
>
> 	return mask;
> }
>@@ -255,24 +320,24 @@ static __poll_t kcs_bmc_ipmi_poll(struct file *filp,=
 poll_table *wait)
> static ssize_t kcs_bmc_ipmi_read(struct file *filp, char __user *buf,
> 			    size_t count, loff_t *ppos)
> {
>-	struct kcs_bmc *kcs_bmc =3D file_to_kcs_bmc(filp);
>+	struct kcs_bmc_ipmi *priv =3D to_kcs_bmc(filp);
> 	bool data_avail;
> 	size_t data_len;
> 	ssize_t ret;
>
> 	if (!(filp->f_flags & O_NONBLOCK))
>-		wait_event_interruptible(kcs_bmc->queue,
>-					 kcs_bmc->data_in_avail);
>+		wait_event_interruptible(priv->queue,
>+					 priv->data_in_avail);
>
>-	mutex_lock(&kcs_bmc->mutex);
>+	mutex_lock(&priv->mutex);
>
>-	spin_lock_irq(&kcs_bmc->lock);
>-	data_avail =3D kcs_bmc->data_in_avail;
>+	spin_lock_irq(&priv->lock);
>+	data_avail =3D priv->data_in_avail;
> 	if (data_avail) {
>-		data_len =3D kcs_bmc->data_in_idx;
>-		memcpy(kcs_bmc->kbuffer, kcs_bmc->data_in, data_len);
>+		data_len =3D priv->data_in_idx;
>+		memcpy(priv->kbuffer, priv->data_in, data_len);
> 	}
>-	spin_unlock_irq(&kcs_bmc->lock);
>+	spin_unlock_irq(&priv->lock);
>
> 	if (!data_avail) {
> 		ret =3D -EAGAIN;
>@@ -281,35 +346,35 @@ static ssize_t kcs_bmc_ipmi_read(struct file *filp, =
char __user *buf,
>
> 	if (count < data_len) {
> 		pr_err("channel=3D%u with too large data : %zu\n",
>-			kcs_bmc->channel, data_len);
>+			priv->client.dev->channel, data_len);
>
>-		spin_lock_irq(&kcs_bmc->lock);
>-		kcs_bmc_ipmi_force_abort(kcs_bmc);
>-		spin_unlock_irq(&kcs_bmc->lock);
>+		spin_lock_irq(&priv->lock);
>+		kcs_bmc_ipmi_force_abort(priv);
>+		spin_unlock_irq(&priv->lock);
>
> 		ret =3D -EOVERFLOW;
> 		goto out_unlock;
> 	}
>
>-	if (copy_to_user(buf, kcs_bmc->kbuffer, data_len)) {
>+	if (copy_to_user(buf, priv->kbuffer, data_len)) {
> 		ret =3D -EFAULT;
> 		goto out_unlock;
> 	}
>
> 	ret =3D data_len;
>
>-	spin_lock_irq(&kcs_bmc->lock);
>-	if (kcs_bmc->phase =3D=3D KCS_PHASE_WRITE_DONE) {
>-		kcs_bmc->phase =3D KCS_PHASE_WAIT_READ;
>-		kcs_bmc->data_in_avail =3D false;
>-		kcs_bmc->data_in_idx =3D 0;
>+	spin_lock_irq(&priv->lock);
>+	if (priv->phase =3D=3D KCS_PHASE_WRITE_DONE) {
>+		priv->phase =3D KCS_PHASE_WAIT_READ;
>+		priv->data_in_avail =3D false;
>+		priv->data_in_idx =3D 0;
> 	} else {
> 		ret =3D -EAGAIN;
> 	}
>-	spin_unlock_irq(&kcs_bmc->lock);
>+	spin_unlock_irq(&priv->lock);
>
> out_unlock:
>-	mutex_unlock(&kcs_bmc->mutex);
>+	mutex_unlock(&priv->mutex);
>
> 	return ret;
> }
>@@ -317,35 +382,35 @@ static ssize_t kcs_bmc_ipmi_read(struct file *filp, =
char __user *buf,
> static ssize_t kcs_bmc_ipmi_write(struct file *filp, const char __user *b=
uf,
> 			     size_t count, loff_t *ppos)
> {
>-	struct kcs_bmc *kcs_bmc =3D file_to_kcs_bmc(filp);
>+	struct kcs_bmc_ipmi *priv =3D to_kcs_bmc(filp);
> 	ssize_t ret;
>
> 	/* a minimum response size '3' : netfn + cmd + ccode */
> 	if (count < 3 || count > KCS_MSG_BUFSIZ)
> 		return -EINVAL;
>
>-	mutex_lock(&kcs_bmc->mutex);
>+	mutex_lock(&priv->mutex);
>
>-	if (copy_from_user(kcs_bmc->kbuffer, buf, count)) {
>+	if (copy_from_user(priv->kbuffer, buf, count)) {
> 		ret =3D -EFAULT;
> 		goto out_unlock;
> 	}
>
>-	spin_lock_irq(&kcs_bmc->lock);
>-	if (kcs_bmc->phase =3D=3D KCS_PHASE_WAIT_READ) {
>-		kcs_bmc->phase =3D KCS_PHASE_READ;
>-		kcs_bmc->data_out_idx =3D 1;
>-		kcs_bmc->data_out_len =3D count;
>-		memcpy(kcs_bmc->data_out, kcs_bmc->kbuffer, count);
>-		kcs_bmc_write_data(kcs_bmc, kcs_bmc->data_out[0]);
>+	spin_lock_irq(&priv->lock);
>+	if (priv->phase =3D=3D KCS_PHASE_WAIT_READ) {
>+		priv->phase =3D KCS_PHASE_READ;
>+		priv->data_out_idx =3D 1;
>+		priv->data_out_len =3D count;
>+		memcpy(priv->data_out, priv->kbuffer, count);
>+		kcs_bmc_write_data(priv->client.dev, priv->data_out[0]);
> 		ret =3D count;
> 	} else {
> 		ret =3D -EINVAL;
> 	}
>-	spin_unlock_irq(&kcs_bmc->lock);
>+	spin_unlock_irq(&priv->lock);
>
> out_unlock:
>-	mutex_unlock(&kcs_bmc->mutex);
>+	mutex_unlock(&priv->mutex);
>
> 	return ret;
> }
>@@ -353,22 +418,22 @@ static ssize_t kcs_bmc_ipmi_write(struct file *filp,=
 const char __user *buf,
> static long kcs_bmc_ipmi_ioctl(struct file *filp, unsigned int cmd,
> 			  unsigned long arg)
> {
>-	struct kcs_bmc *kcs_bmc =3D file_to_kcs_bmc(filp);
>+	struct kcs_bmc_ipmi *priv =3D to_kcs_bmc(filp);
> 	long ret =3D 0;
>
>-	spin_lock_irq(&kcs_bmc->lock);
>+	spin_lock_irq(&priv->lock);
>
> 	switch (cmd) {
> 	case IPMI_BMC_IOCTL_SET_SMS_ATN:
>-		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, KCS_STATUS_SMS_ATN);
>+		kcs_bmc_update_status(priv->client.dev, KCS_STATUS_SMS_ATN, KCS_STATUS_=
SMS_ATN);
> 		break;
>
> 	case IPMI_BMC_IOCTL_CLEAR_SMS_ATN:
>-		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, 0);
>+		kcs_bmc_update_status(priv->client.dev, KCS_STATUS_SMS_ATN, 0);
> 		break;
>
> 	case IPMI_BMC_IOCTL_FORCE_ABORT:
>-		kcs_bmc_ipmi_force_abort(kcs_bmc);
>+		kcs_bmc_ipmi_force_abort(priv);
> 		break;
>
> 	default:
>@@ -376,19 +441,17 @@ static long kcs_bmc_ipmi_ioctl(struct file *filp, un=
signed int cmd,
> 		break;
> 	}
>
>-	spin_unlock_irq(&kcs_bmc->lock);
>+	spin_unlock_irq(&priv->lock);
>
> 	return ret;
> }
>
> static int kcs_bmc_ipmi_release(struct inode *inode, struct file *filp)
> {
>-	struct kcs_bmc *kcs_bmc =3D file_to_kcs_bmc(filp);
>+	struct kcs_bmc_ipmi *priv =3D to_kcs_bmc(filp);
>
>-	spin_lock_irq(&kcs_bmc->lock);
>-	kcs_bmc->running =3D 0;
>-	kcs_bmc_ipmi_force_abort(kcs_bmc);
>-	spin_unlock_irq(&kcs_bmc->lock);
>+	kcs_bmc_ipmi_force_abort(priv);
>+	kcs_bmc_disable_device(priv->client.dev, &priv->client);
>
> 	return 0;
> }
>@@ -403,56 +466,78 @@ static const struct file_operations kcs_bmc_ipmi_fop=
s =3D {
> 	.unlocked_ioctl =3D kcs_bmc_ipmi_ioctl,
> };
>
>-int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc);
>-int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc)
>+static DEFINE_SPINLOCK(kcs_bmc_ipmi_instances_lock);
>+static LIST_HEAD(kcs_bmc_ipmi_instances);
>+
>+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc);
>+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc)
> {
>+	struct kcs_bmc_ipmi *priv;
> 	int rc;
>
>-	spin_lock_init(&kcs_bmc->lock);
>-	mutex_init(&kcs_bmc->mutex);
>-	init_waitqueue_head(&kcs_bmc->queue);
>-
>-	kcs_bmc->client.dev =3D kcs_bmc;
>-	kcs_bmc->client.ops =3D &kcs_bmc_ipmi_client_ops;
>-	kcs_bmc->data_in =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERN=
EL);
>-	kcs_bmc->data_out =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KER=
NEL);
>-	kcs_bmc->kbuffer =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERN=
EL);
>-
>-	kcs_bmc->miscdev.minor =3D MISC_DYNAMIC_MINOR;
>-	kcs_bmc->miscdev.name =3D devm_kasprintf(kcs_bmc->dev, GFP_KERNEL, "%s%u=
",
>-					       DEVICE_NAME, kcs_bmc->channel);
>-	if (!kcs_bmc->data_in || !kcs_bmc->data_out || !kcs_bmc->kbuffer ||
>-	    !kcs_bmc->miscdev.name)
>+	priv =3D devm_kzalloc(kcs_bmc->dev, sizeof(*priv), GFP_KERNEL);
>+	if (!priv)
> 		return -ENOMEM;
>
>-	kcs_bmc->miscdev.fops =3D &kcs_bmc_ipmi_fops;
>+	spin_lock_init(&priv->lock);
>+	mutex_init(&priv->mutex);
>
>-	rc =3D misc_register(&kcs_bmc->miscdev);
>+	init_waitqueue_head(&priv->queue);
>+
>+	priv->client.dev =3D kcs_bmc;
>+	priv->client.ops =3D &kcs_bmc_ipmi_client_ops;
>+	priv->data_in =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL)=
;
>+	priv->data_out =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL=
);
>+	priv->kbuffer =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL)=
;
>+
>+	priv->miscdev.minor =3D MISC_DYNAMIC_MINOR;
>+	priv->miscdev.name =3D devm_kasprintf(kcs_bmc->dev, GFP_KERNEL, "%s%u", =
DEVICE_NAME,
>+					   kcs_bmc->channel);
>+	if (!priv->data_in || !priv->data_out || !priv->kbuffer || !priv->miscde=
v.name)
>+		return -EINVAL;
>+
>+	priv->miscdev.fops =3D &kcs_bmc_ipmi_fops;
>+
>+	rc =3D misc_register(&priv->miscdev);
> 	if (rc) {
> 		dev_err(kcs_bmc->dev, "Unable to register device: %d\n", rc);
> 		return rc;
> 	}
>
>+	spin_lock_irq(&kcs_bmc_ipmi_instances_lock);
>+	list_add(&priv->entry, &kcs_bmc_ipmi_instances);
>+	spin_unlock_irq(&kcs_bmc_ipmi_instances_lock);
>+
> 	dev_info(kcs_bmc->dev, "Initialised IPMI client for channel %d", kcs_bmc=
->channel);
>
> 	return 0;
> }
> EXPORT_SYMBOL(kcs_bmc_ipmi_attach_cdev);
>
>-int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc);
>-int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc)
>+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc);
>+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc)
> {
>-	misc_deregister(&kcs_bmc->miscdev);
>+	struct kcs_bmc_ipmi *priv =3D NULL, *pos;
>
>-	spin_lock_irq(&kcs_bmc->lock);
>-	kcs_bmc->running =3D 0;
>-	kcs_bmc_ipmi_force_abort(kcs_bmc);
>-	spin_unlock_irq(&kcs_bmc->lock);
>+	spin_lock_irq(&kcs_bmc_ipmi_instances_lock);
>+	list_for_each_entry(pos, &kcs_bmc_ipmi_instances, entry) {
>+		if (pos->client.dev =3D=3D kcs_bmc) {
>+			priv =3D pos;
>+			list_del(&pos->entry);
>+			break;
>+		}
>+	}
>+	spin_unlock_irq(&kcs_bmc_ipmi_instances_lock);
>
>-	devm_kfree(kcs_bmc->dev, kcs_bmc->kbuffer);
>-	devm_kfree(kcs_bmc->dev, kcs_bmc->data_out);
>-	devm_kfree(kcs_bmc->dev, kcs_bmc->data_in);
>-	devm_kfree(kcs_bmc->dev, kcs_bmc);
>+	if (!priv)
>+		return 0;

Would -ENOENT or something be appropriate here if the thing we're trying
to detach isn't found?

>+
>+	misc_deregister(&priv->miscdev);
>+	kcs_bmc_disable_device(priv->client.dev, &priv->client);
>+	devm_kfree(kcs_bmc->dev, priv->kbuffer);
>+	devm_kfree(kcs_bmc->dev, priv->data_out);
>+	devm_kfree(kcs_bmc->dev, priv->data_in);
>+	devm_kfree(kcs_bmc->dev, priv);
>
> 	return 0;
> }
>@@ -460,4 +545,5 @@ EXPORT_SYMBOL(kcs_bmc_ipmi_detach_cdev);
>
> MODULE_LICENSE("GPL v2");
> MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
> MODULE_DESCRIPTION("KCS BMC to handle the IPMI request from system softwa=
re");
>diff --git a/drivers/char/ipmi/kcs_bmc_client.h b/drivers/char/ipmi/kcs_bm=
c_client.h
>index 140631d157d8..2dd710f4b4aa 100644
>--- a/drivers/char/ipmi/kcs_bmc_client.h
>+++ b/drivers/char/ipmi/kcs_bmc_client.h
>@@ -8,22 +8,24 @@
> #include <linux/notifier.h>
> #include <stdbool.h>
>
>-struct kcs_bmc;
>-struct kcs_bmc_client_ops;
>-
>-struct kcs_bmc_client {
>-	const struct kcs_bmc_client_ops *ops;
>-
>-	struct kcs_bmc *dev;
>-};
>+#include "kcs_bmc.h"
>
> struct kcs_bmc_client_ops {
> 	int (*event)(struct kcs_bmc_client *client);
> };
>
>-u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc);
>-void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data);
>-u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc);
>-void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data);
>-void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val);
>+struct kcs_bmc_client {
>+	const struct kcs_bmc_client_ops *ops;
>+
>+	struct kcs_bmc_device *dev;
>+};
>+
>+int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_=
client *client);
>+void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bm=
c_client *client);
>+
>+u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc);
>+void kcs_bmc_write_data(struct kcs_bmc_device *kcs_bmc, u8 data);
>+u8 kcs_bmc_read_status(struct kcs_bmc_device *kcs_bmc);
>+void kcs_bmc_write_status(struct kcs_bmc_device *kcs_bmc, u8 data);
>+void kcs_bmc_update_status(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 va=
l);
> #endif
>diff --git a/drivers/char/ipmi/kcs_bmc_device.h b/drivers/char/ipmi/kcs_bm=
c_device.h
>index 33462174516d..57b7174b2bac 100644
>--- a/drivers/char/ipmi/kcs_bmc_device.h
>+++ b/drivers/char/ipmi/kcs_bmc_device.h
>@@ -7,13 +7,13 @@
> #include "kcs_bmc.h"
>
> struct kcs_bmc_device_ops {
>-	u8 (*io_inputb)(struct kcs_bmc *kcs_bmc, u32 reg);
>-	void (*io_outputb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 b);
>-	void (*io_updateb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 b);
>+	u8 (*io_inputb)(struct kcs_bmc_device *kcs_bmc, u32 reg);
>+	void (*io_outputb)(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 b);
>+	void (*io_updateb)(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask, u8 =
b);
> };
>
>-int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
>-int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc);
>-int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc);
>+int kcs_bmc_handle_event(struct kcs_bmc_device *kcs_bmc);
>+int kcs_bmc_add_device(struct kcs_bmc_device *kcs_bmc);
>+int kcs_bmc_remove_device(struct kcs_bmc_device *kcs_bmc);
>
> #endif
>diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_b=
mc_npcm7xx.c
>index 1d21697fc585..dce93ec895fc 100644
>--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>@@ -65,7 +65,7 @@ struct npcm7xx_kcs_reg {
> };
>
> struct npcm7xx_kcs_bmc {
>-	struct kcs_bmc kcs_bmc;
>+	struct kcs_bmc_device kcs_bmc;
>
> 	struct regmap *map;
>
>@@ -78,12 +78,12 @@ static const struct npcm7xx_kcs_reg npcm7xx_kcs_reg_tb=
l[KCS_CHANNEL_MAX] =3D {
> 	{ .sts =3D KCS3ST, .dob =3D KCS3DO, .dib =3D KCS3DI, .ctl =3D KCS3CTL, .=
ie =3D KCS3IE },
> };
>
>-static inline struct npcm7xx_kcs_bmc *to_npcm7xx_kcs_bmc(struct kcs_bmc *=
kcs_bmc)
>+static inline struct npcm7xx_kcs_bmc *to_npcm7xx_kcs_bmc(struct kcs_bmc_d=
evice *kcs_bmc)
> {
> 	return container_of(kcs_bmc, struct npcm7xx_kcs_bmc, kcs_bmc);
> }
>
>-static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
>+static u8 npcm7xx_kcs_inb(struct kcs_bmc_device *kcs_bmc, u32 reg)
> {
> 	struct npcm7xx_kcs_bmc *priv =3D to_npcm7xx_kcs_bmc(kcs_bmc);
> 	u32 val =3D 0;
>@@ -95,7 +95,7 @@ static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 r=
eg)
> 	return rc =3D=3D 0 ? (u8)val : 0;
> }
>
>-static void npcm7xx_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
>+static void npcm7xx_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 =
data)
> {
> 	struct npcm7xx_kcs_bmc *priv =3D to_npcm7xx_kcs_bmc(kcs_bmc);
> 	int rc;
>@@ -104,7 +104,7 @@ static void npcm7xx_kcs_outb(struct kcs_bmc *kcs_bmc, =
u32 reg, u8 data)
> 	WARN(rc !=3D 0, "regmap_write() failed: %d\n", rc);
> }
>
>-static void npcm7xx_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask=
, u8 data)
>+static void npcm7xx_kcs_updateb(struct kcs_bmc_device *kcs_bmc, u32 reg, =
u8 mask, u8 data)
> {
> 	struct npcm7xx_kcs_bmc *priv =3D to_npcm7xx_kcs_bmc(kcs_bmc);
> 	int rc;
>@@ -113,7 +113,7 @@ static void npcm7xx_kcs_updateb(struct kcs_bmc *kcs_bm=
c, u32 reg, u8 mask, u8 da
> 	WARN(rc !=3D 0, "regmap_update_bits() failed: %d\n", rc);
> }
>
>-static void npcm7xx_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enab=
le)
>+static void npcm7xx_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, bo=
ol enable)
> {
> 	struct npcm7xx_kcs_bmc *priv =3D to_npcm7xx_kcs_bmc(kcs_bmc);
>
>@@ -126,7 +126,7 @@ static void npcm7xx_kcs_enable_channel(struct kcs_bmc =
*kcs_bmc, bool enable)
>
> static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
> {
>-	struct kcs_bmc *kcs_bmc =3D arg;
>+	struct kcs_bmc_device *kcs_bmc =3D arg;
> 	int rc;
>
> 	rc =3D kcs_bmc_handle_event(kcs_bmc);
>@@ -136,7 +136,7 @@ static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
> 	return rc =3D=3D KCS_BMC_EVENT_HANDLED ? IRQ_HANDLED : IRQ_NONE;
> }
>
>-static int npcm7xx_kcs_config_irq(struct kcs_bmc *kcs_bmc,
>+static int npcm7xx_kcs_config_irq(struct kcs_bmc_device *kcs_bmc,
> 				  struct platform_device *pdev)
> {
> 	struct device *dev =3D &pdev->dev;
>@@ -160,7 +160,7 @@ static int npcm7xx_kcs_probe(struct platform_device *p=
dev)
> {
> 	struct device *dev =3D &pdev->dev;
> 	struct npcm7xx_kcs_bmc *priv;
>-	struct kcs_bmc *kcs_bmc;
>+	struct kcs_bmc_device *kcs_bmc;
> 	u32 chan;
> 	int rc;
>
>@@ -207,7 +207,7 @@ static int npcm7xx_kcs_probe(struct platform_device *p=
dev)
> static int npcm7xx_kcs_remove(struct platform_device *pdev)
> {
> 	struct npcm7xx_kcs_bmc *priv =3D platform_get_drvdata(pdev);
>-	struct kcs_bmc *kcs_bmc =3D &priv->kcs_bmc;
>+	struct kcs_bmc_device *kcs_bmc =3D &priv->kcs_bmc;
>
> 	kcs_bmc_remove_device(kcs_bmc);
>
>--=20
>2.27.0
>=
