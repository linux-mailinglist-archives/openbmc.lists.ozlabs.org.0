Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9843DB1F6
	for <lists+openbmc@lfdr.de>; Fri, 30 Jul 2021 05:32:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbXyw1ks6z3cRK
	for <lists+openbmc@lfdr.de>; Fri, 30 Jul 2021 13:32:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=F1E++0DB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.119;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=luke_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=F1E++0DB; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300119.outbound.protection.outlook.com [40.107.130.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbXyW5vBrz2yLS
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jul 2021 13:32:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIJ0Sb8UcW040eCTKz0Jv6YhgS6NltK80baVHmADzK/oxxNfZQ3/EpzoHOgYmYKBTyDVzlJTCmp82LZxcdHc6CUkgkzYLd2JqQGqJDOWM7V6hgWvJh/uQ3jk5Gkh6yAQi5W5d/gMaH2441HLqKYwXB7dCr8mShuA2QLmGKEAfASyqbymyQpeG78AI15RAvGT01D4ztRCDwVbPQF+t/KeFMlPGH2yr6ngi6UM6dG76yMaU5gOQztH9YlhQdbdjdfzdL+5bxpALVerwpJucyOd2vjWWEJtgc/AuaOf0x1daHcsK6iI/bjZgFchQ55pe33OJToGRenxy7I0k3+kaXxirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKQor4VpuIQPaiw7S4Na3kEcenvFuEM3oNRkvCXay7E=;
 b=Ff2HQKnc18uDL/1pXHCREduH5HEJXLjHEGGyFiOIQ7xTpddNI6rdYzqKiERJ5ogqTe8up7R5mfpV6VvWMCT/09cZW+1DFV9aHuO3Jq7aXpuPAdm3U67b3NGV6wFE9PUweLJLg+gasI0ekh0pjj5IPEZR3pTj0tx7K66pnIxv2v0mX+684j2HVz+7Jfg+HI/6CF/FVocUryeRjAzHKSuwTudvgWtyXq6sSjZcWwv57JtikTSQPRn/U++s+FdOoCXN5ucdab0Pk3RE/CKSbalA7UHjPvMaFB/+ek+Yx61fJgQi0fMtjAQKJ+WsViTY/1l3Rnxx+J2TRjWAa+wXwPf0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKQor4VpuIQPaiw7S4Na3kEcenvFuEM3oNRkvCXay7E=;
 b=F1E++0DBiDAC7FU4t8w9t/q2DlICVyoYEGSufkU00px2LTvMsiqeiJw58mr3SXBTjiJwv0ypW3xcUxFVpzcXdvE4VVRuGpTYwE1kcSSNLwYzQitSiaxUhxdXykxufLzPrQUxTZgJlNkmsjcc2lTD2oWDnxXQHci4DLEfITsj0t+9OuRPV+cicx1JozwDnqaIbWYJQslnmq1Ql1gzR9RxjI73o7tJK1lQcRK0jzWJhcGHz/SXec4/H8JKf1QwvIfXCPd++gRN/6yG4tJ2QQico6fKEwZFI0ID8P7DBCGh/SYoRut9WeagIwlZZcTTC27VrbebhpDInw0oF+/HPOg6qA==
Received: from HK0PR06MB2321.apcprd06.prod.outlook.com (2603:1096:203:49::11)
 by HK2PR06MB3411.apcprd06.prod.outlook.com (2603:1096:202:3c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Fri, 30 Jul
 2021 03:31:57 +0000
Received: from HK0PR06MB2321.apcprd06.prod.outlook.com
 ([fe80::10d4:b8ce:9878:23bc]) by HK0PR06MB2321.apcprd06.prod.outlook.com
 ([fe80::10d4:b8ce:9878:23bc%5]) with mapi id 15.20.4373.022; Fri, 30 Jul 2021
 03:31:57 +0000
From: Luke Chen <luke_chen@aspeedtech.com>
To: =?iso-2022-jp?B?GyRCRm5MbiVgJWslNyUoJWklNBsoQg==?= <1181052146@qq.com>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: RE: How about the performance of 2D enging in AST2400
Thread-Topic: How about the performance of 2D enging in AST2400
Thread-Index: AQHXhIJz7ZFO/tZDdEO9gpjZ4OKNData3ZcA
Date: Fri, 30 Jul 2021 03:31:57 +0000
Message-ID: <HK0PR06MB2321C4B1CFA8AC61162E786FE1EC9@HK0PR06MB2321.apcprd06.prod.outlook.com>
References: <tencent_D89F529E732AEFA4CBA1EEC3597D210BC305@qq.com>
In-Reply-To: <tencent_D89F529E732AEFA4CBA1EEC3597D210BC305@qq.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: qq.com; dkim=none (message not signed)
 header.d=none;qq.com; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d37e779-6adb-435a-a516-08d9530a95d8
x-ms-traffictypediagnostic: HK2PR06MB3411:
x-microsoft-antispam-prvs: <HK2PR06MB3411FD4DF615D8616189BB10E1EC9@HK2PR06MB3411.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: glZryV7C3Fu5QgrtP3VfHeizHhOAHpxOvmWhIfWs4PJyqQKCi7DF/ZxhXEq3WZXPX49Sz7ohU6INT79jC8tcg5iKjRZ8zpJGnvDoxl2gTRpOhzxBv4AZA/FBjLDUjSCqE4BhB/Dl0otnfY8e0i5CqDtb71lOGeTk8fGHyy29dEBVIuz/a3/8+yJqOgUBCEbDoJeE8EJMetkn3o8MQWHz3Mx92X/rYLGOmPNhxawZnP9Ox8uoVENAIVylhgBxqtXPl6jl7hP9e64L5t+JqnaD3CyDy4I4/bhWqDsNx24+AljODk3OkJYEXXryvZ3J95j7Uf6coI8P9prHytXNQ7ytgNBnYyD9+MqitoUZ8w6ya/gywthA6jn5H57VTVcrc8J65IUNZ87uDU9bufQ7XRBLtNB5xC2QUcAlRif+vPMqOVRnt7RYIcpx5+zS/VTogkLonnoUifv+dSGXVzCCr2XzOppN7Ao/oL4wwACQJZWAhFk+6tMJaSVHCCE8vixt2PTTiLON9pzGTGoclx3ijtR1eqdR8bAjMbObdEWWjH4B42IJ7BtaU0QxdH3YtRfk0VamYHxaXpsrD5sjlRZvK0AJ+n9BI7Gi6f6Fum0aY05ixoWK6aPYPf3hEkxiMPhBYRtz2O2h4nLLVfJB7zWAED/+MegP6SZup1tIXnFJJOnyOW/wfIpnuHakdYCPH7W3h/AjToVTtpOI1eWZ1KH7PCjU2Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2321.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(396003)(39840400004)(136003)(8676002)(8936002)(33656002)(71200400001)(4326008)(110136005)(4744005)(7696005)(316002)(2906002)(66446008)(186003)(38070700005)(122000001)(52536014)(9686003)(478600001)(55016002)(38100700002)(26005)(66556008)(66946007)(6506007)(64756008)(86362001)(53546011)(76116006)(66476007)(5660300002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?U1ZtZG9jSEM0dnF0VWVJQUlXSm9JT3JSL00zeHc0N2p4WlY0NzhJRkdH?=
 =?iso-2022-jp?B?ME9SaURtdTZZQ1dHQ05nTFB0eHAzYmR6d2t6LytEUEIwc3IyUDRTM3F4?=
 =?iso-2022-jp?B?L1hWeHZqRVhNdDY2b0VCeW05VURRbFRTbGJaMHo2LzFMNDByTkRHUEpj?=
 =?iso-2022-jp?B?ZlMzcitVU2JtaHVJV1UybktjcUxkd2dqK0JiYXFwQWJTU2ZueUdYaitK?=
 =?iso-2022-jp?B?NWhzMnFtR09XWUYwQUdybmd3UXF0akN3VDN0QXNrZ3E3VXM3Vlo5NDdn?=
 =?iso-2022-jp?B?MXJhci9hTlM2MXprOFBWZmR6TXBuS2NBVVQyZmRmYzhob0JuYXZrZlk2?=
 =?iso-2022-jp?B?Z0x2UFNUZUtVaGtJRVB2VVZOVWdUZEd2L1VLK1M4NXJCaHFxclZlclJ6?=
 =?iso-2022-jp?B?VEdzUjJObG5TK3ZtbXh4L1hvRXMvY3RjQlFiY0RRbGo4VXJ4UElkK3E1?=
 =?iso-2022-jp?B?NUsydnI0ak5JQ1g4cVVpcFA5R280Q1JPQU5oQXFqMUh4dXVVcHlrdlNt?=
 =?iso-2022-jp?B?bEtkVE9MYkRteTV1UUZ6Nk1tay9zdSs5N2oxcWFGNHdUTDNjM0FTbjZB?=
 =?iso-2022-jp?B?ckYwU0dQeittdVJlOWR5V0lxRlRCUFkvV1VHbU9iSU5lZEI4MkJVUkdw?=
 =?iso-2022-jp?B?aDNlVVRwUmpwaTdWbzBMSm1Ma1NBSUZWeEMrd2ljM3BRTlhtVkdsWWtu?=
 =?iso-2022-jp?B?QlE5OU5HOC9NSUJKR1FyK2MvT1FxbGlhTVBrRkxJNWpCM2ZDaEZRdWta?=
 =?iso-2022-jp?B?elJ5a2JhSXYzbHFWbzMxeXVQakJ5NjJycU5VRTJyd0J2U2hRVjBKYmhV?=
 =?iso-2022-jp?B?QXBaZjZaY3lLdTArdXBsaXBTSkNLV3B1SGNVNGtCc0R6ZW4wOW1DOHU0?=
 =?iso-2022-jp?B?Z2ZUeTdyaTNZNFFMbzlVMEZ6ZDQ3M3p4elFQOWh2cWg0Q2lCazVVZEx5?=
 =?iso-2022-jp?B?SGQ5ZnQrWWw5ZVdmYi9UTTllT3lkR29OUFF1bnF0R2Zqd1BvUXJoNHlr?=
 =?iso-2022-jp?B?cE42SlZBWFhydjBPU3Uzb3pTYUxvdFJOMVJEcWwyall0YlN5cXBhc2RU?=
 =?iso-2022-jp?B?Q1lXa2pLNENQWGhuV3QrcVRjM1FnYTYrZGdNbmU4YzdpTFJBUHE3NmZX?=
 =?iso-2022-jp?B?RS9hMXRvUkZmaXU4U2pyWXc4TXVQN0JtcHZwNXpSYzdCelkvRVJzYVpq?=
 =?iso-2022-jp?B?aXVCME9BeitZUHJTNnNzUFQ2c1J0Q3Z1aW1xS1NnQmxZVGRTSG5haDAw?=
 =?iso-2022-jp?B?SitMckdHbzFpaUtjOGtKM0duQ1hnL3JtRUJheEJ1ZStLOExVY3VPdVp4?=
 =?iso-2022-jp?B?eUh0aTZlOWQ5NW5nY3NnUWY0VnRoRVhsNjR2R1pKTlp6bVc4djdNL2k3?=
 =?iso-2022-jp?B?aHhnQnAyeU1uYWl1ZG80cFZVaHhDMTA0WENQSDNNQk96L2c5OU5FMnVI?=
 =?iso-2022-jp?B?R2FqdlBsbVE1ZXRiay9lUW80Y0N1UytQMDRlZHFWTHF5cEswZk0yTjRK?=
 =?iso-2022-jp?B?TDc1anRiV1htanJQampyKzRSRFhjZWZ2QmpTeGR4dytrYnZHVVNSczFi?=
 =?iso-2022-jp?B?eWpFRkluNGZOTUpyOVNuSyt0b1RyUDBSdTBVd3REWDRPZ2RMdi85OFg1?=
 =?iso-2022-jp?B?MVMrOXhnNDhvc2owOU00cWtNQ0x1bDdFcWhCaGFMdDE2MWRWOGg4dXM1?=
 =?iso-2022-jp?B?UzJzWHh3VGtBM0NqemxKSk9kam44Mi9rakdmUUIzYk0wZ1FISVJSa2Fv?=
 =?iso-2022-jp?B?RzB1WXlRbE5ORGJMMlNnYjk5dGprR1VzZUk2TGlhTHNXWGRHNXBjZGZo?=
 =?iso-2022-jp?B?eDRKUWUvNFYvUmJyZ1M2QVhrbXZxTU13NVh3azgrejNzd053c2RVUFRQ?=
 =?iso-2022-jp?B?S1VvUlRyZUlzT1ZJMUF1MktWb2tpV25LVHhXQ2tKblFHS1VCWXYwZ3pL?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK0PR06MB2321C4B1CFA8AC61162E786FE1EC9HK0PR06MB2321apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2321.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d37e779-6adb-435a-a516-08d9530a95d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2021 03:31:57.6988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S//UEw+9kFfV4Cuol9R6VZoNCf0d94VPADSOvVhglr3eoVXjpbCMXhc6jpxaRpq/w01qFTFn3Ggmf8+ymF/27MEDgc7isyNU+3nn7h5waVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3411
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
Cc: xiahaojun <xiahaojun@iie.ac.cn>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR06MB2321C4B1CFA8AC61162E786FE1EC9HK0PR06MB2321apcp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Liu

AST2400 internal VGA is a 2D VGA, it does not support OpenGL.

And since AST2400 is for the server application, the 2D VGA is a basic VGA,=
 not very powerful.
Thanks.


Best wishes

Luke Chen
(O) : +886-3-5751185
(M) : +886-935-592-892
4F, No.1,Sec. 3,Gongdao 5th Road, East Dist.,
Hsinchu City, 30069,Taiwan,R.O.C.


From: openbmc <openbmc-bounces+luke_chen=3Daspeedtech.com@lists.ozlabs.org>=
 On Behalf Of =1B$BFnLn=1B(B??????
Sent: Thursday, July 29, 2021 9:55 PM
To: openbmc <openbmc@lists.ozlabs.org>
Cc: xiahaojun <xiahaojun@iie.ac.cn>
Subject: How about the performance of 2D enging in AST2400

Greetings:
I am using AST2400 recently and use its VGA controller as my server's Graph=
ic Card. I notice that AST2400 supports 2D acceleration via 2D engine. I wo=
nder how about the performance of AST2400's 2D engine and which interface i=
t support, OpenVG, OpenGL or any others.
Thanks for your reply!
Best Regards!
Liu Hongwei

--_000_HK0PR06MB2321C4B1CFA8AC61162E786FE1EC9HK0PR06MB2321apcp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"=1B$B?7:YL@qs=1B(B",serif;}
span.EmailStyle18
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Hi Liu<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">AST2400 internal VGA is a 2D VGA, it=
 does not support OpenGL.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">And since AST2400 is for the server =
application, the 2D VGA is a basic VGA, not very powerful.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Best wishes<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Luke Chen<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">(O) : +886-3-5751185<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">(M) : +886-935-592-892<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">4F, No.1,Sec. 3,Gongdao 5<sup>th</su=
p> Road, East Dist.,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Hsinchu City, 30069,Taiwan,R.O.C.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
openbmc &lt;openbmc-bounces+luke_chen=3Daspeedtech.com@lists.ozlabs.org&gt;
<b>On Behalf Of </b></span><span style=3D"font-size:11.0pt;font-family:SimS=
un">=1B$BFnLn=1B(B</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;fon=
t-family:&quot;Calibri&quot;,sans-serif">??????<br>
<b>Sent:</b> Thursday, July 29, 2021 9:55 PM<br>
<b>To:</b> openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Cc:</b> xiahaojun &lt;xiahaojun@iie.ac.cn&gt;<br>
<b>Subject:</b> How about the performance of 2D enging in AST2400<o:p></o:p=
></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Greetings:<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I am using AST2400 recently and=
 use its VGA controller as my server's Graphic Card. I notice that AST2400 =
supports 2D acceleration via 2D engine. I wonder how about the performance =
of AST2400's 2D engine and which interface
 it support, OpenVG, OpenGL or any others.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks for your reply!<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards!<o:p></o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Liu Hongwei<o:p></o:p></span></=
p>
</div>
</div>
</body>
</html>

--_000_HK0PR06MB2321C4B1CFA8AC61162E786FE1EC9HK0PR06MB2321apcp_--
