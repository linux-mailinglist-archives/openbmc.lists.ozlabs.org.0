Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7275F359454
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 07:09:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGmPr266cz30Cs
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 15:09:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=CXJTQk7C;
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
 header.s=selector2-equinixinc-onmicrosoft-com header.b=CXJTQk7C; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGmPV2dP0z2xYx;
 Fri,  9 Apr 2021 15:08:45 +1000 (AEST)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13953b1r012018; Fri, 9 Apr 2021 05:07:14 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-00268f01.pphosted.com with ESMTP id 37t8pf1a86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 05:07:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5KDrDe3f19ZhFXCNea4wHtjIa1QxVe2kMUdGSs2PhDfGhB/Dzc0ABoeKWBSdb2fshdZcrrrGpRmVqCgbzffq5MNdYc6WBIe83b4T2QIaMoBgUfDGBEvwj4uwUK16xpbToVgcWZLkZdhaYgEaIQiracmwir19REeGpUbOGPpvf0Fio+NSnLDNcuWfgqa/yRvtffqldeoxbLxY3aHbTg2MdCWmfy89+egUjoIr4AeHucG1fwP7dcLomIxLCFiOACeeEME+ClMn/8vhIj0Wp2OMg5hN8PAg8czXLRMTJY2sPl1mr0z++AvS97SQaPcmF/hJEftjFYIELpNJVLYwoOPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKyGwdFACaffo8/QpagNejwptqusDdoqidKxtHvqXOM=;
 b=cZnRH08wv/gS1itUMaQDdcr6kWu3dy20rKDITNd4/AJlgo7XCvgHHGY5SROwaQAqpq+B0889mkPgl64UNkxUylAfSmpNnK8tP6q7Z3yFRwuVhOLc8ldRWHq2vVZqkoxTiiePxV+2HpnxTy3o7DrvXTgJfp8Z523NQSEAAgFuZPwylvid4fGEhXgoEiTBtbwpjL/KnXWMP6LcnH3Pm9iSZ1S1V0w5C6GIfGnYeY/F70k2Y+zonns6zKvUtmwstg1DfRnh1h/CLOjBGtej0vcNggxn3LgzPXTh5VnUwaum2nN1cGD/8waJO0Mt1znUPretrbQXZ3IJ4PhV8CByJ7JcTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKyGwdFACaffo8/QpagNejwptqusDdoqidKxtHvqXOM=;
 b=CXJTQk7CGHtJUwctauhIfuXSE7KXrahYDxfGaiCz2lmayjX0nJ+cD/Gi227TEbDSnHRiWdKwqEwRzSQvsyVpAvyCjuRefXBuUCVjGnEL1g+O19W7uNVaAYxedCkjRZWsOeZxmsbyKtp73q/nmfJZl8Hd34qvQMzY5wMZ8GViC6Q=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM5PR04MB1034.namprd04.prod.outlook.com (2603:10b6:4:44::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.18; Fri, 9 Apr 2021 05:07:11 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 05:07:11 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 15/21] ipmi: kcs_bmc: Don't enforce single-open policy
 in the kernel
Thread-Topic: [PATCH v2 15/21] ipmi: kcs_bmc: Don't enforce single-open policy
 in the kernel
Thread-Index: AQHXLP4yV1bPwWXIUE6uiUHJ1sIkdw==
Date: Fri, 9 Apr 2021 05:07:11 +0000
Message-ID: <YG/g/poZLwO34QH7@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-15-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-15-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12788c7b-e50f-4a19-e12f-08d8fb155501
x-ms-traffictypediagnostic: DM5PR04MB1034:
x-microsoft-antispam-prvs: <DM5PR04MB1034A57B5A08266BE74F61F0C3739@DM5PR04MB1034.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xmt8CodYyPAmL6w88Bp0zZ8OWqDuJJmD1Z0bS8vcz6O+R9YD4qmS67kQWCf3sM8+wYHrS0BlYljYX2Zclt/gRTmy+G41ecmCZ4XP0SEBu5XLX8DeZT2PJzdBTyuehPdcFZPsboPLxUAi1hpuHWxAVbZEWe0eT4/rz8+XC+OWxPWy9n0wNLKifyisupKwnGJGj/OMu/ZTt+HXRCCHasvqpt6v7D4aOF8Co8b/Xh2TCScNDS6j7p1yWdEQHQMfkfzb7OVJxhbhma3s0IKSqyJVn9k20C9p98zf/DQmGh4JYY1jto26wzqvQRgId/CBBHxBuFSBN7aTwVsPcBoDIpNAm3ohf2BEIb9Ft2nKui9YSz8wOtnuxTZwpMyr/8birssq57sVX08d/pxNx0AS3r9ivb5jTuguvqvzOMcJhR1Es3Q5L7BHF4XHcAEJgWcc7Vsc1zrx+yyMOdr+TXTfi1XiQW9phgiwN+TV3TQn3jp/mDG2E+RMFG93TuRyt3JFP0Ab/HEr7embL9rs3nnIlzePD+ZLqqPbKtfEATKhlUBiZ4Yja3/JMWQsE5+ldi+d8gdVugrzIw/BW0W/pSLovASGn8a4/MWYltc2LSXcqHXappghvdtFA146qE5jQ3+UoXjBXQ6moP0SgPAeYiZ6Uli2ZzL68H4qYTOBzauzkOaRk/Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(6512007)(316002)(6506007)(6486002)(54906003)(83380400001)(71200400001)(9686003)(8936002)(86362001)(8676002)(5660300002)(6916009)(7416002)(478600001)(76116006)(33716001)(66946007)(186003)(64756008)(66476007)(26005)(66446008)(4326008)(38100700001)(2906002)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BBLrrAkQywR1p0LF6AM6JRQsAvVsF901iLBht2z91+mkJLsK5O35R99dYy8P?=
 =?us-ascii?Q?jswfWN30O1f8hrEFjoO8p89H+03bHH0lppurljKk950xZzRcZQGIF2k/Q/+i?=
 =?us-ascii?Q?VLjU6uRKjgO44z5cHrE9WLl1XURqDL3K+C/LHqPjNsa24UaXxKkQiC6kgOYj?=
 =?us-ascii?Q?iGlrKYdz9yRAR5IU+WzwhyNnvUox5bEF2VRSL+JhXnx8yLDxa7iyAxOQulIr?=
 =?us-ascii?Q?er7Bn60txPsbAbZ8SHHQhq7aL+8fedvfYE0CYxImpXe+p+Rnj845W7iTCt6Z?=
 =?us-ascii?Q?UdsLMhQfGq8J25hQ7bPq1pv7Fw06YeuzvshOevn0B6+gZkiYCzWc8I1hYoLT?=
 =?us-ascii?Q?J9t9q9/v5vqqzEcKubbVoSppLbwc/QTIM5nQOH/k4BYWfKwwOhH/mY4pyjp2?=
 =?us-ascii?Q?RJNrx2Jy1A5+gH5y5y531/q7W4YaCHyeIJwTOurqO64AsckBDPdtL/mRCDa3?=
 =?us-ascii?Q?y4K+/cVWzJjn9KyndL652kBnq+FBFwkSfDgVe+/skBjJy/arfMT3nUssd52V?=
 =?us-ascii?Q?xCuiQqf8ShOuEPgskynH/RY8T4zPpnWNfgPgj2P3Fw2LeCf0mjic7mcSE/Ko?=
 =?us-ascii?Q?ZXuwfQikp01ova8yUD1vWKu7y6FTNA2NLlZ3R51vN+Fyp8kUp2LNtqTKgYIO?=
 =?us-ascii?Q?/bYEegoIechtsohQvOy47MUDl0X+seCAQZf9S1DN3uPhiSbWKDphm7fg1jFY?=
 =?us-ascii?Q?ZbZGLnWnqwWa24dqZ4eGWb9F7MZXAsq/6XhaleY6kxtpjIrX4R5fLSl95Mz7?=
 =?us-ascii?Q?Xh1Y/Woqs/yD5XSmc4gEdH3F5DbSfLEdroJIilMPj9Il0tB8fkbQPBshTlO/?=
 =?us-ascii?Q?8CD3vFUSx/eCfd+zaoSu1N71m+a7LsUl1dlRSs91lHHbE3BAdOi1VxXopBon?=
 =?us-ascii?Q?wQqAIvhp0J/Wxkv4jymPsitN0D5A4F1MX4j+u1NTcebBgVEIesLMDwYlK+Ex?=
 =?us-ascii?Q?EwTqToTlRLK2WpXhb5WM59z05wQAjUgyOqShbcquAyzyWlarGmFuc8sKVPmg?=
 =?us-ascii?Q?N4c5IRORGOOc9uzccol8f8/TXewakThkC7ns3bxHsjAQvUgu1wJHaDwGj0B5?=
 =?us-ascii?Q?1GWA+7BwFq0DaMznFlgWbB2oMugWhDCeDmLo9TQm4ovwGC0qIwHxo2eRiCDd?=
 =?us-ascii?Q?Y8Hx0mRlfCiBS6ypYZsA4BnGsurn0cR3nkXRgfTTcBd7dBIZuZxTp3HMhXP4?=
 =?us-ascii?Q?HW9210Ka6cOFvs8amIX+jrCy5gxNYMOhzNQoJ+dysbcaYl5cJKHgD9KogfB3?=
 =?us-ascii?Q?bE01+T8KrOL20n/egYFYy9UzkMOuAYJVWkU6+NPvc/RyPNGcfprHayV7gbEd?=
 =?us-ascii?Q?cJkqNoy1b6udhZXftZJreXeYqwY0r4snAGYIkm5zLNIpUQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4AFF152F614E864091DBF9A7AB886B87@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12788c7b-e50f-4a19-e12f-08d8fb155501
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 05:07:11.1506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /fZl6HVF5n+m30geKhwEbIGHPif8SYJ+knyeCNrqM1sE8xh0bP0CV18msaU56zR8tlxTJ/H02jIn+T5qS8Y2+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1034
X-Proofpoint-GUID: xoTdrgzNs9ersZl9TD_dsMaivlxdYq4U
X-Proofpoint-ORIG-GUID: xoTdrgzNs9ersZl9TD_dsMaivlxdYq4U
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_03:2021-04-08,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090036
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

On Fri, Mar 19, 2021 at 01:27:46AM CDT, Andrew Jeffery wrote:
>Soon it will be possible for one KCS device to have multiple associated
>chardevs exposed to userspace (for IPMI and raw-style access). However,
>don't prevent userspace from:
>
>1. Opening more than one chardev at a time, or
>2. Opening the same chardev more than once.
>
>System behaviour is undefined for both classes of multiple access, so
>userspace must manage itself accordingly.
>
>The implementation delivers IBF and OBF events to the first chardev
>client to associate with the KCS device. An open on a related chardev
>cannot associate its client with the KCS device and so will not
>receive notification of events. However, any fd on any chardev may race
>their accesses to the data and status registers.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/kcs_bmc.c         | 34 ++++++++++-------------------
> drivers/char/ipmi/kcs_bmc_aspeed.c  |  3 +--
> drivers/char/ipmi/kcs_bmc_npcm7xx.c |  3 +--
> 3 files changed, 14 insertions(+), 26 deletions(-)
>
>diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
>index 05bbb72418b2..2fafa9541934 100644
>--- a/drivers/char/ipmi/kcs_bmc.c
>+++ b/drivers/char/ipmi/kcs_bmc.c
>@@ -55,24 +55,12 @@ EXPORT_SYMBOL(kcs_bmc_update_status);
> int kcs_bmc_handle_event(struct kcs_bmc_device *kcs_bmc)
> {
> 	struct kcs_bmc_client *client;
>-	int rc;
>+	int rc =3D KCS_BMC_EVENT_NONE;
>
> 	spin_lock(&kcs_bmc->lock);
> 	client =3D kcs_bmc->client;
>-	if (client) {
>+	if (!WARN_ON_ONCE(!client))
> 		rc =3D client->ops->event(client);

The double-negation split by a macro seems a bit confusing to me
readability-wise; could we simplify to something like

	if (client)
		rc =3D client->ops->event(client);
	else
		WARN_ONCE();

?

>-	} else {
>-		u8 status;
>-
>-		status =3D kcs_bmc_read_status(kcs_bmc);
>-		if (status & KCS_BMC_STR_IBF) {
>-			/* Ack the event by reading the data */
>-			kcs_bmc_read_data(kcs_bmc);
>-			rc =3D KCS_BMC_EVENT_HANDLED;
>-		} else {
>-			rc =3D KCS_BMC_EVENT_NONE;
>-		}
>-	}
> 	spin_unlock(&kcs_bmc->lock);
>
> 	return rc;
>@@ -81,26 +69,28 @@ EXPORT_SYMBOL(kcs_bmc_handle_event);
>
> int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_=
client *client)
> {
>-	int rc;
>-
> 	spin_lock_irq(&kcs_bmc->lock);
>-	if (kcs_bmc->client) {
>-		rc =3D -EBUSY;
>-	} else {
>+	if (!kcs_bmc->client) {
>+		u8 mask =3D KCS_BMC_EVENT_TYPE_IBF;
>+
> 		kcs_bmc->client =3D client;
>-		rc =3D 0;
>+		kcs_bmc_update_event_mask(kcs_bmc, mask, mask);
> 	}
> 	spin_unlock_irq(&kcs_bmc->lock);
>
>-	return rc;
>+	return 0;

Since this function appears to be infallible now, should it just return
void?  (Might be more churn than it's worth...shrug.)

> }
> EXPORT_SYMBOL(kcs_bmc_enable_device);
>
> void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bm=
c_client *client)
> {
> 	spin_lock_irq(&kcs_bmc->lock);
>-	if (client =3D=3D kcs_bmc->client)
>+	if (client =3D=3D kcs_bmc->client) {
>+		u8 mask =3D KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE;
>+
>+		kcs_bmc_update_event_mask(kcs_bmc, mask, 0);
> 		kcs_bmc->client =3D NULL;
>+	}
> 	spin_unlock_irq(&kcs_bmc->lock);
> }
> EXPORT_SYMBOL(kcs_bmc_disable_device);
>diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bm=
c_aspeed.c
>index 5f26471c038c..271845eb2e26 100644
>--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
>+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
>@@ -419,8 +419,7 @@ static int aspeed_kcs_probe(struct platform_device *pd=
ev)
>
> 	platform_set_drvdata(pdev, priv);
>
>-	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EV=
ENT_TYPE_OBE),
>-				   KCS_BMC_EVENT_TYPE_IBF);
>+	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EV=
ENT_TYPE_OBE), 0);
> 	aspeed_kcs_enable_channel(kcs_bmc, true);
>
> 	rc =3D kcs_bmc_add_device(&priv->kcs_bmc);
>diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_b=
mc_npcm7xx.c
>index c2032728a03d..fdf35cad2eba 100644
>--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>@@ -207,8 +207,7 @@ static int npcm7xx_kcs_probe(struct platform_device *p=
dev)
> 	if (rc)
> 		return rc;
>
>-	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_E=
VENT_TYPE_OBE),
>-				    KCS_BMC_EVENT_TYPE_IBF);
>+	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_E=
VENT_TYPE_OBE), 0);
> 	npcm7xx_kcs_enable_channel(kcs_bmc, true);
>
> 	pr_info("channel=3D%u idr=3D0x%x odr=3D0x%x str=3D0x%x\n",
>--=20
>2.27.0
>=
