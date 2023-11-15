Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9257EBEE8
	for <lists+openbmc@lfdr.de>; Wed, 15 Nov 2023 09:54:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=oRg4Nqfo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVcRw0L2qz3cYP
	for <lists+openbmc@lfdr.de>; Wed, 15 Nov 2023 19:54:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=oRg4Nqfo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::603; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVcRH5bwrz3bdm
	for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2023 19:54:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQhqVRdwhMza9aGJIaHY9vjUmmdk5V2d61yaTgYwvufaP4B/Mrh1NW9nYY7/Y69dN73Hx1i7TR5GfQO5D2Uve8W789K201TsFoLCm2q23+v2KdbzL74rJZE5AHbnZRUvOoaAU2CwmMdecly9lUtgypKYHa29xZmUVOcubIynQ376etG2vJlhhqG3CU/jB/6zxmY3v2PE8HoYAAyKLi1gpOwjZ5xlWcrsnYZggYdtXPOJW7fokQYUNaSRdQ0JWpBmBrP9OxdRUJq3V1Av0t3doylKQIeY/OSKHfWMMOm6s7BRth5AhaEdGBWAgeUHSTA6BTIXrduQF5o6l8BUlf3HZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAo3PcDVb0gz/u8o2YbCFuq4yWlVQ38sWaUFLVlDDHc=;
 b=JJBBb7FF8qelkV472bPQQQlK1eGPralJGwCINJaVxwBWfva/wb3txS2XVDB6WIm55Zmu65bOrrrj7jQxvIQriKAJFbL0KKtx42wSwWzidCIvggXbXVX071BeJ5Iv4Za+whFSC9Ot89dFJ4iDI+o9nivTB1Tmx7ciPpcFm+KnaD4wWaLE0kCry1/0L6Wr0TDU67/GBmUeqE9yQ3qNQpvqy3HbP2nFMf9H8eJ5/hfuctn1IK06XVdsK0XVkn+cSeQXUM0z63TkOhOojc9TwOE4/tlMsJt2jAub08hTCx/r6Utv2NoSlnOve5edg2OPQzIcc/JWfR7eFZhocs0NaZtbQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAo3PcDVb0gz/u8o2YbCFuq4yWlVQ38sWaUFLVlDDHc=;
 b=oRg4NqfowRW0Ysnfvi84Mwtfu119rxMd3PETYXB9e7njb72FT5L15wyV3LFwPXHZlI8AddlhveZk1D/hgoMVc6sH4O5KWKvco3f5dd6PUoE6pGBrIkjvgCxi/hqjYS2shWiWMZRVXPgLTOAAVwLjqO69uonOLNH9Aj+9Yb+wiZinMY1I20j39FlbHlT0uruwUst0kWC7zXTA1y/j42OF2HqQdRTca1IjuIUEPP4Vy+/cVLW40loqMJM20YCcZS6htSZPqKNCl0MQ/H/RE+Mec53rTCck317LRXElnUETldLY+tbSDc8xE73F5JVv8oX0QgEQRfcJhXcPm2WZcyNH4w==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by TYSPR04MB7615.apcprd04.prod.outlook.com (2603:1096:405:39::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Wed, 15 Nov
 2023 08:53:55 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::c980:d5d7:4099:fa07]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::c980:d5d7:4099:fa07%3]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 08:53:54 +0000
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To: Joel Stanley <joel@jms.id.au>, Delphine_CC_Chiu/WYHQ/Wiwynn
	<Delphine_CC_Chiu@wiwynn.com>, Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: RE: [PATCH linux dev-6.5 v4 0/2] LTC4286 and LTC4287 driver support
Thread-Topic: [PATCH linux dev-6.5 v4 0/2] LTC4286 and LTC4287 driver support
Thread-Index: AQHaEhxue+8AvHj8uUCPa07AEF43bbBwRxiAgAKR0oCACEOUAA==
Date: Wed, 15 Nov 2023 08:53:54 +0000
Message-ID:  <SG2PR04MB5543CB6774F6A5CC80501D94A1B1A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20231108082019.1601366-1-Delphine_CC_Chiu@Wiwynn.com>
 <CACPK8Xc4NM_F4tBrZZe08r1=RYoe72=DbZNWSaK3E1_i18zjYQ@mail.gmail.com>
 <CACPK8Xfb7pG6sTcx3_A8sPAgiC08A6Q8je0R+7c=eUYxuS601w@mail.gmail.com>
In-Reply-To:  <CACPK8Xfb7pG6sTcx3_A8sPAgiC08A6Q8je0R+7c=eUYxuS601w@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|TYSPR04MB7615:EE_
x-ms-office365-filtering-correlation-id: 3416af7d-d0ec-4de0-2c99-08dbe5b865b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  i4/19lnPGUTCskndiOI/ik24qlJdU0dBEgCEUmHD61d9KILCF81zTDpKTOu2v+htTBUwGseD9wAO1guXZVBrfzH48NISlw1NXwaCUUeSv1MlUAHwAFDGBomQe+x/M038VrkYFU2kiQkzsK2ktXqe/Q6pi0WLDG0dA30zfXFHgXi5tnECLdtdmM6kQVXCnSeAz4AmJBBp++g2P1+3kSSlx31CS98GMNV3TjoknIgiGZvNFQBezJanr5rZPvM9MCPZLnk5pOG2oilG87rKSu8EkDCJfcXsRVdFS6RcWysgA77fe1UdBCY7CUYevAo5jrobUyOsbEn9nJWNdnt5N2wqkZlAw4ipPoudj9T/K+5xgfpTsQlBFyutzOpz+3icS3sLb5/5b24uESHUg/4LEPkaqs4bRc+n9dDRCYX5q5V1lx8OYKGu7ITh24VRsNmh4UjAqa+lAWSqD8xXkVlLEYtH+6jYXLkT0N3tZh7EMw0eEjsEyzxzEotr4hwOvYhgOnnlx32L2TDzFQ3C7AvDUQAn2ZIuzvnABrilXR1e8ZxXO1PYChxjs6W2vF+I89/u0R+n0ZtUqD8kyCBzhCFxEz+jp3aJ7mORJanXe0J8m4W57SbWXzcGQlKH1/Ufc+P0jP+yw+ivVxuU9WTrDG6TtqtPcGK+mpkxzsjHGaSq5IeXsaU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(376002)(366004)(39860400002)(230173577357003)(230922051799003)(230273577357003)(451199024)(1800799009)(64100799003)(186009)(38070700009)(4326008)(52536014)(6506007)(478600001)(55016003)(5660300002)(83380400001)(8936002)(8676002)(2906002)(33656002)(76116006)(66446008)(66556008)(26005)(66476007)(54906003)(316002)(9686003)(64756008)(7696005)(110136005)(66946007)(53546011)(122000001)(71200400001)(86362001)(41300700001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R0VTK0d3TllZR3ZLcTh1MFZ4Sm1tQ3RqTDMxelQ0dVRsM3hSL2NSWXFFZUFh?=
 =?utf-8?B?TDZtUUtmSTg2emxQWmNBT243NXZHcnNmczhnMHF2d2RtQ0pYNUZtdGUxZm9H?=
 =?utf-8?B?RmJTM2pHM1FhZFI5MDRneWJ2a0xjVWNjZkxjeER4NTk3NGVaaGZlTzNsL2Fh?=
 =?utf-8?B?RUR5bDJhRWlPSHVmcXRKTkQrMFJncVVzTWg5cjBTeFNHNndEOXlnNzQyZEdJ?=
 =?utf-8?B?VDlRZStaV3ZERGhsdStrYWwydk9uTFN1UURwNDdnbWVYM0JIMUZaU1Q2cU16?=
 =?utf-8?B?RXBhbm1tNjE0b0NtRXpzS1FodXhIaGNxOEZielpjUTUxUVQyWnFtaTNNUllk?=
 =?utf-8?B?cDNOK1Z1RkdQbjVRdVNVR2lxdjgrSUpLeHVBTGlWS2Y0QTY1clNscVFkTlA3?=
 =?utf-8?B?VlF1cGRhamxaUEVkb05aL3pZNWFyWHBaUmEyd0hJU2s2K2orK2VLYmNseWdo?=
 =?utf-8?B?aVFKQ0lkVncwaEFzd0V0QzJXWGpXOXdyY1J6QXBoaUU5MDZsVnk0TEF1a0pC?=
 =?utf-8?B?VmcvalVoQlVkdkxXdVQyeEppY1dxT3BTenJPaHpaN1ZiY3p6ckdySm5leDZ6?=
 =?utf-8?B?OVdmdGVlZXA3S1BzYUYvVWNPS3oyUUtOMSs5S29MVFFrZmxxc3JiZHpxNEw5?=
 =?utf-8?B?cThxeHczQ0tYVUg4TTQ0VHRPWXcyMEk2ZFdhY2dTWU5haTgzeHQ4Nk1qU1JQ?=
 =?utf-8?B?WEtFd3A4L1FtOCtYcWdUaUR4aEVCRnBtd0xFRXExZUR0R0lvczVUUS90MVVP?=
 =?utf-8?B?L3dGUjNrMmNER2dGL0c1eThGZTZ1anNqQzdENzZCcEJNaGwzUHN6eDhrcUpY?=
 =?utf-8?B?WTFWcVk0dTF6alZaSUExRlRiWkpvL3NGZWlaR202cG42NU1aRzY4emptVEg1?=
 =?utf-8?B?cEtTbkx3allscW5WL2VEWnc0Y2ZzbUk2Tm4zSHZyQ08vbHZhVXVyeitMa3BP?=
 =?utf-8?B?WXJjQVlJOW1pZjRKbXUxVS8wbG9xOGw1NHcvcWUwWlphQlVxeVh1eHU3b2t6?=
 =?utf-8?B?REN3eGQwOGM0TGVWeldOTFNrMEFWTGM4cmc2NVlnWFhBYjd5NWtxcjRzYzRD?=
 =?utf-8?B?bWhnMjVtNXZqRGdIUWhUTEV6Qnk2SXVhS3NJVTliVTYxRU1veDIzazZ1bXJq?=
 =?utf-8?B?bVBRd21EV20xNDBMNFYydXAzMHQyZGJnM0ZUdXA3UzYxZVVta00wVVpwWTdY?=
 =?utf-8?B?Q1BHVEUyMDNqR1Y4UTlHYmxpU1p1NUtCVmlOZUszczJMcCtvRWJEY0xjNHF0?=
 =?utf-8?B?V2ZUNVhZMGJDVzFBQm9OUkpDS3g4d1M4UDJXWEoyUWJhQ1hGLzB0d1BHUE80?=
 =?utf-8?B?UjVEOVZKWEliV3ZCMXVzRXNUd2d3cW95UFFEaGVjeTdtTlQ2QU5rdk9tOENY?=
 =?utf-8?B?a3M3YjFHSkNRdG5oZ2Nsc3VzUld2UzM5S0M4SWJrcGV6bzFwKzRXQUJwcHVn?=
 =?utf-8?B?TklvZjRSRytnM2hBUDVHeWN1dnNyMUVXUHI0WitHcEJRczJFWGRNTXIzK251?=
 =?utf-8?B?ZkhyMVMwcnRHN2wyV2FDdEM1RUc0RFR0Q0xxdWZET2tWMEhGa0FhQU1BME1Z?=
 =?utf-8?B?bjNwY1M0bzB1MzRIZU5kZEZIREdkOXA2V2swdGNSUlFycXRJQmZXR0dDckpI?=
 =?utf-8?B?UEJlR0dRMlprd1hOd1NiUUt5RHo5ZjNzMkUxVDQ3eEJWaFVhcDhPU2l1ZnVL?=
 =?utf-8?B?Tk5yME5pbHE3L3hMUGppS0ZQL3loM2hSdDZTNjRmS0VUSmdCcWtqZ0F2NmFh?=
 =?utf-8?B?cWdTamxwRXNJKytxL0o4N0pNcUI5TmZQRThaNmkzL0FpdUpIdm5qZGN5WHRK?=
 =?utf-8?B?QkxpMXlHREhEaWR0TEhSeWdmR3M1c21PMTNlWlVSQ1I2UHlpN2YySDdZZWNu?=
 =?utf-8?B?cHQyM1pEZnBIUlJoYkVMUlgwaEI4ak9NLzE2ajI5Mkp1NXpLc0NseWc1ODBD?=
 =?utf-8?B?UnFYeE1sNEFFUmNGWGRTWWE2Z1lQRXJiOTA1Mk51UHhBdEpKOEErbHBTejJ2?=
 =?utf-8?B?SEh2aHhEUmFUQ2xaUFZBU1VvRG9SaDc3eWtLQVJMcG1MbnJlbVB4RkNLYU85?=
 =?utf-8?B?TUZ6MlpQWE5CVGIraVpKSDVWK3dWSml5LzBvMnJSM0JITW9TK1pzY1lIczhx?=
 =?utf-8?Q?VJDbTYsOFgmQmQYT3ggZMtS5m?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3416af7d-d0ec-4de0-2c99-08dbe5b865b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 08:53:54.5835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0QtYfaI7OKs31IvGGQo4gPZFExol/UtHBR3KgBgGNsqjQ/sW9lfmlDnz37GK3DoIM73lEEXAmdMZ9n4s4MmRgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7615
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxA
am1zLmlkLmF1Pg0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDEwLCAyMDIzIDEwOjM1IEFNDQo+
IFRvOiBEZWxwaGluZV9DQ19DaGl1L1dZSFEvV2l3eW5uIDxEZWxwaGluZV9DQ19DaGl1QHdpd3lu
bi5jb20+Ow0KPiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29tLmF1Pg0K
PiBDYzogcGF0cmlja0BzdHdjeC54eXo7IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIGxpbnV4IGRldi02LjUgdjQgMC8yXSBMVEM0Mjg2IGFuZCBMVEM0Mjg3
IGRyaXZlciBzdXBwb3J0DQo+IA0KPiAgIFNlY3VyaXR5IFJlbWluZGVyOiBQbGVhc2UgYmUgYXdh
cmUgdGhhdCB0aGlzIGVtYWlsIGlzIHNlbnQgYnkgYW4gZXh0ZXJuYWwNCj4gc2VuZGVyLg0KPiAN
Cj4gT24gV2VkLCA4IE5vdiAyMDIzIGF0IDIxOjUxLCBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlk
LmF1PiB3cm90ZToNCj4gPg0KPiA+IE9uIFdlZCwgOCBOb3YgMjAyMyBhdCAxODo1MCwgRGVscGhp
bmUgQ0MgQ2hpdQ0KPiA+IDxEZWxwaGluZV9DQ19DaGl1QHdpd3lubi5jb20+IHdyb3RlOg0KPiA+
ID4NCj4gPiA+IHY0IC0gQWRkIExUQzQyODYgYW5kIExUQzQyODcgYmluZGluZyBkb2N1bWVudA0K
PiA+ID4gICAgLSBBZGQgTFRDNDI4NiBhbmQgTFRDNDI4NyBkcml2ZXINCj4gPg0KPiA+IFRoaXMg
aXMgdjQsIGJ1dCB0aGUgZmlyc3QgdmVyc2lvbiB5b3UndmUgc2VudCB0byB0aGUgb3BlbmJtYyBs
aXN0LiBJDQo+ID4gY2FuJ3Qgc2VlIGFuIHVwc3RyZWFtIHY0LCBhbmQgdjMgaGFzIGNoYW5nZXMg
cmVxdWVzdGVkLg0KPiA+DQo+ID4gSXQgd291bGQgYmUgYmVzdCBpZiB5b3UgZmluaXNoZWQgZ2V0
dGluZyByZXZpZXcgZnJvbSBHdW5ldGVyLCBhbmQgdGhlbg0KPiA+IHNlbnQgdGhhdCB2ZXJzaW9u
IHRvIHRoZSBvcGVuYm1jIGxpc3QgZm9yIG1lcmdpbmcuIEluY2x1ZGUgYSBsaW5rIHRvDQo+ID4g
dGhlIHVwc3RyZWFtIHN1Ym1pc3Npb24gaW4geW91ciBjb3ZlciBsZXR0ZXIgc28gd2Uga25vdyB3
aGF0IGlzIGdvaW5nDQo+ID4gb24uDQo+IA0KPiBJIGRpZG4ndCBnZXQgYSByZXNwb25zZSBmcm9t
IHlvdS4NCj4gDQo+IEkgZGlkIHNlZSB5b3UgcG9zdGVkIHNvbWUgbW9yZSBwYXRjaGVzLCBib3Ro
IHRvIHRoZSB1cHN0cmVhbSBsaXN0IGFuZCB0bw0KPiBvcGVuYm1jLiBJdCdzIG5vdCBoZWxwZnVs
LCBwbGVhc2UgZ2V0IHlvdXIgcGF0Y2hlcyByZXZpZXdlZCB1cHN0cmVhbSBhbmQgb25jZQ0KPiB5
b3UndmUgZ290IHRoZW0gYXBwbGllZCB0aGVyZSwgdGhlbiBzZW5kIHRoZW0gdG8gdGhlIG9wZW5i
bWMgbGlzdC4NCj4gDQo+IENhbiB5b3UgcGxlYXNlIHJlc3BvbmQgdG8gbXkgbWFpbCBpZiB0aGlz
IG1ha2VzIHNlbnNlIGFuZCB5b3UgYWdyZWUuDQoNClNvcnJ5IGZvciBub3QgcmVzcG9uZGluZyB5
b3UuDQpXZSBhZ3JlZSB3aXRoIHlvdXIgc3VnZ2VzdGlvbi4NCkhvd2V2ZXIsIHdlIGhhdmUgZGlz
Y3Vzc2VkIHdpdGggdXBzdHJlYW0gYmFjayBhbmQgZm9ydGguDQpXZSBhbG1vc3QgY29tcGxldGUg
dGhpcyBkcml2ZXIuDQpNb3Jlb3Zlciwgb3RoZXIgcHJvamVjdHMgaW4gT3BlbkJtYyB3YW50IHRv
IHVzZSB0aGlzIGRyaXZlci4NCkJ1dCB3ZSBhcmUgbm90IHN1cmUgYWJvdXQgd2hlbiB0aGlzIGRy
aXZlciBjb3VsZCBiZSBtZXJnZWQuDQpTbywgd2UgYXJlIHdvbmRlcmluZyBpZiB0aGVyZSBpcyBh
bnkgY2hhbmNlIHlvdSBjYW4gbWVyZ2UgdGhpcyBkcml2ZXIgZmlyc3QgZm9yIE9wZW5CbWMgdXNl
Lg0KVGhhbmtzLg0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBKb2VsDQo=
