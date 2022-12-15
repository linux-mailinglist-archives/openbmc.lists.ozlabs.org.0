Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8CB64DE59
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 17:16:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXy6N0qNyz3bhG
	for <lists+openbmc@lfdr.de>; Fri, 16 Dec 2022 03:16:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Ae3rrF95;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.103.43; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Ae3rrF95;
	dkim-atps=neutral
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2043.outbound.protection.outlook.com [40.107.103.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXy5q0v1mz3bM7
	for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2022 03:16:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VrJ+wbYtZiJRrdK/U/8NASSN4tV2OwBUZQPNuX6DI6/Qeqeu1ZYpa9iCDMcEXLKqGhMe9K9uyPW4PutPKrhjyHXIzBeiNDgv3IdNq/t90O8p1qtt1C/CLDgb17/aEK3ZQ+RYy8Z/MFP6/zd7P5PgwbSglDWacKtmbYZbAss1wz3Rqfil/2mUKfWiJkqGfISfm7isR+fdsA7Ks2tJsxmVVWgKn/Dp25vD6PuWAGzKO/so5PaxlQeIYbVeMsiQWgOBTwHd6ET09bIJE+qgYD2p1LPfL2I6kx9A9sKukRUg6MSU1YVCMSBMhgpJ1+zVHeyfnLt1bHnTfGTulrBFel0/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QTeMo9xnkVFSJ5fGEDU6kMGHPfioPUjSiHb6gieXTo=;
 b=RPXoBM195TeqNnlXTx7fwpErGj2SBmQrKLV8gNEhFCkVmiaIwX8nxpAH9R4LykmtZcSQUUpNGk/oj3MhNMRBpUEnfwmCktUITbjsAHFRHHvDRw/PJZeSn++DLg9UR5QzAKbamtKrmZY6wVKd7PdbZs8D5c5psEatQcEUcJDMjfTfFYSnjn2HEskPXrPmVApqlybSPHnnibVVsTI7sIAKsZJECcRne/FG5A8URuLBOpDcCabQUw08YS5wXWlu7ZMCwEq97/xAseMfdCF6ddLxqUYNH8ZKCt+p88mCyDaYZaojqJxQ3/uqPIb4tTsAVSXMTdX2/95EEtDRujKwnKzK+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QTeMo9xnkVFSJ5fGEDU6kMGHPfioPUjSiHb6gieXTo=;
 b=Ae3rrF95wxLMvs8CZih91a+LHCNYkKj4MYBBnWX6yh4Ny0M22kPturIyhb5qx2NNGrGYVmrjUuuTO2oqn+pJKbdcOxlZe/OE1mOLX/z21HWIz1Oky43qBXAm/9rm/sOGTKLnkor82JTfF8wayO546i21n56LZOqoi11kdXXQNsc=
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by DBBPR04MB7610.eurprd04.prod.outlook.com (2603:10a6:10:1f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 16:15:55 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::203a:e5da:a4a:7663]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::203a:e5da:a4a:7663%12]) with mapi id 15.20.5924.012; Thu, 15 Dec 2022
 16:15:55 +0000
From: Frank Li <frank.li@nxp.com>
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: RE: [EXT] Re: [PATCH] USB: gadget: Add ID numbers to configfs-gadget
 driver names
Thread-Topic: [EXT] Re: [PATCH] USB: gadget: Add ID numbers to configfs-gadget
 driver names
Thread-Index: AQHZD3LJSHwlmMbNUUCrwfAuH4QtB65sxxGAgAHjhgCAAGtCoA==
Date: Thu, 15 Dec 2022 16:15:55 +0000
Message-ID:  <HE1PR0401MB2331E31670508F5BD4B00E1688E19@HE1PR0401MB2331.eurprd04.prod.outlook.com>
References: <20221213041203.21080-1-chanh@os.amperecomputing.com>
 <720b814d-5102-04d3-4938-33a25e87a46d@wanadoo.fr>
 <6044a542-fbcd-0fe7-abd3-83f38b731ecc@amperemail.onmicrosoft.com>
 <HE1PR0401MB23315376796AF65DEB8B636B88E09@HE1PR0401MB2331.eurprd04.prod.outlook.com>
 <56581822-eb30-2e1b-169e-2bdee6f961f3@amperemail.onmicrosoft.com>
In-Reply-To: <56581822-eb30-2e1b-169e-2bdee6f961f3@amperemail.onmicrosoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0401MB2331:EE_|DBBPR04MB7610:EE_
x-ms-office365-filtering-correlation-id: 817cee2f-110b-4f8c-9e26-08dadeb7a51a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  zopXdpylGkWjMOXWSK0+zyRONMJnxHmwoeOer05hZ6dI0CJQ0huyx96FuId8RXZNJL4uo/FvKeBaqHMWCwuFvY1Zu+rLgkE83S9t2CEy9juEhnVXMZxIW/0GXfSvelbFvtCJA9clljHuOCC8veao5cXBevepX9BcktwZPCzcx4fJVzOSc+lFlbByUsgqnEBezoJvV3mzQiRxcVlUXkm3OfckjDyuw78kiteerYZyG55MRqD3q1sF6EPvIYs/sEuR9U1lQN3ZFcgWdmMTE9c9YYWykqjT7mK8B9N9qrSuRPe6LXImkLs6is6mn5+yMz8AOg30avlJaOBHrqWm19aXqkxX2u8MusqJFOa5CCwc/b59UnaY9RXH1CZWFkUgqQzlhqMgJ7aefE6OPzyp6hKfeZ64egSx+6liD/V6C9atMkfwFhcfgImMlpZ/WRIqvesvrez0hgb0TMnCaj7xkaCQRKu+xnlVzE/ZgrOyTpOx8AP0e4W2HPzrVPY1nRKiqHSP0AbVkliffSnESdt8/u8AxRhXnOqNRUj6uWtRxXltSDDkxbEOpXFVxQxmEurlifLllztaszDDLVITdLmId/sDd1gVJRI+CO/hmm1iiCyQR2FEakULubVV8DZYvJjppOD6x+DajiWyX/5wP6uo3Zl5pPH4Bi9XVP3TZKncGwnrVvT7uQM1Jd14lZ60bVKKB5QTm8BWeGwPnpGyyHdATiM7SQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199015)(110136005)(41300700001)(38070700005)(44832011)(122000001)(5660300002)(8936002)(7416002)(38100700002)(52536014)(6506007)(33656002)(86362001)(55236004)(71200400001)(186003)(26005)(478600001)(7696005)(54906003)(64756008)(8676002)(66556008)(66476007)(66446008)(4326008)(296002)(66946007)(76116006)(316002)(9686003)(55016003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OUx5eU5BOEVsTDZtVXlFVTQ4OGdmYzFXTFJGMVAvSmNtUjE3RTF1WlRKWmt0?=
 =?utf-8?B?RGU5ZUMxQnZEOUh0MmNLMUhNTFphRVRkK0x0YWdKSzdzYkJ2bExwMFhndlRO?=
 =?utf-8?B?Y2NKejBKSXkxUkxIcUtJQkZybzRIbk9VcS96aFBscFNzWW42dk83NXJhUDN1?=
 =?utf-8?B?Z0xCY2tidDA3RlBBdkFPMW1KWkVEWEdGU3U4WDhmSGNQdUJtdkV2TjRibE1j?=
 =?utf-8?B?VGlpZUFtNEROUzFjNGhNeXRQK0RlZTlKS3NhVXVieEJYejhpRTZqVXV1dDJi?=
 =?utf-8?B?SE5CUk42YWIzcHNLYTNYSEhBR2FIaFhmNXg4RnRGbXpKSHpNTkFtZEU5MUw0?=
 =?utf-8?B?ejJaSEVtU0lETlF5T0ZVTFpXYmpzSHkzZGFEbk4yT0RWczZTRDJZOEhDNk1Q?=
 =?utf-8?B?Vzg2RkdJbXpqZTdUdGsra3FsQzRlSXE4NTY4Z0htUXY5cEJRaGJJeVlzeERX?=
 =?utf-8?B?akFiSWQ0UzNYTktYZk42RXI1LytiVGlURUtYT3REQzhEY0pjMlVadkszNUxr?=
 =?utf-8?B?OFR2SGlwcHk1bTJBc2NQZTJPQUdGWUNMRE9jQmJhb0dSUHBaNjVML3lUU1B0?=
 =?utf-8?B?TlVCSC9GRkU3SU5WUWJzVEVQcWEvelFGSFd5bHhETUJxMjAzWTFSMGNldXZE?=
 =?utf-8?B?dUhsSGw0ZThVQXVNNFBmTXo0TjJPWUxZRUZ4dnRsKzFyTGhyRHFHVk1jVWxy?=
 =?utf-8?B?azVYbWNqeHZFT3BGOFpTSTI2NGVFOHpUS2g0RkZsNUk0SkdUaGVpNGNCR0Qy?=
 =?utf-8?B?UnVjbFY5R1hJWTc2VFRJYVFHY2diQXh4SE9YYjBzN21qbTI4NU1zRUFrNDY4?=
 =?utf-8?B?SC84RnJFTVFTUW9XbTBLTEticXIrdFI2eGcxMXVNaGJuamtXQWMvNndIUnRN?=
 =?utf-8?B?cmlzRVQwR25WclNsdnJiTFozcTY5bmh3Y0cyZTI4K1FMTjRnWVlhM3NlQUJi?=
 =?utf-8?B?RURIN241d1IrdThBMXFiY2p0WXhIaHhLOXR1QW03eXNrWk9Cc0xaYkorUFd3?=
 =?utf-8?B?UlJkMFZlU3ZRWXVudEt2VlM4NllXT3lNSXNsZnBxUk9XM1NKUDNxdmVTQlpF?=
 =?utf-8?B?OTdiSWtUYUxzUXpxUE5hRDBicnVHSzI3SG94YXI5RmFtaTh3VVczZHNzcXY3?=
 =?utf-8?B?bitJYVRwMFhRWWRSbEZCdHdlNm9nbjFVcnNjbTVmY3JhZ2lCTFRnRjVqYjBF?=
 =?utf-8?B?eVRGaHFTNlE3bzh4ZzFKR0EvVG5Vd3h4VEZ2M3FMZnpObEwyVUhnVHdzZGtB?=
 =?utf-8?B?U0hYMzdzMlpKVTFHQzdRcWlRMmpaU0ZsOC9QOXN3VjM0WmJWUlFpYjQ3YkU2?=
 =?utf-8?B?bFFXaHlWL0swVElLTzNveTRORk80NDBNUzNpSDRTZVd2QTRLZmhBRjBoalNO?=
 =?utf-8?B?WmFidW42dmpIZDI2ZmdwZXpoVWFaRDlQUTFuektUTVl6NEczeDdiNDFNZG9W?=
 =?utf-8?B?SDJTa3pRRWMwMDJXb09nRjlLUS9aaXhUaTZ6d3NTdkVBUHJGN1dPdHJaaEwr?=
 =?utf-8?B?QzhyQkp5ZS8vcWMxNnJvM3V1Y2ZMYzFOZktCaEg3VHFnK3BjTUJwRWd2OTdE?=
 =?utf-8?B?LzNtVUtzazRaNEVBcnBsWGNKZmhTbFdqaGl1ZEh6eHFseDR2WDFNUGNSdTVV?=
 =?utf-8?B?WUgvQ2ZTOTZKYmRmMmg4YldvQjdBaWdVc0czZXg0SEd6QlV6R2xEQmk0U0tz?=
 =?utf-8?B?V2EvK1NoSlBvWnc4eEltY3JhYzhEc0t1ODNWK0g5Ynl0dVQwQ1p3NEdnMFFG?=
 =?utf-8?B?WjV4d2lFL0hscEt4c3NIb05sK2VpZ1VKU1R5eHYwTWxBTlNwc3IxU1oyTFZv?=
 =?utf-8?B?S1J6c2ZHeXF4Skt3KzBjS1lBejlldGNKeUdkNDZZVlNWeVBNekVhd244MUxT?=
 =?utf-8?B?NkhxY1F5MVJoRzhOd1JLMXAxVXpwS0tudWFpN2Z6amt3WWNKYkwzV0VjNTBp?=
 =?utf-8?B?V0NaVjZ4NGY4VWFKL200S3d3djJ0RjNZVE4vWDQzVmFqcTFDR0dLV01CbjQr?=
 =?utf-8?B?OUF0eFVyNm5IZjZrZHRkQVo4TzFZMnVRMWtyRG1yd0p6SEkzSkJhZFY3akNO?=
 =?utf-8?B?SVNQUFgrbitnTXRLVlcxblRtUktxbXROU0lkR1h1UFQvQ0tNdnVTRUViVDl2?=
 =?utf-8?Q?hMXs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 817cee2f-110b-4f8c-9e26-08dadeb7a51a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 16:15:55.6244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gN+tP0U3PrLhXJU8C5RX5iZiBCDbR6Ybgjx7VBY1H4IcJ+Y0FZFmhhfCEG0BATJh7sngKWietfnhHV5NNTKsAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7610
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dan Vacura <w36195@motorola.com>, Vijayavardhan Vennapusa <vvreddy@codeaurora.org>, Rondreis <linhaoguo86@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Jakob Koschel <jakobkoschel@gmail.com>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

XQ0KPiA+DQo+ID4gTW92ZSBhbGwgZnJlZSBpbnRvIGdhZGdldF9pbmZvX2F0dHJfcmVsZWFzZSgp
LCBqdXN0IGJlZm9yZSBrZnJlZShnaSkNCj4gPiBEcml2ZXIubmFtZSBhbmQgZ2kgY3JlYXRlIGF0
IHRoZSBzYW1lIHBsYWNlLA0KPiA+IEZyZWUgc2hvdWxkIGJlIHRoZSBzYW1lIHBsYWNlIGFsc28u
DQo+ID4NCj4gDQo+IFRoYW5rcyBhIGxvdCBmb3IgdGhlIHF1aWNrIHJldmlldyBjb21tZW50Lg0K
PiANCj4gQXMgcGVyIG15IG9ic2VydmF0aW9uIHRocm91Z2ggdGhlIHRlc3QsIG9uIHRoZSBmaXJz
dCBtb3VudCwgdGhlDQo+IHZpcnR1YWwtbWVkaWEgdGhlIGdhZGdldHNfbWFrZSgpIGlzIGNhbGxl
ZCwgdGhlbiBsYXRlciwgd2hlbiB1bm1vdW50LA0KPiB0aGUgZ2FkZ2V0c19kcm9wKCkgaXMgY2Fs
bGVkIGFuZCBmb2xsb3dlZCBieSBnYWRnZXRfaW5mb19hdHRyX3JlbGVhc2UoKS4NCj4gDQo+IFRo
ZSBnYWRnZXRfaW5mb19hdHRyX3JlbGVhc2UoKSBpcyByZWdpc3RlcmVkIGFzIC5yZWxlYXNlKCkg
b2YNCj4gZ2FkZ2V0X3Jvb3RfdHlwZSBmb3IgdGhlIGdpLT5ncm91cCB2aWEgdGhlIGNhbGwNCj4g
ImNvbmZpZ19ncm91cF9pbml0X3R5cGVfbmFtZSgmZ2ktPmdyb3VwLCBuYW1lLCAmZ2FkZ2V0X3Jv
b3RfdHlwZSk7Ig0KPiANCj4gSW4gZ2VuZXJhbCwgdGhlIC5yZWxlYXNlKCkgd2lsbCBiZSBjYWxs
ZWQgb25seSBmb3IgdGhlIGdyb3VwLiBUaGVyZSBpcw0KPiBub3RoaW5nIHRvIGd1YXJhbnRlZSB0
aGF0IHRoZSBncm91cCB3aWxsIGFsd2F5cyBiZSByZWdpc3RlcmVkLCBpZToNCj4gaW5jYXNlIHdp
dGhvdXQgdGhlIGNhbGwgdG8gImNvbmZpZ19ncm91cF9pbml0X3R5cGVfbmFtZSgmZ2ktPmdyb3Vw
LA0KPiBuYW1lLCAmZ2FkZ2V0X3Jvb3RfdHlwZSk7Ig0KPiANCj4gSW4gdGhpcyBwYXRjaCwgd2hh
dCBpcyBhZGRlZCBpcyBhbiBpZGEgbnVtYmVyIHRvIGJlIHVzZWQgdG8gbWFrZSB1cCB0aGUNCj4g
Y29tcG9zaXRlIGRyaXZlciBuYW1lLiBUaGlzIGlzIGRvbmUgaW4gZ2FkZ2V0c19tYWtlKCkgc28g
d2UnZCBsaWtlIHRvDQo+IGFkZCB0aGUgY2xlYW51cCBjb2RlIHRvIGdhZGdldHNfZHJvcCgpIGFz
IHRoZXkgYXJlIHJlZ2lzdGVyZWQgdG9nZXRoZXINCj4gaW4gdGhlIHNhbWUgcGxhY2UgYW5kIHdv
dWxkIGJlIGEgbGl0dGxlIGVhc2llciB0byByZWFkIHRoYW4gYWRkaW5nIHRoZW0NCj4gdG8gX3Jl
bGVhc2UoKSBhcyB0aGUgY29kZSBiZWxvdzoNCj4gDQo+ICAgICAgc3RhdGljIHN0cnVjdCBjb25m
aWdmc19ncm91cF9vcGVyYXRpb25zIGdhZGdldHNfb3BzID0gew0KPiAgICAgICAgICAubWFrZV9n
cm91cCA9ICZnYWRnZXRzX21ha2UsDQo+ICAgICAgICAgIC5kcm9wX2l0ZW0gPSAmZ2FkZ2V0c19k
cm9wLA0KPiAgICAgIH07DQo+IA0KPiBBbnl3YXksIHdlIHN0aWxsIGRvdWJ0IHRoYXQgdGhlcmUg
bWlnaHQgYmUgc29tZXRoaW5nIHRoYXQgd2UgaGF2ZSBtaXNzZWQNCj4gc28gcGxlYXNlIGxldCBt
ZSBrbm93IHRoZSByZWFzb24gd2h5IHB1dHRpbmcgY2xlYW51cCBjb2RlcyB0byBfcmVsZWFzZSgp
DQo+IHdvdWxkIGJlIGEgYmV0dGVyIHNvbHV0aW9uLg0KDQpMZXQncyBzaW1wbHkgdGhlIGxvZ2lj
DQoNCkdhZGdldF9tYWtlKCkNCnsNCiAgICAgICAgZ2k9a2F6YWxsb2MoKTsNCiAgICAgICAgZ2kt
PmNvbXBvc2l0ZS5nYWRnZXRfZHJpdmVyLmRyaXZlci5uYW1lID0ga2FzcHJpbnRmKCk7DQogICAg
ICAgIGdpLT5jb21wb3NpdHIuZ2FkZ2V0X2RydmVyLmZ1bmN0aW9uID0ga3N0cmR1cCgpOw0KfQ0K
DQp0aGlzIGlzIG9ubHkgcGxhY2UgdG8gY3JlYXRlIGdpIGFuZCBkcml2ZXIubmFtZS4gDQpubyBv
dGhlciBwbGFjZSB0byBzZXQgZHJpdmVyLm5hbWUsICBzbyBJIHRoaW5rIGdpIHRha2Ugb3duc2hp
cCBvZiBkcml2ZXIubmFtZS4gDQoNCnNvIHdlIG9ubHkgdHJhY2sgd2hlbiBnaSBmcmVlLCAgIGp1
c3QgZnJlZSBkcml2ZXIubmFtZSBiZWZvcmUgZ2kgZnJlZS4gDQoNClJlbGF0ZWQgbWFsbG9jIGFu
ZCBmcmVlIHNob3VsZCBiZSBwYWlyIHRvZ2V0aGVyLiANCg0KR2FkZ2V0X2luZm9fYXR0cl9yZWxl
YXNlKCkNCnsNCglLZnJlZShnaS0+Y29tcG9zaXRlLmdhZGdldF9kcml2ZXIuZnVuY3Rpb24pDQoJ
S2ZyZWUoZ2ktPmNvbXBvc2lzdGUuZ2FkZ2V0X2RyaXZlci5kcml2ZXIubmFtZSk7DQoJS2ZyZWUo
Z2kpOw0KfQ0KDQpHYWRnZXRfZHJpdmVyLmRyaXZlci5uYW1lIHNob3VsZCBiZSBzaW1pbGFyIGFz
IGdhZGdldF9kcml2ZXIuZnVuY3Rpb24NCg0KSWYgZHJpdmVyLm5hbWUgaXMgZnJlZWQgaW4gZ2Fk
Z2V0X2Ryb3AoKSwgZ2kgY2FuIG5vdCBhY3R1YWxseSBiZSByZXVzZWQgYWdhaW4uDQoNCg0KDQo+
IA0KPiBUaGFuayB5b3UgYW5kIGJlc3QgcmVnYXJkcywNCj4gLSBDaGFuaA0KPiANCj4gPg0KPiA+
Pj4+ICAgICAgICBjb25maWdfaXRlbV9wdXQoaXRlbSk7DQo+ID4+Pj4gICAgfQ0KPiA+Pj4NCg==
