Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F00524C818E
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 04:14:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K72RC0pdgz3bqL
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 14:14:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=aMJgelLk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feae::70b;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=aMJgelLk; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::70b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K72Qj44gBz3bbw
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 14:14:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsrxdovca3VuUdzVYt/jhzZh5EhCP4Br1nwOJ9pERkF3eHCpxzTz5i/WsnvXQc7SMHdw+I/8/KJlu48I5EcFsOJFIIoV/V9AT4RMaHQtTIwjoTzAAgv97cFQdalLDGnsvYiwg82VrlubpXBth/AsIEeryuiSuzxJ7phLRLK5Ub2sS7bAwuZjK9YBpKcjrbWjaXkm3dp9+d6CGUlpVLj2QZAMK9UgTIvmy2Dqxgzh2UkiijiqfIm9A5dtuJ4oclu0iye4KF6cI2ZzJK8i8xlOovC+j7Yud+720+j4Z+0nrjcSr6q0ThTsd1IouhtIZWTo84EDyFaP78J2wRkdTdB3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4PX6TkMBCiNyUB+tL3rAH9XhN5IgyXpXSgvKHYJTY4=;
 b=hDx6RjImSaXbX2aVkgD5N0qJwUuuJCVsmR9XuVLqkocaz7NEuznlVw93EhcO0BpEoAwWzSf3ZPPi6NPKSUOqnemOZB84PjAS/ceQBmJ7Ncz7cfTZ+bH7zMli+MDFZx1QSRqhRb6zd9cRw8iwrjhZp7VjPqqyLYrQ8LbjEsnA2dT2soHrxV57CSeL/RArGHMgB+2CQ1FjhErbJPJwfsQbeeOGp1XgyrWvR+6D6MLmM1gGZiLUkvqoNEKGdUAtGPac2/bpS+1U3o6y/sWTArv/IWnSkIV2V1w3MxtPjE8trHJWIZ3++ygYgLX8EdtkqYqcvzIlcbInF7DeSU6DRbg0UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4PX6TkMBCiNyUB+tL3rAH9XhN5IgyXpXSgvKHYJTY4=;
 b=aMJgelLkKGL93uIEnryq8UF7TfO9JcbL1iWrPr3axZr8TW48qerTz9LXfSZvBYiuArcuKoV1h+fgEs0kgZrqH7hLkj5sDLCy/pMHcrr8j7uPDd2bME2c/SBvm7sVvKt8+Kyi9haayJ2INDX5lEi+8aja3uBYDLujTPM9iY97Th8=
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com (2603:1096:203:46::21)
 by PSAPR04MB4616.apcprd04.prod.outlook.com (2603:1096:301:64::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 03:13:44 +0000
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::6010:4e0e:4180:14c2]) by HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::6010:4e0e:4180:14c2%7]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 03:13:44 +0000
From: =?utf-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>, George Hung <ghung.quanta@gmail.com>
Subject: RE: [PATCH u-boot v2019.04-aspeed-openbmc 1/1] ARM: dts: aspeed: add
 Quanta S6Q machine dts
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc 1/1] ARM: dts: aspeed: add
 Quanta S6Q machine dts
Thread-Index: AQHYLRNGAY2aGD7Zh0G5f3MrcNcBqKyp0K8A
Date: Tue, 1 Mar 2022 03:13:44 +0000
Message-ID: <HK0PR04MB23394082DE0F46CA8111B1A18F029@HK0PR04MB2339.apcprd04.prod.outlook.com>
References: <20220301011135.14066-1-george.hung@quantatw.com>
 <CACPK8XcSkQ0HpAMAh8o_jouVprWrdnTOA0dn07Wkoo-5ZWfMew@mail.gmail.com>
In-Reply-To: <CACPK8XcSkQ0HpAMAh8o_jouVprWrdnTOA0dn07Wkoo-5ZWfMew@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ad808d8-61d1-4585-e93e-08d9fb317eae
x-ms-traffictypediagnostic: PSAPR04MB4616:EE_
x-microsoft-antispam-prvs: <PSAPR04MB4616D3ACA612D060EEEEEB898F029@PSAPR04MB4616.apcprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ACtv+bA4JwCRCnR4lUi1II5Gd6zvOUFbxcRvLjKjH+HIMJEEkF7mal0B4XS45Xfa/m3iNndQjPumvIkKV5MnmKh7wmUGFA9nvIMDCmZQA9y5znbmRGoTw4G8nBlkFq0UysjE2R2EGUiWLUBrXes7uD7daG3VJ4eMG1t6y30sAXWPDKwphU7s07BwYH8tv0adtIdyUiYQo6WXlZO76bz0q+zsUouLPHxRHp4IhEM+BKwWn6sb08NLTODZ9Q20bNvD+nUt2wXz9p4cN1zhkF6CdzHXjdU974Am97acVpfOsSekr2yXsVeX22HVY8ECqZBgSA6lJJzer+tQ2EXmF7VvdiT/wvqusgbUNGkt/5iQHzH2V0w3e5kkt1XA4SacXLBY8yCTPWO48diGsikOUX6Sbre7CjGwH0L32jKGU+0waPMpwr9tNGE6IONN/0htgsPSy5EK7S6AS02sZgSPUniVnScuHvmrE1L57bkjvAygn4GH4xX6wXSSz363uRNiUTinynQfgmJcbwmVT5sMsVWCIIe+8nFOy6kfbUCnKy966JYRogV/jwhPJmOmDbDQq5ppXpkMLUkzsP1h79kvX6sFzQInaMUpq4vlYTnqdT+/rlyP+HEHI4a9jF5OvkvmshS7e0+EbLPKhalQt7vz2mFKFJwyXJTrsHjTAp8wh/pLCi5pPlhdasWMrB5HKYWrM9Qq+RC1IzZFVPJtJwmBiiFI+w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2339.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(9686003)(508600001)(107886003)(83380400001)(186003)(26005)(54906003)(85182001)(55016003)(110136005)(7696005)(6506007)(316002)(38100700002)(2906002)(38070700005)(122000001)(5660300002)(33656002)(86362001)(66476007)(8676002)(66446008)(8936002)(64756008)(52536014)(66556008)(4326008)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clo5amtSQkpXTXRNOWl1dWd2U0V4V25kZTZxeENyazBVQTRwWGhuQzZJUzE2?=
 =?utf-8?B?ZWVSbVJYYm5pYkZnVnEwRys0QnU2TW5LZTVTdDlzb0l0eU5GUklFcnZuWHBH?=
 =?utf-8?B?d2VjMTlOSW11UjYvOSt0c05UK1AwNVM4akh1SmlUcXhsYTMvNnZYTzZNQXNK?=
 =?utf-8?B?dVo4RS9WdjVjempNZis2RjhhNzVRVVVmN2xVNHdabHFwTnBJNWw2V0lWLzR1?=
 =?utf-8?B?OEdEZXkrczNrTDJOd3cvb3RmUWdVSTFQcGVTeDdXditVcFkxdGxrVUtWQ1hL?=
 =?utf-8?B?SjdlQkd5VXNSeGtZRGF1dWFCL1U2OGJaVlJQbWQxUVlFWFY1eGUvRzVEZkhD?=
 =?utf-8?B?M2JQZ1NJNXIxWHczWVFhNmxTeTIxalFuZ3pzY0Z2QXFBZVJZNWVTU2V3VDB5?=
 =?utf-8?B?VUwzU2wxOCtYY3YycUZqNlkvQ3pKNkVZOVN0djc3ckdLT0drM3NkS0NkcDRm?=
 =?utf-8?B?c3pxeVNFbExQMXp4SlQzdzRpamRRR3krV0MvV0FPNHVHVC94dWRwbHpnTTJ3?=
 =?utf-8?B?WDZjY2N1RzlrU3JGWVZuZU1lclN6SVlPWTNnRGFUMVd4cXFWRko0Z0FTUnBy?=
 =?utf-8?B?M2RDVk4xcVRQSGN5OFdlcEtqaUhsMFl3c0tWcEdFUlVLZ2Qrc0JRTlhDdUF2?=
 =?utf-8?B?R3pjejlyQVlOVlVScWxORnBMSHA1cElHb2Z0cGtDR3NGUHZ3S3MxSU1ERUJv?=
 =?utf-8?B?MlhkeEpxYXgzWS9URDgyTUdCU0tzem1XMnF2QzVqUmVZYTJoNzVxL3BZU3B3?=
 =?utf-8?B?VDB2by9pdytkSHdpRGZrb1VCSDROQm00ZG5CaWcyRUJzME5mNmNMbWc1Ty9Y?=
 =?utf-8?B?S0hsMXZTdHh0cXd1bnN4MTh4b21Mci8wdDFuaWpZOHk1elB5cy9KeXlxR2Zl?=
 =?utf-8?B?bHJjejNwL2dWb25waE13MVpscWhRTnE3aEFEMW90WllsZkIxQTV1UmoxanBk?=
 =?utf-8?B?Zy84MzU1RHpzcU1QenM0NWNOVUVjN0V5UUk2dEZIVEQwNDJiZm5HbS9XWnQy?=
 =?utf-8?B?T2tUWkxGZTQ4dEZJZFZNOVUvd2hFVXlCL2swSHlibzdmWnZMSXg0Z0VQVDA1?=
 =?utf-8?B?VmQ5b0hLaGVLa1VHRkYxK2xOZElMQUtuWmRLeW9DUDJQODI3dTNQMGVmQ1NU?=
 =?utf-8?B?SzNTOUUxS1lrVU1POTJmM3RQUzljZmJYOSsxNnBLRmM1QW45Rjh0WThybWNy?=
 =?utf-8?B?VDJUb28rZE5ZbnFabnhDcWtTV1oxSXVFVXd1YnVoTGkvc2YrRlppVzYwREtT?=
 =?utf-8?B?RENQbnVrNzc5WXkzeG1XdG45R0xkMGovNEVMMGpWVmdZQ1NrazgwSzdkQ1lo?=
 =?utf-8?B?TVVDbE40ZGtiM2dpMThrNWVmS0JJZ2Y3V21FMXl1L2dNeU1Ya3AzQi9VOU96?=
 =?utf-8?B?WGgySHhVUEZzWTJmVk1uaFpmZUVmUHFIVmZoeFRja2hCYzY4SG5ZUGp6a2E3?=
 =?utf-8?B?NnVlNklLWTgzME9PZXR2QkdUZWpBOUdrbWFoZ3JnMW9ZZnlzYUxuZFFtWDJT?=
 =?utf-8?B?RHhBcjZWeFB5UzQ5clpZN2JHeFpaTlpmMUVxckpkT0tuRlV2Z05LWkQrK1M2?=
 =?utf-8?B?K1YwcjFsMGgxbXc3d1RnMUkxSFFxc2FCZGJmbTR2QkUxeTREcHBlYjFUbVJt?=
 =?utf-8?B?MEVBdXVsa2pxRGdNbHNyZ1dLelpsVCt5dnBlMzJidm1aTUhudElMWDdlK29i?=
 =?utf-8?B?a3h0ZzhrSElPMktLS1ZLRGdoOEtOUkhjaTN0LzdaenlFTk1SSE8zR3ZxRjlT?=
 =?utf-8?B?MkZtRnJIRE5FUlZaRm9YWDdxYjVGT1JTUm9YN0JiK3ZmcEcwMWRuSWZOMnFv?=
 =?utf-8?B?MDdZTlBxZmdvNjZRaENCUHd6RUc5RmFjbDN2ZmUzSWFiRXZaKzZiTUV6bk1U?=
 =?utf-8?B?Q0ppbnAzMVNSdmswT2E4ZWphWDRZSkh0U3E4dVNXV2lmdUZTV2EzT2o3NjVX?=
 =?utf-8?B?MlBRYklVTjdpOHNoNkxDd2F1Ny9xeGlLaW1UV3BmYjNjWXFsMk9Yb3BjVEtP?=
 =?utf-8?B?UlUrWHdqZEVhRTUvaXlSVURjUTdoQU9EdmJISkJrM2ZyZlN3R0w2MnFUZXhF?=
 =?utf-8?B?OVc2YnJBa1hLWHJhOHdxbUh5N2tySjdSaGJxQUFsSkFpdVFMN0lnbGcwcGNz?=
 =?utf-8?B?ODBuaW5KYlVZQ2YvMWU0bHhDV2crZFpiZXkvUkFsU2h1aGliWUtMMEVVUVU0?=
 =?utf-8?B?cmxXZi9ZRzR6SWJobVpqNkhjQ1R0NVpvdjhob3NBeG9BcEVRZUU0QXhua1dB?=
 =?utf-8?B?YlZNRmpINmswRTV5SzlwK1QzYU53PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2339.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad808d8-61d1-4585-e93e-08d9fb317eae
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 03:13:44.6216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zSAwx7tqqpl98AmqscHZIT+UJAyxo7kxZXEL3RrrXGaCTlO76b7edDuUldeRauCzKxSR8vMjofzF/SuxdVv3GTSCyVwqRuLqhOwC6fl8ioE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR04MB4616
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
Cc: =?utf-8?B?QWxhbiBLdW8gKOmDreaMr+e2rSk=?= <Alan_Kuo@quantatw.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?utf-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Pk9uIFR1ZSwgMSBNYXIgMjAyMiBhdCAwMToyMywgR2VvcmdlIEh1bmcgPGdodW5nLnF1YW50YUBn
bWFpbC5jb20+DQo+d3JvdGU6DQo+Pg0KPj4gQWRkIGJ1aWxkIHN1cHBvcnQgZm9yIFF1YW50YSBT
NlEgYm9hcmQgZXF1aXBwZWQgd2l0aA0KPj4gQVNUMjYwMCBCTUMgU29DDQo+DQo+SGkgR2Vvcmdl
LA0KPg0KPldoaWNoIGNvbmZpZ3VyYXRpb24gKGRlZmNvbmZpZykgZG8geW91IHJ1biB5b3VyIHN5
c3RlbSB3aXRoPw0KDQpIaSBKb2VsLA0KDQpXZSB1c2UgImV2Yi1hc3QyNjAwYTEtc3BsX2RlZmNv
bmZpZyIgZm9yIFM2USBzeXN0ZW0uDQoNCj4NCj5Ib3cgZGlmZmVyZW50IGlzIHRoaXMgY29uZmln
dXJhdGlvbiBmcm9tIG90aGVyIHBsYXRmb3JtcyBwcmVzZW50IGluIHRoZSB0cmVlPw0KDQpOb3Qg
bXVjaCBkaWZmZXJlbmNlOg0KDQoxLiBSR01JSSBmb3IgbWFjMiBhbmQgZW5hYmxlIG1kaW8zIGZ1
bmN0aW9uIHBpbnMNCjIuIHNwaTIgZm9yIEJJT1MgZmxhc2gNCjMuIG1hYyBkZWxheSBmb3IgbWFj
Mi9tYWMzIHRvIHByZXZlbnQgbmV0d29yayBhYm5vcm1hbCBhZnRlciBBL0MNCjQuIEkyQyBidXNl
cyBlbmFibGVkIGFjY29yZGluZyB0byBTNlEgcGxhdGZvcm0NCg0KPg0KPkkgYXNrIGFzIEkgd29u
ZGVyIGlmIHdlIGNhbiBnZXQgYXdheSB3aXRoIHNvbWUgY29tbW9uIGNvbmZpZ3MgaW4gdS1ib290
LA0KPndpdGhvdXQgcmVxdWlyaW5nIGV2ZXJ5IHBsYXRmb3JtIGFkZCB0aGVpciBvd24gZHRzLg0K
DQpEb2VzIGl0IG1lYW4geW91J2QgbGlrZSB0byBhZGQgdGhlIGFkZGl0aW9uYWwgY29tbW9uIGR0
cyBmb3IgQVNUMjYwMCA/DQo+DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIEh1bmcgPGdl
b3JnZS5odW5nQHF1YW50YXR3LmNvbT4NCj4+IC0tLQ0KPj4gIGFyY2gvYXJtL2R0cy9NYWtlZmls
ZSAgICAgICAgfCAgIDEgKw0KPj4gIGFyY2gvYXJtL2R0cy9hc3QyNjAwLXM2cS5kdHMgfCAyMTgN
Cj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgMiBmaWxlcyBjaGFu
Z2VkLCAyMTkgaW5zZXJ0aW9ucygrKQ0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9k
dHMvYXN0MjYwMC1zNnEuZHRzDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9NYWtl
ZmlsZSBiL2FyY2gvYXJtL2R0cy9NYWtlZmlsZSBpbmRleA0KPj4gZTVhNzM2OTdjNS4uYTc5Zjg4
NWY1NCAxMDA3NTUNCj4+IC0tLSBhL2FyY2gvYXJtL2R0cy9NYWtlZmlsZQ0KPj4gKysrIGIvYXJj
aC9hcm0vZHRzL01ha2VmaWxlDQo+PiBAQCAtNjg2LDYgKzY4Niw3IEBAIGR0Yi0kKENPTkZJR19B
UkNIX0FTUEVFRCkgKz0gXA0KPj4gICAgICAgICBhc3QyNjAwLW5jc2kuZHRiIFwNCj4+ICAgICAg
ICAgYXN0MjYwMC1wZnIuZHRiIFwNCj4+ICAgICAgICAgYXN0MjYwMC1yYWluaWVyLmR0YiBcDQo+
PiArICAgICAgIGFzdDI2MDAtczZxLmR0YiBcDQo+PiAgICAgICAgIGFzdDI2MDAtc2x0LmR0YiBc
DQo+PiAgICAgICAgIGFzdDI2MDAtdGFjb21hLmR0Yg0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybS9kdHMvYXN0MjYwMC1zNnEuZHRzDQo+PiBiL2FyY2gvYXJtL2R0cy9hc3QyNjAwLXM2cS5k
dHMgbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXgNCj4+IDAwMDAwMDAwMDAuLjUyYjYyMGQzYjQN
Cj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2FyY2gvYXJtL2R0cy9hc3QyNjAwLXM2cS5kdHMN
Cj4+IEBAIC0wLDAgKzEsMjE4IEBADQo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjArDQo+PiArLy8gQ29weXJpZ2h0IDIwMjIgUXVhbnRhIENvcnAuDQo+PiArL2R0cy12MS87
DQo+PiArDQo+PiArI2luY2x1ZGUgImFzdDI2MDAtdS1ib290LmR0c2kiDQo+PiArDQo+PiArLyB7
DQo+PiArICAgICAgIG1vZGVsID0gIlF1YW50YSBTNlEgQk1DIjsNCj4+ICsgICAgICAgY29tcGF0
aWJsZSA9ICJxdWFudGEsczZxLWJtYyIsICJhc3BlZWQsYXN0MjYwMCI7DQo+PiArDQo+PiArICAg
ICAgIG1lbW9yeSB7DQo+PiArICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsN
Cj4+ICsgICAgICAgICAgICAgICByZWcgPSA8MHg4MDAwMDAwMCAweDQwMDAwMDAwPjsNCj4+ICsg
ICAgICAgfTsNCj4+ICsNCj4+ICsgICAgICAgY2hvc2VuIHsNCj4+ICsgICAgICAgICAgICAgICBz
dGRvdXQtcGF0aCA9ICZ1YXJ0NTsNCj4+ICsgICAgICAgfTsNCj4+ICsNCj4+ICsgICAgICAgYWxp
YXNlcyB7DQo+PiArICAgICAgICAgICAgICAgc3BpMCA9ICZmbWM7DQo+PiArICAgICAgICAgICAg
ICAgc3BpMiA9ICZzcGkyOw0KPj4gKyAgICAgICAgICAgICAgIGV0aGVybmV0MCA9ICZtYWMyOw0K
Pj4gKyAgICAgICAgICAgICAgIGV0aGVybmV0MSA9ICZtYWMzOw0KPj4gKyAgICAgICB9Ow0KPj4g
Kw0KPj4gKyAgICAgICBjcHVzIHsNCj4+ICsgICAgICAgICAgICAgICBjcHVAMCB7DQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8ODAwMDAwMDAwPjsNCj4+ICsg
ICAgICAgICAgICAgICB9Ow0KPj4gKyAgICAgICAgICAgICAgIGNwdUAxIHsNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDw4MDAwMDAwMDA+Ow0KPj4gKyAgICAg
ICAgICAgICAgIH07DQo+PiArICAgICAgIH07DQo+PiArfTsNCj4+ICsNCj4+ICsmdWFydDUgew0K
Pj4gKyAgICAgICB1LWJvb3QsZG0tcHJlLXJlbG9jOw0KPj4gKyAgICAgICBzdGF0dXMgPSAib2th
eSI7DQo+PiArfTsNCj4+ICsNCj4+ICsmc2RyYW1tYyB7DQo+PiArICAgICAgIGNsb2NrLWZyZXF1
ZW5jeSA9IDw0MDAwMDAwMDA+OyB9Ow0KPj4gKw0KPj4gKyZ3ZHQxIHsNCj4+ICsgICAgICAgdS1i
b290LGRtLXByZS1yZWxvYzsNCj4+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPj4gK307DQo+
PiArDQo+PiArJndkdDIgew0KPj4gKyAgICAgICB1LWJvb3QsZG0tcHJlLXJlbG9jOw0KPj4gKyAg
ICAgICBzdGF0dXMgPSAib2theSI7DQo+PiArfTsNCj4+ICsNCj4+ICsmd2R0MyB7DQo+PiArICAg
ICAgIHUtYm9vdCxkbS1wcmUtcmVsb2M7DQo+PiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4+
ICt9Ow0KPj4gKw0KPj4gKyZtZGlvIHsNCj4+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPj4g
KyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPj4gKyAgICAgICBwaW5jdHJsLTAg
PSA8JnBpbmN0cmxfbWRpbzNfZGVmYXVsdD47DQo+PiArICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+Ow0KPj4gKyAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4+ICsNCj4+ICsgICAgICAgZXRo
cGh5MjogZXRoZXJuZXQtcGh5QDIgew0KPj4gKyAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4+
ICsgICAgICAgfTsNCj4+ICt9Ow0KPj4gKw0KPj4gKyZtYWMyIHsNCj4+ICsgICAgICAgc3RhdHVz
ID0gIm9rYXkiOw0KPj4gKyAgICAgICBwaHktbW9kZSA9ICJyZ21paSI7DQo+PiArICAgICAgIHBo
eS1oYW5kbGUgPSA8JmV0aHBoeTI+Ow0KPj4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1
bHQiOw0KPj4gKyAgICAgICBwaW5jdHJsLTAgPSA8JnBpbmN0cmxfcmdtaWkzX2RlZmF1bHQ+OyB9
Ow0KPj4gKw0KPj4gKyZtYWMzIHsNCj4+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPj4gKyAg
ICAgICBwaHktbW9kZSA9ICJybWlpIjsNCj4+ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IjsNCj4+ICsgICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX3JtaWk0X2RlZmF1bHQ+OyB9
Ow0KPj4gKw0KPj4gKyZmbWMgew0KPj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+PiArDQo+
PiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+PiArICAgICAgIHBpbmN0cmwt
MCA9IDwmcGluY3RybF9mbWNxdWFkX2RlZmF1bHQ+Ow0KPj4gKw0KPj4gKyAgICAgICBmbGFzaEAw
IHsNCj4+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNwaS1mbGFzaCIsICJzc3QsdzI1
cTI1NiI7DQo+PiArICAgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPj4gKyAgICAgICAg
ICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsNCj4+ICsgICAgICAgICAgICAg
ICBzcGktdHgtYnVzLXdpZHRoID0gPDQ+Ow0KPj4gKyAgICAgICAgICAgICAgIHNwaS1yeC1idXMt
d2lkdGggPSA8ND47DQo+PiArICAgICAgIH07DQo+PiArfTsNCj4+ICsNCj4+ICsmc3BpMiB7DQo+
PiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4+ICsNCj4+ICsgICAgICAgcGluY3RybC1uYW1l
cyA9ICJkZWZhdWx0IjsNCj4+ICsgICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX3NwaTJfZGVm
YXVsdCAmcGluY3RybF9zcGkyY3MxX2RlZmF1bHQNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICZwaW5jdHJsX3NwaTJjczJfZGVmYXVsdA0KPj4gKyAmcGluY3RybF9zcGkycXVhZF9kZWZhdWx0
PjsNCj4+ICsNCj4+ICsgICAgICAgZmxhc2hAMCB7DQo+PiArICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJzcGktZmxhc2giLCAic3N0LHcyNXEyNTYiOw0KPj4gKyAgICAgICAgICAgICAgIHN0
YXR1cyA9ICJva2F5IjsNCj4+ICsgICAgICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDw1
MDAwMDAwMD47DQo+PiArICAgICAgICAgICAgICAgc3BpLXR4LWJ1cy13aWR0aCA9IDw0PjsNCj4+
ICsgICAgICAgICAgICAgICBzcGktcngtYnVzLXdpZHRoID0gPDQ+Ow0KPj4gKyAgICAgICB9Ow0K
Pj4gK307DQo+PiArDQo+PiArJmkyYzAgew0KPj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+
PiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+PiArICAgICAgIHBpbmN0cmwt
MCA9IDwmcGluY3RybF9pMmMxX2RlZmF1bHQ+OyB9Ow0KPj4gKw0KPj4gKyZpMmMxIHsNCj4+ICsg
ICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPj4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1
bHQiOw0KPj4gKyAgICAgICBwaW5jdHJsLTAgPSA8JnBpbmN0cmxfaTJjMl9kZWZhdWx0PjsgfTsN
Cj4+ICsNCj4+ICsmaTJjMiB7DQo+PiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4+ICsgICAg
ICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4+ICsgICAgICAgcGluY3RybC0wID0gPCZw
aW5jdHJsX2kyYzNfZGVmYXVsdD47IH07DQo+PiArDQo+PiArJmkyYzMgew0KPj4gKyAgICAgICBz
dGF0dXMgPSAib2theSI7DQo+PiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+
PiArICAgICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF9pMmM0X2RlZmF1bHQ+OyB9Ow0KPj4gKw0K
Pj4gKyZpMmM0IHsNCj4+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPj4gKyAgICAgICBwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPj4gKyAgICAgICBwaW5jdHJsLTAgPSA8JnBpbmN0cmxf
aTJjNV9kZWZhdWx0PjsgfTsNCj4+ICsNCj4+ICsmaTJjNSB7DQo+PiArICAgICAgIHN0YXR1cyA9
ICJva2F5IjsNCj4+ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4+ICsgICAg
ICAgcGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzZfZGVmYXVsdD47IH07DQo+PiArDQo+PiArJmky
YzYgew0KPj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+PiArICAgICAgIHBpbmN0cmwtbmFt
ZXMgPSAiZGVmYXVsdCI7DQo+PiArICAgICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF9pMmM3X2Rl
ZmF1bHQ+OyB9Ow0KPj4gKw0KPj4gKyZpMmM3IHsNCj4+ICsgICAgICAgc3RhdHVzID0gIm9rYXki
Ow0KPj4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPj4gKyAgICAgICBwaW5j
dHJsLTAgPSA8JnBpbmN0cmxfaTJjOF9kZWZhdWx0PjsgfTsNCj4+ICsNCj4+ICsmaTJjOCB7DQo+
PiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4+ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IjsNCj4+ICsgICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzlfZGVmYXVsdD47
IH07DQo+PiArDQo+PiArJmkyYzkgew0KPj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+PiAr
ICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+PiArICAgICAgIHBpbmN0cmwtMCA9
IDwmcGluY3RybF9pMmMxMF9kZWZhdWx0PjsgfTsNCj4+ICsNCj4+ICsmaTJjMTEgew0KPj4gKyAg
ICAgICBzdGF0dXMgPSAib2theSI7DQo+PiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7DQo+PiArICAgICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF9pMmMxMl9kZWZhdWx0PjsgfTsN
Cj4+ICsNCj4+ICsmaTJjMTQgew0KPj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+PiArICAg
ICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+PiArICAgICAgIHBpbmN0cmwtMCA9IDwm
cGluY3RybF9pMmMxNV9kZWZhdWx0PjsgfTsNCj4+ICsNCj4+ICsmaTJjMTUgew0KPj4gKyAgICAg
ICBzdGF0dXMgPSAib2theSI7DQo+PiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
DQo+PiArICAgICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF9pMmMxNl9kZWZhdWx0PjsgfTsNCj4+
ICsNCj4+ICsmZGlzcGxheV9wb3J0IHsNCj4+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPj4g
K307DQo+PiArDQo+PiArJnNjdSB7DQo+PiArICAgICAgIG1hYzItY2xrLWRlbGF5ID0gPDB4MDgg
MHgwNA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAweDA4IDB4MDQNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgMHgwOCAweDA0PjsNCj4+ICsgICAgICAgbWFjMy1jbGstZGVsYXkg
PSA8MHgwOCAweDA0DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDggMHgwNA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAweDA4IDB4MDQ+Ow0KPj4gK307DQo+PiArDQo+PiAr
JmhhY2Ugew0KPj4gKyAgICAgICB1LWJvb3QsZG0tcHJlLXJlbG9jOw0KPj4gKyAgICAgICBzdGF0
dXMgPSAib2theSI7DQo+PiArfTsNCj4+ICsNCj4+ICsmYWNyeSB7DQo+PiArICAgICAgIHUtYm9v
dCxkbS1wcmUtcmVsb2M7DQo+PiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4+ICt9Ow0KPj4g
LS0NCj4+IDIuMzIuMA0KPj4NCg==
