Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 908F73473E1
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 09:45:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F51zC3sNFz30KN
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 19:45:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=be+Z8Ze8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=7101eb355=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=be+Z8Ze8; 
 dkim-atps=neutral
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F51yx2lTTz302j
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 19:45:27 +1100 (AEDT)
IronPort-SDR: yifVRmX9J8Qkn14gZkbYP//SWl/4rulLeXrTjdr2snd8h3Fq+dg7WaqjyRbtjXDYSFAM5EQ4Ui
 V1gt+1uffPNA==
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx01.quantatw.com with ESMTP; 24 Mar 2021 16:45:23 +0800
Received: from mailbx10.quanta.corp (10.243.91.107) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 24 Mar
 2021 16:45:22 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (10.243.91.252)
 by mailbx10.quanta.corp (10.243.91.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Wed, 24 Mar 2021 16:45:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bj8BsBslTGRxmZa6Hxjygo8YYnEUwMUHO8LsKpCINT8eV88HM+QXDep6OLlYB6kdmjiLK6ag/5pWSOX1Vz2R1kM7p7Lu6Ap67klfPNX61jLSSVS2f6N6fQCbd8IQRG4JR7ZbL8eddHVc2fC5yxCCcsbVsTsl9QeCPwBUr89ALpEEA9jdgPe9fjwrVpa9Vdp4AEqJYOGVc38tg2C8CAPuHUPn458mn7jxjxti3Q8wvntJK3r1VBaiswZPMxcG0yph1DVPXL5TlIHF7MLPHirgXRijAldL/JxgjjGRRB3FNPJsLZgcpIXTwrNt6byHRY+FiS1zZg6MOoooVoKgwL77Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FM2swtU0izHi2qzjXhbS3mCCdqaH9J8P2TqCwkzJO+0=;
 b=HGElUSBBoibdRWnfN04j8nIrvexHRkKMdBqmIwUm32Jk69qKTh6/Soz/EC/OqFvdipM3lYI2Fce2gWRpGyHFIWAbViGjXRcAGD1BMA1mBYLL1PVNUrnQd5BawO3kOkGZBix4VvxLhCbKQK72pZi7isInjOSJOwBevRyFG2C1fvvPF/VI5Noecs5+WxL47RVCkM7L2F5zEkJou570eV2aDhOkL5DoHVfA48CHoxVtlO3nUyJhR/e4kdlLw3WT4wVYq1lgPaS/ECbQk+L+yvE4TDRfk94wNhL+//p99qoCm7kA/MwVVE9b9SQpP1VPLr9lAR9BzBpK2BKpNW6sD5nfnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FM2swtU0izHi2qzjXhbS3mCCdqaH9J8P2TqCwkzJO+0=;
 b=be+Z8Ze8xcuiZg9ZmRk3GCBopZ+QU8FIf4D8Mz27TBUyQiEzW6tv6MIFibPKBoKcPiK6R+yBaeZyiUCBOg7B1ZkidyjLxNjsfUU0fiDWMC5aO5P+ZHrree6pNc854xthvWOyK3u6aRpRbSLAn+0Hf2QiEHoLKCQFuhok0yahEdc=
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com (2603:1096:203:8f::22)
 by HK0PR04MB2882.apcprd04.prod.outlook.com (2603:1096:203:59::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 08:45:20 +0000
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::11f0:d474:d84a:d174]) by HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::11f0:d474:d84a:d174%5]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 08:45:20 +0000
From: =?big5?B?U3BlbmNlciBLdSAopWqlQLfsKQ==?= <Spencer.Ku@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Question of Redfish PCIe
Thread-Topic: Question of Redfish PCIe
Thread-Index: Adcgidz68K1sr7N0QOC6rlZrAvcSAA==
Date: Wed, 24 Mar 2021 08:45:19 +0000
Message-ID: <HK0PR04MB3299350D35DE18CA5AA040CDE4639@HK0PR04MB3299.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb602224-4893-44f8-6951-08d8eea127fd
x-ms-traffictypediagnostic: HK0PR04MB2882:
x-microsoft-antispam-prvs: <HK0PR04MB28826213DC74D06C61DA7831E4639@HK0PR04MB2882.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zKDqWW1mH8rWQyZSs+WXgw6+Yt/bhCWm3wnPwIou4Ha7lzrb6AJvH3LBtNGnhteEEm0VCy3/gkrC1oO99eVfC9xL5wsP2tm0GjoufsJ5U3MolNZ3t06skBmumCWPrI0vjbQu5hvEB5gye9pJCjdMbgKvTryK6oR7WQnJaXWpLfQdd5Buo3Qs9SFlCjIVoEnKQr3g9OW1DzrMujhIGJ63RQ1ojhPIbwTNQPJGfa0cFvVgeDwChn7Y270B3m6wxuuMHhmJ+B+0l4TaBEwXkiLPfmx+HPfIBPiQWntDPVA6m3TWtCLlxXemR/xxjJGRaNxmb6Uz3paN8K459iyXwl3oKEOcaDNrSXVvi2xs7mXEl3owsAHCADCWRHPcj5xi2Gfu80Xh4OrynTvc38FeTx/zkoI8hEQehUWsjksYzDTekWqcFs4wQRZ9Il7EP+cLLfasq4VXtw0FtFI0pI9WittzEkIGBCRbcEnd0/vGsTPFGJ2rYZgieseC5ndI1M+VY7Vvijji0YI+pyxni9BBk5ZkybrZjVPfI/ZSDD0c+msGyq3VjYIF7GheiLcEKJpcgYlaMcwLc518LB9HD/fii16qaS3zDmdeGlRh6B0mIw5Gnn8CV4dWReWe6W1/z2/BA7BqQTKKDFnZSG1cUHeZaVl2Qg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3299.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(9686003)(6506007)(86362001)(2906002)(5660300002)(186003)(52536014)(71200400001)(85182001)(83380400001)(8936002)(66946007)(7696005)(55016002)(76116006)(3480700007)(4744005)(64756008)(6916009)(66446008)(478600001)(8676002)(316002)(38100700001)(66476007)(66556008)(26005)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?ak5CU1hIZ04zdXV6bVNUakZmeGlqVTFuaTlWSUJIOC96dE1ZcGRGTUZQN2V1c2pL?=
 =?big5?B?MGhGY2wwWTk1Y1FyMUxkYmFEQ00yVkxhTFRQYloycnZSUGNZVnJqK2ExNDZyNDVI?=
 =?big5?B?cUFtTFVNTzZ5MXZaZ0d0Z3BSblU0OWx6UGkxTFkzTCtFREFMWlNCK2R1UldUWDl3?=
 =?big5?B?MnRJSjV0a1FDK1hIbHlsNEV4TW5jZm5WdDRyeDZRWk5JZXcyQ016RStRa3JwWmY3?=
 =?big5?B?ZFhLR3NQWlN4VjFzVjdEOWZlemlIR1VmSlp1L2xlQzJEOGkxRE9UOXR4amNsa0Qv?=
 =?big5?B?VW9TSFNkNHBycUNsWUlNbVRSSTd2OGwxcEhjQ01HN1p2cmdJV0JGY3JPYlNDcVV2?=
 =?big5?B?UVQ0V3JUdHRGR2RvVlp4ejR3UkN6akwxajhlK2xnR2wyUDkyNlRFME8rOEQ5Q1Z0?=
 =?big5?B?a3V2RVZPZXh5RnVsUTNOMS9jYXliTTY5U2VzTmhUZ1hERmZ5UDk3R2RVdVBHMlVG?=
 =?big5?B?dkg0QVNYOHdnVkdwMXhLTmdkcTM1MmIvVTNnRkQ2bElrZ010b3ppelhINGJKS1hX?=
 =?big5?B?WWZZcGZ2cGdnSXdJckF5cElZTWdLQTF1WmpCMVVxRHgrRmFITHc5WDhvTU9WLzA3?=
 =?big5?B?dlNXWXRXOEdxczBXWThIT3oyNjAwN2laYUtZazZYSnJhTzhMY3FEWlp4SUZVd0cz?=
 =?big5?B?T1JqbXRENkF0ZWszOFJjUlRFejU3NzI0eVNVZ250V3JhN1Q2U2taU21RTUtXY29w?=
 =?big5?B?Nkw2N0ZpRUJMREMwRm1qTDlwQXpvUWRUMWlEeHF6T3p0SnRaU295THRvQXBtNll2?=
 =?big5?B?czBSTloxaXdGcVRMdksvdEpLcUoyWlhWQm4xRW9ENWRkTVd0UTY2Z3M4Q0NmbEZL?=
 =?big5?B?QkdtNE96Y3NyaDgyRFNNNHd2Q1pNSGYzd2tmRCs5MFFqRGlXd3hXV3gwaXFaa3ox?=
 =?big5?B?WXQwMVZndmI4cTJMWE9OaE5SZU95NzhWUGl4SFFibmdvTG01aVZaTEhRaWwxYlVn?=
 =?big5?B?bmhmeTdBdk14NGdPV3ppQU4rM2JpL1lnUlBsVjJqQ3NJUkJ0a3ZTdFJlN1hUK0Fk?=
 =?big5?B?bzhsMTFwOHFRWHB2QndpS3BKbUFFb09ZME9ZbURtYXpIK1VDZC9lUDVBWHhiYTlW?=
 =?big5?B?cExCR0lXekdvR2FUNmsxMW5MYzJldzJYRFc0L0o0VktLNFRXTW1xUnNhY2dSMCth?=
 =?big5?B?R3ArUGYrUGFBNSt6NUc2SnBneWsweUt5K05Id0NvcjkyaDczbU94NnNjc2ZHWFJz?=
 =?big5?B?d1ZQb1d0eXAzZDIrTy8rVE9LTGkyb2F4WkhQYnlMaklNcU9TWjBFTnk5NkpvVlF1?=
 =?big5?B?Z2tHaTB2dGRTb1pHUENzeG95aUVQUlpMek50YmhEcXUzNUxZT2JxZElDdWxMcGJu?=
 =?big5?B?T21UWUJhb2oyQWJJRlo4K0NONzJCRDNXQ080cnE2NUIzNGI0NmYxKzFteDMzR2ht?=
 =?big5?B?V0hsVTgwR1U1SFBPbG9DS09SdkpUVXhHdndKaEZDK0dVQk9hRE04TmN2QzFjdnc2?=
 =?big5?B?cVRucmF2QzJsMytzNnJYbVM4ZjF1bU8vUkJ3L2VvbEM2ZmpFWmloVG53VmVjUVVB?=
 =?big5?B?a2hnY0Fudkt5dHlFUUkzbmVlSWlzeWlmY09VaGpKSEZaWUJyeml3MC96M1NWWTNL?=
 =?big5?B?SzlrRkpRUS83UU1zUmNQRWRFVHNTb2ZpU1lObGdrRHppT003MGpENjNwaWREOVZQ?=
 =?big5?Q?QPJD62c6GpxOFh0U/NGBbSJp7cp1hGvc8TZKyA5s9C57DMfI?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB3299350D35DE18CA5AA040CDE4639HK0PR04MB3299apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3299.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb602224-4893-44f8-6951-08d8eea127fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 08:45:19.9260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9hfQVRdLGzm2KGnLPMpCL/IO4krxQklGwqZ9KPIVOciUKq3lzfVY70D0N0Wb5q4YSvN4f35WD8PSd0ju947Prg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2882
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

--_000_HK0PR04MB3299350D35DE18CA5AA040CDE4639HK0PR04MB3299apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KV2UgYXJlIGludGVyZXN0ZWQgaW4gaG93IHRvIGdldCBQQ0llIHJlbGF0aXZlIGlu
Zm8gdmlhIHJlZGZpc2gsIGxpa2UgUENJZURldmljZSwgUENJZVNsb3QgYW5kIHNvIG9uLg0KDQpJ
biBteSBvcGluaW9uLCBwYWNrYWdlIKGncGVjaS1wY2lloaggaXMgdXNlZCB0byBjb2xsZWN0IHRo
ZSBQQ0llIGluZm8gYW5kIGZpbGxlZCB0aGVtIGludG8gdGhlIFBDSWUgRC1idXMsIGFmdGVyIHRo
YXQgdGhlIGJtY3dlYiBjYW4gZ2V0IHJlbGF0aXZlIGluZm8gdGhyb3VnaCB0aGUgRC1idXMuDQpU
aGVuIEkgbG9vayBpbnRvIHRoZSBnZXJyaXShpnMgYWN0aXZlIHBhdGNoZXMgYW5kIGZpbmQgdGhh
dCB0aGUgRC1idXMgaW50ZXJmYWNlIGlzIGNoYW5nZWQsIGFuZCBoZXJlIGFyZSBzb21lIGV4YW1w
bGU6DQoNCk9yaWdpbmFsIGludGVyZmFjZSBpbXBsZW1lbnQgYnkgcGVjaS1wY2llOg0KeHl6Lm9w
ZW5ibWNfcHJvamVjdC5QQ0llLkRldmljZQ0KDQpDdXJyZW50IGludGVyZmFjZSB1c2VkIGluIHRo
ZSBwYXRjaGVzOg0KeHl6Lm9wZW5ibWNfcHJvamVjdC5JbnZlbnRvcnkuSXRlbS5QQ0llRGV2aWNl
DQp4eXoub3BlbmJtY19wcm9qZWN0LkludmVudG9yeS5JdGVtLlBDSWVTbG90DQoNCkRvZXMgaXQg
bWVhbnMgdGhhdCBwZWNpLXBjaWUgd2lsbCBiZSB1cGRhdGVkIHRvIGNvdmVyIHRoZSBELWJ1cyBj
aGFuZ2VzIG9yIEkgbmVlZCB0byBhZGQgdGhlIEQtYnVzIGJ5IG15c2VsZiB1bmRlciB0aGUgeHl6
Lm9wZW5ibWNfcHJvamVjdC5JbnZlbnRvcnkuSXRlbT8NCkp1c3Qgd2FudCB0byBrbm93IHRoZSBj
dXJyZW50IHN0YXR1cyBvZiByZWRmaXNoIFBDSWUsIHRoYW5rcyENCg0KU2luY2VyZWx5LA0KU3Bl
bmNlciBLdQ0K

--_000_HK0PR04MB3299350D35DE18CA5AA040CDE4639HK0PR04MB3299apcp_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">We are interested in how to get=
 PCIe relative info via redfish, like PCIeDevice, PCIeSlot and so on.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In my opinion, package =A1=A7pe=
ci-pcie=A1=A8 is used to collect the PCIe info and filled them into the PCI=
e D-bus, after that the bmcweb can get relative info through the D-bus.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Then I look into the gerrit=A1=
=A6s active patches and find that the D-bus interface is changed, and here =
are some example:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Original interface implement by=
 peci-pcie:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xyz.openbmc_project.PCIe.Device=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Current interface used in the p=
atches:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xyz.openbmc_project.Inventory.I=
tem.PCIeDevice<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xyz.openbmc_project.Inventory.I=
tem.PCIeSlot<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Does it means that peci-pcie wi=
ll be updated to cover the D-bus changes or I need to add the D-bus by myse=
lf under the xyz.openbmc_project.Inventory.Item?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Just want to know the current s=
tatus of redfish PCIe, thanks!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Sincerely,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Spencer Ku<o:p></o:p></span></p=
>
</div>
</body>
</html>

--_000_HK0PR04MB3299350D35DE18CA5AA040CDE4639HK0PR04MB3299apcp_--
