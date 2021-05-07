Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C79376100
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 09:11:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fc1pF26ZFz2ykR
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 17:11:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=12VltROW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.130.114;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=12VltROW; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300114.outbound.protection.outlook.com [40.107.130.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fc1nt0MlDz2yXW
 for <openbmc@lists.ozlabs.org>; Fri,  7 May 2021 17:11:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0DwWfGo8HVF8lG2O9ZbgbVROYdfG0UIa9SEYYXPlot952kr3JucqcP1Vph4dtF0udNL52ONasL3PNx2pXHXRygHEzgiPIwlBqJSIH0nU6ZlLoS73WVwtGBJiz2VeixoHDNoF3G8Az8Lz9EFHukRpcJ7UPtt5UWNaszKl08ep34SydP3QrNLQ5RpbP2pJTXA/yqryjiBurFkXapqYQP4tXO67v+mWsj7QUXyypgVoSvU6hPIguzZ1KXsq3rwnaiil+fy5CRumHWuJHBxM9HHfFpuAw/4iU1jtR3W6l7t1Wgo5Xvlk8XWd2KqlFkHIyjtN1RInZ+sbagUYbtI55Yevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyWhzIDdoiMt582wIJ6am49tMhJI4hx467Ldi4kNUl4=;
 b=luBqA9Iot9VMth55vBviH4HRxfC+Sie+66FJz7q/wjvrkZ48S+86rmpJ2KBCalrvp1xONPE2m46GR3DKk+f+QgDAyRitgBJZr1G30t4lwSJcVz+xbUniZDmKo8BavSUnLtXCrzDqSFRPWHEiCmWyBYciHAyW3a/4aDMG8GPODoXrmwasDzbxmZ9uRmMYadCsY9V+JkjLsHRE5BnytgLVchy2eifUDIk0+TJ0jZpWJsEz9jhbrmxFDfZ/RgtshJ4EfYWvo1f8rk+3r6Hn7uZogyXr2drYJjHFBSb/ofv8N3JVCWnzdaS7jxnBvIuiGFeRwQ+DgE3tB72/4Rh90vgQFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyWhzIDdoiMt582wIJ6am49tMhJI4hx467Ldi4kNUl4=;
 b=12VltROWfQUPzaqFRyTrQp/U5xv7KSjPHr6hBjID8UFoLumiedHxmXYkerrMp1nNFrbGBsjb8abf0a0tzQydUmG5MQGFSKs0awMezdNnhyCagU4dxMUvuaEq6BOp9dQ4uKg5rdxnHNxa2ts2hT/M2pTUmZIc7Cuc6tLOEYmpKSA=
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com (2603:1096:203:46::21)
 by HK0PR04MB2865.apcprd04.prod.outlook.com (2603:1096:203:56::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 07:10:56 +0000
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::8522:3491:faa6:e255]) by HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::8522:3491:faa6:e255%4]) with mapi id 15.20.4108.029; Fri, 7 May 2021
 07:10:56 +0000
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: Brandon Kim <brandonkim@google.com>, Andrew Geissler
 <geissonator@gmail.com>
Subject: RE: CI build for quanta/gbs
Thread-Topic: CI build for quanta/gbs
Thread-Index: AdcPP65+jY/sq0xaRI+ylE14EJw/VQzTh9kbACB1JxA=
Date: Fri, 7 May 2021 07:10:56 +0000
Message-ID: <HK0PR04MB233989F62E1F9CE2C61AC99B8F579@HK0PR04MB2339.apcprd04.prod.outlook.com>
References: <HK0PR04MB233989A7F66DD0B3964E2E0B8F599@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <2DE216D2-B472-42B4-AC31-40902D5600CC@gmail.com>
 <CAO=notyQFgzroaMfsQkr+ZjPm_8DE4y5s3mkadxdmic=N85OMQ@mail.gmail.com>
 <CALGRKGPbdcSRrTUwU6uUpYfAxGZqOFWZL+LU74bFit0EcGP95Q@mail.gmail.com>
 <8D110F1E-CD90-41FE-808E-C2A2A3ACD903@gmail.com>
 <CALGRKGNUh1yMLX20LDLAs5Df=QB8=42KWuo=TC3SG84EEHqD5w@mail.gmail.com>
In-Reply-To: <CALGRKGNUh1yMLX20LDLAs5Df=QB8=42KWuo=TC3SG84EEHqD5w@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [61.218.113.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce62272f-d2ba-4296-7378-08d9112742ac
x-ms-traffictypediagnostic: HK0PR04MB2865:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR04MB2865A1E904EF58E56DF452338F579@HK0PR04MB2865.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BnoQD7MPd4TPXjWBzsEt9fwMm8oSjha2OFq5hBxJr1NlPRK184oBjwkkiryKxrKhQ0RBAAxrFuflKcHIpL8ayRBPDqStsW5jyFcD4jeIBaZbHVjpk0s9oBIU6Lq4NWWS5P1c4MpLcO4U4hkzWKPCluSvzDFKBB/xwUmhRUXBANSRTMzl5b6KqQFmedxgi/cx1teXEZfOOWpe5nFSlqpaUo6ejwESGyrt/w/tZEdupicR7yfl6A0+wo2Ibsm+xMG76omFJjzxe+Hy6TOs0qszktc+atvfP+J2DbBmR49/mAHTMbm6pLZ25bpvXTXJmiPl7jeI3yvjbGpA0o/SVmItXA+LaZohfKZZpDerTCITGMpfuPyvqTrw6sXehONYzUws5xIO/4PEnBU6kvwkVLrfJYkl63EObsF2SPSXFEc0qgNeJwDsgooUGx0lPN+Z0IyOp254+5UiXqK71sl1yx4OlG52X8vdXj5NA/7+qAhBz2ev52eXGZl/Fq/zKtIIpNKupS2VYhlMmbRf31fGZqhxbzE1YlvxDvLsG9em8NwjPTXb5E0LBj07wMViDlOWNSdX0sDztHYxIr4wHiWFmw8E5GNkspMG/jsJiEtpwP7vNo5J0rC2mfuoDR+Lr34izNoHd9GEr5zpF2JgspdYAnTSh9+c4Jsu+C1t/QN60hy2mvKWp82B107kCRukv8Qvg5Cv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2339.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(85182001)(478600001)(9686003)(186003)(76116006)(71200400001)(8676002)(83380400001)(166002)(52536014)(55016002)(2906002)(4326008)(66446008)(26005)(316002)(966005)(86362001)(122000001)(33656002)(8936002)(5660300002)(7696005)(110136005)(6506007)(66556008)(38100700002)(66476007)(66946007)(53546011)(54906003)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?UnJsUnBtck4ybEl2SDlKOTVRWldwNXBWQ3hPN2hYRURveU4rQU1HWDVpVFBvSXFU?=
 =?big5?B?VmFXanhTTVV5Yi9KcVMvbm1ueFBoUWxtbjNKZWx2RW1rNFVtZS9ScDhtdFd2OUJ0?=
 =?big5?B?QUR0cFptUlRvNkQxYm8ybGNaeGZWenM5UXRzWVlMMHNDMi9DZ3JrbGZ5WnVMMjI4?=
 =?big5?B?MzhmTndYRWNQU1ZkLzQ2RHNSY1FoWTlNRTh0eStOb1UzVjdEVzdHMFhveXFOR1h1?=
 =?big5?B?UncvS2NLQ2VjcjVFQXVVWnp4VUkxUHpacVlFYVh1M09uai84YWJDY0Q5UDRNaDBZ?=
 =?big5?B?QUxPeVFrTHJCSXZyTHIzeGZHcDdvME1ab1RCcUdQYVBxMlhBR1hqZzhTVDR3aFhq?=
 =?big5?B?cXIvUVB3aXNZOGNVbStaa1Y2RFZYNmc0RVVzbkg4ZlZ4K3pKVTdzQjVwcFEvdlpT?=
 =?big5?B?QzE5dkVGcHpUSzlha1U1QVdvbzIrRjcwY1RpNzZaUXZ1TXVVSUpQcUpiS2Nsbzd3?=
 =?big5?B?eW1xMStMVk1ZWVY2WDdCN1JlNjhVSWRQRitLc2lIMTlBZmM3UVdQUjZ1OTVNdWg3?=
 =?big5?B?UDZFTk8vUGZZZVVhbUh1eWxMME9FcHJkbkIwSk9XU1lSd08ya1BhcDdWZ1RJT214?=
 =?big5?B?a1hTb1lPblB5cGJ4b2YwNnhYejdIcS9ETkRiZ1RuTlRjQlBmeUFLRnJjTHc3V2ZB?=
 =?big5?B?UlhVU3JTRVpFaGJ2MkhVOXk5MWxSR1lQc1Q1eDgwdlRRMkxFMktvVXJud3pSaXhI?=
 =?big5?B?YmxKK0s3OU1uTkhqZVRzZi9MQllKOWxHcjdORm95d1picDZzTTl3dGJiTC9rTWpX?=
 =?big5?B?OGZvNGpPSG9WaEtUSDhRMWlQdHB5S2Uyem9HbFRUVmRzODdVdW1jTS94MTFTQWd4?=
 =?big5?B?alluZjVjUFArOWx3Zld2MSt5U1BGVkxNaUFsMS9TajcrRFFZWm5MSEppSk8wNUts?=
 =?big5?B?RDQxMG1UNjNYdkxkYlFjY0ErZWdCZzBOK3NuYUFqUG5kOURtT0VoR09qcFU5YllO?=
 =?big5?B?b0cxaVdIVnF5RlNqQktXZTVrOGlIL2pmTU1MYWc0VTFtUU5ocVhUaFRyWHl4b1NE?=
 =?big5?B?UWtjQitHQ1Bva0lCc1kzeDhJUHh3SlJyemU5THcwdmlqNFJWT3Q2RjZPZUhKUTBW?=
 =?big5?B?azRwQmxZSmNTZ2xuU2wwdHIwWWtoQ2F2SmZMZExvNFFKNkRtZ21ZQ3dwUk82UUV1?=
 =?big5?B?WTRId1pjOUI2VnF1WTVHTUZvMjBWdHU5SjFkVEdoaDRVSi8vdkRTSTlWSFRVUktr?=
 =?big5?B?UWhidkd5YXZtY0NrNWwxR0VEKy96ZDBlc2lmNnNpMmtXWGxNODhkNnh2UHBlMG1I?=
 =?big5?B?YTRXVTV0VXAyaHNXZ0ZwcEdHQUM1OTc1bnArYk5TaDNHNXFrWlp3a3NUcTRma3h2?=
 =?big5?B?d05xdGl0WUY4T1N1aktzOTB0MFJseXQxcHJxQ2w3Yi8vcnBjVEZ0dXJNNkN2WmRX?=
 =?big5?B?dEY5YTBKaTVlOGJ4a1o5aHZHM092c05kSmhteE5QbEJTb3F5VVhWdW0wVS81SEg1?=
 =?big5?B?VEk5eCtFOHlzM1h6N3FucllFVXVYZnlCa0krT0VGMS9OWGFWOGRqNTN1MktjamEy?=
 =?big5?B?bGFHMUROdWZRNE53MUZpSG14dm9LSlZ4c2ZzVHIyUXExdmc1dmYxbEI2eWNnZXlL?=
 =?big5?B?NnZwbit2d1J2S3pzMS85S0tRbWlic2F3TFljMEVFYW9UVjJ1dlp1S2ppWUptS2pX?=
 =?big5?Q?V921CAaDAaDuny0fRVrajb2ylrk+MWWrZ1qhOtCvzYqxbQ6p?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB233989F62E1F9CE2C61AC99B8F579HK0PR04MB2339apcp_"
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2339.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce62272f-d2ba-4296-7378-08d9112742ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2021 07:10:56.7911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LI0R+tem9czLxQLsJRGI5963JqOM1hLj8m7ASgyD+Ivg7vmShLvYi5+EIzMfVkeInmTXPzrhAeTnaWnApdK1unQSqkk1g8EzsD/L35FsoBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2865
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
Cc: Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB233989F62E1F9CE2C61AC99B8F579HK0PR04MB2339apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQW5kcmV3LA0KDQpXZSBhbHJlYWR5IGZpeCB0aGUgcGF0Y2ggZXJyb3IgZm9yIHBob3NwaG9y
LWh3bW9uLCBjb3VsZCB5b3UgaGVscCBwcm9jZWVkIHRvIGpvaW4gdGhlIHF1YW50YS9nYnMgdG8g
Q0kgYnVpbGQgPw0KDQpUaGFua3MgYSBsb3QuDQoNCkJlc3QgUmVnYXJkcw0KR2VvcmdlIEh1bmcN
Cg0KDQpIaSBBbmRyZXcsDQoNCkl0IGxvb2tzIGxpa2UgaXQncyBkdWUgdG8gbXkgcGF0Y2ggdG8g
cGhvc3Bob3ItaHdtb24gKHdoaWNoLCB0aGUgcmVwbyBpcyBnb2luZyB0aHJvdWdoIHNvbWUgb3Zl
cmhhdWwgYW5kIGlzIGNhdXNpbmcgY29uZmxpY3RzIHdpdGgpLiBUaGUgcGF0Y2ggaW4gcXVlc3Rp
b24gaXMgaW4gdGhlIHByb2Nlc3Mgb2YgZ2V0dGluZyB1cHN0cmVhbWVkIGFuZCB0aGUgcmVwbyBp
cyBzZXR0bGluZyBkb3duLCBzbyBJJ2xsIHBpbmcgeW91IG9uIERpc2NvcmQgb25jZSBpdCBsb29r
cyByZWFkeSB0byBiZSB0cmllZCBhZ2FpbiAoaG9wZWZ1bGx5IGJ5IGVuZCBvZiB0aGUgd2Vlayku
DQoNClRoYW5rcywNCkJyYW5kb24NCg0KT24gVGh1LCBNYXkgNiwgMjAyMSBhdCA2OjM4IEFNIEFu
ZHJldyBHZWlzc2xlciA8Z2Vpc3NvbmF0b3JAZ21haWwuY29tPG1haWx0bzpnZWlzc29uYXRvckBn
bWFpbC5jb20+PiB3cm90ZToNCg0KDQoNCk9uIE1heSA1LCAyMDIxLCBhdCAyOjM3IFBNLCBCcmFu
ZG9uIEtpbSA8YnJhbmRvbmtpbUBnb29nbGUuY29tPG1haWx0bzpicmFuZG9ua2ltQGdvb2dsZS5j
b20+PiB3cm90ZToNCg0KSGkgQW5kcmV3LA0KDQpgZ2JzYCBtYWNoaW5lIHdpbGwgcHJvdmlkZSBt
ZXRhLWdvb2dsZSBjb3ZlcmFnZSwgc28gaXQgd291bGQgYmUgZ3JlYXQgaWYgYGdic2AgY291bGQg
YmUgYWRkZWQgaW4gYWRkaXRpb24gdG8gYGdzamAgaW5zdGVhZCBvZiBhcyBhIHJlcGxhY2VtZW50
Lg0KDQpJcyB0aGVyZSBhIHNob3J0YWdlIG9mIE9wZW5CTUMgQ0kgbm9kZXMgYnkgYW55IGNoYW5j
ZT8gR29vZ2xlIGhhcyBiZWVuIHByb3ZpZGluZyAyIG9mIHRoZSBPcGVuQk1DIENJIG5vZGVzLCBz
byBpdCB3b3VsZCBiZSBncmVhdCBpZiBhZGRpbmcgYGdic2AgY291bGQgY291bnQgdG93YXJkcyBv
bmUgb2YgdGhvc2UgQ0kgbm9kZXMuDQoNClllcCwgZ29vZ2xlIGRvbmF0ZXMgdHdvIHNlcnZlcnMg
c28gc291bmRzIGdvb2QuIEkgYWRkZWQgaXQgdG8gb3VyIGRhaWx5IGJ1aWxkIG9mIG1hc3RlciBh
bmQgaXQgbG9va3MgbGlrZSBpdCBoaXQgYSBidWlsZCBpc3N1ZS4gV2UgY2FuIGNvb3JkaW5hdGUg
aW4gZGlzY29yZCBpZiB5b3UgbGlrZSBidXQgb25jZSB3ZSBnZXQgdGhpcyBmaWd1cmVkIG91dCwg
SaGmbGwgYWRkIGl0IHRvIHRoZSBtYWluIG9wZW5ibWMvb3BlbmJtYyBDSSBqb2IuDQoNCmh0dHBz
Oi8vamVua2lucy5vcGVuYm1jLm9yZy9qb2IvbGF0ZXN0LW1hc3Rlci8yMzEvbGFiZWw9ZG9ja2Vy
LWJ1aWxkZXIsdGFyZ2V0PWdicy9jb25zb2xlPGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3Rl
Y3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmplbmtpbnMub3BlbmJtYy5vcmcl
MkZqb2IlMkZsYXRlc3QtbWFzdGVyJTJGMjMxJTJGbGFiZWwlM0Rkb2NrZXItYnVpbGRlciUyQ3Rh
cmdldCUzRGdicyUyRmNvbnNvbGUmZGF0YT0wNCU3QzAxJTdDR2VvcmdlLkh1bmclNDBxdWFudGF0
dy5jb20lN0M1ZGFhNDYzODRiNGU0Y2ViZjdmOTA4ZDkxMGE0ZWZiNiU3QzE3OWIwMzI3MDdmYzQ5
NzNhYzczOGRlNzMxMzU2MWIyJTdDMSU3QzAlN0M2Mzc1NTkxMjI4NDMzNzA2NDMlN0NVbmtub3du
JTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRp
STZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZzZGF0YT11RnYwaDJhSHdTVmxPVTZvMzMw
cFQ5aG5STzlpNWZZYzIxblVIMVkzbHk0JTNEJnJlc2VydmVkPTA+DQoNCg0KDQpUaGFuayB5b3Us
DQpCcmFuZG9uDQoNCk9uIFdlZCwgTWF5IDUsIDIwMjEgYXQgMTA6NTQgQU0gUGF0cmljayBWZW50
dXJlIDx2ZW50dXJlQGdvb2dsZS5jb208bWFpbHRvOnZlbnR1cmVAZ29vZ2xlLmNvbT4+IHdyb3Rl
Og0KT24gV2VkLCBNYXkgNSwgMjAyMSBhdCA2OjI1IEFNIEFuZHJldyBHZWlzc2xlciA8Z2Vpc3Nv
bmF0b3JAZ21haWwuY29tPG1haWx0bzpnZWlzc29uYXRvckBnbWFpbC5jb20+PiB3cm90ZToNCj4N
Cj4NCj4NCj4gPiBPbiBNYXkgNSwgMjAyMSwgYXQgMToyNiBBTSwgR2VvcmdlIEh1bmcgKKx4qb63
cSkgPEdlb3JnZS5IdW5nQHF1YW50YXR3LmNvbTxtYWlsdG86R2VvcmdlLkh1bmdAcXVhbnRhdHcu
Y29tPj4gd3JvdGU6DQo+ID4NCj4gPiBIaSBBbmRyZXcgR2Vpc3NsZXIsDQo+ID4NCj4gPiBXZSBo
YXZlIHBvcnRlZCBtYW55IE9wZW5CTUMgZmVhdHVyZXMgdG8gcXVhbnRhL2dicyBtYWNoaW5lIChO
dXZvdG9uIEJNQyBwbGF0Zm9ybSkgYW5kIGhvcGUgaXQgY291bGQgYmUgYWRkZWQgdG8gQ0kgYnVp
bGQsIGNvdWxkIHlvdSBoZWxwIGFkZCBxdWFudGEvZ2JzIG1hY2hpbmUgdG8gQ0kgYnVpbGQgdmVy
aWZpY2F0aW9uID8gKEknbSBub3QgZmFtaWxpYXIgd2l0aCB0aGlzLCBpZiB0aGVyZSdzIGFueXRo
aW5nIHdlIG5lZWQgdG8gZG8gZmlyc3QsIHBsZWFzZSBsZXQgdXMga25vdykNCj4NCj4gSGV5IEdl
b3JnZSwNCj4NCj4gR2V0dGluZyBhIG5ldyBzeXN0ZW0gaW50byBDSSBkb2VzbqGmdCBoYXZlIHRo
ZSBtb3N0IGRlZmluZWQgcHJvY2VzcyBidXQNCj4gSSB0aGluayBpbiBnZW5lcmFsIGl0IGhhcyB0
byBmYWxsIHVuZGVyIG9uZSBvZiB0aGVzZSBkdWUgdG8gb3VyIGNvbnN0cmFpbnRzDQo+IGluIGNv
bXB1dGUgcG93ZXIgZm9yIENJOg0KPg0KPiAxKSBQcm9wb3NlIGFuIGV4aXN0aW5nIHN5c3RlbSBp
biBDSSB0byByZXBsYWNlIChhbmQgdGhlIGJlbmVmaXRzIG9mIHRoYXQpDQo+IDIpIERvbmF0ZSBh
IGplbmtpbnMgY29tcHV0ZSBub2RlIHRvIG9wZW5ibWMgQ0kNCj4gMykgQ29udmluY2UgdGhlIGNv
bW11bml0eSB0aGF0IHlvdXIgc3lzdGVtIHByb3ZpZGVzIGFkZGl0aW9uYWwgbWV0YS0qDQo+ICAg
ICBsYXllciBjb3ZlcmFnZSAob3Igc29tZSBvdGhlciBjcml0aWNhbCBiZW5lZml0KSB0aGF0IHdv
dWxkIGJlIHdvcnRoDQo+ICAgICB0aGUgYWRkaXRpb25hbCBoaXQgdG8gdGhlIGV4aXN0aW5nIENJ
IGluZnJhc3RydWN0dXJlLg0KPg0KPiBXZSBjdXJyZW50bHkgaGF2ZSBhIKGnZ3Nqoaggc3lzdGVt
IGluIENJLiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIHJlcGxhY2UNCj4gaXQgd2l0aCB0aGlzIG5l
dyChp2dic6GoIG1hY2hpbmU/DQoNCkp1bXBpbmcgb24gdGhpcyB0aHJlYWQgdG8gc2F5IHRoYXQg
SSdtIGhvcGluZyB0byBoYXZlIHF1YW50YS1nYnMNCnN1cHBvcnQgaW4gdXBzdHJlYW0gcWVtdSBz
aG9ydGx5IC0tLSBzbyB3ZSBjb3VsZCBhbHNvIGVuYWJsZSB0aGlzIGFzIGENClFlbXUgQ0kgbWFj
aGluZS4NCg0KPg0KPg0KPiA+DQo+ID4NCj4gPiBUaGFua3MgYSBsb3QuDQo+ID4NCj4gPiBCZXN0
IFJlZ2FyZHMNCj4gPiBHZW9yZ2UgSHVuZw0KPiA+DQo+DQoNCg==

--_000_HK0PR04MB233989F62E1F9CE2C61AC99B8F579HK0PR04MB2339apcp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"\@MS PGothic";}
@font-face
	{font-family:"\@Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"MS PGothic",sans-serif;
	mso-fareast-language:JA;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"MS PGothic",sans-serif;
	mso-fareast-language:JA;}
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
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW">Hi Andrew,
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW">We already fix the patch e=
rror for phosphor-hwmon, could you help proceed to join the quanta/gbs to C=
I build ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW">Thanks a lot.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif">Best Regards<br>
George Hung<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Andrew,<o:p></o:p></span></p=
>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">It looks like it's due to my pa=
tch to phosphor-hwmon (which, the repo is going through some overhaul and i=
s causing conflicts with). The patch in question is in the process&nbsp;of =
getting upstreamed and the repo is settling
 down, so I'll ping you on Discord once it looks ready to be tried again (h=
opefully by end of the week).<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Brandon<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Thu, May 6, 2021 at 6:38 AM =
Andrew Geissler &lt;<a href=3D"mailto:geissonator@gmail.com">geissonator@gm=
ail.com</a>&gt; wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
<br>
<o:p></o:p></span></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On May 5, 2021, at 2:37 PM, Bra=
ndon Kim &lt;<a href=3D"mailto:brandonkim@google.com" target=3D"_blank">bra=
ndonkim@google.com</a>&gt; wrote:<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Andrew,<o:p></o:p></span></p=
>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">`gbs` machine will provide meta=
-google coverage, so it would be great if `gbs` could be added in addition =
to `gsj` instead of as a replacement.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is there a shortage of OpenBMC =
CI nodes by any chance? Google has been providing 2 of the OpenBMC CI nodes=
, so it would be great if adding `gbs` could count towards one of those CI =
nodes.<o:p></o:p></span></p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Yep, google donates two servers=
 so sounds good. I added it to our daily build of master and it looks like =
it hit a build issue. We can coordinate in discord if you like but once we =
get this figured out, I=A1=A6ll add it to
 the main openbmc/openbmc CI job.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://apc01.safeli=
nks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fjenkins.openbmc.org%2Fjob%2=
Flatest-master%2F231%2Flabel%3Ddocker-builder%2Ctarget%3Dgbs%2Fconsole&amp;=
data=3D04%7C01%7CGeorge.Hung%40quantatw.com%7C5daa46384b4e4cebf7f908d910a4e=
fb6%7C179b032707fc4973ac738de7313561b2%7C1%7C0%7C637559122843370643%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;sdata=3DuFv0h2aHwSVlOU6o330pT9hnRO9i5fYc21nUH1Y3ly4%3D&=
amp;reserved=3D0" target=3D"_blank">https://jenkins.openbmc.org/job/latest-=
master/231/label=3Ddocker-builder,target=3Dgbs/console</a><o:p></o:p></span=
></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
<br>
<o:p></o:p></span></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you,<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Brandon<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed, May 5, 2021 at 10:54 AM=
 Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank=
">venture@google.com</a>&gt; wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed, May 5, 2021 at 6:25 AM =
Andrew Geissler &lt;<a href=3D"mailto:geissonator@gmail.com" target=3D"_bla=
nk">geissonator@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt; On May 5, 2021, at 1:26 AM, George Hung (</span><span lang=3D"JA"=
>=ACx=A9=BE=B7q</span><span lang=3D"EN-US">) &lt;<a href=3D"mailto:George.H=
ung@quantatw.com" target=3D"_blank">George.Hung@quantatw.com</a>&gt; wrote:=
<br>
&gt; &gt;<br>
&gt; &gt; Hi Andrew Geissler,<br>
&gt; &gt;<br>
&gt; &gt; We have ported many OpenBMC features to quanta/gbs machine (Nuvot=
on BMC platform) and hope it could be added to CI build, could you help add=
 quanta/gbs machine to CI build verification ? (I'm not familiar with this,=
 if there's anything we need to do first,
 please let us know)<br>
&gt;<br>
&gt; Hey George,<br>
&gt;<br>
&gt; Getting a new system into CI doesn=A1=A6t have the most defined proces=
s but<br>
&gt; I think in general it has to fall under one of these due to our constr=
aints<br>
&gt; in compute power for CI:<br>
&gt;<br>
&gt; 1) Propose an existing system in CI to replace (and the benefits of th=
at)<br>
&gt; 2) Donate a jenkins compute node to openbmc CI<br>
&gt; 3) Convince the community that your system provides additional meta-*<=
br>
&gt;&nbsp; &nbsp; &nbsp;layer coverage (or some other critical benefit) tha=
t would be worth<br>
&gt;&nbsp; &nbsp; &nbsp;the additional hit to the existing CI infrastructur=
e.<br>
&gt;<br>
&gt; We currently have a =A1=A7gsj=A1=A8 system in CI. Would it make sense =
to replace<br>
&gt; it with this new =A1=A7gbs=A1=A8 machine?<br>
<br>
Jumping on this thread to say that I'm hoping to have quanta-gbs<br>
support in upstream qemu shortly --- so we could also enable this as a<br>
Qemu CI machine.<br>
<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks a lot.<br>
&gt; &gt;<br>
&gt; &gt; Best Regards<br>
&gt; &gt; George Hung<br>
&gt; &gt;<br>
&gt;<o:p></o:p></span></p>
</blockquote>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_HK0PR04MB233989F62E1F9CE2C61AC99B8F579HK0PR04MB2339apcp_--
