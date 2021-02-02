Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA8F30B4C8
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 02:39:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV6tv19h1zDqbC
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 12:39:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=660605f9e=fran.hsu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=Y3u+Mwjm; 
 dkim-atps=neutral
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DV6t04LlfzDqNp
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 12:39:00 +1100 (AEDT)
IronPort-SDR: UcaMyv256FYVDC7bOguBCChXEI96r1W2LKsaVdcpiRkjmZsUtHLIa2ml3t4dsXTTccYmS3/yAL
 JU6ovlILFdwQ==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx02.quantatw.com with ESMTP; 02 Feb 2021 09:38:58 +0800
Received: from mailbx06.quanta.corp (10.243.91.101) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 2 Feb 2021
 09:38:57 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (104.47.124.52)
 by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Tue, 2 Feb 2021 09:38:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QY+Owi/pXpIzEhbWDuQ8oIHZ5IKAbi3Dvvv/HSuIXC7BTUB9rz6djINwr1uA/RxQotsDCU4uVxN/31Ng7aLgja/lUU3JCqaI8LT9IkP+46gHjEnpY+hoAanvKJNCV3lYTdfSi3lYYQtx086XsPueRz10c5L3u1Weh+H6AF3z6u9nFYANDWBPFA0qYxvzn8WY4oCuBxgvpSrY7SSveE+cfadGgLe6ptdskeS1em4YSBq6qH6lhOTGxazFDxQwXkwVIqILJS//k1V5IvSeDfAeSVP4UEIdpT+f5SInC1II9+0OODdDH//2w0dHAjS9RkN10CwoFyWlx9URs1MIbyk7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MP3m6hWkoCDkt7wFMKw4385QyPxx3gt+BHnfdo/SUMo=;
 b=Q9Ys0XVRmmM2CRnE/RnP0UFM26YP9sMm/1oF515yEqY2haWfoYznoHc3JEch0d0+gzEREO3uCzh56zQFIC6eW4u7diNBP/3eYSWxOc5adGxvMfdBMw0pmk01Mtlb+/s16gGW4Kzql8VnM3ufrxrnmC4kRj7F9nSXCjg/Liz2UVMPf9ww9mWsvU1dpEHUKYqIyq37i6EkN+nFNH5PFeDi7X7k7oPZ9K38Y/I6jIQSISHKOqiAPZL8vTBx6a6yrL1N2cHu7UMMxB5zDBtaFpdc3Yj7JRy9160q6pSa/qpQ8jvg+EHgHQGoFkKo8yD/zBbplgZ7Rhtr+G62QHk4OHq6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MP3m6hWkoCDkt7wFMKw4385QyPxx3gt+BHnfdo/SUMo=;
 b=Y3u+MwjmsZ41kx3li03JGw8OA5d3062dE9CAAPfJ1N1LZpSSuG5Wuj4rMI9RdojkeTINXL9Ojy1z7O+oUC0FK0+UO3G4VUmK/bHBZgMh61BUVAIQ0Kay+XBV/a+LAi7u2bem9Y5dg7Gu/RNsAEVyu9E6Uoz/+EGtHiHY/quRLPI=
Received: from TYZPR04MB4366.apcprd04.prod.outlook.com (2603:1096:400:2c::13)
 by TYZPR04MB4287.apcprd04.prod.outlook.com (2603:1096:400:24::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Tue, 2 Feb
 2021 01:38:56 +0000
Received: from TYZPR04MB4366.apcprd04.prod.outlook.com
 ([fe80::c13:c6c3:a6a3:29d1]) by TYZPR04MB4366.apcprd04.prod.outlook.com
 ([fe80::c13:c6c3:a6a3:29d1%6]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 01:38:56 +0000
From: =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: dbus-broker caused the system OOM issue.
Thread-Topic: dbus-broker caused the system OOM issue.
Thread-Index: Adb5AUObMwVPeTs5QJC4Evp5OV1wlg==
Date: Tue, 2 Feb 2021 01:38:56 +0000
Message-ID: <TYZPR04MB43666E803D310720362F0CD4F3B59@TYZPR04MB4366.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08aa28aa-093d-414a-5f9d-08d8c71b4e65
x-ms-traffictypediagnostic: TYZPR04MB4287:
x-microsoft-antispam-prvs: <TYZPR04MB4287140ADFBC76BFEF7E87E8F3B59@TYZPR04MB4287.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N64r70tMp0zgUdfAsNNe+9FhL1YAhPlxeFNQINKD9zdVO2fAaizPlUq8W5LPEqONi20ZrpUpuyw3KE2Uk9mTeavDwWrzk7iAhTOQ24tW442OpQ/Oe1cIvnVBE+JNgcIu9ajqvg64H3RmlMDlVEJtznym86DskqbCX0tYfMB10jnAqJbjZJmTYYleq4vgKdLLiBPlBV10q7eC3BWd+PONXlr3O4FUZNg44iC6XTuej2bXujf6GBbemV49UZxkqabxUMyk6pJdbXGraI/O93nsR/pvW6Q/Na8wDefZMDPkQY+z3K/zHGC51/+bk5ZuL/Sq1AkgJESp9kuEvz24Z2S93MM4rWvKtJLDwj3ZWZilX+8UXcP8UT7zlUslAkYIBxN7MnEgwkYlHccQl7NYidPkNTuBqt37Byn5ecO1NOIvGdogUVRs+o52ziUZuoOAnbxIhFkQu8f/cISoiesQ6Mzk9fJVQSX1CuIzgK161IVheES6YFvwC6uf5HlkAKQ23ycZk4IlThF8TgHfv7PUciuT8g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR04MB4366.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(8676002)(66946007)(52536014)(33656002)(478600001)(7696005)(71200400001)(8936002)(66476007)(66446008)(66556008)(64756008)(76116006)(5660300002)(83380400001)(6916009)(2906002)(85182001)(186003)(9686003)(55016002)(6506007)(26005)(86362001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?NzhEQUpockVGZzBYaTFZaUYwNHFkYXIxNG14UUNuMDdUaVpWZ3dtNzZramEvaTRO?=
 =?big5?B?cjUvanFOZHl1WnpsUmR2RVFPU1M3WDYyZEhmZ2pjSC9DKy9CV2ZiLzR3anp4dnl0?=
 =?big5?B?d0dKUi9oR091WTI0a3lxV245K3lLdGxVdUw5ZFF6dS9Kc3dwYVZjYktrNGJySFhV?=
 =?big5?B?a25LTzl4cmxuWGlnWEJPU0FnejBLMjFBdjh1b2ZsekJZcFphYkQ1NHRla3BmY0k3?=
 =?big5?B?SWw2aFMvb2hhU1Q3MXMvYWZOSDlZZS9YT2ZOVHpwYkR0NnBwOHhSMjUrU010YlJT?=
 =?big5?B?SXkyNG1GYUNKSDh0QkgrQ3V5WkU5bEt0MHhEM1Z2T1hqSWF6OFRUWEp6SGFWTHJy?=
 =?big5?B?SHE2c1RjSkw4V2ZGOWJSZTdYeEZ4NzZvcDg1aHBXbmg2NUk4OUtRdXZnZE5SSXdn?=
 =?big5?B?enlyQjBGNGpwV0hTQ0xSMGJ5Tno3UkZjM2RUeXNJTEYwTlRHaUJwNllJTFlFdm9I?=
 =?big5?B?aWRCYWZiRjcxdW9RYWtEUGJ0SG9NMmFyemFsMnVDV0pkS1d4cVpWZ0hBOVNmanBI?=
 =?big5?B?RDhXeWNsQXVKckRTRGVWUmN2eFdPWjFSbkNFTlNLMW1XSlVzRW9ibCtGVEJpUy9m?=
 =?big5?B?RWozMW5uamFrQ0NxM2x5TEFLeWVtTEl5RWZWSGF4S2JQWGpicVM4elE0RkdqYjZ0?=
 =?big5?B?aXZQNXJYdTREN3hBMEdEbHNCTW1YaHVRVTFXc0RxT21QZUdmNmlWdFFyeXpIVnFH?=
 =?big5?B?MGxMZWhyTnFadDZNdGluZWM0WjRyRUJuY2xaNHNYV0xDSFg3MFZSaWZCZVhxZXVK?=
 =?big5?B?S25sMy9KZmpPNm9hN3R3akFubHZ2cFVBOGNzZ2x1d3p5Z1VpditwaUtXQWthaVNn?=
 =?big5?B?Zko0Z3JhUEp2VFpYUjhpUjUzczZsOGlpNEpRcVFXN0N3WmlYNnhwZkdxRWFndms5?=
 =?big5?B?T0k2RUs2QzlvT2EwdXpNMGdyL21CekZIY05PWHJ3MG5CcnJPYS80NEtoeDMzd3Qz?=
 =?big5?B?dnlOaXhHUi9iNFlVaUZOWmhrR1lrWkFYVHQyWEZTaktwdXBTaDhuTEpkdU9UbE41?=
 =?big5?B?b0Q4YWg4QWNQOUJyVktTMFRqdnRRZ2VWcTBSc1ovcm9zYldRVE9iVDdkeGUyWDNZ?=
 =?big5?B?SkFwblVZYnA4MWJ0Wm50cnNEa1dOK3A5NXZNRGQ1ZFhLa2VnbWZHM1JFaVVsTTI5?=
 =?big5?B?L1dtSkMzYTZxa1pPNVg0T3AvNzNyWk42MlNPb0xKdjBZOTg4bUhzNTUySHRXWi9r?=
 =?big5?B?Q28rZG1RM1ZpOXBmQ3lOMzVkcE40TEZWKzJzTE9kQkFDWThsVXVFZFBjNjZiZ2Ev?=
 =?big5?B?U05DUlhhL2J1Qy9WQWRvUE9UNDF1aEgxQ000OVROSEZybkYrOGNweU00QUd4SGI5?=
 =?big5?Q?LEIRADLvIb2fAnKuUUBITXePIsDXxT6O?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB4366.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08aa28aa-093d-414a-5f9d-08d8c71b4e65
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 01:38:56.5160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TBUX5g4D/I7EGe0G7g65Ogc+cFMR8j5PdGs01v42P3sw7IdGXfCm8VdUN9a60O+HnH++GDnBeAgfynI41NcUPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4287
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

SGVsbG8sDQoJU29tZXRpbWVzIG15IEJNQyB3aWxsIHJ1biBvdXQgb2YgbWVtb3J5IHNvIHRoYXQg
SSB0cnkgdG8gZmluZCBvdXQgd2hpY2ggcHJvY2VzcyBjYXVzZWQgdGhlIE9PTSBpc3N1ZS4NCkZy
b20gdGhlIGh0b3AgaW5mb3JtYXRpb24sIGl0IGxvb2tzIGxpa2UgdGhlIGRidXMtYnJva2VyIHVz
ZXMgaHVnZSBtZW1vcnkgc3BhY2UuDQpXaGF0IEknbSBkb2luZyBpcyB0byBzZW5kIHRoZSBpcG1p
IHNkciBsaXN0IGNvbW1hbmQgZnJvbSBIb3N0IE9TIHRocnUgdGhlIGtjcyBpbnRlcmZhY2UgZXZl
cnkgMiBzZWNvbmRzLg0KSW4gdGhlIGJlZ2dpbmcsIEkgY291bGQgc2VlIHRoZSBkYnVzLWJyb2tl
ciB1c2VzIHVwIHRvIDQwME1CIGFuZCB0aGVuIHJlZHVjZWQgdG8gbGVzcyB0aGFuIDEwME1CLg0K
QnV0IGFmdGVyIHNvbWUgaG91cnMgSSBjb3VsZCBzZWUgdGhlIG1lbW9yeSB1c2FnZSBrZWVwIGlu
Y3JlYXNpbmcgYW5kIHRoZSBkYnVzLWJyb2tlciBjYXVzZWQgc3lzdGVtIE9PTSBldmVudHVhbGx5
Lg0KDQogIDEgIFt8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fCAgICAgICAgICA2Ny4x
JV0gICBUYXNrczogMTA0LCAyMCB0aHI7IDIgcnVubmluZw0KICAyICBbfHx8fHx8fHx8fHx8fHx8
fHx8fHx8fHx8fHx8fHx8ICAgICAgICAgICAgNjAuNCVdICAgTG9hZCBhdmVyYWdlOiAzLjEyIDMu
MzQgMy41NA0KICBNZW1bfHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fDk2OU0v
MTAwM01dICAgVXB0aW1lOiAxMjo1OToxMg0KICBTd3BbICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMEsvMEtdDQoNCiAgUElEIFVTRVIgICAgICBQUkkgIE5JICBWSVJU
ICAgUkVTICAgU0hSIFMgQ1BVJSBNRU0lICAgVElNRSsgIENvbW1hbmQNCiAgMjgxIG1lc3NhZ2Vi
dSAgMjAgICAwICA4NzBNICA4NjhNICAgMzc2IFMgIDAuNiA4Ni42IDQwOjU0LjMyIGRidXMtYnJv
a2VyIC0tbG9nIDQgLS1jb250cm9sbGVyIDkgLS1tYWNoaW5lLWlkIDkzMmMNCiAgMjY1IG1lc3Nh
Z2VidSAgMjAgICAwICAyNTlNICAgMjg0ICAgICA0IFMgIDAuMCAgMC4wICAwOjAwLjM0IC91c3Iv
YmluL2RidXMtYnJva2VyLWxhdW5jaCAtLXNjb3BlIHN5c3RlbSAtLWF1ZGl0DQoNClZlcnNpb246
DQoJZGJ1cy1icm9rZXIgOjI1LXIwDQoNCkknZCBhcHByZWNpYXRlIGFueSBjb21tZW50cyBvciBm
ZWVkYmFjay4NCg0KVGhhbmtzLA0KRnJhbiBIc3UNCkUtTWFpbCA6IEZyYW4uSHN1QFF1YW50YVRX
LmNvbQ0KVGVsOiArODg2LTMtMzI3LTIzNDUgRXh0OiAxNjkzNQ0KDQoNCg==
