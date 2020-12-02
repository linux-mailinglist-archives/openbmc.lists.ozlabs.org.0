Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA3A2CB4AC
	for <lists+openbmc@lfdr.de>; Wed,  2 Dec 2020 06:48:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm7LD6ZR1zDqg8
	for <lists+openbmc@lfdr.de>; Wed,  2 Dec 2020 16:48:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Two or more type
 TXT spf records found.) smtp.mailfrom=amperecomputing.com
 (client-ip=40.107.243.98; helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=qnguyen@amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amperecomputing.com header.i=@amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=Ohbh7lv0; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2098.outbound.protection.outlook.com [40.107.243.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm4mF5vTBzDqZT
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2020 14:52:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcjGpaaq6PCng4UISBafoi/ydfS8I0Sv6KBn2EPA5gthrbyvTC1EGBlcmXqQKt3k277VPd83KszoL83SLvbaiqdaHK/QHWXsBNluzuyFWV8TYBzgD39jvak8oEhv2jUYbHi5mJxncjH4NzdJK0AwH31k6s5PjToFNZgUMQXcnxws1blmXHSg4/Pvhk/l10AwQQNT9kMAKSgtRvoBMOtDdCn9iYF5PNmn5i1NX1ogaX2Fq/U33JbjXXBEAEH2bTe/SxjaCGhYd/mHiuCW8iVT88leJ7X7bFq03bXcgV1KrsCin04kvR7ti7AVi6AYdwZR36qTai0MAtJ7JMqUSlFj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhinUq1qXMz3fekpQpfWTS4SBL2cBvHwaAejCvFBKm8=;
 b=kW+W3H0XDdFQKmK4ZumU/XLiu+kSvK3iIecbAYgaWmbaBzrBiDNBOzziOT+BfDUA6Je3rB3YbZu6fOzgFdbgpG3tDzI7Q6bZRZxGfpEpyz2WXKX0keBi/PK36pKHHwoH9rhCIbZfPxe593+qRjQUaL7yxhCE4dwpcEdwzirXGyWF5yUwooDTQpCf5qHQMRof2LQsRLFWe087vo/nflSh87/fULhzus3qy9Ze3zVVJWa6z4j464BiRUkCHMA2tjpH5W7TAMe3KwH8Egpox+MmXVzNgAaNBuDpYlxMAbGkJgmrJ76w4BJocgzDq5ECKled6BPsxT1fvqRWy2dz4xviXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amperecomputing.com; dmarc=pass action=none
 header.from=amperecomputing.com; dkim=pass header.d=amperecomputing.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amperecomputing.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhinUq1qXMz3fekpQpfWTS4SBL2cBvHwaAejCvFBKm8=;
 b=Ohbh7lv0psfJkGoGYMJHTVWLCpd8vjw1Q5ZWpzRO+F9MVjBkvqoCTxjt/nbbzXvxsxlsuHSx0Ehdj/tgwA6CmKyZZQ11PlAtiyMAalK0otgbnrx9GMgsJ3dNDy8E7fmMZZq8QQOx5gvXV6D67l1WJLVlGQJZs5/w4BzqbbEPE0E=
Received: from BYAPR01MB4853.prod.exchangelabs.com (2603:10b6:a03:91::15) by
 BYAPR01MB4534.prod.exchangelabs.com (2603:10b6:a03:9a::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.31; Wed, 2 Dec 2020 03:52:00 +0000
Received: from BYAPR01MB4853.prod.exchangelabs.com
 ([fe80::41c8:874:e9e4:68e7]) by BYAPR01MB4853.prod.exchangelabs.com
 ([fe80::41c8:874:e9e4:68e7%7]) with mapi id 15.20.3611.023; Wed, 2 Dec 2020
 03:52:00 +0000
From: Quan Nguyen <qnguyen@amperecomputing.com>
To: Andrew Jeffery <andrew@aj.id.au>, Quan Nguyen OS
 <quan@os.amperecomputing.com>, Joel Stanley <joel@jms.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: vendor-prefixes: Add an entry for
 AmpereComputing.com
Thread-Topic: [PATCH v2 1/2] dt-bindings: vendor-prefixes: Add an entry for
 AmpereComputing.com
Thread-Index: AQHWyF57dAQQITAM9E+ZFClDIgxyKg==
Date: Wed, 2 Dec 2020 03:52:00 +0000
Message-ID: <E5C4D818-B178-408F-8B48-641E11A75C47@amperecomputing.com>
References: <20201130081733.18893-1-quan@os.amperecomputing.com>
 <20201130081733.18893-2-quan@os.amperecomputing.com>
 <6e28c009-dbf9-4d6e-bc98-ccaa5e0c9b02@www.fastmail.com>
In-Reply-To: <6e28c009-dbf9-4d6e-bc98-ccaa5e0c9b02@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none
 header.from=amperecomputing.com;
x-originating-ip: [118.69.219.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50475839-d3f6-482a-10c0-08d896759f96
x-ms-traffictypediagnostic: BYAPR01MB4534:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR01MB4534CF9B4EBAAC92DB7DC6E9B4F30@BYAPR01MB4534.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ShTa2XWju0hfFYl0Koku854pTLFo3CQZM1LnLFKvn6ufrOGGqTJ7q++kxmCeEWo5X/6bCDZmkrQDbr5yTtrQTRG7InD+FXSEzJ3s1t4VVLAf834R47c966KwnV99QFz9NdQdduSkXK4rovmDuAnV8/nnDeKk9c1v3zkIEQOBN0JcC3aUQaNNwQv2BJn39NhJ3uf8NZgB10BpxGXRmwohC98G7awgvCPQk5xhnucbsAShL9cLm1lWO1pkyA+LfYUm6dwFSLJfgEc9lkhfQfM8myKy0SFJFb/5++3yEp3MjtaOrxYPduZtghXvCCq9YgD0yTEovr1EGbSIuRkNa73hpA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4853.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(396003)(366004)(346002)(376002)(86362001)(8676002)(8936002)(6486002)(33656002)(186003)(26005)(5660300002)(4326008)(6512007)(107886003)(66476007)(6506007)(71200400001)(316002)(110136005)(83380400001)(54906003)(64756008)(66946007)(36756003)(76116006)(2616005)(66556008)(91956017)(478600001)(66446008)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SW1FS0NHUjJoaUhGb2xLM1lPQzA2VGNDcnpYMTlsTzJJYjNnK0pGTHNMRVRR?=
 =?utf-8?B?WEpCUXRCTytKNmtyUXhrK29HSVNoREE2UE5FYndHdTg1cG9xMzYvTktvRTdR?=
 =?utf-8?B?YmxvSGd3Vk1UTmJWOXF1SEJUdENGV2RaVERma3I5RERqYllPN2hHTmR0dTUx?=
 =?utf-8?B?dStkL0ZRajRsd2FUZ3VFdjRaOXlNN2o4WmE5R1FlbkdQRzlLNTQ5RFhvTFVl?=
 =?utf-8?B?R3E3TmxFVlhlanpMSU9JQ0NlQlp0SWlWUzlMdHUxdnQzM0RjTytqT05GS2t6?=
 =?utf-8?B?dEVoWS9tdW9NWHFxNnlRbS9ISk5tdk5vbXVSNnFwV1RaWEVQQnJSaEJGbDNJ?=
 =?utf-8?B?TGsrZFhJNFVpVjNadHpsdDhqc1E4OTg4a1BtN2lDcXVrOGZZOU9wUUU2NmxD?=
 =?utf-8?B?Zk1EL1F2a0ZrR0JnLy9zTHZ0SFhVd0QraTBDaHMzN2k1V2lBT2NKenJIb05w?=
 =?utf-8?B?STR3NnR6WlV5Sm50Q1diOURzSDU3MVJSemtVNW5yNUNEWEZDdjdXV2Z5VXVG?=
 =?utf-8?B?a2h1ZXJNcHpmZVljb0RvSlB3R3poL2FJQ0JmYmhkWFgrYTNnODg1WVNsRTFv?=
 =?utf-8?B?b0ZjNkNSbHdGVVpkQ3NsUzVra2xzQmVoSW1rLzYyVzFFdE1QakFXMjYwakxT?=
 =?utf-8?B?T2JONWphY0lJdmxyY3NqdmhNQmp5eC81aUNrVk4rTmtzYzJXWWZIVkMxSkE1?=
 =?utf-8?B?a3VRUFh0dWh3bjB6SThNWmhOS1pRWFdwdjdxNCtqcnFHM2REUFNJUkNJQzBm?=
 =?utf-8?B?dFRvNGxzeGM5bVhBVlJmamRSTTNXN2ZSeDR1MHdBa1h0NThpYWlRWDFPanI2?=
 =?utf-8?B?Tlp1M3NYT0gwLzZSMG5IQjA0cXY5TzlrRXdZV2YyWUVZRHB4TDlNMVdiaGdO?=
 =?utf-8?B?b2pSUVlzbWlHMnQ2MDVOeHY5c2srV3BPK3A2bW9nQzI5QVJMVjdZL21vZEl0?=
 =?utf-8?B?OXhSSVhzMHBVTlFEdDU5NkZBNnZxK211em9FUG9hc21qVEdCT3ZGaWVhZDEw?=
 =?utf-8?B?OGVPRjRtLzNJd1ZrQUM2QkdoQWo1QTNCSkY2VHpZOWs5TFFnSFJRSWpWdU5r?=
 =?utf-8?B?L1pwbzQ2R3UrTGc5bE40YVgrM28vVGo1NDVYQmFSenI5eTZjemNHWVpYaVN5?=
 =?utf-8?B?OHlnMUduZnJGL1NxRTFrc3diYy9Rbm1JZmtub3hmNWExeXRHME5qV0MvVnhw?=
 =?utf-8?B?dXRpUlFwT2gzc0k5RzU3NGsvbVJwTW1JVzNUVWNOZ2ZRdTY4bVJqenl6NThM?=
 =?utf-8?B?RHE1dHgxc2VMZEVFZlpQWjE0OVYyOTViRG1UYjJsUDFUdWRVa2J2NlZERElq?=
 =?utf-8?Q?k7kekpIwmkRfwqXtOXK89j5iGSwOZOAMPZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36073CD72C119147A0B23FE6C8B7B905@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4853.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50475839-d3f6-482a-10c0-08d896759f96
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 03:52:00.4817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bu2AFK/F4c2u1SV9TNmC5SCnYMbqIYmDt3zBEA5/NN9DboAZvTsPU3Myfbml/7qQkJ9+xxLZQ1aHxsnTPM0hCKdi3b/Nqix0n+XxkSlnw/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4534
X-Mailman-Approved-At: Wed, 02 Dec 2020 16:47:41 +1100
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 Thang Nguyen OS <thang@os.amperecomputing.com>,
 Phong Vo OS <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmtzIEFuZHJldywNCkkgd2lsbCBzZW50IHRoaXMgcGF0Y2ggdG8gdXBzdHJlYW0uDQoNCkFu
ZCBJJ20gd29uZGVyIGlmIHlvdSBjb3VsZCBhY2snIGVkIGFuZCBtZXJnZWQgdGhlIERUUyBwYXRj
aCBpbiB0aGlzIHNlcmllcyA/DQrvu79PciBpZiB5b3UgaGF2ZSBhbnkgY29tbWVudC4NCg0KVGhh
bmsgeW91LA0KLVF1YW4NCg0KT24gTW9uLCAzMCBOb3YgMjAyMCwgYXQgMTg6NDcsIFF1YW4gTmd1
eWVuIHdyb3RlOg0KPiBBZGQgImFtcGVyZSIgZW50cnkgZm9yIEFtcGVyZSBDb21wdXRpbmcgTExD
OiBhbXBlcmVjb21wdXRpbmcuY29tDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIE5ndXllbiA8
cXVhbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBQaG9uZyBWbyA8
cGhvbmdAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogVGhhbmcgUS4g
Tmd1eWVuIDx0aGFuZ0Bvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPiAtLS0NCj4gIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCB8IDIgKysNCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgDQo+IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sDQo+
IGluZGV4IDYwNDE2NmVjYWVmYi4uMTBmMTJlOTg3NjJmIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwNCj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sDQo+
IEBAIC04NSw2ICs4NSw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOg0KPiAgICAgIGRlc2NyaXB0aW9u
OiBTaGVuemhlbiBBbWVkaWF0ZWNoIFRlY2hub2xvZ3kgQ28uLCBMdGQNCj4gICAgIl5hbWxvZ2lj
LC4qIjoNCj4gICAgICBkZXNjcmlwdGlvbjogQW1sb2dpYywgSW5jLg0KPiArICAiXmFtcGVyZSwu
KiI6DQo+ICsgICAgZGVzY3JpcHRpb246IEFtcGVyZSBDb21wdXRpbmcgTExDDQoNClRoaXMgbG9v
a3Mgb2theSB0byBtZSwgYnV0IGl0IHNob3VsZCBnbyB1cHN0cmVhbS4NCg0KUmV2aWV3ZWQtYnk6
IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+DQoNCg==
