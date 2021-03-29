Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C47034F454
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 00:36:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F946s0kDdz3btv
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 09:36:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=FIIcorp.onmicrosoft.com header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-FIIcorp-onmicrosoft-com header.b=dWoOHIIB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-na.com (client-ip=40.107.92.54;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=lancelot.cy.kao@fii-na.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=dWoOHIIB; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8LxS5TSLz2yQl
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 05:40:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReJTDpJsPlpGjI5XmkW7+x5ImQ8WU5pWeo6Dc4uBhkMSUY2ZhCGj5PJHQL8ZKT8Dsyt+WsfppyTrjaWuQMNSu2VkJcyvM9U5eZu3w3U9O7fNIDKNGRAb9clpGFxmf3O3dKATG56r8edV0rzAjnAcmNw/zRZw77wy0jBIF8E7cMV3jtpQxzuT1+4fvI0vtUCSd9Yg7qP01HGmYs4BKUAsGWY/OOq8DMvuLgItTYQv3purOe8hadWNyQ+aNaxitmuU0/6xd42Q1qHed5irx6bfRJJUPugUpVvD4lNhAcrJZ6kTzgpJodwtJ6e/cV/P0YxKCedMq2dY0wGSfgOy5lxXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8pPoekKNvBL3Wnwkp3rRlBNNlenD/fMbIRMoAynAUU=;
 b=k+BNFlya1NxIHX2OjP08+iWudB6VCgZjIgFnlFy71QKnBneYUjieK/B36w85pqgq/kVXIudKH50Rw04tJ/TsvST/5fNFlOqTF4FlbTS1GCMgLQe3DnTr+4G5OI76C4Hcx3yy9ZpSgwmi0DPj5mbh3oWNYpAk9EuCE7QGJftdoo2FiCQBWj8VYHRIJxPRHPPHqHAUwAzV7xqA6kOGzfXDlkdxZdjW71Ft8QtmK/MR6XXcwUhqF8i+aMTh9+T4GmAsPAhImlCmKcBEtFKUCswmsoG4a4ScbHmloJrDBJZHqsgxx5R8fdHUD9PJyeukFxAU/EI5nBMqy07geins/u/4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8pPoekKNvBL3Wnwkp3rRlBNNlenD/fMbIRMoAynAUU=;
 b=dWoOHIIBc8aoZCMpTz/s41nNx/i1lDCQnUy98Sbvvce2ZspfMWwiPsTgjaOYEjqfZo9+FvyBUgHbLHt71dBbQA8X/+98KglltZQZ+vObnuwQUCKV0+9pYJmojVkqKHzdXnY+YR6741ZhZC9plRuJVFuuoexhIKawcUSDH+BAdYMndUXAnNA9QR3ztNzLX7uq7WEqjOLrvburHrV528SeFAP4K1rFUL02IA8loJnw3l0ObJ+lLBqSF/lj6XF2SSzBC99Q+U7CxQNoA6dtF8CaApqyMazPw7lqfkCGksn66txKkXE8fXW0CkyrYpiIP+twme0Sc/kgalrLLJ/vv1EAvw==
Received: from SN6PR08MB5087.namprd08.prod.outlook.com (2603:10b6:805:73::11)
 by SN6PR08MB5664.namprd08.prod.outlook.com (2603:10b6:805:f8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.32; Mon, 29 Mar
 2021 18:40:37 +0000
Received: from SN6PR08MB5087.namprd08.prod.outlook.com
 ([fe80::18be:ce2:a837:e61a]) by SN6PR08MB5087.namprd08.prod.outlook.com
 ([fe80::18be:ce2:a837:e61a%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 18:40:37 +0000
From: Lancelot Kao <lancelot.cy.kao@fii-na.com>
To: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>, Neil Chen <Neil.Chen@fii-usa.com>
Subject: Re: group for foxconn CI  / fii oem repo
Thread-Topic: group for foxconn CI  / fii oem repo
Thread-Index: AdcVIZiiqI1Mo4UGRXSPEPz8kXQKEACU66GAAJnvRAACu0WrkP//rfwA
Date: Mon, 29 Mar 2021 18:40:36 +0000
Message-ID: <48C1C5DD-1D95-4001-A7AB-55F5ECD912E3@fii-na.com>
References: <DM6PR08MB58838020F8543D03C6235064B2929@DM6PR08MB5883.namprd08.prod.outlook.com>
 <DM6PR08MB58834FC516032C1D11C9F9F9B26F9@DM6PR08MB5883.namprd08.prod.outlook.com>
 <20210315205148.z6mcrx32kxr56lm2@thinkpad.fuzziesquirrel.com>
 <DM6PR08MB5883E400A28403E42592BF07B27E9@DM6PR08MB5883.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB5883E400A28403E42592BF07B27E9@DM6PR08MB5883.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.47.21031401
authentication-results: fii-na.com; dkim=none (message not signed)
 header.d=none;fii-na.com; dmarc=none action=none header.from=fii-na.com;
x-originating-ip: [65.205.114.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04b693d2-772a-4b63-6e33-08d8f2e22503
x-ms-traffictypediagnostic: SN6PR08MB5664:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR08MB56640582D8C233B897A386E39C7E9@SN6PR08MB5664.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uX1AAhWG1/iyj66UCncLnUFduINResuU2ZO8LPhzPDYvnZFavq1y7Rruu55l1sxpzrcmAHp+ygUeFVNerOYiWkNOYaj+gPxx5WJf9v5LGQaRcxcftzu3C40Xkn8TeG3IKlTZwahajo9TIf1bn0Fe6JMofRiay5eDkEgw36b0Z4Wr8uTyRpkQYSpm5TDX1IB/0FdL4zdqAVSZe+3XVIAj9idzpGdJfE0iMsUVE/M1YLWfr46ZARXrT399djdhrmoPsYPe/NV89CV/XWZmC9SeTXPFytyOy8ClEBjQn0frHgxqy6PYqDXlbLo/FPZ16ZYsCq2ObGxWo/0nB1zrxxVTMPeQEa0rQJEpbGkl+mTMFVemAbztk26BEwIfIGPPikY5iRz0IHD1OX13SXUPEfShtfV5BzJu9NBh4eHLxA7cwsDA7HrHntRlgKGBn1Wyqqi8XS+4HU6evprRgo4zf9OwFtuAqe8Yjgl70uxmcxRv/znu59CFQFEmpTh4Ix3cfG0REpno9HzyG0WhKyywykKBGF+AS46DOYQyjjt0DscxfxCQQfPl/LB3homHKrvkqT/vxij9NMmpX130rkGNrMPDczoaa3jIP0CAuGwvc8PTjgYfWEV6oXNFIWWSlYnkX6U04/FjhPbo/IuQaOUvUlgRnPycdeuHUzMGt8VWg8MFLmXk4Z5LwMi2SzE9uo5IDjBR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR08MB5087.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(39850400004)(376002)(136003)(396003)(478600001)(26005)(66946007)(6486002)(91956017)(66476007)(8936002)(38100700001)(86362001)(64756008)(66446008)(66556008)(2616005)(2906002)(36756003)(76116006)(6506007)(83380400001)(5660300002)(186003)(4326008)(53546011)(6512007)(316002)(71200400001)(54906003)(110136005)(33656002)(8676002)(107886003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y24rSG5VdGpmK29ZOTVkcjFYQW1DcDl5VkJ0ZGJZdjc1N3hQM2lQRjMvYndM?=
 =?utf-8?B?K2txOHF5dS9vYmErcDBsTXVlcTNuRGU4aXlIN2tHVHVIR0FMeWo2SU9kdXBx?=
 =?utf-8?B?K2sxTXhWWE1kVnNNNkl2ZVljdTBwQ1N3TU5jQmtJSFRCM3pKRTZ5QWtyenVl?=
 =?utf-8?B?QnVaRzVWODM2OHQ1Z3dPQ3llcjFTM2xYOFN6MHJUajI1Wkl1WTYrYmVpNWlL?=
 =?utf-8?B?K2ZXMk92QzVWdG01bER3WGFnWHFScFJWSWIrVXlKTDE2eDZON1REYW1VWTN2?=
 =?utf-8?B?Y2dzSjlIMmkxVjVwRFZWVzdpZU5sVHRvNXFHclkzU3hHaXN4NWFONWo5Y2tY?=
 =?utf-8?B?V2VYdDdQQ2lVUzdqN1RqdEo2YkJLRkJTaHE1MGNjRUZHRTBGU1NLcnVJMGZH?=
 =?utf-8?B?OEszRFMwbzV0elNlaG9Vc1ppY01pTUgxa0hDYkNzQzZDTWtOQU9Ga010YzdK?=
 =?utf-8?B?ZDFhd1NteGQwWXgvdnJERjBQaUsrR2phU0RpczNjemYxcHZmbmtyVExtWDRO?=
 =?utf-8?B?czNvK2JiZGR3bElYZ05EcDIySG5iUVNYUUV2bno2a1Qrb0V0VkhMOHpCdWlr?=
 =?utf-8?B?b3VsblpVU3M4cllGS3NiVGNISnVtYVNRcklzUm5QOTlmUkVMcFhwNlczUHNq?=
 =?utf-8?B?ZGpTOEE1V0VKN3BUMG0vc05rbnFsRWNWeEwzREVtY0hqZE0rOHVacnBxenpj?=
 =?utf-8?B?RjI1MmpmcCtHZ3BDOVQwWXBFdmlNaExZcElOV2FJS0NnMWdwTDlWQTZJNy9M?=
 =?utf-8?B?SXFtalRVdnR1M2FMNy9KWS9aOTk1YS8vVnBjQ05pa3RrVGlvbC90aHBHYjZD?=
 =?utf-8?B?Y1E1dXNTTjFzSlp6STAxVG1FZGQzaUhDanZ5bVhWaVNLZkF5aWpmc2FLQ2Nz?=
 =?utf-8?B?ekk4YVA2L3F1cWZsQWVDMU15VTl5NHBJUVpOQWUyaFNDWkVmVWlObDBKSWJu?=
 =?utf-8?B?T3RVSXd3cjZCNHpPRDhXd042M0ZiVUk3M0RTbm1Zc2dRUGlUaTV1QkhwTXZD?=
 =?utf-8?B?NkdNRnFqWmtweEJrUUdhM1pJZTN0T0dXVnUycGhndWc4OWR5YTdmLzFMZExq?=
 =?utf-8?B?VGpSZlZhMHRiV3ZSeVNQbFNEL2hwM2JpSHVTY0l6dCtMK3hEMVFlMnZuZ2Jk?=
 =?utf-8?B?Q3JEOE5wd2RRVzl4LzQycTVUMURhUFFhbkl2NVZ0WjFsRUtVZjB1UE1NZWta?=
 =?utf-8?B?NXc2TUtaclNtNmJacTFHTHM5TXg1STVIRWw2R2llRzg2dnBXRUk5TTFWVGpP?=
 =?utf-8?B?VCtFQXE4YlpXS25PbWZ4UFhYaldxdkpZRVgvRnJOMEMxOW5mVGU3SEJ4eTdN?=
 =?utf-8?B?YUx0c3RsZi9nNnQxOTZRaDNpR1lobHZFTnUxUDdyYlg5N1ZISE01M2o4REgz?=
 =?utf-8?B?eVFzNWVzVk9qSTVycStZczhIN2xmQUhGNXB3S2llNml3d3owWEVrUDVURFh0?=
 =?utf-8?B?ZGZiRlVHWUE4dlZ3emZwLzFxeVVHTjVVUzMwUEd5VlE2ekNmTVJreERqVGsy?=
 =?utf-8?B?cCt2Zlh1V2JLQ0NNNFJ6NWFKR2RxK2M4QXB3QXE1RnBGSjRUeWV3THU4RThw?=
 =?utf-8?B?RUdkQkVJMC9yWVg0Qk1zTXFjaDZEdTFtVHpNZWtyV0U5aXhLbkJla0lBR0Vp?=
 =?utf-8?B?Zkdub1d1bDVCc0w4MkQ1UVZDTE8vSlZWeVFxSGNJN3VjOXc3Mmt5RzlQQUNN?=
 =?utf-8?B?NFdJNXdVTllDUWV4cmdXZUdtNEJDTDRjMmZMRll0Nld1MjV4VDdNT04vc1BT?=
 =?utf-8?B?aGg5cjBSRlorNkJISmkyUFFIRkoyR0FlWXQrdm9YM09vcGRFU3RNYUJXTEZM?=
 =?utf-8?B?c3ZFYlZWWUlWVm92VSt5UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECB4F7A1BBBB3144AFD7F869174E9EB0@namprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5087.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b693d2-772a-4b63-6e33-08d8f2e22503
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 18:40:36.8878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZRLOxUeHyVxd53pgW0gtSUznOFStWTGmgV0j6eGEPOAvDkEY3LbfwKc3C/WDJIKYca2ZQeQyfea5pLIwVtC1bEIItqIWgv4bl4+iTF9QxGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5664
X-Mailman-Approved-At: Wed, 31 Mar 2021 09:36:07 +1100
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "vveerach@google.com" <vveerach@google.com>,
 XP Chen <Xiao-Peng.Chen@fii-na.com>,
 Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

ICAgSGksIEJyYWQNCglIZXJlIGlzIGFuIHVwZGF0ZSwgdGhhbmtzIA0KICAgbW9oYWltZW4uYWxz
YW1hcmFpQGZpaS1uYS5jb20NCiAgICBsYW5jZWxvdC5rYW9AZmlpLXVzYS5jb20NCiAgICBYaWFv
LVBlbmcuQ2hlbkBmaWktbmEuY29tDQogICAgTXVzdGFmYS5TaGVoYWJpQGZpaS1uYS5jb20NCiAg
ICBOZWlsLkNoZW5AZmlpLXVzYS5jb20NCiAgICBhdmVyeS56bC55YW5nQGZpaS1uYS5jb20NCg0K
LS0NCkJlc3QgUmVnYXJkcy4NCiANCkxhbmNlbG90IEthbyANCg0K77u/ICAgIEhpIEJyYWQsCQ0K
DQogICAgWW91IGNhbiBhZGQgcGVvcGxlIGJlbG93IGFzIG1haW50YWluZXIgZm9yIHRoZSBGb3hj
b25uLWlwbWktb2VtDQogICAgbW9oYWltZW4uYWxzYW1hcmFpQGZpaS1uYS5jb20NCiAgICBsYW5j
ZWxvdC5jeS5rYW9AZmlpLW5hLmNvbQ0KICAgIFhpYW8tUGVuZy5DaGVuQGZpaS1uYS5jb20NCiAg
ICBNdXN0YWZhLlNoZWhhYmlAZmlpLW5hLmNvbQ0KDQogICAgVGhhbmtzLA0KICAgIE1vaGFpbWVu
DQoNCiAgICAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KICAgIEZyb206IEJyYWQgQmlzaG9w
IDxicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+IA0KICAgIFNlbnQ6IE1vbmRheSwgTWFyY2gg
MTUsIDIwMjEgMzo1MiBQTQ0KICAgIFRvOiBNb2hhaW1lbiBBbHNhbWFyYWkgPE1vaGFpbWVuLkFs
c2FtYXJhaUBmaWktbmEuY29tPg0KICAgIENjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IHZ2
ZWVyYWNoQGdvb2dsZS5jb207IExhbmNlbG90IEthbyA8bGFuY2Vsb3QuY3kua2FvQGZpaS1uYS5j
b20+DQogICAgU3ViamVjdDogUmU6IGdyb3VwIGZvciBmb3hjb25uIENJIC8gZmlpIG9lbSByZXBv
DQoNCiAgICBPbiBGcmksIE1hciAxMiwgMjAyMSBhdCAwNzoyNTo0MlBNICswMDAwLCBNb2hhaW1l
biBBbHNhbWFyYWkgd3JvdGU6DQogICAgPkhpIEJyYWQsDQogICAgPiAgICAgICAgICAgICAgICBI
b3cgY2FuIHdlIGNyZWF0ZSBDaSBncm91cCBvbiBnZXJyaXQgYW5kIGFkZCBwZW9wbGUgdG8gDQog
ICAgPml0DQoNCiAgICBDcmVhdGVkIGZpaS9jaS1hdXRob3JpemVkIGFuZCBmaWkvY2ktYXV0aG9y
aXplZC1vd25lcnMuICBQbGVhc2UgYWRkIHBlb3BsZSB0byBmaWkvY2ktYXV0aG9yaXplZCB0byBh
dXRvbWF0aWNhbGx5IGFwcHJvdmUgcGF0Y2ggYXV0aG9ycyBmb3IgQ0kuDQoNCiAgICA+QW5kIHdl
IG5lZWQgdG8gY3JlYXRlIG5ldyByZXBvIGZvciB0aGUgRm94Y29ubiBpcG1pIG9lbQ0KDQogICAg
Q3JlYXRlZCBvcGVuYm1jL2ZveGNvbm4taXBtaS1vZW0uICBUaGlzIHJlcG9zaXRvcnkgbmVlZHMg
YSBtYWludGFpbmVyIC0gY2FuIEkgZ2V0IGEgZ2l0aHViIGFjY291bnQgaGFuZGxlIHRvIGludml0
ZSB0byB0aGUgT3BlbkJNQyBvcmdhbml6YXRpb24gYW5kIGFzc2lnbiB0aGUgbWFpbnRhaW5lciBy
b2xlPw0KDQogICAgdGh4IC1icmFkDQoNCg==
