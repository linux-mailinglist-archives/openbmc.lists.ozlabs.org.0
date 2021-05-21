Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAF738C15C
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 10:07:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmfNB5Yqwz306G
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 18:07:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=B3VgfboR;
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
 header.s=selector2-equinixinc-onmicrosoft-com header.b=B3VgfboR; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmfMp51MYz3033;
 Fri, 21 May 2021 18:07:01 +1000 (AEST)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L78L1C030208; Fri, 21 May 2021 07:17:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by mx0a-00268f01.pphosted.com with ESMTP id 38nmk9bq3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 07:17:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHE9TL6QaO/EAZy2SYAd4bV0rZB4kHRI6pwdYKYKOdwlpJP2EySu0+ya34wYOqk7sJ23sJE58U5zwKrDYU3bOZHXLb0VweV9jre3c3Ge4DxF4Aj3/vUVr47GPYIdSubmOeyAFmJQALSbb+K8j3X8i20fpQbHjZVaf2114olociLDGqRxI9ezG2um0HwUssnJkseraC/g0O1+M3b18ujJRmQgUUIcdi1uQbrwKbmCSH5vhqnCU6sqgf50DEHzJ79szx/wH4BIx/NHg+UhkJz9TYFaX2f4IhOvKMy5cfZ+F2wjN90UXTFU8w4LUCgZXPLv31fU4Ejuj0bWtQr6r0Xc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuWPqSMK2z4GTpOF6u7YyDZa5evRZDUdYQvHHz+UQnM=;
 b=joO+z/iKcJnxBN+xfw8321WIFt5LtwRwgCievPx36sJ5HCSJ/MyGd0vbp9dhse+2gipITiFOqB5x/VRIG7YdNZn4wTBpFn90FnF6VrgOIfDA4Tsd070B9w7eLONq/5Aw5GBPFSk1de/Cvrk87TboYZXPs4Abytu7ZCzuSDcuRMYLPV+bZt9hyIYcfPws128mzFzOG5eBpH0kWS0QlXcabOCo7Kv+Ap1PFBGidANOpmTQEHmhyVyI+TCbZ7sSo7MAfrmjhujtr2vkLB0NrzYrXeVHUhezp94hDeQ7tG/xsMtKjsrYNzJzUqjdPwWwEa2hBtovb8xak0ck541+SQfrhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuWPqSMK2z4GTpOF6u7YyDZa5evRZDUdYQvHHz+UQnM=;
 b=B3VgfboRVgyS/IcDlE7oKjhhG92LiIc2jmWbleL5XIFkMNyCe68zRRffYl3wedouLpRwQolxSkvGVSL5nAsZ6oCgv76gh9HNqEnTPryxkmz3g2XfpANZTrGdGhWZWUp9Jjk+099jR4SI+VADtrldY9FKz9HJd9mAclaEukrO88Q=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB3802.namprd04.prod.outlook.com (2603:10b6:5:ac::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Fri, 21 May 2021 07:17:43 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 07:17:36 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 01/16] ipmi: kcs_bmc_aspeed: Use of match data to
 extract KCS properties
Thread-Topic: [PATCH v3 01/16] ipmi: kcs_bmc_aspeed: Use of match data to
 extract KCS properties
Thread-Index: AQHXThFgKDybgLEgqkuGSW4h17XPcg==
Date: Fri, 21 May 2021 07:17:36 +0000
Message-ID: <YKdej27PuU1cgaCh@packtop>
References: <20210510054213.1610760-1-andrew@aj.id.au>
 <20210510054213.1610760-2-andrew@aj.id.au>
In-Reply-To: <20210510054213.1610760-2-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9b9dcb1-1faf-4392-2d7d-08d91c2882ad
x-ms-traffictypediagnostic: DM6PR04MB3802:
x-microsoft-antispam-prvs: <DM6PR04MB380291444BBAE115C2944A43C3299@DM6PR04MB3802.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 06zWp9YI4j1Iw4Uj/6f+OZFjBYEXofUBCnscw5Bk9Sj/aQzWb+MU4BTfywCUqZPuCclugaV1x3tFYbhr/KW9qelR1EfY4ikaybXRTrrqu7FjE3Yjs62NjzFsPv8aJE34Rd/YNPBMe9UhpNwSdj4r87KEbMWUx1M88byunzm5CtRh7RPJkWEDAyJQnZJpccA4AegLCyhHvEXY1HTpBo8GGmrQphtMc3ZxVApmjCGspCAHptV6FleDhVa2MUW0l/DiSiY8TQwBR4zPkAioTf/wP6BrMvkWEmotbHDUkhMADXCdl0vphAsX/ltWEbXk0RsZ9+VSqDkJFe5STSJy11/FoeDDHpEeEMyqzyTa5n3hQILae1NREjK4Gu/oHvQJZf3euV6j8yKmxzR8IcigglICPvaijUzlOqBbvvEruE+DiqF9SmVUvpAL6d3Z5zu/PeLfa54uxkzCenvcZk2lxzN489kDavpJcc2PtKXZvXZGLtQlb2ZJcDuOglvsxTS7+Ra1/nUT9WoSeZ1rTrm0SfaE8RDKJwIsX6tPF/hdzn9vKYxzOIL9iZax7inrKhcG4Fuo5sCnVLHyUyDtZKyF9Fbb57Cvv5IL0QRVsfupdml3R9s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(346002)(39860400002)(376002)(396003)(366004)(136003)(122000001)(5660300002)(7416002)(478600001)(33716001)(38100700002)(71200400001)(26005)(54906003)(66476007)(66446008)(76116006)(66946007)(8676002)(4326008)(8936002)(6916009)(9686003)(6486002)(2906002)(64756008)(83380400001)(6512007)(186003)(6506007)(86362001)(66556008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?3w0jKwpP7K39hdWvhpittyB6iUEfNMWFJITJCLd4Mi3nNFDP/c44qjda4sIJ?=
 =?us-ascii?Q?OObGYX6TsvN/S8cVgVQTxcKQpnisE2HG5AlPCX3Lpe9zRFE/zVZBboCZL358?=
 =?us-ascii?Q?hsBeeUiBChoFc+j8Sm/1YO73Kj+2JqPV/YGp4UR0mp2k+cjDyUELWVLv6Umw?=
 =?us-ascii?Q?knpe9mh8s9S04usbcIwRU3vqWlJNOhXoZd/n+g/N5Wvui5IJxTW9eaOi88rb?=
 =?us-ascii?Q?1eZVijLG4Sg159GYecTukm+RfyuzGaSG73RWudvlq+C5Cl8dtHh4Kb69XSNY?=
 =?us-ascii?Q?nWKDMfl+/vmGXeWrUdXzL9L29Pz4B7Wmu3ROVWo9UYEO2KzqNXq0w+mJN6MJ?=
 =?us-ascii?Q?UQDCEZBKZCtgVE7b6HJ29c9vrAV+DH5NBSkXzby3oO4DmNjaHUjDE4p4P3uj?=
 =?us-ascii?Q?sfohgbSFt1MVas5EVuZg2JdieoW3se0cT79w48vwBAzUS5Kx4PxFM3Q4rwyB?=
 =?us-ascii?Q?V9JheaHzijjZXAXpA6OPRL0MJ4EJcCPQ/zLRWmrczm6IwmLwCxVOfzHb43UO?=
 =?us-ascii?Q?PZfu1vgIkRHs9n9jod6zfZcHBCQGSn6yYI/cxrL8Unb68d43QH4/3f8cn4Fi?=
 =?us-ascii?Q?4cUdYB7urBIMbj0vkBlFfLek5yG9Q2BuUxetq4Ie9EEwDEjWVZWkClpQJkxO?=
 =?us-ascii?Q?9MVYpvtoRAEraaqWq3YqkuMzVUx8sgTt2Wbp+j5e2dpmmQpJI8+iFg3rkeEk?=
 =?us-ascii?Q?5OKHst1qF4422OrDumsmXA31aNpPbj4O18bK6u3IBueupDFzx222kY2u8Q5r?=
 =?us-ascii?Q?9a2p+w0w6Iwn497tIigsUCoV/ADNNVApHHhmZkAC1iZFIAo4T88Zy+O3fjVc?=
 =?us-ascii?Q?I/+An6JrHGgajAK3F8+Ro8tda6G+ZyklM4+f0Zen75ImTT4usN9BC+BlrKLA?=
 =?us-ascii?Q?MEKSgd0WRKaZJsvHNHybMiRUQqhikJMkdkqdwYSi51IiS5W6GaGN2HU0S4VK?=
 =?us-ascii?Q?CoxVS6RhsKf4nrZVRzDa10tClaM2Sn2Ej7jm9Uf18OzKIiiSNTV+wbtcd2qr?=
 =?us-ascii?Q?GdmdaV8PIvdkIU3knWq/+YA/7xAM2r3dfo8RN6hm82EEViPd/LuDQ28i+kLt?=
 =?us-ascii?Q?UVdlRuklJnuZl5bqbTS8cy7FSWWlucabT3picKVzvBhnRODnDYkH7nNyBC10?=
 =?us-ascii?Q?lA/e9n9A6vWwhsgBRpBv1ZEAjQEx03LCkJ4PY4FtOQdWCL3oNkIoy1KwWl38?=
 =?us-ascii?Q?1a5gduLdn+ly+eiCG6N6MMs3lHLaIlVcc5MlJ4JkFV+GwxGUom6BytHCezqa?=
 =?us-ascii?Q?0PSENfGQtNpHvDpBaIQhu0/03sdIPSwcB/gwabfkBLx3r+TEBps/lXeKJJui?=
 =?us-ascii?Q?BNOxkZqogCUFDPXgMJwinF1Xe0VCXyjCIa/Nr0nSzQZk/g=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AB4E5A37E92E414EB79342395BB51E6C@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b9dcb1-1faf-4392-2d7d-08d91c2882ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 07:17:36.4733 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uewMUJMmcoza1VUbnhSL0iVDkP9F+RUS5Xw8rzd/Z/dtnNtvzfl8mcrUWRSWcwGwPGQPSi+aLP4HzwDHfRK1eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3802
X-Proofpoint-GUID: jRItMSv_qHD7CJ0cWz79JoKG4mexx2LC
X-Proofpoint-ORIG-GUID: jRItMSv_qHD7CJ0cWz79JoKG4mexx2LC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105210045
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

On Mon, May 10, 2021 at 12:41:58AM CDT, Andrew Jeffery wrote:
>Unpack and remove the aspeed_kcs_probe_of_v[12]() functions to aid
>rearranging how the private device-driver memory is allocated.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/kcs_bmc_aspeed.c | 154 ++++++++++++++---------------
> 1 file changed, 76 insertions(+), 78 deletions(-)
>
>diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bm=
c_aspeed.c
>index eefe362f65f0..c94d36e195be 100644
>--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
>+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
>@@ -13,6 +13,7 @@
> #include <linux/module.h>
> #include <linux/of.h>
> #include <linux/of_address.h>
>+#include <linux/of_device.h>
> #include <linux/platform_device.h>
> #include <linux/poll.h>
> #include <linux/regmap.h>
>@@ -63,6 +64,10 @@ struct aspeed_kcs_bmc {
> 	struct regmap *map;
> };
>
>+struct aspeed_kcs_of_ops {
>+	int (*get_channel)(struct platform_device *pdev);
>+	int (*get_io_address)(struct platform_device *pdev);
>+};
>
> static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
> {
>@@ -231,13 +236,10 @@ static const struct kcs_ioreg ast_kcs_bmc_ioregs[KCS=
_CHANNEL_MAX] =3D {
> 	{ .idr =3D LPC_IDR4, .odr =3D LPC_ODR4, .str =3D LPC_STR4 },
> };
>
>-static struct kcs_bmc *aspeed_kcs_probe_of_v1(struct platform_device *pde=
v)
>+static int aspeed_kcs_of_v1_get_channel(struct platform_device *pdev)
> {
>-	struct aspeed_kcs_bmc *priv;
> 	struct device_node *np;
>-	struct kcs_bmc *kcs;
> 	u32 channel;
>-	u32 slave;
> 	int rc;
>
> 	np =3D pdev->dev.of_node;
>@@ -245,105 +247,79 @@ static struct kcs_bmc *aspeed_kcs_probe_of_v1(struc=
t platform_device *pdev)
> 	rc =3D of_property_read_u32(np, "kcs_chan", &channel);
> 	if ((rc !=3D 0) || (channel =3D=3D 0 || channel > KCS_CHANNEL_MAX)) {
> 		dev_err(&pdev->dev, "no valid 'kcs_chan' configured\n");
>-		return ERR_PTR(-EINVAL);
>+		return -EINVAL;
> 	}
>
>-	kcs =3D kcs_bmc_alloc(&pdev->dev, sizeof(struct aspeed_kcs_bmc), channel=
);
>-	if (!kcs)
>-		return ERR_PTR(-ENOMEM);
>+	return channel;
>+}
>
>-	priv =3D kcs_bmc_priv(kcs);
>-	priv->map =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
>-	if (IS_ERR(priv->map)) {
>-		dev_err(&pdev->dev, "Couldn't get regmap\n");
>-		return ERR_PTR(-ENODEV);
>-	}
>+static int aspeed_kcs_of_v1_get_io_address(struct platform_device *pdev)
>+{
>+	u32 slave;
>+	int rc;
>
>-	rc =3D of_property_read_u32(np, "kcs_addr", &slave);
>-	if (rc) {
>+	rc =3D of_property_read_u32(pdev->dev.of_node, "kcs_addr", &slave);
>+	if (rc || slave > 0xffff) {
> 		dev_err(&pdev->dev, "no valid 'kcs_addr' configured\n");
>-		return ERR_PTR(-EINVAL);
>+		return -EINVAL;
> 	}
>
>-	kcs->ioreg =3D ast_kcs_bmc_ioregs[channel - 1];
>-	aspeed_kcs_set_address(kcs, slave);
>-
>-	return kcs;
>-}
>-
>-static int aspeed_kcs_calculate_channel(const struct kcs_ioreg *regs)
>-{
>-	int i;
>-
>-	for (i =3D 0; i < ARRAY_SIZE(ast_kcs_bmc_ioregs); i++) {
>-		if (!memcmp(&ast_kcs_bmc_ioregs[i], regs, sizeof(*regs)))
>-			return i + 1;
>-	}
>-
>-	return -EINVAL;
>+	return slave;
> }
>
>-static struct kcs_bmc *aspeed_kcs_probe_of_v2(struct platform_device *pde=
v)
>+static int aspeed_kcs_of_v2_get_channel(struct platform_device *pdev)
> {
>-	struct aspeed_kcs_bmc *priv;
> 	struct device_node *np;
> 	struct kcs_ioreg ioreg;
>-	struct kcs_bmc *kcs;
> 	const __be32 *reg;
>-	int channel;
>-	u32 slave;
>-	int rc;
>+	int i;
>
> 	np =3D pdev->dev.of_node;
>
> 	/* Don't translate addresses, we want offsets for the regmaps */
> 	reg =3D of_get_address(np, 0, NULL, NULL);
> 	if (!reg)
>-		return ERR_PTR(-EINVAL);
>+		return -EINVAL;
> 	ioreg.idr =3D be32_to_cpup(reg);
>
> 	reg =3D of_get_address(np, 1, NULL, NULL);
> 	if (!reg)
>-		return ERR_PTR(-EINVAL);
>+		return -EINVAL;
> 	ioreg.odr =3D be32_to_cpup(reg);
>
> 	reg =3D of_get_address(np, 2, NULL, NULL);
> 	if (!reg)
>-		return ERR_PTR(-EINVAL);
>+		return -EINVAL;
> 	ioreg.str =3D be32_to_cpup(reg);
>
>-	channel =3D aspeed_kcs_calculate_channel(&ioreg);
>-	if (channel < 0)
>-		return ERR_PTR(channel);
>-
>-	kcs =3D kcs_bmc_alloc(&pdev->dev, sizeof(struct aspeed_kcs_bmc), channel=
);
>-	if (!kcs)
>-		return ERR_PTR(-ENOMEM);
>-
>-	kcs->ioreg =3D ioreg;
>-
>-	priv =3D kcs_bmc_priv(kcs);
>-	priv->map =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
>-	if (IS_ERR(priv->map)) {
>-		dev_err(&pdev->dev, "Couldn't get regmap\n");
>-		return ERR_PTR(-ENODEV);
>+	for (i =3D 0; i < ARRAY_SIZE(ast_kcs_bmc_ioregs); i++) {
>+		if (!memcmp(&ast_kcs_bmc_ioregs[i], &ioreg, sizeof(ioreg)))
>+			return i + 1;
> 	}
>
>-	rc =3D of_property_read_u32(np, "aspeed,lpc-io-reg", &slave);
>-	if (rc)
>-		return ERR_PTR(rc);
>+	return -EINVAL;
>+}
>
>-	aspeed_kcs_set_address(kcs, slave);
>+static int aspeed_kcs_of_v2_get_io_address(struct platform_device *pdev)
>+{
>+	uint32_t slave;
>+	int rc;
>
>-	return kcs;
>+	rc =3D of_property_read_u32(pdev->dev.of_node, "aspeed,lpc-io-reg", &sla=
ve);
>+	if (rc || slave > 0xffff)
>+		return -EINVAL;

The v1 get_io_address() function prints an error in this case; it might
be nice to do so here as well?  (Ideally maintained/extended as
appropriate when this function gets adjusted in patch 16.)

>+
>+	return slave;
> }
>
> static int aspeed_kcs_probe(struct platform_device *pdev)
> {
>+	const struct aspeed_kcs_of_ops *ops;
> 	struct device *dev =3D &pdev->dev;
>+	struct aspeed_kcs_bmc *priv;
> 	struct kcs_bmc *kcs_bmc;
> 	struct device_node *np;
>-	int rc;
>+	int rc, channel, addr;
>
> 	np =3D dev->of_node->parent;
> 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
>@@ -352,23 +328,35 @@ static int aspeed_kcs_probe(struct platform_device *=
pdev)
> 		dev_err(dev, "unsupported LPC device binding\n");
> 		return -ENODEV;
> 	}
>-
>-	np =3D dev->of_node;
>-	if (of_device_is_compatible(np, "aspeed,ast2400-kcs-bmc") ||
>-	    of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc"))
>-		kcs_bmc =3D aspeed_kcs_probe_of_v1(pdev);
>-	else if (of_device_is_compatible(np, "aspeed,ast2400-kcs-bmc-v2") ||
>-		 of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc-v2"))
>-		kcs_bmc =3D aspeed_kcs_probe_of_v2(pdev);
>-	else
>+	ops =3D of_device_get_match_data(&pdev->dev);
>+	if (!ops)
> 		return -EINVAL;
>
>-	if (IS_ERR(kcs_bmc))
>-		return PTR_ERR(kcs_bmc);
>+	channel =3D ops->get_channel(pdev);
>+	if (channel < 0)
>+		return channel;
>
>+	kcs_bmc =3D kcs_bmc_alloc(&pdev->dev, sizeof(struct aspeed_kcs_bmc), cha=
nnel);
>+	if (!kcs_bmc)
>+		return -ENOMEM;
>+
>+	kcs_bmc->ioreg =3D ast_kcs_bmc_ioregs[channel - 1];
> 	kcs_bmc->io_inputb =3D aspeed_kcs_inb;
> 	kcs_bmc->io_outputb =3D aspeed_kcs_outb;
>
>+	addr =3D ops->get_io_address(pdev);
>+	if (addr < 0)
>+		return addr;
>+
>+	priv =3D kcs_bmc_priv(kcs_bmc);
>+	priv->map =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
>+	if (IS_ERR(priv->map)) {
>+		dev_err(&pdev->dev, "Couldn't get regmap\n");
>+		return -ENODEV;
>+	}
>+
>+	aspeed_kcs_set_address(kcs_bmc, addr);
>+
> 	rc =3D aspeed_kcs_config_irq(kcs_bmc, pdev);
> 	if (rc)
> 		return rc;
>@@ -400,11 +388,21 @@ static int aspeed_kcs_remove(struct platform_device =
*pdev)
> 	return 0;
> }
>
>+static const struct aspeed_kcs_of_ops of_v1_ops =3D {
>+	.get_channel =3D aspeed_kcs_of_v1_get_channel,
>+	.get_io_address =3D aspeed_kcs_of_v1_get_io_address,
>+};
>+
>+static const struct aspeed_kcs_of_ops of_v2_ops =3D {
>+	.get_channel =3D aspeed_kcs_of_v2_get_channel,
>+	.get_io_address =3D aspeed_kcs_of_v2_get_io_address,
>+};
>+
> static const struct of_device_id ast_kcs_bmc_match[] =3D {
>-	{ .compatible =3D "aspeed,ast2400-kcs-bmc" },
>-	{ .compatible =3D "aspeed,ast2500-kcs-bmc" },
>-	{ .compatible =3D "aspeed,ast2400-kcs-bmc-v2" },
>-	{ .compatible =3D "aspeed,ast2500-kcs-bmc-v2" },
>+	{ .compatible =3D "aspeed,ast2400-kcs-bmc", .data =3D &of_v1_ops },
>+	{ .compatible =3D "aspeed,ast2500-kcs-bmc", .data =3D &of_v1_ops },
>+	{ .compatible =3D "aspeed,ast2400-kcs-bmc-v2", .data =3D &of_v2_ops },
>+	{ .compatible =3D "aspeed,ast2500-kcs-bmc-v2", .data =3D &of_v2_ops },
> 	{ }
> };
> MODULE_DEVICE_TABLE(of, ast_kcs_bmc_match);
>--=20
>2.27.0
>=
