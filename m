Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBE22E75A8
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 03:19:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5FNb2dGnzDqHV
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 13:19:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=6269517ed=harvey.wu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=ZrnCPZfl; 
 dkim-atps=neutral
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4D5FMN4Sk7zDqGX
 for <openbmc@lists.ozlabs.org>; Wed, 30 Dec 2020 13:18:35 +1100 (AEDT)
IronPort-SDR: E7i47ybcACMfpuiDCZk97myWJ84UlBOIdiB1A6pIquy7Qe1i570p3/Av2EQmiZZVs1294Vpzp2
 ttS+CcT+gX9Q==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx01.quantatw.com with ESMTP; 30 Dec 2020 10:18:32 +0800
Received: from mailbx06.quanta.corp (10.243.91.101) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 30 Dec
 2020 10:18:30 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.54)
 by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Wed, 30 Dec 2020 10:18:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bThCqYAk+vwe1kM5H0iIO+seegfLnwCUDcaWDsswwuiK3ffjd7otlq+e/oXPCpR5neE+102UhCun/ojdn4gRVrjx9ezDfdkhp+rlAx8TVznTonuEhc6pEyyk1bXCFegN7Z4wLXCDG1NBdMyrfW5loXRk7HNr/xCSCAGSPV8HSLI8F1Y4Fqa5gZY4OjiDV+76mPi+4Rhj/JTdUIHRfKu+3EBwH2EqeAmgYIXck5Vcl7mZin3yVYZCumDIjxPy0ZYHHgcMOcl4lR0Bqn+v0zp3MZ1VLq4bKZBbZudDLos4z+eIMlSsTVORyZUUrdK8c3rKXPmnk6OR2+jxBtH/+k81Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaXzFuSCx+ICAYJA+1YSnkWJLeJeeHDW4+OlMloaexw=;
 b=Y/YKHACfHX/MT1xlgBMw4s9cNjF5RcHpcYc+IUDw8kks+hgQC6qwYccPUYRzbXrNYIWU3UUB7WQpFwH/pjgL87lWxbBuoOZsDg6wQpraVydt1MqtzDMaoHKnI96onulCXLgGhFDLlBsyDVnMQr3u+51dnykiVrBsmLBxz34m6k6ief0pgUWWPd176QHqfNPyD3N5tEkAG0sTN7PyWajpT+EdUbAfyNgGq0hZKPKzBcN0HrBlVJ8nZGmc0jVi76NoToP0Dht/Khm8msuY0yn8yFmj/lpsyBSrJ47ky3MqNkGY/gZF9j2+JHL/6C3yPql/XNbG6+vao/pe5+tpIZ514Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaXzFuSCx+ICAYJA+1YSnkWJLeJeeHDW4+OlMloaexw=;
 b=ZrnCPZflvnH/43UkEiV7b2NdRdxSJfgQJsVbuXifKEVmMe9D7sZQQD89V9UMHWUt4atPX+IilY33S6JSu9+3iV4qc+yA0FKH+/Pl5AVDakDFvON9IRBKhvDPV32PPG4HNyraTa4e4uDaoMlrxSnrh9w0yweCfH4Pg0nmQB6iBhM=
Received: from TY2PR04MB3933.apcprd04.prod.outlook.com
 (2603:1096:404:8004::16) by TY2PR04MB3885.apcprd04.prod.outlook.com
 (2603:1096:404:fb::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Wed, 30 Dec
 2020 02:18:28 +0000
Received: from TY2PR04MB3933.apcprd04.prod.outlook.com
 ([fe80::e86c:66b9:97f3:22ea]) by TY2PR04MB3933.apcprd04.prod.outlook.com
 ([fe80::e86c:66b9:97f3:22ea%5]) with mapi id 15.20.3700.031; Wed, 30 Dec 2020
 02:18:28 +0000
From: =?big5?B?SGFydmV5IFd1ICinZLFSuvsp?= <Harvey.Wu@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [phosphor-virtual-sensor] Add new feature to get Warning or Critical
 property
Thread-Topic: [phosphor-virtual-sensor] Add new feature to get Warning or
 Critical property
Thread-Index: AdbeTetCIk4HSRZcQba2tGU0hZY5tw==
Date: Wed, 30 Dec 2020 02:18:28 +0000
Message-ID: <TY2PR04MB39331267ECA5147A09FF691495D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f9b2a8f-2692-4834-222b-08d8ac693211
x-ms-traffictypediagnostic: TY2PR04MB3885:
x-microsoft-antispam-prvs: <TY2PR04MB38854DB57423EC87FCB4876395D70@TY2PR04MB3885.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oCp/xnSAUoWMexI/zJ+D62vrI1qZlgpjqUVL12eoS/IbEBLBxagCuUqqn3WVMyYt+rgJNiDYbrJbYUu5ZJqNGxP+VxtvpBn/eXIC8moCAglhdIA807dot1WgAza7uqFtYkF2BfysxWVXbF7NqkouQMbwpL4fnjZ0NW4h5VXO3NabJWw4QolOrgmUqiYruBXxrC6PWuRpgFWZ1EgtLA/FTgowkSyCUgLQtscQZ+cJuYro2FDqZQQr4S4KpQ+WWRNGg62FuOp/SdzH+Zdd1L1XOhSE2/cJcKc13Fxzq5FnXi7MhNfFGSXwYJ1kssAUXUGMJEw0EWaPHNuYRJbiZ1plhm/4k4/tQFXM/q8Gx3Q8YUaeABdiojrKMjhuWA5lC7aNKv2Xt6tlR1MyltzrfCs8Uw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR04MB3933.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(86362001)(5660300002)(33656002)(6506007)(2906002)(8936002)(6916009)(85182001)(66476007)(64756008)(66446008)(316002)(8676002)(66946007)(478600001)(83380400001)(76116006)(7696005)(66556008)(186003)(52536014)(71200400001)(9686003)(26005)(55016002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?Ny9MaktxVVBxRkRFZ1BsMWNMaEZJWGUyTFZjbnBCU2JkOTZoaVdYOHBsbDFOYkpR?=
 =?big5?B?bkU2aTdBS1NsRGVBTnd0VENyemk5ZzRCM3p3SWtzSHZxVjBWdGN5OEdzY1NwaG00?=
 =?big5?B?TmlHMnlRekJCY3VGOTc5WmM2NHNNMGZBTFEvNFZQS2twUXkxWm9pTVZpemlSZFFG?=
 =?big5?B?ZHF5ZHd4SFZzRTYya2MrenFSdW03ajRVT2twR1Y3MmRETGw5SEdaYzNPTEQyOThJ?=
 =?big5?B?a2JyOUVOM2xySGxpWkVGbWNqUGNZN1dhNFVLdkIrZkZuZ2JQWW84a3lqTWhyeVFC?=
 =?big5?B?d1l6YmluTmd4bFZJWkxTTm5jTnlQWld0bUM1cDlOQ0VnT0lXOG5UQjBCRUJYVmJ6?=
 =?big5?B?d1NZdnNpbDNuVUloQVIrT1VPNUpYT0xZTXl5c3ZYZ2VyQ2Z3OUVVVDNQcHJzeXpQ?=
 =?big5?B?YTF3OVl0QTNYVWRmZ28xZU8wbHdNNFNWSUNnTGJYWTRqczFBaXJPY1ZvUHRVZS9q?=
 =?big5?B?TnIzK2hKZzlPdklMNC9YVVcveVlHTGhkbjlrU1BMclM2ajZobFIycVlGWjZqYnhQ?=
 =?big5?B?Q1ozdmEyTWJ0ekxrT3htTkRvN2M4RXlwbHluTy94VnRHTVMzdXNtbmREczZXcHBL?=
 =?big5?B?SjhKRFp1UWFyYVJVRC9MTXYvSWcvaDV4WDFzTnY4eFIycHhBaHhLMUlwUHNheDQv?=
 =?big5?B?dFZVRmNUYk0zQkdudXhURGRic0YrUHptNElWRnA0dXlDdnRKUWtFdGhYZzJsb0l5?=
 =?big5?B?YUowMFhDQXNnZlliTXlWczRNTkl2aTVpaWlqN1JxaGJSYzVZTTkwdUhyZFpJWlpD?=
 =?big5?B?YXN0MDZHako3TmxMZGNlRHZocFUrck1weklPRWpPWmE4TkhndkNrMmhiWGlwWjQv?=
 =?big5?B?a2k2bkpvbEdldG5XeW1YWUdXQTFwQ3VIcWtFUVE5ZkErRUQvcU52NmNucGpqRHRu?=
 =?big5?B?M05XdXRMVWhOU0E1bWl1aHA0Q0s5Ukc5MWpuUXJpRFpjT1R2ZktpWVpOTGhDL3RW?=
 =?big5?B?N0tDNy9ad0xpYTNoT1FwVEE0OStuRXcxQnorQzAvOEdBZTBFU0lJUTFqNXBVUHlF?=
 =?big5?B?MFZtUDdsU0JKYmFmYTk2VVZLK3lhTUZTdzY0Ly92QTN4OHJwTTJJYTJZeWNUR0J0?=
 =?big5?B?Nm9IT2lQck5VYTlhZFN2aEVyUTl4bzg5cEQ0cjNBbUU5UnpXenZOSVU4emRnVmZ3?=
 =?big5?B?ZFZwWEt3RW9XTndNWi9TYnlQV1FRckFkTjBhNWtwekhOMGVUQ3FLNldsWm0rc1ZQ?=
 =?big5?Q?0OsDy4OIJHJznHucBfRd2Zk/+vmIcWLeb3x1rC5axeI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB39331267ECA5147A09FF691495D70TY2PR04MB3933apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR04MB3933.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9b2a8f-2692-4834-222b-08d8ac693211
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2020 02:18:28.2670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cKQ50pnyD2KP0TV3hP3VKQ7+yDhgREqgLhCodewdKj6xAvw2oI0zfM2/oXoOpVStkHXs1xXO/Ac67mzIfuAJCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3885
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TY2PR04MB39331267ECA5147A09FF691495D70TY2PR04MB3933apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KDQogICAgICAgIFRoZSBjdXJyZW50IHBob3NwaG9yLXZpcnR1YWwtc2Vuc29yIERi
dXNQYXJhbSB2YWx1ZSBpcyBmcm9tIERCdXMgoadWYWx1ZaGoIHByb3BlcnR5IHdoaWNoIGludGVy
ZmFjZSBpcyChp3h5ei5vcGVuYm1jX3Byb2plY3QuU2Vuc29yLlZhbHVloaguDQpCZWNhdXNlIEkg
d2FudCB0byBnZXQgdGhlIHByb3BlcnR5IKGnQ3JpdGljYWxIaWdooaggdmFsdWUgb24gREJ1cywg
Y291bGQgSSBhZGQgYSBuZXcgZmVhdHVyZSChp0ludGVyZmFjZaGoIHByb3BlcnR5IGluIGpzb24g
ZmlsZT8gVGhlIHByb3BlcnR5IGNhbiBiZSChp0NyaXRpY2FsSGlnaKGoICwgoadDcml0aWNhbExv
d6GoICwgoadXYXJuaW5nSGlnaKGoIG9yIKGnV2FybmluZ0xvd6GoLg0KDQpUaGUgbmV3IHNldHRp
bmcgaW4ganNvbiBsaWtlcyBiZWxvdy4NCkNQVV9URU1QIHdpbGwgZ2V0IHRoZSBwcm9wZXJ0eSCh
p1ZhbHVloaggaW4gL3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycy90ZW1wZXJhdHVyZS9jcHUs
IGFuZCBDUFVfQ3JpdGljYWxIaWdoIHdpbGwgZ2V0IHRoZSBwcm9wZXJ0eSChp0NyaXRpY2FsSGln
aKGoIGluIC94eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMvdGVtcGVyYXR1cmUvY3B1Lg0KDQoi
RGJ1c1BhcmFtIiA6DQpbDQogICAgICAgIHsNCiAgICAgICAgICAgICAgICAiUGFyYW1OYW1lIiA6
ICJDUFVfVEVNUCIsDQogICAgICAgICAgICAgICAgIkRlc2MiIDoNCiAgICAgICAgICAgICAgICB7
DQogICAgICAgICAgICAgICAgICAgICAgICAiTmFtZSIgOiAiY3B1IiwNCiAgICAgICAgICAgICAg
ICAgICAgICAgICJTZW5zb3JUeXBlIiA6ICJ0ZW1wZXJhdHVyZSINCiAgICAgICAgICAgICAgICB9
DQogICAgICAgIH0sDQogICAgICAgIHsNCiAgICAgICAgICAgICAgICAiUGFyYW1OYW1lIiA6ICJD
UFVfQ3JpdGljYWxIaWdoIiwNCiAgICAgICAgICAgICAgICAiRGVzYyIgOg0KICAgICAgICAgICAg
ICAgIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICJOYW1lIiA6ICJjcHUiLA0KICAgICAgICAg
ICAgICAgICAgICAgICAgIlNlbnNvclR5cGUiIDogIiB0ZW1wZXJhdHVyZSAiLA0KICAgICAgICAg
ICAgICAgICAgICAgICAgoadJbnRlcmZhY2WhqDogoadDcml0aWNhbEhpZ2ihqA0KICAgICAgICAg
ICAgICAgIH0NCiAgICAgICAgfQ0KXQ0KDQpUaGFua3MuDQoNCkhhcnZleSBXdQ0KDQo=

--_000_TY2PR04MB39331267ECA5147A09FF691495D70TY2PR04MB3933apcp_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; The current phosphor-virtual-sensor DbusParam value is from DBu=
s =A1=A7Value=A1=A8 property which interface is =A1=A7xyz.openbmc_project.S=
ensor.Value=A1=A8.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Because I want to get the prope=
rty =A1=A7CriticalHigh=A1=A8 value on DBus, could I add a new feature =A1=
=A7Interface=A1=A8 property in json file? The property can be =A1=A7Critica=
lHigh=A1=A8 , =A1=A7CriticalLow=A1=A8 , =A1=A7WarningHigh=A1=A8 or =A1=A7Wa=
rningLow=A1=A8.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The new setting in json likes b=
elow.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU_TEMP will get the property =
=A1=A7Value=A1=A8 in /xyz/openbmc_project/sensors/temperature/cpu, and CPU_=
CriticalHigh will get the property =A1=A7CriticalHigh=A1=A8 in /xyz/openbmc=
_project/sensors/temperature/cpu.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&quot;DbusParam&quot; :<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ParamName=
&quot; : &quot;CPU_TEMP&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Desc&quot=
; :<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Name&quot; : &quot;cpu&quot;,<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SensorType&quot; : &quot;temperature=
&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; },<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ParamName=
&quot; : &quot;CPU_CriticalHigh&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Desc&quot=
; :<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Name&quot; : &quot;cpu&quot;,<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SensorType&quot; : &quot; temperatur=
e &quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A1=A7Interface=A1=A8: =A1=A7CriticalHigh=
=A1=A8<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Harvey Wu<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_TY2PR04MB39331267ECA5147A09FF691495D70TY2PR04MB3933apcp_--
