Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31734FAD8
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 09:53:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9JTg50Vvz301J
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 18:53:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=LenovoBeijing.onmicrosoft.com header.i=@LenovoBeijing.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-LenovoBeijing-onmicrosoft-com header.b=UuYrQTC3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.250.115;
 helo=mail1.bemta24.messagelabs.com; envelope-from=dukh@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=LenovoBeijing.onmicrosoft.com
 header.i=@LenovoBeijing.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-LenovoBeijing-onmicrosoft-com header.b=UuYrQTC3; 
 dkim-atps=neutral
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9JTN62zKz2yxk
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 18:53:11 +1100 (AEDT)
Received: from [100.112.135.3] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.us-west-2.aws.symcld.net id EC/AE-37771-46A24606;
 Wed, 31 Mar 2021 07:53:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFJsWRWlGSWpSXmKPExsWS8eIht26MVkq
 Cwd3vkhanWl6wODB6nJ+xkDGAMYo1My8pvyKBNePHvdtMBTMkKg5s5GxgnC3WxcjFISQwn0ni
 7ZX1jBDOK0aJrsfL2boYOYGcRiaJ3i5HiMRvRomJ9/+xgTiMAkuZJSbNfssM4RxjkXjeuYUdw
 tnAKNH96zPYMBaB3cwSX/d1sSGsaXkLNfk+o8SPhhQQm01ASWLz0ztgcREBS4klD9rBbGEgu+
 /XBlaIuJ3Ets5v7BC2kcTWBz0sIDaLgKrE2cfLGEFsXoEYib7rb8BsRgExie+n1jCB2MwC4hK
 3nswHsyUEBCSW7DnPDGGLSrx8/I8Von4mo8SKdVBxS4kt2y+wQ9iyEpfmdzNC2L4Sy96+ArI5
 gGwtieZvkhDhbIk9z5ZDtapJnG+8zgZhy0ms6n3IAmHLSDy4sR0cDhIC51klLs/pYoFw7jNLX
 H5yiGUCo94sJLdC2HkSpx51gtm8AoISJ2c+YYGIa0nMa/gNVaMoMaX7ITuErSlxZfIhKFtbYt
 nC18wLGNlXMZolFWWmZ5TkJmbm6BoaGOgaGhrpGhqb6JrqJVbpJumVFuuWpxaX6BrpJZYX6xV
 X5ibnpOjlpZZsYgQmqpSCNtYdjOdff9A7xCjJwaQkyrtrfXKCEF9SfkplRmJxRnxRaU5q8SFG
 GQ4OJQnefM2UBCHBotT01Iq0zBxg0oRJS3DwKInweqgDpXmLCxJzizPTIVKnGO05Jrycu4iZ4
 +OqJUDyO5g8MnfpImYhlrz8vFQpcd5mDaA2AZC2jNI8uKGwJH+JUVZKmJeRgYFBiKcgtSg3sw
 RV/hWjOAejkjCvGMhtPJl5JXC7gSkd6CMR3iuPEkHOKklESEk1MDUJPo5bufHZ+ZVLfG5vYBZ
 NVW4Tn2p80uZoY0SyhtJ/yfM8/q1efunruKfcL+ko/rHsS/7ywiUa8cvPr/3hNN9j9cPUvezf
 Y4Pm7ty99sOijdc4d6k8aNWdk+Z5izWgPVlzxoTLdTw9crYTXdJkIjqm8/KxLp/J+iDo0/GLJ
 mGp6k5fivRZlzrubuLMl0wMfPfeo9x7cT2PbOkaA8lO3R3ChickPu6pYHnzaVrw6oVbutap+O
 rY1f4qV2rtr3o2V2fNatdz/REzo6PZvvJeLhK6Zb2XlY3ramb9bzH19fc2RYS4nGXrWS7e+st
 TxFi8WDp+s4tZpJdj/9L6T47vLd66tU2JT3s25+H7u4/UlViKMxINtZiLihMBatBsnm0EAAA=
X-Env-Sender: dukh@lenovo.com
X-Msg-Ref: server-33.tower-356.messagelabs.com!1617177151!53273!1
X-Originating-IP: [104.232.225.11]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10811 invoked from network); 31 Mar 2021 07:52:46 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.11)
 by server-33.tower-356.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 31 Mar 2021 07:52:46 -0000
Received: from HKGWPEMAIL04.lenovo.com (unknown [10.128.3.72])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 2A1195DD312436DC56C8
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 03:14:24 -0400 (EDT)
Received: from HKGWPEMAIL01.lenovo.com (10.128.3.69) by
 HKGWPEMAIL04.lenovo.com (10.128.3.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 31 Mar 2021 15:14:22 +0800
Received: from HKGWPEXCH01.lenovo.com (10.128.62.30) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2
 via Frontend Transport; Wed, 31 Mar 2021 15:14:22 +0800
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (104.47.108.59)
 by mail.lenovo.com (10.128.62.30) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2; Wed, 31 Mar
 2021 15:14:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xpm0DLBjLzRUlcnLuHiMCXzpA7eeZpZt8PYqjlHDAYjErkEf/336QaFKtbw7QvNo6zh6AvNVE94nBhZ602aEr0I84ALMIFwWe7WgRVw0iCkIy0nnZ+VUWeL4mG7S+Q6VtPet6BcvOHxzEnoDSR8QhZV2/YXFQa1DZM1xr+il5OI8MiPK1nlYfmlu8lBTTUmWNytj3L3ZOiQXIxmWypGHLrDoOFhl9S4cDS0l22lmos2WG9VthoqaylMJ8qeAxjgzOv0mE5pAodyUXzpEmnpW6urthvZtf890D1h5NqPyEUlj0e/UJLJUMIQ6as0ccUrCAhMqnQyJHewC/70ysHv6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1WEUjLN1O0DYUgldzraekoksja8p5rxAfF9u+CdI6E=;
 b=M6s/r61dVgL9Ai9GlLZQ2z+79CzK33gOxIBFD2X4MfWn2fRaUuzEsqdJBQsFvSQw7xMGpcyKaeGgx/ipnoxD0DQCAsbMAGL1XRzo/6Fy/zdzh4VIu1GojsJJe65cJIBpXSwsLwjzhex53lHmV9iKcK5JikuE383KCUA9VGhAHCdNiauGnMftZ1VtMpxFK9yocpCgGt8ZMYWnpngxyVFLSylO8zTgoaCnauOCW/ntJgPw3R3SnVa5+4TrSv6rSON/fI4mG/NceU9CbAfav8pvEZ6C6647lAq79QxQclg166JUd/x3wOTGexlcDP8QjHTRFad+9ZKs0oMu0ihxFlNcdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1WEUjLN1O0DYUgldzraekoksja8p5rxAfF9u+CdI6E=;
 b=UuYrQTC3npWCkivfB3pFTXPMf8rg3wi0ZA0Nk19Ecs4G549JpsIS8aAoAYXUAhh8bwFtD1QetuY7Qdov9Z0FC2njolYVWpkcT9i6IZzpDWECjYkoOtrel9GSbJnZTJGP0T0IOIVjlPZ9Pp3KLx36zOXQo+XxN1dN3K+X17lbjlw=
Received: from SL2PR03MB4139.apcprd03.prod.outlook.com (2603:1096:100:4d::10)
 by SL2PR03MB4074.apcprd03.prod.outlook.com (2603:1096:100:43::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.14; Wed, 31 Mar
 2021 07:14:20 +0000
Received: from SL2PR03MB4139.apcprd03.prod.outlook.com
 ([fe80::1870:e1b7:481c:aa01]) by SL2PR03MB4139.apcprd03.prod.outlook.com
 ([fe80::1870:e1b7:481c:aa01%6]) with mapi id 15.20.3999.025; Wed, 31 Mar 2021
 07:14:20 +0000
From: Duke KH Du <dukh@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Add member into Lenovo designated employees list
Thread-Topic: Add member into Lenovo designated employees list
Thread-Index: AdTuhggDxQgYQdvVTwKpLnXtmXb1JIRu7i+A
Date: Wed, 31 Mar 2021 07:14:20 +0000
Message-ID: <SL2PR03MB41392EC887269BEBAF453E96B67C9@SL2PR03MB4139.apcprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2601:647:5800:400:680e:75be:1ede:b8ad]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 427ede0a-8bb5-4f13-7ad8-08d8f4149acf
x-ms-traffictypediagnostic: SL2PR03MB4074:
x-microsoft-antispam-prvs: <SL2PR03MB4074F2A101B71124C82A2DD7B67C9@SL2PR03MB4074.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sju2E/xS8tJPgD/irqmBv+/5FJeL/JB5943eBIObyPGVDz1K2lRyMvqUHEoE1dGJs5gwW0I2OMhwrJ0QLnCfUnxeE7h1R91a0KkBoj9baXcsbUyRlrPj/CHzXhVcT8HlbLRVSssUtOmY/nPAcMukhemJ/SmoSj27zCjQLnnyoexs0YcOQcEnw4Y7tQyAbxD5ciQxEjQFkiROCXII7ZEIwHKm3foomObRJr7w5HPznamch2/QpMmFfC++9x7cyw/bOUOpvPmdhWP3JSGQAvQBm1S7yFKEDu+WTONmjiXhAmEcQPBgdvPaLmtS3bc1dmb+0daFXhJ5Tb7E3Yf433ksMZAzjwdhf9qcb/m3tNw7yM0cGoldTXSKv+OS3EurdUhjPxtQGbeQDnt30hSYteOgGUUW6j7VDXOIdLfl83I7XPb0okdT+QX/KwzfMp2Pyg4P5PaSMcBM2cC/ne/iuc2y/HtNZywytXnrBTh9KKa4zlcbxLE5pSbz0dg6b7rFFAugYT4tNpm07pBKpCHRWlsQ3iBJ3TAxT+Nb0eUdh21288mDITKfxHbyG/+8hPpvVcd54HLBpFCUpGF9MWOhTfPm6og4bZjq9V0hrtX73xh3jY+Q+7+uaeXwFHXFmBVW30SZkwVJ2UXkr3E3f2OzBP/FO3JJlaopQ5/Nkf3QVem3n2U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR03MB4139.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(66476007)(8676002)(66946007)(66556008)(66446008)(8936002)(64756008)(55016002)(52536014)(5660300002)(9686003)(76116006)(86362001)(6506007)(316002)(71200400001)(558084003)(478600001)(2906002)(6916009)(7696005)(9326002)(33656002)(38100700001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?NEI1RFl2amtwTU5wR094QnJ1QWhBZDc3bzUrbHA3SXc0M2FYc2RXYnFRWXRH?=
 =?gb2312?B?ZnMrZ0dXbXFYSW92aFpLengrZ1lQRWJHTlFBQ1BYNUFiZytkV2hGcUVzeDAw?=
 =?gb2312?B?Y1ljRGZ4T3FpWHQxOEpuOThpSzMxaHhQTVdzY3pHR0t3TzhwQUFSRjEwN2gz?=
 =?gb2312?B?TUF1SXdmUzhtay9FMGxZY3g3SmZQZEdQZlJXWUJFcDFHSmtjQWJaWEFwUkZw?=
 =?gb2312?B?djcxbzZURU5ETVE3NUZZMlNSQXpucGNSVXFvYitEVnZpM3I0ZDF0Y3Y4SWdD?=
 =?gb2312?B?Sk1RSk1HWllxSythYlJlbnorVXhEWDlBRmxwRStZcitrNjVhZ3pqbzVWYW1o?=
 =?gb2312?B?b2RoMnB2elc4WFgzWXBZKzR0YVloVm9lUTUreHVRN2htYTdIakhGSVY1NnRE?=
 =?gb2312?B?N2dCRU9WY2VDZjFiNUIrbjBQeHE5dWdBQkRUcTE2R0NNVU5tcldSSituMCti?=
 =?gb2312?B?Wm9neUUzZjJIVi9DYWFaZzkxYk1qS0pxOE9KYXNobEd3aXRBY3o4M203anlD?=
 =?gb2312?B?Slg2c2FzNWVRL25Ndkt4ZnFiRTAvTm1RTTYzY2JIWWFvRHJBQnIxQitQU0Np?=
 =?gb2312?B?NHZNbnpzNk5nSFRTazdGWXRNVXU5TDAxRmFqRWNodFFLK1JaQVdkY09zcTFV?=
 =?gb2312?B?RWNOR0hiZXdkd3ZxZldCVFREaWcrQitDOW9VR0IwTzRWNHBJY0o4UXhQaXR0?=
 =?gb2312?B?NjUxb2l0Z0N3RU84YnJBOXE3eXFEV2NJanVxaFZGUnlLQ0krUWdCbTdqM2F0?=
 =?gb2312?B?RE43TTAyYm16NzM1anNLSHFaK09xUlpsWm9XUzMwZVM5MktjTkZUR2FzK1BF?=
 =?gb2312?B?MHRJV1QyU0lIcjBjMEI0MG9pdUl1YmpjcFBkbGxHdWZWaE15aUZIcU1SY2Z5?=
 =?gb2312?B?dHZIWTcwMWhDcCtsNlVoL2JxRWxUY01saVM3U2xHSk9JZVpIdklRUHRHL0Ri?=
 =?gb2312?B?cUt1QjNFOVNTMm5TV2ZzRTVGQmtQMmtGcnBXR3o4NmFsbW9sU3dQM1phSTg1?=
 =?gb2312?B?eXVhak1oM0RBbGkzdi94NlZsck9xRnBCbzVHdVBPd0NBWFRxZDhGZDFDZUpF?=
 =?gb2312?B?MFFKeHRTcHBGT3c2bEtOSUJsR2dVZnhLYm9IUnFqNHhPQTc3cklSZlcwUzFO?=
 =?gb2312?B?K3FnTEdZdUhrSEIwdk9ncmpEdXVJRHR3M0JGdm91MFZtbjc5RnJneG15bG05?=
 =?gb2312?B?VTlDVEVlSWZBRHFoS016ak1qc1REN0VsSVJjakd1RUJSanhodEllUkRWRDJS?=
 =?gb2312?B?bEJ0V0NvWlVKeE8zWk12Sm1hMm4wL242YkhwQXJBWktVOEpqZnFOeDdrUlVs?=
 =?gb2312?B?RWlqbW40dEVBUzRYZHVOckVJc3pJcUZJRkFrMGgrMEtYSERZTGpoZWRrYWZH?=
 =?gb2312?B?blU2eklFd0FTaGl4Umk1VjA3UnNnblpjcVdXZVltQ1ZBUmxaQnA0TUZsd1Vq?=
 =?gb2312?B?b09qVUJ6SGlmS1VxdjVWeVZoTmRZVTd5TEdHbCtZa0doa0xMaVVVY21yeDZI?=
 =?gb2312?B?NGdoSTF1K3FETHNFckNleG9JY2ZudFFSSDhwRGdJcFJVR3AyeGV2Q2FPb0hN?=
 =?gb2312?B?TGNYTW9BTWxSUmFKeEJHeTNXc2xjNGIxU0JGL3Zhc0d4RXNnNDZ4RUJMUzgx?=
 =?gb2312?B?MmZ2Qko5Yml1WXNRUXNPdnROTWg2Q0ZkMUNCWXRZTEZCSWtBbkIrVXc0clA5?=
 =?gb2312?B?bFRyTUhOVm1sL0hMRmhxaEVaZFFWZ1BIYWx3UDJkbHNCZy9rTWZOazJ0OW1m?=
 =?gb2312?B?SzhZSUxhajNJd3FtcGtiTkJyUkxBdHN2ajFISlNZdHJWcytUOGNPUlhPWXV0?=
 =?gb2312?B?a0dNaHl2RFRZRERxelErZmVtdHdSQmtZRnZuaUxUN1hxd0VQc0U1ZW4rTitz?=
 =?gb2312?Q?+V64tG3iju2K4?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SL2PR03MB41392EC887269BEBAF453E96B67C9SL2PR03MB4139apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4139.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427ede0a-8bb5-4f13-7ad8-08d8f4149acf
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 07:14:20.6027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FsrgR1xefip68qQAgQV9I4Gp5pnRXuC80tJFBMWOus+a392xByvqtZ9kLEZiujUM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR03MB4074
X-OriginatorOrg: lenovo.com
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

--_000_SL2PR03MB41392EC887269BEBAF453E96B67C9SL2PR03MB4139apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgTWFzdGVyLA0KDQpJIHdvdWxkIGxpa2UgdG8gYWRkIG91ciBuZXcgbWVtYmVyIGluIExlbm92
byBkZXNpZ25hdGVkIGVtcGxveWVlcyBsaXN0IGFzIGJlbG93o78NCkNvdWxkIHlvdSBoZWxwIG9u
IGl0Pw0KVGhhbmtzLg0KDQpyaXR6ZW55YW5nICByeWFuZzE0QGxlbm92by5jb208bWFpbHRvOnJ5
YW5nMTRAbGVub3ZvLmNvbT4NCg==

--_000_SL2PR03MB41392EC887269BEBAF453E96B67C9SL2PR03MB4139apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle20
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Master,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I would like to add our new member in Lenovo designa=
ted employees list as below<span lang=3D"ZH-CN" style=3D"font-family:=B5=C8=
=CF=DF">=A3=BF</span><o:p></o:p></p>
<p class=3D"MsoNormal">Could you help on it?<o:p></o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-TW">ritzenyan=
g &nbsp;<a href=3D"mailto:ryang14@lenovo.com">ryang14@lenovo.com</a></span>=
<o:p></o:p></p>
</div>
</body>
</html>

--_000_SL2PR03MB41392EC887269BEBAF453E96B67C9SL2PR03MB4139apcp_--
