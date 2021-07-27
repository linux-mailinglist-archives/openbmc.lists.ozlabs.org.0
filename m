Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C841F3D7EE5
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 22:11:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZ7GZ4Thxz3cc2
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 06:11:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=X5Nd58w3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=8842907869=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=X5Nd58w3; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZ7G93ZQHz302m;
 Wed, 28 Jul 2021 06:10:56 +1000 (AEST)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16RJs78G026472; Tue, 27 Jul 2021 20:10:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by mx0b-00268f01.pphosted.com with ESMTP id 3a2nx1grt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 20:10:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKJLNuyjYfMGFEcEbgZRRgEwKg3dZal1/KoDUplOI+FazAZspznCEJ5XjG3g+Juc1+dHV0mAtwNCGe5SIUkm46PMjKmqqWbnCf0rMeeyYOnpZ8j6qylAqsDFAKRjQRrXgQomKX9kYShqkkcUzW2rZHG4imexNhsr/OZhljcdEplVhnnc1llLIhw0HOmOOCYPzaCYz1tNW1x94rJdhvR7tK5qkfFF4GKD9+DdwYuNupOsRDbp/mzkvDGL4lwhyO99K00LUDSf2si+9mPO7mojuTjiMr7KrUfLgcFRTiry3T06m6CM6X3h38RGu+rbRv9cmQ5fiQOn/MpS1vCToKb47w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhwYHuIR1qpv5wGArlYls7EDeJDuHFeOLK91sGdR5DA=;
 b=fn1hrpB+PRCE0356sBOKRMyYwlEeF+82apVuGbejBmlYdPTlYNGJgiVGIotwjUI1jx6w/2UMPPbc79s9Inhc4nnF9dyDMaGc9N2AnwHa87loWDpzNS3PF1p2s3gM3SR6H6hmLkdsBWJR/H9UIclJziZFU5eX0yDSwPUfKOIFPnJSUZozRgpTPW6Bze/5DYMBvuGmabcEBGeW6Ekvq8Yb4LgiPXndTXdV+XZm3AsxZabmrwORIwML+a6kd2UHaWAfATVZbje/En+CPcLysVPmAHU+8+5b+UvbAdl7npdwpRPjVn7pZi3T7z2GQNs9JUYiUySF7VldRGfddC54wI8zEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhwYHuIR1qpv5wGArlYls7EDeJDuHFeOLK91sGdR5DA=;
 b=X5Nd58w3MVczki5C9TY6b0oo1Gz0YM+BJ5ptchYKYyo4YDWMIzExZIfVNZQBQguzTqZd1Tkz6mwV55/axzZpFNpKPCgiwqL9n/2Dd4RB7R9WP7qOYhzItPS9rqACyxVBhF5djFCETckdg5cySUXrKp+tV9mo2GaYJLjY+LM+XyU=
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7912.namprd04.prod.outlook.com (2603:10b6:5:315::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 20:10:29 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b%5]) with mapi id 15.20.4373.018; Tue, 27 Jul 2021
 20:10:29 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH 09/14] peci: Add support for PECI device drivers
Thread-Topic: [PATCH 09/14] peci: Add support for PECI device drivers
Thread-Index: AQHXgyNyOfnUTEQoM0K8bE1+mPB05Q==
Date: Tue, 27 Jul 2021 20:10:29 +0000
Message-ID: <20210727201028.GS8018@packtop>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-10-iwona.winiarska@intel.com>
In-Reply-To: <20210712220447.957418-10-iwona.winiarska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35ec6c8a-4d36-4d01-deb1-08d9513a94b3
x-ms-traffictypediagnostic: DM8PR04MB7912:
x-microsoft-antispam-prvs: <DM8PR04MB791213770C20310DA89F62B8C3E99@DM8PR04MB7912.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pSMLu0cZopmiMw+qQi1nh2V5Oj/27iNFTHffHar6HuX9+Oq2TWAbrJL6brMm4k7GEfh7uP+mN+4YH5OMOKO3zlpViCJY/RfSzjc5JUJPj+z8MB5uPbnhb24ta8RcH9w9NnYCdwL+mAmAlECa55ywS1kuICy3dzKzsPP0h726gBetIhHLj9AL4Nm68byyD/s2OHejWmd4Jo7rA3KhYFlo7dLMsMIjFo9qtBbr/bCzj4gp1U1u1xXnWgrbD/zaWqQj69V+UFAk4LTX+cH1sm7AEBmExCVk5EMy5Fn5EWOPOvpxtGnButP9cAE7DM4tWTehGVva+EejKKqCQemHHnuY3hZTlICUxjO2p0GMuiFB2UNCw6g90Tuj0/vOjFVWvzcKFmDGpVPj6ngkTM3Tr0qNhIiTQrtoKdPgcFn373um3yEALxANZLgD+ol9n4lIi6DvTW/d4x4PBJKyYif7I0t7n4JjS+eNi9BFjgxzHOxyUhzj0wtiKyoX3QFLYfO+GXfV2BqfaE8CYOwFX3FnRcBeZ0SdiJRc681d2efSQDoz4XS0Yf5JauLvT+FcF209xU6Db5KwQkfrAQ6HFgQhOoclaVZAKRm7bhEHi/UWbLqjOPgFEBfgParxGZB0pLfP2EydkVrCR2JO5VumWYL1TkDRqxN4TeZCnYfHxzMBHMlcjqURAuSUsZrnJI7JRGWusDICq2sMBeRnKfTkgFNIpalP6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(346002)(136003)(396003)(39860400002)(376002)(6506007)(4326008)(7416002)(8936002)(66476007)(478600001)(66446008)(66556008)(66946007)(86362001)(122000001)(30864003)(26005)(186003)(38100700002)(33716001)(9686003)(64756008)(6512007)(71200400001)(33656002)(1076003)(2906002)(6486002)(54906003)(316002)(76116006)(5660300002)(8676002)(83380400001)(6916009)(38070700005)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d0lNJb1HbhBMajbIEiKGsc5+O7VH8PayKRYnOhg6+mWmrn0tLFwKTGwO+G4X?=
 =?us-ascii?Q?kc0jJIzKZfH9pqcg7bZyu/BtWlCV+6Ym02VMldsYdILAiyCI1zJM1k/9wItx?=
 =?us-ascii?Q?kzmvhd3TDJXXcrl7rvEr0vMennOAFdkxT/2Qp+fGV3fgHvFPR9wEt+rWAzuw?=
 =?us-ascii?Q?KIM1iRVH6Bcaa2/ueiHtAKh3aRKe5YjezhgqnpT+aZSOOJvMgaJH5an9JlGh?=
 =?us-ascii?Q?5A3DPj+ovCywNCkSR7kMGD+Y5gIwElYSX8c2vFH0nqgYWv0ReaPF+/HbnRPe?=
 =?us-ascii?Q?h8y9/DZnvuWEf7ekvSZwMEK4h7OsgI2wBYvZMoShKvhBXBvH/IuCrGFJtAvS?=
 =?us-ascii?Q?OvR/D3WdrJHl/FHrcMm4Q3b86C2KWXQHbe6BzFfbKe4wM4bT4K8dEqsz8TJA?=
 =?us-ascii?Q?+glCz8o9RH2YTjCrsXkRpCRCvNIZCtVPepXDctIfH8nTNy9Fu/dIPTLWHw9G?=
 =?us-ascii?Q?OubqLfePa3oyeRwxu7LTrqWHANMrEz9xu+/5WY1GJ6pAdH39CxN0Huvgdm36?=
 =?us-ascii?Q?dSwkSRxhVPbFpCUmYLAuLCq9FFVN/VdAVX/D/HJ/od8XDhfnPs7dSBrgds50?=
 =?us-ascii?Q?w5dCtBO6X4k/iLEC/b/LaIxuEmWKCU2sO3WFnAftuUeeuzEeuLvsvOthb0oT?=
 =?us-ascii?Q?Tr3pOX9CKgUUOnsDn8sJhRxGbxeGJScVbUhKxR66srfHnZYIZQwuq6FMuL94?=
 =?us-ascii?Q?9dkBlEDXnhkuGFHTULDmzOTkVgy6IaHFj8gDz2Tuk4DAcATPy5UXr0YiEjSp?=
 =?us-ascii?Q?SqljpEwRHedXHpEqFjQm3KTvs/hCgXDzyq819OlE+48fwWTMGM+omduwyVOC?=
 =?us-ascii?Q?hIWmBQmLEyRRRh1vKx4iJJ2tkdRJFCU5iVw2cXYfpvG/Zsgb5Lj3lj2GyH8e?=
 =?us-ascii?Q?eEh/KUcgQgIvSgAsttRCFA9fP283ODEAL9vG7b/zXFs+O3t4hQhYWT+FTIVJ?=
 =?us-ascii?Q?g9+79H0doO42ppsLaTQuyRpKWJr2Voa1CFZGnkuoVfB/XCAkqq++dtj+S/QC?=
 =?us-ascii?Q?sBsNXFeuiKIW89eDOo9MxhOGdev7+TNdEJ6evPSclAUPbkcCMa/UY+MLyyPv?=
 =?us-ascii?Q?w2T+Q1Koz408ASRuDFfZ+EWMj0i/uEQieNOJduamZbY8aH1ZxGZ89C9anmRM?=
 =?us-ascii?Q?KjXt/aOE7nTBWvFH0mZmRMyHtB5Vea1gfvkIEfByuB4iAWBR4c9pbFFzBsm6?=
 =?us-ascii?Q?zG7sr80HknTrAc+c1FCQyP12K+ErerKJ1rHKi+LPZvF84Y8GGs51cKxbFLhx?=
 =?us-ascii?Q?jAW9u6KvDCntpt2aoolJ41sixLogU32PpdNQk4OwjFe9vx+HXgkjtuYLslCj?=
 =?us-ascii?Q?uChGMjRKKp3GyX7Bqj1390ra?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <35F41C666C8D0945AF7367B4A5FAC99E@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ec6c8a-4d36-4d01-deb1-08d9513a94b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 20:10:29.3508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p9yfOPaQpDYY65/Oz7nKp3HR+zYtC+6q9m5Y4NRZPBAQm6cupGqI+IlB5tUaQc0BIj4rDkw6+m0oE3t0EnV1iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7912
X-Proofpoint-GUID: JRvnJ6ezFKA5ePY2-rIGNxd2rJ189uLa
X-Proofpoint-ORIG-GUID: JRvnJ6ezFKA5ePY2-rIGNxd2rJ189uLa
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_13:2021-07-27,
 2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270118
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yazen Ghannam <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 12, 2021 at 05:04:42PM CDT, Iwona Winiarska wrote:
>Here we're adding support for PECI device drivers, which unlike PECI
>controller drivers are actually able to provide functionalities to
>userspace.
>
>We're also extending peci_request API to allow querying more details
>about PECI device (e.g. model/family), that's going to be used to find
>a compatible peci_driver.
>
>Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>---
> drivers/peci/Kconfig    |   1 +
> drivers/peci/core.c     |  49 +++++++++
> drivers/peci/device.c   |  99 ++++++++++++++++++
> drivers/peci/internal.h |  75 ++++++++++++++
> drivers/peci/request.c  | 217 ++++++++++++++++++++++++++++++++++++++++
> include/linux/peci.h    |  19 ++++
> lib/Kconfig             |   2 +-
> 7 files changed, 461 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
>index 0d0ee8009713..27c31535843c 100644
>--- a/drivers/peci/Kconfig
>+++ b/drivers/peci/Kconfig
>@@ -2,6 +2,7 @@
>
> menuconfig PECI
> 	tristate "PECI support"
>+	select GENERIC_LIB_X86
> 	help
> 	  The Platform Environment Control Interface (PECI) is an interface
> 	  that provides a communication channel to Intel processors and
>diff --git a/drivers/peci/core.c b/drivers/peci/core.c
>index ae7a9572cdf3..94426b7f2618 100644
>--- a/drivers/peci/core.c
>+++ b/drivers/peci/core.c
>@@ -143,8 +143,57 @@ void peci_controller_remove(struct peci_controller *c=
ontroller)
> }
> EXPORT_SYMBOL_NS_GPL(peci_controller_remove, PECI);
>
>+static const struct peci_device_id *
>+peci_bus_match_device_id(const struct peci_device_id *id, struct peci_dev=
ice *device)
>+{
>+	while (id->family !=3D 0) {
>+		if (id->family =3D=3D device->info.family &&
>+		    id->model =3D=3D device->info.model)
>+			return id;
>+		id++;
>+	}
>+
>+	return NULL;
>+}
>+
>+static int peci_bus_device_match(struct device *dev, struct device_driver=
 *drv)
>+{
>+	struct peci_device *device =3D to_peci_device(dev);
>+	struct peci_driver *peci_drv =3D to_peci_driver(drv);
>+
>+	if (dev->type !=3D &peci_device_type)
>+		return 0;
>+
>+	if (peci_bus_match_device_id(peci_drv->id_table, device))
>+		return 1;
>+
>+	return 0;
>+}
>+
>+static int peci_bus_device_probe(struct device *dev)
>+{
>+	struct peci_device *device =3D to_peci_device(dev);
>+	struct peci_driver *driver =3D to_peci_driver(dev->driver);
>+
>+	return driver->probe(device, peci_bus_match_device_id(driver->id_table, =
device));
>+}
>+
>+static int peci_bus_device_remove(struct device *dev)
>+{
>+	struct peci_device *device =3D to_peci_device(dev);
>+	struct peci_driver *driver =3D to_peci_driver(dev->driver);
>+
>+	if (driver->remove)
>+		driver->remove(device);
>+
>+	return 0;
>+}
>+
> struct bus_type peci_bus_type =3D {
> 	.name		=3D "peci",
>+	.match		=3D peci_bus_device_match,
>+	.probe		=3D peci_bus_device_probe,
>+	.remove		=3D peci_bus_device_remove,
> 	.bus_groups	=3D peci_bus_groups,
> };
>
>diff --git a/drivers/peci/device.c b/drivers/peci/device.c
>index 1124862211e2..8c4bd1ebbc29 100644
>--- a/drivers/peci/device.c
>+++ b/drivers/peci/device.c
>@@ -1,11 +1,79 @@
> // SPDX-License-Identifier: GPL-2.0-only
> // Copyright (c) 2018-2021 Intel Corporation
>
>+#include <linux/bitfield.h>
> #include <linux/peci.h>
> #include <linux/slab.h>
>+#include <linux/x86/cpu.h>
>
> #include "internal.h"
>
>+#define REVISION_NUM_MASK GENMASK(15, 8)
>+static int peci_get_revision(struct peci_device *device, u8 *revision)
>+{
>+	struct peci_request *req;
>+	u64 dib;
>+
>+	req =3D peci_get_dib(device);
>+	if (IS_ERR(req))
>+		return PTR_ERR(req);
>+
>+	dib =3D peci_request_data_dib(req);
>+	if (dib =3D=3D 0) {
>+		peci_request_free(req);
>+		return -EIO;

Any particular reason to check for zero specifically here?  It looks
like that would be a case where the host CPU responds and everything's
otherwise fine, but the host just happened to send back a bunch of zeros
for whatever reason -- which may not be a valid PECI revision number,
but if it sent back a bunch of 0xff bytes instead wouldn't that be
equally invalid?

Also, given that the docs (the ones I have, at least) describe the DIB
as a collection of individual bytes, dealing with it as a combined u64
seems a bit confusing to me -- could we just return req->rx.buf[1]
instead?

>+	}
>+
>+	*revision =3D FIELD_GET(REVISION_NUM_MASK, dib);
>+
>+	peci_request_free(req);
>+
>+	return 0;
>+}
>+
>+static int peci_get_cpu_id(struct peci_device *device, u32 *cpu_id)
>+{
>+	struct peci_request *req;
>+	int ret;
>+
>+	req =3D peci_pkg_cfg_readl(device, PECI_PCS_PKG_ID, PECI_PKG_ID_CPU_ID);
>+	if (IS_ERR(req))
>+		return PTR_ERR(req);
>+
>+	ret =3D peci_request_status(req);
>+	if (ret)
>+		goto out_req_free;
>+
>+	*cpu_id =3D peci_request_data_readl(req);
>+out_req_free:

As suggested on patch #8, I think it might be cleaner to stack-allocate
struct peci_request, which would obviate the need for explicit free
calls in functions like this and hence might simplify it away entirely,
but if this does remain like this we could just do

	if (!ret)
		*cpu_id =3D peci_request_data_readl(req);

instead of using a goto to skip a single line.

>+	peci_request_free(req);
>+
>+	return ret;
>+}
>+
>+static int peci_device_info_init(struct peci_device *device)
>+{
>+	u8 revision;
>+	u32 cpu_id;
>+	int ret;
>+
>+	ret =3D peci_get_cpu_id(device, &cpu_id);
>+	if (ret)
>+		return ret;
>+
>+	device->info.family =3D x86_family(cpu_id);
>+	device->info.model =3D x86_model(cpu_id);
>+
>+	ret =3D peci_get_revision(device, &revision);
>+	if (ret)
>+		return ret;
>+	device->info.peci_revision =3D revision;
>+
>+	device->info.socket_id =3D device->addr - PECI_BASE_ADDR;
>+
>+	return 0;
>+}
>+
> static int peci_detect(struct peci_controller *controller, u8 addr)
> {
> 	struct peci_request *req;
>@@ -75,6 +143,10 @@ int peci_device_create(struct peci_controller *control=
ler, u8 addr)
> 	device->dev.bus =3D &peci_bus_type;
> 	device->dev.type =3D &peci_device_type;
>
>+	ret =3D peci_device_info_init(device);
>+	if (ret)
>+		goto err_free;
>+
> 	ret =3D dev_set_name(&device->dev, "%d-%02x", controller->id, device->ad=
dr);
> 	if (ret)
> 		goto err_free;
>@@ -98,6 +170,33 @@ void peci_device_destroy(struct peci_device *device)
> 	device_unregister(&device->dev);
> }
>
>+int __peci_driver_register(struct peci_driver *driver, struct module *own=
er,
>+			   const char *mod_name)
>+{
>+	driver->driver.bus =3D &peci_bus_type;
>+	driver->driver.owner =3D owner;
>+	driver->driver.mod_name =3D mod_name;
>+
>+	if (!driver->probe) {
>+		pr_err("peci: trying to register driver without probe callback\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!driver->id_table) {
>+		pr_err("peci: trying to register driver without device id table\n");
>+		return -EINVAL;
>+	}
>+
>+	return driver_register(&driver->driver);
>+}
>+EXPORT_SYMBOL_NS_GPL(__peci_driver_register, PECI);
>+
>+void peci_driver_unregister(struct peci_driver *driver)
>+{
>+	driver_unregister(&driver->driver);
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_driver_unregister, PECI);
>+
> static void peci_device_release(struct device *dev)
> {
> 	struct peci_device *device =3D to_peci_device(dev);
>diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
>index 6b139adaf6b8..c891c93e077a 100644
>--- a/drivers/peci/internal.h
>+++ b/drivers/peci/internal.h
>@@ -19,6 +19,34 @@ struct peci_request;
> struct peci_request *peci_request_alloc(struct peci_device *device, u8 tx=
_len, u8 rx_len);
> void peci_request_free(struct peci_request *req);
>
>+int peci_request_status(struct peci_request *req);
>+u64 peci_request_data_dib(struct peci_request *req);
>+
>+u8 peci_request_data_readb(struct peci_request *req);
>+u16 peci_request_data_readw(struct peci_request *req);
>+u32 peci_request_data_readl(struct peci_request *req);
>+u64 peci_request_data_readq(struct peci_request *req);
>+
>+struct peci_request *peci_get_dib(struct peci_device *device);
>+struct peci_request *peci_get_temp(struct peci_device *device);
>+
>+struct peci_request *peci_pkg_cfg_readb(struct peci_device *device, u8 in=
dex, u16 param);
>+struct peci_request *peci_pkg_cfg_readw(struct peci_device *device, u8 in=
dex, u16 param);
>+struct peci_request *peci_pkg_cfg_readl(struct peci_device *device, u8 in=
dex, u16 param);
>+struct peci_request *peci_pkg_cfg_readq(struct peci_device *device, u8 in=
dex, u16 param);
>+
>+/**
>+ * struct peci_device_id - PECI device data to match
>+ * @data: pointer to driver private data specific to device
>+ * @family: device family
>+ * @model: device model
>+ */
>+struct peci_device_id {
>+	const void *data;
>+	u16 family;
>+	u8 model;
>+};
>+
> extern struct device_type peci_device_type;
> extern const struct attribute_group *peci_device_groups[];
>
>@@ -28,6 +56,53 @@ void peci_device_destroy(struct peci_device *device);
> extern struct bus_type peci_bus_type;
> extern const struct attribute_group *peci_bus_groups[];
>
>+/**
>+ * struct peci_driver - PECI driver
>+ * @driver: inherit device driver
>+ * @probe: probe callback
>+ * @remove: remove callback
>+ * @id_table: PECI device match table to decide which device to bind
>+ */
>+struct peci_driver {
>+	struct device_driver driver;
>+	int (*probe)(struct peci_device *device, const struct peci_device_id *id=
);
>+	void (*remove)(struct peci_device *device);
>+	const struct peci_device_id *id_table;
>+};
>+
>+static inline struct peci_driver *to_peci_driver(struct device_driver *d)
>+{
>+	return container_of(d, struct peci_driver, driver);
>+}
>+
>+int __peci_driver_register(struct peci_driver *driver, struct module *own=
er,
>+			   const char *mod_name);
>+/**
>+ * peci_driver_register() - register PECI driver
>+ * @driver: the driver to be registered
>+ * @owner: owner module of the driver being registered
>+ * @mod_name: module name string
>+ *
>+ * PECI drivers that don't need to do anything special in module init sho=
uld
>+ * use the convenience "module_peci_driver" macro instead
>+ *
>+ * Return: zero on success, else a negative error code.
>+ */
>+#define peci_driver_register(driver) \
>+	__peci_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
>+void peci_driver_unregister(struct peci_driver *driver);
>+
>+/**
>+ * module_peci_driver() - Helper macro for registering a modular PECI dri=
ver
>+ * @__peci_driver: peci_driver struct
>+ *
>+ * Helper macro for PECI drivers which do not do anything special in modu=
le
>+ * init/exit. This eliminates a lot of boilerplate. Each module may only
>+ * use this macro once, and calling it replaces module_init() and module_=
exit()
>+ */
>+#define module_peci_driver(__peci_driver) \
>+	module_driver(__peci_driver, peci_driver_register, peci_driver_unregiste=
r)
>+
> extern struct device_type peci_controller_type;
>
> int peci_controller_scan_devices(struct peci_controller *controller);
>diff --git a/drivers/peci/request.c b/drivers/peci/request.c
>index 78cee51dfae1..48354455b554 100644
>--- a/drivers/peci/request.c
>+++ b/drivers/peci/request.c
>@@ -1,13 +1,142 @@
> // SPDX-License-Identifier: GPL-2.0-only
> // Copyright (c) 2021 Intel Corporation
>
>+#include <linux/bug.h>
> #include <linux/export.h>
> #include <linux/peci.h>
> #include <linux/slab.h>
> #include <linux/types.h>
>
>+#include <asm/unaligned.h>
>+
> #include "internal.h"
>
>+#define PECI_GET_DIB_CMD		0xf7
>+#define  PECI_GET_DIB_WR_LEN		1
>+#define  PECI_GET_DIB_RD_LEN		8
>+
>+#define PECI_RDPKGCFG_CMD		0xa1
>+#define  PECI_RDPKGCFG_WRITE_LEN	5
>+#define  PECI_RDPKGCFG_READ_LEN_BASE	1
>+#define PECI_WRPKGCFG_CMD		0xa5
>+#define  PECI_WRPKGCFG_WRITE_LEN_BASE	6
>+#define  PECI_WRPKGCFG_READ_LEN		1
>+
>+/* Device Specific Completion Code (CC) Definition */
>+#define PECI_CC_SUCCESS				0x40
>+#define PECI_CC_NEED_RETRY			0x80
>+#define PECI_CC_OUT_OF_RESOURCE			0x81
>+#define PECI_CC_UNAVAIL_RESOURCE		0x82
>+#define PECI_CC_INVALID_REQ			0x90
>+#define PECI_CC_MCA_ERROR			0x91
>+#define PECI_CC_CATASTROPHIC_MCA_ERROR		0x93
>+#define PECI_CC_FATAL_MCA_ERROR			0x94
>+#define PECI_CC_PARITY_ERR_GPSB_OR_PMSB		0x98
>+#define PECI_CC_PARITY_ERR_GPSB_OR_PMSB_IERR	0x9B
>+#define PECI_CC_PARITY_ERR_GPSB_OR_PMSB_MCA	0x9C
>+
>+#define PECI_RETRY_BIT			BIT(0)
>+
>+#define PECI_RETRY_TIMEOUT		msecs_to_jiffies(700)
>+#define PECI_RETRY_INTERVAL_MIN		msecs_to_jiffies(1)
>+#define PECI_RETRY_INTERVAL_MAX		msecs_to_jiffies(128)
>+
>+static u8 peci_request_data_cc(struct peci_request *req)
>+{
>+	return req->rx.buf[0];
>+}
>+
>+/**
>+ * peci_request_status() - return -errno based on PECI completion code
>+ * @req: the PECI request that contains response data with completion cod=
e
>+ *
>+ * It can't be used for Ping(), GetDIB() and GetTemp() - for those comman=
ds we
>+ * don't expect completion code in the response.
>+ *
>+ * Return: -errno
>+ */
>+int peci_request_status(struct peci_request *req)
>+{
>+	u8 cc =3D peci_request_data_cc(req);
>+
>+	if (cc !=3D PECI_CC_SUCCESS)
>+		dev_dbg(&req->device->dev, "ret: %#02x\n", cc);
>+
>+	switch (cc) {
>+	case PECI_CC_SUCCESS:
>+		return 0;
>+	case PECI_CC_NEED_RETRY:
>+	case PECI_CC_OUT_OF_RESOURCE:
>+	case PECI_CC_UNAVAIL_RESOURCE:
>+		return -EAGAIN;
>+	case PECI_CC_INVALID_REQ:
>+		return -EINVAL;
>+	case PECI_CC_MCA_ERROR:
>+	case PECI_CC_CATASTROPHIC_MCA_ERROR:
>+	case PECI_CC_FATAL_MCA_ERROR:
>+	case PECI_CC_PARITY_ERR_GPSB_OR_PMSB:
>+	case PECI_CC_PARITY_ERR_GPSB_OR_PMSB_IERR:
>+	case PECI_CC_PARITY_ERR_GPSB_OR_PMSB_MCA:
>+		return -EIO;
>+	}
>+
>+	WARN_ONCE(1, "Unknown PECI completion code: %#02x\n", cc);
>+
>+	return -EIO;
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_request_status, PECI);
>+
>+static int peci_request_xfer(struct peci_request *req)
>+{
>+	struct peci_device *device =3D req->device;
>+	struct peci_controller *controller =3D device->controller;
>+	int ret;
>+
>+	mutex_lock(&controller->bus_lock);
>+	ret =3D controller->xfer(controller, device->addr, req);
>+	mutex_unlock(&controller->bus_lock);
>+
>+	return ret;
>+}
>+
>+static int peci_request_xfer_retry(struct peci_request *req)
>+{
>+	long wait_interval =3D PECI_RETRY_INTERVAL_MIN;
>+	struct peci_device *device =3D req->device;
>+	struct peci_controller *controller =3D device->controller;
>+	unsigned long start =3D jiffies;
>+	int ret;
>+
>+	/* Don't try to use it for ping */
>+	if (WARN_ON(!req->rx.buf))
>+		return 0;
>+
>+	do {
>+		ret =3D peci_request_xfer(req);
>+		if (ret) {
>+			dev_dbg(&controller->dev, "xfer error: %d\n", ret);
>+			return ret;
>+		}
>+
>+		if (peci_request_status(req) !=3D -EAGAIN)
>+			return 0;
>+
>+		/* Set the retry bit to indicate a retry attempt */
>+		req->tx.buf[1] |=3D PECI_RETRY_BIT;
>+
>+		if (schedule_timeout_interruptible(wait_interval))
>+			return -ERESTARTSYS;
>+
>+		wait_interval *=3D 2;
>+		if (wait_interval > PECI_RETRY_INTERVAL_MAX)
>+			wait_interval =3D PECI_RETRY_INTERVAL_MAX;

wait_interval =3D min(wait_interval * 2, PECI_RETRY_INTERVAL_MAX) ?

>+	} while (time_before(jiffies, start + PECI_RETRY_TIMEOUT));
>+
>+	dev_dbg(&controller->dev, "request timed out\n");
>+
>+	return -ETIMEDOUT;
>+}
>+
> /**
>  * peci_request_alloc() - allocate &struct peci_request with buffers with=
 given lengths
>  * @device: PECI device to which request is going to be sent
>@@ -72,3 +201,91 @@ void peci_request_free(struct peci_request *req)
> 	kfree(req);
> }
> EXPORT_SYMBOL_NS_GPL(peci_request_free, PECI);
>+
>+struct peci_request *peci_get_dib(struct peci_device *device)
>+{
>+	struct peci_request *req;
>+	int ret;
>+
>+	req =3D peci_request_alloc(device, PECI_GET_DIB_WR_LEN, PECI_GET_DIB_RD_=
LEN);
>+	if (!req)
>+		return ERR_PTR(-ENOMEM);
>+
>+	req->tx.buf[0] =3D PECI_GET_DIB_CMD;
>+
>+	ret =3D peci_request_xfer(req);
>+	if (ret) {
>+		peci_request_free(req);
>+		return ERR_PTR(ret);
>+	}
>+
>+	return req;
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_get_dib, PECI);
>+
>+static struct peci_request *
>+__pkg_cfg_read(struct peci_device *device, u8 index, u16 param, u8 len)
>+{
>+	struct peci_request *req;
>+	int ret;
>+
>+	req =3D peci_request_alloc(device, PECI_RDPKGCFG_WRITE_LEN,
>+				 PECI_RDPKGCFG_READ_LEN_BASE + len);
>+	if (!req)
>+		return ERR_PTR(-ENOMEM);
>+
>+	req->tx.buf[0] =3D PECI_RDPKGCFG_CMD;
>+	req->tx.buf[1] =3D 0;
>+	req->tx.buf[2] =3D index;
>+	put_unaligned_le16(param, &req->tx.buf[3]);
>+
>+	ret =3D peci_request_xfer_retry(req);
>+	if (ret) {
>+		peci_request_free(req);
>+		return ERR_PTR(ret);
>+	}
>+
>+	return req;
>+}
>+
>+u8 peci_request_data_readb(struct peci_request *req)
>+{
>+	return req->rx.buf[1];
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_request_data_readb, PECI);
>+
>+u16 peci_request_data_readw(struct peci_request *req)
>+{
>+	return get_unaligned_le16(&req->rx.buf[1]);
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_request_data_readw, PECI);
>+
>+u32 peci_request_data_readl(struct peci_request *req)
>+{
>+	return get_unaligned_le32(&req->rx.buf[1]);
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_request_data_readl, PECI);
>+
>+u64 peci_request_data_readq(struct peci_request *req)
>+{
>+	return get_unaligned_le64(&req->rx.buf[1]);
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_request_data_readq, PECI);
>+
>+u64 peci_request_data_dib(struct peci_request *req)
>+{
>+	return get_unaligned_le64(&req->rx.buf[0]);
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_request_data_dib, PECI);
>+
>+#define __read_pkg_config(x, type) \
>+struct peci_request *peci_pkg_cfg_##x(struct peci_device *device, u8 inde=
x, u16 param) \
>+{ \
>+	return __pkg_cfg_read(device, index, param, sizeof(type)); \
>+} \

Is there a reason for this particular API?  I'd think a more natural one
that would offload a bit of boilerplate from callers would look more like

int peci_pkg_cfg_##x(struct peci_device *device, u8 index, u16 param, type =
*outp),

returning peci_request_status() and writing the requested data to *outp
if that status is zero.

>+EXPORT_SYMBOL_NS_GPL(peci_pkg_cfg_##x, PECI)
>+
>+__read_pkg_config(readb, u8);
>+__read_pkg_config(readw, u16);
>+__read_pkg_config(readl, u32);
>+__read_pkg_config(readq, u64);
>diff --git a/include/linux/peci.h b/include/linux/peci.h
>index cdf3008321fd..f9f37b874011 100644
>--- a/include/linux/peci.h
>+++ b/include/linux/peci.h
>@@ -9,6 +9,14 @@
> #include <linux/mutex.h>
> #include <linux/types.h>
>
>+#define PECI_PCS_PKG_ID			0  /* Package Identifier Read */
>+#define  PECI_PKG_ID_CPU_ID		0x0000  /* CPUID Info */
>+#define  PECI_PKG_ID_PLATFORM_ID	0x0001  /* Platform ID */
>+#define  PECI_PKG_ID_DEVICE_ID		0x0002  /* Uncore Device ID */
>+#define  PECI_PKG_ID_MAX_THREAD_ID	0x0003  /* Max Thread ID */
>+#define  PECI_PKG_ID_MICROCODE_REV	0x0004  /* CPU Microcode Update Revisi=
on */
>+#define  PECI_PKG_ID_MCA_ERROR_LOG	0x0005  /* Machine Check Status */
>+
> struct peci_request;
>
> /**
>@@ -41,6 +49,11 @@ static inline struct peci_controller *to_peci_controlle=
r(void *d)
>  * struct peci_device - PECI device
>  * @dev: device object to register PECI device to the device model
>  * @controller: manages the bus segment hosting this PECI device
>+ * @info: PECI device characteristics
>+ * @info.family: device family
>+ * @info.model: device model
>+ * @info.peci_revision: PECI revision supported by the PECI device
>+ * @info.socket_id: the socket ID represented by the PECI device
>  * @addr: address used on the PECI bus connected to the parent controller
>  *
>  * A peci_device identifies a single device (i.e. CPU) connected to a PEC=
I bus.
>@@ -50,6 +63,12 @@ static inline struct peci_controller *to_peci_controlle=
r(void *d)
> struct peci_device {
> 	struct device dev;
> 	struct peci_controller *controller;
>+	struct {
>+		u16 family;
>+		u8 model;
>+		u8 peci_revision;

This field gets set but doesn't seem to end up used anywhere; is it
useful?

>+		u8 socket_id;
>+	} info;
> 	u8 addr;
> };
>
>diff --git a/lib/Kconfig b/lib/Kconfig
>index cc28bc1f2d84..a74e6c0fa75c 100644
>--- a/lib/Kconfig
>+++ b/lib/Kconfig
>@@ -721,5 +721,5 @@ config ASN1_ENCODER
>
> config GENERIC_LIB_X86
> 	bool
>-	depends on X86
>+	depends on X86 || PECI
> 	default n
>--=20
>2.31.1
>=
