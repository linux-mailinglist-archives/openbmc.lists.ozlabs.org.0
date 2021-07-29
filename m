Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EF33DAAD2
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 20:16:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbJdN20FZz3cL0
	for <lists+openbmc@lfdr.de>; Fri, 30 Jul 2021 04:16:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=V27UgATg;
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
 header.s=selector2-equinixinc-onmicrosoft-com header.b=V27UgATg; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbJcy356Lz2ydk;
 Fri, 30 Jul 2021 04:16:17 +1000 (AEST)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16TIDZQE020693; Thu, 29 Jul 2021 18:15:36 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0a-00268f01.pphosted.com with ESMTP id 3a41e20041-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jul 2021 18:15:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXpU8zsT7cWsikfHAxbLMScawCSbDvEB2LzxyvEH4Dr7WWv12W5jpfRfUAkMG/lvj/f/g2U8L7hIp5EANSPvmfZBIWwZev11SRi7ODzCEq2K2K4oPNcNBwi82K+KGvkJbmq4DP6Bz21wkHPIJaptKZgJqhu9Gp3AfW5LsZ4Ez+SRWwPIOiMVCyWoH76I7dPPBkHzR7p/YTVJn8bWR6f8G0rmiZR00antm+Z0lLgE/+Kin18ELc7e88ubnmaTlX4XcnlPa2Uvz/a1ZZRJcyQLnCIXYrN7NuVVOSc8+pXK2U+p7r5N5LfZlg1YdIOE26bJ4RUI56IK7GEFChKMEs53Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKw69RWn2x/nEfTSm6hjLz3rVg9/JSdLLz+5+itfqVg=;
 b=eGxMVXdIUFlylqtLWW0nncgYGUAi0MrKQkGlVl3J+5T/Ru7+UCrX12YXofYKMRpFru4YCXH/6MGgkXAy22lCg6l4ZtCPw/KkC/rUx/oYnLAXcPgALVg5/aZC75wgfPzlKByLf7cC9fswb/oTvpG/Fr5yDAB42AHYL9Z3cXP+HfuSwe2I/uO/WLPlAE2UGvkvqYlTI/k8ZuVNzYSAJJq7KjB7cudD7ZKctVEZhjf6MFTU7o2HTxmvMj6ipNBGabPsiXfwIRtsJby8aEOo1FlLLtmCFel9Kkw/R4/rr1qQX3BDa84BBfZPNoWEEDHvesFICuQL7fQUGTi5L07VdfCzYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKw69RWn2x/nEfTSm6hjLz3rVg9/JSdLLz+5+itfqVg=;
 b=V27UgATg1ooNLT4rW2wuS/NGPKPPJwtQ7N+QszcL4GIhWuSCLLD2E451Ud6LK3sP3BLoLWfCYKRrLDaPqoNRmRuOEmNjL1A06fvejvVWnumdH6SqNnyN4jNPtaC6E3mQNDS26jZjrNzvgcj8gdUMWn1xZS9Z3kRslqXZrDeTFBY=
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7942.namprd04.prod.outlook.com (2603:10b6:8:1::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.19; Thu, 29 Jul 2021 18:15:34 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b%5]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 18:15:34 +0000
From: Zev Weiss <zweiss@equinix.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [PATCH 07/14] peci: Add peci-aspeed controller driver
Thread-Topic: [PATCH 07/14] peci: Add peci-aspeed controller driver
Thread-Index: AQHXgsQ/2U+11kOJzUGhN2GLpjgplKtZ/3oAgABGboA=
Date: Thu, 29 Jul 2021 18:15:33 +0000
Message-ID: <20210729181533.GV8018@packtop>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-8-iwona.winiarska@intel.com>
 <20210727084901.GQ8018@packtop>
 <e6b7588abe48b00b2822ab4614ec0600f9e044f0.camel@intel.com>
In-Reply-To: <e6b7588abe48b00b2822ab4614ec0600f9e044f0.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 772926cd-3550-42e4-d890-08d952bcdb99
x-ms-traffictypediagnostic: DM8PR04MB7942:
x-microsoft-antispam-prvs: <DM8PR04MB7942A0F79BD4E33C3A97B15AC3EB9@DM8PR04MB7942.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NA2v3OmFEk6jpQg3bCmI2KaO9OtnCxZL1wEBMyGsSP6zf654FepqpTNrwGm+VSHf7dyqjSMEqmNxxHmC0+1GDVFQxYjFCSGKflNmF43eIaFx4SgZvSw7Fkl777FYG5AcsTiRJjueHmSjgbsmC6/DCaSSE+7fjtO0I2F60zhqcbOqB/9JhcieDoKUSJ40R0B+HYpDgN3ors2VHgWARbD6nvM4teAcJmSj2ghh628ZUWHidNUv9emgF1M4Rrprp62J7qLeJrQoPIN3SDRSEBVaG4KoVdOraH438GwWm6ckwEFlmsNVIwiBsVwm/6LHsuHPbni6vjQ8uN1H3oYYOGEOghzhYJnHjjmj3gfeR/wFr24f1TGYh2dGiKVg+0RvJshfM8RHdSJXpIUN594Vkhof/VxtOYda7gzxvI1OU39p8oag2FM61HXqo2v7dCKZscLHH8LyS4Tu/VsR5bYmCMHk6jenusb9QTY3OgKii+sC2eOBi7FJQutFqtZM7Yf4DWS7u2Kx2HoCFROUjbl5F5qdMz2rpSiZPsCm1MiG1Yrh0D5DN6tx7YNjGsXdiqWmLrkDKiBhnzHeTr8WzqBW5rAA7C9XxkaWlbM1NA7SlDoxUZJVxiz/eZ6eX8VQjxYUXd1+jMpkiyKoAZPDCKSB6bph86PK1xzqF81lMEShcupN7Lx14IvQdTYUx9Vl2A/XiH6C3MsuQxZoC8bfL4yWDtc0DA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(136003)(376002)(366004)(396003)(39860400002)(346002)(2906002)(86362001)(19627235002)(33656002)(8936002)(6916009)(71200400001)(76116006)(83380400001)(478600001)(33716001)(6506007)(5660300002)(7416002)(9686003)(6512007)(26005)(38100700002)(66556008)(54906003)(64756008)(66476007)(66946007)(38070700005)(122000001)(6486002)(30864003)(316002)(8676002)(186003)(1076003)(4326008)(66446008)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?aT05s0ziPzOwLOyIVl+0ODFITHfiQMjeVvraw2LtpvFOrrD+We2VEPMEXj?=
 =?iso-8859-1?Q?ol5KOU5crClUpUwGJRjAa7pr4iEdYWvxsFscQp5rfCss3mr5I7j/mSfgea?=
 =?iso-8859-1?Q?iy/bW9yHISkWxMq6W8tazc2lPHN4Fuvk4xdSpelnxh0GZJpri47oAo7G3Y?=
 =?iso-8859-1?Q?kNif1jqLxidblVWR867xMUjxVNiQ3xngBU9kMPNnTzJH9oF+MNSzUrsVMJ?=
 =?iso-8859-1?Q?IiHlj6PxSuwDRQ8qpfLCPcKhRlDmvrzvigYZR+pFA1KlSjPEx8noS2Fm72?=
 =?iso-8859-1?Q?HdC2N2RYXA2h1k5Y46OAGWsIPAVAoIzemn1/7kaRZHVs0UOlQ7nAZbHHVk?=
 =?iso-8859-1?Q?Q1kq+tPF0bfuTr2HEhdNcS4CKdmdYruKzWRqvKqaA+faEHlHBCLk8M6C7C?=
 =?iso-8859-1?Q?cr89bphy2wDUQszdHzw1Colfep8mVzlbTdsbnKZ1vtOanckvtFklhP0Dh8?=
 =?iso-8859-1?Q?GYwATcHDIit5NqY55ZG96u7Yg7pVOwEbxoxBl8BsSQs1WFTtBg4n4dHQzm?=
 =?iso-8859-1?Q?bmpKIZhqxByY+j/9F29y9zyM+0UnmuBGlUkiUO7I4qVoRNKNqwgvuIjM9J?=
 =?iso-8859-1?Q?3i4/rOLDskshObw9ol2Y/W0OtCiMLimuLie/HhhKlIFe+LNirVV3WfIfly?=
 =?iso-8859-1?Q?5SLkUnChHzhPzFVQAZ5/nPOv8BVoipoIoEdqJDcjJVsB4NodnZX/AJV2+2?=
 =?iso-8859-1?Q?tJPNc6mOJlM7fy4i4KA2YPh00+JvWawVtWwhoNAJkXa/hPs0wYMHrqlq3R?=
 =?iso-8859-1?Q?gVztzouyl+dBLItAvOptwCJ7plHDyaDoq6hGjXA1lYP1emwImXe4iOQKni?=
 =?iso-8859-1?Q?4TAlS49/GLn5V6vyhWLAk4EtjPsB0DhFsWamd9iG2micCB3nsUkcYEtbvn?=
 =?iso-8859-1?Q?zZwYVPCNam60A6+bus+xplDSyRqzAU94yXbSBowfBmlYDNjJtdAdXLgmQQ?=
 =?iso-8859-1?Q?MbC3BFhyo2YbwtiUrAE0oGUruLPfRbTIFu1WXWUZf7u2DbHh8UuAyUNdVr?=
 =?iso-8859-1?Q?VrXBnXUw0+F2Jx5gAx7wltq718qpsNSXiHgtn3wfONQ63/UKYRpS7bIOf4?=
 =?iso-8859-1?Q?xDa/k16WunG4rrVKA7NZXCxa4aAlQy4dg8MFSdJvgkDZFa7L2xEBPgfLhx?=
 =?iso-8859-1?Q?wU7u//U2flrF6xNV4WMVmFgTvOAjqeK5t1zFiawMWvZyhB/2VmMl1+MQoB?=
 =?iso-8859-1?Q?U44jM6+ZmCdFcnLoo2XO9GXmgEyPJCSBduV2W/VE8aQAH1OWXN7jy5l2Fg?=
 =?iso-8859-1?Q?4MUq+50qDpIExNnyQPmrETcPcdYTt6FhwZGeZn5MOOrcPDcTb5vMrgiMQj?=
 =?iso-8859-1?Q?a8M2paELkrULSUQahPOKEouxWmwAFYuBgBlTvImThWbtpPb2SsjHOJlpzc?=
 =?iso-8859-1?Q?W14oZhomJX?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E7AF718C6AABD547BD98A14D19191A43@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772926cd-3550-42e4-d890-08d952bcdb99
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 18:15:33.9067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a18TSt/fpoV0jwFxkr1VLJcy4PMS6cyqaafCdFHvwjS+dpIs4aKyq3RlpDrqMrUJtThSWTfISRkKpwH1TiYrbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7942
X-Proofpoint-ORIG-GUID: GSSAYqqK9Ry_81Amh8YnrRoylKFfkd_p
X-Proofpoint-GUID: GSSAYqqK9Ry_81Amh8YnrRoylKFfkd_p
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-29_14:2021-07-29,
 2021-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107290114
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

On Thu, Jul 29, 2021 at 09:03:28AM CDT, Winiarska, Iwona wrote:
>On Tue, 2021-07-27 at 08:49 +0000, Zev Weiss wrote:
>> On Mon, Jul 12, 2021 at 05:04:40PM CDT, Iwona Winiarska wrote:
>> > From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> >
>> > ASPEED AST24xx/AST25xx/AST26xx SoCs supports the PECI electrical
>> > interface (a.k.a PECI wire).
>> >
>> > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> > Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
>> > Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.co=
m>
>> > ---
>> > MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 9 +
>> > drivers/peci/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 6 +
>> > drivers/peci/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0=A0 3 +
>> > drivers/peci/controller/Kconfig=A0=A0=A0=A0=A0=A0 |=A0 12 +
>> > drivers/peci/controller/Makefile=A0=A0=A0=A0=A0 |=A0=A0 3 +
>> > drivers/peci/controller/peci-aspeed.c | 501 ++++++++++++++++++++++++++
>> > 6 files changed, 534 insertions(+)
>> > create mode 100644 drivers/peci/controller/Kconfig
>> > create mode 100644 drivers/peci/controller/Makefile
>> > create mode 100644 drivers/peci/controller/peci-aspeed.c
>> >
>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> > index 47411e2b6336..4ba874afa2fa 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -2865,6 +2865,15 @@ S:=A0=A0=A0=A0=A0=A0=A0Maintained
>> > F:=A0=A0=A0=A0=A0=A0Documentation/hwmon/asc7621.rst
>> > F:=A0=A0=A0=A0=A0=A0drivers/hwmon/asc7621.c
>> >
>> > +ASPEED PECI CONTROLLER
>> > +M:=A0=A0=A0=A0=A0Iwona Winiarska <iwona.winiarska@intel.com>
>> > +M:=A0=A0=A0=A0=A0Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> > +L:=A0=A0=A0=A0=A0linux-aspeed@lists.ozlabs.org=A0(moderated for non-s=
ubscribers)
>> > +L:=A0=A0=A0=A0=A0openbmc@lists.ozlabs.org=A0(moderated for non-subscr=
ibers)
>> > +S:=A0=A0=A0=A0=A0Supported
>> > +F:=A0=A0=A0=A0=A0Documentation/devicetree/bindings/peci/peci-aspeed.y=
aml
>> > +F:=A0=A0=A0=A0=A0drivers/peci/controller/peci-aspeed.c
>> > +
>> > ASPEED PINCTRL DRIVERS
>> > M:=A0=A0=A0=A0=A0=A0Andrew Jeffery <andrew@aj.id.au>
>> > L:=A0=A0=A0=A0=A0=A0linux-aspeed@lists.ozlabs.org=A0(moderated for non=
-subscribers)
>> > diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
>> > index 601cc3c3c852..0d0ee8009713 100644
>> > --- a/drivers/peci/Kconfig
>> > +++ b/drivers/peci/Kconfig
>> > @@ -12,3 +12,9 @@ menuconfig PECI
>> >
>> > =A0=A0=A0=A0=A0=A0=A0=A0=A0 This support is also available as a module=
. If so, the module
>> > =A0=A0=A0=A0=A0=A0=A0=A0=A0 will be called peci.
>> > +
>> > +if PECI
>> > +
>> > +source "drivers/peci/controller/Kconfig"
>> > +
>> > +endif # PECI
>> > diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
>> > index 2bb2f51bcda7..621a993e306a 100644
>> > --- a/drivers/peci/Makefile
>> > +++ b/drivers/peci/Makefile
>> > @@ -3,3 +3,6 @@
>> > # Core functionality
>> > peci-y :=3D core.o sysfs.o
>> > obj-$(CONFIG_PECI) +=3D peci.o
>> > +
>> > +# Hardware specific bus drivers
>> > +obj-y +=3D controller/
>> > diff --git a/drivers/peci/controller/Kconfig
>> > b/drivers/peci/controller/Kconfig
>> > new file mode 100644
>> > index 000000000000..8ddbe494677f
>> > --- /dev/null
>> > +++ b/drivers/peci/controller/Kconfig
>> > @@ -0,0 +1,12 @@
>> > +# SPDX-License-Identifier: GPL-2.0-only
>> > +
>> > +config PECI_ASPEED
>> > +=A0=A0=A0=A0=A0=A0=A0tristate "ASPEED PECI support"
>> > +=A0=A0=A0=A0=A0=A0=A0depends on ARCH_ASPEED || COMPILE_TEST
>> > +=A0=A0=A0=A0=A0=A0=A0depends on OF
>> > +=A0=A0=A0=A0=A0=A0=A0depends on HAS_IOMEM
>> > +=A0=A0=A0=A0=A0=A0=A0help
>> > +=A0=A0=A0=A0=A0=A0=A0=A0 Enable this driver if you want to support AS=
PEED PECI controller.
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0=A0 This driver can be also build as a module. I=
f so, the module
>> > +=A0=A0=A0=A0=A0=A0=A0=A0 will be called peci-aspeed.
>> > diff --git a/drivers/peci/controller/Makefile
>> > b/drivers/peci/controller/Makefile
>> > new file mode 100644
>> > index 000000000000..022c28ef1bf0
>> > --- /dev/null
>> > +++ b/drivers/peci/controller/Makefile
>> > @@ -0,0 +1,3 @@
>> > +# SPDX-License-Identifier: GPL-2.0-only
>> > +
>> > +obj-$(CONFIG_PECI_ASPEED)=A0=A0=A0=A0=A0=A0+=3D peci-aspeed.o
>> > diff --git a/drivers/peci/controller/peci-aspeed.c
>> > b/drivers/peci/controller/peci-aspeed.c
>> > new file mode 100644
>> > index 000000000000..888b46383ea4
>> > --- /dev/null
>> > +++ b/drivers/peci/controller/peci-aspeed.c
>> > @@ -0,0 +1,501 @@
>> > +// SPDX-License-Identifier: GPL-2.0-only
>> > +// Copyright (C) 2012-2017 ASPEED Technology Inc.
>> > +// Copyright (c) 2018-2021 Intel Corporation
>> > +
>> > +#include <linux/bitfield.h>
>> > +#include <linux/clk.h>
>> > +#include <linux/delay.h>
>> > +#include <linux/interrupt.h>
>> > +#include <linux/io.h>
>> > +#include <linux/iopoll.h>
>> > +#include <linux/jiffies.h>
>> > +#include <linux/module.h>
>> > +#include <linux/of.h>
>> > +#include <linux/peci.h>
>> > +#include <linux/platform_device.h>
>> > +#include <linux/reset.h>
>> > +
>> > +#include <asm/unaligned.h>
>> > +
>> > +/* ASPEED PECI Registers */
>> > +/* Control Register */
>> > +#define ASPEED_PECI_CTRL=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A00x00
>> > +#define=A0=A0 ASPEED_PECI_CTRL_SAMPLING_MASK=A0=A0=A0=A0=A0=A0=A0GENM=
ASK(19, 16)
>> > +#define=A0=A0 ASPEED_PECI_CTRL_READ_MODE_MASK=A0=A0=A0=A0=A0=A0GENMAS=
K(13, 12)
>> > +#define=A0=A0 ASPEED_PECI_CTRL_READ_MODE_COUNT=A0=A0=A0=A0=A0BIT(12)
>> > +#define=A0=A0 ASPEED_PECI_CTRL_READ_MODE_DBG=A0=A0=A0=A0=A0=A0=A0BIT(=
13)
>>
>> Nitpick: might be nice to keep things in a consistent descending order
>> here (13 then 12).
>>
>
>Sure, I'll change it in v2.
>
>> > +#define=A0=A0 ASPEED_PECI_CTRL_CLK_SOURCE_MASK=A0=A0=A0=A0=A0BIT(11)
>>
>> _MASK suffix seems out of place on this one.
>
>Ack.
>
>>
>> > +#define=A0=A0 ASPEED_PECI_CTRL_CLK_DIV_MASK=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0GENMASK(10, 8)
>> > +#define=A0=A0 ASPEED_PECI_CTRL_INVERT_OUT=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0BIT(7)
>> > +#define=A0=A0 ASPEED_PECI_CTRL_INVERT_IN=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0BIT(6)
>> > +#define=A0=A0 ASPEED_PECI_CTRL_BUS_CONTENT_EN=A0=A0=A0=A0=A0=A0BIT(5)
>>
>> It *is* already kind of a long macro name, but abbreviating "contention"
>> to "content" seems a bit confusing; I'd suggest keeping the extra three
>> characters (or maybe drop the _EN suffix if you want to avoid making it
>> even longer).
>>
>
>You're right - it'll be renamed properly in v2.
>
>> > +#define=A0=A0 ASPEED_PECI_CTRL_PECI_EN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0BIT(4)
>> > +#define=A0=A0 ASPEED_PECI_CTRL_PECI_CLK_EN=A0=A0=A0=A0=A0=A0=A0=A0=A0=
BIT(0)
>> > +
>> > +/* Timing Negotiation Register */
>> > +#define ASPEED_PECI_TIMING_NEGOTIATION=A0=A0=A0=A0=A0=A0=A0=A0=A00x04
>> > +#define=A0=A0 ASPEED_PECI_TIMING_MESSAGE_MASK=A0=A0=A0=A0=A0=A0GENMAS=
K(15, 8)
>> > +#define=A0=A0 ASPEED_PECI_TIMING_ADDRESS_MASK=A0=A0=A0=A0=A0=A0GENMAS=
K(7, 0)
>> > +
>> > +/* Command Register */
>> > +#define ASPEED_PECI_CMD=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00x08
>> > +#define=A0=A0 ASPEED_PECI_CMD_PIN_MON=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0BIT(31)
>> > +#define=A0=A0 ASPEED_PECI_CMD_STS_MASK=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0GENMASK(27, 24)
>> > +#define=A0=A0=A0=A0 ASPEED_PECI_CMD_STS_ADDR_T_NEGO=A0=A0=A0=A00x3
>> > +#define=A0=A0 ASPEED_PECI_CMD_IDLE_MASK=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0\
>> > +=A0=A0=A0=A0=A0=A0=A0=A0 (ASPEED_PECI_CMD_STS_MASK | ASPEED_PECI_CMD_=
PIN_MON)
>> > +#define=A0=A0 ASPEED_PECI_CMD_FIRE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0BIT(0)
>> > +
>> > +/* Read/Write Length Register */
>> > +#define ASPEED_PECI_RW_LENGTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A00x0c
>> > +#define=A0=A0 ASPEED_PECI_AW_FCS_EN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0BIT(31)
>> > +#define=A0=A0 ASPEED_PECI_READ_LEN_MASK=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0GENMASK(23, 16)
>> > +#define=A0=A0 ASPEED_PECI_WRITE_LEN_MASK=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0GENMASK(15, 8)
>> > +#define=A0=A0 ASPEED_PECI_TAGET_ADDR_MASK=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0GENMASK(7, 0)
>>
>> s/TAGET/TARGET/
>>
>
>Ack.
>
>> > +
>> > +/* Expected FCS Data Register */
>> > +#define ASPEED_PECI_EXP_FCS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x10
>> > +#define=A0=A0 ASPEED_PECI_EXP_READ_FCS_MASK=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0GENMASK(23, 16)
>> > +#define=A0=A0 ASPEED_PECI_EXP_AW_FCS_AUTO_MASK=A0=A0=A0=A0=A0GENMASK(=
15, 8)
>> > +#define=A0=A0 ASPEED_PECI_EXP_WRITE_FCS_MASK=A0=A0=A0=A0=A0=A0=A0GENM=
ASK(7, 0)
>> > +
>> > +/* Captured FCS Data Register */
>> > +#define ASPEED_PECI_CAP_FCS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x14
>> > +#define=A0=A0 ASPEED_PECI_CAP_READ_FCS_MASK=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0GENMASK(23, 16)
>> > +#define=A0=A0 ASPEED_PECI_CAP_WRITE_FCS_MASK=A0=A0=A0=A0=A0=A0=A0GENM=
ASK(7, 0)
>> > +
>> > +/* Interrupt Register */
>> > +#define ASPEED_PECI_INT_CTRL=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x18
>> > +#define=A0=A0 ASPEED_PECI_TIMING_NEGO_SEL_MASK=A0=A0=A0=A0=A0GENMASK(=
31, 30)
>> > +#define=A0=A0=A0=A0 ASPEED_PECI_1ST_BIT_OF_ADDR_NEGO=A0=A0=A00
>> > +#define=A0=A0=A0=A0 ASPEED_PECI_2ND_BIT_OF_ADDR_NEGO=A0=A0=A01
>> > +#define=A0=A0=A0=A0 ASPEED_PECI_MESSAGE_NEGO=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A02
>> > +#define=A0=A0 ASPEED_PECI_INT_MASK=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0GENMASK(4, 0)
>> > +#define=A0=A0 ASPEED_PECI_INT_BUS_TIMEOUT=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0BIT(4)
>> > +#define=A0=A0 ASPEED_PECI_INT_BUS_CONNECT=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0BIT(3)
>>
>> s/CONNECT/CONTENTION/
>
>Ack.
>
>>
>> > +#define=A0=A0 ASPEED_PECI_INT_W_FCS_BAD=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0BIT(2)
>> > +#define=A0=A0 ASPEED_PECI_INT_W_FCS_ABORT=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0BIT(1)
>> > +#define=A0=A0 ASPEED_PECI_INT_CMD_DONE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0BIT(0)
>> > +
>> > +/* Interrupt Status Register */
>> > +#define ASPEED_PECI_INT_STS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x1c
>> > +#define=A0=A0 ASPEED_PECI_INT_TIMING_RESULT_MASK=A0=A0=A0GENMASK(29, =
16)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0 /* bits[4..0]: Same bit fields in the 'Inter=
rupt Register' */
>> > +
>> > +/* Rx/Tx Data Buffer Registers */
>> > +#define ASPEED_PECI_W_DATA0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x20
>> > +#define ASPEED_PECI_W_DATA1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x24
>> > +#define ASPEED_PECI_W_DATA2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x28
>> > +#define ASPEED_PECI_W_DATA3=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x2c
>> > +#define ASPEED_PECI_R_DATA0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x30
>> > +#define ASPEED_PECI_R_DATA1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x34
>> > +#define ASPEED_PECI_R_DATA2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x38
>> > +#define ASPEED_PECI_R_DATA3=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x3c
>> > +#define ASPEED_PECI_W_DATA4=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x40
>> > +#define ASPEED_PECI_W_DATA5=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x44
>> > +#define ASPEED_PECI_W_DATA6=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x48
>> > +#define ASPEED_PECI_W_DATA7=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x4c
>> > +#define ASPEED_PECI_R_DATA4=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x50
>> > +#define ASPEED_PECI_R_DATA5=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x54
>> > +#define ASPEED_PECI_R_DATA6=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x58
>> > +#define ASPEED_PECI_R_DATA7=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A00x5c
>> > +#define=A0=A0 ASPEED_PECI_DATA_BUF_SIZE_MAX=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A032
>> > +
>> > +/* Timing Negotiation */
>> > +#define ASPEED_PECI_RD_SAMPLING_POINT_DEFAULT=A0=A08
>> > +#define ASPEED_PECI_RD_SAMPLING_POINT_MAX=A0=A0=A0=A0=A0=A0(BIT(4) - =
1)
>> > +#define ASPEED_PECI_CLK_DIV_DEFAULT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A00
>> > +#define ASPEED_PECI_CLK_DIV_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0(BIT(3) - 1)
>> > +#define ASPEED_PECI_MSG_TIMING_DEFAULT=A0=A0=A0=A0=A0=A0=A0=A0=A01
>> > +#define ASPEED_PECI_MSG_TIMING_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0(BIT(8) - 1)
>> > +#define ASPEED_PECI_ADDR_TIMING_DEFAULT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A01
>> > +#define ASPEED_PECI_ADDR_TIMING_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0(BIT(8) - 1)
>> > +
>> > +/* Timeout */
>> > +#define ASPEED_PECI_IDLE_CHECK_TIMEOUT_US=A0=A0=A0=A0=A0=A0(50 * USEC=
_PER_MSEC)
>> > +#define ASPEED_PECI_IDLE_CHECK_INTERVAL_US=A0=A0=A0=A0=A0(10 * USEC_P=
ER_MSEC)
>> > +#define ASPEED_PECI_CMD_TIMEOUT_MS_DEFAULT=A0=A0=A0=A0=A0(1000)
>> > +#define ASPEED_PECI_CMD_TIMEOUT_MS_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0(100=
0)
>> > +
>> > +struct aspeed_peci {
>> > +=A0=A0=A0=A0=A0=A0=A0struct peci_controller controller;
>> > +=A0=A0=A0=A0=A0=A0=A0struct device *dev;
>> > +=A0=A0=A0=A0=A0=A0=A0void __iomem *base;
>> > +=A0=A0=A0=A0=A0=A0=A0struct clk *clk;
>> > +=A0=A0=A0=A0=A0=A0=A0struct reset_control *rst;
>> > +=A0=A0=A0=A0=A0=A0=A0int irq;
>> > +=A0=A0=A0=A0=A0=A0=A0spinlock_t lock; /* to sync completion status ha=
ndling */
>> > +=A0=A0=A0=A0=A0=A0=A0struct completion xfer_complete;
>> > +=A0=A0=A0=A0=A0=A0=A0u32 status;
>> > +=A0=A0=A0=A0=A0=A0=A0u32 cmd_timeout_ms;
>> > +=A0=A0=A0=A0=A0=A0=A0u32 msg_timing;
>> > +=A0=A0=A0=A0=A0=A0=A0u32 addr_timing;
>> > +=A0=A0=A0=A0=A0=A0=A0u32 rd_sampling_point;
>> > +=A0=A0=A0=A0=A0=A0=A0u32 clk_div;
>> > +};
>> > +
>> > +static inline struct aspeed_peci *to_aspeed_peci(struct peci_controll=
er *a)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0return container_of(a, struct aspeed_peci, contr=
oller);
>> > +}
>> > +
>> > +static void aspeed_peci_init_regs(struct aspeed_peci *priv)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0u32 val;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0val =3D FIELD_PREP(ASPEED_PECI_CTRL_CLK_DIV_MASK=
,
>> > ASPEED_PECI_CLK_DIV_DEFAULT);
>> > +=A0=A0=A0=A0=A0=A0=A0val |=3D ASPEED_PECI_CTRL_PECI_CLK_EN;
>> > +=A0=A0=A0=A0=A0=A0=A0writel(val, priv->base + ASPEED_PECI_CTRL);
>> > +=A0=A0=A0=A0=A0=A0=A0/*
>> > +=A0=A0=A0=A0=A0=A0=A0 * Timing negotiation period setting.
>> > +=A0=A0=A0=A0=A0=A0=A0 * The unit of the programmed value is 4 times o=
f PECI clock period.
>> > +=A0=A0=A0=A0=A0=A0=A0 */
>> > +=A0=A0=A0=A0=A0=A0=A0val =3D FIELD_PREP(ASPEED_PECI_TIMING_MESSAGE_MA=
SK, priv->msg_timing);
>> > +=A0=A0=A0=A0=A0=A0=A0val |=3D FIELD_PREP(ASPEED_PECI_TIMING_ADDRESS_M=
ASK, priv-
>> > >addr_timing);
>> > +=A0=A0=A0=A0=A0=A0=A0writel(val, priv->base + ASPEED_PECI_TIMING_NEGO=
TIATION);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0/* Clear interrupts */
>> > +=A0=A0=A0=A0=A0=A0=A0val =3D readl(priv->base + ASPEED_PECI_INT_STS) =
|
>> > ASPEED_PECI_INT_MASK;
>>
>> This should be & instead of |, I'm guessing?
>>
>
>I believe the idea is to unconditionally clear all known interrupt status =
bits,
>(irrelevant of what value is already set in regs), and the HW expects that=
 this
>is done by writing 1 to corresponding bits.
>

Ah -- I had been thinking we needed to ensure that we were only writing
zeros to reserved or RO bits, but I suppose re-writing whatever bit
pattern they provide on a read is probably okay (I'm having trouble
finding any explicit statement either way in the datasheet I've got).

>> > +=A0=A0=A0=A0=A0=A0=A0writel(val, priv->base + ASPEED_PECI_INT_STS);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0/* Set timing negotiation mode and enable interr=
upts */
>> > +=A0=A0=A0=A0=A0=A0=A0val =3D FIELD_PREP(ASPEED_PECI_TIMING_NEGO_SEL_M=
ASK,
>> > ASPEED_PECI_1ST_BIT_OF_ADDR_NEGO);
>> > +=A0=A0=A0=A0=A0=A0=A0val |=3D ASPEED_PECI_INT_MASK;
>> > +=A0=A0=A0=A0=A0=A0=A0writel(val, priv->base + ASPEED_PECI_INT_CTRL);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0val =3D FIELD_PREP(ASPEED_PECI_CTRL_SAMPLING_MAS=
K, priv-
>> > >rd_sampling_point);
>> > +=A0=A0=A0=A0=A0=A0=A0val |=3D FIELD_PREP(ASPEED_PECI_CTRL_CLK_DIV_MAS=
K, priv->clk_div);
>> > +=A0=A0=A0=A0=A0=A0=A0val |=3D ASPEED_PECI_CTRL_PECI_EN;
>> > +=A0=A0=A0=A0=A0=A0=A0val |=3D ASPEED_PECI_CTRL_PECI_CLK_EN;
>> > +=A0=A0=A0=A0=A0=A0=A0writel(val, priv->base + ASPEED_PECI_CTRL);
>> > +}
>> > +
>> > +static inline int aspeed_peci_check_idle(struct aspeed_peci *priv)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0u32 cmd_sts =3D readl(priv->base + ASPEED_PECI_C=
MD);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (FIELD_GET(ASPEED_PECI_CMD_STS_MASK, cmd_sts)=
 =3D=3D
>> > ASPEED_PECI_CMD_STS_ADDR_T_NEGO)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0aspeed_peci_init_regs(pr=
iv);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return readl_poll_timeout(priv->base + ASPEED_PE=
CI_CMD,
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 cmd_sts,
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 !(cmd_sts & ASPEED_PECI_CMD_IDLE_MASK),
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ASPEED_PECI_IDLE_CHECK_INTERVAL_US,
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ASPEED_PECI_IDLE_CHECK_TIMEOUT_US);
>> > +}
>> > +
>> > +static int aspeed_peci_xfer(struct peci_controller *controller,
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 u8 addr, struct peci_request *req)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct aspeed_peci *priv =3D to_aspeed_peci(cont=
roller);
>> > +=A0=A0=A0=A0=A0=A0=A0unsigned long flags, timeout =3D msecs_to_jiffie=
s(priv-
>> > >cmd_timeout_ms);
>> > +=A0=A0=A0=A0=A0=A0=A0u32 peci_head;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (req->tx.len > ASPEED_PECI_DATA_BUF_SIZE_MAX =
||
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req->rx.len > ASPEED_PECI_DATA_BUF_SIZ=
E_MAX)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0/* Check command sts and bus idle state */
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D aspeed_peci_check_idle(priv);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret; /* -ETIMEDOU=
T */
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0spin_lock_irqsave(&priv->lock, flags);
>> > +=A0=A0=A0=A0=A0=A0=A0reinit_completion(&priv->xfer_complete);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0peci_head =3D FIELD_PREP(ASPEED_PECI_TAGET_ADDR_=
MASK, addr) |
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 FIELD_PREP(ASP=
EED_PECI_WRITE_LEN_MASK, req->tx.len) |
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 FIELD_PREP(ASP=
EED_PECI_READ_LEN_MASK, req->rx.len);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0writel(peci_head, priv->base + ASPEED_PECI_RW_LE=
NGTH);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0memcpy_toio(priv->base + ASPEED_PECI_W_DATA0, re=
q->tx.buf,
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req->tx.len > =
16 ? 16 : req->tx.len);
>>
>> min(req->tx.len, 16) for the third argument there might be a bit
>> clearer.
>
>Ack.
>
>>
>> > +=A0=A0=A0=A0=A0=A0=A0if (req->tx.len > 16)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0memcpy_toio(priv->base +=
 ASPEED_PECI_W_DATA4, req->tx.buf +
>> > 16,
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 req->tx.len - 16);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0dev_dbg(priv->dev, "HEAD : 0x%08x\n", peci_head)=
;
>> > +=A0=A0=A0=A0=A0=A0=A0print_hex_dump_bytes("TX : ", DUMP_PREFIX_NONE, =
req->tx.buf, req-
>> > >tx.len);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0priv->status =3D 0;
>> > +=A0=A0=A0=A0=A0=A0=A0writel(ASPEED_PECI_CMD_FIRE, priv->base + ASPEED=
_PECI_CMD);
>> > +=A0=A0=A0=A0=A0=A0=A0spin_unlock_irqrestore(&priv->lock, flags);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D wait_for_completion_interruptible_timeou=
t(&priv-
>> > >xfer_complete, timeout);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret < 0)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret =3D=3D 0) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_dbg(priv->dev, "Time=
out waiting for a response!\n");
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -ETIMEDOUT;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0spin_lock_irqsave(&priv->lock, flags);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0writel(0, priv->base + ASPEED_PECI_CMD);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (priv->status !=3D ASPEED_PECI_INT_CMD_DONE) =
{
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0spin_unlock_irqrestore(&=
priv->lock, flags);
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_dbg(priv->dev, "No v=
alid response!\n");
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EIO;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0spin_unlock_irqrestore(&priv->lock, flags);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0memcpy_fromio(req->rx.buf, priv->base + ASPEED_P=
ECI_R_DATA0,
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req->rx.=
len > 16 ? 16 : req->rx.len);
>>
>> Likewise, min(req->rx.len, 16) here.
>
>Ack.
>
>>
>> > +=A0=A0=A0=A0=A0=A0=A0if (req->rx.len > 16)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0memcpy_fromio(req->rx.bu=
f + 16, priv->base +
>> > ASPEED_PECI_R_DATA4,
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 req->rx.len - 16);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0print_hex_dump_bytes("RX : ", DUMP_PREFIX_NONE, =
req->rx.buf, req-
>> > >rx.len);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return 0;
>> > +}
>> > +
>> > +static irqreturn_t aspeed_peci_irq_handler(int irq, void *arg)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct aspeed_peci *priv =3D arg;
>> > +=A0=A0=A0=A0=A0=A0=A0u32 status;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0spin_lock(&priv->lock);
>> > +=A0=A0=A0=A0=A0=A0=A0status =3D readl(priv->base + ASPEED_PECI_INT_ST=
S);
>> > +=A0=A0=A0=A0=A0=A0=A0writel(status, priv->base + ASPEED_PECI_INT_STS)=
;
>> > +=A0=A0=A0=A0=A0=A0=A0priv->status |=3D (status & ASPEED_PECI_INT_MASK=
);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0/*
>> > +=A0=A0=A0=A0=A0=A0=A0 * In most cases, interrupt bits will be set one=
 by one but also
>> > note
>> > +=A0=A0=A0=A0=A0=A0=A0 * that multiple interrupt bits could be set at =
the same time.
>> > +=A0=A0=A0=A0=A0=A0=A0 */
>> > +=A0=A0=A0=A0=A0=A0=A0if (status & ASPEED_PECI_INT_BUS_TIMEOUT)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_dbg_ratelimited(priv=
->dev,
>> > "ASPEED_PECI_INT_BUS_TIMEOUT\n");
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (status & ASPEED_PECI_INT_BUS_CONNECT)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_dbg_ratelimited(priv=
->dev,
>> > "ASPEED_PECI_INT_BUS_CONNECT\n");
>>
>> s/CONNECT/CONTENTION/ here too (in the message string).
>
>Ack.
>
>>
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (status & ASPEED_PECI_INT_W_FCS_BAD)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_dbg_ratelimited(priv=
->dev,
>> > "ASPEED_PECI_INT_W_FCS_BAD\n");
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0if (status & ASPEED_PECI_INT_W_FCS_ABORT)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_dbg_ratelimited(priv=
->dev,
>> > "ASPEED_PECI_INT_W_FCS_ABORT\n");
>>
>> Bus contention can of course arise legitimately, and I suppose an
>> offline host CPU might result in a timeout, so dbg seems fine for those
>> (though as Dan suggests, making some counters available seems like a
>> good idea, especially for contention).=A0 Are the FCS error cases
>> significant enough to warrant something less likely to go unnoticed
>> though?=A0 (e.g. dev_warn_ratelimited() or something?)
>
>It's similar story for FCS errors (can occur legitimately).
>We can hit ASPEED_PECI_INT_W_FCS_BAD in completely valid scenarios, e.g.
>unsuccessful detect during rescan.
>In case of ASPEED_PECI_INT_W_FCS_ABORT - caller can hit this by providing =
e.g.
>malformed command. Since we do return -EIO in this case, caller can print =
its
>own log. In other words, it's not always an error condition in peci-aspeed=
 (or
>HW). Moreover, if we ever expose more direct PECI access to userspace (pec=
idev,
>or something similar) this warn would be user triggerable.
>
>I would prefer to keep this at debug level for now.
>

Okay, I guess that's alright -- counters of some sort (e.g. in sysfs)
would be a nice thing to supplement that with for diagnosing problems
though, I think.

>>
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0/*
>> > +=A0=A0=A0=A0=A0=A0=A0 * All commands should be ended up with a ASPEED=
_PECI_INT_CMD_DONE
>> > bit
>> > +=A0=A0=A0=A0=A0=A0=A0 * set even in an error case.
>> > +=A0=A0=A0=A0=A0=A0=A0 */
>> > +=A0=A0=A0=A0=A0=A0=A0if (status & ASPEED_PECI_INT_CMD_DONE)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0complete(&priv->xfer_com=
plete);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0spin_unlock(&priv->lock);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return IRQ_HANDLED;
>> > +}
>> > +
>> > +static void __sanitize_clock_divider(struct aspeed_peci *priv)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0u32 clk_div;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D device_property_read_u32(priv->dev, "clo=
ck-divider",
>> > &clk_div);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0clk_div =3D ASPEED_PECI_=
CLK_DIV_DEFAULT;
>> > +=A0=A0=A0=A0=A0=A0=A0} else if (clk_div > ASPEED_PECI_CLK_DIV_MAX) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_warn(priv->dev, "Inv=
alid clock-divider: %u, Using
>> > default: %u\n",
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 clk_div, ASPEED_PECI_CLK_DIV_DEFAULT);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0clk_div =3D ASPEED_PECI_=
CLK_DIV_DEFAULT;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0priv->clk_div =3D clk_div;
>> > +}
>> > +
>>
>> The naming of these __sanitize_*() functions is a bit inconsistent with
>> the rest of the driver -- though given how similar they all look, could
>> they instead be refactored into a single helper function taking
>> property-name, default-value, and max-value parameters?
>
>You're right - we can have a single helper.
>
>Regarding naming, the idea was to have a simple "inner" helper function to=
 be
>called by the more appropriately named aspeed_peci_device_property_sanitiz=
e().
>
>Do you think I should use "aspeed_peci_" prefix in this function name or j=
ust
>remove "__" and name it "sanitize_property()"?
>

I just think it's generally nice to have function names give some
indication as to what part of the kernel they belong to -- that way when
they show up in a stack bracktrace or a symbol list (e.g. for ftrace
usage and such) it's clearer what they are (and reduces the likelihood
of name collisions and ensuing confusion).

>>
>> > +static void __sanitize_msg_timing(struct aspeed_peci *priv)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0u32 msg_timing;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D device_property_read_u32(priv->dev, "msg=
-timing",
>> > &msg_timing);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0msg_timing =3D ASPEED_PE=
CI_MSG_TIMING_DEFAULT;
>> > +=A0=A0=A0=A0=A0=A0=A0} else if (msg_timing > ASPEED_PECI_MSG_TIMING_M=
AX) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_warn(priv->dev, "Inv=
alid msg-timing : %u, Use default :
>> > %u\n",
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 msg_timing, ASPEED_PECI_MSG_TIMING_DEFAULT);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0msg_timing =3D ASPEED_PE=
CI_MSG_TIMING_DEFAULT;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0priv->msg_timing =3D msg_timing;
>> > +}
>> > +
>> > +static void __sanitize_addr_timing(struct aspeed_peci *priv)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0u32 addr_timing;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D device_property_read_u32(priv->dev, "add=
r-timing",
>> > &addr_timing);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0addr_timing =3D ASPEED_P=
ECI_ADDR_TIMING_DEFAULT;
>> > +=A0=A0=A0=A0=A0=A0=A0} else if (addr_timing > ASPEED_PECI_ADDR_TIMING=
_MAX) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_warn(priv->dev, "Inv=
alid addr-timing : %u, Use default :
>> > %u\n",
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 addr_timing, ASPEED_PECI_ADDR_TIMING_DEFAULT);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0addr_timing =3D ASPEED_P=
ECI_ADDR_TIMING_DEFAULT;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0priv->addr_timing =3D addr_timing;
>> > +}
>> > +
>> > +static void __sanitize_rd_sampling_point(struct aspeed_peci *priv)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0u32 rd_sampling_point;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D device_property_read_u32(priv->dev, "rd-=
sampling-point",
>> > &rd_sampling_point);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0rd_sampling_point =3D AS=
PEED_PECI_RD_SAMPLING_POINT_DEFAULT;
>> > +=A0=A0=A0=A0=A0=A0=A0} else if (rd_sampling_point > ASPEED_PECI_RD_SA=
MPLING_POINT_MAX) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_warn(priv->dev, "Inv=
alid rd-sampling-point: %u, Use
>> > default : %u\n",
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 rd_sampling_point,
>> > ASPEED_PECI_RD_SAMPLING_POINT_DEFAULT);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0rd_sampling_point =3D AS=
PEED_PECI_RD_SAMPLING_POINT_DEFAULT;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0priv->rd_sampling_point =3D rd_sampling_point;
>> > +}
>> > +
>> > +static void __sanitize_cmd_timeout(struct aspeed_peci *priv)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0u32 timeout;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D device_property_read_u32(priv->dev, "cmd=
-timeout-ms",
>> > &timeout);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0timeout =3D ASPEED_PECI_=
CMD_TIMEOUT_MS_DEFAULT;
>> > +=A0=A0=A0=A0=A0=A0=A0} else if (timeout > ASPEED_PECI_CMD_TIMEOUT_MS_=
MAX || timeout =3D=3D 0)
>> > {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_warn(priv->dev, "Inv=
alid cmd-timeout-ms: %u, Use
>> > default: %u\n",
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 timeout, ASPEED_PECI_CMD_TIMEOUT_MS_DEFAULT);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0timeout =3D ASPEED_PECI_=
CMD_TIMEOUT_MS_DEFAULT;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0priv->cmd_timeout_ms =3D timeout;
>> > +}
>> > +
>> > +static void aspeed_peci_device_property_sanitize(struct aspeed_peci *=
priv)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0__sanitize_clock_divider(priv);
>> > +=A0=A0=A0=A0=A0=A0=A0__sanitize_msg_timing(priv);
>> > +=A0=A0=A0=A0=A0=A0=A0__sanitize_addr_timing(priv);
>> > +=A0=A0=A0=A0=A0=A0=A0__sanitize_rd_sampling_point(priv);
>> > +=A0=A0=A0=A0=A0=A0=A0__sanitize_cmd_timeout(priv);
>> > +}
>> > +
>> > +static void aspeed_peci_disable_clk(void *data)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0clk_disable_unprepare(data);
>> > +}
>> > +
>> > +static int aspeed_peci_init_ctrl(struct aspeed_peci *priv)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0priv->clk =3D devm_clk_get(priv->dev, NULL);
>> > +=A0=A0=A0=A0=A0=A0=A0if (IS_ERR(priv->clk))
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return dev_err_probe(pri=
v->dev, PTR_ERR(priv->clk), "Failed
>> > to get clk source\n");
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D clk_prepare_enable(priv->clk);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(priv->dev, "Fail=
ed to enable clock\n");
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D devm_add_action_or_reset(priv->dev, aspe=
ed_peci_disable_clk,
>> > priv->clk);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0aspeed_peci_device_property_sanitize(priv);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0aspeed_peci_init_regs(priv);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return 0;
>> > +}
>> > +
>> > +static int aspeed_peci_probe(struct platform_device *pdev)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct aspeed_peci *priv;
>> > +=A0=A0=A0=A0=A0=A0=A0int ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv),=
 GFP_KERNEL);
>> > +=A0=A0=A0=A0=A0=A0=A0if (!priv)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -ENOMEM;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0priv->dev =3D &pdev->dev;
>> > +=A0=A0=A0=A0=A0=A0=A0dev_set_drvdata(priv->dev, priv);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0priv->base =3D devm_platform_ioremap_resource(pd=
ev, 0);
>> > +=A0=A0=A0=A0=A0=A0=A0if (IS_ERR(priv->base))
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return PTR_ERR(priv->bas=
e);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0priv->irq =3D platform_get_irq(pdev, 0);
>> > +=A0=A0=A0=A0=A0=A0=A0if (!priv->irq)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return priv->irq;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D devm_request_irq(&pdev->dev, priv->irq,
>> > aspeed_peci_irq_handler,
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0, "peci-aspeed-irq", priv);
>>
>> Might as well drop the "-irq" suffix here?=A0 (Seems a bit redundant, an=
d
>> a quick glance through /proc/interrupts on the systems I have at hand
>> doesn't show anything else following that convention.)
>
>I'll remove it.
>
>Thank you
>-Iwona
>
>>
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0init_completion(&priv->xfer_complete);
>> > +=A0=A0=A0=A0=A0=A0=A0spin_lock_init(&priv->lock);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0priv->controller.xfer =3D aspeed_peci_xfer;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0priv->rst =3D devm_reset_control_get(&pdev->dev,=
 NULL);
>> > +=A0=A0=A0=A0=A0=A0=A0if (IS_ERR(priv->rst)) {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_err(&pdev->dev, "Mis=
sing or invalid reset controller
>> > entry\n");
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return PTR_ERR(priv->rst=
);
>> > +=A0=A0=A0=A0=A0=A0=A0}
>> > +=A0=A0=A0=A0=A0=A0=A0reset_control_deassert(priv->rst);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0ret =3D aspeed_peci_init_ctrl(priv);
>> > +=A0=A0=A0=A0=A0=A0=A0if (ret)
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return peci_controller_add(&priv->controller, pr=
iv->dev);
>> > +}
>> > +
>> > +static int aspeed_peci_remove(struct platform_device *pdev)
>> > +{
>> > +=A0=A0=A0=A0=A0=A0=A0struct aspeed_peci *priv =3D dev_get_drvdata(&pd=
ev->dev);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0peci_controller_remove(&priv->controller);
>> > +=A0=A0=A0=A0=A0=A0=A0reset_control_assert(priv->rst);
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0return 0;
>> > +}
>> > +
>> > +static const struct of_device_id aspeed_peci_of_table[] =3D {
>> > +=A0=A0=A0=A0=A0=A0=A0{ .compatible =3D "aspeed,ast2400-peci", },
>> > +=A0=A0=A0=A0=A0=A0=A0{ .compatible =3D "aspeed,ast2500-peci", },
>> > +=A0=A0=A0=A0=A0=A0=A0{ .compatible =3D "aspeed,ast2600-peci", },
>> > +=A0=A0=A0=A0=A0=A0=A0{ }
>> > +};
>> > +MODULE_DEVICE_TABLE(of, aspeed_peci_of_table);
>> > +
>> > +static struct platform_driver aspeed_peci_driver =3D {
>> > +=A0=A0=A0=A0=A0=A0=A0.probe=A0 =3D aspeed_peci_probe,
>> > +=A0=A0=A0=A0=A0=A0=A0.remove =3D aspeed_peci_remove,
>> > +=A0=A0=A0=A0=A0=A0=A0.driver =3D {
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.name=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 =3D "peci-aspeed",
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.of_match_table =3D aspe=
ed_peci_of_table,
>> > +=A0=A0=A0=A0=A0=A0=A0},
>> > +};
>> > +module_platform_driver(aspeed_peci_driver);
>> > +
>> > +MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
>> > +MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
>> > +MODULE_DESCRIPTION("ASPEED PECI driver");
>> > +MODULE_LICENSE("GPL");
>> > +MODULE_IMPORT_NS(PECI);
>> > --
>> > 2.31.1
>=
