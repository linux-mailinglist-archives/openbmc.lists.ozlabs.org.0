Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4369435B9C0
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 07:13:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJcN20xgrz30FD
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 15:13:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=JgS9xTfH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=quantatw.com (client-ip=40.107.130.134;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=alan_kuo@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=JgS9xTfH; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300134.outbound.protection.outlook.com [40.107.130.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJcMl015Nz2xy8
 for <openbmc@lists.ozlabs.org>; Mon, 12 Apr 2021 15:13:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbTSSG39mbLY1Wac0uvQMEF0JHVczbRDEj+2Lk7k6Wod2G0K+439wJ8SzkoZByZstD2C8cvTr6DaCJUms4R35SadiEfk/YARUjAAsCwH0v3bFSPwWm2lQtZ95OFnl4Aq/7o8m6XAJcxNXw4qKACMUMx9fGvfqqVG3WIkxAgkhVJHM2oopval0TjP8iUfoD2lZ7lL14yyqfF/+wzPX9TxazZNJsz6pxTxPUjtrwrjmnunxqtcHTMVQ2cqj/OYMsjvGrvosVX1CMvXW7uWIF5Cveox2WWNCtPFi7EGZ1FHef+npIOh1RDZo/+Z/WnO9FjUX8toTyWVEJjraB3LY7f/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKWVZkri64xYTpraDPA9dsN3vSDiN5fTqR1uvt/BzEU=;
 b=SgMDHcbrJ91BLXDrUZOzGMZYoFWBoWZ767w0LozuFOcDB7fZDlH+UA5YjLhg+q22B9iJ+Wu2un/wlBfUcpatPgFYfllxJdLVfCPgiH6oB7bz/DuENo9w28we5tf41gGNEE8Teb27nsMBpjJp0Qy+Caolrf+cdHbzzkegT1QfB/rovoTRG1hbc2qAcifvJuv1uwlwAscMSQzdvdFkQnA6hxLIVThMzghCj47sdK4njmeeuvDfpnXyoYB/KViQTzyh1kwP+rzEUXXSWaJiKgxB0JCkAyLzln7Nd/g92iX80cqFXOdjsTmRHQ41siTTSpHbCd/Cn5JtNrP/vfe1BE+ZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKWVZkri64xYTpraDPA9dsN3vSDiN5fTqR1uvt/BzEU=;
 b=JgS9xTfHC66jjmjMGCf+9QjHis8iCR4g0ixKEIIo1XFxWDJu2nk0qnbL5FLrPdpqsCwa4EV5+ZbwtPwnvqb6LRaVbxVZ07vJRNWbmVYBSHsRYE5S2/fYyjAUdFsFq6fGT/q1z7QcfzFIXmduDK8aQWHnJfT7kIvwtI2m1PItr4c=
Received: from TYZPR04MB4239.apcprd04.prod.outlook.com (2603:1096:400:7::8) by
 TY2PR04MB3245.apcprd04.prod.outlook.com (2603:1096:404:94::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16; Mon, 12 Apr 2021 05:13:26 +0000
Received: from TYZPR04MB4239.apcprd04.prod.outlook.com
 ([fe80::cc44:7c91:98f0:ebdf]) by TYZPR04MB4239.apcprd04.prod.outlook.com
 ([fe80::cc44:7c91:98f0:ebdf%6]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 05:13:26 +0000
From: =?big5?B?QWxhbiBLdW8gKLOirra6+yk=?= <Alan_Kuo@quantatw.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: about bmcweb logservice schema 
Thread-Topic: about bmcweb logservice schema 
Thread-Index: Adcs1yr8628v1kqHRZSE+6tPe+irFwCa30dQ
Date: Mon, 12 Apr 2021 05:13:26 +0000
Message-ID: <TYZPR04MB42397F3D84C308C1237F479B84709@TYZPR04MB4239.apcprd04.prod.outlook.com>
References: <TYZPR04MB423946E753220EC5BF52A82484739@TYZPR04MB4239.apcprd04.prod.outlook.com>
In-Reply-To: <TYZPR04MB423946E753220EC5BF52A82484739@TYZPR04MB4239.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb2a1ce8-dce3-495b-e650-08d8fd71b3fc
x-ms-traffictypediagnostic: TY2PR04MB3245:
x-microsoft-antispam-prvs: <TY2PR04MB3245781FC226DF9E2B9018BF84709@TY2PR04MB3245.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ukYMC0db3hBnTfqxiViNSqcTGebNbW8vqXt2yfa0np7HSM/DDvISebNpQz5256o5eJGaRPXjLvTB/bRMUOwx8b8U1BZIdDdCf57ISKCICKv8WErBACRAalHcieoa8OXTxDTdYeiLvj7Adt1W/IZlI2lu5iATT33bh6UX+HlevjWbFmB9JXUeM+jAxHtZmwxXWzlkjEkdv/dWxA4aipHpQI82IrnOLqWFhJ86eUW9aTgS92i6kFCJB+GmhWtZVd67NnYu2FRYOY4pKhKiRvTPwhqTl2ncQ/N2NhhPMrAo35xrvZaoBQlPyZlylGj5CBZDVqmVudSnEw+rZhZJ/P88mQ98/C8Cjo/2v/Ft7sH/wPij5UMKSP4xeW+1SfbZjIyH+g75/909bGPAC8Q9Bk3TKB+8gydyuY4TNT52rcrzkpH3z6a3WA1wX19BCMist+HWShjXrpUHqggXZxErC26OZe/Ifag30pg+Ovd8/9PaxUxojWs56eCKbPvIX2Uq9dRV+gG0jXQTlburf1FtGdgIGTVZt51pXBpRNqXO4g49ChwUjbL0pykPFB5z0SLSYo/HeLRg8oV+NdBXXPbtAAyVEbZBvdclgz1gOs7M+sW2sBSm8+kKxDNlpmJZMuEmGrqzElDQ+LietGhUOxWcblQvJfhaslqlwQsfW5vQUAw+gwoppJOTZgobRpVd78407EqX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR04MB4239.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(85182001)(2906002)(66446008)(26005)(8676002)(186003)(83380400001)(66556008)(3480700007)(166002)(76116006)(71200400001)(64756008)(53546011)(66476007)(478600001)(86362001)(6506007)(33656002)(52536014)(55016002)(4326008)(9686003)(6916009)(54906003)(66946007)(7696005)(5660300002)(4743002)(38100700002)(316002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?dUZDbVVoOW95M2V5QUxjWnNQbmE4elhTbjBweTA2MnBmWjRPdE5tYW9OQjc0T0Mv?=
 =?big5?B?RU50Vll0K3BxOU5qam9CZHBCWXBmaTZSS3RtMDFvRzJtRHl4c1ZDL3NqSlRSM1Y0?=
 =?big5?B?NFFVUDBvcDliZ0twYUhISzlaK1VsaDJRZTdRb0tlRUM5bXl6YUFQTHNnVnJGd0ZE?=
 =?big5?B?L1l2anQvd2haeVR3WVdJY2FaS0lZMDU3SDArenJPYjRNdW9VMHlBMVcyMXVSZ1BD?=
 =?big5?B?L2QrZHVhSGZBMWgwUGJubkpObCtrNHhRRTNrd0RDM1FueWVIN21TeWJJMGVtT0lI?=
 =?big5?B?MFpxTTBEOG5taE9iTmRGd050dlVDNHp3SlNFS3JuYzVzSWt0aG5rRTdWakd6Zith?=
 =?big5?B?eWFLWDVEV2tlSW53dlBzVXdPNTJsWDBsY0R1M01ydXRzZUFwOXJMWmNBWk5ZVnVl?=
 =?big5?B?RGtrWFdVUXhiblNFUnJLOVFrdVkySGhsaWl3WlBCMmo1d2JqTmNBaDUwWVZ0ZjlN?=
 =?big5?B?aW1MaVBUL2NyTk9VL0xWTnpvYzFnMFpjWkRvMUl3YldnTkttZDMyOXBSV1R3Tkh1?=
 =?big5?B?V1hRekZqcUltWFZ2UlArN0J0bVBUVSt2cThzQnVTeUZ4emEyWXAxWkduTDVNa2JI?=
 =?big5?B?NUYwclp3SmdUbHdZc09jaHQ0MHVRRGRsdm9abmF6NWM4QWdsOU5POEd0aUdCMyt3?=
 =?big5?B?TkxhSDJQbkM1eGx0RVlEdXpkeHpTSzVQY2ZuWWQ4MXJTS0EwRFd2d1NuS09Lc3E2?=
 =?big5?B?YkVTaWVueUNCM0FwOGcyYmFWT0ZzMHZ3TnpTTGhDa1NYV21LNldubStobXViQUxl?=
 =?big5?B?UE9DdnhPdTdHZGU0Vmg5VmU0YVhEWDdlaHFlWXNraVRFbysyT2E3V1hib3pjQVhQ?=
 =?big5?B?b3NSTDN1R0VxelRuNXh6OEU3VzEyRlFaenpta1hkeFFqeEkycVdJTktPS1JvWVJ0?=
 =?big5?B?dzV6WDFDVm1VbFllVFEvNDcyUGZDSVRuVnNlelBqc1hnQmVNcFNOcENldk5Sb2hT?=
 =?big5?B?V01hMG52bFFsWW5CRTNmY0NxYlRGR2tSU0NVMTNlNTNLYkZ2Uy83S3JMSC90TGcr?=
 =?big5?B?VWVZT3Q0c0FJSzBqTURqNmVHTzM1TXdUUDd6UzJNSEk3b0orVzk5VmhEby9CWUR4?=
 =?big5?B?M1RTQUZxdlZ6dUZpcUcydytKQncya3AwTU9OTk9WWUxwVEtCeHhadi92bThtL0x6?=
 =?big5?B?Y3hodWVic2dVRXZEN3MyQnVyYjcrNGFJNloxd2lkcm5rZmRjV09CUlBWU3FKb0sw?=
 =?big5?B?YnQ4YmRhTGQ3OXdUU0IxaHdyOEtOVlBJTHNsSktXZ2Yza2lGcEFWODcrRmlKa1R1?=
 =?big5?B?VC82ZC83TVllb2xwcC80ZW91VlhqampkMWtzekF1VUZBemJpN3lGOGE5SnpsQUVO?=
 =?big5?B?VDRmQkgvbTl5NU9tblkyTGFFNSsxSVN6WEFEOVVCeDUvaXRvMHN2S0pDZ0hINEdH?=
 =?big5?B?Y3FQK1pWNWhWT2RDdTRlK0VWZ3UxUS9TdzQwYklNbjhUa09zL1YvTXJ4dkhFOGN3?=
 =?big5?B?amZJdjRBTlRkdmZkMTdTajl1Vng5YjBPeXFmbUUrMCtRQnNNVXBDcE5ZTTM4aC8z?=
 =?big5?B?ZVZiUkxCL2R0WjRYTjFrbW9YbWJ1dDQvckVUZzVvem05QWxkdmdKWTVsUkxydXU0?=
 =?big5?B?cDlKRmlJbHFxV1lZQ1Y4RkZQNTQwSTZPM09BQmVkL3lvUVFEL3FXM3Ztc0dDZThw?=
 =?big5?Q?1JjRSo4MypYCkp70xqoFu+8WgvpMxbNQsFogLzx6ITeV6r8h?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_TYZPR04MB42397F3D84C308C1237F479B84709TYZPR04MB4239apcp_"
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB4239.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2a1ce8-dce3-495b-e650-08d8fd71b3fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 05:13:26.3970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +tYFsH7ox2V99vR5SAJx60BT5cgtEpsoEzGjwSiEw94oK9G24vD9qfhY5ElCw/OUN2onAe4oqAbn/P2pX5QP6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3245
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
 "edtanous@google.com" <edtanous@google.com>, Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TYZPR04MB42397F3D84C308C1237F479B84709TYZPR04MB4239apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgRWQsDQoNCkNhbiB5b3UgZ2l2ZSB1cyBzb21lIHN1Z2dlc3Rpb25zIGZvciBOYW4ncyBzdGF0
ZW1lbnQ/DQoNClRoYW5rcywNCkFsYW4NCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyth
bGFuX2t1bz1xdWFudGF0dy5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIEFsYW4g
S3VvICizoq62uvspDQpTZW50OiBGcmlkYXksIEFwcmlsIDksIDIwMjEgODoyOSBBTQ0KVG86IE5h
biBaaG91IDxuYW56aG91QGdvb2dsZS5jb20+OyBFZCBUYW5vdXMgPGVkQHRhbm91cy5uZXQ+DQpD
Yzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBlZHRhbm91c0Bnb29nbGUuY29tDQpTdWJqZWN0
OiBSRTogYWJvdXQgYm1jd2ViIGxvZ3NlcnZpY2Ugc2NoZW1hDQoNCkNoYW5nZSB0aXRsZS4NCg0K
RnJvbTogTmFuIFpob3UgPG5hbnpob3VAZ29vZ2xlLmNvbTxtYWlsdG86bmFuemhvdUBnb29nbGUu
Y29tPj4NClNlbnQ6IEZyaWRheSwgQXByaWwgOSwgMjAyMSAxOjExIEFNDQpUbzogRWQgVGFub3Vz
IDxlZEB0YW5vdXMubmV0PG1haWx0bzplZEB0YW5vdXMubmV0Pj4NCkNjOiBBbGFuIEt1byAos6Ku
trr7KSA8QWxhbl9LdW9AcXVhbnRhdHcuY29tPG1haWx0bzpBbGFuX0t1b0BxdWFudGF0dy5jb20+
Pjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmc+OyBlZHRhbm91c0Bnb29nbGUuY29tPG1haWx0bzplZHRhbm91c0Bnb29nbGUuY29tPg0KU3Vi
amVjdDogUkU6IGFib3V0IGJtY3dlYiBsb2dzZXJ2aWNlIHNjaGVtYQ0KDQpIaSBFZCwNCg0KVGhh
bmtzIGZvciB5b3VyIHJlcGx5Lg0KDQpBbGFuIGFuZCBJIHdlcmUgdGFsa2luZyBhYm91dCB3aGF0
IGF0dHJpYnV0ZSB3ZSBzaG91bGQgdXNlIGZvciAidGhlIHRpbWUgdGhhdCBhbiBldmVudCBvY2N1
cnJlZCIsICJDcmVhdGVkIiBvciAiRXZlbnRUaW1lc3RhbXAiLiBCb3RoIGF0dHJpYnV0ZXMgaW4g
dGhlIFJlZGZpc2ggc2NoZW1hIGFyZSBvcHRpb25hbCwgbXkgdW5kZXJzdGFuZGluZyBhZnRlciBy
ZWFkaW5nIHRoZSBkZXNjcmlwdGlvbiB3YXMgdGhhdCAiQ3JlYXRlZCIgaXMgd2hlbiB0aGUgTG9n
RW50cnkgZ2V0cyBjcmVhdGVkIGluIHRoZSBMb2dFbnRyeUNvbGxlY3Rpb24gaW4gdGhlIHdlYiBz
ZXJ2ZXIgKEJtY1dlYik7IElJVUMsIGluIEJtY1dlYiwgbmV3IExvZyBFbnRyaWVzIGFyZSBub3Qg
Y3JlYXRlZCB1bnRpbCB0aGV5IGdldCBxdWVyaWVkOyAiRXZlbnRUaW1lc3RhbXAiIG9uIHRoZSBv
dGhlciBoYW5kIGlzIHdoZW4gYW4gZXZlbnQgb3JpZ2luYWxseSBvY2N1cnJlZC4NCg0KVGhlIGNv
bnRleHQgaXMgdGhhdCB3ZSBhcmUgaW1wbGVtZW50aW5nIGJvdGggdGhlIFBVTEwgbW9kZWwgYW5k
IFBVU0ggbW9kZWwgb2YgUmVkZmlzaCBQT1NUIGNvZGVzIGFuZCBIb3N0IFNlcmlhbCBMb2dzLCBh
bmQgd2UgY2FyZSBhYm91dCB3aGVuIGV2ZW50cyBvY2N1cnJlZCBpbiBib3RoIG1vZGVscy4gIElu
IHRoZSBQVVNIIG1vZGVsLCB0aGUgd2ViIHNlcnZlciB3aWxsIHNlbmQgYW4gYXJyYXkgb2YgIkV2
ZW50IiwgaW4gd2hpY2ggdGhlcmUgaXMgYW4gIkV2ZW50VGltZXN0YW1wIiBhdHRyaWJ1dGUgdGhh
dCB3ZSBjYW4gdXNlIGZvciBlYWNoIGV2ZW50LiBJbiB0aGUgUFVMTCBtb2RlbCwgd2Ugd2lsbCBx
dWVyeSB0aGUgTG9nRW50cnlDb2xsZWN0aW9uIGluIExvZ1NlcnZpY2UsIGFuZCBjdXJyZW50bHks
IHRoZXJlIGlzIG9ubHkgIkNyZWF0ZWQiIGJ1dCBub3QgIkV2ZW50VGltZXN0YW1wIiBpbiBCbWNX
ZWIuIFNvIHdlIGFyZSBzZW5kaW5nIHRoaXMgZW1haWwgdG8gYXNrIGZvciBjb21tZW50cy4NCg0K
Pg0KPiBXZSB0aGluayB0aGF0IHVzaW5nIKGnRXZlbnRUaW1lc3RhbXChqCB3aWxsIGJlIG1vcmUg
c3VpdGFibGUgdGhhbiChp0NyZWF0ZWShqCBpbiBMb2dTZXJ2aWNlcy4NCldoeT8gIENhbiB5b3Ug
Z2l2ZSBtb3JlIGRldGFpbHMgaGVyZSBvbiB3aGF0IHlvdSdyZSB0cnlpbmcgdG8gYWNjb21wbGlz
aD8NCldlIGFyZSB0YWxraW5nIGFib3V0IHRoZSBmb2xsb3dpbmcgdGhyZWUgb3B0aW9ucywNCg0K
MS4gY2hhbmdlIGFsbCB0aGUgY3VycmVudCAiQ3JlYXRlZCIgYXR0cmlidXRlcyBpbiBCbWNXZWIg
TG9nU2VydmljZSB0byAiRXZlbnRUaW1lc3RhbXAiDQoyLiBrZWVwICJDcmVhdGVkIiBhcyBpczsg
YWRkIGEgbmV3IGF0dHJpYnV0ZSAiRXZlbnRUaW1lc3RhbXAiDQozLiBrZWVwIGV2ZXJ5dGhpbmcg
YXMgaXM7IHVzZSAiQ3JlYXRlZCIgdG8gcmVwcmVzZW50ICJ0aGUgdGltZSB0aGF0IGFuIGV2ZW50
IG9jY3VycmVkIg0KDQpXZSBhcmUgZmluZSB3aXRoIGVpdGhlciBvZiB0aGUgdGhyZWUgb3B0aW9u
cy4gVGhlIGVtYWlsIGlzIHRvIGFzayB0aGUgdXBzdHJlYW0gYW5kIGxvb2sgZm9yIG9waW5pb25z
IGZyb20gcGVvcGxlLg0KDQpUaGFua3MsDQpOYW4NCg0KT24gVGh1LCBBcHIgOCwgMjAyMSBhdCA5
OjM2IEFNIEVkIFRhbm91cyA8ZWRAdGFub3VzLm5ldDxtYWlsdG86ZWRAdGFub3VzLm5ldD4+IHdy
b3RlOg0KT24gVGh1LCBBcHIgOCwgMjAyMSBhdCA3OjAxIEFNIEFsYW4gS3VvICizoq62uvspIDxB
bGFuX0t1b0BxdWFudGF0dy5jb208bWFpbHRvOkFsYW5fS3VvQHF1YW50YXR3LmNvbT4+IHdyb3Rl
Og0KPg0KPiBIaSBhbGwsDQo+DQo+DQo+DQo+IEluIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9u
IG9mIGJtY3dlYiBMb2dTZXJ2aWNlcywgdGhlIHRpbWUgb2YgdGhlICJDcmVhdGVkIiBwcm9wZXJ0
eSBpcyB0aGUgdGltZSB3aGVuIHRoZSBldmVudCBpcyBnZW5lcmF0ZWQsIHdoaWNoIGRvZXMgbm90
IG1hdGNoIHRoZSBkZXNjcmlwdGlvbiBvZiB0aGUgcmVkZmlzaCBzY2hlbWEuIFRoZSAiQ3JlYXRl
ZCIgcHJvcGVydHkgbWVhbnMgdGhlIGRhdGUgYW5kIHRpbWUgd2hlbiB0aGUgbG9nIGVudHJ5IHdh
cyBjcmVhdGVkLg0KDQpJdCBzaG91bGQgYmUgbm90ZWQsIENyZWF0ZWQgaGFzIGJlZW4gcHJlc2Vu
dCBzaW5jZSAxLjAuMCBvZiBMb2dFbnRyeSwNCkV2ZW50VGltZXN0YW1wIHdhcyBhZGRlZCBpbiBM
b2dFbnRyeSB2MS4xLjAuICBCYXNlZCBvbiB0aGUNCmRlc2NyaXB0aW9ucywgaXQncyBub3QgY2xl
YXIgdG8gbWUgd2hhdCB0aGUgaW50ZW5kZWQgZGlmZmVyZW5jZSBpcywNCnNlZWluZyBhcyBob3cg
dGhleSdyZSBib3RoIG9mIHR5cGUgRWRtLkRhdGVUaW1lT2Zmc2V0LiAgQmFzZWQgb24gdGhlDQpk
ZXNjcmlwdGlvbiwgdGhlIHR3byB3b3VsZCBiZSBpZGVudGljYWwgb24gYW4gT3BlbkJNQyBzeXN0
ZW0sIHRoZQ0KTG9nRW50cnkgaXMgIkNyZWF0ZWQiIGF0IHRoZSBzYW1lIHRpbWUgaXQgb2NjdXJz
Lg0KDQo+DQo+IFdlIHRoaW5rIHRoYXQgdXNpbmcgoadFdmVudFRpbWVzdGFtcKGoIHdpbGwgYmUg
bW9yZSBzdWl0YWJsZSB0aGFuIKGnQ3JlYXRlZKGoIGluIExvZ1NlcnZpY2VzLg0KDQpXaHk/ICBD
YW4geW91IGdpdmUgbW9yZSBkZXRhaWxzIGhlcmUgb24gd2hhdCB5b3UncmUgdHJ5aW5nIHRvIGFj
Y29tcGxpc2g/DQoNCj4NCj4NCj4NCj4gQ291bGQgeW91IGdpdmUgbWUgc29tZSBzdWdnZXN0aW9u
ID8gT3IgYW0gSSBtaXN1bmRlcnN0YW5kaW5nIHRoZSBkZWZpbml0aW9uIG9mIHNjaGVtYT8NCg0K
VGhpcyBpcyBwcm9iYWJseSBhIGJldHRlciBxdWVzdGlvbiBmb3IgdGhlIFJlZGZpc2ggZm9ydW0s
IHVubGVzcw0KdGhlcmUncyBkb2N1bWVudGF0aW9uIG9uIHdoYXQgdGhlIGludGVuZGVkIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aG9zZQ0KdHdvIHBhcmFtZXRlcnMgYXJlLg0KDQo+DQo+DQo+DQo+IEhl
cmUgaXMgYW4gZXhhbXBsZToNCj4NCj4gew0KPg0KPiAgICAgICAiQG9kYXRhLmlkPGh0dHBzOi8v
YXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJGJTJG
b2RhdGEuaWQlMkYmZGF0YT0wNCU3QzAxJTdDQWxhbl9LdW8lNDBxdWFudGF0dy5jb20lN0NhMmZj
N2Y0MTY0NTc0M2FkMDU2MDA4ZDhmYWVlOGRjMyU3QzE3OWIwMzI3MDdmYzQ5NzNhYzczOGRlNzMx
MzU2MWIyJTdDMSU3QzAlN0M2Mzc1MzUyNDk3OTg4Nzc3NTYlN0NVbmtub3duJTdDVFdGcGJHWnNi
M2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxD
SlhWQ0k2TW4wJTNEJTdDMTAwMCZzZGF0YT1XUExnRzZuZFlwRnRPQ014U1NCOVNXbXpkUnNORDlz
Z2FXYmgyVHpOalgwJTNEJnJlc2VydmVkPTA+IjogIi9yZWRmaXNoL3YxL1N5c3RlbXMvc3lzdGVt
L0xvZ1NlcnZpY2VzL1Bvc3RDb2Rlcy9FbnRyaWVzL0I1LTgzIiwNCj4NCj4gICAgICAgIkBvZGF0
YS50eXBlIjogIiNMb2dFbnRyeS52MV80XzAuTG9nRW50cnkiLA0KPg0KPiAgICAgICAiQ3JlYXRl
ZCI6ICIxOTcwLTAxLTAxVDAwOjAxOjQzKzAwOjAwIiwgICAgPD0gIEl0IHNob3VsZCBiZSBFdmVu
dFRpbWVzdGFtcA0KPg0KPiAgICAgICAiRW50cnlUeXBlIjogIkV2ZW50IiwNCj4NCj4gICAgICAg
IklkIjogIkI1LTgzIiwNCj4NCj4gICAgICAgIk1lc3NhZ2UiOiAiQm9vdCBDb3VudDogMTogVFMg
T2Zmc2V0OiA2NS40NzY5OyBQT1NUIENvZGU6IDB4MDEiLA0KPg0KPiAgICAgICAiTWVzc2FnZUFy
Z3MiOiBbDQo+DQo+ICAgICAgICAgIjEiLA0KPg0KPiAgICAgICAgICI2NS40NzY5IiwNCj4NCj4g
ICAgICAgICAiMHgwMSINCj4NCj4gICAgICAgXSwNCj4NCj4gICAgICAgIk1lc3NhZ2VJZCI6ICJP
cGVuQk1DLjAuMS5CSU9TUE9TVENvZGUiLA0KPg0KPiAgICAgICAiTmFtZSI6ICJQT1NUIENvZGUg
TG9nIEVudHJ5IiwNCj4NCj4gICAgICAgIlNldmVyaXR5IjogIk9LIg0KPg0KPiB9DQo+DQo+DQo+
DQo+IFRoYW5rcywNCj4NCj4gQWxhbg0K

--_000_TYZPR04MB42397F3D84C308C1237F479B84709TYZPR04MB4239apcp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=B7s=B2=D3=A9=FA=C5=E9;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:Gulim;
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=B7s=B2=D3=A9=FA=C5=E9";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"\@Gulim";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Gulim",sans-serif;
	mso-fareast-language:KO;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Gulim",sans-serif;
	mso-fareast-language:KO;}
span.gmail-im
	{mso-style-name:gmail-im;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW">Hi Ed,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW">Can you give us some sugge=
stions for Nan's statement?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW">Thanks,<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW">Alan<o:p></o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW">From:<=
/span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;=
Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW"> openbmc
 &lt;openbmc-bounces+alan_kuo=3Dquantatw.com@lists.ozlabs.org&gt; <b>On Beh=
alf Of </b>Alan Kuo (</span><span style=3D"font-size:11.0pt;font-family:&qu=
ot;=B7s=B2=D3=A9=FA=C5=E9&quot;,serif;mso-fareast-language:ZH-TW">=B3=A2=AE=
=B6=BA=FB</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:=
&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW">)<br>
<b>Sent:</b> Friday, April 9, 2021 8:29 AM<br>
<b>To:</b> Nan Zhou &lt;nanzhou@google.com&gt;; Ed Tanous &lt;ed@tanous.net=
&gt;<br>
<b>Cc:</b> openbmc@lists.ozlabs.org; edtanous@google.com<br>
<b>Subject:</b> RE: about bmcweb logservice schema <o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW">Change title.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span></=
p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW">From:<=
/span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;=
Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW"> Nan Zhou
 &lt;<a href=3D"mailto:nanzhou@google.com">nanzhou@google.com</a>&gt; <br>
<b>Sent:</b> Friday, April 9, 2021 1:11 AM<br>
<b>To:</b> Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net">ed@tanous.net</a>=
&gt;<br>
<b>Cc:</b> Alan Kuo (</span><span style=3D"font-size:11.0pt;mso-fareast-lan=
guage:ZH-TW">=B3=A2=AE=B6=BA=FB</span><span lang=3D"EN-US" style=3D"font-si=
ze:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:Z=
H-TW">) &lt;<a href=3D"mailto:Alan_Kuo@quantatw.com">Alan_Kuo@quantatw.com<=
/a>&gt;;
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>; <=
a href=3D"mailto:edtanous@google.com">
edtanous@google.com</a><br>
<b>Subject:</b> RE: about bmcweb logservice schema<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Ed,</span><span lang=3D"EN-U=
S" style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp;</span><span =
lang=3D"EN-US"><o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks for your reply.</span><s=
pan lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nb=
sp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Alan and I were talking about w=
hat attribute we should use for &quot;the time that an event occurred&quot;=
, &quot;Created&quot; or &quot;EventTimestamp&quot;. Both attributes in the=
 Redfish schema are optional, my understanding after reading the descriptio=
n</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-=
serif">&nbsp;</span><span lang=3D"EN-US">was
 that &quot;Created&quot; is when the LogEntry gets created in the LogEntry=
Collection in the web server (BmcWeb); IIUC, in BmcWeb, new Log Entries</sp=
an><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif=
">&nbsp;</span><span lang=3D"EN-US">are not created until they
 get queried; &quot;EventTimestamp&quot; on the other hand is when an event=
 originally occurred.</span><span lang=3D"EN-US" style=3D"font-family:&quot=
;Calibri&quot;,sans-serif">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></s=
pan></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The context is that we are impl=
ementing both the PULL model and PUSH model of Redfish POST codes and Host =
Serial Logs, and we care about when events occurred in both models.</span><=
span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif">&n=
bsp;</span><span lang=3D"EN-US">
 In the PUSH model, the web server will send an array of &quot;Event&quot;,=
 in which there is an &quot;EventTimestamp&quot; attribute that we can use =
for each event. In the PULL model, we will query the LogEntryCollection in =
LogService, and currently, there is only &quot;Created&quot; but
 not &quot;EventTimestamp&quot; in BmcWeb. So we are sending this email to =
ask for comments.</span><span lang=3D"EN-US" style=3D"font-family:&quot;Cal=
ibri&quot;,sans-serif">&nbsp;&nbsp;</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal"><span class=3D"gmail-im"><span lang=3D"EN-US" style=
=3D"color:#500050">&gt;</span></span><span lang=3D"EN-US" style=3D"color:#5=
00050"><br>
<span class=3D"gmail-im">&gt; We think that using </span></span><span class=
=3D"gmail-im"><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;=
,sans-serif;color:#500050">=A1=A7</span><span lang=3D"EN-US" style=3D"color=
:#500050">EventTimestamp</span></span><span class=3D"gmail-im"><span lang=
=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:#50005=
0">=A1=A8</span><span lang=3D"EN-US" style=3D"color:#500050">
 will be more suitable than </span></span><span class=3D"gmail-im"><span la=
ng=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:#500=
050">=A1=A7</span><span lang=3D"EN-US" style=3D"color:#500050">Created</spa=
n></span><span class=3D"gmail-im"><span lang=3D"EN-US" style=3D"font-family=
:&quot;Calibri&quot;,sans-serif;color:#500050">=A1=A8</span><span lang=3D"E=
N-US" style=3D"color:#500050">
 in LogServices.</span></span><span lang=3D"EN-US" style=3D"color:#500050">=
<br>
</span><span lang=3D"EN-US">Why?</span><span lang=3D"EN-US" style=3D"font-f=
amily:&quot;Calibri&quot;,sans-serif">&nbsp;</span><span lang=3D"EN-US"> Ca=
n you give more details here on what you're trying to accomplish?<o:p></o:p=
></span></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We are talking about the follow=
ing three options,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">1. change all the current &quot=
;Created&quot; attributes in BmcWeb LogService to &quot;EventTimestamp&quot=
;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-=
serif">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">2. keep &quot;Created&quot; as =
is; add a new attribute</span><span lang=3D"EN-US" style=3D"font-family:&qu=
ot;Calibri&quot;,sans-serif">&nbsp;</span><span lang=3D"EN-US">&quot;EventT=
imestamp&quot;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">3. keep everything as is; use &=
quot;Created&quot;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Ca=
libri&quot;,sans-serif">&nbsp;</span><span lang=3D"EN-US">to represent</spa=
n><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif"=
>&nbsp;</span><span lang=3D"EN-US">&quot;the
 time that an event occurred&quot;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We are fine with either of the =
three options. The email is to ask the upstream and look for opinions from =
people.</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;=
,sans-serif">&nbsp;&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Nan<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Thu, Apr 8, 2021 at 9:36 AM =
Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net">ed@tanous.net</a>&gt; wrote:=
<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Thu, Apr 8, 2021 at 7:01 AM =
Alan Kuo (</span><span lang=3D"KO">=B3=A2=AE=B6=BA=FB</span><span lang=3D"E=
N-US">) &lt;<a href=3D"mailto:Alan_Kuo@quantatw.com" target=3D"_blank">Alan=
_Kuo@quantatw.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; In the current implementation of bmcweb LogServices, the time of the &=
quot;Created&quot; property is the time when the event is generated, which =
does not match the description of the redfish schema. The &quot;Created&quo=
t; property means the date and time when the log entry
 was created.<br>
<br>
It should be noted, Created has been present since 1.0.0 of LogEntry,<br>
EventTimestamp was added in LogEntry v1.1.0.</span><span lang=3D"EN-US" sty=
le=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp;</span><span lang=
=3D"EN-US"> Based on the<br>
descriptions, it's not clear to me what the intended difference is,<br>
seeing as how they're both of type Edm.DateTimeOffset.</span><span lang=3D"=
EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp;</span><s=
pan lang=3D"EN-US"> Based on the<br>
description, the two would be identical on an OpenBMC system, the<br>
LogEntry is &quot;Created&quot; at the same time it occurs.<br>
<br>
&gt;<br>
&gt; We think that using </span><span lang=3D"EN-US" style=3D"font-family:&=
quot;Calibri&quot;,sans-serif">=A1=A7</span><span lang=3D"EN-US">EventTimes=
tamp</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">=A1=A8</span><span lang=3D"EN-US"> will be more suitable than
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">=A1=A7</span><span lang=3D"EN-US">Created</span><span lang=3D"EN-US" =
style=3D"font-family:&quot;Calibri&quot;,sans-serif">=A1=A8</span><span lan=
g=3D"EN-US"> in LogServices.<br>
<br>
Why?</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US"> Can you give more details here=
 on what you're trying to accomplish?<br>
<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Could you give me some suggestion ? Or am I misunderstanding the defin=
ition of schema?<br>
<br>
This is probably a better question for the Redfish forum, unless<br>
there's documentation on what the intended difference between those<br>
two parameters are.<br>
<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Here is an example:<br>
&gt;<br>
&gt; {<br>
&gt;<br>
&gt;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">&quot;@<a href=3D"https://apc01.saf=
elinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fodata.id%2F&amp;data=3D04=
%7C01%7CAlan_Kuo%40quantatw.com%7Ca2fc7f41645743ad056008d8faee8dc3%7C179b03=
2707fc4973ac738de7313561b2%7C1%7C0%7C637535249798877756%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;sdata=3DWPLgG6ndYpFtOCMxSSB9SWmzdRsND9sgaWbh2TzNjX0%3D&amp;reserved=
=3D0" target=3D"_blank">odata.id</a>&quot;:
 &quot;/redfish/v1/Systems/system/LogServices/PostCodes/Entries/B5-83&quot;=
,<br>
&gt;<br>
&gt;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">&quot;@odata.type&quot;: &quot;#Log=
Entry.v1_4_0.LogEntry&quot;,<br>
&gt;<br>
&gt;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">&quot;Created&quot;: &quot;1970-01-=
01T00:01:43+00:00&quot;,</span><span lang=3D"EN-US" style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US"> &lt;=3D</span><span lang=3D"EN-US"=
 style=3D"font-family:&quot;Calibri&quot;,sans-serif">&nbsp;</span><span la=
ng=3D"EN-US"> It should be EventTimestamp<br>
&gt;<br>
&gt;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">&quot;EntryType&quot;: &quot;Event&=
quot;,<br>
&gt;<br>
&gt;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">&quot;Id&quot;: &quot;B5-83&quot;,<=
br>
&gt;<br>
&gt;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">&quot;Message&quot;: &quot;Boot Cou=
nt: 1: TS Offset: 65.4769; POST Code: 0x01&quot;,<br>
&gt;<br>
&gt;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">&quot;MessageArgs&quot;: [<br>
&gt;<br>
&gt;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">&quot;1&quot;,<br>
&gt;<br>
&gt;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">&quot;65.4769&quot;,<br>
&gt;<br>
&gt;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">&quot;0x01&quot;<br>
&gt;<br>
&gt;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">],<br>
&gt;<br>
&gt;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">&quot;MessageId&quot;: &quot;OpenBM=
C.0.1.BIOSPOSTCode&quot;,<br>
&gt;<br>
&gt;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">&quot;Name&quot;: &quot;POST Code L=
og Entry&quot;,<br>
&gt;<br>
&gt;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">&nbsp;</span><span lang=3D"EN-US">&quot;Severity&quot;: &quot;OK&quot=
;<br>
&gt;<br>
&gt; }<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Alan<o:p></o:p></span></p>
</blockquote>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_TYZPR04MB42397F3D84C308C1237F479B84709TYZPR04MB4239apcp_--
