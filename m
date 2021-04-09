Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E083359375
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 05:58:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGkrC3Tj0z3c0T
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 13:58:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=F0nFChJ+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=5733813a0f=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=F0nFChJ+; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGkqM5DsMz3bTh;
 Fri,  9 Apr 2021 13:57:35 +1000 (AEST)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1393m8b2001076; Fri, 9 Apr 2021 03:57:14 GMT
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2051.outbound.protection.outlook.com [104.47.44.51])
 by mx0b-00268f01.pphosted.com with ESMTP id 37t83g18cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 03:57:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fysGYu7D9nmiMj91/k/MsCyR+OTY62C8wi2OP39n6E+EkLDrXD8GFV3hQrR+5QZxU8ef+PoYJaLDLOvB5aUDmNTN3T9yq5UGMV1GtceKscVGlwxOUIxMRgkzpWsYJqySL93/g/ENh5jUimtjTWypZ8IhY2OFT9tKgO0V8cy60TaukyUHDbBFQTpmUtxs+ufhibjHItdtm48zEmYzKZtFhCoplCamy5yOWbAnGwRIaOMHXElyOrdfW2A7H6cRwpzO2+3GU92p1e9TqN+ruRJ7oIQ6tYbG3yfiixrxsK2bkBbSOW0E05p8LRLlJWMN57yO/3tCmjn4luBqh0wwstl1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bF4vdBsNOQphiRqkwoI7wN5jLlg0bEEC1WgwSwwHgtU=;
 b=AdcPbt1FAGvkTJBy9xQ+KNyQSm/I9q+sCNkCjZMrW506jKJxEouNnCC8cDkI3ECMVIHfUvxQ+nAfj3FDMBBQoPPAn55OdbdhVnOHt43/+uLuQ8FY1ih5MjSB5bA6X6bJWL3LzI3BaqXXJ8iCWyLIhIoKkt4QqlEUkYIOgBXkTizgUtM163RqjmbIxUEPw3pB9jeczMfpjkw33l8UM72QmtvNYO8cFDEaqKXHYXPrIfrxJunSa2pVHzLhghAfX9zu4d4h6HDEMocUC+fhpg7wvSChP9Bp2Xgl8A/9GMCX2Fbj+eEiwGykcF3pvlLMhQmkmVVuvn96y0XmGoLN/aTp+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bF4vdBsNOQphiRqkwoI7wN5jLlg0bEEC1WgwSwwHgtU=;
 b=F0nFChJ+CzojOmPG6ecPW8tNkzik/H0AKuzEH/zFGrKLYIyRcc18niWsS3VG9TTIUTQcAUzruiSBMWBQFBvvHGSOnkGUHyqZjHtg0hB2uHGg7w8yY79Dz3MxexQVsH2rBqDzfSp5rcnkfFLw4vf5jIkb97COz46RXMlCNRO9JX4=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB6281.namprd04.prod.outlook.com (2603:10b6:5:1e8::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28; Fri, 9 Apr 2021 03:57:12 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 03:57:12 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 10/21] ipmi: kcs_bmc: Turn the driver data-structures
 inside-out
Thread-Topic: [PATCH v2 10/21] ipmi: kcs_bmc: Turn the driver data-structures
 inside-out
Thread-Index: AQHXLPRrPdVC3RFcvUCHtDapr0x+sg==
Date: Fri, 9 Apr 2021 03:57:12 +0000
Message-ID: <YG/Ql9z9X/mtOSvl@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-10-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-10-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4db0e9de-949d-4d8e-79a4-08d8fb0b8e65
x-ms-traffictypediagnostic: DM6PR04MB6281:
x-microsoft-antispam-prvs: <DM6PR04MB6281E34E9EBE16C7CF016E01C3739@DM6PR04MB6281.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KRWU46Wlp5ZC8rAArxvv+mJrUjw6mDKZnAGeAVUdZQUM4MbuCoyVl4MEGiU7DVQri9JnMEpJOSyiWVWDuKRxxc0cBCc7C6GwKo/W41qRRecqGIzlnWu5PcxWj3TBc6hRYbrD6K4MmeuRWmYVdflzezGVpcs/ZvUjobW6mrskLpIXByOdvFdSW7yG4JY73azqUlrJZpkDaPBG/SR8Umzc3/iqQeL+QFn142gDHESW777Jbsc/5LOSCjkby0iQGkeP3jbvpevFu7dTggAWHzGAh8qyHaG8qks5B20W2MchPFPhYrWTalXphj6jkWYtOB+KmYl1NAWDw56lokJNzXPe3PamTNmaSMCv6FLm1d/tOtkUQk0AolRMNbH0xBnQXJfuEhUtkwaLJO9VI5KWn1f07yICWOd6IFZR8nH84FEYZ9iT0C+yQANki1AIcIlWl9BdQRH0wxCa1H9j0uEPI9RIskRKm3ov11gU7rPX2rKeQd7jgojbnWliTjab+W3M1kXlk65ZsOfeauaT6FYvN3xIMSGHw1FIhenivVntVQNswAh50ECgCj4EYHv8DGcnx+3RJARpoTuaKX5+aReTPvTQ9JUaMAzQIiwrx+O+XiRUtgrTPNj7XSM9IY2gPFMtueY2WhN3QIVRTXGsmyWIiKyxjUwiobVh7Vxmb4PYfUbX8bY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(4326008)(8676002)(66476007)(66946007)(64756008)(26005)(6916009)(86362001)(7416002)(186003)(33716001)(2906002)(6512007)(8936002)(9686003)(38100700001)(76116006)(83380400001)(71200400001)(66446008)(66556008)(5660300002)(6506007)(6486002)(478600001)(316002)(54906003)(30864003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?86jGy93V8im5Nbn4PGhZjVm7NbiCoWsx23eIylCEDH/rNL/AVxTvEMIsD+yt?=
 =?us-ascii?Q?J5f188UNOtXoo6ncBMmDG74Ee+zLm1OMTWdXjPK7Bqm+55jMMHws0xQzv9os?=
 =?us-ascii?Q?r/gtvjAgebI2g7zWVLBAIKwjiUte9Hk0cjzHAzqFehRUOEWsXIwOxcFJxUWS?=
 =?us-ascii?Q?QDoODR2LM6iZPgZ0a290UIylPtdYKyLbIc7NMUyrQBgi8QcfZn0A9EBdlgdv?=
 =?us-ascii?Q?VO3iZos2Zp7pGkumisykW5C+nOJ+YEa9VUnP5O5m+R2xYnGhGVFDWN1EuyYT?=
 =?us-ascii?Q?ovcO5nM3xjUxcUOypUwRA2W5rO7Hq1N2HtuMAd1aaXJXhhCx4YDaP80TZrBJ?=
 =?us-ascii?Q?KwF8L0oVTcbtm5V5RHBsz78VtW0EsrFPS7QyutTBOYG9HnMEZnUdCifaiXH8?=
 =?us-ascii?Q?z7hhVjNNqAbM8r5TV7AJJ05TUNgMV+rYLyQwATNMXdUfdQf3oq16Vk7exL6W?=
 =?us-ascii?Q?86ZU0b0Az8M1u+IkOYBthhlx8MoxC9y+4XKDqDpa07aeJPpiAo21HuAhZgs/?=
 =?us-ascii?Q?am05tal1Xy+70/gVLiS1TxljJFYn7CKYrWM5mgAB3LDPJggxNI11+da+HHpV?=
 =?us-ascii?Q?3qlsDooULm3PmOJP67RyWzx0e/+52dMh6Avtj8DbLe4K09THm0kjfdeXXNsY?=
 =?us-ascii?Q?701/YhcMsOUassk9u6TH4hiY6joSTQUwumRTtNsMhecG/vSjRLTy9Pta9ZxN?=
 =?us-ascii?Q?nUOGC58PnhF4NYWz9Qd7LbnMSmHBbFezF2KTU537EwP0/D2AQl1UsOGa8Y5S?=
 =?us-ascii?Q?H7zmQ9YQ5Cjp/Aihtf5vFU6BJVIzsTQ7FDlxJ83E5wXOTYW0oeEcv4ZlFlGE?=
 =?us-ascii?Q?j5hvwAQayT2N6u8hrF8DaYCSzxTgTiWkhJ89Nlgf3X+SmK3HAv2XJ/J+tJLX?=
 =?us-ascii?Q?GfZorL93KcBpWcL3nyLNL1izRhU7gQHbCt12gPU/fCmZPRkPYpBuo8cbjmDE?=
 =?us-ascii?Q?/Mr00iCIYoBaM+H+Vyq3Xnrg9zBcSzKrIcG6WpJ78msCbts6/XMTYdJzxZXg?=
 =?us-ascii?Q?SIVncsYBouF0viMF5q/Fc+0OB5ObNKS0ML3eQhcFinzRCjE44I16caZ/ZO3E?=
 =?us-ascii?Q?sw6UCVbQXS+JhPPtdBGcNDQ9zNQfURT7iVsYI9WX0WDH0FbL5XGJUfvbd/9+?=
 =?us-ascii?Q?BS4GR4W4+158gOzElbYE4rSwdYIruuAoS1PKtd60rdPQVu92x29V9ai/tnOo?=
 =?us-ascii?Q?SigEkdhsUvb7uFoAV9FdfT3C8sw8unqU3h87Y0X0jPa8zdWnWhtTpWcn4Li5?=
 =?us-ascii?Q?gqUmQ/FDQmRtbUSsMaINJXgEFgcMiS8Tzsw1fPXQVmEimqUii/FGcTcs4V2D?=
 =?us-ascii?Q?rGp9Xv4RwpKEuHYwfzloDMyO8Lo0L2GKsNW9keAVZnZmTA=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17439EB88E9CC84BBF52D18548986FCE@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db0e9de-949d-4d8e-79a4-08d8fb0b8e65
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 03:57:12.3213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xjx4kOtZI4OzpvNzQUEsOAxn6wlcclUL9B/cLQowyU9tx3kEXOcGxC0/Ak8VcR6yBeYUSXiT5u7ds3qpsdWmSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6281
X-Proofpoint-ORIG-GUID: JUEQpJoPCEqPaQMqpmz7kWtbMW6fmDEw
X-Proofpoint-GUID: JUEQpJoPCEqPaQMqpmz7kWtbMW6fmDEw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_03:2021-04-08,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090025
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

On Fri, Mar 19, 2021 at 01:27:41AM CDT, Andrew Jeffery wrote:
>Make the KCS device drivers responsible for allocating their own memory.
>
>Until now the private data for the device driver was allocated internal
>to the private data for the chardev interface. This coupling required
>the slightly awkward API of passing through the struct size for the
>driver private data to the chardev constructor, and then retrieving a
>pointer to the driver private data from the allocated chardev memory.
>
>In addition to being awkward, the arrangement prevents the
>implementation of alternative userspace interfaces as the device driver
>private data is not independent.
>
>Peel a layer off the onion and turn the data-structures inside out by
>exploiting container_of() and embedding `struct kcs_device` in the
>driver private data.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/kcs_bmc.c           | 15 +++++--
> drivers/char/ipmi/kcs_bmc.h           | 12 ++----
> drivers/char/ipmi/kcs_bmc_aspeed.c    | 60 ++++++++++++++++-----------
> drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 60 ++++++++++++++++++---------
> drivers/char/ipmi/kcs_bmc_npcm7xx.c   | 37 ++++++++++-------
> 5 files changed, 113 insertions(+), 71 deletions(-)
>
>diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
>index ef5c48ffe74a..709b6bdec165 100644
>--- a/drivers/char/ipmi/kcs_bmc.c
>+++ b/drivers/char/ipmi/kcs_bmc.c
>@@ -44,12 +44,19 @@ int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
> }
> EXPORT_SYMBOL(kcs_bmc_handle_event);
>
>-struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u=
32 channel);
>-struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 ch=
annel)
>+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc);

Another declaration perhaps intended for kcs_bmc.h?

>+int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc)
> {
>-	return kcs_bmc_ipmi_alloc(dev, sizeof_priv, channel);
>+	return kcs_bmc_ipmi_attach_cdev(kcs_bmc);
> }
>-EXPORT_SYMBOL(kcs_bmc_alloc);
>+EXPORT_SYMBOL(kcs_bmc_add_device);
>+
>+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc);

Here too.

>+int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc)
>+{
>+	return kcs_bmc_ipmi_detach_cdev(kcs_bmc);
>+}
>+EXPORT_SYMBOL(kcs_bmc_remove_device);
>
> MODULE_LICENSE("GPL v2");
> MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
>index febea0c8deb4..bf0ae327997f 100644
>--- a/drivers/char/ipmi/kcs_bmc.h
>+++ b/drivers/char/ipmi/kcs_bmc.h
>@@ -67,6 +67,8 @@ struct kcs_ioreg {
> };
>
> struct kcs_bmc {
>+	struct device *dev;
>+
> 	spinlock_t lock;
>
> 	u32 channel;
>@@ -94,17 +96,11 @@ struct kcs_bmc {
> 	u8 *kbuffer;
>
> 	struct miscdevice miscdev;
>-
>-	unsigned long priv[];
> };
>
>-static inline void *kcs_bmc_priv(struct kcs_bmc *kcs_bmc)
>-{
>-	return kcs_bmc->priv;
>-}
>-
> int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
>-struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 ch=
annel);
>+int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc);
>+int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc);
>
> u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc);
> void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data);
>diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bm=
c_aspeed.c
>index 630cf095560e..0416ac78ce68 100644
>--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
>+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
>@@ -61,6 +61,8 @@
> #define LPC_STR4             0x11C
>
> struct aspeed_kcs_bmc {
>+	struct kcs_bmc kcs_bmc;
>+
> 	struct regmap *map;
> };
>
>@@ -69,9 +71,14 @@ struct aspeed_kcs_of_ops {
> 	int (*get_io_address)(struct platform_device *pdev);
> };
>
>+static inline struct aspeed_kcs_bmc *to_aspeed_kcs_bmc(struct kcs_bmc *kc=
s_bmc)
>+{
>+	return container_of(kcs_bmc, struct aspeed_kcs_bmc, kcs_bmc);
>+}
>+
> static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
> {
>-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
> 	u32 val =3D 0;
> 	int rc;
>
>@@ -83,7 +90,7 @@ static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 re=
g)
>
> static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
> {
>-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
> 	int rc;
>
> 	rc =3D regmap_write(priv->map, reg, data);
>@@ -92,7 +99,7 @@ static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32=
 reg, u8 data)
>
> static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask,=
 u8 val)
> {
>-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
> 	int rc;
>
> 	rc =3D regmap_update_bits(priv->map, reg, mask, val);
>@@ -114,7 +121,7 @@ static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc=
, u32 reg, u8 mask, u8 val
>  */
> static void aspeed_kcs_set_address(struct kcs_bmc *kcs_bmc, u16 addr)
> {
>-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>
> 	switch (kcs_bmc->channel) {
> 	case 1:
>@@ -148,7 +155,7 @@ static void aspeed_kcs_set_address(struct kcs_bmc *kcs=
_bmc, u16 addr)
>
> static void aspeed_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enabl=
e)
> {
>-	struct aspeed_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>+	struct aspeed_kcs_bmc *priv =3D to_aspeed_kcs_bmc(kcs_bmc);
>
> 	switch (kcs_bmc->channel) {
> 	case 1:
>@@ -323,16 +330,16 @@ static int aspeed_kcs_of_v2_get_io_address(struct pl=
atform_device *pdev)
> static int aspeed_kcs_probe(struct platform_device *pdev)
> {
> 	const struct aspeed_kcs_of_ops *ops;
>-	struct device *dev =3D &pdev->dev;
>+	struct aspeed_kcs_bmc *priv;
> 	struct kcs_bmc *kcs_bmc;
> 	struct device_node *np;
> 	int rc, channel, addr;
>
>-	np =3D dev->of_node->parent;
>+	np =3D pdev->dev.of_node->parent;
> 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
> 	    !of_device_is_compatible(np, "aspeed,ast2500-lpc-v2") &&
> 	    !of_device_is_compatible(np, "aspeed,ast2600-lpc-v2")) {
>-		dev_err(dev, "unsupported LPC device binding\n");
>+		dev_err(&pdev->dev, "unsupported LPC device binding\n");
> 		return -ENODEV;
> 	}
> 	ops =3D of_device_get_match_data(&pdev->dev);
>@@ -343,18 +350,27 @@ static int aspeed_kcs_probe(struct platform_device *=
pdev)
> 	if (channel < 0)
> 		return channel;
>
>-	kcs_bmc =3D kcs_bmc_alloc(&pdev->dev, sizeof(struct aspeed_kcs_bmc), cha=
nnel);
>-	if (!kcs_bmc)
>+	addr =3D ops->get_io_address(pdev);
>+	if (addr < 0)
>+		return addr;
>+
>+	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>+	if (!priv)
> 		return -ENOMEM;
>
>+	kcs_bmc =3D &priv->kcs_bmc;
>+	kcs_bmc->dev =3D &pdev->dev;
>+	kcs_bmc->channel =3D channel;
> 	kcs_bmc->ioreg =3D ast_kcs_bmc_ioregs[channel - 1];
> 	kcs_bmc->io_inputb =3D aspeed_kcs_inb;
> 	kcs_bmc->io_outputb =3D aspeed_kcs_outb;
> 	kcs_bmc->io_updateb =3D aspeed_kcs_updateb;
>
>-	addr =3D ops->get_io_address(pdev);
>-	if (addr < 0)
>-		return addr;
>+	priv->map =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
>+	if (IS_ERR(priv->map)) {
>+		dev_err(&pdev->dev, "Couldn't get regmap\n");
>+		return -ENODEV;
>+	}

The reanimated priv->map initialization I suspect wasn't meant to
have been removed in the first place...

>
> 	aspeed_kcs_set_address(kcs_bmc, addr);
>
>@@ -362,29 +378,25 @@ static int aspeed_kcs_probe(struct platform_device *=
pdev)
> 	if (rc)
> 		return rc;
>
>-	dev_set_drvdata(dev, kcs_bmc);
>+	platform_set_drvdata(pdev, priv);
>
> 	aspeed_kcs_enable_channel(kcs_bmc, true);
>
>-	rc =3D misc_register(&kcs_bmc->miscdev);
>-	if (rc) {
>-		dev_err(dev, "Unable to register device\n");
>+	rc =3D kcs_bmc_add_device(&priv->kcs_bmc);
>+	if (rc < 0)
> 		return rc;
>-	}
>
>-	dev_dbg(&pdev->dev,
>-		"Probed KCS device %d (IDR=3D0x%x, ODR=3D0x%x, STR=3D0x%x)\n",
>-		kcs_bmc->channel, kcs_bmc->ioreg.idr, kcs_bmc->ioreg.odr,
>-		kcs_bmc->ioreg.str);
>+	dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n", kcs_bmc->channe=
l, addr);

Is the dbg->info change here intentional?  (I have no particular
objection if so, but it's often a change I make myself during
testing/debugging and then forget to revert...)

>
> 	return 0;
> }
>
> static int aspeed_kcs_remove(struct platform_device *pdev)
> {
>-	struct kcs_bmc *kcs_bmc =3D dev_get_drvdata(&pdev->dev);
>+	struct aspeed_kcs_bmc *priv =3D platform_get_drvdata(pdev);
>+	struct kcs_bmc *kcs_bmc =3D &priv->kcs_bmc;
>
>-	misc_deregister(&kcs_bmc->miscdev);
>+	kcs_bmc_remove_device(kcs_bmc);

Should we propagate the return value outward here?

>
> 	return 0;
> }
>diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs=
_bmc_cdev_ipmi.c
>index 82c77994e481..0ca71c135a1a 100644
>--- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>@@ -382,7 +382,7 @@ static int kcs_bmc_ipmi_release(struct inode *inode, s=
truct file *filp)
> 	return 0;
> }
>
>-static const struct file_operations kcs_bmc_fops =3D {
>+static const struct file_operations kcs_bmc_ipmi_fops =3D {
> 	.owner          =3D THIS_MODULE,
> 	.open           =3D kcs_bmc_ipmi_open,
> 	.read           =3D kcs_bmc_ipmi_read,
>@@ -392,36 +392,58 @@ static const struct file_operations kcs_bmc_fops =3D=
 {
> 	.unlocked_ioctl =3D kcs_bmc_ipmi_ioctl,
> };
>
>-struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u=
32 channel);
>-struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u=
32 channel)
>+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc);

Errant declaration again?

>+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc)
> {
>-	struct kcs_bmc *kcs_bmc;
>-
>-	kcs_bmc =3D devm_kzalloc(dev, sizeof(*kcs_bmc) + sizeof_priv, GFP_KERNEL=
);
>-	if (!kcs_bmc)
>-		return NULL;
>+	int rc;
>
> 	spin_lock_init(&kcs_bmc->lock);
>-	kcs_bmc->channel =3D channel;
>-
> 	mutex_init(&kcs_bmc->mutex);
> 	init_waitqueue_head(&kcs_bmc->queue);
>
>-	kcs_bmc->data_in =3D devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
>-	kcs_bmc->data_out =3D devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
>-	kcs_bmc->kbuffer =3D devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
>+	kcs_bmc->data_in =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERN=
EL);
>+	kcs_bmc->data_out =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KER=
NEL);
>+	kcs_bmc->kbuffer =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERN=
EL);
>
> 	kcs_bmc->miscdev.minor =3D MISC_DYNAMIC_MINOR;
>-	kcs_bmc->miscdev.name =3D devm_kasprintf(dev, GFP_KERNEL, "%s%u",
>-					       DEVICE_NAME, channel);
>+	kcs_bmc->miscdev.name =3D devm_kasprintf(kcs_bmc->dev, GFP_KERNEL, "%s%u=
",
>+					       DEVICE_NAME, kcs_bmc->channel);
> 	if (!kcs_bmc->data_in || !kcs_bmc->data_out || !kcs_bmc->kbuffer ||
> 	    !kcs_bmc->miscdev.name)
>-		return NULL;
>-	kcs_bmc->miscdev.fops =3D &kcs_bmc_fops;
>+		return -ENOMEM;
>
>-	return kcs_bmc;
>+	kcs_bmc->miscdev.fops =3D &kcs_bmc_ipmi_fops;
>+
>+	rc =3D misc_register(&kcs_bmc->miscdev);
>+	if (rc) {
>+		dev_err(kcs_bmc->dev, "Unable to register device: %d\n", rc);
>+		return rc;
>+	}
>+
>+	dev_info(kcs_bmc->dev, "Initialised IPMI client for channel %d", kcs_bmc=
->channel);
>+
>+	return 0;
>+}
>+EXPORT_SYMBOL(kcs_bmc_ipmi_attach_cdev);
>+
>+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc);

Same here.

>+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc)
>+{
>+	misc_deregister(&kcs_bmc->miscdev);
>+
>+	spin_lock_irq(&kcs_bmc->lock);
>+	kcs_bmc->running =3D 0;
>+	kcs_bmc_ipmi_force_abort(kcs_bmc);
>+	spin_unlock_irq(&kcs_bmc->lock);
>+
>+	devm_kfree(kcs_bmc->dev, kcs_bmc->kbuffer);
>+	devm_kfree(kcs_bmc->dev, kcs_bmc->data_out);
>+	devm_kfree(kcs_bmc->dev, kcs_bmc->data_in);
>+	devm_kfree(kcs_bmc->dev, kcs_bmc);
>+
>+	return 0;
> }
>-EXPORT_SYMBOL(kcs_bmc_ipmi_alloc);
>+EXPORT_SYMBOL(kcs_bmc_ipmi_detach_cdev);
>
> MODULE_LICENSE("GPL v2");
> MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_b=
mc_npcm7xx.c
>index 1f44aadec9e8..5d017498dc69 100644
>--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>@@ -65,6 +65,8 @@ struct npcm7xx_kcs_reg {
> };
>
> struct npcm7xx_kcs_bmc {
>+	struct kcs_bmc kcs_bmc;
>+
> 	struct regmap *map;
>
> 	const struct npcm7xx_kcs_reg *reg;
>@@ -76,9 +78,14 @@ static const struct npcm7xx_kcs_reg npcm7xx_kcs_reg_tbl=
[KCS_CHANNEL_MAX] =3D {
> 	{ .sts =3D KCS3ST, .dob =3D KCS3DO, .dib =3D KCS3DI, .ctl =3D KCS3CTL, .=
ie =3D KCS3IE },
> };
>
>+static inline struct npcm7xx_kcs_bmc *to_npcm7xx_kcs_bmc(struct kcs_bmc *=
kcs_bmc)
>+{
>+	return container_of(kcs_bmc, struct npcm7xx_kcs_bmc, kcs_bmc);
>+}
>+
> static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
> {
>-	struct npcm7xx_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>+	struct npcm7xx_kcs_bmc *priv =3D to_npcm7xx_kcs_bmc(kcs_bmc);
> 	u32 val =3D 0;
> 	int rc;
>
>@@ -90,7 +97,7 @@ static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 r=
eg)
>
> static void npcm7xx_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
> {
>-	struct npcm7xx_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>+	struct npcm7xx_kcs_bmc *priv =3D to_npcm7xx_kcs_bmc(kcs_bmc);
> 	int rc;
>
> 	rc =3D regmap_write(priv->map, reg, data);
>@@ -99,7 +106,7 @@ static void npcm7xx_kcs_outb(struct kcs_bmc *kcs_bmc, u=
32 reg, u8 data)
>
> static void npcm7xx_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask=
, u8 data)
> {
>-	struct npcm7xx_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>+	struct npcm7xx_kcs_bmc *priv =3D to_npcm7xx_kcs_bmc(kcs_bmc);
> 	int rc;
>
> 	rc =3D regmap_update_bits(priv->map, reg, mask, data);
>@@ -108,7 +115,7 @@ static void npcm7xx_kcs_updateb(struct kcs_bmc *kcs_bm=
c, u32 reg, u8 mask, u8 da
>
> static void npcm7xx_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enab=
le)
> {
>-	struct npcm7xx_kcs_bmc *priv =3D kcs_bmc_priv(kcs_bmc);
>+	struct npcm7xx_kcs_bmc *priv =3D to_npcm7xx_kcs_bmc(kcs_bmc);
>
> 	regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
> 			   enable ? KCS_CTL_IBFIE : 0);
>@@ -155,11 +162,10 @@ static int npcm7xx_kcs_probe(struct platform_device =
*pdev)
> 		return -ENODEV;
> 	}
>
>-	kcs_bmc =3D kcs_bmc_alloc(dev, sizeof(*priv), chan);
>-	if (!kcs_bmc)
>+	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>+	if (!priv)
> 		return -ENOMEM;
>
>-	priv =3D kcs_bmc_priv(kcs_bmc);
> 	priv->map =3D syscon_node_to_regmap(dev->parent->of_node);
> 	if (IS_ERR(priv->map)) {
> 		dev_err(dev, "Couldn't get regmap\n");
>@@ -167,6 +173,9 @@ static int npcm7xx_kcs_probe(struct platform_device *p=
dev)
> 	}
> 	priv->reg =3D &npcm7xx_kcs_reg_tbl[chan - 1];
>
>+	kcs_bmc =3D &priv->kcs_bmc;
>+	kcs_bmc->dev =3D &pdev->dev;
>+	kcs_bmc->channel =3D chan;
> 	kcs_bmc->ioreg.idr =3D priv->reg->dib;
> 	kcs_bmc->ioreg.odr =3D priv->reg->dob;
> 	kcs_bmc->ioreg.str =3D priv->reg->sts;
>@@ -174,31 +183,27 @@ static int npcm7xx_kcs_probe(struct platform_device =
*pdev)
> 	kcs_bmc->io_outputb =3D npcm7xx_kcs_outb;
> 	kcs_bmc->io_updateb =3D npcm7xx_kcs_updateb;
>
>-	dev_set_drvdata(dev, kcs_bmc);
>+	platform_set_drvdata(pdev, priv);
>
> 	npcm7xx_kcs_enable_channel(kcs_bmc, true);
> 	rc =3D npcm7xx_kcs_config_irq(kcs_bmc, pdev);
> 	if (rc)
> 		return rc;
>
>-	rc =3D misc_register(&kcs_bmc->miscdev);
>-	if (rc) {
>-		dev_err(dev, "Unable to register device\n");
>-		return rc;
>-	}
>
> 	pr_info("channel=3D%u idr=3D0x%x odr=3D0x%x str=3D0x%x\n",
> 		chan,
> 		kcs_bmc->ioreg.idr, kcs_bmc->ioreg.odr, kcs_bmc->ioreg.str);
>
>-	return 0;
>+	return kcs_bmc_add_device(kcs_bmc);
> }
>
> static int npcm7xx_kcs_remove(struct platform_device *pdev)
> {
>-	struct kcs_bmc *kcs_bmc =3D dev_get_drvdata(&pdev->dev);
>+	struct npcm7xx_kcs_bmc *priv =3D platform_get_drvdata(pdev);
>+	struct kcs_bmc *kcs_bmc =3D &priv->kcs_bmc;
>
>-	misc_deregister(&kcs_bmc->miscdev);
>+	kcs_bmc_remove_device(kcs_bmc);

As with the corresponding aspeed code, should we propagate the return
value here?

>
> 	return 0;
> }
>--=20
>2.27.0
>=
