Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9034D4C80EB
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 03:19:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K71Cv4pndz2xMQ
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 13:19:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=mGBDocVL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::70e;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=alan_kuo@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=mGBDocVL; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::70e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K71CR3HmRz30Gw
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 13:19:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kukNLNfgZTxCWdX+cXgczQrLVGapGoT0cfeYUeKBA64rsirH4QG4/DQmmLRPLztjldin0FuRfvmnnj8YB6a0FgTwqa1QAYxNEciUnZKsWd+dWXeayxYGY1HW28NEbZ4dTfaOudC7wiFmlSzGPjaDJ0dK8YFgBy4o86kdOTlgMbNDpkhcM3VrkcKcMDyQuT2Uw0/LYwzYEFmYYV/ewxQChQcOc6S3zoL4AHnEOLrynv5g/3hx+4RSaWuWczZjeweIKv83X2C1mkzb55moI4EwMIASBdWbAGtpwa1sapbXBMBmeRI8RJniqvseXDMOBrY/oZE3mnyP4KCHPI/3eCMrQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHC7czbh0LBe8UVwj9rdrKhq7yu0o/bOGZRIDoWDakQ=;
 b=HEHtcWNSlvgXO1B2VaAuZr9/rdS97Izjek47jfAxj73OFSgcEikdSNxC2Y7LRBo4pe07LqvgBh1mS45gz+I7pBJaAcnp2+d1spMFVAz2BknRwVucoDilk7KpCQG5r8cwyX0pZoGEZgZ3XFs4V3I7IYffwfuQRzxAOTATfZAomCy9x/Is82YS/xAVJeJfy8a/aD6JePPD2nAZmrAxGAXSST4naHhhokYzKrIHK06lgSl0JxQVfYlLSYtDJpmXumKqxepSnJQvxTKi+HPjSiviWu/g3tykduwluWAqO51Clz+R9Gcv407+IqsuhYNRr9YXTq5hRhCxkr7z4F2mTCLdxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHC7czbh0LBe8UVwj9rdrKhq7yu0o/bOGZRIDoWDakQ=;
 b=mGBDocVLc8s4E+6sXHFbMvrfcjVMhXSw/N/315lJWfYmmJZpxA16ceFt9RArjZZ3Gtu9cO/b6cHsvBafaluH/e/V2juYVDf2EebekO0lmHjjvh/dqGUsBgTQMg5MeQ4d1YPgoZXpEoFUBwzBuJaCXYtf17hPX4++QiSLTDtLWZU=
Received: from TYZPR04MB4239.apcprd04.prod.outlook.com (2603:1096:400:7::8) by
 HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.26; Tue, 1 Mar 2022 02:18:52 +0000
Received: from TYZPR04MB4239.apcprd04.prod.outlook.com
 ([fe80::259e:8c40:f062:16c5]) by TYZPR04MB4239.apcprd04.prod.outlook.com
 ([fe80::259e:8c40:f062:16c5%8]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 02:18:52 +0000
From: =?big5?B?QWxhbiBLdW8gKLOirra6+yk=?= <Alan_Kuo@quantatw.com>
To: George Hung <ghung.quanta@gmail.com>, Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH u-boot v2019.04-aspeed-openbmc 1/1] ARM: dts: aspeed: add
 Quanta S6Q machine dts
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc 1/1] ARM: dts: aspeed: add
 Quanta S6Q machine dts
Thread-Index: AQHYLQr95hcwPIHaJUakWThND6c0o6ypyk6g
Date: Tue, 1 Mar 2022 02:18:52 +0000
Message-ID: <TYZPR04MB42394D9F702B8FD0A47C71F184029@TYZPR04MB4239.apcprd04.prod.outlook.com>
References: <20220301011135.14066-1-george.hung@quantatw.com>
In-Reply-To: <20220301011135.14066-1-george.hung@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37bc42f3-a429-40e6-85db-08d9fb29d48b
x-ms-traffictypediagnostic: HK0PR04MB3282:EE_
x-microsoft-antispam-prvs: <HK0PR04MB3282116DBDE3A9A84CAB85C484029@HK0PR04MB3282.apcprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NwSbpmWYD/zE34EGI9sNJlxlvvyfeC8SH7zwK7UgY5g2DFg/qxHtQe53OMHcaeQ2RVo4unWhNt1dwx5sUblmy64tuNreJA5MFJ2m7gMT3exD9psoRTnnmkBViYQAtrOb/AI3f11wXpHGiVRmkIIZqEpyyDtziEI+pLqN7d7z6tpKXWZSQLJCtgFP+K3AkjSzWSvbP91CEWODGgoEC3uSbajn/44IQo3dD8dNqW/scHbm5st3UqpoXTjdIIJs2zly4a98vr3mBVwsLrIV4siuQePJa/Rl0IAIyXBIF4XVZ5xfVS0RJc/qpeTVibPTRBqh6WeNqQI27wGjaUIgnj/8vhvD2Y/gWJZHWwCRNSFDkSu3ItQNJxuteKlYJ7Fvh1mQiKvzhTNjuj+nFWvGIDo0gYhcv2A+tLWgjKQSdfx8laYcs24Xq/jcbzKiCEnidLT/cn1M+36OK9Y8Qe+QNsFC/OkMrLqflwl9CpazZQTAf4eTcmVPAwlzBt6MFkXQzcl4pSxLyE7v9Ux2qdU7seK4Gr1d9c6lWwVQosF3vcamulmzg67nyfWPQ1rJrmjicjQ1ggBaJ1G45vQd330319DDPOVC6SEjMJD2/TED2z2x17ZQmcw+fCUOe4yqXt4KlvxIuvYOxedrbvznfn+L8LWD6tWdMaB/xQWaflPYvHWhrnyLHsZg5eVQQ1V9g+mbwP7RclnkGg+OgueVMqYEEbIGQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR04MB4239.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(107886003)(83380400001)(26005)(186003)(122000001)(5660300002)(52536014)(8936002)(55016003)(508600001)(2906002)(4326008)(7696005)(6506007)(71200400001)(8676002)(64756008)(66476007)(66446008)(66556008)(66946007)(76116006)(316002)(54906003)(9686003)(110136005)(38070700005)(85182001)(38100700002)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?L1A2UXZMMXlHNlJ0aE1pVjlLNDRHZFBLenlqMU9MaTM0V1h3dDcvSDVVeUlJdktM?=
 =?big5?B?MG8wYUNlRmVlMjlWWG5EeHFQOEFvQUUweDZPdHV2dlM2cWF0L0FQQ1Y1M216QzBY?=
 =?big5?B?SjVCNlpsbzRGN3o2Ym5DWE9zYXFyRFh5Vm9kbkw0bFBTQU5CYWlPcngzOW4yclF0?=
 =?big5?B?eGhib1lScWJXc0JnNVBrWXJmcjMrSS9EZ0NKVUZjNi9MTGFWWjVjMkRrbXY3WVRp?=
 =?big5?B?a3ZjU1d1TjlESHdySEJhSzgyaHF5L2Myc1FJczJubmNMN2NSQVZYdkoyUjZ3eXZ2?=
 =?big5?B?cTV3WWNMaGdHOStNbFpnRUFvYWFiS3AyaEl1UGV4cWM5ZVh5eEVOL0lyTHZyb2E2?=
 =?big5?B?ZXJSa2Zoc1BaekV5akUwR2Rld0tYS1MwMDZTNWtpTk5QQW1qOHVmeTJuVXBabUcy?=
 =?big5?B?OVVWV3RLVWVheVR1L2FpZnBlNlpzWHYvVVBCUEZNQVNqemMrSWx1K1JBYlIxYTVj?=
 =?big5?B?QkxyVFFoY1d0L3FRYjlWYXVSaXV6aFlwYThZU2x3azdiVFZHZ29VRlNMTzcrRTVj?=
 =?big5?B?eWFoTnRyZ3BMbjdMRHBUQnFFNG1LdDNPNGptTXVYRytiRStyMzc0RWx0bFlrT1hX?=
 =?big5?B?UTkyZWEzZGZJdGI1N2RqbGVRTlRFbXhYcmQ5WkEvOUVXRDRnOVVCVTk1NDB2NEQy?=
 =?big5?B?akdDSGJYdGYvSkRtM1ZpQVJHV2ZRNnphOWx4SUUrN29aMnRXT2oyQ3Z2Y00wbnB2?=
 =?big5?B?bWwwVjVyYWQrQTE2emxhRmxER3NUdmJITktpQklXVTFxSldXbllUM2EwZFFQZnpU?=
 =?big5?B?cE84T052dmdjZTFCYm1vOGxQZDJ0N3cvU2tzc2hTUWYrUVdBYUl4Q0VxMWphQzhG?=
 =?big5?B?QlR1Y3dMNDNxMDBQSjJEUzhhUnNUVWp4SmFld2RoWGt0OHlvcDhVK09MTE1EdFdv?=
 =?big5?B?QW03SGx0ZnNSWTVWclhSMTQ4enRCN3FnVnlobXoyZzFiY25sRk5tL3hIblVjR2pQ?=
 =?big5?B?bHJvY1AyUzlZOVAyUWtJY0ZUMCt0Q1pjQkxpSXBXN1ZucC9wdTk1eXZTejlxVmRC?=
 =?big5?B?ZmplalFsTE1CYzRQRjVsbXdEODI1OUVVbTR3akl3dENHVDBFWWhHU0RlMUZyTXIv?=
 =?big5?B?bUg5REx0TXE3Ull2T0NpVDJjMUNvZ2oxRzF3cUs1b1RYMTREeDdmUjUxUTNYd0tG?=
 =?big5?B?UHZUbFE4WDJObTJYSnAvcDFjOERERFBqQ1NHL1VMaGQvajRZZmNVMEJlWjJJUElw?=
 =?big5?B?U0pIdFVsL3hkMXlCRXBWRUhpSUNXVU94U1Uybm85b3ZJMEFROHVidE5xV0xDeFV1?=
 =?big5?B?YnJtUTd6MzdhNUhPVlhxWlg1bXZ2Y1pqOFZUQjhWVkhPbkpTZVBURmswNWxKbzU0?=
 =?big5?B?Y3BIcUFuZU9XRlh0VjNIQ0pXMDM2V3RRWk1ZRWQ4Wi9ldXB3L3JmMmN4elpNTkM5?=
 =?big5?B?UHFBRW5oRTlDT016Rk5IVGY5cXIwMnkydDlEZWF3a0N5Y21rL3pONUpXWHNKK0tj?=
 =?big5?B?NkxVc0R6OFl2aUVzWUwyN2o5U1I0Y2dLUTBhNWk3L2FyeTNHRzRBNTBrQW1vMWIx?=
 =?big5?B?YXUrTFB3T2d3cWxySDdPT0dGYXlWWjJ6b1RjOW1OTytPNGJCMGZERTNiWmxVM3ls?=
 =?big5?B?NW1XMERnalE4MDNJYUR2ay96OWxIVGRJTkt1ZGNpRDRXN0ZEWHNNYktWVUVpQktu?=
 =?big5?B?YlpmQktSbHZocW9uK1Zpc0JQdkp6bWhSV3lwS1B2emR6U3JYd0FEQ3lyd3BDemJl?=
 =?big5?B?aEtndUU0SHNkZ24wcDBUMVlxeFdxVzdFeHRYZVBWcFNKbkhJaVpBVE44WEFldW1C?=
 =?big5?B?NWtkVEw4ZWNQVHRMNGF5UVFXZTRPZERNWHpIbXBOTlk5c0trd3lpZ2RpM2RIOW9w?=
 =?big5?B?MUpHYzlqLzNRRXo2Y2c4Z3FRWGE1UVFkMFhHRENoZWM1WWYvQ1VWNVRSaWo2MUVK?=
 =?big5?B?Y0crVE1sbk1VTldRdWg4dU9TZDRVcmd1MTJSbUVlL1duc2thdTNuMkl4KzNUeWJL?=
 =?big5?B?SUNxU2JCUFBZdm1KQk05Q242UGpSd0lIazFFV2k1bFBVUDJHR1NNWTY0VFkrTXBU?=
 =?big5?B?cWpkaHM0Q3lPT2cvN3FkT0FLVjZTZ2RPK01jTDhCWmxLZW05dUFnaGtDZWNGK3lr?=
 =?big5?Q?S3JQ/SsTMf0=3D?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB4239.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bc42f3-a429-40e6-85db-08d9fb29d48b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 02:18:52.6061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQv6EbfKczJmbJRsJ7o/HjyZyyiEdFhFSRYYPhX+xl4HoQgjJg6ospHJo2bEAeWPBlC1tp9mX3AtarGNU7AYNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3282
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
 =?big5?B?UC4gSy4gTGVlICin9axmvGUp?= <P.K.Lee@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQo+IEFkZCBidWlsZCBzdXBwb3J0IGZvciBRdWFudGEgUzZRIGJvYXJkIGVxdWlwcGVkIHdpdGgN
Cj4gQVNUMjYwMCBCTUMgU29DDQo+IA0KDQpUaGlzIGxvb2tzIGdvb2QgdG8gbWUuDQpSZXZpZXdl
ZC1ieTogQWxhbiBLdW8gPEFsYW5fS3VvQHF1YW50YXR3LmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5
OiBHZW9yZ2UgSHVuZyA8Z2VvcmdlLmh1bmdAcXVhbnRhdHcuY29tPg0KPiAtLS0NCj4gIGFyY2gv
YXJtL2R0cy9NYWtlZmlsZSAgICAgICAgfCAgIDEgKw0KPiAgYXJjaC9hcm0vZHRzL2FzdDI2MDAt
czZxLmR0cyB8IDIxOA0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAyMTkgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvYXJtL2R0cy9hc3QyNjAwLXM2cS5kdHMNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9kdHMvTWFrZWZpbGUgYi9hcmNoL2FybS9kdHMvTWFrZWZpbGUgaW5kZXgNCj4gZTVhNzM2OTdj
NS4uYTc5Zjg4NWY1NCAxMDA3NTUNCj4gLS0tIGEvYXJjaC9hcm0vZHRzL01ha2VmaWxlDQo+ICsr
KyBiL2FyY2gvYXJtL2R0cy9NYWtlZmlsZQ0KPiBAQCAtNjg2LDYgKzY4Niw3IEBAIGR0Yi0kKENP
TkZJR19BUkNIX0FTUEVFRCkgKz0gXA0KPiAgCWFzdDI2MDAtbmNzaS5kdGIgXA0KPiAgCWFzdDI2
MDAtcGZyLmR0YiBcDQo+ICAJYXN0MjYwMC1yYWluaWVyLmR0YiBcDQo+ICsJYXN0MjYwMC1zNnEu
ZHRiIFwNCj4gIAlhc3QyNjAwLXNsdC5kdGIgXA0KPiAgCWFzdDI2MDAtdGFjb21hLmR0Yg0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9hc3QyNjAwLXM2cS5kdHMgYi9hcmNoL2FybS9k
dHMvYXN0MjYwMC1zNnEuZHRzIG5ldw0KPiBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAw
MDAuLjUyYjYyMGQzYjQNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9hcmNoL2FybS9kdHMvYXN0
MjYwMC1zNnEuZHRzDQo+IEBAIC0wLDAgKzEsMjE4IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMCsNCj4gKy8vIENvcHlyaWdodCAyMDIyIFF1YW50YSBDb3JwLg0KPiAr
L2R0cy12MS87DQo+ICsNCj4gKyNpbmNsdWRlICJhc3QyNjAwLXUtYm9vdC5kdHNpIg0KPiArDQo+
ICsvIHsNCj4gKwltb2RlbCA9ICJRdWFudGEgUzZRIEJNQyI7DQo+ICsJY29tcGF0aWJsZSA9ICJx
dWFudGEsczZxLWJtYyIsICJhc3BlZWQsYXN0MjYwMCI7DQo+ICsNCj4gKwltZW1vcnkgew0KPiAr
CQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOw0KPiArCQlyZWcgPSA8MHg4MDAwMDAwMCAweDQwMDAw
MDAwPjsNCj4gKwl9Ow0KPiArDQo+ICsJY2hvc2VuIHsNCj4gKwkJc3Rkb3V0LXBhdGggPSAmdWFy
dDU7DQo+ICsJfTsNCj4gKw0KPiArCWFsaWFzZXMgew0KPiArCQlzcGkwID0gJmZtYzsNCj4gKwkJ
c3BpMiA9ICZzcGkyOw0KPiArCQlldGhlcm5ldDAgPSAmbWFjMjsNCj4gKwkJZXRoZXJuZXQxID0g
Jm1hYzM7DQo+ICsJfTsNCj4gKw0KPiArCWNwdXMgew0KPiArCQljcHVAMCB7DQo+ICsJCQljbG9j
ay1mcmVxdWVuY3kgPSA8ODAwMDAwMDAwPjsNCj4gKwkJfTsNCj4gKwkJY3B1QDEgew0KPiArCQkJ
Y2xvY2stZnJlcXVlbmN5ID0gPDgwMDAwMDAwMD47DQo+ICsJCX07DQo+ICsJfTsNCj4gK307DQo+
ICsNCj4gKyZ1YXJ0NSB7DQo+ICsJdS1ib290LGRtLXByZS1yZWxvYzsNCj4gKwlzdGF0dXMgPSAi
b2theSI7DQo+ICt9Ow0KPiArDQo+ICsmc2RyYW1tYyB7DQo+ICsJY2xvY2stZnJlcXVlbmN5ID0g
PDQwMDAwMDAwMD47DQo+ICt9Ow0KPiArDQo+ICsmd2R0MSB7DQo+ICsJdS1ib290LGRtLXByZS1y
ZWxvYzsNCj4gKwlzdGF0dXMgPSAib2theSI7DQo+ICt9Ow0KPiArDQo+ICsmd2R0MiB7DQo+ICsJ
dS1ib290LGRtLXByZS1yZWxvYzsNCj4gKwlzdGF0dXMgPSAib2theSI7DQo+ICt9Ow0KPiArDQo+
ICsmd2R0MyB7DQo+ICsJdS1ib290LGRtLXByZS1yZWxvYzsNCj4gKwlzdGF0dXMgPSAib2theSI7
DQo+ICt9Ow0KPiArDQo+ICsmbWRpbyB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArCXBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX21kaW8zX2Rl
ZmF1bHQ+Ow0KPiArCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiArCSNzaXplLWNlbGxzID0gPDA+
Ow0KPiArDQo+ICsJZXRocGh5MjogZXRoZXJuZXQtcGh5QDIgew0KPiArCQlyZWcgPSA8MD47DQo+
ICsJfTsNCj4gK307DQo+ICsNCj4gKyZtYWMyIHsNCj4gKwlzdGF0dXMgPSAib2theSI7DQo+ICsJ
cGh5LW1vZGUgPSAicmdtaWkiOw0KPiArCXBoeS1oYW5kbGUgPSA8JmV0aHBoeTI+Ow0KPiArCXBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX3JnbWlp
M19kZWZhdWx0PjsgfTsNCj4gKw0KPiArJm1hYzMgew0KPiArCXN0YXR1cyA9ICJva2F5IjsNCj4g
KwlwaHktbW9kZSA9ICJybWlpIjsNCj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiAr
CXBpbmN0cmwtMCA9IDwmcGluY3RybF9ybWlpNF9kZWZhdWx0PjsNCj4gK307DQo+ICsNCj4gKyZm
bWMgew0KPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gKw0KPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVm
YXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX2ZtY3F1YWRfZGVmYXVsdD47DQo+ICsN
Cj4gKwlmbGFzaEAwIHsNCj4gKwkJY29tcGF0aWJsZSA9ICJzcGktZmxhc2giLCAic3N0LHcyNXEy
NTYiOw0KPiArCQlzdGF0dXMgPSAib2theSI7DQo+ICsJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUw
MDAwMDAwPjsNCj4gKwkJc3BpLXR4LWJ1cy13aWR0aCA9IDw0PjsNCj4gKwkJc3BpLXJ4LWJ1cy13
aWR0aCA9IDw0PjsNCj4gKwl9Ow0KPiArfTsNCj4gKw0KPiArJnNwaTIgew0KPiArCXN0YXR1cyA9
ICJva2F5IjsNCj4gKw0KPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3Ry
bC0wID0gPCZwaW5jdHJsX3NwaTJfZGVmYXVsdCAmcGluY3RybF9zcGkyY3MxX2RlZmF1bHQNCj4g
KwkJCSZwaW5jdHJsX3NwaTJjczJfZGVmYXVsdCAmcGluY3RybF9zcGkycXVhZF9kZWZhdWx0PjsN
Cj4gKw0KPiArCWZsYXNoQDAgew0KPiArCQljb21wYXRpYmxlID0gInNwaS1mbGFzaCIsICJzc3Qs
dzI1cTI1NiI7DQo+ICsJCXN0YXR1cyA9ICJva2F5IjsNCj4gKwkJc3BpLW1heC1mcmVxdWVuY3kg
PSA8NTAwMDAwMDA+Ow0KPiArCQlzcGktdHgtYnVzLXdpZHRoID0gPDQ+Ow0KPiArCQlzcGktcngt
YnVzLXdpZHRoID0gPDQ+Ow0KPiArCX07DQo+ICt9Ow0KPiArDQo+ICsmaTJjMCB7DQo+ICsJc3Rh
dHVzID0gIm9rYXkiOw0KPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3Ry
bC0wID0gPCZwaW5jdHJsX2kyYzFfZGVmYXVsdD47DQo+ICt9Ow0KPiArDQo+ICsmaTJjMSB7DQo+
ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJ
cGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzJfZGVmYXVsdD47DQo+ICt9Ow0KPiArDQo+ICsmaTJj
MiB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzNfZGVmYXVsdD47DQo+ICt9Ow0KPiArDQo+
ICsmaTJjMyB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVm
YXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzRfZGVmYXVsdD47DQo+ICt9Ow0K
PiArDQo+ICsmaTJjNCB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArCXBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzVfZGVmYXVsdD47DQo+
ICt9Ow0KPiArDQo+ICsmaTJjNSB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArCXBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzZfZGVmYXVs
dD47DQo+ICt9Ow0KPiArDQo+ICsmaTJjNiB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArCXBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzdf
ZGVmYXVsdD47DQo+ICt9Ow0KPiArDQo+ICsmaTJjNyB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0K
PiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJs
X2kyYzhfZGVmYXVsdD47DQo+ICt9Ow0KPiArDQo+ICsmaTJjOCB7DQo+ICsJc3RhdHVzID0gIm9r
YXkiOw0KPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZw
aW5jdHJsX2kyYzlfZGVmYXVsdD47DQo+ICt9Ow0KPiArDQo+ICsmaTJjOSB7DQo+ICsJc3RhdHVz
ID0gIm9rYXkiOw0KPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3RybC0w
ID0gPCZwaW5jdHJsX2kyYzEwX2RlZmF1bHQ+Ow0KPiArfTsNCj4gKw0KPiArJmkyYzExIHsNCj4g
KwlzdGF0dXMgPSAib2theSI7DQo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gKwlw
aW5jdHJsLTAgPSA8JnBpbmN0cmxfaTJjMTJfZGVmYXVsdD47DQo+ICt9Ow0KPiArDQo+ICsmaTJj
MTQgew0KPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
Ow0KPiArCXBpbmN0cmwtMCA9IDwmcGluY3RybF9pMmMxNV9kZWZhdWx0PjsNCj4gK307DQo+ICsN
Cj4gKyZpMmMxNSB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArCXBpbmN0cmwtbmFtZXMgPSAi
ZGVmYXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzE2X2RlZmF1bHQ+Ow0KPiAr
fTsNCj4gKw0KPiArJmRpc3BsYXlfcG9ydCB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArfTsN
Cj4gKw0KPiArJnNjdSB7DQo+ICsJbWFjMi1jbGstZGVsYXkgPSA8MHgwOCAweDA0DQo+ICsJCQkg
IDB4MDggMHgwNA0KPiArCQkJICAweDA4IDB4MDQ+Ow0KPiArCW1hYzMtY2xrLWRlbGF5ID0gPDB4
MDggMHgwNA0KPiArCQkJICAweDA4IDB4MDQNCj4gKwkJCSAgMHgwOCAweDA0PjsNCj4gK307DQo+
ICsNCj4gKyZoYWNlIHsNCj4gKwl1LWJvb3QsZG0tcHJlLXJlbG9jOw0KPiArCXN0YXR1cyA9ICJv
a2F5IjsNCj4gK307DQo+ICsNCj4gKyZhY3J5IHsNCj4gKwl1LWJvb3QsZG0tcHJlLXJlbG9jOw0K
PiArCXN0YXR1cyA9ICJva2F5IjsNCj4gK307DQo+IC0tDQo+IDIuMzIuMA0KDQo=
