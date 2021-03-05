Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F4E331C0D
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 02:09:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvcYM6KW2z3cJm
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 12:09:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=TTBh6M69;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=6916cc8e5=jun-lin.chen@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=TTBh6M69; 
 dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Fri, 05 Mar 2021 19:06:21 AEDT
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DsL0Y546Nz30HH
 for <openbmc@lists.ozlabs.org>; Fri,  5 Mar 2021 19:06:20 +1100 (AEDT)
IronPort-SDR: UDPs6/qzZiaQzhCZMwLwcLE6Js8iu0eqrCrgI0xA78nPpsau+ZsIqGF9H6zbfVO3d/0Ust3uaX
 znQX9VGkFhqg==
Received: from unknown (HELO mailbx10.quanta.corp) ([10.243.91.107])
 by mx01.quantatw.com with ESMTP; 05 Mar 2021 16:05:14 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx10.quanta.corp
 (10.243.91.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 5 Mar 2021
 16:05:13 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (104.47.126.53)
 by mailbx05.quanta.corp (10.243.91.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Fri, 5 Mar 2021 16:05:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVD7BiQ4JxBYK1mK/32qrVMAQqaUEYj4d6/+L+6Xp3NmOsl4UmbHoYQdt7Rn/i+Bu8uLSEVNGfIkflF2LS1WaKbqh9atTsHPJVVJbaUH9m9KKUx4d7xfaiJTLJITVBtvfevlQB6FTHxXcY6P94eEaNUOg9SCSrNlTn2FVMRyqnBhdGgwcbKFcFfE3vKkBcCrkpkqMfYMFsfqhGIfNVE0kA3vxdmRLuQ3LFAieshGlXDJ458od45jSSbnsoitaVmw6vzCtyxwPgwriFg2BBC5krLC+e4VnLC5axB5sm28YORDWfHfqeZEj5ApFA3flmEDY/Z9tU39wbCbxq5IDqnWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPut3RaUaG2uqS6Kc3aYrLGzWiu6Gzl6WN+uWzPuN0g=;
 b=RTbKD5r9ynUUKdN1pN7iIInWp9xNPHpK9ZritgEI5gul2LRg/jwrmxyYjmoT2fiS4H3sBSVsKCfs6xxkjhj5iotkML4Ymje/f2zLtG4sL/thYzp/0ChsqrxUoBtweQK2LsZyJUPM/C3jMs+dDK1hUn0sUqbdS2CP0H5kUIrxwir9KjaMLh5CV16WZCX2GCUSEIUBTrZnbtzmE8pNrq13MQ1T0m0HATxxF1MgH51c9j3hsT6o5DRu6qO15Mi5tt5t7WIUUN61sUhy5IXK6SX9mGzUlCkhr/BjGJ3F5zq40xr3A/uhCzt9Y8dvzbd4pMbzte+nlOOTPXlbFZOLcf+h1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPut3RaUaG2uqS6Kc3aYrLGzWiu6Gzl6WN+uWzPuN0g=;
 b=TTBh6M69eO0mW7/5gohTH/lURBgNY8pFGpoNBMQLrVbtVQCQI4cdlH5KnQHcOzOrqgZPuQRAHLALeqz8l+ius+yzIcD67kPHymR+Rx/6W8gv+6o1vNs6puK34KKjWlN4erXWjz6Jzrki/8Bnlk7LIoTIT2TGpicfk28w9VRpv54=
Received: from HK0PR04MB3346.apcprd04.prod.outlook.com (2603:1096:203:87::9)
 by HK0PR04MB3235.apcprd04.prod.outlook.com (2603:1096:203:8f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 5 Mar
 2021 08:05:10 +0000
Received: from HK0PR04MB3346.apcprd04.prod.outlook.com
 ([fe80::4479:a01f:5836:73e]) by HK0PR04MB3346.apcprd04.prod.outlook.com
 ([fe80::4479:a01f:5836:73e%7]) with mapi id 15.20.3890.032; Fri, 5 Mar 2021
 08:05:10 +0000
From: =?big5?B?SnVuLUxpbiBDaGVuICizr6tUwE0p?= <Jun-Lin.Chen@quantatw.com>
To: "sunharis@in.ibm.com" <sunharis@in.ibm.com>
Subject: ClientOriginIPAddress is 0.0.0.0 or ""
Thread-Topic: ClientOriginIPAddress is 0.0.0.0 or ""
Thread-Index: AdcRljI3k+qPSfe4S+C/ciz7rAAZ8A==
Date: Fri, 5 Mar 2021 08:05:10 +0000
Message-ID: <HK0PR04MB3346AD905ABEB1250F51E202B1969@HK0PR04MB3346.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: in.ibm.com; dkim=none (message not signed)
 header.d=none;in.ibm.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4039b1e4-54ef-4c38-af44-08d8dfad65c5
x-ms-traffictypediagnostic: HK0PR04MB3235:
x-microsoft-antispam-prvs: <HK0PR04MB3235A709BB9F4CF2F49301AEB1969@HK0PR04MB3235.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lKGIJqUpMKDhzBNy+bjOhTMp5nYbSnSu+B2JglZplk392RS51/f0i2a35auJio8SDNJtvEiWCT6wrNeah7VAQHKKNzob+dzkyI93V3+0ghsMSo/ooU1MAYzqnJ24MElQN123eGqBxJUP+9Valm/wJSxvt1K7NCopckQpu6sUWSlU40hGUyV1cG4NgOim0gKIV+85HJWt6YRxZa0bWvy5/K3gDhEygYRtvKP0falIwx4gfHxlOIo/a+IGQ8CjoOBzuDAmDuomhH48lGA1cIZLqKY3XvSRf2wxIhHU5g0oMEbWo7Pujlh39y5JUZN7FxcOXKxglXaXNWNe3gC40mGFI0WGxHxHgOoYJ8888rs4LnwrC9PcmieiYhyWI++WIFYAJGr++LkGs+Ted9TUKfZpey+qL7gWQG+pDOMZS0if1Cv92J7v4+f0W4LlooGH36Yznqxh8u4OPNzLNSqfPeDsxvEMWHsYlEHMfXhXpKTARaCvrsfDlOt1nOkE2Uc2cO0dj2Bb0jmbv+LpeBHQZEVTlg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3346.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(2906002)(316002)(26005)(7116003)(66946007)(6916009)(66476007)(83380400001)(86362001)(55016002)(4744005)(478600001)(4326008)(33656002)(52536014)(166002)(71200400001)(5660300002)(6506007)(966005)(64756008)(8936002)(66556008)(76116006)(8676002)(186003)(66446008)(9686003)(85182001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?RlN3UEczbTYxZDRJcTJQbVA4QmdBcGY3OWpxTkFYZnIwVjAyWlVqRVNLODRvTUpu?=
 =?big5?B?eXhNdkkzOWhITVI5VzQ1MTdLaW9veWNyNzhUK083WXczUXpHOWdPVkF6b2ovdmRh?=
 =?big5?B?VWhzYWpwTFJkRmtRZlByVm50QStkMno3aFpHVnVQcnRwdWQvZGRzbmpzT0Rzemg0?=
 =?big5?B?TUJrVmo0aExsWEI4OE5Ba05mK0tYZy9ZRDNIc3MwaGREai9DTDkxSndkejFuMkNm?=
 =?big5?B?MEpXUlRuLy9WaDJaUXNVdG1mdkZPMDJQdkpzdzFJTDdNdHlPNHhUV2tLT1g3a0p3?=
 =?big5?B?TGV4dU1YRE0yT0o1SURZVDdsU3AzMmVOYjY0VVhhaitEekR3a2tsSWMwbUJ0VFNy?=
 =?big5?B?cUVjK08yb1FNK2hLbkI0Vk8vcjZUcmxqREcwT0V4Nll2NUFpd3JoaHgxcStNM3J0?=
 =?big5?B?aUlVaHQzWGxUa1JGbXdWWTR0UG91K2I2ZkxPMXdnYVBDaXI3R2I0dTdmTUVqTlFX?=
 =?big5?B?Y056bm1vMzA3dkd3VWpieEowRVYvTDZYR2FoVjJJaTNCNEJhT0wrRVR1VXl1cW96?=
 =?big5?B?QXJkdldTQml1RDdSTmk1Z2xZcUdGYVRvYm5xSk1NckowWk5nRWhyaDVSUGErRVpH?=
 =?big5?B?WUdJaVJSY1dHYzdYVFlBUFFxMmdZY0lLNVpNVThOZzRPVXlRakk3ck5rYTNWRXh5?=
 =?big5?B?eWdRdzBmM21iQW1sdm9zckhTZTNxbnBDdlpEZkFoL1gxbFdNUXBHV3BpaldtOVV3?=
 =?big5?B?ODM3MVJNSzFET0lmbnJjNWlTdzlBSjdOV2VyV3k3cmZBanMyR2djVnBDRGRkMU8w?=
 =?big5?B?TU1xVWgzY29mN1BVSzVVZnpPV2cyWi9XTDNCZVV4R0JBTWJSQ2pyMURncnZvWVdP?=
 =?big5?B?bEd6OUoyRkpMbmsxYmF1dWNOUXpCb0h6MVZkdTh0TVduN21sNHNBKytZbk82S0pB?=
 =?big5?B?QW50bnFWMzdFWUZtUTlST3VwRzZodVFsSzFxRklFbm5uS2F0b25BMmtaRlRBV1pV?=
 =?big5?B?WCtSQUI2cmNZTXBKbWQwVG1jc3NCVzV3bldPKzk5NXRvWERKaGhkYlcxaUkwVlB4?=
 =?big5?B?MjBXLy9XNks0TklaalVnTmp0cjlQTEFzSURMZURmbHZhb3ZVcEtPVzVUTmdZVDVa?=
 =?big5?B?R1lxOTJrek4wYVJJek5UdjZyZ1h6bEtSb3dvMHoxYVNURTBGUEVXY0JZMWNtc0dw?=
 =?big5?B?VitPV1BlWkV6bHBwNVhSc2txcVY1Q0VIUDJkdzIrQ1B1RURkU1dyVE9Na3BhU01J?=
 =?big5?B?UVRiYkl1WCtzUS8vVDRRU0Z5UEdkQmVGcXRORnNzVSt1SXpsY2MyZU9rL3ZXd3dz?=
 =?big5?B?QkN4Z2JmdE1yalI2eEFmMTJQbCtYbnpkbWVtb1lUOExIR1kvNWgvVnJKbjNwUU9q?=
 =?big5?B?ZFFLbUJrWWp3TzRkeHZkdmtBM095bHNlVk5acnA2OVMxOVBaQ0xxOThUV202NThl?=
 =?big5?B?K1gvZE9wdXZESWxUTnR2QXdINlNxajFOQ1lrV3BHZXI5cSs0Q3JZUUVaRHBudlhZ?=
 =?big5?B?SlJacVZkTENmQUdnOCtxeENFWE80NHFJblE0RjFzdDQxelFxbGZrN1daQjBwelg3?=
 =?big5?B?bi9KZUdlWWdEeFkxa3ljQ1FzQWNKb3dMZjljRk40NUIxbEhGZXVmVzlWMjZzNHV5?=
 =?big5?B?T3pjN1VPK1VmWDVvZU9PTHY5TUhram5xZytNLzF4dThXTFRJRDVtR0FYbEJ4MVpZ?=
 =?big5?Q?wKy0fK40U1/FFbpXBLMQjaT/bjA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB3346AD905ABEB1250F51E202B1969HK0PR04MB3346apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3346.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4039b1e4-54ef-4c38-af44-08d8dfad65c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2021 08:05:10.2265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wRDhAL0dwxHkS886QPn1XlkOdIqQywcoayAnxYCGnouRgBuKmZdyLq69qMd3MBBX3iM6ekCHtYUq6WPaqSnt2mSBdjjCJQWcNJsWH6j2JaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3235
X-OriginatorOrg: quantatw.com
X-Mailman-Approved-At: Tue, 09 Mar 2021 12:08:56 +1100
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB3346AD905ABEB1250F51E202B1969HK0PR04MB3346apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgU3VuaXRoYSwNCg0KSSBmb3VuZCBzb21lIHByb2JsZW0gd2hlbiBJIGNyZWF0ZSBzZXNzaW9u
Lg0KVGhlIHByb3BlcnR5IKGnQ2xpZW50T3JpZ2luSVBBZGRyZXNzoaggaXMgoaehqCBhZnRlciBQ
T1NUIGh0dHBzOi8vJHtibWN9L2xvZ2luPGh0dHBzOi8vJCU3YmJtYyU3ZC9sb2dpbj4gLWQgJ3si
dXNlcm5hbWUiOiA8PiwicGFzc3dvcmQiOiA8Pn0NCkFuZCBpdCBpcyAwLjAuMC4wIGFmdGVyIFBP
U1QgaHR0cHM6Ly8ke2JtY30vcmVkZmlzaC92MS9TZXNzaW9uU2VydmljZS9TZXNzaW9uczxodHRw
czovLyQlN2JibWMlN2QvcmVkZmlzaC92MS9TZXNzaW9uU2VydmljZS9TZXNzaW9ucz4gLWQgJ3si
dXNlcm5hbWUiOiA8PiwicGFzc3dvcmQiOiA8Pn0nDQpCb3RoIG9mIHRoZW0gbG9va2VkIGxpa2Ug
c29tZXRoaW5nIHdyb25nLiBBbmQgSSBhbHNvIGxvb2sgZm9yIHNvdXJjZSBjb2RlIGluIGJtY3dl
YiByZXBvc2l0b3J5Lg0KVGhlcmUgb25seSBkZWZpbmVkIHRoZSBkZWZhdWx0IHZhbHVlOiChp6Go
IGluIGdlbmVyYXRlVXNlclNlc3Npb24oKSBhbmQgbm90IGZvdW5kIGZldGNoIHVzZXIgaXAgaW4g
ZWxzZXdoZXJlLg0KSSB0aGluayBpdCBpcyB3aHkgQ2xpZW50T3JpZ2luSVBBZGRyZXNzIGlzIHN0
cmFuZ2UuDQoNCk1heSBJIGFzayB3aGF0IHN0ZXAgb3Igc29tZXRoaW5nIEkgbGFjayBpbiBjcmVh
dGlvbiBzZXNzaW9uIHNvIHRoaXMgcHJvcGVydHkgaXMgYWJub3JtYWw/DQoNCg0KQmVzdCByZWdh
cmRzLA0KSnVuLUxpbiBDaGVuDQoNCg==

--_000_HK0PR04MB3346AD905ABEB1250F51E202B1969HK0PR04MB3346apcp_
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
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Sunitha,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I found some problem when I cre=
ate session.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The property =A1=A7ClientOrigin=
IPAddress=A1=A8 is =A1=A7=A1=A8 after POST
<a href=3D"https://$%7bbmc%7d/login">https://${bmc}/login</a> -d '{&quot;us=
ername&quot;: &lt;&gt;,&quot;password&quot;: &lt;&gt;}<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">And it is 0.0.0.0 after POST <a=
 href=3D"https://$%7bbmc%7d/redfish/v1/SessionService/Sessions">
https://${bmc}/redfish/v1/SessionService/Sessions</a> -d '{&quot;username&q=
uot;: &lt;&gt;,&quot;password&quot;: &lt;&gt;}'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Both of them looked like someth=
ing wrong. And I also look for source code in bmcweb repository.<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">There only defined the default =
value: =A1=A7=A1=A8 in generateUserSession() and not found fetch user ip in=
 elsewhere.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I think it is why ClientOriginI=
PAddress is strange.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">May I ask what step or somethin=
g I lack in creation session so this property is abnormal?<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-family:&quot;T=
imes New Roman&quot;,serif">Best regards,<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-family:&quot;T=
imes New Roman&quot;,serif">Jun-Lin Chen<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_HK0PR04MB3346AD905ABEB1250F51E202B1969HK0PR04MB3346apcp_--
