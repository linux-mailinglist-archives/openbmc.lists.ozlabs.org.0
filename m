Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2FB33CFF5
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 09:35:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F067F6cGZz30FH
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 19:35:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=wm9CfvoZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=702356c8b=bruce_lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=wm9CfvoZ; 
 dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Tue, 16 Mar 2021 19:35:20 AEDT
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F066w42zQz2xfV
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 19:35:19 +1100 (AEDT)
IronPort-SDR: 9rwzi+7EFrO2EAHCqQeSP3tuImcFmp2XPipGTqNTaEQRcGQc8aMEn0rsNo7jr+HJpMlmrxxFA5
 JLJbPegSBRgA==
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx02.quantatw.com with ESMTP; 16 Mar 2021 16:34:12 +0800
Received: from mailbx06.quanta.corp (10.243.91.101) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 16 Mar
 2021 16:34:12 +0800
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (10.243.91.252)
 by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Tue, 16 Mar 2021 16:34:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AS3cEoblPBEmnFyxWs+w8LLvA4PHqgnle3UTtBHB3KOqbEfUXQU5M/aXIb2MOYKaoO9EMBLUv5PhU3DLeVWPuj6KRqRpgwp96QNm5dbMSNErk9AAMenzQoFJQ5oWUw0ISU1BgrqYdZ6RGxmUXdefbwokCNmUigk+aa6R+deW37gq/2726wewruNPzIloCGXXvFV4fNIN0JE4/tCrI0JdAMxEqHQgxKMWCLbMOLi2+P2zGniUvSgzLg4qyAVSyQPnSVfE8u0MQVGUKxGi6oTMVTTlCoQLGxf2OqnIXScIoCmSQB6D/NU9Sm8ynzLcCxXfvZfpP5CNswk6X4uuA3zrWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQE3yySeQm2LAceyHYlZj0g45hsEe3s+0/6LKujAAcw=;
 b=ZbEUYEelQi1WKaNAUKS3zaA6eiOMp+HXJf/RuzJGVOzb+Tadb8TyKz2ZgewNBPpp4+mzbwhWerejG6TL46AeZrc1gROSDUpF6//ynNfIp2qQghToPCPna+JJyYxITpCA7GwLu0vAkX+ceOvciI6Y/ZVk+jiYwZzpaq9FDpHfNKN//zFrb10qL6Q/WbTX6FvVjSGm/gIyVcOjLsTo/z1LlhU+6ibkHid53JbBNJpMuvwf8bzmpbbUmmI/YkgXBFQ8Pm6XBM5Ns26Xcu2hSbpC12t+2tMxJWUzNvG6QK+Qi54dddyqrdxwhOc2kvucVrPTKwpppzNEeLT2N/QzuhjWDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQE3yySeQm2LAceyHYlZj0g45hsEe3s+0/6LKujAAcw=;
 b=wm9CfvoZoVkV0Cn49P9d4lU8vikw1oawfCmYiXJsjUS9Wxpi3dRcMXOhFKwim+2J37NYvYuFT2SiMxxbSoV3U3DMsOWOxUmjeWoSN+3CxhYif2ywCay4OL08ciMRhvGZ9ikUs5b/0wPJ6i/T6XBExuZEZ7jT+ZO1H52YyLY4HUs=
Received: from PSAPR04MB4231.apcprd04.prod.outlook.com (2603:1096:301:30::14)
 by PS2PR04MB2599.apcprd04.prod.outlook.com (2603:1096:300:48::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 08:34:10 +0000
Received: from PSAPR04MB4231.apcprd04.prod.outlook.com
 ([fe80::14f2:e35d:83dd:b1d]) by PSAPR04MB4231.apcprd04.prod.outlook.com
 ([fe80::14f2:e35d:83dd:b1d%3]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 08:34:10 +0000
From: =?big5?B?QnJ1Y2UgTGVlICin9an7rm0p?= <Bruce_Lee@quantatw.com>
To: Ed Tanous <edtanous@google.com>
Subject: RE: Fan PWM settings via Redfish
Thread-Topic: Fan PWM settings via Redfish
Thread-Index: AdcXBohhddGEWoHGTx2Ra27x5j+YSgAYD04AALXt7cA=
Date: Tue, 16 Mar 2021 08:34:10 +0000
Message-ID: <PSAPR04MB4231E4881A4172E98862161BF86B9@PSAPR04MB4231.apcprd04.prod.outlook.com>
References: <PSAPR04MB423111B8AD11A19255C79215F86F9@PSAPR04MB4231.apcprd04.prod.outlook.com>
 <CAH2-KxAf2H2KXcFM2FkmaOdaxLdcSPWWnwe4uapt3DZzT9=3tA@mail.gmail.com>
In-Reply-To: <CAH2-KxAf2H2KXcFM2FkmaOdaxLdcSPWWnwe4uapt3DZzT9=3tA@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad545d0e-74ce-4601-c11c-08d8e856459e
x-ms-traffictypediagnostic: PS2PR04MB2599:
x-microsoft-antispam-prvs: <PS2PR04MB259972701DE18AE55F88CF9DF86B9@PS2PR04MB2599.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lYyknOuOBuIRpuMg3FWog6DMCDJ5lFRK7yVKW3cyGiOaX46HAA+yOo0wlNfSLf44G2QEALyA/rog+NWtNEZT6vu137CgYB3gPo+S+mxFZs4k5YgDdS2mpFACnaIrKULzedkmd8UZ8dqOcNhtj6Xp6Jl00F3c9I4Al9X/hqycqul7VGsvQUKeimMVfLp2GsT6K7aVDhyCNJTtkpFDnXS3busARAZ/kGuU4CDSfsl4I+5fNjd5WjSpB7GjBsuE0Q+qz43QgiVfHEKqumcM/3AW6Cigi7tdw+fEuD5Zor6Xd68OlaDEi5JjWSkkFgcTLxs/XJxVyeDehlbX28zxWATf8wNmL3UrBdi3nbVIRpdvqOn7j5kMktpXkfboIvsfLFTq3bcXQ4jaDdS+bCQBC49zwmpyrX476Ch49gCEb0lMs8MxW4A8qAulKwdet9h3bUfNlzi14NU6n16AS+aRDjQRWmnwmj/Ee3tnThVzbBll+uCB2w2nf6d9rqlRH8Qc2XlbOUNnx3+jIlyVWmafsDTuT4YiG9+Z3H0aD0LeEvRacJWNl9Klx2nG+1W4VVTD5Az2A6glcCu4Fe8jgByAVsKc49KlKUEhynNp9gkyEDv0VW25NTTSFpzaJ4PJrsGbwD1bIahSkUoCn5HMVik1EsNekg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR04MB4231.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(83380400001)(66446008)(166002)(8936002)(966005)(5660300002)(85182001)(186003)(6506007)(55016002)(6916009)(53546011)(66556008)(9686003)(45080400002)(76116006)(8676002)(66946007)(71200400001)(86362001)(7696005)(52536014)(316002)(33656002)(478600001)(66476007)(64756008)(54906003)(2906002)(26005)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?ejhNNHNrOGxEc29CYy92NHlOY1N0VUNEOXA1bWVDNXdhNVRiSjVFaHNsYm5Jbmov?=
 =?big5?B?dFB4M2FXR0k1c3NGek1RQk9ka0lReTNRdVJFOGF0VG51czFPVXlpbWFtaVdSckVT?=
 =?big5?B?U2lYTngyKzh5TjlPSWJ3Z0N0QW5FRjRNNis2ZUkzSHNhWS85cGhOTnVYUDVJV0Jk?=
 =?big5?B?M0xiYjA0SGJzNVpUa3dERGgyb0FmU1QxdlFEN1UzNDdwOTB6dG9ZaEU5YWFTYnR5?=
 =?big5?B?c3g1ZVZZS010ODNrcnBhSmxETDdNeHNCTGZteWxNTk1ldkg5clJjWVEraWJ6bXdE?=
 =?big5?B?Z2FWWmdIdk1CaFpUWmR2MUE5aFMwRU94M1JzZDF2emgxdjdCajNnbmpuS2dqUGNj?=
 =?big5?B?WUxtR2NkRkdjK3FoMDU0WEVnRTNSZGJDV2U2ZzBOT0gycWx2L3lyanRNKzFwa0di?=
 =?big5?B?ckFHOC9oYWFjS0xRUWl3V3ZSdXllSkFyRVlWK3hkZ2NkWlh1WGdxT21uTkQ3Lzh4?=
 =?big5?B?QjlrRW9mRUpUQlBaVlVxOXo2YnpXekwxWTZHYldlKzcwOEtvUi90U0wvRG5WZWIr?=
 =?big5?B?TzZMc0xVYmowd1ZnSG5aei9PUXR4eFRtb24wdForMU9McEhxWWtnaHZEM2VxSlh3?=
 =?big5?B?VUZGSXQ4NFk2cWJMRk1iQzNNMWxQZlV1WlBudStuT0w3cDIrNXRHZmMrSUoxZFZO?=
 =?big5?B?Tm5NWnBtL1lLdjFPekxsU2FvbXVrU1BCUjBiVU5EMGhSdzBQRmhqZW5jOGZnYWFk?=
 =?big5?B?V1kvUitvS2xtVVVJLzFSNm1sc0pHaEtTWVc3bGhvUWYrTzVtRHBwVkZIci9KQzky?=
 =?big5?B?NStQSXA5V25VWDlvS1JQaWN5a0NvZStLOXowYWpWUVZhTkp4TjJmVWNkTXBZRlQz?=
 =?big5?B?eE1vQWh0ZzZmMC9pWTB6YS9FdzlaU1IvNXM3VjViODJDb0hEbGdJOSt4Nnk5d1VF?=
 =?big5?B?TmZMeDcrMDMxdDVkY2orWU8rMmpKSlpmeUx4dW5qMFZ4L2t1MERQaFA2NDF0WTRm?=
 =?big5?B?bGVycXdMUjQyYis1cHY1UUEvYXFVTXB6MUQzRndGQ3JOTGpOUytUaVg1ajFjazZC?=
 =?big5?B?YWZnUCtSUjlMckhzOEhOT0pSWkZlQlF5ZW16cXF5TXY3MVdwNGtTMlBFRWZkbGZE?=
 =?big5?B?bnAwTWMwbC9DNSsvcGRzMzMvUkpCTVE3eGNkRVpDTUU3UUpMSG5IUDhRWkZYdFEw?=
 =?big5?B?bHFHSXdRTHFVcnIyZnFxUHBOaXFVdGFXdldWNHpHR2JsbTNYUXoxSjRuL0wxVG42?=
 =?big5?B?NmtXWENWZU8zQlcyVDd6TzJYRXhmbUMwL2lEeDJQcm5OdjQ0U2h0V2hkZm0zSmtG?=
 =?big5?B?ald1cStDVkE2a2U1dGRGL3hLeU45ZTZOQ21KbXA0TSt6OXhHZmVVZlBnU1JOd2Qw?=
 =?big5?B?OGsxMlluYisvd0JXOVRDd1dsSmVVRnZiNlY5RmhhMVpLVDFHYlAzcC9HMk9UbnVZ?=
 =?big5?B?NzY2TmNwNVpxTE9ucTgxbVNXNzFmVFkyS1hwTWVNNE5jMEl1MUFXQjZkUyszOWU1?=
 =?big5?B?R2FZWlVvY2hlSEpndHBYVTM3YVZzTEptbXNWdkJYdEdvaDR1RzNydk5McFZtdkJo?=
 =?big5?B?cytHOTViR2d5S3FDWGc5TWpKZUIrSzF3TitibkpRYkRJSFZXdnVsSHordTZkbkVQ?=
 =?big5?B?SkJ5cEhqTHRjeDBILzRrb00wVGNlQmQ3RkVZWG5NeUVFM05haXZBRHBUcHlFTmFh?=
 =?big5?Q?JBV6jMCZ5yHNVUMYj0TYAkBbUEJ606y05h538VLpS4mfhdDp?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_PSAPR04MB4231E4881A4172E98862161BF86B9PSAPR04MB4231apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR04MB4231.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad545d0e-74ce-4601-c11c-08d8e856459e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2021 08:34:10.4106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: djClzPGAfzgXnZvNyFdNl5teX9OFhbbemj/4/jEfnC8pP5fggz1IL07cw2SHXrDm8c+ljjcdJaoOmZohv04WkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB2599
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
 Nan Zhou <nanzhou@google.com>, "rhanley@google.com" <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_PSAPR04MB4231E4881A4172E98862161BF86B9PSAPR04MB4231apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

Pkkgc3VzcGVjdCB0aGlzIGNoZWNrIGFuZCBvcHRpb24gbmVlZHMgdG8gYmUgbW92ZWQgaW50byB0
aGUgaW5kaXZpZHVhbCBzZW5zb3JzLCBzbyB0aGF0IHdlIGNhbiBkaWZmZXJlbnRpYXRlIGJldHdl
ZW4gInNob3VsZCBiZSBzZXR0YWJsZSBpbiBhIHRlc3QgY29udGV4dCIgYW5kICJzaG91bGQgYmUg
c2V0dGFibGUgaW4gYSBub3JtYWwgY29udGV4dCIuDQoNCjEuIERvZXMgeW91IG1lYW4gZG9uJ3Qg
Y2hhbmdlIHRoZSBJbnRlbCBkZWZpbml0aW9uIGFuZCBrZWVwIHRoZSBvcmlnaW4gY29kZSB3aGVu
IGNvbXBpbGUgdGltZT8NCg0KMi4gV2hhdCBkbyB5b3UgbWVhbiB0aGlzIG9wdGlvbiBuZWVkcyB0
byBiZSBtb3ZlZCBpbnRvIHRoZSBpbmRpdmlkdWFsIHNlbnNvcnMgc28gdGhhdCB3ZSBjYW4gZGlm
ZmVyZW50aWF0ZSBiZXR3ZWVuICJzaG91bGQgYmUgc2V0dGFibGUgaW4gYSB0ZXN0IGNvbnRleHQi
IGFuZCAic2hvdWxkIGJlIHNldHRhYmxlIGluIGEgbm9ybWFsIGNvbnRleHQiLg0KDQpQbGVhc2Ug
cHJvdmlkZSBtb3JlIGRldGFpbHMgYWJvdXQgeW91ciB0aGlua2luZy4NCg0KDQoNCj5TZWUgYWJv
dmUuICBJIHN1c3BlY3QgdGhhdCB0aGUgcmVkZmlzaCBjb2RlIGRvZXNuJ3QgbmVlZCB0byBjaGVj
ayB0aGUgbXV0YWJpbGl0eSBvZiB0aGUgc2Vuc29yLCB0aGUgaW50ZXJmYWNlIHNob3VsZCBqdXN0
IGhhdmUgdGhlIGNvcnJlY3QgYmVoYXZpb3IuICBUaGUgb25seSBwbGFjZSBJIHdvdWxkIGV4cGVj
dCB0byBuZWVkIHRvIGtub3cgdGhlID5tdXRhYmlsaXR5IG9mIGEgc2Vuc29yIGlzIGluIHRoZSBJ
UE1JIHNkciwgd2hlcmUgd2Ugd2lsbCBuZWVkIHRvIHNldCB0aGUgbW9kaWZpYWJsZSBiaXQgYXBw
cm9wcmlhdGVseS4NCg0KRm9yIG5vdywgdGhlIGZ1bmN0aW9uIHRvIHNldCBzZW5zb3IgaW4gcmVk
ZmlzaCBjb2RlIGlzIHRvIHNldCB0aGUgZC1idXMgdmFsdWUgZGlyZWN0bHkgKGludGVybmFsbHkg
d3JpdGFibGUpLCAgaWYgd2UgZG9uJ3QgY2hlY2sgdGhlIEVNIG11dGFiaWxpdHkgaW4gUmVkZmlz
aCwgZm9sbG93IHRoZSBBZGQgTXV0YWJsZSBwcm9wZXJ0eSB0byBTZW5zb3IgVmFsdWUgaW50ZXJm
YWNlLCB3ZSBzdGlsbCBuZWVkIHRvIGNoZWNrIHRoZSBzZW5zb3IgbXV0YWJsZSBwcm9wZXJ0eSB0
byBrbm93IHdoZXRoZXIgb3Igbm90IHRvIHdyaXRlIHRoZSBkLWJ1cyB2YWx1ZSBpbiByZWRmaXNo
IG9yIHdlIG5lZWQgb3RoZXIgZXh0ZXJuYWwgc2VydmljZXMgdG8ga25vdyB3aGV0aGVyIG9yIG5v
dCB0byBncmFudCB3cml0ZSBwZXJtaXNzaW9uIHRvIHRoZWlyIHVzZXJzIGxpa2UgSVBNSSBzZW5z
b3IuDQoNCg0KDQo+RG9lc24ndCB0aGlzIGFscmVhZHkgd29yayB0b2RheT8gIEkgdGhvdWdodCB3
ZSBoYWQgYWxsIHRoYXQgc29ydGVkIGEgbG9uZyB0aW1lIGFnby4gIEZvciBzb21lIHJlYXNvbiBJ
IHRob3VnaHQgd2UgaW50ZW50aW9uYWxseSBkaWRuJ3QgZXhwb3NlIHRoZSBtYW51YWwvYXV0b21h
dGljIHBhcmFtLCBiZWNhdXNlIHRoYXQgb25seSBhcHBsaWVkIHRvID50aGUgUElEIGxvb3BzLCBh
bmQgUFdNIHNlbnNvciBkaWRuJ3QgZXhwb3NlIHRoYXQgaW50ZXJmYWNlLiAgSSBuZWVkIHRvIGdv
IGxvb2sgYXQgdGhlIGNvZGUgYXQgc29tZSBwb2ludC4NCg0KWWVzLCBpcG1pLW9lbSBpcyB3b3Jr
IHRvZGF5LiBJIGFncmVlIGl0IGlzIG5vdCBwcm9wZXJseSB0byBzaG93IG9uIHJlZGZpc2ggdG8g
bGV0IHVzZXJzIGNhbiBlYXNpbHkgY2hhbmdlIHRoZSBmYW4gbW9kZSwgdGhlIHJlYXNvbiB0byBj
aGFuZ2UgZmFuIG1vZGUgdG8gdGhlIG1hbnVhbCBpcyBmb3IgZGVidWdnaW5nLiBNYXliZSBsZXQg
dXNlcnMgdXNlIGlwbWktb2VtIHRvIHJlcGxhY2Ugc2hvdyBvbiBSZWRmaXNoIFVSTHMuDQoNCg0K
DQoNCg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBFZCBUYW5vdXMgPGVk
dGFub3VzQGdvb2dsZS5jb20+DQpTZW50OiBTYXR1cmRheSwgTWFyY2ggMTMsIDIwMjEgMTo0MCBB
TQ0KVG86IEJydWNlIExlZSAop/Wp+65tKSA8QnJ1Y2VfTGVlQHF1YW50YXR3LmNvbT4NCkNjOiBO
YW4gWmhvdSA8bmFuemhvdUBnb29nbGUuY29tPjsgcmhhbmxleUBnb29nbGUuY29tOyBvcGVuYm1j
QGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBGYW4gUFdNIHNldHRpbmdzIHZpYSBSZWRm
aXNoDQoNCg0KDQpPbiBUaHUsIE1hciAxMSwgMjAyMSBhdCAxMDozNyBQTSBCcnVjZSBMZWUgKKf1
qfuubSkgPEJydWNlX0xlZUBxdWFudGF0dy5jb208bWFpbHRvOkJydWNlX0xlZUBxdWFudGF0dy5j
b20+PiB3cm90ZToNCg0KPg0KDQo+IEhpIEFsbCwNCg0KPg0KDQo+DQoNCj4NCg0KPiBXZSBhcmUg
ZGVzaWduaW5nIGFuZCBpbXBsZW1lbnRpbmcgdGhlIEZhbiBQV00gc2V0dGluZ3MgdmlhIFJlZGZp
c2guIFRoZSBnb2FsIGlzIHRoYXQgY2xpZW50cyBjYW4gc2V0IHNlbnNvciB2YWx1ZSB0byBibWMg
dmlhIFJlZGZpc2guDQoNCj4NCg0KPg0KDQo+DQoNCj4gV2UgZGl2aWRlIHRoZSB3b3JrIGludG8g
dGhyZWUgcGhhc2VzLg0KDQo+DQoNCj4NCg0KPg0KDQo+IFBoYXNlIDEgaXMgdG8gcmVtb3ZlIHRo
ZSBkZWZpbml0aW9uIKGnQk1DV0VCX0lOU0VDVVJFX1VOUkVTVFJJQ1RFRF9TRU5TT1JfT1ZFUlJJ
REWhqCBhbmQgdXNlIG5ldyBkZWZpbml0aW9uIHRvIKGnQk1DV0VCX1NQRUNJQUxfTU9ERV9TRU5T
T1JfT1ZFUlJJREWhqC4NCg0KPg0KDQo+IFRoZSChp0JNQ1dFQl9JTlNFQ1VSRV9VTlJFU1RSSUNU
RURfU0VOU09SX09WRVJSSURFoaggd2FzIGFkZGVkIGJ5IEludGVsDQoNCj4gZ3JvdXAsIHBsZWFz
ZSByZWZlciB0bw0KDQo+IGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9v
ay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdlcnINCg0KPiBpdC5vcGVuYm1jLXByb2plY3QueHl6
JTJGYyUyRm9wZW5ibWMlMkZibWN3ZWIlMkYlMkIlMkYzMDAwMCZhbXA7ZGF0YT0wDQoNCj4gNCU3
QzAxJTdDQnJ1Y2VfTGVlJTQwcXVhbnRhdHcuY29tJTdDNjRhMTE1M2NkNDViNDZlZWNhNDAwOGQ4
ZTU3ZGYzNWMlNw0KDQo+IEMxNzliMDMyNzA3ZmM0OTczYWM3MzhkZTczMTM1NjFiMiU3QzElN0Mw
JTdDNjM3NTExNjc2NDA0MjI3MTEzJTdDVW5rbm8NCg0KPiB3biU3Q1RXRnBiR1pzYjNkOGV5SldJ
am9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMDQoNCj4gQ0pY
VkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPWY2MDRQaXoxdkRmSXREWjNkb2NaT1BmcnlKZXNh
dmtiT3doS3l3Sg0KDQo+IG9YbFUlM0QmYW1wO3Jlc2VydmVkPTAsDQoNCj4NCg0KPiBUaGUgSW50
ZWwgc29sdXRpb24gaGFzIDQgY29uZGl0aW9ucyBuZWVkcyB0byBtYXRjaCBvbmUgb2YgdGhlbSBh
bmQgdGhhdCBjYW4gYmUgd29yayB0byBvdmVycmlkZSBzZW5zb3IgYnV0IGFjdHVhbGx5IG5vdCBh
bGwgcHJvamVjdCBuZWVkcyB0aG9zZSBjb25kaXRpb25zLCBzbyB3ZSB3YW50IHRvIHByb3Bvc2Ug
dG8gcmVtb3ZlIHRoZSBpbnNlY3VyZSBkZWZpbml0aW9uIGFuZCB1c2UgbmV3IGRlZmluaXRpb24g
dG8gaW5jbHVkZSB0aGUgaW50ZWwgc29sdXRpb24gYW5kIGV4ZWN1dGUgd2hlbiBjb21waWxlLiBJ
dCB3b3VsZCBiZSBubyBjb21waWxlIHRpbWUgd2l0aCBvcHRpb24gZm9yIGNvbW1vbiBwcm9qZWN0
LiBBbmQgdGhlIGluc2VjdXJlIGlzc3VlIHdlIHdpbGwgZGlzY3VzcyBpbiBwaGFzZSAyLg0KDQo+
DQoNCj4NCg0KPg0KDQo+IEV4YW1wbGUgYmVsb3c6DQoNCj4NCg0KPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoN
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQo+DQoNCj4gW0JlZm9yZSBtb2Rp
ZmllZF0NCg0KPg0KDQo+ICNpZmRlZiBCTUNXRUJfSU5TRUNVUkVfVU5SRVNUUklDVEVEX1NFTlNP
Ul9PVkVSUklERQ0KDQo+DQoNCj4gLy8gUHJvY2VlZCB3aXRoIHNlbnNvciBvdmVycmlkZQ0KDQo+
DQoNCj4gc2V0U2Vuc29yc092ZXJyaWRlKHNlbnNvckFzeW5jUmVzcCwgYWxsQ29sbGVjdGlvbnMp
Ow0KDQo+DQoNCj4gcmV0dXJuOw0KDQo+DQoNCj4gI2VuZGlmDQoNCj4NCg0KPiBkb0ludGVsU3Bl
Y2lhbE1vZGVNYW5hZ2VyIGNvZGUgoUsNCg0KPg0KDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCj4NCg0KPiBbQWZ0ZXIgbW9kaWZpZWRdDQoN
Cj4NCg0KPiAjaWZkZWYgQk1DV0VCX1NQRUNJQUxfTU9ERV9TRU5TT1JfT1ZFUlJJREUNCg0KPg0K
DQo+ICAgICAgIGRvSW50ZWxTcGVjaWFsTW9kZU1hbmFnZXIgY29kZSChSw0KDQo+DQoNCj4gICAg
ICAgcmV0dXJuOw0KDQo+DQoNCj4gI2VuZGlmDQoNCj4NCg0KPiAvL1Byb2NlZWQgd2l0aCBzZW5z
b3Igb3ZlcnJpZGUNCg0KPg0KDQo+IHNldFNlbnNvcnNPdmVycmlkZShzZW5zb3JBc3luY1Jlc3As
IGFsbENvbGxlY3Rpb25zKTsNCg0KPg0KDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCj4NCg0KPg0KDQo+DQoNCj4NCg0KDQoNCkkgc3VzcGVj
dCB0aGlzIGNoZWNrIGFuZCBvcHRpb24gbmVlZHMgdG8gYmUgbW92ZWQgaW50byB0aGUgaW5kaXZp
ZHVhbCBzZW5zb3JzLCBzbyB0aGF0IHdlIGNhbiBkaWZmZXJlbnRpYXRlIGJldHdlZW4gInNob3Vs
ZCBiZSBzZXR0YWJsZSBpbiBhIHRlc3QgY29udGV4dCIgYW5kICJzaG91bGQgYmUgc2V0dGFibGUg
aW4gYSBub3JtYWwgY29udGV4dCIuDQoNCg0KDQo+DQoNCj4gUGhhc2UgMiBpcyB0byBhZGQgYSBj
b25kaXRpb24gdG8gY2hlY2sgdGhlIHNlbnNvciBuYW1loaZzIE11dGFibGUgdmFsdWUgb2YgRU0g
aWYgdGhlIHZhbHVlIGlzIHRydWUgZG8gdGhlIHNlbnNvciBvdmVycmlkZSBmdW5jdGlvbiBlbHNl
IG5vdCBkby4NCg0KDQoNCkkgc3VzcGVjdCB0aGlzIHBhdGNoc2V0IG5lZWRzIHRvIGJlIG1vdmVk
IGZvcndhcmQgaWYgeW91J3JlIGhvcGluZyB0byB1c2UgdGhlIG11dGFibGUgcGFyYW06DQoNCmh0
dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUz
QSUyRiUyRmdlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6JTJGYyUyRm9wZW5ibWMlMkZwaG9zcGhv
ci1kYnVzLWludGVyZmFjZXMlMkYlMkIlMkYzNjMzMyZhbXA7ZGF0YT0wNCU3QzAxJTdDQnJ1Y2Vf
TGVlJTQwcXVhbnRhdHcuY29tJTdDNjRhMTE1M2NkNDViNDZlZWNhNDAwOGQ4ZTU3ZGYzNWMlN0Mx
NzliMDMyNzA3ZmM0OTczYWM3MzhkZTczMTM1NjFiMiU3QzElN0MwJTdDNjM3NTExNjc2NDA0MjI3
MTEzJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lW
Mmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPXRk
RXh4QiUyQlk3TzFjS2IlMkZZTWR2UEdudzdZVGhXN0o1NWp5dERQaDRZV1lvJTNEJmFtcDtyZXNl
cnZlZD0wDQoNCg0KDQo+DQoNCj4gVGhlIE11dGFibGUgdmFsdWUgY2FuIGJlIHNldCBpbiB0aGUg
c2Vuc29yIGNvbmZpZ3VyYXRpb24gb2YgRW50aXR5LU1hbmFnZSwgd2hlbiB1c2luZyB0aGUgcGF0
Y2ggY29tbWFuZCB0byBvdmVycmlkZSB0aGUgc2Vuc29yLCBpdCBuZWVkcyB0byBjaGVjayB0aGUg
RW50aXR5TWFuYWdlciBzdWJ0cmVloaZzIHNlbnNvciBuYW1lIGFuZCBpdHMgaW50ZXJmYWNlIKGn
eHl6Lm9wZW5ibWNfcHJvamVjdC5Db25maWd1cmF0aW9uLkkyQ0Zhbi5Db25uZWN0b3KhqCB0byBj
aGVjayB0aGUgY29ycmVzcG9uZGluZyBwcm9wZXJ0eSBuYW1loaZzIG11dGFibGUgdmFsdWUgdG8g
ZGVjaWRlIHdoZXRoZXIgZXhlY3V0aW5nIHRoZSBvdmVycmlkZSBmdW5jdGlvbi4NCg0KDQoNClNl
ZSBhYm92ZS4gIEkgc3VzcGVjdCB0aGF0IHRoZSByZWRmaXNoIGNvZGUgZG9lc24ndCBuZWVkIHRv
IGNoZWNrIHRoZSBtdXRhYmlsaXR5IG9mIHRoZSBzZW5zb3IsIHRoZSBpbnRlcmZhY2Ugc2hvdWxk
IGp1c3QgaGF2ZSB0aGUgY29ycmVjdCBiZWhhdmlvci4gIFRoZSBvbmx5IHBsYWNlIEkgd291bGQg
ZXhwZWN0IHRvIG5lZWQgdG8ga25vdyB0aGUgbXV0YWJpbGl0eSBvZiBhIHNlbnNvciBpcyBpbiB0
aGUgSVBNSSBzZHIsIHdoZXJlIHdlIHdpbGwgbmVlZCB0byBzZXQgdGhlIG1vZGlmaWFibGUgYml0
IGFwcHJvcHJpYXRlbHkuDQoNCg0KDQo+DQoNCj4gVGhpcyBhY2hpZXZlcyBmZWF0dXJlIHBhcml0
eSB3aXRoIHRoZSBpcG1pOjpzZW5zb3I6Ok11dGFiaWxpdHkNCg0KPiBwYXJhbWV0ZXIgb2YgdGhl
IG9sZCBoYXJkY29kZWQgWUFNTCBjb25maWd1cmF0aW9uIGZpbGVzDQoNCg0KDQpOb3Qgc3VyZSB3
aGF0IHlvdSdyZSByZWZlcnJpbmcgdG8uICBUaGF0IG1heSBoYXZlIGJlZW4gc29tZXRoaW5nIGRv
bmUgaW4gYSBmb3JrLg0KDQoNCg0KPg0KDQo+DQoNCj4NCg0KPiBFeGVjdXRlIHN0ZXBzOg0KDQo+
DQoNCj4gMS4gICAgICAgUGF0Y2ggY29tbWFuZCB0byBvdmVycmlkZSBzZW5zb3IuDQoNCj4NCg0K
PiAyLiAgICAgICBDaGVjayB0aGUgRU0gb2Ygc2Vuc29yoaZzIE11dGFibGUgdmFsdWUNCg0KPg0K
DQo+IDMuICAgICAgIElmIE11dGFibGUgdmFsdWUgaXMgdHJ1ZSBkbyBzZW5zb3Igb3ZlcnJpZGUg
YWN0aW9uIGVsc2Ugbm90IGRvLg0KDQo+DQoNCj4NCg0KPg0KDQo+DQoNCj4NCg0KPiBQaGFzZSAz
IGlzIHRvIGFkZCBhIG5ldyBnZXQgY29tbWFuZCB0byBnZXQgdGhlIFpvbmVfJGlkoaZzICJNYW51
YWwiIHZhbHVlIGFuZCBwYXRjaCBjb21tYW5kIHRvIGNoYW5nZSB0aGUgZmFuIG1vZGUgZnJvbSBh
dXRvIHRvIG1hbnVhbCBtb2RlICgiTWFudWFsIjp0cnVlKS4NCg0KPg0KDQo+IEJlY2F1c2UgdGhl
IGZhbiBjb250cm9sIGlzIHVzZSBwYWNrYWdlIHBob3NwaG9yLXBpZC1jb250cm9sLCB3aGVuIHdl
IG5lZWQgdG8gc2V0IGZhbiBwd20sIGl0IG5lZWRzIHRvIHNldCB0aGUgZmFuIG1vZGUgZnJvbSBh
dXRvIG1vZGUgdG8gbWFudWFsIG1vZGUsIGZvciBub3csIHRoZSBwaG9zcGhvci1waWQtY29udHJv
bCBoYXMgYWxyZWFkeSBwcm92aWRlZCBpcG1pLW9lbSBjb21tYW5kIHRvIGFjaGlldmUgdGhpcyBm
ZWF0dXJlLCBzbyB3ZSBuZWVkIHRvIGltcGxlbWVudCB0aGlzIGZhbiBtb2RlIGNoYW5nZSB2aWEg
cmVkZmlzaCBjb21tYW5kLg0KDQoNCg0KRG9lc24ndCB0aGlzIGFscmVhZHkgd29yayB0b2RheT8g
IEkgdGhvdWdodCB3ZSBoYWQgYWxsIHRoYXQgc29ydGVkIGEgbG9uZyB0aW1lIGFnby4gIEZvciBz
b21lIHJlYXNvbiBJIHRob3VnaHQgd2UgaW50ZW50aW9uYWxseSBkaWRuJ3QgZXhwb3NlIHRoZSBt
YW51YWwvYXV0b21hdGljIHBhcmFtLCBiZWNhdXNlIHRoYXQgb25seSBhcHBsaWVkIHRvIHRoZSBQ
SUQgbG9vcHMsIGFuZCBQV00gc2Vuc29yIGRpZG4ndCBleHBvc2UgdGhhdCBpbnRlcmZhY2UuICBJ
IG5lZWQgdG8gZ28gbG9vayBhdCB0aGUgY29kZSBhdCBzb21lIHBvaW50Lg0KDQoNCg0KPg0KDQo+
DQoNCj4NCg0KPiBFeGFtcGxlIFVSTHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfE1ldGhv
ZCAgICAgfEV4YW1wbGUgUGF5bG9hZA0KDQo+DQoNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tIHwtLS0tLS0tLS0tLS0tLSB8LS0NCg0KPg0KDQo+IC9yZWRmaXNoL3Yx
L01hbmFnZXJzL2JtYyAgICAgIHxHRVQgICAgICAgICAgIHwiT2VtIjogew0KDQo+DQoNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAg
ICAgICAgICAgICAgICB8ICAgICAgICAgRmFuIjogew0KDQo+DQoNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICJGYW5ab25lcyI6IHsNCg0KPg0KDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJAb2RhdGEuaWQiOiAiL3JlZGZp
c2gvdjEvTWFuYWdlcnMvYm1jIy9PZW0vT3BlbkJtYy9GYW4vRmFuWm9uZXMiLA0KDQo+DQoNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkBvZGF0YS50
eXBlIjogIiNPZW1NYW5hZ2VyLkZhblpvbmVzIiwNCg0KPg0KDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJab25lXzAiOiB7DQoNCj4NCg0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJA
b2RhdGEuaWQiOiAiL3JlZGZpc2gvdjEvTWFuYWdlcnMvYm1jIy9PZW0vT3BlbkJtYy9GYW4vRmFu
Wm9uZXMvWm9uZV8wIiwNCg0KPg0KDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIkBvZGF0YS50eXBlIjogIiNPZW1NYW5hZ2VyLkZh
blpvbmUiLA0KDQo+DQoNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiQ2hhc3NpcyI6IHsNCg0KPg0KDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
QG9kYXRhLmlkIjogIi9yZWRmaXNoL3YxL0NoYXNzaXMvR1NaX0VWVCINCg0KPg0KDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfSwN
Cg0KPg0KDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIkZhaWxTYWZlUGVyY2VudCI6IDEwMC4wLA0KDQo+DQoNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiTWluVGhl
cm1hbE91dHB1dCI6IDAuMCwNCg0KPg0KDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlpvbmVJbmRleCI6IDAuMCwNCg0KPg0KDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIk1hbnVhbCI6ZmFsc2UNCg0KPg0KDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIH0sDQoNCj4NCg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgfSwNCg0KPg0KDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgfCAgICAgICAgIH0sDQoN
Cj4NCg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgfH0NCg0KPg0KDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSB8LS0tLS0tLS0tLS0tLS0gfC0tLS0NCg0KPg0KDQo+IC9yZWRm
aXNoL3YxL01hbmFnZXJzL2JtYyAgICB8IFBBVENIICAgICAgfCJPZW0iOiB7ICJGYW4iOiB7ICJG
YW5ab25lcyI6IHsgIlpvbmVfMCI6IHsgIk1hbnVhbCI6dHJ1ZSB9IH0gfQ0KDQo+DQoNCj4NCg0K
DQoNCkl0IHNob3VsZCBiZSBub3RlZCwgdGhpcyBzY2hlbWEgbmVlZHMgc29tZSBzZXJpb3VzIGNs
ZWFudXAgdG8gbWFrZSBpdCBwcm9wZXIgcmVzb3VyY2VzLCBwYXRocywgYW5kIGNvbGxlY3Rpb25z
LCBhbmQgc2hvdWxkIHZlcnNpb24gdGhlIHNjaGVtYSBmaWxlcyBhcHByb3ByaWF0ZWx5LiAgSWYg
eW91J3JlIHBsYW5uaW5nIG9uIGV4dGVuZGluZyBpdCwgSSB3b3VsZCBleHBlY3QgX3NvbWVfIGVm
Zm9ydCB0byBiZSBwdXQgaW50byBjbGVhbnVwLiAgVGhlcmUncyBzZXZlcmFsIGdpdGh1YiBidWdz
IHRoYXQgaGF2ZSBtb3JlIGRldGFpbHMsIGFuZCBJIHdpbGwgbGVhdmUgaXQgdXAgdG8geW91IHRv
IGRlY2lkZSBob3cgbXVjaCB5b3UnZCBsaWtlIHRvIGRvIGFzIHBhcnQgb2YgdGhpcyB3b3JrLCBi
dXQgcGxlYXNlIHBsYW4gb24gc29tZS4NCg0KDQoNCj4NCg0KPiBJZiBhbnkgdGhvdWdodHMgb24g
dGhpcyB0b3BpYywgZmVlbCBmcmVlIHRvIGdpdmUgeW91ciBjb21tZW50cy4gVGhhbmtzIQ0KDQo+
DQoNCj4NCg0KPg0KDQo+IFNpbmNlcmVseSwNCg0KPg0KDQo+IEJydWNlDQo=

--_000_PSAPR04MB4231E4881A4172E98862161BF86B9PSAPR04MB4231apcp_
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"=AF=C2=A4=E5=A6r =A6r=A4=B8";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
span.a
	{mso-style-name:"=AF=C2=A4=E5=A6r =A6r=A4=B8";
	mso-style-priority:99;
	mso-style-link:=AF=C2=A4=E5=A6r;
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt;I suspect this check and op=
tion needs to be moved into the individual sensors, so that we can differen=
tiate between &quot;should be settable in a test context&quot; and &quot;sh=
ould be settable in a normal context&quot;.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">1. Does you mean don't chang=
e the Intel definition and keep the origin code when compile time? &nbsp;<o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">2. What do you mean this opt=
ion needs to be moved into the individual sensors so that we can differenti=
ate between &quot;should be settable in a test context&quot; and &quot;shou=
ld be settable in a normal context&quot;.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Please provide more details =
about your thinking.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;See above.&nbsp; I suspe=
ct that the redfish code doesn't need to check the mutability of the sensor=
, the interface should just have the correct behavior.&nbsp; The only place=
 I would expect to need to know the &gt;mutability of
 a sensor is in the IPMI sdr, where we will need to set the modifiable bit =
appropriately.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">For now, the function to set=
 sensor in redfish code is to set the d-bus value directly (internally writ=
able),&nbsp; if we don't check the EM mutability in Redfish, follow the Add=
 Mutable property to Sensor Value interface,
 we still need to check the sensor mutable property to know whether or not =
to write the d-bus value in redfish or we need other external services to k=
now whether or not to grant write permission to their users like IPMI senso=
r.&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;Doesn't this already wor=
k today?&nbsp; I thought we had all that sorted a long time ago.&nbsp; For =
some reason I thought we intentionally didn't expose the manual/automatic p=
aram, because that only applied to &gt;the PID loops,
 and PWM sensor didn't expose that interface.&nbsp; I need to go look at th=
e code at some point.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Yes, ipmi-oem is work today.=
 I agree it is not properly to show on redfish to let users can easily chan=
ge the fan mode, the reason to change fan mode to the manual is for debuggi=
ng. Maybe let users use ipmi-oem to
 replace show on Redfish URLs.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-----Original Message-----<b=
r>
From: Ed Tanous &lt;edtanous@google.com&gt; <br>
Sent: Saturday, March 13, 2021 1:40 AM<br>
To: Bruce Lee (</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,serif">=A7=F5=A9=FB=AEm</span><span lang=3D"EN-US">) &lt;Bruce_Le=
e@quantatw.com&gt;<br>
Cc: Nan Zhou &lt;nanzhou@google.com&gt;; rhanley@google.com; openbmc@lists.=
ozlabs.org<br>
Subject: Re: Fan PWM settings via Redfish</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">On Thu, Mar 11, 2021 at 10:3=
7 PM Bruce Lee (</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,serif">=A7=F5=A9=FB=AEm</span><span lang=3D"EN-US">) &lt;<a href=
=3D"mailto:Bruce_Lee@quantatw.com"><span style=3D"color:windowtext;text-dec=
oration:none">Bruce_Lee@quantatw.com</span></a>&gt;
 wrote:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Hi All,<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; We are designing and im=
plementing the Fan PWM settings via Redfish. The goal is that clients can s=
et sensor value to bmc via Redfish.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; We divide the work into=
 three phases.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Phase 1 is to remove th=
e definition </span>
<span lang=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;">=A1=A7</=
span><span lang=3D"EN-US">BMCWEB_INSECURE_UNRESTRICTED_SENSOR_OVERRIDE</spa=
n><span lang=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;">=A1=A8=
</span><span lang=3D"EN-US"> and use new definition to
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;">=
=A1=A7</span><span lang=3D"EN-US">BMCWEB_SPECIAL_MODE_SENSOR_OVERRIDE</span=
><span lang=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;">=A1=A8<=
/span><span lang=3D"EN-US">.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; The </span><span lang=
=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;">=A1=A7</span><span=
 lang=3D"EN-US">BMCWEB_INSECURE_UNRESTRICTED_SENSOR_OVERRIDE</span><span la=
ng=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;">=A1=A8</span><sp=
an lang=3D"EN-US">
 was added by Intel <o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; group, please refer to =
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; <a href=3D"https://apc0=
1.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgerr">
<span style=3D"color:windowtext;text-decoration:none">https://apc01.safelin=
ks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgerr</span></a><o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; it.openbmc-project.xyz%=
2Fc%2Fopenbmc%2Fbmcweb%2F%2B%2F30000&amp;amp;data=3D0<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; 4%7C01%7CBruce_Lee%40qu=
antatw.com%7C64a1153cd45b46eeca4008d8e57df35c%7<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; C179b032707fc4973ac738d=
e7313561b2%7C1%7C0%7C637511676404227113%7CUnkno<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; wn%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; CJXVCI6Mn0%3D%7C1000&am=
p;amp;sdata=3Df604Piz1vDfItDZ3docZOPfryJesavkbOwhKywJ<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; oXlU%3D&amp;amp;reserve=
d=3D0,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; The Intel solution has =
4 conditions needs to match one of them and that can be work to override se=
nsor but actually not all project needs those conditions, so we want to pro=
pose to remove the insecure definition
 and use new definition to include the intel solution and execute when comp=
ile. It would be no compile time with option for common project. And the in=
secure issue we will discuss in phase 2.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Example below:<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; -----------------------=
-----------------------------------------------<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; -----------------------=
--------<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; [Before modified]<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; #ifdef BMCWEB_INSECURE_=
UNRESTRICTED_SENSOR_OVERRIDE<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; // Proceed with sensor =
override<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; setSensorsOverride(sens=
orAsyncResp, allCollections);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; return;<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; #endif<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; doIntelSpecialModeManag=
er code </span>
<span lang=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;">=A1K</sp=
an><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; -----------------------=
-----------------------------------------------<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; -----------------------=
--------<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; [After modified]<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; #ifdef BMCWEB_SPECIAL_M=
ODE_SENSOR_OVERRIDE<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; doIntelSpecialModeManager code
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;">=
=A1K</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; return;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; #endif<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; //Proceed with sensor o=
verride<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; setSensorsOverride(sens=
orAsyncResp, allCollections);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; -----------------------=
-----------------------------------------------<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; -----------------------=
--------<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">I suspect this check and opt=
ion needs to be moved into the individual sensors, so that we can different=
iate between &quot;should be settable in a test context&quot; and &quot;sho=
uld be settable in a normal context&quot;.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Phase 2 is to add a con=
dition to check the sensor name</span><span lang=3D"EN-US" style=3D"font-fa=
mily:&quot;Courier New&quot;">=A1=A6</span><span lang=3D"EN-US">s Mutable v=
alue of EM if the value is true do the sensor override function
 else not do.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">I suspect this patchset need=
s to be moved forward if you're hoping to use the mutable param:<o:p></o:p>=
</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><a href=3D"https://apc01.saf=
elinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgerrit.openbmc-project.x=
yz%2Fc%2Fopenbmc%2Fphosphor-dbus-interfaces%2F%2B%2F36333&amp;amp;data=3D04=
%7C01%7CBruce_Lee%40quantatw.com%7C64a1153cd45b46eeca4008d8e57df35c%7C179b0=
32707fc4973ac738de7313561b2%7C1%7C0%7C637511676404227113%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
1000&amp;amp;sdata=3DtdExxB%2BY7O1cKb%2FYMdvPGnw7YThW7J55jytDPh4YWYo%3D&amp=
;amp;reserved=3D0"><span style=3D"color:windowtext;text-decoration:none">ht=
tps://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgerrit.op=
enbmc-project.xyz%2Fc%2Fopenbmc%2Fphosphor-dbus-interfaces%2F%2B%2F36333&am=
p;amp;data=3D04%7C01%7CBruce_Lee%40quantatw.com%7C64a1153cd45b46eeca4008d8e=
57df35c%7C179b032707fc4973ac738de7313561b2%7C1%7C0%7C637511676404227113%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DtdExxB%2BY7O1cKb%2FYMdvPGnw7YThW7J55jyt=
DPh4YWYo%3D&amp;amp;reserved=3D0</span></a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; The Mutable value can b=
e set in the sensor configuration of Entity-Manage, when using the patch co=
mmand to override the sensor, it needs to check the EntityManager subtree</=
span><span lang=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;">=A1=
=A6</span><span lang=3D"EN-US">s
 sensor name and its interface </span><span lang=3D"EN-US" style=3D"font-fa=
mily:&quot;Courier New&quot;">=A1=A7</span><span lang=3D"EN-US">xyz.openbmc=
_project.Configuration.I2CFan.Connector</span><span lang=3D"EN-US" style=3D=
"font-family:&quot;Courier New&quot;">=A1=A8</span><span lang=3D"EN-US"> to
 check the corresponding property name</span><span lang=3D"EN-US" style=3D"=
font-family:&quot;Courier New&quot;">=A1=A6</span><span lang=3D"EN-US">s mu=
table value to decide whether executing the override function.<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">See above.&nbsp; I suspect t=
hat the redfish code doesn't need to check the mutability of the sensor, th=
e interface should just have the correct behavior.&nbsp; The only place I w=
ould expect to need to know the mutability of
 a sensor is in the IPMI sdr, where we will need to set the modifiable bit =
appropriately.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; This achieves feature p=
arity with the ipmi::sensor::Mutability
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; parameter of the old ha=
rdcoded YAML configuration files<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Not sure what you're referri=
ng to.&nbsp; That may have been something done in a fork.<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Execute steps:<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; 1.&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; Patch command to override sensor.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; 2.&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; Check the EM of sensor</span><span lang=3D"EN-US" style=3D"=
font-family:&quot;Courier New&quot;">=A1=A6</span><span lang=3D"EN-US">s Mu=
table value<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; 3.&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; If Mutable value is true do sensor override action else not=
 do.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Phase 3 is to add a new=
 get command to get the Zone_$id</span><span lang=3D"EN-US" style=3D"font-f=
amily:&quot;Courier New&quot;">=A1=A6</span><span lang=3D"EN-US">s &quot;Ma=
nual&quot; value and patch command to change the fan mode from auto to
 manual mode (&quot;Manual&quot;:true).<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Because the fan control=
 is use package phosphor-pid-control, when we need to set fan pwm, it needs=
 to set the fan mode from auto mode to manual mode, for now, the phosphor-p=
id-control has already provided ipmi-oem
 command to achieve this feature, so we need to implement this fan mode cha=
nge via redfish command.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Doesn't this already work to=
day?&nbsp; I thought we had all that sorted a long time ago.&nbsp; For some=
 reason I thought we intentionally didn't expose the manual/automatic param=
, because that only applied to the PID loops,
 and PWM sensor didn't expose that interface.&nbsp; I need to go look at th=
e code at some point.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Example URLs&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |Method&nbsp;&nbsp;&nbsp;&nbsp; |Example Payload<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; -----------------------=
---------------- |-------------- |--<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; /redfish/v1/Managers/bm=
c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |GET&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&quot;Oem&quot;: {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; Fan&quot;: {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quo=
t;FanZones&quot;: {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;@odata.=
id&quot;: &quot;/redfish/v1/Managers/bmc#/Oem/OpenBmc/Fan/FanZones&quot;,<o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;@odata.=
type&quot;: &quot;#OemManager.FanZones&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Zone_0&=
quot;: {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;@odata.id&quot;:=
 &quot;/redfish/v1/Managers/bmc#/Oem/OpenBmc/Fan/FanZones/Zone_0&quot;,<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;@odata.type&quot=
;: &quot;#OemManager.FanZone&quot;,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Chassis&quot;: {=
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;@odata.id&quot;: &quot;/r=
edfish/v1/Chassis/GSZ_EVT&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;FailSafePercent&=
quot;: 100.0,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MinThermalOutput=
&quot;: 0.0,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ZoneIndex&quot;:=
 0.0,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Manual&quot;:fal=
se<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p>=
</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; },<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |}<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; -----------------------=
---------------- |-------------- |----<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; /redfish/v1/Managers/bm=
c&nbsp;&nbsp;&nbsp; | PATCH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&quot;Oem&quot;:=
 { &quot;Fan&quot;: { &quot;FanZones&quot;: { &quot;Zone_0&quot;: { &quot;M=
anual&quot;:true } } }<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">It should be noted, this sch=
ema needs some serious cleanup to make it proper resources, paths, and coll=
ections, and should version the schema files appropriately.&nbsp; If you're=
 planning on extending it, I would expect
 _some_ effort to be put into cleanup.&nbsp; There's several github bugs th=
at have more details, and I will leave it up to you to decide how much you'=
d like to do as part of this work, but please plan on some.<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; If any thoughts on this=
 topic, feel free to give your comments. Thanks!<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Sincerely,<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Bruce<o:p></o:p></span>=
</p>
</div>
</body>
</html>

--_000_PSAPR04MB4231E4881A4172E98862161BF86B9PSAPR04MB4231apcp_--
