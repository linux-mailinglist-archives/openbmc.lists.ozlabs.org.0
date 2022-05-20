Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E85252E2CA
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 05:02:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4BNG3Pw2z3bg4
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 13:02:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=kCjFvF0M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=61398506ae=pdel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=kCjFvF0M; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4BMr75lMz2ywl;
 Fri, 20 May 2022 13:01:59 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 24JKmXfA032212;
 Thu, 19 May 2022 20:01:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=m+sASbbRun4XTRrMN3LSqMa9x7G0j4KlytPdvtE1xqA=;
 b=kCjFvF0MUvxZaYbHJLl6zRPgPfAw8ZNApCHyg8kRYM3mERL0kA5ZQmrKgLm8IlIrTgKQ
 0mwLvDZWxkpWITe3k+0IkyYW2t+zhi2GIEo+tHkN7jEkSoJc1mkQRvr+vuynp5y7viA+
 CSHU7k2+N5yWqhrSkbfbbd6GW+ZMNoWXxMM= 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by m0089730.ppops.net (PPS) with ESMTPS id 3g5h5d6tu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 20:01:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ky3LVrJvwY3YcWHhs8gcIDA4/fvBvJqXiR4DeHb3Gv5RXrplMfuW3feOPHGa+OCXicSjY1q9Le0JT0BiKvhSY6lqZwZBTxnNf+iwQQpBLSXJdp4eo7ZvbEXe1yKseirLhx/Ry8oxYrHJv4zrz3mdjqCERhihb12xXoccK2CRCEVxPGgpJBuWRWfsDTuDpbEbJralKuV271VQGpaxFHbi8QX9qzpE2f2v3CRnFm3SQzgy3if/AYU0oIB2Mb2B8B1eNxVoLU8r4qoEMuLscE/MXzJWGx5O7SRE3w0D0tOOf3U4X4OWBCW1HrcaJYYCNLiHS3/A9/Xbcp4zpg+haZooqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+sASbbRun4XTRrMN3LSqMa9x7G0j4KlytPdvtE1xqA=;
 b=LU5I590DUn2uBtV1Sz4Vi2p89L4sSHOQVsncmK40uAZ+MhgR7X1Q3YZh4lhwdMTz+n2/H5b6s+NvK1TwhVixmpP0G3RW6l8aJbO5LiSYZBSinFAwTjQlVRtdVDftdk85NhrbPNKNf2NlxpkyNb8bit3tZ0arfilcRcioMIWDiOl9FrTZvcovXgAWjVfyROLcwKnH+D05kB7BTNGiOaAZlv+8MCLo/w0fA3LnBCQtUzsmfD6EdTMlgv3M7ab5jURYWEurmiOZwmct+0wHaora6FSKiD3kPOL694zSuKuQyjQu/2KF9BAzNtOCWB95k8r1lZsPa314gww37KkOloOkqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by CY4PR15MB1335.namprd15.prod.outlook.com (2603:10b6:903:10f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 03:01:39 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5273.014; Fri, 20 May 2022
 03:01:39 +0000
From: Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH v3 0/3] Add ASPEED AST2600 I2C new controller driver
Thread-Topic: [PATCH v3 0/3] Add ASPEED AST2600 I2C new controller driver
Thread-Index: AQHYaPFadatO4kmu/EiPkIJLA5AvH60moyWAgAByrICAAAQkAA==
Date: Fri, 20 May 2022 03:01:39 +0000
Message-ID: <A553E632-F534-4823-BC50-89408294DB5F@fb.com>
References: <20220516064900.30517-1-ryan_chen@aspeedtech.com>
 <DDAAA045-3BDE-4712-A6CC-B1A52713634A@fb.com>
 <SEZPR06MB52697491CF6D06ECB85F0FB7F2D39@SEZPR06MB5269.apcprd06.prod.outlook.com>
In-Reply-To: <SEZPR06MB52697491CF6D06ECB85F0FB7F2D39@SEZPR06MB5269.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62f38510-d8f4-4626-180f-08da3a0d0f7b
x-ms-traffictypediagnostic: CY4PR15MB1335:EE_
x-microsoft-antispam-prvs: <CY4PR15MB1335A573FBB96DE045BC318DACD39@CY4PR15MB1335.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x/CVhybQQQ95mBDguZ9td0EbCzFCmhd7IooJ9IhXM34S7HQhyuqUjhUIYDT7JAxmJ/QWL+9fvRXXrvIYO1H1Gy4B4nB75Fzb2qtQOQUoxiOWT+TwBibDi7r2rBt9XBmZiLn9Q/ogtdmWWZbar/b4kvPkdqdxh/QMZMpEFURXlTFOJP1I8xaJzH7dSWeuuwx1B/KjODG3BRsQpxGWnCBNZav/6MMFdLaRadOMA0X9KzfOjuvQfdYXXTTAP2Ouj69i2TjjHBEqql+PBWVG9UP/aXFbZlzQdZUmyM7DmLKqsnClTkfovJKKrLHrZITseXOXmgDFdVajd3apS1n7fvJhzBwzeQ0cBKFzhNH8VrVbokGicZX90p9zoYnBa+esmRGDfr16Y0o/hq/QPWzrCpVscEDNntrX0uNLs2fLWnxcJJ1pY59q1ay8XT628FBtbyT5IuaoAF4oAz8yNFd5JMMKExok9lS2KDLOsSk/6HpGLLomS1ER3Ad4Xfmi66sGpNfl1I5ky2yKoJX5gfcxzGgwRyLCktcunr1tHcrJ7M8i+R8ngh/G0vlLn1QQmIcYH4xoy9exiyv6HmeQo3ogEUjeK+Ya6RHReJGALV4vKtqH+hi2zKGIu9PvraIY/TXDrL0ZLHcaXlmt5oQjWkOXd2T242Q36QQzax5/N45A0tB+yQEnwZHeWjBvK5ZStlHQSjDXAN0twF6UsWrCfvCsjrEcOnJPVz1Wf/uwFP0FfGMHSOH28iiqZZG8PZ6MJ+fuzGN2s/5YtZnw/MT+w5CF99FKD0k7t/CNuDQXkgKl+Evu1EIH+kIOsUYCObVLuBbvBqHg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(5660300002)(2616005)(508600001)(8936002)(2906002)(53546011)(6506007)(6486002)(966005)(33656002)(6512007)(38100700002)(38070700005)(122000001)(64756008)(66446008)(83380400001)(66556008)(54906003)(71200400001)(76116006)(8676002)(36756003)(4326008)(66476007)(109986005)(186003)(316002)(66946007)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFA4c0JuVkxCSUNKSDNrU0J1NHVkcUE2cHA1Qm9lZDE1c002WUFnck1SM2Jl?=
 =?utf-8?B?djJJaU40NmhnMVo5b1ZTdTB2U1dFVkdoVmdYYXZVWms5cmViZzYraVQ5WG5h?=
 =?utf-8?B?cjF4dzlaUmw2aHAxYU1NODZRUVdhZGp0NDNobE9uMkNKSHNIamJFZnBTUC92?=
 =?utf-8?B?WDRJQ0ZvUFFSenRleUo3M1Q4azNkZXhhZFY2V2xpcWNFMk9YWnc4SFBUbW5G?=
 =?utf-8?B?YmoxRmh1NmpnWlEvN0s4Y05XM1pZU0VUTWM0bnVicjR0WFlVNEczdWZCMG12?=
 =?utf-8?B?SVRmdHZiS1M2RFJieEpkUjR5c3RUT1VHaTh3eXNUeWs1Mmp3TVpQNFg5aVRJ?=
 =?utf-8?B?MHhYcVJJUFMrU3BJM0g2RGJULzM4UElGRXZmRFJWNnFxTW1paFdZRmdPUUZ5?=
 =?utf-8?B?N1pmTUtYNE9maGZLeFhYV3dDRzBrNVYwSkNZR3RnNGt5TVlFUTBsYWdiZ1cw?=
 =?utf-8?B?Q3hyZ09VMnM0TGFsZXl2Z1dkRmh5L0laZWlGQ3F6S2RiY2w0QlVOT2JWdUFo?=
 =?utf-8?B?MEppdDJRRWxrY2NHdUJnMnRoakFDNzdzYVdCcmdnVWpnZUUxaExha1d4Vnpi?=
 =?utf-8?B?UElDU2pYenpuVEtlZW55RkRvU2M2Tm9XdER5UWxJaWV1VUduL3RUTDBRakFN?=
 =?utf-8?B?dSsvMVlKQkZpeC9lQmdSOEtGN3M0Z25tTWFhN2lCNHVTMXRCZDgzd2ZhVXBz?=
 =?utf-8?B?clpYRjhKMVMrbFhMRE1sRDdPUitRajdwMWRlY3lTaWRocWlkbXAyblRQSzFu?=
 =?utf-8?B?RkpPY2t0NExPUGxuYXEzeng3V2pwcjBPTC9PL1N5TlVHdlhGdUxSSEVIeVY4?=
 =?utf-8?B?UnNDVllxb2grZ2NwcDBvVC9EWnNrS1FBWWdpU2dnN1RxbGdOeHVDM2dlajJW?=
 =?utf-8?B?VUM1UmM5bEduZlVjRVR4ajNZLzk1V3hoVjY4aXl0SEQ3bmV3KzZHNlhUOS9n?=
 =?utf-8?B?QjVuQ1ViVmZOcVlORVJJcjR6QjhxSExIYldqeUwvR0xYeGR4bjEwaW9aUEd5?=
 =?utf-8?B?amFkZk5lcHFWNkhmWkljd255ekZqVTVrbEVMMnJpdWdUQktxMHZzODZQRzQ0?=
 =?utf-8?B?ekdHQVI0VFN0MHcxZWlWTmNaanNnY0dtbU9ibHp4MDBDL2MvN2M0em9mL1E2?=
 =?utf-8?B?cFBHY0t4UTgvcjMwZGNONU5xM1YrdTRVbTU5VndrL3hVNW9sRGFpL2ZhTkNE?=
 =?utf-8?B?dWkwUUlid21oREFaWkpyZmM3Sk5IbTA1Q1RzbjJMajIvZHV6WEU3dGJ0M0o3?=
 =?utf-8?B?akVndlZtSTEwL0JySURqcnBubTMrcU14RjE4OWkvbGpUdmxDdUZheWw5VUh5?=
 =?utf-8?B?S0oyT0VZTXhlZ0xaMHpDYk4xRkxQbi9XeTdzSTVTbmNPNjZBVmQ1VU5SRk1o?=
 =?utf-8?B?L0FrUkppV2c4QXl4TUc2dnl0YlFFQUtEUFVxbDhmczFGbFQ2eUhRQ1QwcTdk?=
 =?utf-8?B?Q2xwMnFiSUgzQk9KUm1QLzJrRlNQRldZajUrVG52SjV2S3hvbzBPejhSNExR?=
 =?utf-8?B?c01BOHNrRzgyZzV5cnlSdlhqaVp5L01IVk5lbUR1WlR6dis1SDM5anpubGZ4?=
 =?utf-8?B?WVZEN2o5dkY0eG9lRUtyL1VZTm96Zmpab2llUUZkNHRramxqczUyc0NvRGQz?=
 =?utf-8?B?OW5rR2ZGdk0ydUxKZkl0TVNkWDJlS1A2aHgzdThqeFJVUkw0WDhWY3R1NVRs?=
 =?utf-8?B?ZHJwYUlqLzJmUTRZNmhEVWlQK0gvUUx4S29MVUt2eEdJU0Zpb1VneVZPMkVS?=
 =?utf-8?B?T0o5OEdQWFBNdG8vNDRzOXkyQy9NUDdiSnFJVXFEN1pDeitucVhvZHFLQ3lV?=
 =?utf-8?B?aGF1eEdRMEg3RytMQ1FSRTR0bVJVREcwYjhKQjE3eFYvSVNRM0IxVlhsOEw1?=
 =?utf-8?B?NXlBVGsvZDE4NnFlN1M5ZE8yL0VCU2dIZFlHZ0NqSzRZSUpFVVpSalM2VFk3?=
 =?utf-8?B?bjFmVmRqa01BQU05UUp2RHpkZ3U5Qk50ajdiMXNRUG9CcjdQS0p6dzVyVFhs?=
 =?utf-8?B?QzFUYXh3VU8zeVFxQWlIY0gwcFVRMk1iRnNITXVieUN1OEF1OVdYc3M3ZVRx?=
 =?utf-8?B?Ujk1b0hTblFiT2wrZDFmNk12TC9kdFNnbWNFM0J5aUx3TnVLSndmZEZLcDJI?=
 =?utf-8?B?TzhVc0VreG9LWXBTMVRLYXBRNVN4TzUvWDBHKzZoVlQ4S2xxMUhKZjdrakxC?=
 =?utf-8?B?Y0t1ZXlOL2lUcEVsdi8yMFJpSGNiWkRpemdJb1dRL3NUWnlLejIrY0YwWklm?=
 =?utf-8?B?L3NJTU9na2FLREl2YkRvTlFid3d4M1k3Q2phU3UxdVZhRVZKMm43WUhHSnZE?=
 =?utf-8?B?eXRqcG9uSkJmVnhKWFNBWWc3akV6Y3o2RnplZXJBdWZtVUk0eCtlZHUyUHRE?=
 =?utf-8?Q?MVZu+60W7nvMjmTk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C146CB7BD2B90488DF8B64CD13F76A7@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f38510-d8f4-4626-180f-08da3a0d0f7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 03:01:39.4745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tOmSX6DWAWiH4e5+GK+AA7gjRBTNeTqfuVcxt2MASDdMkNm2v3E/j98exSC80m7e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1335
X-Proofpoint-GUID: k5Or4XWVR7gWqNWE8I9eu2U-cwVofhGs
X-Proofpoint-ORIG-GUID: k5Or4XWVR7gWqNWE8I9eu2U-cwVofhGs
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_06,2022-05-19_03,2022-02-23_01
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 "ryan_chen@aspeedtech.com" <ryan_chen@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC List <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
 Peter Delevoryas <pdel@fb.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4gT24gTWF5IDE5LCAyMDIyLCBhdCA3OjQ2IFBNLCBSeWFuIENoZW4gPHJ5YW5fY2hlbkBh
c3BlZWR0ZWNoLmNvbT4gd3JvdGU6DQo+IA0KPiBIZWxsbywNCj4gDQo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5jb20+DQo+
PiBTZW50OiBGcmlkYXksIE1heSAyMCwgMjAyMiAzOjU2IEFNDQo+PiBDYzogSm9lbCBTdGFubGV5
IDxqb2VsQGptcy5pZC5hdT47IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+OyBQaGls
aXBwDQo+PiBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4+IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBPcGVuQk1DIExpc3QNCj4+IDxvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmc+OyBCTUMtU1cgPEJNQy1TV0Bhc3BlZWR0ZWNoLmNvbT47IFBldGVyDQo+
PiBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT47IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRl
Y2guY29tPg0KPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwLzNdIEFkZCBBU1BFRUQgQVNUMjYw
MCBJMkMgbmV3IGNvbnRyb2xsZXIgZHJpdmVyDQo+PiANCj4+IA0KPj4gDQo+Pj4gT24gTWF5IDE1
LCAyMDIyLCBhdCAxMTo0OCBQTSwgcnlhbl9jaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+
DQo+PiB3cm90ZToNCj4+PiANCj4+PiBUaGlzIHNlcmllcyBhZGQgQVNUMjYwMCBpMmMgbmV3IHJl
Z2lzdGVyIHNldCBkcml2ZXIuIFRoZSBpMmMgbmV3DQo+Pj4gcmVnaXN0ZXIgc2V0IGhhdmUgbmV3
IGNsb2NrIGRpdmlkZXIgb3B0aW9uIGZvciBtb3JlIGZsZXhpYWJsZSBnZW5lcmF0aW9uLg0KPj4+
IEFuZCBhbHNvIGhhdmUgc2VwYXJhdGUgaTJjIG1hc3RlciBhbmQgc2xhdmUgcmVnaXN0ZXIgc2V0
IGZvciBjb250cm9sLg0KPj4gDQo+PiBIZXkgUnlhbiwgdGhhbmtzIGZvciB0aGlzIHdvcmshIFRo
aXMgaXMgYSBsaXR0bGUgYml0IG9mZi10b3BpYywgYnV0IGFyZSB5b3Ugb3INCj4+IGFueW9uZSBl
bHNlIGF0IEFzcGVlZCB3b3JraW5nIG9uIGFuIGVxdWl2YWxlbnQgUUVNVSBwYXRjaCBzZXJpZXM/
IFdpdGhvdXQNCj4+IGl0LCBJIGRvbuKAmXQgdGhpbmsgUUVNVSB3aWxsIHdvcmsgd2l0aCB0aGlz
IHNlcmllcyByaWdodD8gSSB0aGluayBRRU1VIG9ubHkNCj4+IHN1cHBvcnRzIHRoZSBvbGQgcmVn
aXN0ZXIgc2V0IHJpZ2h0IG5vdy4NCj4+IA0KPiBObywgdGhlcmUgYXJlIHR3byBzdWJtaXQgaW4g
UUVNVSBhYm91dCBpMmMgbmV3IHJlZ2lzdGVyIG1vZGUuDQo+IE9uZSBpcyBBU1BFRUQgc3VibWl0
IDogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3FlbXUtZGV2ZWwvbGlzdC8/
c2VyaWVzPTYyNjAyOCZhcmNoaXZlPWJvdGgNCj4gQW5vdGhlciBpcyBHT09HTEUgOiBodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvcWVtdS1kZXZlbC9saXN0Lz9zZXJpZXM9NjI3
NzA2JmFyY2hpdmU9Ym90aA0KDQpPaCBncmVhdCwgdGhhbmtzLiBJIGp1c3QgdHJpZWQgdGhlIEFz
cGVlZCBRRU1VIHNlcmllcyBhbmQgaXQgd29ya2VkIGZvciBtZSB3aXRoIFplcGh5ciwgdmVyeSBo
ZWxwZnVsIQ0KDQo+IA0KPj4gDQo+Pj4gDQo+Pj4gdjM6DQo+Pj4gLWZpeCBpMmMgZ2xvYmFsIGNs
b2NrIGRpdmlkZSBkZWZhdWx0IHZhbHVlIC1yZW1vdmUgaTJjIHNsYXZlIG5vIHVzZWQNCj4+PiBk
ZXZfZGJnIGluZm8uDQo+Pj4gDQo+Pj4gdjI6DQo+Pj4gLWFkZCBpMmMgZ2xvYmFsIHltYWwgZmls
ZSBjb21taXQNCj4+PiAtcmVuYW1lIGZpbGUgbmFtZSBmcm9tIG5ldyB0byBhc3QyNjAwLg0KPj4+
IGFzcGVlZC1pMmMtbmV3LWdsb2JhbC5jIC0+IGkyYy1hc3QyNjAwLWdsb2JhbC5jDQo+Pj4gYXNw
ZWVkLWkyYy1uZXctZ2xvYmFsLmggLT4gaTJjLWFzdDI2MDAtZ2xvYmFsLmggaTJjLW5ldy1hc3Bl
ZWQuYyAtPg0KPj4+IGkyYy1hc3QyNjAwLmMgLXJlbmFtZSBhbGwgZHJpdmVyIGZ1bmN0aW9uIG5h
bWUgdG8gYXN0MjYwMA0KPj4+IA0KPj4+IHJ5YW5fY2hlbiAoMyk6DQo+Pj4gZHQtYmluZGluZ3M6
IGkyYy1hc3QyNjAwOiBBZGQgYmluZGluZ3MgZm9yIEFTVDI2MDAgaTJDIGdsb2JhbCByZWdpc3Rl
cg0KPj4+IGNvbnRyb2xsZXINCj4+PiBkdC1iaW5kaW5nczogaTJjLWFzdDI2MDA6IEFkZCBiaW5k
aW5ncyBmb3IgQVNUMjYwMCBpMkMgZHJpdmVyDQo+Pj4gaTJjOmFzcGVlZDpzdXBwb3J0IGFzdDI2
MDAgaTJjIG5ldyByZWdpc3RlciBtb2RlIGRyaXZlcg0KPj4+IA0KPj4+IC4uLi9pMmMvYXNwZWVk
LGkyYy1hc3QyNjAwLWdsb2JhbC55bWFsIHwgNDQgKw0KPj4+IC4uLi9iaW5kaW5ncy9pMmMvYXNw
ZWVkLGkyYy1hc3QyNjAwLnltYWwgfCA3OCArDQo+Pj4gZHJpdmVycy9pMmMvYnVzc2VzL0tjb25m
aWcgfCAxMSArDQo+Pj4gZHJpdmVycy9pMmMvYnVzc2VzL01ha2VmaWxlIHwgMSArDQo+Pj4gZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLWdsb2JhbC5jIHwgOTQgKw0KPj4+IGRyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtYXN0MjYwMC1nbG9iYWwuaCB8IDE5ICsNCj4+PiBkcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLWFzdDI2MDAuYyB8IDE3MDMNCj4+ICsrKysrKysrKysrKysrKysrDQo+Pj4gNyBm
aWxlcyBjaGFuZ2VkLCAxOTUwIGluc2VydGlvbnMoKykNCj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQN
Cj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxpMmMtYXN0
MjYwMC1nbG9iYWwueW1hbA0KPj4+IGNyZWF0ZSBtb2RlIDEwMDY0NA0KPj4+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGkyYy1hc3QyNjAwLnltYWwNCj4+PiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLWdsb2JhbC5j
DQo+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYwMC1n
bG9iYWwuaA0KPj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFz
dDI2MDAuYw0KPj4+IA0KPj4+IC0tDQo+Pj4gMi4xNy4xDQoNCg==
