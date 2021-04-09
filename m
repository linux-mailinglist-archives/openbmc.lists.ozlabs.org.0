Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBA23590E3
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 02:29:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGfBl3Xj3z30B5
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 10:29:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=wxE9zDBS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.113; helo=mx02.quantatw.com;
 envelope-from=prvs=7265a9d74=alan_kuo@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=wxE9zDBS; 
 dkim-atps=neutral
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.113])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FGfBS0zC0z302n
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 10:28:46 +1000 (AEST)
IronPort-SDR: 4Ig7JnBEH63TSjHqisrjNNtZeKKUyPDGcU3+2BOi3WYJvxxrvnf+aOZv/P44A4lNBEVhcBfDaL
 I02I6K890isQ==
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx02.quantatw.com with ESMTP; 09 Apr 2021 08:28:43 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 9 Apr 2021
 08:28:44 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (10.243.91.252)
 by mailbx05.quanta.corp (10.243.91.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Fri, 9 Apr 2021 08:28:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XI6CYmn0Wqbm7VfD7YMON+Sp+Ss4+eG+KB1RsPF+G2xU28KmoPVs11ySWENHpc6UVpJD3US+1LyaAQmH7WfZQhnzV3ilzvBqZ4ysljLJ2aZ3wWRXQHctlTL1UDa3dlsWSHTQTLFgrFDDVYrs1OV1utBcUgmmVUil4C9AieFjsaKgFPNvzi7bKeQKbC5lH6cLAyRZQhZzBrpCksS+qdlvlT0S6sljpB9AdTxdoOi5mz72oncCvfzngW4CLt/nX/vcukuqU0QpJL1II1n9h6FFvchNfHUwdxCVZ2chcCi1B+nFS5mvivxlh9jfN1zt+W0XfCCRdF02IuycLY8Rb862ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJeTwPnUJDTmxV1FReQLCSxAA3UbCw+Sh6f2v9H9Hfw=;
 b=HoHWGU+iQK9SQkoCYTYetxo+5BuuMGHFA5A1CfQ0EuqXnZsWgXV8/gvHYQIskjSbhdk2fuYDcTeDBO8lSR2dZrBWIVjNNFHjmB14gkB9JJNaoxOrhlzW0OYx76v+t2sq+mcAcQCr2mC2P9uPm89AjVrvdOjvxwNM+XAOAN2JNzyOKalZdbkB42iHcrEVO8cNDrljnA80DNPZ+sK2wOOuQ8A5VoO2NFBKMBfbfQpqhHMUKWXRgFyow709/pbe24V6YGCr53/4JnP+i8y2FvgxnNLIvUhbQNVlti7b+Wc4ZdThYjISV59ncEnllRh/UjISMdJWc/I05/93LuRoy2MxRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJeTwPnUJDTmxV1FReQLCSxAA3UbCw+Sh6f2v9H9Hfw=;
 b=wxE9zDBSdmDPRZejnITv1t9F53HTkb7N7DIoXRleIypEYy20wkCxJ1hqzVAKwdURO5oHHtLi1bZIMnYh9PLxUZUuwT7k300nhwep3Ayh3MDM+vmVuMOoSUUWFdg4dWtfRKMcdm094uX2DzL41nrO3mSfBmDuBc6+0tpsbnbS6tU=
Received: from TYZPR04MB4239.apcprd04.prod.outlook.com (2603:1096:400:7::8) by
 TY2PR04MB3982.apcprd04.prod.outlook.com (2603:1096:404:8001::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Fri, 9 Apr
 2021 00:28:39 +0000
Received: from TYZPR04MB4239.apcprd04.prod.outlook.com
 ([fe80::cc44:7c91:98f0:ebdf]) by TYZPR04MB4239.apcprd04.prod.outlook.com
 ([fe80::cc44:7c91:98f0:ebdf%6]) with mapi id 15.20.4020.020; Fri, 9 Apr 2021
 00:28:39 +0000
From: =?big5?B?QWxhbiBLdW8gKLOirra6+yk=?= <Alan_Kuo@quantatw.com>
To: Nan Zhou <nanzhou@google.com>, Ed Tanous <ed@tanous.net>
Subject: RE: about bmcweb logservice schema 
Thread-Topic: about bmcweb logservice schema 
Thread-Index: Adcs1yr8628v1kqHRZSE+6tPe+irFw==
Date: Fri, 9 Apr 2021 00:28:38 +0000
Message-ID: <TYZPR04MB423946E753220EC5BF52A82484739@TYZPR04MB4239.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5019ec22-cc70-4564-2a93-08d8faee6bd2
x-ms-traffictypediagnostic: TY2PR04MB3982:
x-microsoft-antispam-prvs: <TY2PR04MB3982578FD5002C6AE5CF47AD84739@TY2PR04MB3982.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vS1k9XnjbuXs8zYO/bYMYvomJlfIlIoFO6qNMiHMPuVHLltcCR6FOHbqSIaJup4AC3ZPpYk+74NF6QwT9SvW/36As3OLmw4YCnwI/2vpzD8zkg75X5MixjhYnBKLAgHQqNXYetTEB4JNIy4mM3Rg/Ay/f/KkyoQa4J8qXPDAek98AfQP6MzhtFFGtu60bQkC1Jqewe5N/EeKSoQ9YyQVf6w4LbJd2Lsf0vgBzxlBmHNWZhoO6g0pk0dgsY2rKXZwGZijNYLBnTmIRwfTmWwcVA1Z208sfpvf9UbZXSn9EKSy8jVWDxKgDB0GwuEAMgOEf9mZ11obWQPAWDS69xe3Zup/bhk28f/AOIzaS3GN3gWqOTmiVSjZaZoXLQ+ZLfmxHmE9GDEsL5X6lRDERGArTsH/Nri71fmCcL5CXyDXL+ymB88CaQSPqqKWBfZq9YInf6lyxLvSMwkk/t2d7+9Dy6mFa7swFhLXi41xlDeQnhW9atgrwHuwE8NXZlp8cBS0IZxLBZdvFEHGYQXWxtY6vfNqMyy/zgAYbo4J/hvgVfuXrbnv3DlsZn091TVfO+nhBLzqjzNM9+Mjd7nt09M4e12oKQr3k2o9wQDsOSPYRacO2f2q7CqJ83/dYNF68ULFm/PvDyvU6QTNy3JhHyUMxSomD1TOBH9Mt9V5pij8o7CZemnkK/mzJx5cNCEZNaIZWJxUnJn3eXS38sx8uFpVteAlY+FAhQlj2KwfLeVkBe4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR04MB4239.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(33656002)(4326008)(83380400001)(76116006)(66446008)(478600001)(71200400001)(38100700001)(6506007)(8936002)(4743002)(54906003)(53546011)(52536014)(8676002)(9686003)(7696005)(2906002)(110136005)(186003)(5660300002)(26005)(3480700007)(55016002)(64756008)(316002)(166002)(85182001)(66946007)(86362001)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?OFQxQ3N2bzlrUDFwSnF6SEhhYWs2cEtjeEJYSGVSZTNXdWRlcDJGaEdvSmtRTXVx?=
 =?big5?B?aW1jbUt2VlI1MDF5VHptZWlWaHdqL1NXQmcwSTIyNHFLNTU2dzFGNWljQnRRS3Z1?=
 =?big5?B?aTlidUlsSkVtUmk4dm02ZGtMcnJ2Zi9aTGdDa1ZBQU5SZjRJckxMV2IyNWF2alQ1?=
 =?big5?B?ejZUMmgyWS9FZVIvZmF1c3kyc0V6MWd4L1ZBZkdGcUxGZUY4M3hOZGM4WnJIVjYr?=
 =?big5?B?YTlLdVN4dXRJeXVXaXpkcFNFYUYvZE9TUVZrcGdzUlJOWi8ycFJzRlVUVVJ1MXpx?=
 =?big5?B?Zk5ZK0dFVGJBdmtZckVzOERBZTJDcU1XeWhVUUJIcXhhYWxFNjNOM1A0VEJzZlhF?=
 =?big5?B?WDhNQ1hxNTZSTVRqUTRuOHdXc25YZE8vV3pJMVUveU43dU1OYTNvN1VYQ3pvNEdH?=
 =?big5?B?VGtRTUlNVEZsdzdJcTVnSTJEQ0k2b2tXTWdwM25kbWVYT08vQXh5bjNuQjJWKzIy?=
 =?big5?B?NzlNTE9JMGtKa0pvVFIrSTEwM05oUmxpTmVkaFpEMVhBSlNOM0FxT3QyWWJBWmov?=
 =?big5?B?REs2NDFqbFRXV0s1L1c0SWFqVUtmZDhQQzVBdjd2OVhjTjFLT3JkTkc3Nk5BWGN4?=
 =?big5?B?c0hENlRyVHphckYwUGY4UnYxYTZtaURaTzlDcFIrZUE4VEZpNkNNMWgzRnlxRkJF?=
 =?big5?B?Zi9GVUNSRTAwVlR4OThYMkI5WFFUbnBOV1cwTnd2OTB5Z082MXFTL1hvOHF6MHhz?=
 =?big5?B?NndaTFBoQnM3Njg1TXV0OGNYMm4xR1grZkxYTDllSUFNMmJ5d0txdEYydVpjRldD?=
 =?big5?B?YkNlcVo2bXhJN1hFOW03YnBZMHRrM21Xb1FzWkdBbVQyRFNJOFBRWEdtK3hyTWpi?=
 =?big5?B?RlVPRnRlcjJES0F2Q2RBNWdESnhKZDRJWjlkcHoxdzFvcFlOeXZQRnhHN3pjSm5u?=
 =?big5?B?c1o3b3pmVzgzdStJK0tuRUZvdmZwUlhiMVFwZjVtMW9RVXE0c3pYakV2V2hxV0Fa?=
 =?big5?B?RGozUzJYaDVqYWptQnpXbVRqQWhRSXBaaXJzbm13d2NGL2E3QWl0enQrYVEzVU1M?=
 =?big5?B?ZnRYVStjM3V6ZVp1SmF5VithMU9HTVpQOXlVLzQwLzE1dHhKSkFKRUZWUkw1cmZB?=
 =?big5?B?bFgydWpaSXppU2NWZlN3REhwUjZuUDd2WUsySVdGNlUyWjk4dlQ2SmlXSVBnbkRy?=
 =?big5?B?b3NnUFNhT0NqNlZseTRVQkVvTUJjNjlkSEtvelZOdXBTV2RocEd6WlpscmhBeG9I?=
 =?big5?B?c2gwM0prUUFwWmFoZmlOM1ZvblIzQ20vUTVZQlhINUpkL2RJcFg2b0RzMHFsTUpz?=
 =?big5?B?TG5NU2UwR0hMOXNmbStTZ1lsd2lyb0VFZjN3VmQwQk9WVkh5Z1Vqa3V4MnZtd1hF?=
 =?big5?B?Q2NEVkNpaDNteHM4czhKcUpvbFpXczVmNUZFTWhwNnBDOHVSSW8zVnFhV1FpWUdR?=
 =?big5?B?NDB3T0g3ZWtMZlpHNG54RzBmSUZGVitPaDBLQS9WenFKWHlyZzN5T1FLZEZWMXc3?=
 =?big5?B?THZMVHhXNUc4R1hBeThPVmVlbDN2bjU0aE9pM3hzRit3SE11RWYrWnRmRE9Da0NF?=
 =?big5?B?YTlNOWFkRWU5U0VYRCtxQ3QvK0tlNEJvTkMzSC9tSmQ1NzhqWm5GbmVLZndFbTNG?=
 =?big5?B?cjlMRmRjODdLODQ4M3EycStqKzcyblB5bXBPcUVLV0VnVXlEMkJyREFSWE5qY2lR?=
 =?big5?Q?L5BJNZQMTuQCgnPD+w9qyOc4+chLKQEGrq59Wt7JVQiNodxO?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_TYZPR04MB423946E753220EC5BF52A82484739TYZPR04MB4239apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB4239.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5019ec22-cc70-4564-2a93-08d8faee6bd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 00:28:38.8333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ci9y0adX7h1qqpRMg9l2zXGfXuBqJs97CkgGIFroxZHx0XSKC4KxYPmNPay4Lbnw0sUfd7eqLMtSo2lE0YtoJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3982
X-OriginatorOrg: quantatw.com
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
 "edtanous@google.com" <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TYZPR04MB423946E753220EC5BF52A82484739TYZPR04MB4239apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

Q2hhbmdlIHRpdGxlLg0KDQpGcm9tOiBOYW4gWmhvdSA8bmFuemhvdUBnb29nbGUuY29tPg0KU2Vu
dDogRnJpZGF5LCBBcHJpbCA5LCAyMDIxIDE6MTEgQU0NClRvOiBFZCBUYW5vdXMgPGVkQHRhbm91
cy5uZXQ+DQpDYzogQWxhbiBLdW8gKLOirra6+ykgPEFsYW5fS3VvQHF1YW50YXR3LmNvbT47IG9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgZWR0YW5vdXNAZ29vZ2xlLmNvbQ0KU3ViamVjdDogUkU6
IGFib3V0IGJtY3dlYiBsb2dzZXJ2aWNlIHNjaGVtYQ0KDQpIaSBFZCwNCg0KVGhhbmtzIGZvciB5
b3VyIHJlcGx5Lg0KDQpBbGFuIGFuZCBJIHdlcmUgdGFsa2luZyBhYm91dCB3aGF0IGF0dHJpYnV0
ZSB3ZSBzaG91bGQgdXNlIGZvciAidGhlIHRpbWUgdGhhdCBhbiBldmVudCBvY2N1cnJlZCIsICJD
cmVhdGVkIiBvciAiRXZlbnRUaW1lc3RhbXAiLiBCb3RoIGF0dHJpYnV0ZXMgaW4gdGhlIFJlZGZp
c2ggc2NoZW1hIGFyZSBvcHRpb25hbCwgbXkgdW5kZXJzdGFuZGluZyBhZnRlciByZWFkaW5nIHRo
ZSBkZXNjcmlwdGlvbiB3YXMgdGhhdCAiQ3JlYXRlZCIgaXMgd2hlbiB0aGUgTG9nRW50cnkgZ2V0
cyBjcmVhdGVkIGluIHRoZSBMb2dFbnRyeUNvbGxlY3Rpb24gaW4gdGhlIHdlYiBzZXJ2ZXIgKEJt
Y1dlYik7IElJVUMsIGluIEJtY1dlYiwgbmV3IExvZyBFbnRyaWVzIGFyZSBub3QgY3JlYXRlZCB1
bnRpbCB0aGV5IGdldCBxdWVyaWVkOyAiRXZlbnRUaW1lc3RhbXAiIG9uIHRoZSBvdGhlciBoYW5k
IGlzIHdoZW4gYW4gZXZlbnQgb3JpZ2luYWxseSBvY2N1cnJlZC4NCg0KVGhlIGNvbnRleHQgaXMg
dGhhdCB3ZSBhcmUgaW1wbGVtZW50aW5nIGJvdGggdGhlIFBVTEwgbW9kZWwgYW5kIFBVU0ggbW9k
ZWwgb2YgUmVkZmlzaCBQT1NUIGNvZGVzIGFuZCBIb3N0IFNlcmlhbCBMb2dzLCBhbmQgd2UgY2Fy
ZSBhYm91dCB3aGVuIGV2ZW50cyBvY2N1cnJlZCBpbiBib3RoIG1vZGVscy4gIEluIHRoZSBQVVNI
IG1vZGVsLCB0aGUgd2ViIHNlcnZlciB3aWxsIHNlbmQgYW4gYXJyYXkgb2YgIkV2ZW50IiwgaW4g
d2hpY2ggdGhlcmUgaXMgYW4gIkV2ZW50VGltZXN0YW1wIiBhdHRyaWJ1dGUgdGhhdCB3ZSBjYW4g
dXNlIGZvciBlYWNoIGV2ZW50LiBJbiB0aGUgUFVMTCBtb2RlbCwgd2Ugd2lsbCBxdWVyeSB0aGUg
TG9nRW50cnlDb2xsZWN0aW9uIGluIExvZ1NlcnZpY2UsIGFuZCBjdXJyZW50bHksIHRoZXJlIGlz
IG9ubHkgIkNyZWF0ZWQiIGJ1dCBub3QgIkV2ZW50VGltZXN0YW1wIiBpbiBCbWNXZWIuIFNvIHdl
IGFyZSBzZW5kaW5nIHRoaXMgZW1haWwgdG8gYXNrIGZvciBjb21tZW50cy4NCg0KPg0KPiBXZSB0
aGluayB0aGF0IHVzaW5nIKGnRXZlbnRUaW1lc3RhbXChqCB3aWxsIGJlIG1vcmUgc3VpdGFibGUg
dGhhbiChp0NyZWF0ZWShqCBpbiBMb2dTZXJ2aWNlcy4NCldoeT8gIENhbiB5b3UgZ2l2ZSBtb3Jl
IGRldGFpbHMgaGVyZSBvbiB3aGF0IHlvdSdyZSB0cnlpbmcgdG8gYWNjb21wbGlzaD8NCldlIGFy
ZSB0YWxraW5nIGFib3V0IHRoZSBmb2xsb3dpbmcgdGhyZWUgb3B0aW9ucywNCg0KMS4gY2hhbmdl
IGFsbCB0aGUgY3VycmVudCAiQ3JlYXRlZCIgYXR0cmlidXRlcyBpbiBCbWNXZWIgTG9nU2Vydmlj
ZSB0byAiRXZlbnRUaW1lc3RhbXAiDQoyLiBrZWVwICJDcmVhdGVkIiBhcyBpczsgYWRkIGEgbmV3
IGF0dHJpYnV0ZSAiRXZlbnRUaW1lc3RhbXAiDQozLiBrZWVwIGV2ZXJ5dGhpbmcgYXMgaXM7IHVz
ZSAiQ3JlYXRlZCIgdG8gcmVwcmVzZW50ICJ0aGUgdGltZSB0aGF0IGFuIGV2ZW50IG9jY3VycmVk
Ig0KDQpXZSBhcmUgZmluZSB3aXRoIGVpdGhlciBvZiB0aGUgdGhyZWUgb3B0aW9ucy4gVGhlIGVt
YWlsIGlzIHRvIGFzayB0aGUgdXBzdHJlYW0gYW5kIGxvb2sgZm9yIG9waW5pb25zIGZyb20gcGVv
cGxlLg0KDQpUaGFua3MsDQpOYW4NCg0KT24gVGh1LCBBcHIgOCwgMjAyMSBhdCA5OjM2IEFNIEVk
IFRhbm91cyA8ZWRAdGFub3VzLm5ldDxtYWlsdG86ZWRAdGFub3VzLm5ldD4+IHdyb3RlOg0KT24g
VGh1LCBBcHIgOCwgMjAyMSBhdCA3OjAxIEFNIEFsYW4gS3VvICizoq62uvspIDxBbGFuX0t1b0Bx
dWFudGF0dy5jb208bWFpbHRvOkFsYW5fS3VvQHF1YW50YXR3LmNvbT4+IHdyb3RlOg0KPg0KPiBI
aSBhbGwsDQo+DQo+DQo+DQo+IEluIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIGJtY3dl
YiBMb2dTZXJ2aWNlcywgdGhlIHRpbWUgb2YgdGhlICJDcmVhdGVkIiBwcm9wZXJ0eSBpcyB0aGUg
dGltZSB3aGVuIHRoZSBldmVudCBpcyBnZW5lcmF0ZWQsIHdoaWNoIGRvZXMgbm90IG1hdGNoIHRo
ZSBkZXNjcmlwdGlvbiBvZiB0aGUgcmVkZmlzaCBzY2hlbWEuIFRoZSAiQ3JlYXRlZCIgcHJvcGVy
dHkgbWVhbnMgdGhlIGRhdGUgYW5kIHRpbWUgd2hlbiB0aGUgbG9nIGVudHJ5IHdhcyBjcmVhdGVk
Lg0KDQpJdCBzaG91bGQgYmUgbm90ZWQsIENyZWF0ZWQgaGFzIGJlZW4gcHJlc2VudCBzaW5jZSAx
LjAuMCBvZiBMb2dFbnRyeSwNCkV2ZW50VGltZXN0YW1wIHdhcyBhZGRlZCBpbiBMb2dFbnRyeSB2
MS4xLjAuICBCYXNlZCBvbiB0aGUNCmRlc2NyaXB0aW9ucywgaXQncyBub3QgY2xlYXIgdG8gbWUg
d2hhdCB0aGUgaW50ZW5kZWQgZGlmZmVyZW5jZSBpcywNCnNlZWluZyBhcyBob3cgdGhleSdyZSBi
b3RoIG9mIHR5cGUgRWRtLkRhdGVUaW1lT2Zmc2V0LiAgQmFzZWQgb24gdGhlDQpkZXNjcmlwdGlv
biwgdGhlIHR3byB3b3VsZCBiZSBpZGVudGljYWwgb24gYW4gT3BlbkJNQyBzeXN0ZW0sIHRoZQ0K
TG9nRW50cnkgaXMgIkNyZWF0ZWQiIGF0IHRoZSBzYW1lIHRpbWUgaXQgb2NjdXJzLg0KDQo+DQo+
IFdlIHRoaW5rIHRoYXQgdXNpbmcgoadFdmVudFRpbWVzdGFtcKGoIHdpbGwgYmUgbW9yZSBzdWl0
YWJsZSB0aGFuIKGnQ3JlYXRlZKGoIGluIExvZ1NlcnZpY2VzLg0KDQpXaHk/ICBDYW4geW91IGdp
dmUgbW9yZSBkZXRhaWxzIGhlcmUgb24gd2hhdCB5b3UncmUgdHJ5aW5nIHRvIGFjY29tcGxpc2g/
DQoNCj4NCj4NCj4NCj4gQ291bGQgeW91IGdpdmUgbWUgc29tZSBzdWdnZXN0aW9uID8gT3IgYW0g
SSBtaXN1bmRlcnN0YW5kaW5nIHRoZSBkZWZpbml0aW9uIG9mIHNjaGVtYT8NCg0KVGhpcyBpcyBw
cm9iYWJseSBhIGJldHRlciBxdWVzdGlvbiBmb3IgdGhlIFJlZGZpc2ggZm9ydW0sIHVubGVzcw0K
dGhlcmUncyBkb2N1bWVudGF0aW9uIG9uIHdoYXQgdGhlIGludGVuZGVkIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aG9zZQ0KdHdvIHBhcmFtZXRlcnMgYXJlLg0KDQo+DQo+DQo+DQo+IEhlcmUgaXMgYW4g
ZXhhbXBsZToNCj4NCj4gew0KPg0KPiAgICAgICAiQG9kYXRhLmlkPGh0dHBzOi8vYXBjMDEuc2Fm
ZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJGJTJGb2RhdGEuaWQl
MkYmZGF0YT0wNCU3QzAxJTdDQWxhbl9LdW8lNDBxdWFudGF0dy5jb20lN0MzNzJjYzYwYjZjMmU0
YTQ0ZTkwYjA4ZDhmYWIxNjIwMiU3QzE3OWIwMzI3MDdmYzQ5NzNhYzczOGRlNzMxMzU2MWIyJTdD
MSU3QzAlN0M2Mzc1MzQ5ODcwNjg5MTEyMjMlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lq
b2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4w
JTNEJTdDMTAwMCZzZGF0YT1HeGVTV0xLczFtWmFLU0lwd3ZHRVF4WDMyOVE0eDdhViUyQkVlcnVi
VnlxJTJCZyUzRCZyZXNlcnZlZD0wPiI6ICIvcmVkZmlzaC92MS9TeXN0ZW1zL3N5c3RlbS9Mb2dT
ZXJ2aWNlcy9Qb3N0Q29kZXMvRW50cmllcy9CNS04MyIsDQo+DQo+ICAgICAgICJAb2RhdGEudHlw
ZSI6ICIjTG9nRW50cnkudjFfNF8wLkxvZ0VudHJ5IiwNCj4NCj4gICAgICAgIkNyZWF0ZWQiOiAi
MTk3MC0wMS0wMVQwMDowMTo0MyswMDowMCIsICAgIDw9ICBJdCBzaG91bGQgYmUgRXZlbnRUaW1l
c3RhbXANCj4NCj4gICAgICAgIkVudHJ5VHlwZSI6ICJFdmVudCIsDQo+DQo+ICAgICAgICJJZCI6
ICJCNS04MyIsDQo+DQo+ICAgICAgICJNZXNzYWdlIjogIkJvb3QgQ291bnQ6IDE6IFRTIE9mZnNl
dDogNjUuNDc2OTsgUE9TVCBDb2RlOiAweDAxIiwNCj4NCj4gICAgICAgIk1lc3NhZ2VBcmdzIjog
Ww0KPg0KPiAgICAgICAgICIxIiwNCj4NCj4gICAgICAgICAiNjUuNDc2OSIsDQo+DQo+ICAgICAg
ICAgIjB4MDEiDQo+DQo+ICAgICAgIF0sDQo+DQo+ICAgICAgICJNZXNzYWdlSWQiOiAiT3BlbkJN
Qy4wLjEuQklPU1BPU1RDb2RlIiwNCj4NCj4gICAgICAgIk5hbWUiOiAiUE9TVCBDb2RlIExvZyBF
bnRyeSIsDQo+DQo+ICAgICAgICJTZXZlcml0eSI6ICJPSyINCj4NCj4gfQ0KPg0KPg0KPg0KPiBU
aGFua3MsDQo+DQo+IEFsYW4NCg==

--_000_TYZPR04MB423946E753220EC5BF52A82484739TYZPR04MB4239apcp_
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
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
 &lt;nanzhou@google.com&gt; <br>
<b>Sent:</b> Friday, April 9, 2021 1:11 AM<br>
<b>To:</b> Ed Tanous &lt;ed@tanous.net&gt;<br>
<b>Cc:</b> Alan Kuo (</span><span style=3D"font-size:11.0pt;mso-fareast-lan=
guage:ZH-TW">=B3=A2=AE=B6=BA=FB</span><span lang=3D"EN-US" style=3D"font-si=
ze:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:Z=
H-TW">) &lt;Alan_Kuo@quantatw.com&gt;; openbmc@lists.ozlabs.org; edtanous@g=
oogle.com<br>
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
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
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
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
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
%7C01%7CAlan_Kuo%40quantatw.com%7C372cc60b6c2e4a44e90b08d8fab16202%7C179b03=
2707fc4973ac738de7313561b2%7C1%7C0%7C637534987068911223%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;sdata=3DGxeSWLKs1mZaKSIpwvGEQxX329Q4x7aV%2BEerubVyq%2Bg%3D&amp;rese=
rved=3D0" target=3D"_blank">odata.id</a>&quot;:
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
</body>
</html>

--_000_TYZPR04MB423946E753220EC5BF52A82484739TYZPR04MB4239apcp_--
