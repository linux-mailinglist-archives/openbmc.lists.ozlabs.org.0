Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4003AD5C2
	for <lists+openbmc@lfdr.de>; Sat, 19 Jun 2021 01:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6FK60qbFz3by4
	for <lists+openbmc@lfdr.de>; Sat, 19 Jun 2021 09:20:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=JpBn4QxA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=7803e3c1e9=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=JpBn4QxA; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6FJl05Mbz2yWs;
 Sat, 19 Jun 2021 09:20:21 +1000 (AEST)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15IN8wAn015235; Fri, 18 Jun 2021 23:20:01 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by mx0a-00268f01.pphosted.com with ESMTP id 398t5g24sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 23:20:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRX2+4v49mUG/zLq8eAjtZP7wmT3Hi3PqyfT0S//E/FF+C7avZYfI2FlXi8nDLnA7mgLC5/PFkUE/gOsGE269IipJjBi1h85rOGx5CYlpGaTi9QA7LuR3TU167wlo96XM0QLZ3pdFTlI1QIp+8R4wJX37zNCBh5F3dM1BT+jzlp5iv9qTItt8ScYTi7DsIXyBTMPzWUz+hIUxnMqdGx4SShIIHpy4uCo819QQdHG66Ky2CyczsnbM/72bhaX2Hhu4yJsdn0txJBO+2BMlTkadFvIqYNHz+5RCmw4Zj4TiswiuG1tNRAlN4NZPfZO/P8i6U7QMbzG17te8eQb5HGQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbABBT10IcYLkFVUWSIKkBC8tyCnXj03pypEPn+Y+sE=;
 b=QU0GMLekFglYkWu3WanFXG0B6c0ppbkmeMstwOBf+l+WtRzBW5SEWiLqbHHjzAg2GJcdLkVsBc3yoXSTNodU75Z0+E0JyJ3uXOkUe4wPSVt7/rIYD6v3OWUW8z4jbOJwPl5wjEOQL5SUTZmr3HFps+e2WhDWKGcY4a8nA3X4Wnpj7MGLSmFWhZ6OUvFFT8RJlkpt7V/MP8uWYUVxKckjXQLn0g/WQzOTZ4ye1G/eSNg8TaVvzx9H5nKEa8VGvUjNYXb+nY3Wui5DHodYlSIRr2L3v+GjnD1ZCiu+xPUQPbrnKyX45iwML9fXE1OWaR2jZjEPh5xMakkX2tiSPXRHuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbABBT10IcYLkFVUWSIKkBC8tyCnXj03pypEPn+Y+sE=;
 b=JpBn4QxAqWYpGn6LJtufbIsd2bSeN3u5/M1LAAQf4QR1hpTuW4Az4Qwfj9qpAuOigynmPCn2hz6ZG/4OMMdlRReHaFLwPY6SNa/rp+WqlaluVuebDQWGsZN7hA2tA2EQ+hwKpE3WYQqgD9Ouy4pW9ZktVgIT619mBUrWKB7fzlc=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM5PR04MB1212.namprd04.prod.outlook.com (2603:10b6:3:a2::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.24; Fri, 18 Jun 2021 23:19:57 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab%2]) with mapi id 15.20.4219.027; Fri, 18 Jun 2021
 23:19:57 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v4 01/16] ipmi: kcs_bmc_aspeed: Use of match data to
 extract KCS properties
Thread-Topic: [PATCH v4 01/16] ipmi: kcs_bmc_aspeed: Use of match data to
 extract KCS properties
Thread-Index: AQHXZJhztxF34bFoakSOOepf4UmNuw==
Date: Fri, 18 Jun 2021 23:19:57 +0000
Message-ID: <20210618231933.GA9658@hatter>
References: <20210608104757.582199-1-andrew@aj.id.au>
 <20210608104757.582199-2-andrew@aj.id.au>
In-Reply-To: <20210608104757.582199-2-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9216bd0-6697-4bd8-15a1-08d932af968b
x-ms-traffictypediagnostic: DM5PR04MB1212:
x-microsoft-antispam-prvs: <DM5PR04MB1212904FFC84A932C13C85CCC30D9@DM5PR04MB1212.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hq4tNvl9CGFoldduj7IFpewfEe1vw9lr9zMHqmJVHodAOEicyfCW8ExW3vqAG6xwf9wL7BXipYVxA1sWy4ZmCzsbapPYulWFqhGQLH7atayAso9BTddy4VFBGO3QXS3Hnx5QuMji6ifOQuLwQE6GdbLxPnrCMxvHStE9OCM9/nKQNj7mLN7eMLVshSxV3syMLry6hCJoV1ONm8bxG3LlM7lxyhbEleqYNymDK4cNCDzCBnWkIi3+vd8sDQwQ39uoW+WfpPILi5naEnIo5apdnxFLp4WDQud1yPmbxPSSVT2GoTtlup9JXghwY9FywdJ+iAoawJvdfTQEbS0l/JZndH2Tlqz0TvgFBJBo3pWczKeD5oz7EpiO2lNpqfvj2u6yGB6+qzNvlf2MWM42yU8tSfb3oZvwpXbmUnscxCBGUBnOvQ2ugruWizlYffnk8BdBqOdxBtW2ZSLzY4/D1/sUbUnbzMZ7iowrBFh4WIMZCgDLtzLbb7VbSjKuTwdUjcnRGHlKVzNQiWV5c2ubKq5gUCFJRcYmzkiUwOtlreojwR4z7WtvPTin01FCOPFCqtHwSWRMlQYkU6uZKMu+d2/BHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(136003)(366004)(396003)(346002)(39860400002)(376002)(4744005)(86362001)(6506007)(83380400001)(186003)(76116006)(2906002)(316002)(33656002)(478600001)(4326008)(5660300002)(33716001)(54906003)(122000001)(38100700002)(8676002)(26005)(7416002)(6916009)(1076003)(6512007)(66946007)(66556008)(8936002)(66446008)(64756008)(71200400001)(66476007)(6486002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qPbeCHGVDhRKaTCcsK6Tj71Klie/e5WcOp0KYw2Z1XcqGBv+Y9cjiQN3nXE3?=
 =?us-ascii?Q?k+lo4gLqrTjHfHWenNUIhtUUuKkAFNXow+p6DBMJ4hMk1npZUuQWMAzhA54e?=
 =?us-ascii?Q?TPKeJYwXgZa4i3rjyxYrl6mhyikoR5D8rZeq+PqdVLj7mp0u7fLiDpGVuiln?=
 =?us-ascii?Q?2eae1KzNd0MJk6SbdRBzJkjpTJH/gd8b/zMJ1ukxhNE1j/aFGIO8YUCh8EEW?=
 =?us-ascii?Q?K5OKiDM8B5HXqYwhYUaKKjKHIY8ApCYKDroaaSH+gU1yFsLNWtVPoYUKD4cm?=
 =?us-ascii?Q?NH094u5ctaNEfIOe11tbTVwyCd9+6LN4jLoNtTKWsgIXT7oqEgfJvuYGKYhr?=
 =?us-ascii?Q?rdAPRPCvQ5DKcwtdvb5JBZj+6745x6eyPnUOMcFnI5NeKienuJAhTU1xLPXN?=
 =?us-ascii?Q?Dt77/HJnukh8aVSfxWQ4ZjoLX68gbzYnU4nCx1GKD3p/8wYylKg4Fajdevh6?=
 =?us-ascii?Q?aB/AQE/+ygxdD2p+Ox6DgWERccTYEME+37DeiMC/0qotOTxeTwOM1V/mS37I?=
 =?us-ascii?Q?XiG77ORq8kmQxAyELHKjY48CVhZzhBpF8rwADc4HNaYuTQ4v4txn3GWjxev7?=
 =?us-ascii?Q?E2BqN0du6WDamda/YdRTDpDrmKwW6q7IaCkDE50n5OGTQkj+rDqR+LrnHoEK?=
 =?us-ascii?Q?Q86rpbauiBqPQVfDwp9QSSjZi0PPBj6TAudsAFoNPP9NYHKHsP9SWkSGAxE5?=
 =?us-ascii?Q?lQjyVBjA1ZqypFurF1M+CWax4FSt48CpBoF10eRSIkJceGjjvGB+IB4jxQgt?=
 =?us-ascii?Q?RVuwE3e/YAfrA0eJycUShI19zgJd9rTK4+MH/jVsLo9MRyAfnjybp5PimLCi?=
 =?us-ascii?Q?DlBvYDpMUP+hyyVq35EEz+6pdWju9MS4uIHSYlZsMIE7WCXV5FXOuxALKr3C?=
 =?us-ascii?Q?j+QMowMKG9p/8GzMTkWswwneJyqGCHGme1YgFbU9xGJzi71X4qgN08/T0MkK?=
 =?us-ascii?Q?eQi4KzDWDvNVc0eVhT4nYYUa3z0DWS3yhMm66pgTWi2Y6IrfVUmwBavkzlpc?=
 =?us-ascii?Q?sd33jIgPFcawkOhQGF6wSTMlT+T4Erp7AtWN3zCnVSN2XEryGjD6x+aHGT4Q?=
 =?us-ascii?Q?vzZFOYYXoNo/gsprRBYXbx96wzCfQUJ991XqjHHPN0bujr6UJUcJaim941Hu?=
 =?us-ascii?Q?4vl0UwaxbDl7C+GTMJO6Om1xrHrwsI/SNZoBceCRKGadwps9wSlQG68Q0et/?=
 =?us-ascii?Q?e18rSuP4EiRzaRXRZeHnOKNkv46sodslyzyd7/9N6/NIdYrvt5qLIPArCCL7?=
 =?us-ascii?Q?JOsg3LYnigJ/ORtklSYi9eBYTduc+AEnJxFYvdrSTnCibSIFVtYI/bNMsvd0?=
 =?us-ascii?Q?CDn7f6nwRAorQO3POjgs5Jm9?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <321516ADC9BC284B8AD1C7CEE5DE0981@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9216bd0-6697-4bd8-15a1-08d932af968b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 23:19:57.4869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uDIvegQ9KwMasPUoYse/IERjiVvnUWwZQ5JNYkYWr6qsZzgLQE3TDTAIZkwL5bXqGJEf3+utwhWa3u/Ub9zivw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1212
X-Proofpoint-GUID: DbhFk7cKGSr5fg7Daib2b87oCmvwVRS9
X-Proofpoint-ORIG-GUID: DbhFk7cKGSr5fg7Daib2b87oCmvwVRS9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-18_12:2021-06-18,
 2021-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0
 mlxlogscore=852 adultscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106180136
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
 "KWLIU@nuvoton.com" <KWLIU@nuvoton.com>,
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

On Tue, Jun 08, 2021 at 05:47:42AM CDT, Andrew Jeffery wrote:
>Unpack and remove the aspeed_kcs_probe_of_v[12]() functions to aid
>rearranging how the private device-driver memory is allocated.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/kcs_bmc_aspeed.c | 154 ++++++++++++++---------------
> 1 file changed, 77 insertions(+), 77 deletions(-)
>

Reviewed-by: Zev Weiss <zweiss@equinix.com>
