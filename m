Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3320558FB00
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 12:56:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3Nyy0gq0z2xHH
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 20:56:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=HVYQv+kf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.117.132; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=HVYQv+kf;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2132.outbound.protection.outlook.com [40.107.117.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3NyP1DH2z2xHH
	for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2022 20:55:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiXW/H+iz8qixTe4yx4htyeWytYchimfAzjbkpQJaVIMNGAMeOGYUCuMYst3Gdtl5y5zp1Xqjsg8zHHx9+n7lwwSLWbnXw9MAoeJIuBBXI4NyAboKr7fC9h75htwNqTpaIpYoLa3jHmBQSB2cGgoUybc6zzu0MSUsGZo9RALdMnHl5tu17wML3VI6X+WyA1cM+B3e4eEXp8cw3BW54g9SDODaEfDo8MWE79YHJCMsQAsji5ZjtoTE0oUOPW/iy8fu3xoK+8lYrfAwH1CaHPyAnMPiqaPcZu3Av0zWa1lZ84AWz5Fl3QEZERjxl63zGxuAViRf0bcQMfeORiBvSS3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oat0+Fo20/04mGJRkN1pNDrKYc/tx8bhFs8/XbBiUYA=;
 b=DZJmcnDGdLdiYOarEQZYlkOI5qT5FJX+oTlkJab0cK4XMWw0/3OmV+QSoalvjg2kCFGwzNUIzD+LfR1aesxXaPz7btTP7b5I02J6FvM1jJMa/5a4NSYH10H7CM/ONyAoTcwCdVRzgiaJRv/+F5bPwDL86ZuONSVcyls12Ziw9x9R2M8tnudgkIau2hqipxct9squxYf2Ohr9h4YALOoR45Sm3IuGBVUwtWUu368JJk5SQTavyT/m688G0QRiCBbB1b+3JFwHvmhUhTxpg+ec8qDgE1B/aYQDooFyPH/6EpxM9dh2uhHCRONdMaa8NNFpPwQiThB4XLrsfxaH1dSHJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oat0+Fo20/04mGJRkN1pNDrKYc/tx8bhFs8/XbBiUYA=;
 b=HVYQv+kfZeJ4uvf36STZD/Lt+XMrhPF4HqfkecQsg+J0gDnqi4CLOfyTUZLhB513CY3NDTJhNMiCOpQoQOMyyiGbaECTJ3eLe6KaKb8hWiSnaNOMGKgrImnR7engRSzKaD224/r6F1FuSOblhlyLic+5p0TLrNuhD3jvrLY2dcc67vg/DG3bslfrYgCtlzCaUjq0qUQmaUsGKBr8ltQJSKZvEAw1iFuYyb5udoYpkN/dUPtzlAiXQra17cUnn2sSh9BrHzFKnNOyjx+q9Ra3OWCS7qR/sBX40m0fXngxFBjM2swcTb55UgMzmNyvpmiJ81GYXr2zLFQr4KMUoP5jjQ==
Received: from HK0PR06MB3362.apcprd06.prod.outlook.com (2603:1096:203:8b::10)
 by TYZPR06MB5227.apcprd06.prod.outlook.com (2603:1096:400:1fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21; Thu, 11 Aug
 2022 10:55:35 +0000
Received: from HK0PR06MB3362.apcprd06.prod.outlook.com
 ([fe80::1812:ba2:a847:dcd2]) by HK0PR06MB3362.apcprd06.prod.outlook.com
 ([fe80::1812:ba2:a847:dcd2%7]) with mapi id 15.20.5504.018; Thu, 11 Aug 2022
 10:55:34 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Peter Delevoryas <peter@pjd.dev>
Subject: Re: TODO items for the AST2600 PWM driver
Thread-Topic: TODO items for the AST2600 PWM driver
Thread-Index: AQHYrP3WElKIjVeePkuTWLsEsUsKOa2qDeKA
Date: Thu, 11 Aug 2022 10:55:34 +0000
Message-ID: <6A82FD4A-73CC-44C8-AF23-3CADB2A49C5F@aspeedtech.com>
References: <YvQfGlro4tKsZ4T5@pdel-mbp.dhcp.thefacebook.com>
In-Reply-To: <YvQfGlro4tKsZ4T5@pdel-mbp.dhcp.thefacebook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.63.22070801
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b09cf142-210b-407b-4629-08da7b880487
x-ms-traffictypediagnostic: TYZPR06MB5227:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  uAz5t76Q5BX1pUamAnWiS5q7GeejjLy1yYkzvPy4jOJYFi6ll1tnGRJuMArwUZ5D+qk8DunI2kf2wk+S7JBGDfPvWjFvVklV9wN77aLoajpDxfzeAHBEgHgZC9aMBZyVPk/cmo2OcMnPTx7rcycqSnfRCgZEzySoggNMB0kegPkOnhOE2moiAdKEjxCkfHdgMutWzJIEP0EtgmDQgvzWtGXg8+IrO8scL6kgJ4c4/6jQN5Cf+rLR8mqoRAk1SmMhlr3hb6EVdhCjA5FMp5Ov4Kg5yChSM7llCftIcJUEvqf7GiEnT5LNyRVJ8ZR56vOhMR+IENBdU/8/eFH6bzZicpQ4eiQPn0iOUmRnWbyiDqk1rNbte89qXwVImaGtQ02elspQSaPnK8st0Ki3KKbhD+7hmGTbOgs/6MGJhoBeDiXKyYEOJWMQ4c+m+KrYjn38oBipGSMJrdxG42KFeXoWWddy8CR9wRQGieGUj3lNRceSyVJW15ZDJsmziiE+SEVXolTKkSMpdWekVl7xB01VwVKYHZxnu4Lmks8MEucrPj8Zj8XFS71SCNQrJ5kH1MHfCNdXTaAyGgA7ubnUs94NSRA2kyLTZYd/2UOIbbgl4vs8Z/JC0UgXpuqjRugzSCmpoEJNvkluI4nFCbXzyLIgU7HuvNQEzL7+2qbi36dl+eVSXuygEu+dVs5HDWTNawW4ummz3fPdTQlzLHQJ/C38BYlYvI560LCFSaqftYfLjUpBJk0sZzmIJkKJEjUkwli85/LGOvjkwxDKR8bRy2RMy6DPcKZ+IsKjw+jcJlCKLb9OqyFZYxXFYNwDelZvDXZ1DY/PEIX4Me3mF7Wt/azaQSsW8z75nSbEHk86L7lt3wNItVtjZ8fwd0FSkGcBSLu3XbB1nur3s+fqKWbzomshkQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3362.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(396003)(346002)(39840400004)(366004)(316002)(64756008)(8676002)(4326008)(91956017)(76116006)(66476007)(66946007)(66556008)(5660300002)(6916009)(2906002)(8936002)(38100700002)(54906003)(122000001)(66446008)(33656002)(38070700005)(966005)(71200400001)(41300700001)(6486002)(86362001)(478600001)(26005)(6512007)(6506007)(53546011)(83380400001)(36756003)(2616005)(186003)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UkxPSk1GUXRMcDlpY2phMUFDSGlwdE5seGRWbHVCZ0lwTnpTUklCbHJKQU9I?=
 =?utf-8?B?QkhEcEpXRkRPdlBoaUZSRUlDZldsTE5XMUdvNTRlMUNscGF3azBURE9TdXdt?=
 =?utf-8?B?cVdFRnBIKzFrbjY1Nm9XMDJoVEJyTHdMeldsbzY1ZTNLY1BWM3MwblhrcWNO?=
 =?utf-8?B?bVZRQjZ1QkRrSFYzeWdtSVZ1NTJ3aE1ueEUzYnVlVCt5ZGR5NzE1WlFzVEhM?=
 =?utf-8?B?RllONnI2eUdUaVE5TTZCbWUzMkt2NG1NdXRVbEo4UWtOWml3RkFuZjF3V1kr?=
 =?utf-8?B?akh3bGltdUdURTZHOVp4REtyT0hROWtwQmRuZng4emo2cXdhNlFhUWJzMGxq?=
 =?utf-8?B?NXBreEUrQ3pvRDZFMWU1WjZFTHQ2bk5VeTMrNDMwTkFqYU9GeWZHVitsTTZu?=
 =?utf-8?B?QTU3V3dyVlRiZHN1U1RkcXdhRWdZRmpsYkh0eWtacEVEeFJQY3owQzBQMFRE?=
 =?utf-8?B?UFZIRmRUQjQ2UG5QNVQzOHZ0VjFyWTlYVjNJTENSUFpvZEFRc2RoZDZ1N1N4?=
 =?utf-8?B?d2d1dGF6eFJubng2YzlmenQyeC92ekVESGtuSFJEbDNBUE4rQzR3a3JkLzho?=
 =?utf-8?B?M3pjNWxKdXlUM0k5YnkyblNwNG1tLzJVMnVXN015clN3UWpGM25mWVpXbnl3?=
 =?utf-8?B?c0w5cmlYSDJtemFWbmR3cDRvQ0hRVVp1cmx5SnU5b1E0S0RmYlpTUTVGbE5j?=
 =?utf-8?B?ckZmV2ozVXhsOWNES0NVOHoxNnJTUERPL0ZIYVY4UmNOeXIzdVA0dk14OW5T?=
 =?utf-8?B?cmVaRE9JcE9PcnZiU2xXRUczMUJ0UHZKVTdvVnB3ekUxb2s0ZTVjY21mbm9P?=
 =?utf-8?B?N0RzSUdkREVidHltVk1INlp0VUd6WUlibmJDQnBlNXQrS1hkWVozUE1ERFFv?=
 =?utf-8?B?aFdabnJ4dnZFZHZiczhtcHpwWG93UnVqZVpELzg3QS9DQWdaMVU0TmVhSHBP?=
 =?utf-8?B?TVRTTHl3OGtCMnFIenhXU1AzdUI3WG9BZ0cweGl6R0dXQzdvcG5xQWw2Wml6?=
 =?utf-8?B?c0xhbndrd1F4djgzQUNhNFRKdzJOb1RybGc3clJXL3FqazBJSTdVakJPVkhL?=
 =?utf-8?B?WVhGQUVzT3hhZWVGUVJvTmo2cnFESGRRZmRncUNvRmQ3YlNUOUNJSE5zMUNr?=
 =?utf-8?B?d0Q4RVMyblVBU3lKelFVZTA3bExZbTFOQmFuVHFabWFVeTYxTE80VG1PMDNt?=
 =?utf-8?B?NE9Nbk1YMjRDT01XTnMrMXdDZ1ZQQkQ0aUIwQ2tkVzBHK2FUWmYxbTdxbERl?=
 =?utf-8?B?NzhwcG44QnJKdXJXb3ZkYTlPaHcvVTl6bnZMTkxER1Jtand6clR3OGw5ME0x?=
 =?utf-8?B?WWhRTk50YmdiZWhSZmFqZmlPYWR1bXNhSkFJSXQ1UnlwdDFCbUVqeXlybktE?=
 =?utf-8?B?cm5lLzZiT21RVjBmZGIyQzd1VHhiZ0tBeFNIczk4RnI2ak5kajNTcmZjOHQy?=
 =?utf-8?B?enllQkdOY1JJZkNScHlmcUFaUnlsSGRSVUFaYnJoZEMzQXNveFRmZ2dPRS9u?=
 =?utf-8?B?ZUxVcmdjNkQweDl4S3JhN2ZYZmRUWmlOUDVVc2dUcmxTVXIzRk1qS2h1cHQr?=
 =?utf-8?B?MVFpQ0hERWtYQm5Dd1MzV3BrQ1Z3TU9QK1FScDRaS3E4d2xBd3VvOG9LR3Ar?=
 =?utf-8?B?TTJXeHZTQlhiK0Q5cHVwbDcwSUx3UVdyKzJvUnVpdjZZR1gyazJLaUJaczRT?=
 =?utf-8?B?U2FCYTZTOXJhOHJwZHhrelpka0VES0dEbkl4T3ZHMTNUZERtWWZNaFJOUFMr?=
 =?utf-8?B?ZHZEUG9uamkraHVSNzd5RjhDNytGQWk3dXp5WitrUHEwaHB0b2phVzRlRzJp?=
 =?utf-8?B?MDNkTG5Ta2Jja1JaODdMdGZKb1RhQjlvbS9tTWQyWVp1RngvdzNSMjAwS1h6?=
 =?utf-8?B?ZEFxTDRRcExnSkFTOEF6SFFPczViZ3loTkVMa2l0V2JFS2RZSnB1aHRwVjVt?=
 =?utf-8?B?WmZ0R2cya3NDQnVxd3J2bkNqaHZmdjNrVDlOTDI5OVphWG5YNk5NOHhGTlJu?=
 =?utf-8?B?UTBmTlFpM3dNYkZOdDVNclFlRTF1dnJYUStQOGtDZ3ZhQ1VjNU1CV2VnQXRU?=
 =?utf-8?B?V1dVeGhhVVdWSUFzdXhOZlhweUJ5TmQvak42QkpjRXE4Wk9HVFltRm9XbnNI?=
 =?utf-8?B?MmdVb3dCRHlDMnFFYVFOVFZtNmVyZmlOQitFN1Vpc092N2tXRE9vZ2N4WE5n?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9F6C779753E32478731EBC8B48D7239@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3362.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09cf142-210b-407b-4629-08da7b880487
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 10:55:34.7933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WrrlIVCmVwF3fXgqxLaA9OaySwhZjvzkMI64xFM2RM3Q9uAXoKr5WG5v+LfQuiJaQupmBe7LwdZ9Rubo1kNF3uKrhJftkdGHI7EnAdnO4cM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5227
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
Cc: "garnermic@gmail.com" <garnermic@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgUGV0ZXIsDQoNClRoYW5rcyBmb3IgeW91ciBvcmdhbml6YXRpb24uDQoNCk9uIDIwMjIvOC8x
MSwgNToxMiBBTSwgIlBldGVyIERlbGV2b3J5YXMiIDxwZXRlckBwamQuZGV2PiB3cm90ZToNCg0K
ICAgID4gSGV5IEpvZWwgYW5kIEJpbGx5LA0KICANCiAgICA+IEkgd2FzIGxvb2tpbmcgYXQgdGhp
cyB0aHJlYWQgZnJvbSAyMDIxLCBhbmQgSSdtIHRyeWluZyB0byBmaWd1cmUgb3V0DQogICAgPiB3
aGF0IHdlIG5lZWQgdG8gY2hhbmdlIHRvIGdldCB0aGUgZHJpdmVyIGFjY2VwdGVkIHVwc3RyZWFt
Lg0KICANCiAgICA+IENBQ1BLOFhmTTRDN3Yza2VYYXhNczlTa3FOemI4WFdiWjZRdmNaWFdjeTNa
S0pDcnZXUUBtYWlsLmdtYWlsLmNvbSA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC88YSBo
cmVmPT4vIj5odHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBQ1BLOFhmTTRDN3Yza2VYYXhN
czlTa3FOemI4WFdiWjZRdmNaWFdjeTNaS0pDcnZXUUBtYWlsLmdtYWlsLmNvbS8NCiAgDQogICAg
PiBJdCBzZWVtcyBsaWtlIHRoZXJlJ3MgYSBmZXcgbWFqb3IgdGhpbmdzOg0KICANCiAgICA+IDEu
IFVzZSBvbmUgZGV2aWNlIHRyZWUgYmluZGluZywgYW5kIG9uZSBkcml2ZXIgZmlsZS4NCiAgICA+
IDIuIFNob3VsZCBiZSBhIGh3bW9uIGRyaXZlciBhbmQgbm90IGEgcHdtIGRyaXZlci4NCiAgICA+
IDMuIERvbid0IHVzZSByZWdtYXAuDQoNCkkgYWdyZWUgdG8gdXNlIG9uZSBkZXZpY2UgdHJlZSBi
aW5kaW5nIGFuZCBkb24ndCB1c2UgcmVnbWFwLg0KSSB3aWxsIGZpeCB0aGVzZSBpbiB0aGUgbmV4
dCBwYXRjaC4NCkJ1dCwgSSBhbSBzdGlsbCBjb25mdXNlZCBieSB0cmVhdGluZyB0aGUgUFdNIGRl
dmljZSB0byBiZSBhIGh3bW9uIGRyaXZlciBhbmQgbm90IGEgUFdNIGRyaXZlci4NCkFzIEkgbWVu
dGhpb24gaW4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9BREQxRThCOC02MEYwLTQ0MkEt
QkVGMS0xQUEzMDQ0NTQ5NjNAYXNwZWVkdGVjaC5jb20vDQpJIHdpbGwgdHJ5IHRvIGFkZCB0aGUg
cmVhc29uLCB3aHkgSSB3YW50IHRvIHRyZWF0IHRoZSBkcml2ZXIgYXMgUFdNIGRyaXZlciBpbnN0
ZWFkIG9mIGh3bW9uIGRyaXZlciwgYXMgdGhlIGxpbmsgYWJvdmUgaW4gdGhlIG5leHQgcGF0Y2gu
DQpJZiB5b3UgaGF2ZSBhbnkgYWR2aWNlLCBwbGVhc2UgbGV0IG1lIGtub3cuDQoNClRoYW5rcywN
CkJpbGx5DQoNCg0KICAgID4gQW5kLCBpcyBhbnlib2R5IHdvcmtpbmcgb24gdGhpcyBhdCB0aGUg
bW9tZW50PyBDYW4gc29tZW9uZSBlbHNlIHBpY2sgdGhpcyB1cD8NCiAgDQogICAgPiBUaGFua3Ms
DQogICAgPiBQZXRlcg0KICANCg0K
