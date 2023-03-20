Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 299646C091C
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 03:59:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pfzwt0R5Kz3c9V
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 13:59:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=YIfo0pWI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::70a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=YIfo0pWI;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2070a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PfzwC67y6z2yV5;
	Mon, 20 Mar 2023 13:59:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llx+QEds8a/NTVc7CuDP/JMlmq6YaEr3Ztxl9yY5L4THEuSuZjd6OMB7Miu90JXLGOCO8HjBivRYBZ57hBQqCt6sVbsgd2nhp80IAXr2TmILD7T7TZ9zMUK9edhhi03k/tprQcUeYV/s2hxT3QDlj3JD6MbC1WVppLAgBKV7cwfO1tVsUHYGGVGR+wLBkMQPML874giaIqB4XoMqz6G9wA3mrE0OoGwhoDGGvIQKei1WKEviJaEa3ZQPCy7j3nQwPRf54yhLpMHHTfCTOvISrWMwuCyBdZjg5tQImRfVwBYOFSkaa0gu5EcnFHtbesBRmFYlOeh6QkXPXE5/3KF3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLzXSxrWTLWcVq8fG3+shIGOI9MM9Pn2KblPbvGT2V4=;
 b=evtuwcxum2OnJTUNSfxuxVzBBaOtBpmDM9f26G300NlJ5CY+1FdEAYZquFunYmKcVfVYa+XkjDVCbQfCWK5Zo5+8i9OrIDQXcx8kVQr/UmT4WCDZiwAZzGZ8mh73FfFKSw09b+M12Qh1AbVTkt18o71d7vFCbMR5puAa0G/8cy4hqH7GSkqXaXF09bUW+28iJNc3irk2sI1jU+j1VPsuinw60EhKcVkAIJ9NhTRb9cZbvRBNvPWINQgeuTT8/2nfjzL90RhX9xUY3Sgvh5Apnkl05rD8laXJgDJLlyskh52Y5WOpYk+qpKnemIpbJ2CZVKV1WV7sAlIVx3W7CIvMzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLzXSxrWTLWcVq8fG3+shIGOI9MM9Pn2KblPbvGT2V4=;
 b=YIfo0pWIdA1pudWEt3KHzwTHTOJxXGHlznLQf21kclpz8Aq9d0sExY0/cTgUTrF3cQrk0w1tmGBqe7L/x+nzi27vEfhKK8x82uM5AjdgL2Pfh8kzwn2Np8CL3DoDUxBR4yX6DxdkTtWyrEow3wNkRuNE85G7QAR0GNcxg/ODFkFQe4B2o2vKvkiRPoYP62h3RuMbaKqX1FQq4SOFB4jcM545VR6ejz1QKZv5Q2lv9ymiyo4ZqX+ENihvZDB0yys/r7GC55gE8gQoa9iFEx+v12+SaMs4LMq9a8NFKaRkKMAnqyFtx+dBsV0CuP8WE5nn2OiiY98rbUAgQE0m0CWBEg==
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 (2603:1096:820:11::14) by SEYPR06MB5182.apcprd06.prod.outlook.com
 (2603:1096:101:8b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 02:58:43 +0000
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::2cd0:fdbf:62e0:8eaa]) by KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::2cd0:fdbf:62e0:8eaa%7]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 02:58:42 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v2 3/5] dmaengine: aspeed: Add AST2600 UART DMA driver
Thread-Topic: [PATCH v2 3/5] dmaengine: aspeed: Add AST2600 UART DMA driver
Thread-Index: AQHZVhvh9pkwhrQAjEWUAQl13XEh967/eugAgAOH++A=
Date: Mon, 20 Mar 2023 02:58:42 +0000
Message-ID:  <KL1PR0601MB378137F321897EB5C602795A91809@KL1PR0601MB3781.apcprd06.prod.outlook.com>
References: <20230314021817.30446-1-chiawei_wang@aspeedtech.com>
 <20230314021817.30446-4-chiawei_wang@aspeedtech.com>
 <20230317210054.GA2790192-robh@kernel.org>
In-Reply-To: <20230317210054.GA2790192-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB3781:EE_|SEYPR06MB5182:EE_
x-ms-office365-filtering-correlation-id: c8426ffa-1f4c-44bf-55c9-08db28ef03c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  j+fVAMtRpF0W4Ofg7EOQPyjs0JWZkDDDa8XZpnmVzArFGyBhY2qH/sC9ko6z48cM/BVV0mUyyL6aaUFpobRIofn8QUd9AFYC0JR4RBpBlYjH9yhl3MmoXHGMrC9MlWw9ML+HIPFh1eGCg5HNDZdJY7ltus+IF+fucUe54hmJuvJuwYHSVYuK7m/0oODnpbpFLp02dTokK9bFXpoYcMeQoieAfapFOz/v5v2YHScuFkYdm8LahGj19aNgvwbYNFuWb54qrxHVxu3MDHNOjRDV1YJFqpXb1wYq6VWqnwP/4uA70n2d2lIytp1QjX73s29IlrzqS3Qc3U663A9yiKYBDegbl61aYzm7aVXau5SWdEFENDvlUl6N4QJQQ4KwzVhDSF+cisw8pmL9HCfineAr2CzohuEhkRwiiV4aq4qCxe+rTMO+e1T6e6Ob3sdmG3InHBZriPLOW+XdCE2Ic4Zo7DoGp4FwD3+pMxw57Dw+683eZ/Oy7p5b29gw0IGzgE4q4u3XnFxmdNoqO9XMdvAZCEIWz706lTrYnpZf2a50KlZFk3k8icS9MEmAM7JpROwYBhZbX5Jo8DKIpFv7fbWpExv7a4H6fPoh9xO2tNmv9QSaSs4NtgTbTlFSAkxLL+lcX8rckV36EZ4YiynCOQSbLAm5seD1FPlOuXA6s5mHtc1hGifrWacHf2kaps2BKraCZChI/XyjZj+lDoagmZrtXA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB3781.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39840400004)(376002)(396003)(346002)(366004)(451199018)(7696005)(71200400001)(186003)(4326008)(478600001)(54906003)(316002)(76116006)(66946007)(6916009)(66556008)(66476007)(64756008)(66446008)(6506007)(26005)(9686003)(8676002)(41300700001)(52536014)(7416002)(8936002)(5660300002)(122000001)(38100700002)(2906002)(55016003)(86362001)(38070700005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WGRUN2NJaEtYYkxQZjFnM1dxWFRCd2FIWW9aSzU4LzY2enE4VHNreUZKLzRz?=
 =?utf-8?B?Y3dkM2NqakRzQnJrUHhRSGNBVzlWRDVtQzZ4dVNZQTBvVEorMVZWaDd1NTVE?=
 =?utf-8?B?VnlXM2tyYkZKUHNjWkFEeFNsY0puSDZjZmZmWko0aHppczJHRkQ2ZTB0eklo?=
 =?utf-8?B?TFF6N250SEdoVFRDdUlCYnJydTh0R1FNVXFvY2FRYlQxbG4zeFlXSmRpV0ZW?=
 =?utf-8?B?aUd4Kyt0L2p6SW90UG9IbFIxWlcvQWpNUm9BRkxuT0RhUWpjcEJ3TDg1Uklt?=
 =?utf-8?B?QkUydU9CUXpGYXNoNWxsN3J1RjhJaWxYbS9ZcW9wZ3ErczRVRWVBRFV5cEZW?=
 =?utf-8?B?bysvM01UamVGOUN0M0ZhZkF6QytVWnl2dUlLWm5LTjVmM0poc0xhNmZWM0lF?=
 =?utf-8?B?Qi9EWmorS0pvRHhvL1o0cVU1SHBkSVVwNUlNQnQ4OWs3V21ua0psTk12UHdi?=
 =?utf-8?B?bUN2eEJvYnI4SGRzR2RGZjlpYVhXOWhaaWIwR08wbThpcVhuOWljVmErWDJY?=
 =?utf-8?B?UnFweERROHhCY3Vzek1BNEJjTkNmSERFaW5qRXlnZGNIRlMzaGh4SDgvcEhD?=
 =?utf-8?B?VmNQSXBycmg4UjRpYU84clhjQmZMeFk5bElSWFRJQnA1ZGNHWWhOVWRkaURa?=
 =?utf-8?B?dzV4QjJDeHlRcnJtemVwSnEwaG9SdmJJakpMRGtlbkZtakViU3k4ZUYveUpi?=
 =?utf-8?B?dURYYnFubkVORXZWb29RQmdKekQ3UktVRWkwTDc2R0xKNEN1ZllVb3dEN2hL?=
 =?utf-8?B?U1hWVGRjZEl5cnc3YnoxWDJEOTRvdUwwZE1DL1Q4WkNqaGpGUkUvY1NzRG1P?=
 =?utf-8?B?ZVJGRzVQVFp6RW96allTNWRLS3VRVjhpU3FwbnhReEw2N3FzK1JvS1cxNUlJ?=
 =?utf-8?B?cWxUcnQvUVk0K0g4c1VYSlVyOHcxVUU4UjBudTVJazdha0lFcEE3bnRFVGR6?=
 =?utf-8?B?cmFoNnExd0Vwb1pmdGZuaXdScFk4cXJqNlRuV3paaGpvVW8rOEFLais2RGl5?=
 =?utf-8?B?WGlneGNrczNFeWtTcUIrcEMzdy83dGlIakwwQWdrTDhkak9SamxNcVFxZzN4?=
 =?utf-8?B?WElxdTcvakdIUko1TnRPRVZjL0FFUmtOL1RkN1laQ2pIa1REZkc2cFVnVmlT?=
 =?utf-8?B?dWcwZnpUQXhDREplcVJRWXBGM3A1ZTg1UmFVU21TbE9RWTNoTHM1U3E1WCtz?=
 =?utf-8?B?UHA0UkpMQk02V25DbmVoRlJJdTZJQVJQOHVwTDBONmpKeEFIbmljRlQ4RFph?=
 =?utf-8?B?VncwTmozOFhIOUNsdWFsMU1kSFhOMGxtV2ZDaXNsZEFoQnpieGxrY3Bnd3Fj?=
 =?utf-8?B?R0VCSmF6WVh4MzNPR3BvVGVLL1lLRDNjR2JGcHpUQTZKR3BFbW1Oa2RZNWlS?=
 =?utf-8?B?WkRPTTVab3VsdlJZRU0yMllSSDdsT29CRTROOTl6QWkwRkNQWXpNdEhxYjBF?=
 =?utf-8?B?VkJtNWhqSEZHWlE2M3R6elNnSWtwWUVRMVZidys2UTk4UUpkUm5yU1ZpTHBI?=
 =?utf-8?B?R09PaERVYTFVNFhnSDlyNDJoZkV4N0dZUDQyZldkQXRqUDh4ZXU3Z3dLM1NC?=
 =?utf-8?B?ZFZ5cW03VmpVUm1sNThqeWxQTk10dVR3cTJNNVl6cFBhZ0VNVWJ6WXgvMVlS?=
 =?utf-8?B?WGRqM2I4N01yTmZoZDJEcU1PRTVEUUllYTNGTzc3ekJVNVdXZ0hubXNUVUR3?=
 =?utf-8?B?L0o0LzVkc1gyazdQQVEzd1VUNjFQZ2N5VzZVbDNCOElsaDlwRWU3dkhSOFF5?=
 =?utf-8?B?dGIxRHczSWdQK2FveGxKYzFFMnBJUDB6TEszdXNWOE84UXNiOTgxYWpFUVNs?=
 =?utf-8?B?K2h6ZzlXWVVIVzZGbXRBYlVGdFlNQ1hYZFM3dVRkMGVyS2lZQ0Y3dzg1TTRN?=
 =?utf-8?B?SEp2WjFsbDNBY1hScWVPKys1cGk4TGxLWWZXYmFnSkxLS3hvMVdqYWRKUUgz?=
 =?utf-8?B?T0QxUnY5ckczUER6dWpma3VsK1JlM2JQVWNvN214ZHlKZEc2YVNYK3pZYXJZ?=
 =?utf-8?B?Vm53aUpkOXhmSzJkcGhZUDdnZGlpYlR5Y2JWTndwcTlQKzJRWTdLUEtYYVJV?=
 =?utf-8?B?OWhnUTZGQ0dTa2xMTzZNMHo4Z3JhUUJGeUh2c09EVUNkWEJXWkk5Z2FwQjFo?=
 =?utf-8?B?MzlaenhES3B3QXlkaWNETDNqUWkxUm9NYWFsVGNTTERXeGhqSTNML3puS3lW?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB3781.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8426ffa-1f4c-44bf-55c9-08db28ef03c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2023 02:58:42.8197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PpxmSD/oMZHQIJbNb5Z7z6gKS3hL2TRx09jDYhKvOpb1mZUUEXOWop6Al6u0TheYpSW5yGtXvjVB+9MMWgwJj33qosvECp45Ak0CP1DapH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5182
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
Cc: "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "jirislaby@kernel.org" <jirislaby@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBTZW50OiBTYXR1cmRheSwg
TWFyY2ggMTgsIDIwMjMgNTowMSBBTQ0KPiANCj4gT24gVHVlLCBNYXIgMTQsIDIwMjMgYXQgMTA6
MTg6MTVBTSArMDgwMCwgQ2hpYS1XZWkgV2FuZyB3cm90ZToNCj4gPiBBc3BlZWQgQVNUMjYwMCBV
QVJUIERNQSAoVURNQSkgaW5jbHVkZXMgMTQgY2hhbm5lbHMgZm9yIHRoZSBETUENCj4gPiB0cmFu
c21pc3Npb24gYW5kIHJlY2V2aWUgb2YgZWFjaCBVQVJUIGRldmljZXMuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDaGlhLVdlaSBXYW5nIDxjaGlhd2VpX3dhbmdAYXNwZWVkdGVjaC5jb20+DQo+
ID4gLS0tDQo+ID4gIGRyaXZlcnMvZG1hL0tjb25maWcgICAgICAgIHwgICA5ICsNCj4gPiAgZHJp
dmVycy9kbWEvTWFrZWZpbGUgICAgICAgfCAgIDEgKw0KPiA+ICBkcml2ZXJzL2RtYS9hc3QyNjAw
LXVkbWEuYyB8IDUyOA0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA1MzggaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9kbWEvYXN0MjYwMC11ZG1hLmMNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2RtYS9LY29uZmlnIGIvZHJpdmVycy9kbWEvS2NvbmZpZyBpbmRleA0KPiA+IGZi
NzA3M2ZjMDM0Zi4uYzM1Zjg3ZGJhZmQ5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZG1hL0tj
b25maWcNCj4gPiArKysgYi9kcml2ZXJzL2RtYS9LY29uZmlnDQo+ID4gQEAgLTc0OCw2ICs3NDgs
MTUgQEAgY29uZmlnIFhJTElOWF9aWU5RTVBfRFBETUENCj4gPiAgCSAgZHJpdmVyIHByb3ZpZGVz
IHRoZSBkbWFlbmdpbmUgcmVxdWlyZWQgYnkgdGhlIERpc3BsYXlQb3J0IHN1YnN5c3RlbQ0KPiA+
ICAJICBkaXNwbGF5IGRyaXZlci4NCj4gPg0KPiA+ICtjb25maWcgQVNQRUVEX0FTVDI2MDBfVURN
QQ0KPiA+ICsJYm9vbCAiQXNwZWVkIEFTVDI2MDAgVURNQSBzdXBwb3J0Ig0KPiA+ICsJZGVwZW5k
cyBvbiBBUkNIX0FTUEVFRA0KPiANCj4gfHwgQ09NUElMRV9URVNUDQoNCldpbGwgYWRkIGl0IGlu
IHYzIHJldmlzaW9uLg0KDQo+IA0KPiA+ICsJaGVscA0KPiA+ICsJICBFbmFibGUgc3VwcG9ydCBm
b3IgQXNwZWVkIEFTVDI2MDAgVUFSVCBETUEuIFNlbGVjdCB0aGlzIG9wdGlvbiBpZg0KPiB5b3UN
Cj4gPiArCSAgaGF2ZSBhIEFTVDI2MDAgU29DIGludGVncmF0ZWQgc3lzdGVtLiBUaGUgZHJpdmVy
IHByb3ZpZGVzIHRoZSBVQVJUDQo+IERNQQ0KPiA+ICsJICBzdXBwb3J0IHdpdGggdGhlIGRtYWVu
Z2luZSBzdWJzeXN0ZW0sIHdoaWNoIGNhbiBiZSBsZXZlcmFnZWQgYnkNCj4gZ2VuZXJpYw0KPiA+
ICsJICA4MjUwIHNlcmlhbCBkcml2ZXJzLg0KPiA+ICsNCj4gPiAgIyBkcml2ZXIgZmlsZXMNCj4g
PiAgc291cmNlICJkcml2ZXJzL2RtYS9iZXN0Y29tbS9LY29uZmlnIg0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZG1hL01ha2VmaWxlIGIvZHJpdmVycy9kbWEvTWFrZWZpbGUgaW5kZXgN
Cj4gPiBhNGZkMWNlMjk1MTAuLjZjYmFjZWJjZGNhYiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2RtYS9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvZG1hL01ha2VmaWxlDQo+ID4gQEAgLTgx
LDYgKzgxLDcgQEAgb2JqLSQoQ09ORklHX1hHRU5FX0RNQSkgKz0geGdlbmUtZG1hLm8NCj4gPiAg
b2JqLSQoQ09ORklHX1NUX0ZETUEpICs9IHN0X2ZkbWEubw0KPiA+ICBvYmotJChDT05GSUdfRlNM
X0RQQUEyX1FETUEpICs9IGZzbC1kcGFhMi1xZG1hLw0KPiA+ICBvYmotJChDT05GSUdfSU5URUxf
TERNQSkgKz0gbGdtLw0KPiA+ICtvYmotJChDT05GSUdfQVNQRUVEX0FTVDI2MDBfVURNQSkgKz0g
YXN0MjYwMC11ZG1hLm8NCj4gPg0KPiA+ICBvYmoteSArPSBtZWRpYXRlay8NCj4gPiAgb2JqLXkg
Kz0gcWNvbS8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEvYXN0MjYwMC11ZG1hLmMgYi9k
cml2ZXJzL2RtYS9hc3QyNjAwLXVkbWEuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4
IDAwMDAwMDAwMDAwMC4uZmY2Nzg3MjRmOWQ5DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBi
L2RyaXZlcnMvZG1hL2FzdDI2MDAtdWRtYS5jDQo+ID4gQEAgLTAsMCArMSw1MjggQEANCj4gPiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArLyoNCj4gPiArICogQ29w
eXJpZ2h0IChDKSBBU1BFRUQgVGVjaG5vbG9neSBJbmMuDQo+ID4gKyAqLw0KPiA+ICsjaW5jbHVk
ZSA8bGludXgvZGVsYXkuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+DQo+ID4g
KyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2RtYWVu
Z2luZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4NCj4gPiArI2luY2x1
ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvb2Zf
ZG1hLmg+DQo+IA0KPiA+ICsjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+DQo+ID4gKyNpbmNsdWRl
IDxsaW51eC9vZl9hZGRyZXNzLmg+DQo+IA0KPiBZb3UgcHJvYmFibHkgZG9uJ3QgbmVlZCB0aGVz
ZSBhcyB5b3Ugc2hvdWxkIHVzZSBwbGF0Zm9ybSBBUElzIGluc3RlYWQuDQoNCldpbGwgdHJ5IHJl
LWNvbXBpbGF0aW9uIHdpdGhvdXQgdGhlc2UgaW5jbHVzaW9uLg0KDQpUaGFua3MsDQpDaGlhd2Vp
DQoNCg==
