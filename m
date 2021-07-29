Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A798D3DADE9
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 22:51:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbN3j3fQ3z3cKk
	for <lists+openbmc@lfdr.de>; Fri, 30 Jul 2021 06:51:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=EwKYSfsw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=9844c65846=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=EwKYSfsw; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbN3F5Z5Tz3cHY;
 Fri, 30 Jul 2021 06:50:48 +1000 (AEST)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16TKgob6019324; Thu, 29 Jul 2021 20:50:15 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
 by mx0b-00268f01.pphosted.com with ESMTP id 3a3tk0a98x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jul 2021 20:50:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NES7Kp/9D03MXYQd6tzB5T5nvqZZHZczX1ZxpS0H6erzQVRYkx/HHOTZk+XSypX5pPJjbT3xGSDvCiZZiDxqPcgUcfPlIlSGvbjXwvdeme2IFchz2R4I3+gsqjmUCMD7npOR6k1IIhFXvRYzwflBaO+IzaQDwKIGilVf7CWNL0PJR4ZjhRguACXD092WA2zVD+DBpk56gpFo8ZmVYOWXWi1DkmxSWmrKpT/kIs0DvUB3p95IsvXaIc5KX8ouLf/IelWtQJcFgX1shJCSd7s1cVzTZAwI/BJdfFC8fvC3blVVFeVBo8Lvv/CpSeHgs2L4NwItJx3VQapiAO1KaqC+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNeL72L8iCd+/leG/gVC7SkZWEm8NHKFBt9sz4oGYnY=;
 b=TlR7JLjkf82vUolqaSNvpkqh/v2hbUdRkTYuKvS4ymdsju/UwQ2RkmmM9pNpNiOPPwHAB/dAI7VLeg7wlnF4MxMRi+jxCNAbx+oFGTiZDf8yK569B0Ce7VEufYz/afTG/vO9VUKKot4JiaQTxKiLgFQKNkq6CFie2IGRO/myiu0Oh9cJmbG3wngOemyYd3dNWTYWMj6TMI4D5L/bpYk/kp/g5Jq7VcSRlOlUc1xl4vbjJgLSE0HOyi50dpdxTtOe6p5ENcxl6T+pzeiVoNIUz/lFSx+IfgS4PbT1nowKukFzsxsk4X9T6awEqAbfr7XUJxbnXbOV97g2KKQ2ZXO+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNeL72L8iCd+/leG/gVC7SkZWEm8NHKFBt9sz4oGYnY=;
 b=EwKYSfswYfurKxypF6bvxBAhZ0h2hlDicHLF1n7YMUpv5CCLa1bjYwrhxy0snacm40+fgCy9m/trlQLXxCY5klRp+J0INXBjaDnWztWvwTaZf08yGFKLSC0a/3MDtvUUP595jtMAiGBOVMcFHRdekchYVFnkyIleZR6U69t7PXQ=
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7829.namprd04.prod.outlook.com (2603:10b6:8:3b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 29 Jul
 2021 20:50:13 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b%5]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 20:50:13 +0000
From: Zev Weiss <zweiss@equinix.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [PATCH 08/14] peci: Add device detection
Thread-Topic: [PATCH 08/14] peci: Add device detection
Thread-Index: AQHXgw+vLl0u04R8dUC2G5CmB0KiZataUG2AgAAgG4A=
Date: Thu, 29 Jul 2021 20:50:13 +0000
Message-ID: <20210729205013.GW8018@packtop>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-9-iwona.winiarska@intel.com>
 <20210727174900.GR8018@packtop>
 <47440a8329ce06c41ca9746db42cb1d66154ea46.camel@intel.com>
In-Reply-To: <47440a8329ce06c41ca9746db42cb1d66154ea46.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 461ce947-86fb-40de-c456-08d952d276bf
x-ms-traffictypediagnostic: DM8PR04MB7829:
x-microsoft-antispam-prvs: <DM8PR04MB782987A0EA48D17B10CCFE7DC3EB9@DM8PR04MB7829.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jbb/50gBwchHZUlFwGD036I2QLR6mcz5c5BbgNTpzE7r4K8CoXDlYkOomTvVG40HWlXa4lFj9RdY37AbDx2C+N51mWx2I350zlNvuJk4Uxp2A4qXhFtgsrvSuKjhEQg1l58W2WJMEhMm3RiCkCHsYGezm099ZuhLfXy4Y2AZ0LimPiQm570qqQZDGlnNcRmwxjsxyXe8jKZHEV0+lZPrg1ry/ugUbvVK3BjXTNna60FDwtMlV0MSipfMhd5fNIxEFsLfjL4KrW8ttppSI2E4GkUd4WXWMIHoiXFH3HbP6PdrQ061lUWnBZl+fGvWmWgjZy0Bj8bSbhGyKLnPTLHntvHKusvyx5h9n03gVU3ufVZTcqa4ugfjVat92hdMd5/yGwpnalNlfv6PcZj4pzh7fI1wpVc3cSTStQ45Fr1dyfplxfw8ACJwq+jetmpvJM3DnhPaqXFM8mPezthlOz1UAM5jc3w70QLK7E57NwGAnpjtmJEpYMlD2y/EwsVK4TnHEpBbHCjWRzlzjM7SPGcrCZxW6hKURL25Ph1ygkSc/pCl8WD2asdAc79Re6bRCIrsH9O2BAclrKMlM0R13lV0rwoFmVIwMwZiWwbRsvsDpiOhZAbamz92DaSW+pMtORmIzfAm10I8aXCyIwkzIVn2Ht1yBuaTw10jNPLDIog6PQJvsAGLBcnMtIiPWcheSPdxfXC8mbI/CJ4y75AfBRHYzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(7416002)(66556008)(86362001)(316002)(5660300002)(66476007)(66446008)(71200400001)(64756008)(8676002)(83380400001)(6916009)(30864003)(38100700002)(2906002)(26005)(38070700005)(66946007)(1076003)(76116006)(508600001)(186003)(8936002)(33716001)(33656002)(6486002)(4326008)(6512007)(9686003)(6506007)(122000001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+heh0h9g70kcjkEQS2t64qP+zwHZoQXYHlABlDjcJ892OE7UXk25y7ONRq?=
 =?iso-8859-1?Q?e9sg+uCZxr5g8ZTX/+7SetaM2yl51UI31rFs4nuzYLNySWwsOC2aGBbKmg?=
 =?iso-8859-1?Q?oYGXHvOWwWrQaakdq2GFesDpfpPvv769GAKyGP3/l/brnXBTmtxdfJebnc?=
 =?iso-8859-1?Q?JNmSsWUt9rr3M1MVphBH/xVaZveEwRN8ZHTrYjzx4ax/BBzE38xQ/SQIYe?=
 =?iso-8859-1?Q?vK9tgMeoWphXWL96NQQdf7zdGs+z3izXOEA909CF7cUjyNJeiKizEaS2RV?=
 =?iso-8859-1?Q?F1+yM+NZJgjnPPTcf93wRsxxwdPA5kRtJu9sczOnTgIZzvGpSrFRE9nHHI?=
 =?iso-8859-1?Q?+m0HI3JzCLn9PCwCavUfw7VJg3b+pb9ilHdVsarBeQzD6muZ0Wm60bu/Sf?=
 =?iso-8859-1?Q?ABXLpoadpqaiazGz+MAR0nH7a99Kr+EpzMYje/I3zu+Ov8hM8ax+/KAwDk?=
 =?iso-8859-1?Q?Yvv1o36D0gzjP21HlxNyXJrpco+S61HFJ8MjarG60uTqdTcRSd59uWgubi?=
 =?iso-8859-1?Q?jkkFzIk8Q1Q+gZ5DZW4fJhpqjD1py1A/y1Kbbx8b3T07Qo0gKFCdgXKA9r?=
 =?iso-8859-1?Q?t73w2iw3eDv4tG/vnYxOSsJAUH/bYhb4LDR2xefn49m2RHJMymk5V0e3wm?=
 =?iso-8859-1?Q?x0hq55XtRFiFg5FHTihztDpB5g8BVbaGBQJ/ef+yiVnIipyA3N9BdlWQDF?=
 =?iso-8859-1?Q?fKNoY9N8x6ndJJ4/kciYvYjzkHJjOcTmpWrwrxB8x7XV8jrzowazWn7Utb?=
 =?iso-8859-1?Q?Cv3S6tUSnQf0qsOfXgq+G6lsbx+xJK1nvzjf6TDA1R6uuG7ueUypjhLxVQ?=
 =?iso-8859-1?Q?0czL/2kOfqhVHuNcFi/ATEKfikTpYsPATsIkkauiqBaJGpZf2MffQgFP+v?=
 =?iso-8859-1?Q?7JIETf2Jmf8dQSZYhaJ9TIIOZJPWOBU/mYCKjPnhbov9/B1zlaoTbKO36X?=
 =?iso-8859-1?Q?HaiUBt02EZVF8zVbuqO112SU5WTCuzJc8v17g9+8BurKeCdyB40KS9Re0Z?=
 =?iso-8859-1?Q?ii2Yv8BRMBZOLwuz+YHaWi/NmjvuKwlbsQj9CrhiWjbM/xJNa9B1JNwyCo?=
 =?iso-8859-1?Q?vmULZjVJl3wXQxjD+eJlHzXq/MacTCsUnEL14lTrSA1hXAt+WxS2Qu3A2X?=
 =?iso-8859-1?Q?/qe+IhLUBYInYJ1BeiDNSBCUVQvm0KrI6SvtX9pMH7fqJAOg8sxxVqzLak?=
 =?iso-8859-1?Q?Q5NjiVnOGvtkcsfdBp/ax55XIqgmn/mnm6g2a1ZTnwjxfp3MKOwSMqRCyI?=
 =?iso-8859-1?Q?KLnJhusHdKu6uXoGdAx9WUAExESYhNheC/4uDJf6Fslezo3jrrxZIcBlvm?=
 =?iso-8859-1?Q?J8J8K0IuBlbjX/JlUC24wAUctT5Q4lBgKLLxJ4DwR9kbMvVbCCieAguMWg?=
 =?iso-8859-1?Q?qFamOGW6m4?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E7B6096901FFC3409BE0D3E56B4E6917@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 461ce947-86fb-40de-c456-08d952d276bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 20:50:13.8066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4Xtgf/rmInB+tjITGs9zJMgz4Syz8YXlfcNkbw/xBvpe0QIrcOZgN9nGxgXD0G6n0cGZ9WKqrKpkcrHnuoo4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7829
X-Proofpoint-GUID: vrDJsQS320atuzjWTJ1ktMo0a3DRXo9N
X-Proofpoint-ORIG-GUID: vrDJsQS320atuzjWTJ1ktMo0a3DRXo9N
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-29_16:2021-07-29,
 2021-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107290127
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

On Thu, Jul 29, 2021 at 01:55:19PM CDT, Winiarska, Iwona wrote:
>On Tue, 2021-07-27 at 17:49 +0000, Zev Weiss wrote:
>> On Mon, Jul 12, 2021 at 05:04:41PM CDT, Iwona Winiarska wrote:
>> > Since PECI devices are discoverable, we can dynamically detect devices
>> > that are actually available in the system.
>> >
>> > This change complements the earlier implementation by rescanning PECI
>> > bus to detect available devices. For this purpose, it also introduces =
the
>> > minimal API for PECI requests.
>> >
>> > Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.co=
m>
>> > ---
>> > drivers/peci/Makefile=A0=A0 |=A0=A0 2 +-
>> > drivers/peci/core.c=A0=A0=A0=A0 |=A0 13 ++++-
>> > drivers/peci/device.c=A0=A0 | 111 ++++++++++++++++++++++++++++++++++++=
++++
>> > drivers/peci/internal.h |=A0 15 ++++++
>> > drivers/peci/request.c=A0 |=A0 74 +++++++++++++++++++++++++++
>> > drivers/peci/sysfs.c=A0=A0=A0 |=A0 34 ++++++++++++
>> > 6 files changed, 246 insertions(+), 3 deletions(-)
>> > create mode 100644 drivers/peci/device.c
>> > create mode 100644 drivers/peci/request.c
>> >
>> > diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
>> > index 621a993e306a..917f689e147a 100644
>> > --- a/drivers/peci/Makefile
>> > +++ b/drivers/peci/Makefile
>> > @@ -1,7 +1,7 @@
>> > # SPDX-License-Identifier: GPL-2.0-only
>> >
>> > # Core functionality
>> > -peci-y :=3D core.o sysfs.o
>> > +peci-y :=3D core.o request.o device.o sysfs.o
>> > obj-$(CONFIG_PECI) +=3D peci.o
>> >
>> > # Hardware specific bus drivers
>> > diff --git a/drivers/peci/core.c b/drivers/peci/core.c
>> > index 0ad00110459d..ae7a9572cdf3 100644
>> > --- a/drivers/peci/core.c
>> > +++ b/drivers/peci/core.c
>> > @@ -31,7 +31,15 @@ struct device_type peci_controller_type =3D {
>> >
>> > int peci_controller_scan_devices(struct peci_controller *controller)
>> > {
>> > -=A0=A0=A0=A0=A0=A0=A0/* Just a stub, no support for actual devices ye=
t */
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +=A0=A0=A0=A0=A0=A0=A0u8 addr;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0for (addr =3D PECI_BASE_ADDR; addr < PECI_BASE_A=
DDR +
>> > PECI_DEVICE_NUM_MAX; addr++) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D peci_device_crea=
te(controller, addr);
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (ret)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
return ret;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > =A0=A0=A0=A0=A0=A0=A0=A0return 0;
>> > }
>> >
>> > @@ -106,7 +114,8 @@ EXPORT_SYMBOL_NS_GPL(peci_controller_add, PECI);
>> >
>> > static int _unregister(struct device *dev, void *dummy)
>> > {
>> > -=A0=A0=A0=A0=A0=A0=A0/* Just a stub, no support for actual devices ye=
t */
>> > +=A0=A0=A0=A0=A0=A0=A0peci_device_destroy(to_peci_device(dev));
>> > +
>> > =A0=A0=A0=A0=A0=A0=A0=A0return 0;
>> > }
>> >
>> > diff --git a/drivers/peci/device.c b/drivers/peci/device.c
>> > new file mode 100644
>> > index 000000000000..1124862211e2
>> > --- /dev/null
>> > +++ b/drivers/peci/device.c
>> > @@ -0,0 +1,111 @@
>> > +// SPDX-License-Identifier: GPL-2.0-only
>> > +// Copyright (c) 2018-2021 Intel Corporation
>> > +
>> > +#include <linux/peci.h>
>> > +#include <linux/slab.h>
>> > +
>> > +#include "internal.h"
>> > +
>> > +static int peci_detect(struct peci_controller *controller, u8 addr)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_request *req;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0req =3D peci_request_alloc(NULL, 0, 0);
>> > +=A0=A0=A0=A0=A0=A0=A0if (!req)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -ENOMEM;
>> > +
>>
>> Might be worth a brief comment here noting that an empty request happens
>> to be the format of a PECI ping command (and/or change the name of the
>> function to peci_ping()).
>
>I'll add a comment:
>"We are using PECI Ping command to detect presence of PECI devices."
>

Well, what I was more aiming to get at was that to someone not
intimately familiar with the PECI protocol it's not immediately obvious
from the code that it in fact implements a ping (there's no 'msg->cmd =3D
PECI_CMD_PING' or anything), so I was hoping for something that would
just make that slightly more explicit.

>>
>> > +=A0=A0=A0=A0=A0=A0=A0mutex_lock(&controller->bus_lock);
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D controller->xfer(controller, addr, req);
>> > +=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&controller->bus_lock);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0peci_request_free(req);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return ret;
>> > +}
>> > +
>> > +static bool peci_addr_valid(u8 addr)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0return addr >=3D PECI_BASE_ADDR && addr < PECI_B=
ASE_ADDR +
>> > PECI_DEVICE_NUM_MAX;
>> > +}
>> > +
>> > +static int peci_dev_exists(struct device *dev, void *data)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_device *device =3D to_peci_device(de=
v);
>> > +=A0=A0=A0=A0=A0=A0=A0u8 *addr =3D data;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (device->addr =3D=3D *addr)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EBUSY;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return 0;
>> > +}
>> > +
>> > +int peci_device_create(struct peci_controller *controller, u8 addr)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_device *device;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (WARN_ON(!peci_addr_valid(addr)))
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
>>
>> Wondering about the necessity of this check (and the peci_addr_valid()
>> function) -- as of the end of this patch series, there's only one caller
>> of peci_device_create(), and it's peci_controller_scan_devices() looping
>> from PECI_BASE_ADDR to PECI_BASE_ADDR + PECI_DEVICE_NUM_MAX, so
>> checking that the address is in that range seems a bit redundant.=A0 Do =
we
>> anticipate that we might gain additional callers in the future that
>> could run a non-zero risk of passing a bad address?
>
>It's just a sanity check to avoid any surprises if the code changes in the
>future.
>
>>
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0/* Check if we have already detected this device=
 before. */
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D device_for_each_child(&controller->dev, =
&addr,
>> > peci_dev_exists);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return 0;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D peci_detect(controller, addr);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/*
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * Device not present or=
 host state doesn't allow successful
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * detection at this tim=
e.
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (ret =3D=3D -EIO || r=
et =3D=3D -ETIMEDOUT)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
return 0;
>>
>> Do we really want to be ignoring EIO here?=A0 From a look at
>> aspeed_peci_xfer(), it looks like the only path that would produce that
>> is the non-timeout, non-CMD_DONE case, which I guess happens on
>> contention or FCS errors and such.=A0 Should we maybe have some automati=
c
>> (limited) retry loop for cases like those?
>
>Yes, we want to ignore EIO here.
>It may be returned when we get "Bad Write FCS", after we try to ping non-
>existing PECI device.
>
>>
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0device =3D kzalloc(sizeof(*device), GFP_KERNEL);
>> > +=A0=A0=A0=A0=A0=A0=A0if (!device)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -ENOMEM;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0device->controller =3D controller;
>> > +=A0=A0=A0=A0=A0=A0=A0device->addr =3D addr;
>> > +=A0=A0=A0=A0=A0=A0=A0device->dev.parent =3D &device->controller->dev;
>> > +=A0=A0=A0=A0=A0=A0=A0device->dev.bus =3D &peci_bus_type;
>> > +=A0=A0=A0=A0=A0=A0=A0device->dev.type =3D &peci_device_type;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D dev_set_name(&device->dev, "%d-%02x", co=
ntroller->id, device-
>> > >addr);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto err_free;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D device_register(&device->dev);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto err_put;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return 0;
>> > +
>> > +err_put:
>> > +=A0=A0=A0=A0=A0=A0=A0put_device(&device->dev);
>> > +err_free:
>> > +=A0=A0=A0=A0=A0=A0=A0kfree(device);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return ret;
>> > +}
>> > +
>> > +void peci_device_destroy(struct peci_device *device)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0device_unregister(&device->dev);
>> > +}
>> > +
>> > +static void peci_device_release(struct device *dev)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_device *device =3D to_peci_device(de=
v);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0kfree(device);
>> > +}
>> > +
>> > +struct device_type peci_device_type =3D {
>> > +=A0=A0=A0=A0=A0=A0=A0.groups=A0=A0=A0=A0=A0=A0=A0=A0=A0=3D peci_devic=
e_groups,
>> > +=A0=A0=A0=A0=A0=A0=A0.release=A0=A0=A0=A0=A0=A0=A0=A0=3D peci_device_=
release,
>> > +};
>> > diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
>> > index 80c61bcdfc6b..6b139adaf6b8 100644
>> > --- a/drivers/peci/internal.h
>> > +++ b/drivers/peci/internal.h
>> > @@ -9,6 +9,21 @@
>> >
>> > struct peci_controller;
>> > struct attribute_group;
>> > +struct peci_device;
>> > +struct peci_request;
>> > +
>> > +/* PECI CPU address range 0x30-0x37 */
>> > +#define PECI_BASE_ADDR=A0=A0=A0=A0=A0=A0=A0=A0=A00x30
>> > +#define PECI_DEVICE_NUM_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A08
>> > +
>> > +struct peci_request *peci_request_alloc(struct peci_device *device, u=
8
>> > tx_len, u8 rx_len);
>> > +void peci_request_free(struct peci_request *req);
>> > +
>> > +extern struct device_type peci_device_type;
>> > +extern const struct attribute_group *peci_device_groups[];
>> > +
>> > +int peci_device_create(struct peci_controller *controller, u8 addr);
>> > +void peci_device_destroy(struct peci_device *device);
>> >
>> > extern struct bus_type peci_bus_type;
>> > extern const struct attribute_group *peci_bus_groups[];
>> > diff --git a/drivers/peci/request.c b/drivers/peci/request.c
>> > new file mode 100644
>> > index 000000000000..78cee51dfae1
>> > --- /dev/null
>> > +++ b/drivers/peci/request.c
>> > @@ -0,0 +1,74 @@
>> > +// SPDX-License-Identifier: GPL-2.0-only
>> > +// Copyright (c) 2021 Intel Corporation
>> > +
>> > +#include <linux/export.h>
>> > +#include <linux/peci.h>
>> > +#include <linux/slab.h>
>> > +#include <linux/types.h>
>> > +
>> > +#include "internal.h"
>> > +
>> > +/**
>> > + * peci_request_alloc() - allocate &struct peci_request with buffers =
with
>> > given lengths
>> > + * @device: PECI device to which request is going to be sent
>> > + * @tx_len: requested TX buffer length
>> > + * @rx_len: requested RX buffer length
>> > + *
>> > + * Return: A pointer to a newly allocated &struct peci_request on suc=
cess
>> > or NULL otherwise.
>> > + */
>> > +struct peci_request *peci_request_alloc(struct peci_device *device, u=
8
>> > tx_len, u8 rx_len)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_request *req;
>> > +=A0=A0=A0=A0=A0=A0=A0u8 *tx_buf, *rx_buf;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0req =3D kzalloc(sizeof(*req), GFP_KERNEL);
>> > +=A0=A0=A0=A0=A0=A0=A0if (!req)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return NULL;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0req->device =3D device;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0/*
>> > +=A0=A0=A0=A0=A0=A0=A0 * PECI controllers that we are using now don't =
support DMA, this
>> > +=A0=A0=A0=A0=A0=A0=A0 * should be converted to DMA API once support f=
or controllers that
>> > do
>> > +=A0=A0=A0=A0=A0=A0=A0 * allow it is added to avoid an extra copy.
>> > +=A0=A0=A0=A0=A0=A0=A0 */
>> > +=A0=A0=A0=A0=A0=A0=A0if (tx_len) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0tx_buf =3D kzalloc(tx_le=
n, GFP_KERNEL);
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (!tx_buf)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
goto err_free_req;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0req->tx.buf =3D tx_buf;
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0req->tx.len =3D tx_len;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (rx_len) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0rx_buf =3D kzalloc(rx_le=
n, GFP_KERNEL);
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (!rx_buf)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
goto err_free_tx;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0req->rx.buf =3D rx_buf;
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0req->rx.len =3D rx_len;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>>
>> As long as we're punting on DMA support, could we do the whole thing in
>> a single allocation instead of three?=A0 It'd add some pointer arithmeti=
c,
>> but would also simplify the error-handling/deallocation paths a bit.
>>
>> Or, given that the one controller we're currently supporting has a
>> hardware limit of 32 bytes per transfer anyway, maybe just inline
>> fixed-size rx/tx buffers into struct peci_request and have callers keep
>> them on the stack instead of kmalloc()-ing them?
>
>I disagree on error handling (it's not complicated) - however, one argumen=
t for
>doing a single alloc (or moving the buffers as fixed-size arrays inside st=
ruct
>peci_request) is that single kzalloc is going to be faster than 3. But I d=
on't
>expect it to show up on any perf profiles for now (since peci-wire interfa=
ce is
>not a speed demon).
>
>I wanted to avoid defining max size for TX and RX in peci-core.
>Do you have a strong opinion against multiple alloc? If yes, I can go with
>fixed-size arrays inside struct peci_request.
>

As is it's certainly not terribly complicated in an absolute sense, but
comparatively speaking the cleanup path for a single allocation is still
simpler, no?

Making it more efficient would definitely be a nice benefit too (perhaps
a more significant one) -- in a typical deployment I'd guess this code
path will see roughly socket_count + total_core_count executions per
second?  On a big multi-socket system that could end up being a
reasonably large number (>100), so while it may not end up as a major
hot spot in a system-wide profile, it seems like it might be worth
having it do 1/3 as many allocations if it's reasonably easy to do.
(And while I don't think the kernel is generally at fault for this, from
what I've seen of OpenBMC as a whole I think it might benefit from a bit
more overall frugality with CPU cycles.)

As for a fixed max request size and inlined buffers, I definitely
understand not wanting to put a cap on that in the generic PECI core --
and actually, looking at the peci-npcm code from previous iterations of
the PECI patchset, it looks like the Nuvoton hardware has significantly
larger size limits (127 bytes if I'm reading things right) that might be
a bit bulky for on-stack allocation.  So while that's appealing
efficiency-wise and (IMO) aesthetically, perhaps it's not ultimately
real viable.

Hmm, though (thinking out loud) I suppose we could also get down to a
zero-allocation common case by having the driver hold on to a request
struct and reuse it across transfers, given that they're all serialized
by a mutex anyway?

>Thanks
>-Iwona
>
>>
>> > +=A0=A0=A0=A0=A0=A0=A0return req;
>> > +
>> > +err_free_tx:
>> > +=A0=A0=A0=A0=A0=A0=A0kfree(req->tx.buf);
>> > +err_free_req:
>> > +=A0=A0=A0=A0=A0=A0=A0kfree(req);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return NULL;
>> > +}
>> > +EXPORT_SYMBOL_NS_GPL(peci_request_alloc, PECI);
>> > +
>> > +/**
>> > + * peci_request_free() - free peci_request
>> > + * @req: the PECI request to be freed
>> > + */
>> > +void peci_request_free(struct peci_request *req)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0kfree(req->rx.buf);
>> > +=A0=A0=A0=A0=A0=A0=A0kfree(req->tx.buf);
>> > +=A0=A0=A0=A0=A0=A0=A0kfree(req);
>> > +}
>> > +EXPORT_SYMBOL_NS_GPL(peci_request_free, PECI);
>> > diff --git a/drivers/peci/sysfs.c b/drivers/peci/sysfs.c
>> > index 36c5e2a18a92..db9ef05776e3 100644
>> > --- a/drivers/peci/sysfs.c
>> > +++ b/drivers/peci/sysfs.c
>> > @@ -1,6 +1,8 @@
>> > // SPDX-License-Identifier: GPL-2.0-only
>> > // Copyright (c) 2021 Intel Corporation
>> >
>> > +#include <linux/device.h>
>> > +#include <linux/kernel.h>
>> > #include <linux/peci.h>
>> >
>> > #include "internal.h"
>> > @@ -46,3 +48,35 @@ const struct attribute_group *peci_bus_groups[] =3D=
 {
>> > =A0=A0=A0=A0=A0=A0=A0=A0&peci_bus_group,
>> > =A0=A0=A0=A0=A0=A0=A0=A0NULL
>> > };
>> > +
>> > +static ssize_t remove_store(struct device *dev, struct device_attribu=
te
>> > *attr,
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 const char *buf, size_t count)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_device *device =3D to_peci_device(de=
v);
>> > +=A0=A0=A0=A0=A0=A0=A0bool res;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D kstrtobool(buf, &res);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (res && device_remove_file_self(dev, attr))
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0peci_device_destroy(devi=
ce);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return count;
>> > +}
>> > +static DEVICE_ATTR_IGNORE_LOCKDEP(remove, 0200, NULL, remove_store);
>> > +
>> > +static struct attribute *peci_device_attrs[] =3D {
>> > +=A0=A0=A0=A0=A0=A0=A0&dev_attr_remove.attr,
>> > +=A0=A0=A0=A0=A0=A0=A0NULL
>> > +};
>> > +
>> > +static const struct attribute_group peci_device_group =3D {
>> > +=A0=A0=A0=A0=A0=A0=A0.attrs =3D peci_device_attrs,
>> > +};
>> > +
>> > +const struct attribute_group *peci_device_groups[] =3D {
>> > +=A0=A0=A0=A0=A0=A0=A0&peci_device_group,
>> > +=A0=A0=A0=A0=A0=A0=A0NULL
>> > +};
>> > --
>> > 2.31.1
>=
