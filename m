Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ECD464BC8
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 11:39:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3wYq6Jflz3bg8
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 21:39:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=si09feaD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::712;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=si09feaD; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::712])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3wYC4Lp7z2yNT;
 Wed,  1 Dec 2021 21:38:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJ797Z5TfHahBZ5s6t2pEjFkWUZAYMvVKtjIyBbcy5yTyd7WuKsQ2Eff8qBWwGu7QqzrQI0Nv4+Bi98wzgfJkuNJaYqgfjpOBbEUilkdnstOJoPI5dJhfjtD/4Y92EweFP/qsXUvrUxBwWUP2JA1bM5F329idvsEA6xRxQvKHpLuYd/U86ty+nJKqm7D/+DB+3Wl1sa9zdBD6puCzSoKmz5KOIKWv6geyPrjF6et+ORmraF4GbYHA8IERoswNhHFUUGddavAamxbctkjmksiOKfCo9u9aLQhtNcasidXttmNSOURRnrTS7NYfWB8IPsZD08HaJQZM4+YDEdao4pxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XSTIcn471gaDdP75ZD1Gvdn2Gsxm54WaIqKEhLFOPw=;
 b=l5jld+5DR/ShlQ+lRCUVsLerOzPfrSpm2AtcFni7QyvJuCVfAhlsaVi1JlyOh9fi+VKJE5oIFFo/oGEu6DVoflS485mpLiRA1z7YgWNjr4BRiHWAPpMDdQXMchnm9MlQ1btiXlKHrpNTY5/+w8oO0vb5fVvjEswW4I7xM2jJesxasFi54k0PvVKnr1/y4doYgJUTILT3vr9qJYzsQwaKm8MC2x9UkQY+9iyENwzxUvzgwelG5iZJPanWxVTWcYHOCOl4jSFXGJUEQE6ZcHk0O1+RRO9L7hljcEZ02UEY3gIsBGb59onXJzFXPWIZiXymjpT0oAFkaIfaZWpRy8YtOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XSTIcn471gaDdP75ZD1Gvdn2Gsxm54WaIqKEhLFOPw=;
 b=si09feaDoHkRkfd7xvugD0XYkxRaUn/pobzUtxP9wk0Eo9HDNeBDnOK29QsTpToa2RwvQnFccA5E8/5QVWPeJiUsyiQPeDTlGlTJ244WDsnZwOMERHy5k5ywS2fMIbk1O8GNkPqpNEtSYG53NvgXaWTj+IdeK6dKPFAyneNmf4vZM5A2lZ1wF4Q2AP86ad7bKGgwj+6iAPKUwL9o2T4IaL4rJc2UqGv0Km5flpC8FYWjUaA9CsZ1+qSUQx0KvwYh21QTo7TUPVfwdfN7CdbqLDXcRTCXb+YJun97cl6TUcPAXKS+496DzuWCgv9N0hFUgFqyFRHbyZ93Ez+sXNHfVA==
Received: from HK0PR06MB3362.apcprd06.prod.outlook.com (2603:1096:203:8b::10)
 by HK2PR0601MB1985.apcprd06.prod.outlook.com (2603:1096:202:c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 10:38:05 +0000
Received: from HK0PR06MB3362.apcprd06.prod.outlook.com
 ([fe80::7941:2fad:3c82:52eb]) by HK0PR06MB3362.apcprd06.prod.outlook.com
 ([fe80::7941:2fad:3c82:52eb%3]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 10:38:04 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 02/13] dt-bindings: Add bindings for peci-aspeed
Thread-Topic: [PATCH v4 02/13] dt-bindings: Add bindings for peci-aspeed
Thread-Index: AQHX4HPXMbpig5e+0UWtpGOsbqQ2CaweBD8A
Date: Wed, 1 Dec 2021 10:38:04 +0000
Message-ID: <DDB2E224-472B-41CC-A5C6-BEADB4BF2041@aspeedtech.com>
References: <20211123140706.2945700-1-iwona.winiarska@intel.com>
 <20211123140706.2945700-3-iwona.winiarska@intel.com>
In-Reply-To: <20211123140706.2945700-3-iwona.winiarska@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ae57822-fb57-4606-7594-08d9b4b6a84b
x-ms-traffictypediagnostic: HK2PR0601MB1985:
x-microsoft-antispam-prvs: <HK2PR0601MB19852D76E28D42F74604BBB38B689@HK2PR0601MB1985.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VrSaXsn/pJu22pohqjMH0636NsNxw3zV0axEdRphqhI8is+BcbbXabK4hQm+DU1h+PRF59xlH7lTFUWBvZPPgaPozygdntUpL1FUhJwHEjCh4Z5u05sSMuxaThMo5dKwEBI/rN9KBDmqlJi3TO+GFdfwx6GlxIMlKkMHQtNLI1xou5NgSghAZXnYVqhg8m7qbJFWG26MVJnaispf9zdqzxFvsCEWu6P49Qg6zHy71fmJyQsvhoON0SAoVPma1XMcuaYLzNPvamnJKkP7DbPMdn5dBrsM2qwtPAUGGaWLwCRGjNpBTWAPHW//3iQkYXlesYtB5T7H3rE12akDGUJ+rFxHFEejXye4bRshqMwO69PdON0I3Frkvg7SYMy6TN7M2u0jlashoDSd49cbzQ6t0tiDDaASDdwqlPDtwYQau9qNERFHP8/GVdH4kX1aRPe7mNUEX5zxFi1K9kcp3ZtOQyxYfxXU157KM5gYSoMEJlRC7zZV6OhwsOetu9uEOr2UW/KKsNggTmtPQdUCzWwCE1iu4fmmxt/sVIlHUyTMqpFg0z0Tuv3DV5ipbYkmPh62cowEBzZNgF+pDdrq+ndgtj5NSeaTvFyGiFpOBCROs7HqECBQhkFPLNhhXyHzfVlcy1gfBE9GbCfAB398eVUrEqKlOkUzK6WXiE/+bAw0glCJ/J1kVoJdtnFIeceiSwDu1DpKcQGVS0a1+70jyjDS3e0NPftu64iglHNrJIFLUTT/DEprcf1pMNS1tEEgoEii
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3362.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39850400004)(376002)(136003)(346002)(86362001)(54906003)(83380400001)(316002)(110136005)(2616005)(8676002)(64756008)(66476007)(66556008)(76116006)(5660300002)(508600001)(122000001)(66946007)(71200400001)(66446008)(8936002)(6486002)(36756003)(26005)(33656002)(7416002)(38100700002)(4326008)(6506007)(6512007)(186003)(53546011)(2906002)(38070700005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkdBeFd0S2xqNU54eVpWSTlEVDVWNFFkdjZGbnVLN29nRkFqMUd5M0dLZVFk?=
 =?utf-8?B?b3QyRGF3Vktsb0NCMS9DcjlMN2dVMm5ibFNFK0ZodVdZL0hEcmpFVVMwMmNM?=
 =?utf-8?B?alJQb2tMSHNHRzE2WUhBSDA0SkRud3d4TnJhb2M1eis2a3A1aTI1TUJsU0dv?=
 =?utf-8?B?cTYyV1lxSno5SjMzNGszMzA4MFZUVlhzWnZXTnNCaldWeFhzU2x6UzlHVXMr?=
 =?utf-8?B?RXNmb2xLQmpZS1lHNEkxUFQ3Y0NEUENaelpzeCtvZ1Roek5XZDJqSGoyc1hz?=
 =?utf-8?B?NzJFUzFyM1ZlVkFuQjN5YVBuaTFWR3ZJQjQxbzljVWJEYkZVSDE5WVJXR3lD?=
 =?utf-8?B?OGsvdTl6eDcveWhCbG9JNHRkQkc4OEhZdENkSXNrRXhtT0dqTkFOOHJxaUdX?=
 =?utf-8?B?Z29KdVIxSTlPdjFyZlM2eWFGMk0rSmVBKzBXQ2lkZlZvamkzUlN1WTdTK0pQ?=
 =?utf-8?B?L3RUMVFMRVkxUEZnY3hobVNmVUxmZjYzUFRRbVRrUndqK3h5L3BybVRMN1kw?=
 =?utf-8?B?VXcwMjM5UGZKSm41aW5iVEJ4ZnliWGRWb1g5bVFMT1hsVFZXenVGblBkbUlw?=
 =?utf-8?B?Y1crTHl4OWUxVm1JWnJINnZLNDRCWUNXWmd0SElRend2MEJuVTM3K3pPRWo5?=
 =?utf-8?B?ZExuUGoxcHZQWE1ONEoyQzJLdy8wZndhb1EvSzJ2OW5BTU54enJPcjdiL2pE?=
 =?utf-8?B?WDhCVlptcDU1a25wbXl1MVJPMWphY05QVFordzl4TXJDN0xvU04xeWQ0b2pV?=
 =?utf-8?B?Znl0WnhLLy9rWC9WRmFTditoY2JzaGxtVlpTQzZjR1V4VGZ0STl4V1lhWUFh?=
 =?utf-8?B?cTlxdUlRUTk3Z1d0QUdmbUZjSVV1V2F1RWd5Q1h2K3VuY2JqK2RRL01BNlZt?=
 =?utf-8?B?R0VpbEpBVEZlYXNGNm12bmpyT1EvdGRXOUx1S0dtb3NSZmRueXdRUXdRaElp?=
 =?utf-8?B?YXVhV3A3MmdCWTF6MWhEY3RrWDZEb2YycUp6bThDZ1VXdDZzZ1BPd0pWY3J0?=
 =?utf-8?B?SmtnckVnblRDQUxvSTZTM1M3cVltbC9wKzRKRkk5NjRmelBCeHRlQUZRNU95?=
 =?utf-8?B?YmpGd1BleHpxOFdBY2N6Mk0yeTF6blVITlh6YmlWTFJ4cFlQalFiZmlCeUFE?=
 =?utf-8?B?aVZQNlJXR055OFlIa0FJTXB6cm1kSEd5OEF5RkYwYityT2VnSHRhNnRuU3RW?=
 =?utf-8?B?K2lrSjlCQ3N2YnZTQldlSnMzcGExUkR4RkhZc2VzRlpFYXdaV3hNQmFRN0pz?=
 =?utf-8?B?YjhqbDhpODJaanRac2EyTTJYNXVOS1A4ajJjNHh2dmVBVmltczdsNW1LUS9o?=
 =?utf-8?B?S1d0d0Q3N2xvUVZhY3R1eU5lMDBEZEJmN0gzeDB2RnNvSHVvNHp3Y1ZFMzVh?=
 =?utf-8?B?dVh6SVBuUXdiT3RvdlZqWEhoMVJkbXZOTVYxN1M0UGkvWmtxV2w2M3REYVhH?=
 =?utf-8?B?OCtjVHFrVDZCNndaWlJBYnVvUmJmRzc2TkNtejc0VW1ldFViUXpVcGhXa2ts?=
 =?utf-8?B?a1pTL2R1eVZUeHVMN3VDM1Vocnpjdjk0djJUeHNmc09KQ3QzZCtoSk9ERXRT?=
 =?utf-8?B?QlQ1cWpIOWpGMTRqU2pQelZwYjJvSUFJWGFUMnNvMmlybU1PSnNNampoTXhY?=
 =?utf-8?B?dUh1QWs3OGVPVmRhSiszc255Mnl4ZTk1MzdRWk94NXNLQ1lzcGJDVW85R1Zj?=
 =?utf-8?B?cHNnMmFjRGJwa254TEtHWmlROXltTmhUeE1KZWtHVHR4Y3d3bGZLOWdhWW5a?=
 =?utf-8?B?SGFnbjNnczZtQWxQaVNnbGJIKzh4SlhHL2NWbWRRRXVaWllYZk1sZWxkZFVL?=
 =?utf-8?B?TFE3UkRkek9XWnpKTnpWTWNkd3pOYXhra0JNRS9aRDFMbVArMjQxSmhmZXlV?=
 =?utf-8?B?QWFvN2FneS94dHpsK0V3Ykt5TXZ0THpHemxod2JmVkxQSGZFYzlHOWNTRWdV?=
 =?utf-8?B?Z3NySGkvYlFCWjUrbGNiVUtwVmgzZ1o4ajJCdXpwdHpFQVZzaTVQdUhmS1Yz?=
 =?utf-8?B?RmJVd1ljazN6aUZyMmorR0VxRElDZlNKZkpiQmRmSGVMeEkxRGI3Y0FEdmti?=
 =?utf-8?B?WWVmeWV1UCtHdDRUUzQ2ZHJJZGZXS3kxVFNBNEpTQ0hqd2dTeS9Fb0xBbmtU?=
 =?utf-8?B?amlEQThxTTNuR1RpYmY1cVo4WC9PaVI3NXRVZWV2RXpIVFlEZVFSYUZyK2Fi?=
 =?utf-8?B?TnNNL2NKbjFxSmZHWThWVW1jTHpyWUVGNlBEd1EzVFludDFlNFh2YXZpTlpJ?=
 =?utf-8?Q?rtSoMSbDvYrHvy1Z8ui8WfzGZPDBnQuASTZ/kYfDVI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC988721F0343842B4FB1A58B01A56AA@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3362.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae57822-fb57-4606-7594-08d9b4b6a84b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 10:38:04.7182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /SW6Tci5rzfI71CxL0GDNKcyxQymvhKbng4F0mm6xpgORaxMxMjrXlioigXmwq97u4anW1M8BLOX1oi+Z+gGtA0+0X2+U0vkGEc2hUo12n0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1985
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Rob Herring <robh@kernel.org>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksDQoNCk9uIDIwMjEvMTEvMjMsIDEwOjEwIFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgSXdv
bmEgV2luaWFyc2thIiA8b3BlbmJtYy1ib3VuY2VzK2JpbGx5X3RzYWk9YXNwZWVkdGVjaC5jb21A
bGlzdHMub3psYWJzLm9yZyBvbiBiZWhhbGYgb2YgaXdvbmEud2luaWFyc2thQGludGVsLmNvbT4g
d3JvdGU6DQoNCiAgICBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBwZWNpLWFzcGVl
ZCBjb250cm9sbGVyIGRyaXZlci4NCg0KICAgID4gICArICBhc3BlZWQsY2xvY2stZGl2aWRlcjoN
CiAgICA+ICAgKyAgICBkZXNjcmlwdGlvbjoNCiAgICA+ICAgKyAgICAgIFRoaXMgdmFsdWUgZGV0
ZXJtaW5lcyBQRUNJIGNvbnRyb2xsZXIgaW50ZXJuYWwgY2xvY2sgZGl2aWRpbmcNCiAgICA+ICAg
KyAgICAgIHJhdGUuIFRoZSBkaXZpZGVyIHdpbGwgYmUgY2FsY3VsYXRlZCBhcyAyIHJhaXNlZCB0
byB0aGUgcG93ZXIgb2YNCiAgICA+ICAgKyAgICAgIHRoZSBnaXZlbiB2YWx1ZS4NCiAgICA+ICAg
KyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCiAgICA+
ICAgKyAgICBtaW5pbXVtOiAwDQogICAgPiAgICsgICAgbWF4aW11bTogNw0KICAgID4gICArICAg
IGRlZmF1bHQ6IDANCiAgICA+ICAgKw0KICAgID4gICArICBhc3BlZWQsbXNnLXRpbWluZzoNCiAg
ICA+ICAgKyAgICBkZXNjcmlwdGlvbjoNCiAgICA+ICAgKyAgICAgIE1lc3NhZ2UgdGltaW5nIG5l
Z290aWF0aW9uIHBlcmlvZC4gVGhpcyB2YWx1ZSB3aWxsIGRldGVybWluZSB0aGUgcGVyaW9kDQog
ICAgPiAgICsgICAgICBvZiBtZXNzYWdlIHRpbWluZyBuZWdvdGlhdGlvbiB0byBiZSBpc3N1ZWQg
YnkgUEVDSSBjb250cm9sbGVyLiBUaGUgdW5pdA0KICAgID4gICArICAgICAgb2YgdGhlIHByb2dy
YW1tZWQgdmFsdWUgaXMgZm91ciB0aW1lcyBvZiBQRUNJIGNsb2NrIHBlcmlvZC4NCiAgICA+ICAg
KyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCiAgICA+
ICAgKyAgICBtaW5pbXVtOiAwDQogICAgPiAgICsgICAgbWF4aW11bTogMjU1DQogICAgPiAgICsg
ICAgZGVmYXVsdDogMQ0KICAgID4gICArDQogICAgPiAgICsgIGFzcGVlZCxhZGRyLXRpbWluZzoN
CiAgICA+ICAgKyAgICBkZXNjcmlwdGlvbjoNCiAgICA+ICAgKyAgICAgIEFkZHJlc3MgdGltaW5n
IG5lZ290aWF0aW9uIHBlcmlvZC4gVGhpcyB2YWx1ZSB3aWxsIGRldGVybWluZSB0aGUgcGVyaW9k
DQogICAgPiAgICsgICAgICBvZiBhZGRyZXNzIHRpbWluZyBuZWdvdGlhdGlvbiB0byBiZSBpc3N1
ZWQgYnkgUEVDSSBjb250cm9sbGVyLiBUaGUgdW5pdA0KICAgID4gICArICAgICAgb2YgdGhlIHBy
b2dyYW1tZWQgdmFsdWUgaXMgZm91ciB0aW1lcyBvZiBQRUNJIGNsb2NrIHBlcmlvZC4NCiAgICA+
ICAgKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCiAg
ICA+ICAgKyAgICBtaW5pbXVtOiAwDQogICAgPiAgICsgICAgbWF4aW11bTogMjU1DQogICAgPiAg
ICsgICAgZGVmYXVsdDogMQ0KSSBzdWdnZXN0IGRlbGV0aW5nIHRoZXNlIHRocmVlIHByb3BlcnRp
ZXMgYW5kIHJlcGxhY2luZyB0aGVtIHdpdGggdGhlIGZvbGxvd2luZw0KDQphc3BlZWQscGVjaS1i
aXQtdGltZToNCiAgICAgICAgZGVzY3JpcHRpb246DQogICAgICAgICAgVGhlIGJpdCB0aW1lIGRy
aXZlbiBieSBQRUNJIGNvbnRyb2xsZXIuIFRoZSB1bml0IG9mIHRoZSB2YWx1ZSBpcyBIei4NCiAg
ICBtaW5pbXVtOiAyMDAwDQogICAgbWF4aW11bTogMTAwMDAwMA0KDQpBbmQgdGhlIGRyaXZlciBz
aG91bGQgdXNlIHRoaXMgcHJvcGVydHkgdG8gY2FjdWxhdGUgdGhlIGFwcHJvcHJpYXRlIGNsb2Nr
LWRpdmlkZXIsDQptc2ctdGltaW5nIGFuZCBhZGRyLXRpbWluZywgaW5zdGVhZCBvZiBleHBvc2lu
ZyBoYXJkd2FyZSByZWdpc3RlcnMgdG8gZHRzLg0KDQogICAgPiAgICBbLi4uXQ0KICAgID4gICAr
ZXhhbXBsZXM6DQogICAgPiAgICsgIC0gfA0KICAgID4gICArICAgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+DQogICAgPiAgICsgICAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2FzdDI2MDAtY2xvY2suaD4NCiAgICA+ICAgKyAgICBwZWNp
LWNvbnRyb2xsZXJAMWU3OGIwMDAgew0KICAgID4gICArICAgICAgY29tcGF0aWJsZSA9ICJhc3Bl
ZWQsYXN0MjYwMC1wZWNpIjsNCiAgICA+ICAgKyAgICAgIHJlZyA9IDwweDFlNzhiMDAwIDB4MTAw
PjsNCiAgICA+ICAgKyAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzOCBJUlFfVFlQRV9MRVZF
TF9ISUdIPjsNCiAgICA+ICAgKyAgICAgIGNsb2NrcyA9IDwmc3lzY29uIEFTUEVFRF9DTEtfR0FU
RV9SRUYwQ0xLPjsNCiAgICA+ICAgKyAgICAgIHJlc2V0cyA9IDwmc3lzY29uIEFTUEVFRF9SRVNF
VF9QRUNJPjsNCiAgICA+ICAgKyAgICAgIGNtZC10aW1lb3V0LW1zID0gPDEwMDA+Ow0KICAgID4g
ICArICAgICAgYXNwZWVkLGNsb2NrLWRpdmlkZXIgPSA8MD47DQogICAgPiAgICsgICAgICBhc3Bl
ZWQsbXNnLXRpbWluZyA9IDwxPjsNCiAgICA+ICAgKyAgICAgIGFzcGVlZCxhZGRyLXRpbWluZyA9
IDwxPjsNCiAgICA+ICAgKyAgICAgIGFzcGVlZCxyZC1zYW1wbGluZy1wb2ludCA9IDw4PjsNCiAg
ICA+ICAgKyAgICB9Ow0KICAgID4gICArLi4uDQogICAgLS0gDQogICAgMi4zMS4xDQoNClRoYW5r
cw0KDQpCZXN0IFJlZ2FyZHMsDQpCaWxseSBUc2FpDQoNCg0KDQo=
