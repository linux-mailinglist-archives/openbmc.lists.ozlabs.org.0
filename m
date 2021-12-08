Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 363C846CAD8
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 03:24:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J81Fc06zPz3c9D
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 13:24:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=dIyX/JQf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.255.131;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=dIyX/JQf; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2131.outbound.protection.outlook.com [40.107.255.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J81Dx3zbZz2yLv;
 Wed,  8 Dec 2021 13:23:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vp9YqG633o58U1/+yOVVWQJz00fx/aMQjRdPhAHHORswiDoK9dJiiZK2qvO+0yRl3S1OPFvBWnwqWUQgG9wQ1jNudMoOZuYicxg4fbSVSNN0Oh4KXGgN01A184vX+TuSghSEzEvWFuUnkUtHqTIZEncgPvM+XCs4KBk7Nuy49NAKOFuuwWcuFmITTUrgMrxSSbpnMAq3segYhazY5YYfwf3m8tLrJ4l7blxymNLfzdfG9PNF2DAEIQPsykrQJ/TMtI91Degv8Xos/kkBpvS4/BDFNLEL63VmMvGbDzw8Qh1LAvW+q44QNjZHfXtICWsP++H/v0JeTaMtqrEzkG6kHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93VioNpVIHRjmuDcunQwF27mXBzzmDavxa/mvxdiHeM=;
 b=kNWHn/TT9iM1rcfGOt/4w/5SEn1tpBvIFonEIK7Ib2NKBmGsRTATQOUHQpUWZV45fbs8szLUYd6hJcgTY4938hsktY8WqG17mqV7G7VgeiopCXneRRv2/y3YaObn7L2TFeAahDO0ToDuRmflAX7Qfr3JGRWglxcZxXudxOCZc0fVLJGKNyRMD8Y+GQp6FXm+EeVpyFsVL7/FcBjGZUql3AcjEfcce2y5ckMv7eSQ+fVsZjP/dTnrLxqPBcq+JZGmOLMKWBl/AWDGdBW6wrHgMarstVY8jPZj3BgAVK1d44yBkoBgdZkkliWJhe+imvH6CgBcOPkNO9dBPMjmdcY63w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93VioNpVIHRjmuDcunQwF27mXBzzmDavxa/mvxdiHeM=;
 b=dIyX/JQfCCA8Qxeu1n7GwZkwwpyq2p4ApX5lYqRcNWzZsBpfsCmqDcIMcTpycX2Tqa2c4316pZkSp8czSGHSXU3vFwbvjAw3vdK17fWQLQG9XYeBK3gjUn+0fhK02ESprywY2byEL9yGnSRRtndgwXmU+eESct9bijM30P6pcT1T/eO2Xv2wDrhISaBMiZUKzuZ66ASMUP8I4Tb7hp8SE3FCud8l9EO3KDH9ex62n+cNvpwkjekZ9jbOk1+iPW7sHUacO+ZcmEfQtNpJxRSSRKEC5jrdZ1TE+9Wrx4g49AOxMBLh3tGxE9JD4WNZmxS4aTDwShhHiKqsKgTd2GVwEQ==
Received: from HK0PR06MB3362.apcprd06.prod.outlook.com (2603:1096:203:8b::10)
 by HK0PR06MB2676.apcprd06.prod.outlook.com (2603:1096:203:34::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 8 Dec
 2021 02:23:17 +0000
Received: from HK0PR06MB3362.apcprd06.prod.outlook.com
 ([fe80::7941:2fad:3c82:52eb]) by HK0PR06MB3362.apcprd06.prod.outlook.com
 ([fe80::7941:2fad:3c82:52eb%3]) with mapi id 15.20.4778.012; Wed, 8 Dec 2021
 02:23:17 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>, "zweiss@equinix.com"
 <zweiss@equinix.com>
Subject: Re: [PATCH v4 02/13] dt-bindings: Add bindings for peci-aspeed
Thread-Topic: [PATCH v4 02/13] dt-bindings: Add bindings for peci-aspeed
Thread-Index: AQHX4HPXMbpig5e+0UWtpGOsbqQ2CaweBD8AgAB6DwCAAJB0gIAIXRWAgAEOeYA=
Date: Wed, 8 Dec 2021 02:23:16 +0000
Message-ID: <1398354F-F251-4CEA-8E92-7C442287F6BC@aspeedtech.com>
References: <20211123140706.2945700-1-iwona.winiarska@intel.com>
 <20211123140706.2945700-3-iwona.winiarska@intel.com>
 <DDB2E224-472B-41CC-A5C6-BEADB4BF2041@aspeedtech.com>
 <20211202015455.GB25091@packtop>
 <4B35121C-3BF3-4EF2-BBE6-AA76FA1920E3@aspeedtech.com>
 <0a82b85608ea13424c601a4a6364652d2a411675.camel@intel.com>
In-Reply-To: <0a82b85608ea13424c601a4a6364652d2a411675.camel@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75040646-2ed4-4593-8545-08d9b9f1b1ee
x-ms-traffictypediagnostic: HK0PR06MB2676:EE_
x-microsoft-antispam-prvs: <HK0PR06MB2676D8A76DBDF3DB4C0BE4868B6F9@HK0PR06MB2676.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jCcPJbTZxpAuCsgQ7YbYq3od8d48NdMcIiWmVV1TJZHn+yY9jEPvYOCZROV+6/I9i8qok0VVzKzdSRG6Ll2FtzsCOy3rzJNmt5k7MwWfB4oV5LQ5U9rdFMt4yOIyS+06kNDpeQruUrk9nNy8L/XJlxZniEcY33Uy7/rbqG7BE+X3H2hjau/b84v5M1Px1nIKY1tBGrO3l7n7L3chpuNuhna1ddKICNHhrWcfEKx7LAeCW+PiTYALqXjNZxhCd/1DGsrTzXuep8dX6kcP5N0KrOEIWWCVCe8Rk7BWIXiZm0I7lVlGtnrjHS6qvdU/Al9rywdgtDd9YABxYvADor2d2hN58bqn8hCQ01jyiAPVcHCXqp3eAA7QSdAfRvfnpKSlEIvNePPckNWg5zCbsRWKd5kZICjswfw/dxqKmWQ4/q77HbYAmWDNoKQf5tJ7yuyyOe6Ks/IZgbmIu28QJW8vgMogpdeI34LqYP+g35uftW5+PL0X4yDago2o7+KBFdZJoLo8U2+F3hWY/PNwrG5Ir7rpsV50kEU8/dTE07ie7H/jpSE2CkeeYhu0jzIyGXXJLHcB02SZW4B7nx2QG5p8TAw6mXWg43hOig9SH23fjvUKHEQ8z0cREN/P4IWEruH/HnSo4HN5ravc1QgVZ27Q5BX6zLnmORF+Rhooh1l4jTyibHMX8EArygYrxTyyKCbjRZ4BezDY5YCmUpH602EGUrRmGsW0H25sujYND3Wmy4DuH93RJZZ++T+rOu0rEtSi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3362.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39840400004)(346002)(136003)(396003)(366004)(5660300002)(2906002)(508600001)(71200400001)(54906003)(110136005)(122000001)(316002)(38100700002)(8936002)(8676002)(38070700005)(186003)(33656002)(53546011)(26005)(6506007)(6512007)(64756008)(66446008)(2616005)(66556008)(66476007)(7416002)(76116006)(66946007)(86362001)(83380400001)(4326008)(6486002)(36756003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGlGbVlLM3dGOTh0U0pKNjR2Z1VlSTI0S2pyUVZ3OFVHSm5LZ21oZmN6L1M1?=
 =?utf-8?B?UmtpeGFBY1QxUEF6M24yb0dBcnFFWGd4L0xnTFIzakJSY1ltUk9nbHYzNWlv?=
 =?utf-8?B?T01RRDJBM3ZLcEgwakdkLytqUVN5endlZE9vcVFuT3hwcUVCUjF5UVBlN0FR?=
 =?utf-8?B?c1JmeUUrdS9XSzVWUWlwKzl4a1FHWmoyTHZWNFBZU0V5dGtuRUMrRHBmeVFQ?=
 =?utf-8?B?N3Vnd3IxazdQMVMvb2NKcmZuMVAwMlgxTFJhVW11NzZGaFJubThsMHUyWkZy?=
 =?utf-8?B?OUEzUS95WjFkZlRBSm9yRUNjQkdmRjEyd0U4M2U0TmNnRlJTRDFqb1NwdVJr?=
 =?utf-8?B?Y2VZRDJ6WEpBRFJocXZxSk82N2wzVjhUaGpWbkdGM0pGZzZldlNmaEVsYnE5?=
 =?utf-8?B?Zmh2eFVZU1VoRE5KL2Fod0x6ZURkVXF0Qy90aGk2bkZEZUcwdUZqc3JTbitr?=
 =?utf-8?B?ZFUzTDh4S0JEc1dvdGN3Vk44dXFhMVpjVnI3MTVlR3ZZNnBKNkRtQnFaTGRk?=
 =?utf-8?B?UXlBUGlzb0ptVkZTU1luUEV4YmlyUlJUQVN6ODVGUVpYOHVNYTdpZkFXcE5w?=
 =?utf-8?B?bnhsMnRqa3liOTRMcjlhZFlWQ2ZEa3FZY2FkRnZMaGtlaXZSVmQwV1Bha2dn?=
 =?utf-8?B?dzg4OXE3aVRDdWlRYWNTWVQ4WWlQZHZQSDE1S2ZIZEc2UXJyUmhzVEFTQXY3?=
 =?utf-8?B?czlrMGJ3TXRTZ0JLT04wREU1bHdMRnJUang1RXk4blNmZFVsbWw1Q3BzVnB2?=
 =?utf-8?B?ejlUZ1FraEFTQWZCSWNDdzR5Wnhsa1U3Q2IzeHlEOVNaSUtQT1JFWEU0WWtz?=
 =?utf-8?B?SWdTWFk3RDBTamJHa3F2aFhub2RtUndiUlB1dXZPRHNNY3VLa1lBMkRFb1RV?=
 =?utf-8?B?dGVXQm1PZlltbkZlRm1HWjh1YnNhcjQvUTVzRkdhdkFNQi8xa0lkcWpNQmFv?=
 =?utf-8?B?R0JFSlcydDFJdUFNRTMzK3M1VnpUdkczV291djArbWJRcTRoa0ZzY1c5ZFlx?=
 =?utf-8?B?SDN2dDFxV3U3RDg2Y0NBdW81RWJ0V2dJK05hS090amxSVWlCOWFtYmUrNWl4?=
 =?utf-8?B?dW1mUGpRSndUVmFBbk9zTmVwb3RmNks0WDd2a2cvR0ZRUWRiMFd3dy9Ba2Ur?=
 =?utf-8?B?RFFtN0JraG1xV0xqazI0bTlNZWdqWDFiR3pPNysrSjhBaUhpNnNVRlo0clkr?=
 =?utf-8?B?cUVhbmx6VDRlT0dOamhoR09hS1d5bVM3a3B4bmw5NGJWK1JFTEZsRkhnejNj?=
 =?utf-8?B?eVF6R2R5OC91Z2daa2N3YjhTbTN0aGMrSnpFcVI1S1Q4QTROMWd6VDNKOUJR?=
 =?utf-8?B?K0NtRlJWR2d5ZWM5SFVWbjF4WVVWNWJFTVJ5aUdDSVp6ZG9yR3JJeXBINXpY?=
 =?utf-8?B?Y25VSmtPNUEydmczVW9YdjB0QzEyNWRmSVRtcGpuQnRZVGV1MUR5WEpyMFhM?=
 =?utf-8?B?bEM5TzNUUDdjaTFqbm9FckNSTnEvVVVFWUFWQm5PUnh3clRhMCt2WHJrNCtX?=
 =?utf-8?B?cEJya0IzOUczaVdSSVFzaXRCSExUYnV6SEZ0L2Y1OGI0YldSRmJQTWRZNUdZ?=
 =?utf-8?B?MGxwaFBEUHBLUkFiLy9Zc3NmSE5ZOVdRZ1ltTUZCUWRHVmNjc0V6Z2wrT1dO?=
 =?utf-8?B?TnVuMmtrVVBGWW5PNVUxYUNTK05aYllTbERhdFdKUmVyYlJBUFNIS1IzWHZS?=
 =?utf-8?B?eGRnQWlOcGlhUUdNdDljbkppMXhLR1VYTDRld2lXNnpWdE9rSkZmRWpqRDVV?=
 =?utf-8?B?TENad1BQY3VYelFBT3h0WjJpamtaZkdMNlNocFBGOUQ3Nm9jakd6Q0IrQmZT?=
 =?utf-8?B?cU9uTmp2MGlmbmsrQjNjSTVDY0t4MXRraTg2Z085R0pneVdMRHB0VE1XN2Zw?=
 =?utf-8?B?Mlp5VENzZTJjUTRoZlVtUjdsK0I0S000WGhpZGsxcmQzSzRqY002dVdxanJ4?=
 =?utf-8?B?aXdmL1p4eXI2NXZYMHFjRzNydWRha005NkJXMHplbytTK3BjTXdvRWJXTmJH?=
 =?utf-8?B?N1dlSk9sWnBDWXV3RUROVFhuRSt3S2VUUlZNQ1hCY3crRHltbHp1YWJPVWxt?=
 =?utf-8?B?WTlwZXpvaW9uelNtOEVNOTNVN3VzSHl2MVNXN004Q3Zyb0VqSW1QWERwTThZ?=
 =?utf-8?B?WXZ0b1F2aENFZndVU29ubnc2M0RhVnA0OUk2bHZkcTdVN1pZZ3JLYUxmSEVh?=
 =?utf-8?B?TUxlSGFPQ2ROT3hOZVNJU2FoTEU2Z1R0d2sxQ1l1TzZXejZMdG1ja2ZKSmtD?=
 =?utf-8?Q?qRUM3MdKrq7FAuIaVSFc6pFTwVqQJ5mW/lD0hubMaQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <524819F638462E4090C17291BCEDC6AB@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3362.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75040646-2ed4-4593-8545-08d9b9f1b1ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 02:23:16.9883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AuxvpDOoYBYdBpBCU54JbQarXKoSR3Wa1UBc47iM5fqir72uGi96Rc1hRUPFFeMT0EmcmTfDZhO+2L7q5Nchjrp0j0vifzagjsOWevRm8pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2676
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
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Hansen,
 Dave" <dave.hansen@intel.com>, "robh@kernel.org" <robh@kernel.org>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQpIaSBJd29uYSwNCg0KT24gMjAyMS8xMi84LCAyOjMwIEFNLCAiV2luaWFyc2thLCBJd29uYSIg
PGl3b25hLndpbmlhcnNrYUBpbnRlbC5jb20+IHdyb3RlOg0KDQogICAgT24gVGh1LCAyMDIxLTEy
LTAyIGF0IDAyOjMxICswMDAwLCBCaWxseSBUc2FpIHdyb3RlOg0KICAgID4gICA+IEhpIFpldiwN
CiAgICA+ICAgPiANCiAgICA+ICAgPiBPbiAyMDIxLzEyLzIsIDk6NTUgQU0sICJaZXYgV2Vpc3Mi
IDx6d2Vpc3NAZXF1aW5peC5jb20+IHdyb3RlOg0KICAgID4gICA+IA0KICAgID4gICA+ICAgICBP
biBXZWQsIERlYyAwMSwgMjAyMSBhdCAwMjozODowNEFNIFBTVCwgQmlsbHkgVHNhaSB3cm90ZToN
CiAgICA+ICAgPiAgICAgPiAgID5IaSwNCiAgICA+ICAgPiAgICAgPiAgID4NCiAgICA+ICAgPiAg
ICAgPiAgID5PbiAyMDIxLzExLzIzLCAxMDoxMCBQTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEl3
b25hIFdpbmlhcnNrYSINCiAgICA+ICAgPiA8b3BlbmJtYy1ib3VuY2VzK2JpbGx5X3RzYWk9YXNw
ZWVkdGVjaC5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBiZWhhbGYgb2YNCiAgICA+ICAgPiBpd29u
YS53aW5pYXJza2FAaW50ZWwuY29tPiB3cm90ZToNCiAgICA+ICAgPiAgICAgPiAgID4NCiAgICA+
ICAgPiAgICAgPiAgID4gICAgQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgcGVjaS1h
c3BlZWQgY29udHJvbGxlciBkcml2ZXIuDQogICAgPiAgID4gICAgID4gICA+DQogICAgPiAgID4g
ICAgID4gICA+ICAgID4gICArICBhc3BlZWQsY2xvY2stZGl2aWRlcjoNCiAgICA+ICAgPiAgICAg
PiAgID4gICAgPiAgICsgICAgZGVzY3JpcHRpb246DQogICAgPiAgID4gICAgID4gICA+ICAgID4g
ICArICAgICAgVGhpcyB2YWx1ZSBkZXRlcm1pbmVzIFBFQ0kgY29udHJvbGxlciBpbnRlcm5hbCBj
bG9jaw0KICAgID4gICA+IGRpdmlkaW5nDQogICAgPiAgID4gICAgID4gICA+ICAgID4gICArICAg
ICAgcmF0ZS4gVGhlIGRpdmlkZXIgd2lsbCBiZSBjYWxjdWxhdGVkIGFzIDIgcmFpc2VkIHRvDQog
ICAgPiAgID4gdGhlIHBvd2VyIG9mDQogICAgPiAgID4gICAgID4gICA+ICAgID4gICArICAgICAg
dGhlIGdpdmVuIHZhbHVlLg0KICAgID4gICA+ICAgICA+ICAgPiAgICA+ICAgKyAgICAkcmVmOiAv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCiAgICA+ICAgPiAgICAgPiAg
ID4gICAgPiAgICsgICAgbWluaW11bTogMA0KICAgID4gICA+ICAgICA+ICAgPiAgICA+ICAgKyAg
ICBtYXhpbXVtOiA3DQogICAgPiAgID4gICAgID4gICA+ICAgID4gICArICAgIGRlZmF1bHQ6IDAN
CiAgICA+ICAgPiAgICAgPiAgID4gICAgPiAgICsNCiAgICA+ICAgPiAgICAgPiAgID4gICAgPiAg
ICsgIGFzcGVlZCxtc2ctdGltaW5nOg0KICAgID4gICA+ICAgICA+ICAgPiAgICA+ICAgKyAgICBk
ZXNjcmlwdGlvbjoNCiAgICA+ICAgPiAgICAgPiAgID4gICAgPiAgICsgICAgICBNZXNzYWdlIHRp
bWluZyBuZWdvdGlhdGlvbiBwZXJpb2QuIFRoaXMgdmFsdWUgd2lsbA0KICAgID4gICA+IGRldGVy
bWluZSB0aGUgcGVyaW9kDQogICAgPiAgID4gICAgID4gICA+ICAgID4gICArICAgICAgb2YgbWVz
c2FnZSB0aW1pbmcgbmVnb3RpYXRpb24gdG8gYmUgaXNzdWVkIGJ5IFBFQ0kNCiAgICA+ICAgPiBj
b250cm9sbGVyLiBUaGUgdW5pdA0KICAgID4gICA+ICAgICA+ICAgPiAgICA+ICAgKyAgICAgIG9m
IHRoZSBwcm9ncmFtbWVkIHZhbHVlIGlzIGZvdXIgdGltZXMgb2YgUEVDSSBjbG9jaw0KICAgID4g
ICA+IHBlcmlvZC4NCiAgICA+ICAgPiAgICAgPiAgID4gICAgPiAgICsgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQogICAgPiAgID4gICAgID4gICA+ICAg
ID4gICArICAgIG1pbmltdW06IDANCiAgICA+ICAgPiAgICAgPiAgID4gICAgPiAgICsgICAgbWF4
aW11bTogMjU1DQogICAgPiAgID4gICAgID4gICA+ICAgID4gICArICAgIGRlZmF1bHQ6IDENCiAg
ICA+ICAgPiAgICAgPiAgID4gICAgPiAgICsNCiAgICA+ICAgPiAgICAgPiAgID4gICAgPiAgICsg
IGFzcGVlZCxhZGRyLXRpbWluZzoNCiAgICA+ICAgPiAgICAgPiAgID4gICAgPiAgICsgICAgZGVz
Y3JpcHRpb246DQogICAgPiAgID4gICAgID4gICA+ICAgID4gICArICAgICAgQWRkcmVzcyB0aW1p
bmcgbmVnb3RpYXRpb24gcGVyaW9kLiBUaGlzIHZhbHVlIHdpbGwNCiAgICA+ICAgPiBkZXRlcm1p
bmUgdGhlIHBlcmlvZA0KICAgID4gICA+ICAgICA+ICAgPiAgICA+ICAgKyAgICAgIG9mIGFkZHJl
c3MgdGltaW5nIG5lZ290aWF0aW9uIHRvIGJlIGlzc3VlZCBieSBQRUNJDQogICAgPiAgID4gY29u
dHJvbGxlci4gVGhlIHVuaXQNCiAgICA+ICAgPiAgICAgPiAgID4gICAgPiAgICsgICAgICBvZiB0
aGUgcHJvZ3JhbW1lZCB2YWx1ZSBpcyBmb3VyIHRpbWVzIG9mIFBFQ0kgY2xvY2sNCiAgICA+ICAg
PiBwZXJpb2QuDQogICAgPiAgID4gICAgID4gICA+ICAgID4gICArICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KICAgID4gICA+ICAgICA+ICAgPiAgICA+
ICAgKyAgICBtaW5pbXVtOiAwDQogICAgPiAgID4gICAgID4gICA+ICAgID4gICArICAgIG1heGlt
dW06IDI1NQ0KICAgID4gICA+ICAgICA+ICAgPiAgICA+ICAgKyAgICBkZWZhdWx0OiAxDQogICAg
PiAgID4gICAgID4gICA+SSBzdWdnZXN0IGRlbGV0aW5nIHRoZXNlIHRocmVlIHByb3BlcnRpZXMg
YW5kIHJlcGxhY2luZyB0aGVtIHdpdGggdGhlDQogICAgPiAgID4gZm9sbG93aW5nDQogICAgPiAg
ID4gICAgID4gICA+DQogICAgPiAgID4gICAgID4gICA+YXNwZWVkLHBlY2ktYml0LXRpbWU6DQog
ICAgPiAgID4gICAgID4gICA+ICAgICAgICBkZXNjcmlwdGlvbjoNCiAgICA+ICAgPiAgICAgPiAg
ID4gICAgICAgICAgVGhlIGJpdCB0aW1lIGRyaXZlbiBieSBQRUNJIGNvbnRyb2xsZXIuIFRoZSB1
bml0IG9mIHRoZQ0KICAgID4gICA+IHZhbHVlIGlzIEh6Lg0KICAgID4gICA+ICAgICA+ICAgPiAg
ICBtaW5pbXVtOiAyMDAwDQogICAgPiAgID4gICAgID4gICA+ICAgIG1heGltdW06IDEwMDAwMDAN
CiAgICA+ICAgPiAgICAgPiAgID4NCiAgICA+ICAgPiAgICAgPiAgID5BbmQgdGhlIGRyaXZlciBz
aG91bGQgdXNlIHRoaXMgcHJvcGVydHkgdG8gY2FjdWxhdGUgdGhlIGFwcHJvcHJpYXRlDQogICAg
PiAgID4gY2xvY2stZGl2aWRlciwNCiAgICA+ICAgPiAgICAgPiAgID5tc2ctdGltaW5nIGFuZCBh
ZGRyLXRpbWluZywgaW5zdGVhZCBvZiBleHBvc2luZyBoYXJkd2FyZSByZWdpc3RlcnMgdG8NCiAg
ICA+ICAgPiBkdHMuDQogICAgPiAgID4gICAgID4gICA+DQogICAgPiAgID4gDQogICAgPiAgID4g
ICAgID4gICBPciBwZXJoYXBzIGp1c3QgJ2J1cy1mcmVxdWVuY3knIGEgbGEgaTJjLWFzcGVlZCwg
Z3Bpby1hc3BlZWQtc2dwaW8sDQogICAgPiAgID4gZXRjPw0KICAgID4gICA+IA0KICAgID4gICA+
IEl0J3MgYSBnb29kIGlkZWFsIGZvciB0aGUgY29uc2lzdGVuY3kuDQoNCiAgICA+ICAgSWYgd2Ug
d2FudCB0byBnbyB3aXRoIHBhc3NpbmcgZnJlcXVlbmN5IC0gSSB3b3VsZCBwcmVmZXIgdG8gZ28g
d2l0aCAiY2xvY2stDQogICAgPiAgIGZyZXF1ZW5jeSIgYW5kIHVzZSBjbG9jayBmcmFtZXdvcmsg
Zm9yIGV4cG9zaW5nIGl0IHRvIHBlY2ktYXNwZWVkIChhcyBJDQogICAgPiAgIG1lbnRpb25lZCBp
biByZXBseSB0byBwYXRjaCAwNSkuDQoNCiAgICA+ICAgV2hhdCBkbyB5b3UgdGhpbms/DQoNCkdv
b2QuDQpJdCBsb29rcyB0aGF0ICJjbG9jay1mcmVxdWVuY3kiIGlzIG1vcmUgY29tbW9uIHVzYWdl
Lg0KDQpUaGFua3MNCg0KQmVzdCBSZWdhcmRzLA0KQmlsbHkgVHNhaQ0KDQo=
