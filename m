Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D10FA33EE2E
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 11:17:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0mLF5bmXz30HC
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 21:17:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=zszUkb6z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=7038210d8=bruce_lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=zszUkb6z; 
 dkim-atps=neutral
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F0mKy6Chlz30Gn
 for <openbmc@lists.ozlabs.org>; Wed, 17 Mar 2021 21:17:08 +1100 (AEDT)
IronPort-SDR: q7cC1V4YG8yg/JNAAk+U3Qxk3vPZ3SMTCj3Xh9tf2+f0CF3M1i/HQsRMM9YwDR8BSIfLrK93ng
 tNl81F5eNMwg==
Received: from unknown (HELO mailbx10.quanta.corp) ([10.243.91.107])
 by mx01.quantatw.com with ESMTP; 17 Mar 2021 18:17:06 +0800
Received: from mailbx10.quanta.corp (10.243.91.107) by mailbx10.quanta.corp
 (10.243.91.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 17 Mar
 2021 18:17:05 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (10.243.91.252)
 by mailbx10.quanta.corp (10.243.91.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Wed, 17 Mar 2021 18:17:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eA/jyjXxUosj+9gpbQB7zho+qjvFeKvCSR+CrG7seyjab/PpQFuL+VDUNehr/jyFndYxrTkrYIo4fKIZWbO2v+L+J5h5GwIc5JmA1j+PYoNMOn50WVBVGsWEsLpex2uoDaePgx/LF21NCXhSTs4EtIwI9upZeQLbJt0FP3COiETTel4VB9o5vv6oerYLaH4Sd4Ry0lXc2y7rjOuYXeztcOux22t8N/fd65gI/4iYVGDJ2t9VLZ8bAYx92uAb0OQVVVVTnmcBPPKlcEjZC2Pn36jt3SOwhw2ELSxi7n9yn0Yl7TUTfy49rW6oZ7VTOFxjwQwnrGkoc7mfs8gTqDv0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04GmtkvLB/nYKoCBJrzGR0wHSPZXAseytR6zo/tQVRA=;
 b=LbacEZkBJ3e43WCywiqSGAV8wpxDqKCntnrah/coMAz96aI8E9qi+9HXfG8Oysf7dcDnAVgXzjLbZKrtAqDLAgVzBQHA136Un3krsY+R8NDaBh1qUJ321EGVa23xfYUKUwJwztSlPJzJyU1FuhQGBCL6XIZ7xwzi/QEcwUSsFctZJnXYIOjJNJGL8SVg42rvuFFDA9BSJwWRcGuOoyZ8GNIFUSA+0WrnaJ42t1zRLjochsT0mUpVAABd88E6TWDikj44Yqqw9/HXZ8fWX+lSkZcq8MXRZvdZ/K5c5wvdhlhsXdXh8aahZ5wcr4W/+3XF/c5Wno8ykmuJxe6eg/hLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04GmtkvLB/nYKoCBJrzGR0wHSPZXAseytR6zo/tQVRA=;
 b=zszUkb6zjwOqbo52SkSV2q8ovrG07+aA4R+vE4wvkBwORBjWHeGRLS/CGGy/Z+Jk97/JZjNDikoVrexKZud9NvXJGRoe2Y7Oeetbi0GueQzBlPNCBwdMhkSYpBcsVDwAypU7Wa4xZSo9rmgPoTBta/rp/vzonB/i/W1GfgvW3PU=
Received: from PSAPR04MB4231.apcprd04.prod.outlook.com (2603:1096:301:30::14)
 by PU1PR04MB2245.apcprd04.prod.outlook.com (2603:1096:803:38::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 10:17:04 +0000
Received: from PSAPR04MB4231.apcprd04.prod.outlook.com
 ([fe80::14f2:e35d:83dd:b1d]) by PSAPR04MB4231.apcprd04.prod.outlook.com
 ([fe80::14f2:e35d:83dd:b1d%3]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 10:17:04 +0000
From: =?big5?B?QnJ1Y2UgTGVlICin9an7rm0p?= <Bruce_Lee@quantatw.com>
To: Ed Tanous <edtanous@google.com>
Subject: RE: Fan PWM settings via Redfish
Thread-Topic: Fan PWM settings via Redfish
Thread-Index: AdcXBohhddGEWoHGTx2Ra27x5j+YSgAYD04AALgeQpAADBXUgAAnSg2A
Date: Wed, 17 Mar 2021 10:17:03 +0000
Message-ID: <PSAPR04MB42315FBEF04B03F2CC4C38D3F86A9@PSAPR04MB4231.apcprd04.prod.outlook.com>
References: <PSAPR04MB423111B8AD11A19255C79215F86F9@PSAPR04MB4231.apcprd04.prod.outlook.com>
 <CAH2-KxAf2H2KXcFM2FkmaOdaxLdcSPWWnwe4uapt3DZzT9=3tA@mail.gmail.com>
 <PSAPR04MB42319855C13384AA43CEBE48F86B9@PSAPR04MB4231.apcprd04.prod.outlook.com>
 <CAH2-KxAgikHVL8yg59e_VnmSxAyEe_AXsR4CiP_JpKZsEWNDuQ@mail.gmail.com>
In-Reply-To: <CAH2-KxAgikHVL8yg59e_VnmSxAyEe_AXsR4CiP_JpKZsEWNDuQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d0204ca-7e7a-4451-6552-08d8e92dcfb9
x-ms-traffictypediagnostic: PU1PR04MB2245:
x-microsoft-antispam-prvs: <PU1PR04MB22457EE2AEC52B8BFE063AB5F86A9@PU1PR04MB2245.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cVYc+KJTSTztCmWrl0QI9rE2h06t4v64Qay4OztWJ/HLpSXqlkStInxSmK6tgdYOkop42lo/r1pjWJL/JvSGz7gzVzniHOKkfAk53qPI4J6irxM/2cMH4AKoy7m7bjQPN1++jgIRbK4roLPngqWINicmtpfexRz9KxvuHf+xSDa+qnEiZ4GH0Whu1+7nxEcCLXwX7Q6rhFtrKN3/5C8lAqYJy9+81sYNj+p4AaMGn+oOfrtlQ0EEo4BEQYLq+42FnDx2mEZElQNG8gTiXwVCkniVQMSjM/p2qKQxttzU85n6J+SVCmaDvJL9JJkQx65HKS7hVvZPcZKrEcnr4PTFEpoR/GQeN/etFC/QY0EhnYm+VnLXSe4mw2SUoryD3jQ2ia/wiup9lNFKWTEGYXIaVk17Vuthqs60pBettyeG40YEFa8a24Dg5a9hofEBHkBKNsCMwRyoFnxyIKyXmKxS9Ex1QYYsTKJAqu0s+iTI73px7Q3GB+75rW7JZUruGh2MjGLpIAFyi/YiBHbt7Bz0L/41JdrO9JEvH+J0hJngm57AyRweQyw7luxqw34o7ODfGX1VsyCkbSjic4e1bQ2NBTKbcnbr0TiwENY9R/g/k2JyNkcmF7IyprGe+W1/b2cegkwC0ov3Xyz2R58dzhxw1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR04MB4231.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(478600001)(30864003)(66446008)(186003)(83380400001)(54906003)(71200400001)(966005)(45080400002)(316002)(8676002)(2906002)(85182001)(9686003)(53546011)(5660300002)(52536014)(6916009)(8936002)(66946007)(7696005)(66476007)(64756008)(6506007)(4326008)(66556008)(55016002)(26005)(76116006)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?NnZwR3NCcjhHcTBpR3pPcStoVU1pUWZCSEo3cnNCVExTaFUzMk0yY05PcVQrcS9X?=
 =?big5?B?VU9lZHVKaXFoWWRkd3QwN0w3U1M2SUJIbGdWS1lsNjZTZ1hJQ1RQMXVuY1JxeFVC?=
 =?big5?B?MVp3cXRVcXd3bWk2eWNqcW14SERvd3ZLcEhxVlVWTlRwei85ZEhoQjRZSVQ2aWNa?=
 =?big5?B?K3JnaDhHMmxUY3lEYWVyS3hOOVovOTcyZXp2dFVJdVduaVhiYXk3WVp3cjJtWjAv?=
 =?big5?B?azdpWUk4QTk5SHZ1OWhxc05Ub2FMQzd1STNvMGdQKzNuQjVkQUg0WXhTZWFkS1JY?=
 =?big5?B?SUhWZFMzQjRnRFh5M0pGR2hOZE9zc01hT0I4VjdGMnpzRmRmeXovL204M1E3bGlI?=
 =?big5?B?Q29ZWmcvdytWeGxIS0lBWEVnb2NLR3pjT2ZHTWo4cnI2bEIzNW8wNTJRLzJieTBk?=
 =?big5?B?T0IwaDc3NUlzNFp6enhLMVlTTnVDcjFxYTFyeit6T3Q5NWl5ZFlaeG8xU3pibXpM?=
 =?big5?B?OCtPLytycHcrVUF6eURoaGdxN01qR0ZBMFdQcC80cFpzbUxUdGovelozVkttT2dy?=
 =?big5?B?U2s4ZXJyczEwanZlSUxyVUZFQ1NJWS8xQitCOWs0WWp0Y1VubjZkNzRxNnJMTVky?=
 =?big5?B?YmxIajE3eEtpQlBLMWlPeHRWTWN5ejVQem9mR1ZvKzVpKzhoM255Y0lQL2t5NGhq?=
 =?big5?B?NzRZK0pOdWhwNzYrQkU1WjdpeDVVQ05ScjJKRzF0WXkzMTFzaTVoQ1czUE1GUXN5?=
 =?big5?B?alJFRTlvdkdQOGJmTWJ6M1lBTUJwZEZZdVE1b2NwVGMySWVOdlRIS2xEbFZUd2I4?=
 =?big5?B?dVZqZGJ0WVlxVTB2c2xlM3R5Ykt5c0J3d2ZEVHFUT0hUUWVnUC9FUGtnSk9nTVoz?=
 =?big5?B?b20rT3RzRlNsMFZyeCtaczRZZ2xmbThxenlLYW1uU2JncUlRM0YzckxwVVgvN2Na?=
 =?big5?B?cTNFZUxJSURqUm5rOUd1NG5Gbk4vWG5GYlNnMmpORDVTaVJKYVZvbFdmSEtvM0Zs?=
 =?big5?B?UC8vSDBRancveWtTTWl2MmFubFhpN3BiVDdBOXJoUHJ3U1QrY1gwZVBwL0RLd2NI?=
 =?big5?B?MlBKY3hyTmUxMXM4UjZjVkFMalJObDhjT2JPTU5oYXRwS3BlYVYza0pEZWtQT0tv?=
 =?big5?B?Y1Y5WlBKTmJ3NDFReDJCNXU1TmM0SWpkY1Ywa0wwOFVLbzZwcWhFbVRiUVQ0Q01w?=
 =?big5?B?OG0xSGZOT3pDUW9Ua2UyVCt1ZGlMZHpDclJWZjNKbE5tSTlCMDFIcVAzTTJtM20w?=
 =?big5?B?UmhHOXEyRHdoQUQ3cXRUaW1CZjRDQ2tRTmxqMWtjN0pYdFlUZjNMa3kxajlkcUpW?=
 =?big5?B?QitaVG1hZVlrVHdRTXF0SmFRcThtYzEzbUNQOWgwRVMxeE5lT2RyODBiQUc1anRp?=
 =?big5?B?WVVZSkRPa2dzRkowWmxmZnd3N1R0MnpLSFNVdEEyV1pxdW1kMGtVaTNEbzU0amE1?=
 =?big5?B?VGIwbHBZdmRNUDliWUlHcUtCb2UvOUphUVBGVDZrWlR5aS9jN2RZc25TbWRHNzFw?=
 =?big5?B?NEkvb1M4SWtVcG5wS0lKTTBzRnJVNURJU0t2cHU0ODF5V3JWM2cyYUJzeTZRbUdF?=
 =?big5?B?cldiM0Vub1lMdXhsY3NmL1VCNzlBZWNiZDc3bEtwaXFUY0F3RUZ3MENzcTBIWldt?=
 =?big5?B?TFpiU3o2dmw1UFZqSCtwd3dJajd5VFhHTXA1UnExbDRHcGhmVmJvYWxmSktQSitD?=
 =?big5?Q?fSIRc14c9haoh/THDY6UpmlPBbmB3637wg44sk6XWQdNBXhi?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR04MB4231.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0204ca-7e7a-4451-6552-08d8e92dcfb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 10:17:03.9066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fxUzfyofGbL+JHUMUT0jhauPoqwN6Jid0fC5FNN4E9T205iB3qbN9+IkQ4P/C0gcIf64b9s5rhsZ92BZhIAW2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR04MB2245
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRWQgVGFub3VzIDxlZHRh
bm91c0Bnb29nbGUuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAxNiwgMjAyMSAxMToxOCBQ
TQ0KPiBUbzogQnJ1Y2UgTGVlICin9an7rm0pIDxCcnVjZV9MZWVAcXVhbnRhdHcuY29tPg0KPiBD
YzogTmFuIFpob3UgPG5hbnpob3VAZ29vZ2xlLmNvbT47IHJoYW5sZXlAZ29vZ2xlLmNvbTsNCj4g
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+IFN1YmplY3Q6IFJlOiBGYW4gUFdNIHNldHRpbmdz
IHZpYSBSZWRmaXNoDQo+IA0KPiBPbiBUdWUsIE1hciAxNiwgMjAyMSBhdCAyOjM1IEFNIEJydWNl
IExlZSAop/Wp+65tKQ0KPiA8QnJ1Y2VfTGVlQHF1YW50YXR3LmNvbT4gd3JvdGU6DQo+ID4NCj4g
Pg0KPiA+DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBFZCBUYW5v
dXMgPGVkdGFub3VzQGdvb2dsZS5jb20+DQo+ID4gU2VudDogU2F0dXJkYXksIE1hcmNoIDEzLCAy
MDIxIDE6NDAgQU0NCj4gPiBUbzogQnJ1Y2UgTGVlICin9an7rm0pIDxCcnVjZV9MZWVAcXVhbnRh
dHcuY29tPg0KPiA+IENjOiBOYW4gWmhvdSA8bmFuemhvdUBnb29nbGUuY29tPjsgcmhhbmxleUBn
b29nbGUuY29tOw0KPiA+IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiA+IFN1YmplY3Q6IFJl
OiBGYW4gUFdNIHNldHRpbmdzIHZpYSBSZWRmaXNoDQo+ID4NCj4gPiBPbiBUaHUsIE1hciAxMSwg
MjAyMSBhdCAxMDozNyBQTSBCcnVjZSBMZWUgKKf1qfuubSkNCj4gPEJydWNlX0xlZUBxdWFudGF0
dy5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEhpIEFsbCwNCj4gPiA+DQo+ID4gPg0KPiA+ID4N
Cj4gPiA+IFdlIGFyZSBkZXNpZ25pbmcgYW5kIGltcGxlbWVudGluZyB0aGUgRmFuIFBXTSBzZXR0
aW5ncyB2aWEgUmVkZmlzaC4gVGhlDQo+IGdvYWwgaXMgdGhhdCBjbGllbnRzIGNhbiBzZXQgc2Vu
c29yIHZhbHVlIHRvIGJtYyB2aWEgUmVkZmlzaC4NCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+
IFdlIGRpdmlkZSB0aGUgd29yayBpbnRvIHRocmVlIHBoYXNlcy4NCj4gPiA+DQo+ID4gPg0KPiA+
ID4NCj4gPiA+IFBoYXNlIDEgaXMgdG8gcmVtb3ZlIHRoZSBkZWZpbml0aW9uDQo+IKGnQk1DV0VC
X0lOU0VDVVJFX1VOUkVTVFJJQ1RFRF9TRU5TT1JfT1ZFUlJJREWhqCBhbmQgdXNlIG5ldw0KPiBk
ZWZpbml0aW9uIHRvIKGnQk1DV0VCX1NQRUNJQUxfTU9ERV9TRU5TT1JfT1ZFUlJJREWhqC4NCj4g
PiA+DQo+ID4gPiBUaGUgoadCTUNXRUJfSU5TRUNVUkVfVU5SRVNUUklDVEVEX1NFTlNPUl9PVkVS
UklERaGoIHdhcyBhZGRlZA0KPiBieQ0KPiA+ID4gSW50ZWwgZ3JvdXAsIHBsZWFzZSByZWZlciB0
bw0KPiA+ID4gaHR0cHM6Ly9hcGMwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/
dXJsPWh0dHBzJTNBJTJGJTJGZ2UNCj4gPiA+IHJyDQo+ID4gPg0KPiBpdC5vcGVuYm1jLXByb2pl
Y3QueHl6JTJGYyUyRm9wZW5ibWMlMkZibWN3ZWIlMkYlMkIlMkYzMDAwMCZhbQ0KPiBwO2RhdGEN
Cj4gPiA+ID0wDQo+ID4gPg0KPiA0JTdDMDElN0NCcnVjZV9MZWUlNDBxdWFudGF0dy5jb20lN0M2
NGExMTUzY2Q0NWI0NmVlY2E0MDA4ZDhlNQ0KPiA3ZGYzNWMNCj4gPiA+ICU3DQo+ID4gPg0KPiBD
MTc5YjAzMjcwN2ZjNDk3M2FjNzM4ZGU3MzEzNTYxYjIlN0MxJTdDMCU3QzYzNzUxMTY3NjQwNDIy
NzExDQo+IDMlN0NVbmsNCj4gPiA+IG5vDQo+ID4gPg0KPiB3biU3Q1RXRnBiR1pzYjNkOGV5SldJ
am9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGENCj4gV3cNCj4gPiA+
IGlMDQo+ID4gPg0KPiBDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9ZjYwNFBpejF2RGZJ
dERaM2RvY1pPUGZyeUplc2F2a2JPdw0KPiBoS3kNCj4gPiA+IHdKDQo+ID4gPiBvWGxVJTNEJmFt
cDtyZXNlcnZlZD0wLA0KPiA+ID4NCj4gPiA+IFRoZSBJbnRlbCBzb2x1dGlvbiBoYXMgNCBjb25k
aXRpb25zIG5lZWRzIHRvIG1hdGNoIG9uZSBvZiB0aGVtIGFuZCB0aGF0IGNhbg0KPiBiZSB3b3Jr
IHRvIG92ZXJyaWRlIHNlbnNvciBidXQgYWN0dWFsbHkgbm90IGFsbCBwcm9qZWN0IG5lZWRzIHRo
b3NlIGNvbmRpdGlvbnMsIHNvDQo+IHdlIHdhbnQgdG8gcHJvcG9zZSB0byByZW1vdmUgdGhlIGlu
c2VjdXJlIGRlZmluaXRpb24gYW5kIHVzZSBuZXcgZGVmaW5pdGlvbiB0bw0KPiBpbmNsdWRlIHRo
ZSBpbnRlbCBzb2x1dGlvbiBhbmQgZXhlY3V0ZSB3aGVuIGNvbXBpbGUuIEl0IHdvdWxkIGJlIG5v
IGNvbXBpbGUgdGltZQ0KPiB3aXRoIG9wdGlvbiBmb3IgY29tbW9uIHByb2plY3QuIEFuZCB0aGUg
aW5zZWN1cmUgaXNzdWUgd2Ugd2lsbCBkaXNjdXNzIGluIHBoYXNlDQo+IDIuDQo+ID4gPg0KPiA+
ID4NCj4gPiA+DQo+ID4gPiBFeGFtcGxlIGJlbG93Og0KPiA+ID4NCj4gPiA+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+ID4gPiAtLQ0KPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ID4N
Cj4gPiA+IFtCZWZvcmUgbW9kaWZpZWRdDQo+ID4gPg0KPiA+ID4gI2lmZGVmIEJNQ1dFQl9JTlNF
Q1VSRV9VTlJFU1RSSUNURURfU0VOU09SX09WRVJSSURFDQo+ID4gPg0KPiA+ID4gLy8gUHJvY2Vl
ZCB3aXRoIHNlbnNvciBvdmVycmlkZQ0KPiA+ID4NCj4gPiA+IHNldFNlbnNvcnNPdmVycmlkZShz
ZW5zb3JBc3luY1Jlc3AsIGFsbENvbGxlY3Rpb25zKTsNCj4gPiA+DQo+ID4gPiByZXR1cm47DQo+
ID4gPg0KPiA+ID4gI2VuZGlmDQo+ID4gPg0KPiA+ID4gZG9JbnRlbFNwZWNpYWxNb2RlTWFuYWdl
ciBjb2RlIKFLDQo+ID4gPg0KPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+IC0tDQo+ID4gPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPg0KPiA+ID4gW0FmdGVyIG1vZGlmaWVk
XQ0KPiA+ID4NCj4gPiA+ICNpZmRlZiBCTUNXRUJfU1BFQ0lBTF9NT0RFX1NFTlNPUl9PVkVSUklE
RQ0KPiA+ID4NCj4gPiA+ICAgICAgIGRvSW50ZWxTcGVjaWFsTW9kZU1hbmFnZXIgY29kZSChSw0K
PiA+ID4NCj4gPiA+ICAgICAgIHJldHVybjsNCj4gPiA+DQo+ID4gPiAjZW5kaWYNCj4gPiA+DQo+
ID4gPiAvL1Byb2NlZWQgd2l0aCBzZW5zb3Igb3ZlcnJpZGUNCj4gPiA+DQo+ID4gPiBzZXRTZW5z
b3JzT3ZlcnJpZGUoc2Vuc29yQXN5bmNSZXNwLCBhbGxDb2xsZWN0aW9ucyk7DQo+ID4gPg0KPiA+
ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gPiA+IC0tDQo+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPg0KPiA+DQo+ID4gPkkgc3VzcGVjdCB0
aGlzIGNoZWNrIGFuZCBvcHRpb24gbmVlZHMgdG8gYmUgbW92ZWQgaW50byB0aGUgaW5kaXZpZHVh
bCBzZW5zb3JzLA0KPiBzbyB0aGF0IHdlIGNhbiBkaWZmZXJlbnRpYXRlIGJldHdlZW4gInNob3Vs
ZCBiZSBzZXR0YWJsZSBpbiBhIHRlc3QgY29udGV4dCIgYW5kDQo+ICJzaG91bGQgYmUgc2V0dGFi
bGUgaW4gYSBub3JtYWwgY29udGV4dCIuDQo+ID4gMS4gRG9lcyB5b3UgbWVhbiBkb24ndCBjaGFu
Z2UgdGhlIEludGVsIGRlZmluaXRpb24gYW5kIGtlZXAgdGhlIG9yaWdpbiBjb2RlDQo+IHdoZW4g
Y29tcGlsZSB0aW1lPw0KPiANCj4gTm8sIHRoaXMgbWVhbnMgdGhhdCB0aGUgY2hlY2tpbmcgY29k
ZSBuZWVkcyB0byBtb3ZlIGZyb20gcmVkZmlzaCBpbnRvDQo+IGRidXMtc2Vuc29ycy4NCj4gDQo+
ID4gMi4gV2hhdCBkbyB5b3UgbWVhbiB0aGlzIG9wdGlvbiBuZWVkcyB0byBiZSBtb3ZlZCBpbnRv
IHRoZSBpbmRpdmlkdWFsIHNlbnNvcnMNCj4gc28gdGhhdCB3ZSBjYW4gZGlmZmVyZW50aWF0ZSBi
ZXR3ZWVuICJzaG91bGQgYmUgc2V0dGFibGUgaW4gYSB0ZXN0IGNvbnRleHQiIGFuZA0KPiAic2hv
dWxkIGJlIHNldHRhYmxlIGluIGEgbm9ybWFsIGNvbnRleHQiLg0KPiA+IFBsZWFzZSBwcm92aWRl
IG1vcmUgZGV0YWlscyBhYm91dCB5b3VyIHRoaW5raW5nLg0KPiANCj4gSW5kaXZpZHVhbCBzZW5z
b3JzIG5lZWQgdG8gcHJvdmlkZSBhbiBhcHByb3ByaWF0ZSBkYnVzIGludGVyZmFjZS4NCj4gUGFy
dCBvZiB0aGF0IGlzIGVuZm9yY2luZyB3aGV0aGVyIG9yIG5vdCB0aGV5J3JlIHdyaXRhYmxlLCBh
bmQgY2hlY2tpbmcgZm9yIHRoZQ0KPiBkZWJ1ZyBzdGF0ZSBvZiB0aGUgc3lzdGVtIHRvIGRvIHNv
Lg0KPiANCj4gPg0KPiA+DQo+ID4gPg0KPiA+ID4gUGhhc2UgMiBpcyB0byBhZGQgYSBjb25kaXRp
b24gdG8gY2hlY2sgdGhlIHNlbnNvciBuYW1loaZzIE11dGFibGUgdmFsdWUgb2YNCj4gRU0gaWYg
dGhlIHZhbHVlIGlzIHRydWUgZG8gdGhlIHNlbnNvciBvdmVycmlkZSBmdW5jdGlvbiBlbHNlIG5v
dCBkby4NCj4gPg0KPiA+ID5JIHN1c3BlY3QgdGhpcyBwYXRjaHNldCBuZWVkcyB0byBiZSBtb3Zl
ZCBmb3J3YXJkIGlmIHlvdSdyZSBob3BpbmcgdG8gdXNlIHRoZQ0KPiBtdXRhYmxlIHBhcmFtOg0K
PiA+ID5odHRwczovL2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9
aHR0cHMlM0ElMkYlMkZnZXINCj4gPg0KPiA+cml0Lm9wZW5ibWMtcHJvamVjdC54eXolMkZjJTJG
b3BlbmJtYyUyRnBob3NwaG9yLWRidXMtaW50ZXJmYWNlcyUyRiUNCj4gMg0KPiA+DQo+ID5CJTJG
MzYzMzMmYW1wO2RhdGE9MDQlN0MwMSUyNT43Q0JydWNlX0xlZSU0MHF1YW50YXR3LmNvbSU3QzY0
DQo+IGExMTUzY2Q0DQo+ID4NCj4gPjViNDZlZWNhNDAwOGQ4ZTU3ZGYzNWMlN0MxNzliMDMyNzA3
ZmM0OTczYWM3MzhkZTczMTM1NjFiMiU3QzENCj4gJTdDMCU3QzYNCj4gPg0KPiA+Mzc1MTE2NzY0
MDQyMjcxMTMlN0NVbmtub3duJT43Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXcNCj4gTURB
aUxDSlFJag0KPiA+DQo+ID5vaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNE
JTdDMTAwMCZhbXA7c2RhdGE9dGRFeHhCJQ0KPiAyQlk3DQo+ID4gPk8xY0tiJTJGWU1kdlBHbnc3
WVRoVzdKNTVqeXREUGg0WVdZbyUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiANCj4gTm90IHF1aXRlLCBi
dXQgY2xvc2UuICBJIHdvdWxkbid0IGV4cGVjdCB0aGUgY29uZmlndXJhYmlsaXR5IHRvIGJlIGRp
cmVjdGx5DQo+IGNvbmZpZ3VyYWJsZS4gIEV4dGVybmFsIHNlbnNvciB0eXBlcyBzaG91bGQgYmUg
bXV0YWJsZSwgYWxsIG90aGVyIHR5cGVzIHNob3VsZA0KPiBub3QgYmUgbXV0YWJsZSAoZXhjZXB0
IGluIGEgZGVidWcgY29udGV4dCkuICBJIGRvbid0IHRoaW5rIHRoZXJlJ3MgYW55IHJlYXNvbiB0
bw0KPiBhZGQgYSBzZXBhcmF0ZSAiSXNNdXRhYmxlIiBwYXJhbWV0ZXIgaW50byB0aGUgRU0ganNv
biwgdW5sZXNzIGl0IHJlYWxseSBuZWVkcyB0bw0KPiBiZSBjb25maWd1cmFibGUgcGVyIHNlbnNv
ciwgd2hpY2ggSSBkb24ndCB0aGluayBpcyB0aGUgY2FzZS4NCj4gDQo+ID4NCj4gPiA+DQo+ID4g
PiBUaGUgTXV0YWJsZSB2YWx1ZSBjYW4gYmUgc2V0IGluIHRoZSBzZW5zb3IgY29uZmlndXJhdGlv
biBvZiBFbnRpdHktTWFuYWdlLA0KPiB3aGVuIHVzaW5nIHRoZSBwYXRjaCBjb21tYW5kIHRvIG92
ZXJyaWRlIHRoZSBzZW5zb3IsIGl0IG5lZWRzIHRvIGNoZWNrIHRoZQ0KPiBFbnRpdHlNYW5hZ2Vy
IHN1YnRyZWWhpnMgc2Vuc29yIG5hbWUgYW5kIGl0cyBpbnRlcmZhY2UNCj4goad4eXoub3BlbmJt
Y19wcm9qZWN0LkNvbmZpZ3VyYXRpb24uSTJDRmFuLkNvbm5lY3RvcqGoIHRvIGNoZWNrIHRoZQ0K
PiBjb3JyZXNwb25kaW5nIHByb3BlcnR5IG5hbWWhpnMgbXV0YWJsZSB2YWx1ZSB0byBkZWNpZGUg
d2hldGhlciBleGVjdXRpbmcgdGhlDQo+IG92ZXJyaWRlIGZ1bmN0aW9uLg0KPiA+DQo+ID4gPlNl
ZSBhYm92ZS4gIEkgc3VzcGVjdCB0aGF0IHRoZSByZWRmaXNoIGNvZGUgZG9lc24ndCBuZWVkIHRv
IGNoZWNrIHRoZQ0KPiBtdXRhYmlsaXR5IG9mIHRoZSBzZW5zb3IsIHRoZSBpbnRlcmZhY2Ugc2hv
dWxkIGp1c3QgaGF2ZSB0aGUgY29ycmVjdCBiZWhhdmlvci4NCj4gVGhlIG9ubHkgcGxhY2UgSSB3
b3VsZCBleHBlY3QgdG8gbmVlZCB0byBrbm93IHRoZSA+bXV0YWJpbGl0eSBvZiBhIHNlbnNvciBp
cyBpbg0KPiB0aGUgSVBNSSBzZHIsIHdoZXJlIHdlIHdpbGwgbmVlZCB0byBzZXQgdGhlIG1vZGlm
aWFibGUgYml0IGFwcHJvcHJpYXRlbHkuDQo+ID4NCj4gPiBGb3Igbm93LCB0aGUgZnVuY3Rpb24g
dG8gc2V0IHNlbnNvciBpbiByZWRmaXNoIGNvZGUgaXMgdG8gc2V0IHRoZSBkLWJ1cyB2YWx1ZQ0K
PiBkaXJlY3RseSAoaW50ZXJuYWxseSB3cml0YWJsZSksICBpZiB3ZSBkb24ndCBjaGVjayB0aGUg
RU0gbXV0YWJpbGl0eSBpbiBSZWRmaXNoLA0KPiBmb2xsb3cgdGhlIEFkZCBNdXRhYmxlIHByb3Bl
cnR5IHRvIFNlbnNvciBWYWx1ZSBpbnRlcmZhY2UsIHdlIHN0aWxsIG5lZWQgdG8gY2hlY2sNCj4g
dGhlIHNlbnNvciBtdXRhYmxlIHByb3BlcnR5IHRvIGtub3cgd2hldGhlciBvciBub3QgdG8gd3Jp
dGUgdGhlIGQtYnVzIHZhbHVlIGluDQo+IHJlZGZpc2ggb3Igd2UgbmVlZCBvdGhlciBleHRlcm5h
bCBzZXJ2aWNlcyB0byBrbm93IHdoZXRoZXIgb3Igbm90IHRvIGdyYW50IHdyaXRlDQo+IHBlcm1p
c3Npb24gdG8gdGhlaXIgdXNlcnMgbGlrZSBJUE1JIHNlbnNvci4NCj4gDQo+IEknbSBub3QgcmVh
bGx5IGZvbGxvd2luZyB0aGlzLiAgTXkgcG9pbnQgaXMgdGhhdCB0aGUgb25seSB0aGluZyB0aGF0
IHJlYWxseSBuZWVkcyB0bw0KPiAiY2hlY2siIHRoZSBtdXRhYmlsaXR5IHJlcXVpcmVtZW50IGlz
IGRidXMtc2Vuc29ycy4NCj4gVGhleSBzaG91bGQgb25seSBhbGxvdyBzZXR0aW5nIHdoZW4gc2Vu
c29ycyBhcmUgbXV0YWJsZSwgYW5kIHJlamVjdCB3aGVuDQo+IHRoZXkncmUgbm90Lg0KPiANCg0K
SVBNSSBoYXMgYW4gZXh0ZXJuYWwgc2VydmljZSB0byBjaGVjayB0aGUgTXV0YWJpbGl0eSBhbmQg
YWxsb3cgc2V0dGluZyB3aGVuIGl0IGlzICJXcml0ZSIgYW5kIHJlamVjdCB3aGVuIGl0J3MgIm5v
dCB3cml0ZSIuDQpUb2RheSBpZiB3ZSBhZGQgYSBtdXRhYmxlIHByb3BlcnR5IGluIHRoZSBkLWJ1
cyBzZW5zb3IsIHdlIGFsc28gbmVlZCBhbiBleHRlcm5hbC1zZXJ2aWNlIGxpa2UgSVBNSSBzZW5z
b3ItaGFuZGxlciB0byBjaGVjayB0aGUgbXV0YWJsZSB2YWx1ZSB0byBncmFudCB3cml0ZSBhY2Nl
c3Mgb3Igbm90Lg0KWW91IHN0YXRlZCB0aGF0ICJUaGV5IHNob3VsZCBvbmx5IGFsbG93IHNldHRp
bmcgd2hlbiBzZW5zb3JzIGFyZSBtdXRhYmxlIGFuZCByZWplY3Qgd2hlbiB0aGV5J3JlIG5vdC4i
IGFyZSBtZWFucyBhbiBleHRlcm5hbC1zZXJ2aWNlIGFzIEkgbWVudGlvbiBhYm92ZT8NCg0KPiA+
DQo+ID4gPg0KPiA+ID4gVGhpcyBhY2hpZXZlcyBmZWF0dXJlIHBhcml0eSB3aXRoIHRoZSBpcG1p
OjpzZW5zb3I6Ok11dGFiaWxpdHkNCj4gPiA+IHBhcmFtZXRlciBvZiB0aGUgb2xkIGhhcmRjb2Rl
ZCBZQU1MIGNvbmZpZ3VyYXRpb24gZmlsZXMNCj4gPg0KPiA+ID5Ob3Qgc3VyZSB3aGF0IHlvdSdy
ZSByZWZlcnJpbmcgdG8uICBUaGF0IG1heSBoYXZlIGJlZW4gc29tZXRoaW5nIGRvbmUgaW4gYQ0K
PiBmb3JrLg0KPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiBFeGVjdXRlIHN0ZXBzOg0K
PiA+ID4NCj4gPiA+IDEuICAgICAgIFBhdGNoIGNvbW1hbmQgdG8gb3ZlcnJpZGUgc2Vuc29yLg0K
PiA+ID4NCj4gPiA+IDIuICAgICAgIENoZWNrIHRoZSBFTSBvZiBzZW5zb3KhpnMgTXV0YWJsZSB2
YWx1ZQ0KPiA+ID4NCj4gPiA+IDMuICAgICAgIElmIE11dGFibGUgdmFsdWUgaXMgdHJ1ZSBkbyBz
ZW5zb3Igb3ZlcnJpZGUgYWN0aW9uIGVsc2Ugbm90IGRvLg0KPiA+ID4NCj4gPiA+DQo+ID4gPg0K
PiA+ID4NCj4gPiA+DQo+ID4gPiBQaGFzZSAzIGlzIHRvIGFkZCBhIG5ldyBnZXQgY29tbWFuZCB0
byBnZXQgdGhlIFpvbmVfJGlkoaZzICJNYW51YWwiIHZhbHVlDQo+IGFuZCBwYXRjaCBjb21tYW5k
IHRvIGNoYW5nZSB0aGUgZmFuIG1vZGUgZnJvbSBhdXRvIHRvIG1hbnVhbCBtb2RlDQo+ICgiTWFu
dWFsIjp0cnVlKS4NCj4gPiA+DQo+ID4gPiBCZWNhdXNlIHRoZSBmYW4gY29udHJvbCBpcyB1c2Ug
cGFja2FnZSBwaG9zcGhvci1waWQtY29udHJvbCwgd2hlbiB3ZSBuZWVkDQo+IHRvIHNldCBmYW4g
cHdtLCBpdCBuZWVkcyB0byBzZXQgdGhlIGZhbiBtb2RlIGZyb20gYXV0byBtb2RlIHRvIG1hbnVh
bCBtb2RlLA0KPiBmb3Igbm93LCB0aGUgcGhvc3Bob3ItcGlkLWNvbnRyb2wgaGFzIGFscmVhZHkg
cHJvdmlkZWQgaXBtaS1vZW0gY29tbWFuZCB0bw0KPiBhY2hpZXZlIHRoaXMgZmVhdHVyZSwgc28g
d2UgbmVlZCB0byBpbXBsZW1lbnQgdGhpcyBmYW4gbW9kZSBjaGFuZ2UgdmlhIHJlZGZpc2gNCj4g
Y29tbWFuZC4NCj4gPg0KPiA+ID5Eb2Vzbid0IHRoaXMgYWxyZWFkeSB3b3JrIHRvZGF5PyAgSSB0
aG91Z2h0IHdlIGhhZCBhbGwgdGhhdCBzb3J0ZWQgYSBsb25nDQo+IHRpbWUgYWdvLiAgRm9yIHNv
bWUgcmVhc29uIEkgdGhvdWdodCB3ZSBpbnRlbnRpb25hbGx5IGRpZG4ndCBleHBvc2UgdGhlDQo+
IG1hbnVhbC9hdXRvbWF0aWMgcGFyYW0sIGJlY2F1c2UgdGhhdCBvbmx5IGFwcGxpZWQgdG8gPnRo
ZSBQSUQgbG9vcHMsIGFuZA0KPiBQV00gc2Vuc29yIGRpZG4ndCBleHBvc2UgdGhhdCBpbnRlcmZh
Y2UuICBJIG5lZWQgdG8gZ28gbG9vayBhdCB0aGUgY29kZSBhdCBzb21lDQo+IHBvaW50Lg0KPiA+
DQo+ID4gWWVzLCBpcG1pLW9lbSBpcyB3b3JrIHRvZGF5LiBJIGFncmVlIGl0IGlzIG5vdCBwcm9w
ZXJseSB0byBzaG93IG9uIHJlZGZpc2ggdG8gbGV0DQo+IHVzZXJzIGNhbiBlYXNpbHkgY2hhbmdl
IHRoZSBmYW4gbW9kZSwgdGhlIHJlYXNvbiB0byBjaGFuZ2UgZmFuIG1vZGUgdG8gdGhlDQo+IG1h
bnVhbCBpcyBmb3IgZGVidWdnaW5nLiBNYXliZSBsZXQgdXNlcnMgdXNlIGlwbWktb2VtIHRvIHJl
cGxhY2Ugc2hvdyBvbg0KPiBSZWRmaXNoIFVSTHMuDQo+ID4NCj4gPiA+DQo+ID4gPg0KPiA+ID4N
Cj4gPiA+IEV4YW1wbGUgVVJMcyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8TWV0aG9kICAg
ICB8RXhhbXBsZQ0KPiBQYXlsb2FkDQo+ID4gPg0KPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tIHwtLS0tLS0tLS0tLS0tLSB8LS0NCj4gPiA+DQo+ID4gPiAvcmVk
ZmlzaC92MS9NYW5hZ2Vycy9ibWMgICAgICB8R0VUICAgICAgICAgICB8Ik9lbSI6IHsNCj4gPiA+
DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8DQo+IHwgICAgICAgICBGYW4iOiB7DQo+ID4gPg0KPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+IHwgICAgICAgICAgICAg
ICAgICAgICJGYW5ab25lcyI6IHsNCj4gPiA+DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+IHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiQG9kYXRhLmlkIjoNCj4gIi9yZWRmaXNoL3YxL01hbmFnZXJzL2JtYyMvT2Vt
L09wZW5CbWMvRmFuL0ZhblpvbmVzIiwNCj4gPiA+DQo+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+IHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiQG9kYXRhLnR5cGUiOiAiI09lbU1hbmFnZXIuRmFuWm9uZXMiLA0KPiA+
ID4NCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwNCj4gfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJab25lXzAiOiB7DQo+
ID4gPg0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfA0KPiB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
QG9kYXRhLmlkIjoNCj4gIi9yZWRmaXNoL3YxL01hbmFnZXJzL2JtYyMvT2VtL09wZW5CbWMvRmFu
L0ZhblpvbmVzL1pvbmVfMCIsDQo+ID4gPg0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiQG9kYXRhLnR5cGUiOg0KPiAiI09lbU1hbmFnZXIuRmFuWm9u
ZSIsDQo+ID4gPg0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfA0KPiB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiQ2hhc3NpcyI6IHsNCj4gPiA+DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+IHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkBvZGF0YS5pZCI6DQo+ICIvcmVkZmlzaC92
MS9DaGFzc2lzL0dTWl9FVlQiDQo+ID4gPg0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB9LA0KPiA+ID4NCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIkZhaWxTYWZlUGVyY2VudCI6IDEwMC4wLA0KPiA+ID4N
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwNCj4gfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIk1pblRo
ZXJtYWxPdXRwdXQiOiAwLjAsDQo+ID4gPg0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiWm9uZUluZGV4IjogMC4wLA0KPiA+ID4NCj4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIk1hbnVhbCI6ZmFsc2UNCj4g
PiA+DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8DQo+IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9LA0KPiA+ID4NCj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwNCj4gfCAgICAgICAgICAgICAgICAgICB9LA0KPiA+ID4NCj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gfCAgICAgICAgIH0s
DQo+ID4gPg0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8DQo+IHx9DQo+ID4gPg0KPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tIHwtLS0tLS0tLS0tLS0tLSB8LS0tLQ0KPiA+ID4NCj4gPiA+IC9yZWRm
aXNoL3YxL01hbmFnZXJzL2JtYyAgICB8IFBBVENIICAgICAgfCJPZW0iOiB7ICJGYW4iOg0KPiB7
ICJGYW5ab25lcyI6IHsgIlpvbmVfMCI6IHsgIk1hbnVhbCI6dHJ1ZSB9IH0gfQ0KPiA+ID4NCj4g
PiA+DQo+ID4NCj4gPiA+SXQgc2hvdWxkIGJlIG5vdGVkLCB0aGlzIHNjaGVtYSBuZWVkcyBzb21l
IHNlcmlvdXMgY2xlYW51cCB0byBtYWtlIGl0IHByb3Blcg0KPiByZXNvdXJjZXMsIHBhdGhzLCBh
bmQgY29sbGVjdGlvbnMsIGFuZCBzaG91bGQgdmVyc2lvbiB0aGUgc2NoZW1hIGZpbGVzDQo+IGFw
cHJvcHJpYXRlbHkuICBJZiB5b3UncmUgcGxhbm5pbmcgb24gZXh0ZW5kaW5nIGl0LCBJID8+d291
bGQgZXhwZWN0IF9zb21lXw0KPiBlZmZvcnQgdG8gYmUgcHV0IGludG8gY2xlYW51cC4gIFRoZXJl
J3Mgc2V2ZXJhbCBnaXRodWIgYnVncyB0aGF0IGhhdmUgbW9yZSBkZXRhaWxzLA0KPiBhbmQgSSB3
aWxsIGxlYXZlIGl0IHVwIHRvIHlvdSB0byBkZWNpZGUgaG93IG11Y2ggeW91J2QgbGlrZSB0byBk
byBhcyBwYXJ0IG9mIHRoaXMNCj4gd29yaywgYnV0IHBsZWFzZSA+cGxhbiBvbiBzb21lLg0KPiA+
DQo+ID4gPg0KPiA+ID4gSWYgYW55IHRob3VnaHRzIG9uIHRoaXMgdG9waWMsIGZlZWwgZnJlZSB0
byBnaXZlIHlvdXIgY29tbWVudHMuIFRoYW5rcyENCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+
IFNpbmNlcmVseSwNCj4gPiA+DQo+ID4gPiBCcnVjZQ0K
