Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B34CA3592FF
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 05:25:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGk6T44Lwz3bSw
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 13:25:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=M5FQ1gQd;
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
 header.s=selector2-equinixinc-onmicrosoft-com header.b=M5FQ1gQd; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGk671LgJz2y0N;
 Fri,  9 Apr 2021 13:25:18 +1000 (AEST)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1393E3Bd005886; Fri, 9 Apr 2021 03:24:53 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by mx0a-00268f01.pphosted.com with ESMTP id 37t48m2527-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 03:24:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dT/tzs9tIHIVQscUq1pQwPJglC9xfCAyIGBTQg4xbChAsOwGHy9febM7pkJjDKgWpkQHMhdWdtThfN3DBNzqpBIqSFL98V4qf0S+eG4u8AVN37REEsFBHZ+9nnr5txyGIbh8VOos2On7msGPyuj4PWTA9RQBDR0Mn0yjsP/IVOrBFP06h27OwMHbhhq7TzDZ7ZgXA4XhJmlRaRbnqvwOajFdNue3eH4otb9A30hXOq2QOrvOvoExNOlnABZkgD14TrRio83fhcPaGlqMsjmd3lLHZtg57/rDDn6jrrQyFXUKsqgUmEx83sRW5o2ZzjGYXc9cA5IwAMpduXdT6KDUNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puI9Of08Bvq2RmZIwVnJWvsSuz2rIUvnLXEIzRcgKQk=;
 b=S4da+BCNnKpt9n9mWIh0mW217nb8gEOIPLZEKRz6SLqQnH/ffwS7/uaWm1ZQxA/Rk6BE5RBSwG+hMmP8J+KScAUFTVR2W3HFWrWkAyGGlsPoBAVsGKzNtbwhht23oeHobV0NGDl+/5IWk7JkfVYkL62R/kVRUDrtnf9pZpfiy4jtRhYsJNFflVdq29Jw1Eb8zYoOxjFln6NBZ9KLfYaqHgL4Tq14fkYuyQDN3c6xovojNXe4eZ4qMvfPVKLSgkOCwNpKijTEIT2TW+mS4bcEpEJenaPh5XwRvi18eWRvk1fCVZkzvIIRVtxg+yPXXxzxBmYFXznvvPHBJgqB8nZG5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puI9Of08Bvq2RmZIwVnJWvsSuz2rIUvnLXEIzRcgKQk=;
 b=M5FQ1gQdQbcPc/xnq8hS3aY5rdlj+IsniKfq9qntJ/QL5oeSwO7Eg8up4h5BFR46eTg4+08yYxgrIlfxzXfnMe8199lp+XtkeS8tGZnkjm9VoVfepw/KjlWcNnhVv35uCRwjlQl5aOBUAealM4AKjuYL3fL8ga+ZidGyZrzpH+c=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB5529.namprd04.prod.outlook.com (2603:10b6:5:126::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17; Fri, 9 Apr 2021 03:24:50 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 03:24:49 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 06/21] ipmi: kcs_bmc_aspeed: Use of match data to
 extract KCS properties
Thread-Topic: [PATCH v2 06/21] ipmi: kcs_bmc_aspeed: Use of match data to
 extract KCS properties
Thread-Index: AQHXLO/laSPW33XXTECWMoGMxDw/aQ==
Date: Fri, 9 Apr 2021 03:24:49 +0000
Message-ID: <YG/JAGZmzu7TlCxa@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-6-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-6-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b0b5c8c-bdaa-464d-1684-08d8fb070873
x-ms-traffictypediagnostic: DM6PR04MB5529:
x-microsoft-antispam-prvs: <DM6PR04MB5529AEED5BDB1A5DA6E94230C3739@DM6PR04MB5529.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nSby5m52PgkcLkFWNtzCLJg24Dv3jL1Dq1GHP6Wldrnh/b6P+jhVs4kr+wvtDnDPdQPOwm8NRhMeJqjaee/a1hzRRFat2ZUmAjwamIeE86ATx2Uh0qFqjUav82aGrBBjQpqdTCAcnk3QyronB0NfWJcugce8leE2B/DNyaVMtwlMpCNq9cJHyXzDHQnJEzfWvNyGwYRzdutmWzxGH0mfBlPpE3drubSi+JzvmewQbvgnUoYIfXxzqb68oyGJfj0iJg/63J8bUFBthrmjqgtMbCrS7a+tfYbDqNNN083nSuO84zf5MgwHDqA10dZmpwDDKor89lE8FOi3o0JsZWLMB3DAZd5vJKyo+f0NWFN2qs5siVfBLXIYiDXonzX8X06ceiOT2IGtwA6qt0yp+nboKv6JFAkoOuzWuL6o5zmWTdxgWZYgKF2d/NCZsvutJSHsr0j731dKm1aQeu3Rr3q+0VX1mKHDXtbsaHg+0QAmnKSyjoqHbfAaV9wekUgyO5Qsvf4Cy+33b2N01QR0/v88632Bxa9rbgopBocGviUEjifv3B4++n1usoI/0LWYTBgzeehH3GZ1iUGy0A3hh4t+vGgwb7+WvUjNo+wvnjvUKmpPZqHoBaXg5klxlwMjCts7xtF/JtNFANKt0hrlbxsdE76YclLFJeG0/mS/b9tXwB0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(8676002)(71200400001)(76116006)(6506007)(64756008)(86362001)(5660300002)(66946007)(478600001)(6916009)(66476007)(9686003)(26005)(66556008)(66446008)(2906002)(38100700001)(6512007)(186003)(7416002)(4326008)(83380400001)(6486002)(316002)(54906003)(8936002)(33716001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?w/wfyfPn2DidWuvFvxYfpvbmhnPYrzIBmPQniIgKU+X2V6KUtJRY5SPl6O/Q?=
 =?us-ascii?Q?9UqzZLQOFHAQYBg6ZR65D2OGpbxh6hJrs/y3XzIWOYxEIf1tiTDFt8T4s0uD?=
 =?us-ascii?Q?uj9KsIJd0ELw9wYDOmjNW46SyzBtG5U5DMih+rLZ3+CytALoFboERKqoobHw?=
 =?us-ascii?Q?nrJwwdlgcEeZL/KA3vAljKgGuqfu5kNicULrBo8OcnEJoOBGlyb4xi7uciM1?=
 =?us-ascii?Q?4Uh81ITvJFHQ5eKQFKlVAWzjKfZfLu978gJMItE6chldcZ8bucR+7Z7tzDhw?=
 =?us-ascii?Q?XmYSHj6ndT52ZvvyNeZLEWVpVXAALqy8GMHPOu68aD5Vr9Oy4s47D6ePeDSc?=
 =?us-ascii?Q?cV8772oyg2pmfJT0HYYZO1N7elTyjwSBDW8qc0OYO/A86W0eoyvZxEtfkICd?=
 =?us-ascii?Q?igPipWb5aqkdYklYAYW4FFr39UW4Ot/DPvJoJkyhHq3hNPuHKzl80lcvQPuQ?=
 =?us-ascii?Q?dmXOCjk/Spu9dlnipYZfSuJ10B2P9618yIQh4MO9OfkKCrq1VBq7Hp/2MLhc?=
 =?us-ascii?Q?wWvizkxBWmnQrhpgwoOMgB8792wIUnMCqrDGqfO1kQvepTs0EHjlo5nNeWmd?=
 =?us-ascii?Q?Ego1esoTsSjF98jBDHWV8d4/DkqAPnh8xpDTgeK1q7I3B65/J5/47e23/IBF?=
 =?us-ascii?Q?FT6CI/rRN6Gvkffs9Z3MoLIRg3ySWnFDqih14o7aNzWQroFaxSMAVGI00nZo?=
 =?us-ascii?Q?JHqqXhbqBS66nLhbfrbN6ME4ewi8vwIlU60LE4LN5G3mgNhKlcxQm0wAkTHA?=
 =?us-ascii?Q?u7JCZn7nJODshIjNTpD/Wf1ED4gX4YjrZtaa0zU/2h4AnJZ9Yee1dQsoTRh0?=
 =?us-ascii?Q?kezHIT+6qAoVX1+Tzju5a/cn41GpTU5023TNA5h/dz6D0bF+9YZ+8uA/WGTQ?=
 =?us-ascii?Q?A/DvHQ8eLGI9QF3GmCZFXdQOfO/vHSzHwfUVDtXM4aP0OO1UIrq+jLDgidYU?=
 =?us-ascii?Q?etdZmKKIySuHcCgKR4Smt05WvXIFVVwdLaGfZoAP6sIWi4Usos/vVZViAIf2?=
 =?us-ascii?Q?228ESdIZh4cbo0pUAupWl/AoJIcODyTqn4XS0IZWtxGwZ6WoIpkOidREom2v?=
 =?us-ascii?Q?yZz3F/DgNs0MNIJJYrdPDdf8J9gKLpKfwFijRtizXuh3r81wenejlAoOYypg?=
 =?us-ascii?Q?NI4+hanpNcb2hWVDviySYSJRLrRxgh+czKQSN7Nme6rJwEQFGJXpzBSAkk2J?=
 =?us-ascii?Q?bp8QICxguBwsJ6VxGxNCYqjVDDwitBVY8KBAmlQH1lamfRX2jKg7k6TrPQb+?=
 =?us-ascii?Q?b/8vSDdLOKEp7pxxJNEldVqYrW38PeFWfdnR+y0+V0wotM3SEJlOZWLTNEQs?=
 =?us-ascii?Q?GLtwK6gyeL30/za/hxPb35zx?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0A8A8B656471C248B37DDB17541B8A97@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0b5c8c-bdaa-464d-1684-08d8fb070873
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 03:24:49.7038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPmYkrV+vYq2k2EsuqhCiF7aQFmhJVGZk6zsk1uJQK2pLMBzJaXnWPbvbrGVR7sgTimLzckgFkufCqtGmMqwZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5529
X-Proofpoint-ORIG-GUID: Rg3C8iB74isnaDoFE0CO_B4M0fZWr-QO
X-Proofpoint-GUID: Rg3C8iB74isnaDoFE0CO_B4M0fZWr-QO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_12:2021-04-08,
 2021-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 mlxscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090023
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

On Fri, Mar 19, 2021 at 01:27:37AM CDT, Andrew Jeffery wrote:
>Unpack and remove the aspeed_kcs_probe_of_v[12]() functions to aid
>rearranging how the private device-driver memory is allocated.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/kcs_bmc_aspeed.c | 146 ++++++++++++++---------------
> 1 file changed, 68 insertions(+), 78 deletions(-)
>
>diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bm=
c_aspeed.c
>index eefe362f65f0..061f53676206 100644
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
>@@ -245,105 +247,78 @@ static struct kcs_bmc *aspeed_kcs_probe_of_v1(struc=
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

Did some patches perhaps get a bit jumbled during a rebase here or
something?  This patch removes the only initialization of priv->map
I can see, with patch #10 later reintroducing it, but in the interim
it seems like it would be in a fairly broken state (I'm guessing its
removal wasn't really intended to be part of this).

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
>+
>+	return slave;
> }
>
> static int aspeed_kcs_probe(struct platform_device *pdev)
> {
>+	const struct aspeed_kcs_of_ops *ops;
> 	struct device *dev =3D &pdev->dev;
> 	struct kcs_bmc *kcs_bmc;
> 	struct device_node *np;
>-	int rc;
>+	int rc, channel, addr;
>
> 	np =3D dev->of_node->parent;
> 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
>@@ -352,23 +327,28 @@ static int aspeed_kcs_probe(struct platform_device *=
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
>+	aspeed_kcs_set_address(kcs_bmc, addr);
>+
> 	rc =3D aspeed_kcs_config_irq(kcs_bmc, pdev);
> 	if (rc)
> 		return rc;
>@@ -400,11 +380,21 @@ static int aspeed_kcs_remove(struct platform_device =
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
