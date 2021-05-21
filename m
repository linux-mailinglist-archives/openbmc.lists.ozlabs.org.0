Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB9938C1A2
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 10:21:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmfhD2489z2xfm
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 18:21:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=C2VHXjBi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=6775408355=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=C2VHXjBi; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmfgm159Gz2yxq;
 Fri, 21 May 2021 18:20:51 +1000 (AEST)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L79KhO021131; Fri, 21 May 2021 07:18:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0a-00268f01.pphosted.com with ESMTP id 38nku0uvbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 07:18:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QE1K07BSYleSEnToww+Hk//z1I4YdXsgKsKTOzmUEzERqu3rGFvROLYvWupviCHAXbxYHKjXwn9OmNUKF/Nl33as5Of8Yc85ImAE8cwB4PQ8EcXDujHuaFVRuogN2U1Zbz64QL+/D79oKahvt4agagT7ULTDk3N7nSYrHRgn4ySapR8T+FUFeqkK0Kd499x/QSOM51JP7FdH/lbFbZhYqWCdbwL5bPqO7vcgTMcHHhc/asX3T9KVDe9nrtPyxTkE2Q93Nn+zUuF4sFtvcuvv/dDVfk7aFZNux9b36nKdAMtdEx7jYY4SIVDU5FfOdKpMHeoxVHfSXIiU9hyNpbAGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0P7J4vOCOtp42pKNgqvOArsJEET3mkNjsynt/C9K/A=;
 b=QFCP7VLtWT0pCkm2DZrTxzqzZo5kth7fa8clgi6sF+9N3y2vN6i52o2V4O16Em/L/Prhz0WZ/mKLUVbgDGfMFUnNk5/xNfstRBhkvfKqDv6ikQ8/Q79haCLF31kICNvAV91G7diNV4CFcT5asm+pudU54FjeLmxsxffXlkzhrF5LrqLhG2Q+EBwRP/bwacAZwVCGlKjNulaAj2ktR3RiPtb5gRhAOrH0s2IrSdWHzCLwlDN1jp579tHbTvEIj3Uah36cJmRq887MOAHn/792AAoMZSfJfdOVEiyKhu7la+eRn4ALpH5H49Fqs7Q9MXdxrBu34ySOzMjudGEZNEOhhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0P7J4vOCOtp42pKNgqvOArsJEET3mkNjsynt/C9K/A=;
 b=C2VHXjBiIjs+zEog8OlfqDZFtbuht+ITMkHDXwxhMDBiGug6jw7LbEbduAd+8wSx0wXBDXhxIzJeGVGMFohDQR/Icz4XlD5Mh24i1qB0SBPyzs/L2xPME0BjsmSEw113PwT8eBeoj9YjWsGEaYdeA/7maAB/eO+q/zLs/jVY1t8=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB3802.namprd04.prod.outlook.com (2603:10b6:5:ac::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Fri, 21 May 2021 07:18:27 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 07:18:27 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 06/16] ipmi: kcs_bmc: Split headers into device and
 client
Thread-Topic: [PATCH v3 06/16] ipmi: kcs_bmc: Split headers into device and
 client
Thread-Index: AQHXThF+2M+qBB3cQES0imGFdtnaDg==
Date: Fri, 21 May 2021 07:18:27 +0000
Message-ID: <YKdewrMOF41O70px@packtop>
References: <20210510054213.1610760-1-andrew@aj.id.au>
 <20210510054213.1610760-7-andrew@aj.id.au>
In-Reply-To: <20210510054213.1610760-7-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8f0a954-63ec-428c-970f-08d91c28a0da
x-ms-traffictypediagnostic: DM6PR04MB3802:
x-microsoft-antispam-prvs: <DM6PR04MB3802540D71267A43229C63ACC3299@DM6PR04MB3802.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ELUiFXXLX0JbNdJ8ZxmNngg30OKePzVUv+QovP+o3rhi1etVOiJwJcHxxoFRs22LUiHSN5jy0gXDScOE6smGGRimP9GxVQ1ZBIy9t/PVVy1ZYylwqLgVKml6M1wYMXZWSmV+kqaxF42X20YMX5PPr0YPtzkDoB6pb6X0iaBLg9PKbu/lIOQCdLM5N6wi/98FYy8zn6pHNTu3m6EkoIAtQjK/P8wxy/QW9DGA5sPaDHujruFqIrbOtLvOQvk7AEfsEO7za6/8FIm40sXwDykDQLFGfEL3e4Pz0x8z5qndfglyYQcYaQLMrAujLNmrgZHKqrYYIfWD3zp1+A9MyQnZojC/i+CuAzUby8eMhdWbTBmHVQyt/PyMRYC7xJwMLFbhu7/QP/3aC//YAzGGFY693De9lghckXP4GYDSsfOjX4oEUo3QIll23/B2nLNHD1nq5BuRIzAfbSD8GUk2GkCpoDQGejE495fjs3VtORVcAbB7noDVXwTjj9gtOlJNGWhbtrgvj5bTTB90l0OgJPkhMBPuSn5g9edoY0gRs0jK892GvIaQTW+zy/FZg9BkwIF8m+SUetYvLWqmqFvQmR91kPsjKIsU/Rk41lVY5oVUaK4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(346002)(39860400002)(376002)(396003)(366004)(136003)(122000001)(5660300002)(7416002)(478600001)(33716001)(38100700002)(71200400001)(26005)(54906003)(66476007)(66446008)(76116006)(66946007)(8676002)(4326008)(8936002)(6916009)(9686003)(30864003)(6486002)(2906002)(64756008)(83380400001)(6512007)(186003)(6506007)(86362001)(66556008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?nJFdtPCx2nHbHHByw+ywJezGKRXK+s1t6KEIAjCYQyN2mO8psm2VMkvgcAfa?=
 =?us-ascii?Q?aD9I21UmDG/ScTlql1kIO8u+MVWSxsqvXek1vBslJoNu+wTAhmA70FsktT7n?=
 =?us-ascii?Q?QGttc9Mwzm4wiHluxysjMJfx+C60MAjy2e2gyVGTmTA3ZpNXZPT3j3CQWBbA?=
 =?us-ascii?Q?hkRV0pDZY6/6mQOOTUk3Bj2yiPg0zINVA8Vf8asalxluJrgGce6OhFgZrqT+?=
 =?us-ascii?Q?mM5ONyyReE2VfhFr0L+uPqrG/iHImWsSqxqv/ho18wmgYdKSACChTjIGBMQ1?=
 =?us-ascii?Q?fVMShzZbcLmn1pPeTv/Hjes47QEAD/zI14qxbqV8/82N7iuk8Rshw6TZ8xzg?=
 =?us-ascii?Q?SOF44eYWSVPd7you4D2nFpzcfWh2LCAvOywo0FsHI4dGEcRZPqRcciarZ8wT?=
 =?us-ascii?Q?k4ESQIMRgcKvu/XGd6S1Wfjd9E7hyOUj0UFGkUDDztfqA6Gc+SJsf6if51ai?=
 =?us-ascii?Q?QAJ+/ykMpj42zaE0VnH+Flqfg8ibvi0TrcaCoiBHNOiWJsIuIYljomUv53IZ?=
 =?us-ascii?Q?VTZmVm4WdujJlTKVdHoNoEjSPG5fLecQFrs5cAJMMPnUIuPYYpI9VQBrZZpv?=
 =?us-ascii?Q?M+h7hr+peuXu6ZUcD2g/Vg3/ZKNbDuhj61Rh6PMMASyJfCdfutopCbzHgH5Q?=
 =?us-ascii?Q?kbdUwO9F/5qBLwig/bGE8NtiU97xZsnuUiQvyyh9akpNRgZJXAa1rhMSilGF?=
 =?us-ascii?Q?fsfveGGdV0EbeKlRzpAkLy70gcP3A7fr7D7xHEkHJSSioCn81ToUGArK3KLj?=
 =?us-ascii?Q?+ApfFIae9iVH8fQTITP9mWzCtbD8JZP+PtemiSzTplghfbNWId/g3GK2LP+A?=
 =?us-ascii?Q?2Cp6ijMNfhcFMo2Ev+pXCO/VmykTEprG3XJVe7MuJ780Up1yspSsbPtgSQCT?=
 =?us-ascii?Q?d14hORyMmGdRlziHtbbcIVKk58DkkPagkJKbSWj0VAdh7yWRM3B8gXQxIud8?=
 =?us-ascii?Q?vDIMqLxHZbHrRoPJuDYBPNYCiLnNl1Tor4oew9bYVagufJKaKxlOriII9ts7?=
 =?us-ascii?Q?W2Wd0DUw2LprsKFthA/uKSr7tiwlJUhDo154r28IVCDiD6CKLDl3O9aa9mfm?=
 =?us-ascii?Q?NHEsReTHNiUIJpzlH5Ba3RcKp5RUsy9Om6vVObp/se92RHLyFEOi5wDh3mYM?=
 =?us-ascii?Q?7sYdOtFnWDAJ0wR09ZTtkiyUX4Sj4rlUXny9UfujoIR1iQx+wioqNVL4gvKp?=
 =?us-ascii?Q?6utb/2OT4E5Rf7qj8Bkh8OO7nRcjODGaEVGx2BZ7QeiQm2qo8asnl3+xKPID?=
 =?us-ascii?Q?dSwAW9sEIjFLJ8ZIvAfsQs+cMA9q+1WUgIfqpgwk2kGKUTNfU3kTeZi4aK6p?=
 =?us-ascii?Q?iZ0ohrgyYBpvG6LcYNfhQn7UcgmlpDmUaQxxMGVIVZbhnA=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A92A503CF2E50147AC64323F3411CA56@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f0a954-63ec-428c-970f-08d91c28a0da
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 07:18:27.1116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kwcoW7Q7x0+R1GMygi34Jv1YCL0sFr462roW0Rb37XkEgd+tbHxjjczrbgMSW5slp+O3RyDG1s6vqMinQX6e7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3802
X-Proofpoint-ORIG-GUID: 7vsV_6-_TP-8lpT0u2uIuFWm1vkHZ_6k
X-Proofpoint-GUID: 7vsV_6-_TP-8lpT0u2uIuFWm1vkHZ_6k
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210045
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
 "minyard@acm.org" <minyard@acm.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 10, 2021 at 12:42:03AM CDT, Andrew Jeffery wrote:
>Strengthen the distinction between code that abstracts the
>implementation of the KCS behaviours (device drivers) and code that
>exploits KCS behaviours (clients). Neither needs to know about the APIs
>required by the other, so provide separate headers.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/kcs_bmc.c           | 23 ++++++++++------
> drivers/char/ipmi/kcs_bmc.h           | 27 +++++++++----------
> drivers/char/ipmi/kcs_bmc_aspeed.c    | 17 ++++++------
> drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 39 ++++++++++++++++++---------
> drivers/char/ipmi/kcs_bmc_client.h    | 30 +++++++++++++++++++++
> drivers/char/ipmi/kcs_bmc_device.h    | 19 +++++++++++++
> drivers/char/ipmi/kcs_bmc_npcm7xx.c   | 17 ++++++------
> 7 files changed, 120 insertions(+), 52 deletions(-)
> create mode 100644 drivers/char/ipmi/kcs_bmc_client.h
> create mode 100644 drivers/char/ipmi/kcs_bmc_device.h
>
>diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
>index 83da681bf49e..d3c11a46bca2 100644
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
>-int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
>+irqreturn_t kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
> {
>-	return kcs_bmc_ipmi_event(kcs_bmc);
>+	return kcs_bmc->client.ops->event(&kcs_bmc->client);
> }
> EXPORT_SYMBOL(kcs_bmc_handle_event);
>
>@@ -64,4 +70,5 @@ EXPORT_SYMBOL(kcs_bmc_remove_device);
>
> MODULE_LICENSE("GPL v2");
> MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
> MODULE_DESCRIPTION("KCS BMC to handle the IPMI request from system softwa=
re");
>diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
>index b2e6b7a7fe62..f42843d240ed 100644
>--- a/drivers/char/ipmi/kcs_bmc.h
>+++ b/drivers/char/ipmi/kcs_bmc.h
>@@ -8,6 +8,12 @@
>
> #include <linux/miscdevice.h>
>
>+#include "kcs_bmc_client.h"
>+
>+#define KCS_BMC_STR_OBF		BIT(0)
>+#define KCS_BMC_STR_IBF		BIT(1)
>+#define KCS_BMC_STR_CMD_DAT	BIT(3)
>+
> /* Different phases of the KCS BMC module.
>  *  KCS_PHASE_IDLE:
>  *            BMC should not be expecting nor sending any data.
>@@ -66,19 +72,21 @@ struct kcs_ioreg {
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
>@@ -97,15 +105,4 @@ struct kcs_bmc {
>
> 	struct miscdevice miscdev;
> };
>-
>-int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
>-void kcs_bmc_add_device(struct kcs_bmc *kcs_bmc);
>-void kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc);
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
>index 5d433dea5714..337b69cea1da 100644
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
>@@ -220,14 +220,17 @@ static void aspeed_kcs_enable_channel(struct kcs_bmc=
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
>
>-	if (!kcs_bmc_handle_event(kcs_bmc))
>-		return IRQ_HANDLED;
>-
>-	return IRQ_NONE;
>+	return kcs_bmc_handle_event(kcs_bmc);
> }
>
> static int aspeed_kcs_config_irq(struct kcs_bmc *kcs_bmc,
>@@ -362,9 +365,7 @@ static int aspeed_kcs_probe(struct platform_device *pd=
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
>index 5060643bf530..476ad6d541d5 100644
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
>+static irqreturn_t kcs_bmc_ipmi_event(struct kcs_bmc_client *client)
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
>+		ret =3D IRQ_HANDLED;
>+	} else {
>+		ret =3D IRQ_NONE;
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
>@@ -401,6 +412,8 @@ int kcs_bmc_ipmi_add_device(struct kcs_bmc *kcs_bmc)
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
>index 000000000000..b19a7ff64b80
>--- /dev/null
>+++ b/drivers/char/ipmi/kcs_bmc_client.h
>@@ -0,0 +1,30 @@
>+/* SPDX-License-Identifier: GPL-2.0 */
>+/* Copyright (c) 2021, IBM Corp. */
>+
>+#ifndef __KCS_BMC_CONSUMER_H__
>+#define __KCS_BMC_CONSUMER_H__
>+
>+#include <linux/irqreturn.h>
>+#include <linux/list.h>
>+#include <linux/notifier.h>
>+#include <stdbool.h>

Unless there's something non-obvious going on here, I'd think just
linux/irqreturn.h and linux/types.h would suffice for this header?  (I
don't see any lists or notifiers or bools, anyway.)

[...reads ahead...]

Ah, I guess eventually patch #8 adds a list_head, but I suppose it'd be
preferable to add the list.h #include in that patch instead of this one.

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
>+	irqreturn_t (*event)(struct kcs_bmc_client *client);
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
>index 000000000000..14f8d700a3d8
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
>+irqreturn_t kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
>+void kcs_bmc_add_device(struct kcs_bmc *kcs_bmc);
>+void kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc);
>+
>+#endif
>diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_b=
mc_npcm7xx.c
>index f7b4e866f86e..203258b24708 100644
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
>@@ -128,10 +128,7 @@ static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg=
)
> {
> 	struct kcs_bmc *kcs_bmc =3D arg;
>
>-	if (!kcs_bmc_handle_event(kcs_bmc))
>-		return IRQ_HANDLED;
>-
>-	return IRQ_NONE;
>+	return kcs_bmc_handle_event(kcs_bmc);
> }
>
> static int npcm7xx_kcs_config_irq(struct kcs_bmc *kcs_bmc,
>@@ -148,6 +145,12 @@ static int npcm7xx_kcs_config_irq(struct kcs_bmc *kcs=
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
>@@ -179,9 +182,7 @@ static int npcm7xx_kcs_probe(struct platform_device *p=
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
