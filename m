Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9B334CCC9
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 11:15:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F86Ny2V61z303s
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 20:15:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=xzUZ6LcB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=715147467=harvey.wu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=xzUZ6LcB; 
 dkim-atps=neutral
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F86Nd0flDz301K
 for <openbmc@lists.ozlabs.org>; Mon, 29 Mar 2021 20:14:55 +1100 (AEDT)
IronPort-SDR: xQxoNn3+b8THCk7WQnIoIDSxatu/RF7uQ7O2HD1pjh6IY7AXeMCx4jkSRiqolNKhXwlC7u8GEg
 HG2m2UW0YiTA==
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 29 Mar 2021 17:14:53 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 29 Mar
 2021 17:14:40 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (10.243.91.252)
 by mailbx09.quanta.corp (10.243.91.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 29 Mar 2021 17:14:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lpt79nCXnAjy8AZBkfedH4kqyMtErqwEsYry0Hk89q+WFAKspJiI7JJyUX1Pl1IuGMlpSHeQBJzktybWpJUm8O9uix3WzTqUHQDv29kbgFRVQyb2/3UlDHf2v5zRL3fq0YA0XssZbybPGUMx6w9VC9sK60bN9yPuVwNUK/WKY9t8vWV9Fm43Z3V8yMu+39bn0tb7wmQf7DSKe5J7sdX1KVUenQ0x/lVKSY2grQAOVKajs6xZ2Cw7Z4zcwK7Bigb0Xs1M0QtzfymEGDU0pPI+N5ZhldF9vQr9kksyJrPKO0rkXal4p2T06sFXFgf+Dwr5NxbTLRziBITe00dDeufUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfHIALD/f/omHZEzdfjP8USvCGR/z91uqKHt3FhWTn4=;
 b=fD05UIEJl6CfFUZmZOIcaXT/LjH9M92xZOa92oijoawlSQW5IWW296c6/1eauX1dSnfaPhw9FJ8M7OQfg7MCBVeNvFcw9fZ5+cdPo8k4Jb1IgxTlE9LmBbqPlNFrrfvKRQcx33XnAk3/Z6F9hEvbJHpHUnjYyv7StSjkarqfLYy0BOL4bjB4DzsO4mO8ms6yQONrUIYUfpkYx3v0B9ZNTiN6MNONsq3MoBHdkSk+4KZ8YN9HilrB0nUgQf3cV7pVqUUIbQhEjZDHteirB6lD0kv8HC4347Tdb27vjrzTLmcqIqbnvoD9uKspeokCeiOCQy6Le8VpVx/Y+ef1mgM4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfHIALD/f/omHZEzdfjP8USvCGR/z91uqKHt3FhWTn4=;
 b=xzUZ6LcBcL9RvRTXuKnJhZNI6DINHpPcA0KhMMGGsXsh/XLgG8aKyFW+O1aK+tXPTTozQKq44sB3dbbCp7EiDOcw2y2CqE7Enqy9gF/Jcbu1oeZDtxmufcqJrGN6UTikMx23I4ycU1vr/tiKW0bjIed4VsHQ/1FCR4Um/91/780=
Received: from TY2PR04MB3933.apcprd04.prod.outlook.com
 (2603:1096:404:8004::16) by TY2PR04MB3150.apcprd04.prod.outlook.com
 (2603:1096:404:a0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Mon, 29 Mar
 2021 09:13:49 +0000
Received: from TY2PR04MB3933.apcprd04.prod.outlook.com
 ([fe80::8923:6d23:e153:45a4]) by TY2PR04MB3933.apcprd04.prod.outlook.com
 ([fe80::8923:6d23:e153:45a4%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 09:13:49 +0000
From: =?big5?B?SGFydmV5IFd1ICinZLFSuvsp?= <Harvey.Wu@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [phosphor-virtual-sensor] get sensor service fail
Thread-Topic: [phosphor-virtual-sensor] get sensor service fail
Thread-Index: AdckeWMqNCOopUvCScqd11K5g4utAA==
Date: Mon, 29 Mar 2021 09:13:49 +0000
Message-ID: <TY2PR04MB39339884DCB08EC59BC95894957E9@TY2PR04MB3933.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9a4b1ef-cc04-412c-7f14-08d8f292f6f3
x-ms-traffictypediagnostic: TY2PR04MB3150:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR04MB3150E1FA9C00F02CB403CF29957E9@TY2PR04MB3150.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TnR89SEWRTvRp7r+HmP4+dMh7OQOo77z6G156UTr2B5O2u37cEDRmY7/oXE6d+NcW+AxcPF+vMHCvR8lfTC+6Ie2R4yC1m6Qt5gmC0wxPePi1DEg7GSo99Fjfrz8ij1qOxgp0HMPNiru9+YrG+8NagNvxMTf3U3znx5A+nuaQO/wrxLxquesMKwcVm4rEGNF58RP6lCbiue9jWNpCP2fnwghUYNnTp5sn2uoWv92eIgBAp33imHJXRutiEOrYvYbgDe6YD532f+P+zkNblIIiekr+ErswXnPs8LP5XFrvZ3IYCIIB5B9xL5NXiiGlA2rS1mRtvqeaL9oc/A9hl1vQ/wdoiatiiQGeFWeq2JPk0TnhgXZxKPiUL6fA40hP/AixxKc1nktY/ChzMle85U+e3N6kY+T0SmRQ5wCSWhlDqW9kpA4aTD4qVA/If2FypVucJuDNEOGK+eZ1z6/D6OK73MBWeopshHnOSEKqigIV7ro3EvLFGVsvGeEOCaYBYEGsdINuz3YHazPo47B7sUDL4B/BQvbBnIMuyw+PIVD701J5hgS6erkg+Aqt5xqDBtuF6RAjAF5vvOd9IFNrqtCKRiFCYnjLo5ya3KGQpxGw3ug2iQETR+IE9EIaVK/9IdWtVnu95f61PTitJ0UV0ity7H4dtN1zNlaSs4Kc45VRu89qaAxl0zULasQ4+ShGyxg5w/7OCmSESD2TZWxyJEyeWo9ocY578M3MG4Tr3a/g50=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR04MB3933.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(66446008)(55016002)(64756008)(66946007)(85182001)(66476007)(76116006)(5660300002)(38100700001)(8676002)(66556008)(8936002)(2906002)(6916009)(52536014)(478600001)(9686003)(4744005)(33656002)(54906003)(4326008)(7696005)(107886003)(26005)(6506007)(166002)(71200400001)(186003)(86362001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?Z2Q2c1VpWmJ0U0JUZ24zbDFkUkIwd1l3Sm1nNkoxYW1RK1B2M21DcTdQbTAxM21w?=
 =?big5?B?K0dlS3VTK0pQZUJsRlBUVWlmUDVJRXRHL0JDMllpVW8rRzh0eHBmYW82OFg4bDBw?=
 =?big5?B?UlpBRERZYWd3a0dmZWdNNjBxa0ViVnkvam1yQWFLbFk1Z25mMFIrKzFrZnlFckxa?=
 =?big5?B?bGdDY1RyYlB3b3FOZzhiTytQVThGaVBsbUlwamdmNEdyaHVrZ0RzdXZrdVBZRTM3?=
 =?big5?B?QW5lQ3Q5dEd5c3pFSWlROE9mS0tUWCtyWlIrSWtIcXRLWUlpSVJwOGE3SU9VaFEy?=
 =?big5?B?eWJXbHA1cEdHRVFmVE02a2JYRmVNUmIvMy8rS1hOcmkzOG01M0tBZVdKbWFlQk43?=
 =?big5?B?d1RsME1GbXQzbFVHMnBHajFrdklYOVBkVmRGT2VyMFBBVmQ1Y3RIbGIrbm9UTThI?=
 =?big5?B?T0h0SEFXbk5pOTV1c0pxODhVcHdWV2VrWkU2MC9WTTBhR0drczNhNGpPL1YrRVpC?=
 =?big5?B?NDNxY3FKNGJYdnF4ZlRSS3VQUnhla0p0cGkvWEorSEpNMUMxYUNWTzVTQTZUMUNX?=
 =?big5?B?Z3RLa05SaE14ZWtlZTF5VGlUSlhDUDE2UEhMM1cxbTFKdWZ5TkMwS1BKME12Tnht?=
 =?big5?B?bHk2L2VtNXhsemE4ZkQwM29yWHZnbG92SjBlUExYcEREa0VySkVoSWNJbmtoK3hY?=
 =?big5?B?SkswQ1B6dUZTUEx6TjByZE12RUI0NXBHZjRMK09nVVdnbmFYeSs5TU52U1R4OUpn?=
 =?big5?B?OUdvSStsOW0vY3ZXandzaS9VN3d3S3d6SjRZQ2RhYXFhbWYwRVpCZmhZTVZvV1B4?=
 =?big5?B?YzU4cGZEbjdVL0RpYjVmQVVIVnZzMnVjc0tqYmxqUkhMZ0FvZnoyL1BONFdYb1My?=
 =?big5?B?ZlBDY3krdlVGNGJDZ3hWcWFvWUtKMzBKd0g3Uks4N0c4N3M4MFZRTkJzNjJwSHR6?=
 =?big5?B?N1NGOUNkM1VIVGZsbFdES1BHSG1WSkhSMWJYSUdUV3lUQ0lHVVg2Z1NrMXZROW53?=
 =?big5?B?RFkxTEo0WTkyT2UxZU9Yc2Y2eEpFYzI2NDJxUHZlRHdVTjhOTXBabHNMMjUycjJr?=
 =?big5?B?cUlEWlU5UVNpeEVtNUYzNXpOSUVJY3BhR0RvQ0tsKzA2V05SL0tLU3NmKzFlL3Fx?=
 =?big5?B?SitkZHYzOW1VMjhzMnp0cndzbUkwZmlFYXpMNFhHNVU0Z1hqQXFjRWVYdCtNQnBJ?=
 =?big5?B?eFhCeGducnZ5Ry8zZ3BTK3NuMlpERy9URmx6WmFpb0cydUtTWTlPUU9iOVNETS9J?=
 =?big5?B?NkUvRGVtZzFsRmpyUTh5UXpCbEZXTDE3N2Znbm1zRUFKT2RWTmpUdEdMdGtIcGQr?=
 =?big5?B?WnBjZGJCZUhGelM0Z2Z2NHBhR291TFA1R3c2RkxNWHBXWldUMmgyb2VxWnNqVUxI?=
 =?big5?B?THpUY1VVU0xQeGZtS2daT2ZEL0lqREtHWi8zSHZaTWFsUWVuU3dHQ1FuTmljNWhM?=
 =?big5?B?OEh2MnFBeFhIYlhDNWVBVWlnc2RwN3FtRUVVUjBoOWFHVU5ackJwR0pCTnlZWXVz?=
 =?big5?B?ZjhMbWhnOVhuaFhsMlRKV3daZVduQ0FWNXVCZFNTQ0dWZjROd3ZHN3JJTmpkVW9r?=
 =?big5?B?QUVBdHB6M252UTRMNlNiRHVmME4wWWxGODI0Y29XVHk3NVc3Q2JPZU9rWStONE9P?=
 =?big5?B?aHU4SVU3aUpDUjRsUnkzVEkyYTFSN084WXhnYnhRRnpXY1NmQ3Yrc3ErT2REaEpZ?=
 =?big5?Q?klX+9eE1hRHmND5QXlf7mQji+RI=3D?=
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB39339884DCB08EC59BC95894957E9TY2PR04MB3933apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR04MB3933.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a4b1ef-cc04-412c-7f14-08d8f292f6f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 09:13:49.2875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m5nIruezP1MDEDjEemfKejKUJFs3dCVMTqBBxZwd8A1pwcAqG0F9OnVKZDVMjqX9gqcdvXFpjb2+8Z/LXrPEIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3150
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
Cc: =?big5?B?RHVrZSBEdSAop/myu7nFKQ==?= <Duke.Du@quantatw.com>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TY2PR04MB39339884DCB08EC59BC95894957E9TY2PR04MB3933apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KDQogICAgICAgIEluIGN1cnJlbnQgcGhvc3Bob3ItdmlydHVhbC1zZW5zb3IsIHRo
ZSBmdW5jdGlvbiBnZXRTZXJ2aWNlIHdpbGwgcmV0dXJuIGVtcHR5IHN0cmluZyBvbmx5IHdoZW4g
Y2F0Y2ggZXJyb3IgbmFtZSA9IKGneHl6Lm9wZW5ibWNfcHJvamVjdC5Db21tb24uRXJyb3IuUmVz
b3VyY2VOb3RGb3VuZKGoIChodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci12aXJ0
dWFsLXNlbnNvci9ibG9iL21hc3Rlci9kYnVzVXRpbHMuaHBwI0wzNykuDQogICAgICAgIEJ1dCBp
biBteSBzeXN0ZW0sIHdoZW4gYnVzIGNhbGwgZGlkbqGmdCBnZXQgc2Vuc29yIHNlcnZpY2UsIHRo
ZSBleGNlcHRpb24gbmFtZSB3aWxsIGJlIKGnb3JnLmZyZWVkZXNrdG9wLkRCdXMuRXJyb3IuRmls
ZU5vdEZvdW5koagsIGFuZCB0aGVuIHNlcnZpY2Ugd2lsbCBiZSBnZXQgZmFpbGVkLg0KICAgICAg
ICBJdCBzZWVtcyBuZWVkIHRvIG1vZGlmaWVkIHRoZSBvcmlnaW4gY29uZGl0aW9uIG9yIGFkZCBh
bm90aGVyIGVsc2VpZiBjb25kaXRpb24uIERvIEkgbWlzdW5kZXJzdGFuZCBzb21ldGhpbmc/DQoN
Cg0KVGhhbmtzLg0KDQpIYXJ2ZXkgV3UNCkVtYWlsOiBIYXJ2ZXkuV3VAcXVhbnRhdHcuY29tPG1h
aWx0bzpIYXJ2ZXkuV3VAcXVhbnRhdHcuY29tPg0KRXh0OiAxNzQwOA0KDQo=

--_000_TY2PR04MB39339884DCB08EC59BC95894957E9TY2PR04MB3933apcp_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=B7s=B2=D3=A9=FA=C5=E9";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; In current phosphor-virtual-sensor, the function getService wil=
l return empty string only when catch error name =3D =A1=A7xyz.openbmc_proj=
ect.Common.Error.ResourceNotFound=A1=A8 (<a href=3D"https://github.com/open=
bmc/phosphor-virtual-sensor/blob/master/dbusUtils.hpp#L37">https://github.c=
om/openbmc/phosphor-virtual-sensor/blob/master/dbusUtils.hpp#L37</a>).<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; But in my system, when bus call didn=A1=A6t get sensor service,=
 the exception name will be =A1=A7org.freedesktop.DBus.Error.FileNotFound=
=A1=A8, and then service will be get failed.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; It seems need to modified the origin condition or add another e=
lseif condition. Do I misunderstand something?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Harvey Wu<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Email: <a href=3D"mailto:Harvey=
.Wu@quantatw.com">
Harvey.Wu@quantatw.com</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Ext: 17408<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_TY2PR04MB39339884DCB08EC59BC95894957E9TY2PR04MB3933apcp_--
