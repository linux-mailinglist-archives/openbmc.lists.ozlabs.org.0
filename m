Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E039E3DAFD1
	for <lists+openbmc@lfdr.de>; Fri, 30 Jul 2021 01:23:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbRQq504Bz3cQb
	for <lists+openbmc@lfdr.de>; Fri, 30 Jul 2021 09:22:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=LtKXcA/D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=9844c65846=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=LtKXcA/D; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbRQN37TCz3bmj;
 Fri, 30 Jul 2021 09:22:34 +1000 (AEST)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16TNIvNP017080; Thu, 29 Jul 2021 23:22:10 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by mx0a-00268f01.pphosted.com with ESMTP id 3a3tahar06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jul 2021 23:22:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQ/WTtrGKv17L9/7ymtvTvs3fMx3yvZp6kOWmEYSMpMWJgQjuESYngAvExObz2enU4b4DNPUv7KZoH0vBlo1xw8y8wFfiliNo32tgpiujzBdXbuZr6RzWP+5Q5IGdF0Pdym/TGjhNE4cg6XokAyP8zLkCfdyOVLKyV4rFgTgXqJWV2x1xUogae88+5oOhHYS855I111/q1Hs27GnoeImNG1HwAfHBV9a/QGmoGu5fxp8Rl+t7Eh7gTtw5e+aSOzbHJIHxFHJIyhuXQRO/sm++m59p/YSUvQ3SaY7fch//1MghbOhQ+k9uVgTrM7ocOI4N86/X6d5P4uEn19mgnnU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHRFV2Xc+3TF3j0b2+QRHRqrReuwcQDuUEPR4rxnZDg=;
 b=eOsxreHA52ASNedXKC3axt7l3VS5g0ZQV6V+eCOrYg7oGNmleIwk8OjcUEVELrN6d9PMgLfX9oFaYQW2GYf5jKZtxIW47n0z5eFRHsdalROkx/d1jjOInIL1/eLNWCyCftPJp1hgWscTF3QVEO6hPcH/Rz48Le/Nr7OZyDiuNxbewzkS4C+fylRwJ7D0MX/ZQjJMrZFK18MGaDdkU8M0qK+UZSJU/03sRuLV4+rzLOCG0dCWqTpvrcMFeHQ7cIJdvRQCK1PbZfWkIcUsVERWi22+Wr1I2otN2sEpnnvgIcK/gtWm5+57BBfhWJ72Ee1vpYXK8OUz0/fDEPfPYIToWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHRFV2Xc+3TF3j0b2+QRHRqrReuwcQDuUEPR4rxnZDg=;
 b=LtKXcA/DLuJDvUOqoxKl6fdo3+p/0TwzUpdxzxjnbxPsIQ/aKQfvOBfZXMUJHTsQw6+9j8rzV7i9M+RCZaXN++HpC6l/4bJk9OOPH8hyG1OERtbWVcVbFJd7B4zIC9cyPyt7epJoxb3HbP9QIPlNMvgJG4ZOMVFf+jFfuIkU/iQ=
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7895.namprd04.prod.outlook.com (2603:10b6:8:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 29 Jul
 2021 23:22:06 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b%5]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 23:22:06 +0000
From: Zev Weiss <zweiss@equinix.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [PATCH 09/14] peci: Add support for PECI device drivers
Thread-Topic: [PATCH 09/14] peci: Add support for PECI device drivers
Thread-Index: AQHXgyNyOfnUTEQoM0K8bE1+mPB05atad+MAgAAi7IA=
Date: Thu, 29 Jul 2021 23:22:06 +0000
Message-ID: <20210729232205.GX8018@packtop>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-10-iwona.winiarska@intel.com>
 <20210727201028.GS8018@packtop>
 <79f5b6ed4942ddeb66beea03907a58495376ccef.camel@intel.com>
In-Reply-To: <79f5b6ed4942ddeb66beea03907a58495376ccef.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 497ae37b-902a-439c-775a-08d952e7ae51
x-ms-traffictypediagnostic: DM8PR04MB7895:
x-microsoft-antispam-prvs: <DM8PR04MB7895A7CDFC1A9EFC4D2CE147C3EB9@DM8PR04MB7895.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8UhPevwxQbaREsJGAzVrVpIjPfavfc8wkLRmMRWzaFI3yZbf3yvA9T7xJ27sd0EhRP0uzofj4oastFIbpBI9GK+VPJiZ9Jr9b98DO/8QKUn/X1lG1hxnEqylhFySBzSsC5pfeDzOIyZ4hiGWmIAJjAWwbQAdmK+0B+OlTl2tJ42qF69ymcyuwC+tEXeKwXT9CtHLKx+EiAgAfJzZQCesawPkh46MYBgev5jXspkeeV8fTOGfKXqEEAdymOUuNKUVahF+n1L1rAILw72OLAfG4GqQybT/2/UtIhSPVqallJk0fJ6zHkYeu2RAzyqCVRiK8FN/eY0btQCFGRnXtMVRsZFz+ajyn6JsOVC/RrRx4btpj7SEBwJhZGhc4pfEO714JepJXcXFkQT6IfxOUoF5N0i1YtQkHi5nnILhaZQzB/6IUhWqV/jjeihNWztR+IC33skTqqOlt+6SvP4MCpuY/h19Zn5FLhOFVKQ/f9bqXGP4CCDRGcC+aNaxzCy3fRX0IGJwA6PaX9ULypa139CmNwijKEsqLxpciG/aT9kAMYDUsW9ScDdtLSQ0c4b70GvgNsI6m8oVK7uyWZvyu2TrmzkdQcZ5Lwkklif19rOBASvPTTf26J8GtkSw1GN0V6GFN01ANEUj5/H/h0ZPhc2q/KrqGiEdaAspSCeyTyGjxopfizT34ymHQ5ZD63MPBjiHz8+R0QmL6bqcSgNVqIqcIg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(136003)(346002)(396003)(366004)(376002)(39860400002)(7416002)(6506007)(6486002)(8676002)(4326008)(71200400001)(30864003)(26005)(9686003)(83380400001)(38070700005)(122000001)(6512007)(1076003)(38100700002)(64756008)(6916009)(76116006)(66476007)(54906003)(66556008)(33716001)(66946007)(66446008)(91956017)(2906002)(86362001)(478600001)(316002)(8936002)(186003)(33656002)(5660300002)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?v6BKSIh0G8iZTzZzmmL2kcD4ei+alT0xdajD3/HPLeFJvaFTIA8B6Z6Bz0?=
 =?iso-8859-1?Q?eWYgAGH1nUg/PwUlrWJH68MFB6hEMp7+xOWfxCmZOo4GfyY0XE04QrB+yy?=
 =?iso-8859-1?Q?eKmXuYt3yigVvC9nB+O05UY3MSz5+xsTPKaw4oVA4r4pDrlP6rqb4SVzTH?=
 =?iso-8859-1?Q?PhkOjbE04ZoLXOQIAjqlOb65NKJGVoO/qGcj91NbqEoSEg9nqmMKz0SfB5?=
 =?iso-8859-1?Q?T4oYTHFdg9xj2h19jzLkoetmJDQrfmK4xzojYitS0qDLUeAYMIJt+y/DtT?=
 =?iso-8859-1?Q?g9ocvOCZGaLC00X9xNP1Qr+wHhRxdwF1GtAOhecMq9O+nKOhtJn+BjlNSt?=
 =?iso-8859-1?Q?qMigumYfwPOjvy2VC1Aerj+wJcuV+DIu/lsfuBlZ9EqP+1ryom0kft6Y9E?=
 =?iso-8859-1?Q?BHwZv3vKGwncJl42yWdyVbUopPZk53eHsBrv2oOP/v9PxxfD9l2mQ8UCbf?=
 =?iso-8859-1?Q?g0ubVDhpfprYAT5ZXwc4Coholk5BXB/GDU3oU21Lgab86wZk0Gi1I69SmJ?=
 =?iso-8859-1?Q?zS1w87QgEJIGuWW6bTWtdsFSu7vv61tP5xBcnoz3LyGxlozl2Y87F82yiJ?=
 =?iso-8859-1?Q?MshFWx3X8lop9MdDrSKHKxtVWi/+S+GsVzYViGTe96cSpRS3eB+G8VGfPx?=
 =?iso-8859-1?Q?XLSUU6py+FsMWklLN7OimScp7l/iCX+ePX/F85RllPHI9sck7XWTfiG+wh?=
 =?iso-8859-1?Q?2envhAmPEnXiA/T8/fQWbPKlcFHG4uzZAGfg1hpU02Kuo1Hux5YaEE5DMg?=
 =?iso-8859-1?Q?fDamjQkwki6NgtSDtGN2AOrSoSO87ClmebyRKC7p4TPpRKLcYM2rF0VWhA?=
 =?iso-8859-1?Q?a3Q95uPY6kbgUL0u9R66Fr3Cov0Milw+EbLcUAGo8/rnftnYxMLbuhbSrx?=
 =?iso-8859-1?Q?NAROvVfpc8xQ9eerJbfG3zTlBkQI4D+vP6s0AHveZlZxaNBlW9CGweUyOa?=
 =?iso-8859-1?Q?qvzY6Rpg6JUE/B/Amq9EajRPWaELPlGoTTmQy//is2w8XLuGN/mqARtpxS?=
 =?iso-8859-1?Q?BKH7GbsB4VYJ6FBnLhqD+bTenFWDcYcfPbkTuGrJN8LgrlO/KyBX73I+bp?=
 =?iso-8859-1?Q?KV/dQM51QVHiqpXGUoxB9CLMbB5Fwz23yYbRY7SwRof0xcTZg1NMuQRpwc?=
 =?iso-8859-1?Q?J3W3NBfa4ht/NBwnH5wmF54IVd4d48meR1ogdI3BSqtHjBCIQKfcBZQCfg?=
 =?iso-8859-1?Q?7dqJJJddOIRD9dsDmoMqLhux7CNbHgl+RJYlkYOtmeznyDognFEMuyJ/XE?=
 =?iso-8859-1?Q?i7UAb0aqVT2bz6+ZuLjXRxlHl/PWyMIIcB33EFafvrxSCgLqMzOE8cndhP?=
 =?iso-8859-1?Q?EFmNARgudvzL4Tv0JBu36ca1rMiBWtXZxV5lQf3muUmSPDVM0ys77EJBYH?=
 =?iso-8859-1?Q?GcJwF7qA0X?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <02591BECE4481A40BC28A8AB54D82AF0@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 497ae37b-902a-439c-775a-08d952e7ae51
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 23:22:06.4426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uNUQBOSbwbmmUDr0weWBqkm6iiOltnhrNmO41dOH/R+EFC/KC5c4qZ1Hals3LTzXoJOlBXXm9J6hoNDE6C45Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7895
X-Proofpoint-GUID: mArqezjknYM9iaazq-GpM9_9U9gjCA53
X-Proofpoint-ORIG-GUID: mArqezjknYM9iaazq-GpM9_9U9gjCA53
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-29_17:2021-07-29,
 2021-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107290141
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
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 29, 2021 at 04:17:06PM CDT, Winiarska, Iwona wrote:
>On Tue, 2021-07-27 at 20:10 +0000, Zev Weiss wrote:
>> On Mon, Jul 12, 2021 at 05:04:42PM CDT, Iwona Winiarska wrote:
>> > Here we're adding support for PECI device drivers, which unlike PECI
>> > controller drivers are actually able to provide functionalities to
>> > userspace.
>> >
>> > We're also extending peci_request API to allow querying more details
>> > about PECI device (e.g. model/family), that's going to be used to find
>> > a compatible peci_driver.
>> >
>> > Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.co=
m>
>> > ---
>> > drivers/peci/Kconfig=A0=A0=A0 |=A0=A0 1 +
>> > drivers/peci/core.c=A0=A0=A0=A0 |=A0 49 +++++++++
>> > drivers/peci/device.c=A0=A0 |=A0 99 ++++++++++++++++++
>> > drivers/peci/internal.h |=A0 75 ++++++++++++++
>> > drivers/peci/request.c=A0 | 217 ++++++++++++++++++++++++++++++++++++++=
++
>> > include/linux/peci.h=A0=A0=A0 |=A0 19 ++++
>> > lib/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 2 +-
>> > 7 files changed, 461 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
>> > index 0d0ee8009713..27c31535843c 100644
>> > --- a/drivers/peci/Kconfig
>> > +++ b/drivers/peci/Kconfig
>> > @@ -2,6 +2,7 @@
>> >
>> > menuconfig PECI
>> > =A0=A0=A0=A0=A0=A0=A0=A0tristate "PECI support"
>> > +=A0=A0=A0=A0=A0=A0=A0select GENERIC_LIB_X86
>> > =A0=A0=A0=A0=A0=A0=A0=A0help
>> > =A0=A0=A0=A0=A0=A0=A0=A0=A0 The Platform Environment Control Interface=
 (PECI) is an interface
>> > =A0=A0=A0=A0=A0=A0=A0=A0=A0 that provides a communication channel to I=
ntel processors and
>> > diff --git a/drivers/peci/core.c b/drivers/peci/core.c
>> > index ae7a9572cdf3..94426b7f2618 100644
>> > --- a/drivers/peci/core.c
>> > +++ b/drivers/peci/core.c
>> > @@ -143,8 +143,57 @@ void peci_controller_remove(struct peci_controlle=
r
>> > *controller)
>> > }
>> > EXPORT_SYMBOL_NS_GPL(peci_controller_remove, PECI);
>> >
>> > +static const struct peci_device_id *
>> > +peci_bus_match_device_id(const struct peci_device_id *id, struct
>> > peci_device *device)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0while (id->family !=3D 0) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (id->family =3D=3D de=
vice->info.family &&
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 id->model =3D=
=3D device->info.model)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
return id;
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0id++;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return NULL;
>> > +}
>> > +
>> > +static int peci_bus_device_match(struct device *dev, struct device_dr=
iver
>> > *drv)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_device *device =3D to_peci_device(de=
v);
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_driver *peci_drv =3D to_peci_driver(=
drv);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (dev->type !=3D &peci_device_type)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return 0;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (peci_bus_match_device_id(peci_drv->id_table,=
 device))
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return 1;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return 0;
>> > +}
>> > +
>> > +static int peci_bus_device_probe(struct device *dev)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_device *device =3D to_peci_device(de=
v);
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_driver *driver =3D to_peci_driver(de=
v->driver);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return driver->probe(device, peci_bus_match_devi=
ce_id(driver-
>> > >id_table, device));
>> > +}
>> > +
>> > +static int peci_bus_device_remove(struct device *dev)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_device *device =3D to_peci_device(de=
v);
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_driver *driver =3D to_peci_driver(de=
v->driver);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (driver->remove)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0driver->remove(device);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return 0;
>> > +}
>> > +
>> > struct bus_type peci_bus_type =3D {
>> > =A0=A0=A0=A0=A0=A0=A0=A0.name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=3D "pec=
i",
>> > +=A0=A0=A0=A0=A0=A0=A0.match=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=3D peci_bus=
_device_match,
>> > +=A0=A0=A0=A0=A0=A0=A0.probe=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=3D peci_bus=
_device_probe,
>> > +=A0=A0=A0=A0=A0=A0=A0.remove=A0=A0=A0=A0=A0=A0=A0=A0=A0=3D peci_bus_d=
evice_remove,
>> > =A0=A0=A0=A0=A0=A0=A0=A0.bus_groups=A0=A0=A0=A0=A0=3D peci_bus_groups,
>> > };
>> >
>> > diff --git a/drivers/peci/device.c b/drivers/peci/device.c
>> > index 1124862211e2..8c4bd1ebbc29 100644
>> > --- a/drivers/peci/device.c
>> > +++ b/drivers/peci/device.c
>> > @@ -1,11 +1,79 @@
>> > // SPDX-License-Identifier: GPL-2.0-only
>> > // Copyright (c) 2018-2021 Intel Corporation
>> >
>> > +#include <linux/bitfield.h>
>> > #include <linux/peci.h>
>> > #include <linux/slab.h>
>> > +#include <linux/x86/cpu.h>
>> >
>> > #include "internal.h"
>> >
>> > +#define REVISION_NUM_MASK GENMASK(15, 8)
>> > +static int peci_get_revision(struct peci_device *device, u8 *revision=
)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_request *req;
>> > +=A0=A0=A0=A0=A0=A0=A0u64 dib;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0req =3D peci_get_dib(device);
>> > +=A0=A0=A0=A0=A0=A0=A0if (IS_ERR(req))
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return PTR_ERR(req);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0dib =3D peci_request_data_dib(req);
>> > +=A0=A0=A0=A0=A0=A0=A0if (dib =3D=3D 0) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0peci_request_free(req);
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EIO;
>>
>> Any particular reason to check for zero specifically here?=A0 It looks
>> like that would be a case where the host CPU responds and everything's
>> otherwise fine, but the host just happened to send back a bunch of zeros
>> for whatever reason -- which may not be a valid PECI revision number,
>> but if it sent back a bunch of 0xff bytes instead wouldn't that be
>> equally invalid?
>
>The response with all 0's is possible (and defined) in certain device stat=
es. If
>that happens - we don't want to continue adding the device (with "invalid"
>revision 0), we just want to return error.
>

Okay, that's reasonable -- maybe worth a brief comment though.

>>
>> Also, given that the docs (the ones I have, at least) describe the DIB
>> as a collection of individual bytes, dealing with it as a combined u64
>> seems a bit confusing to me -- could we just return req->rx.buf[1]
>> instead?
>
>GetDIB returns 8-byte response, which is why we're treating it in this way
>(similar to other commands). We're pulling out the whole response and use
>FIELD_GET to obtain the data we need.
>

Sure -- but since the 8 bytes that GetDIB retrieves are a device info
byte, a revision number byte, and six reserved bytes (at least as of the
documentation I have access to), I'm not sure why we want to pack that
all up into a u64 only to unpack a single byte from it a moment later
with FIELD_GET(), when we've already got it in a convenient
array-of-bytes form (req->rx.buf).  I could understand wanting a u64 if
the 8 bytes were all a single value, or if it had sub-fields that
spanned byte boundaries in awkward ways or something, but given the
format of the response data a byte array seems like the most natural way
of dealing with it.

I suppose it facilitates an easy zero check, but that could also be
written as !memchr_inv(req->rx.buf, 0, 8) in the non-u64 case.

>>
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0*revision =3D FIELD_GET(REVISION_NUM_MASK, dib);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0peci_request_free(req);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return 0;
>> > +}
>> > +
>> > +static int peci_get_cpu_id(struct peci_device *device, u32 *cpu_id)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_request *req;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0req =3D peci_pkg_cfg_readl(device, PECI_PCS_PKG_=
ID,
>> > PECI_PKG_ID_CPU_ID);
>> > +=A0=A0=A0=A0=A0=A0=A0if (IS_ERR(req))
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return PTR_ERR(req);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D peci_request_status(req);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto out_req_free;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0*cpu_id =3D peci_request_data_readl(req);
>> > +out_req_free:
>>
>> As suggested on patch #8, I think it might be cleaner to stack-allocate
>> struct peci_request, which would obviate the need for explicit free
>> calls in functions like this and hence might simplify it away entirely,
>> but if this does remain like this we could just do
>>
>> =A0=A0=A0=A0=A0=A0=A0=A0if (!ret)
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0*cpu_id =3D peci_request=
_data_readl(req);
>>
>> instead of using a goto to skip a single line.
>
>Please, see my response on patch 8.
>
>I would prefer to operate on allocated objects rather than on local variab=
les in
>case of peci requests.
>
>>
>> > +=A0=A0=A0=A0=A0=A0=A0peci_request_free(req);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return ret;
>> > +}
>> > +
>> > +static int peci_device_info_init(struct peci_device *device)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0u8 revision;
>> > +=A0=A0=A0=A0=A0=A0=A0u32 cpu_id;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D peci_get_cpu_id(device, &cpu_id);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0device->info.family =3D x86_family(cpu_id);
>> > +=A0=A0=A0=A0=A0=A0=A0device->info.model =3D x86_model(cpu_id);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D peci_get_revision(device, &revision);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
>> > +=A0=A0=A0=A0=A0=A0=A0device->info.peci_revision =3D revision;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0device->info.socket_id =3D device->addr - PECI_B=
ASE_ADDR;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return 0;
>> > +}
>> > +
>> > static int peci_detect(struct peci_controller *controller, u8 addr)
>> > {
>> > =A0=A0=A0=A0=A0=A0=A0=A0struct peci_request *req;
>> > @@ -75,6 +143,10 @@ int peci_device_create(struct peci_controller
>> > *controller, u8 addr)
>> > =A0=A0=A0=A0=A0=A0=A0=A0device->dev.bus =3D &peci_bus_type;
>> > =A0=A0=A0=A0=A0=A0=A0=A0device->dev.type =3D &peci_device_type;
>> >
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D peci_device_info_init(device);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto err_free;
>> > +
>> > =A0=A0=A0=A0=A0=A0=A0=A0ret =3D dev_set_name(&device->dev, "%d-%02x", =
controller->id, device-
>> > >addr);
>> > =A0=A0=A0=A0=A0=A0=A0=A0if (ret)
>> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto err_free;
>> > @@ -98,6 +170,33 @@ void peci_device_destroy(struct peci_device *devic=
e)
>> > =A0=A0=A0=A0=A0=A0=A0=A0device_unregister(&device->dev);
>> > }
>> >
>> > +int __peci_driver_register(struct peci_driver *driver, struct module
>> > *owner,
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 const char *mod_name)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0driver->driver.bus =3D &peci_bus_type;
>> > +=A0=A0=A0=A0=A0=A0=A0driver->driver.owner =3D owner;
>> > +=A0=A0=A0=A0=A0=A0=A0driver->driver.mod_name =3D mod_name;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (!driver->probe) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_err("peci: trying to =
register driver without probe
>> > callback\n");
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (!driver->id_table) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_err("peci: trying to =
register driver without device id
>> > table\n");
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return driver_register(&driver->driver);
>> > +}
>> > +EXPORT_SYMBOL_NS_GPL(__peci_driver_register, PECI);
>> > +
>> > +void peci_driver_unregister(struct peci_driver *driver)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0driver_unregister(&driver->driver);
>> > +}
>> > +EXPORT_SYMBOL_NS_GPL(peci_driver_unregister, PECI);
>> > +
>> > static void peci_device_release(struct device *dev)
>> > {
>> > =A0=A0=A0=A0=A0=A0=A0=A0struct peci_device *device =3D to_peci_device(=
dev);
>> > diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
>> > index 6b139adaf6b8..c891c93e077a 100644
>> > --- a/drivers/peci/internal.h
>> > +++ b/drivers/peci/internal.h
>> > @@ -19,6 +19,34 @@ struct peci_request;
>> > struct peci_request *peci_request_alloc(struct peci_device *device, u8
>> > tx_len, u8 rx_len);
>> > void peci_request_free(struct peci_request *req);
>> >
>> > +int peci_request_status(struct peci_request *req);
>> > +u64 peci_request_data_dib(struct peci_request *req);
>> > +
>> > +u8 peci_request_data_readb(struct peci_request *req);
>> > +u16 peci_request_data_readw(struct peci_request *req);
>> > +u32 peci_request_data_readl(struct peci_request *req);
>> > +u64 peci_request_data_readq(struct peci_request *req);
>> > +
>> > +struct peci_request *peci_get_dib(struct peci_device *device);
>> > +struct peci_request *peci_get_temp(struct peci_device *device);
>> > +
>> > +struct peci_request *peci_pkg_cfg_readb(struct peci_device *device, u=
8
>> > index, u16 param);
>> > +struct peci_request *peci_pkg_cfg_readw(struct peci_device *device, u=
8
>> > index, u16 param);
>> > +struct peci_request *peci_pkg_cfg_readl(struct peci_device *device, u=
8
>> > index, u16 param);
>> > +struct peci_request *peci_pkg_cfg_readq(struct peci_device *device, u=
8
>> > index, u16 param);
>> > +
>> > +/**
>> > + * struct peci_device_id - PECI device data to match
>> > + * @data: pointer to driver private data specific to device
>> > + * @family: device family
>> > + * @model: device model
>> > + */
>> > +struct peci_device_id {
>> > +=A0=A0=A0=A0=A0=A0=A0const void *data;
>> > +=A0=A0=A0=A0=A0=A0=A0u16 family;
>> > +=A0=A0=A0=A0=A0=A0=A0u8 model;
>> > +};
>> > +
>> > extern struct device_type peci_device_type;
>> > extern const struct attribute_group *peci_device_groups[];
>> >
>> > @@ -28,6 +56,53 @@ void peci_device_destroy(struct peci_device *device=
);
>> > extern struct bus_type peci_bus_type;
>> > extern const struct attribute_group *peci_bus_groups[];
>> >
>> > +/**
>> > + * struct peci_driver - PECI driver
>> > + * @driver: inherit device driver
>> > + * @probe: probe callback
>> > + * @remove: remove callback
>> > + * @id_table: PECI device match table to decide which device to bind
>> > + */
>> > +struct peci_driver {
>> > +=A0=A0=A0=A0=A0=A0=A0struct device_driver driver;
>> > +=A0=A0=A0=A0=A0=A0=A0int (*probe)(struct peci_device *device, const s=
truct peci_device_id
>> > *id);
>> > +=A0=A0=A0=A0=A0=A0=A0void (*remove)(struct peci_device *device);
>> > +=A0=A0=A0=A0=A0=A0=A0const struct peci_device_id *id_table;
>> > +};
>> > +
>> > +static inline struct peci_driver *to_peci_driver(struct device_driver=
 *d)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0return container_of(d, struct peci_driver, drive=
r);
>> > +}
>> > +
>> > +int __peci_driver_register(struct peci_driver *driver, struct module
>> > *owner,
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 const char *mod_name);
>> > +/**
>> > + * peci_driver_register() - register PECI driver
>> > + * @driver: the driver to be registered
>> > + * @owner: owner module of the driver being registered
>> > + * @mod_name: module name string
>> > + *
>> > + * PECI drivers that don't need to do anything special in module init
>> > should
>> > + * use the convenience "module_peci_driver" macro instead
>> > + *
>> > + * Return: zero on success, else a negative error code.
>> > + */
>> > +#define peci_driver_register(driver) \
>> > +=A0=A0=A0=A0=A0=A0=A0__peci_driver_register(driver, THIS_MODULE, KBUI=
LD_MODNAME)
>> > +void peci_driver_unregister(struct peci_driver *driver);
>> > +
>> > +/**
>> > + * module_peci_driver() - Helper macro for registering a modular PECI
>> > driver
>> > + * @__peci_driver: peci_driver struct
>> > + *
>> > + * Helper macro for PECI drivers which do not do anything special in =
module
>> > + * init/exit. This eliminates a lot of boilerplate. Each module may o=
nly
>> > + * use this macro once, and calling it replaces module_init() and
>> > module_exit()
>> > + */
>> > +#define module_peci_driver(__peci_driver) \
>> > +=A0=A0=A0=A0=A0=A0=A0module_driver(__peci_driver, peci_driver_registe=
r,
>> > peci_driver_unregister)
>> > +
>> > extern struct device_type peci_controller_type;
>> >
>> > int peci_controller_scan_devices(struct peci_controller *controller);
>> > diff --git a/drivers/peci/request.c b/drivers/peci/request.c
>> > index 78cee51dfae1..48354455b554 100644
>> > --- a/drivers/peci/request.c
>> > +++ b/drivers/peci/request.c
>> > @@ -1,13 +1,142 @@
>> > // SPDX-License-Identifier: GPL-2.0-only
>> > // Copyright (c) 2021 Intel Corporation
>> >
>> > +#include <linux/bug.h>
>> > #include <linux/export.h>
>> > #include <linux/peci.h>
>> > #include <linux/slab.h>
>> > #include <linux/types.h>
>> >
>> > +#include <asm/unaligned.h>
>> > +
>> > #include "internal.h"
>> >
>> > +#define PECI_GET_DIB_CMD=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
0xf7
>> > +#define=A0 PECI_GET_DIB_WR_LEN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A01
>> > +#define=A0 PECI_GET_DIB_RD_LEN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A08
>> > +
>> > +#define PECI_RDPKGCFG_CMD=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x=
a1
>> > +#define=A0 PECI_RDPKGCFG_WRITE_LEN=A0=A0=A0=A0=A0=A0=A05
>> > +#define=A0 PECI_RDPKGCFG_READ_LEN_BASE=A0=A0=A01
>> > +#define PECI_WRPKGCFG_CMD=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x=
a5
>> > +#define=A0 PECI_WRPKGCFG_WRITE_LEN_BASE=A0=A06
>> > +#define=A0 PECI_WRPKGCFG_READ_LEN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A01
>> > +
>> > +/* Device Specific Completion Code (CC) Definition */
>> > +#define PECI_CC_SUCCESS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x40
>> > +#define PECI_CC_NEED_RETRY=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A00x80
>> > +#define PECI_CC_OUT_OF_RESOURCE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x81
>> > +#define PECI_CC_UNAVAIL_RESOURCE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A00x82
>> > +#define PECI_CC_INVALID_REQ=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x90
>> > +#define PECI_CC_MCA_ERROR=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A00x91
>> > +#define PECI_CC_CATASTROPHIC_MCA_ERROR=A0=A0=A0=A0=A0=A0=A0=A0=A00x93
>> > +#define PECI_CC_FATAL_MCA_ERROR=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x94
>> > +#define PECI_CC_PARITY_ERR_GPSB_OR_PMSB=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x98
>> > +#define PECI_CC_PARITY_ERR_GPSB_OR_PMSB_IERR=A0=A0=A00x9B
>> > +#define PECI_CC_PARITY_ERR_GPSB_OR_PMSB_MCA=A0=A0=A0=A00x9C
>> > +
>> > +#define PECI_RETRY_BIT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0BIT(0)
>> > +
>> > +#define PECI_RETRY_TIMEOUT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0msec=
s_to_jiffies(700)
>> > +#define PECI_RETRY_INTERVAL_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0msecs_to_jiffies(1)
>> > +#define PECI_RETRY_INTERVAL_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0msecs_to_jiffies(128)
>> > +
>> > +static u8 peci_request_data_cc(struct peci_request *req)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0return req->rx.buf[0];
>> > +}
>> > +
>> > +/**
>> > + * peci_request_status() - return -errno based on PECI completion cod=
e
>> > + * @req: the PECI request that contains response data with completion=
 code
>> > + *
>> > + * It can't be used for Ping(), GetDIB() and GetTemp() - for those co=
mmands
>> > we
>> > + * don't expect completion code in the response.
>> > + *
>> > + * Return: -errno
>> > + */
>> > +int peci_request_status(struct peci_request *req)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0u8 cc =3D peci_request_data_cc(req);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (cc !=3D PECI_CC_SUCCESS)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_dbg(&req->device->de=
v, "ret: %#02x\n", cc);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0switch (cc) {
>> > +=A0=A0=A0=A0=A0=A0=A0case PECI_CC_SUCCESS:
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return 0;
>> > +=A0=A0=A0=A0=A0=A0=A0case PECI_CC_NEED_RETRY:
>> > +=A0=A0=A0=A0=A0=A0=A0case PECI_CC_OUT_OF_RESOURCE:
>> > +=A0=A0=A0=A0=A0=A0=A0case PECI_CC_UNAVAIL_RESOURCE:
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EAGAIN;
>> > +=A0=A0=A0=A0=A0=A0=A0case PECI_CC_INVALID_REQ:
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
>> > +=A0=A0=A0=A0=A0=A0=A0case PECI_CC_MCA_ERROR:
>> > +=A0=A0=A0=A0=A0=A0=A0case PECI_CC_CATASTROPHIC_MCA_ERROR:
>> > +=A0=A0=A0=A0=A0=A0=A0case PECI_CC_FATAL_MCA_ERROR:
>> > +=A0=A0=A0=A0=A0=A0=A0case PECI_CC_PARITY_ERR_GPSB_OR_PMSB:
>> > +=A0=A0=A0=A0=A0=A0=A0case PECI_CC_PARITY_ERR_GPSB_OR_PMSB_IERR:
>> > +=A0=A0=A0=A0=A0=A0=A0case PECI_CC_PARITY_ERR_GPSB_OR_PMSB_MCA:
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EIO;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0WARN_ONCE(1, "Unknown PECI completion code: %#02=
x\n", cc);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return -EIO;
>> > +}
>> > +EXPORT_SYMBOL_NS_GPL(peci_request_status, PECI);
>> > +
>> > +static int peci_request_xfer(struct peci_request *req)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_device *device =3D req->device;
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_controller *controller =3D device->c=
ontroller;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0mutex_lock(&controller->bus_lock);
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D controller->xfer(controller, device->add=
r, req);
>> > +=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&controller->bus_lock);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return ret;
>> > +}
>> > +
>> > +static int peci_request_xfer_retry(struct peci_request *req)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0long wait_interval =3D PECI_RETRY_INTERVAL_MIN;
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_device *device =3D req->device;
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_controller *controller =3D device->c=
ontroller;
>> > +=A0=A0=A0=A0=A0=A0=A0unsigned long start =3D jiffies;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0/* Don't try to use it for ping */
>> > +=A0=A0=A0=A0=A0=A0=A0if (WARN_ON(!req->rx.buf))
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return 0;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0do {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D peci_request_xfe=
r(req);
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (ret) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
dev_dbg(&controller->dev, "xfer error: %d\n", ret);
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
return ret;
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (peci_request_status(=
req) !=3D -EAGAIN)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
return 0;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* Set the retry bit to =
indicate a retry attempt */
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0req->tx.buf[1] |=3D PECI=
_RETRY_BIT;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (schedule_timeout_int=
erruptible(wait_interval))
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
return -ERESTARTSYS;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0wait_interval *=3D 2;
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (wait_interval > PECI=
_RETRY_INTERVAL_MAX)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
wait_interval =3D PECI_RETRY_INTERVAL_MAX;
>>
>> wait_interval =3D min(wait_interval * 2, PECI_RETRY_INTERVAL_MAX) ?
>
>Ack.
>
>>
>> > +=A0=A0=A0=A0=A0=A0=A0} while (time_before(jiffies, start + PECI_RETRY=
_TIMEOUT));
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0dev_dbg(&controller->dev, "request timed out\n")=
;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return -ETIMEDOUT;
>> > +}
>> > +
>> > /**
>> > =A0* peci_request_alloc() - allocate &struct peci_request with buffers=
 with
>> > given lengths
>> > =A0* @device: PECI device to which request is going to be sent
>> > @@ -72,3 +201,91 @@ void peci_request_free(struct peci_request *req)
>> > =A0=A0=A0=A0=A0=A0=A0=A0kfree(req);
>> > }
>> > EXPORT_SYMBOL_NS_GPL(peci_request_free, PECI);
>> > +
>> > +struct peci_request *peci_get_dib(struct peci_device *device)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_request *req;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0req =3D peci_request_alloc(device, PECI_GET_DIB_=
WR_LEN,
>> > PECI_GET_DIB_RD_LEN);
>> > +=A0=A0=A0=A0=A0=A0=A0if (!req)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(-ENOMEM);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0req->tx.buf[0] =3D PECI_GET_DIB_CMD;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D peci_request_xfer(req);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0peci_request_free(req);
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(ret);
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return req;
>> > +}
>> > +EXPORT_SYMBOL_NS_GPL(peci_get_dib, PECI);
>> > +
>> > +static struct peci_request *
>> > +__pkg_cfg_read(struct peci_device *device, u8 index, u16 param, u8 le=
n)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_request *req;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0req =3D peci_request_alloc(device, PECI_RDPKGCFG=
_WRITE_LEN,
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 PECI_RDPKGCFG_READ_LEN_BASE + len);
>> > +=A0=A0=A0=A0=A0=A0=A0if (!req)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(-ENOMEM);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0req->tx.buf[0] =3D PECI_RDPKGCFG_CMD;
>> > +=A0=A0=A0=A0=A0=A0=A0req->tx.buf[1] =3D 0;
>> > +=A0=A0=A0=A0=A0=A0=A0req->tx.buf[2] =3D index;
>> > +=A0=A0=A0=A0=A0=A0=A0put_unaligned_le16(param, &req->tx.buf[3]);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D peci_request_xfer_retry(req);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0peci_request_free(req);
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ERR_PTR(ret);
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return req;
>> > +}
>> > +
>> > +u8 peci_request_data_readb(struct peci_request *req)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0return req->rx.buf[1];
>> > +}
>> > +EXPORT_SYMBOL_NS_GPL(peci_request_data_readb, PECI);
>> > +
>> > +u16 peci_request_data_readw(struct peci_request *req)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0return get_unaligned_le16(&req->rx.buf[1]);
>> > +}
>> > +EXPORT_SYMBOL_NS_GPL(peci_request_data_readw, PECI);
>> > +
>> > +u32 peci_request_data_readl(struct peci_request *req)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0return get_unaligned_le32(&req->rx.buf[1]);
>> > +}
>> > +EXPORT_SYMBOL_NS_GPL(peci_request_data_readl, PECI);
>> > +
>> > +u64 peci_request_data_readq(struct peci_request *req)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0return get_unaligned_le64(&req->rx.buf[1]);
>> > +}
>> > +EXPORT_SYMBOL_NS_GPL(peci_request_data_readq, PECI);
>> > +
>> > +u64 peci_request_data_dib(struct peci_request *req)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0return get_unaligned_le64(&req->rx.buf[0]);
>> > +}
>> > +EXPORT_SYMBOL_NS_GPL(peci_request_data_dib, PECI);
>> > +
>> > +#define __read_pkg_config(x, type) \
>> > +struct peci_request *peci_pkg_cfg_##x(struct peci_device *device, u8 =
index,
>> > u16 param) \
>> > +{ \
>> > +=A0=A0=A0=A0=A0=A0=A0return __pkg_cfg_read(device, index, param, size=
of(type)); \
>> > +} \
>>
>> Is there a reason for this particular API?=A0 I'd think a more natural o=
ne
>> that would offload a bit of boilerplate from callers would look more lik=
e
>>
>> int peci_pkg_cfg_##x(struct peci_device *device, u8 index, u16 param, ty=
pe
>> *outp),
>>
>> returning peci_request_status() and writing the requested data to *outp
>> if that status is zero.
>
>We provide a consistent lower-level API for "internal" usage (for code in
>drivers/peci), operating on requests and allowing access to full request,
>including completion code, etc.
>Then - we wrap that with "external" API (e.g. include/linux/peci-cpu.h) wh=
ich is
>the "more natural" one - it pulls out the necessary data from requests, de=
als
>with error handling in an appropriate way converting completion codes to e=
rrno
>values (abstracting away the PECI-specific details).
>
>>
>> > +EXPORT_SYMBOL_NS_GPL(peci_pkg_cfg_##x, PECI)
>> > +
>> > +__read_pkg_config(readb, u8);
>> > +__read_pkg_config(readw, u16);
>> > +__read_pkg_config(readl, u32);
>> > +__read_pkg_config(readq, u64);
>> > diff --git a/include/linux/peci.h b/include/linux/peci.h
>> > index cdf3008321fd..f9f37b874011 100644
>> > --- a/include/linux/peci.h
>> > +++ b/include/linux/peci.h
>> > @@ -9,6 +9,14 @@
>> > #include <linux/mutex.h>
>> > #include <linux/types.h>
>> >
>> > +#define PECI_PCS_PKG_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A00=A0 /* Package Identifier
>> > Read */
>> > +#define=A0 PECI_PKG_ID_CPU_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x00=
00=A0 /* CPUID Info */
>> > +#define=A0 PECI_PKG_ID_PLATFORM_ID=A0=A0=A0=A0=A0=A0=A00x0001=A0 /* P=
latform ID */
>> > +#define=A0 PECI_PKG_ID_DEVICE_ID=A0=A0=A0=A0=A0=A0=A0=A0=A00x0002=A0 =
/* Uncore Device ID */
>> > +#define=A0 PECI_PKG_ID_MAX_THREAD_ID=A0=A0=A0=A0=A00x0003=A0 /* Max T=
hread ID */
>> > +#define=A0 PECI_PKG_ID_MICROCODE_REV=A0=A0=A0=A0=A00x0004=A0 /* CPU M=
icrocode Update
>> > Revision */
>> > +#define=A0 PECI_PKG_ID_MCA_ERROR_LOG=A0=A0=A0=A0=A00x0005=A0 /* Machi=
ne Check Status */
>> > +
>> > struct peci_request;
>> >
>> > /**
>> > @@ -41,6 +49,11 @@ static inline struct peci_controller
>> > *to_peci_controller(void *d)
>> > =A0* struct peci_device - PECI device
>> > =A0* @dev: device object to register PECI device to the device model
>> > =A0* @controller: manages the bus segment hosting this PECI device
>> > + * @info: PECI device characteristics
>> > + * @info.family: device family
>> > + * @info.model: device model
>> > + * @info.peci_revision: PECI revision supported by the PECI device
>> > + * @info.socket_id: the socket ID represented by the PECI device
>> > =A0* @addr: address used on the PECI bus connected to the parent contr=
oller
>> > =A0*
>> > =A0* A peci_device identifies a single device (i.e. CPU) connected to =
a PECI
>> > bus.
>> > @@ -50,6 +63,12 @@ static inline struct peci_controller
>> > *to_peci_controller(void *d)
>> > struct peci_device {
>> > =A0=A0=A0=A0=A0=A0=A0=A0struct device dev;
>> > =A0=A0=A0=A0=A0=A0=A0=A0struct peci_controller *controller;
>> > +=A0=A0=A0=A0=A0=A0=A0struct {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u16 family;
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u8 model;
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u8 peci_revision;
>>
>> This field gets set but doesn't seem to end up used anywhere; is it
>> useful?
>
>The idea was to have mechanism to validate the revision number retrieved v=
ia
>GetDIB with revision expected by the driver (since it uses commands that a=
re
>PECI revision dependent), and warn if there's a mismatch.
>It seems I dropped the "validate and warn" part when doing the split on th=
e
>series. Good catch - I'll fix this in v2.
>
>Thanks
>-Iwona
>
>>
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u8 socket_id;
>> > +=A0=A0=A0=A0=A0=A0=A0} info;
>> > =A0=A0=A0=A0=A0=A0=A0=A0u8 addr;
>> > };
>> >
>> > diff --git a/lib/Kconfig b/lib/Kconfig
>> > index cc28bc1f2d84..a74e6c0fa75c 100644
>> > --- a/lib/Kconfig
>> > +++ b/lib/Kconfig
>> > @@ -721,5 +721,5 @@ config ASN1_ENCODER
>> >
>> > config GENERIC_LIB_X86
>> > =A0=A0=A0=A0=A0=A0=A0=A0bool
>> > -=A0=A0=A0=A0=A0=A0=A0depends on X86
>> > +=A0=A0=A0=A0=A0=A0=A0depends on X86 || PECI
>> > =A0=A0=A0=A0=A0=A0=A0=A0default n
>> > --
>> > 2.31.1
>=
