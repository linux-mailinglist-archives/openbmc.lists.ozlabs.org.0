Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E8E31E0D2
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 21:52:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dgqlq5rYyz3cVc
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 07:52:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=InventecCorp.onmicrosoft.com header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-InventecCorp-onmicrosoft-com header.b=cf1igKYR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=2a01:111:f400:febe::720;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=udupa.ashwini@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=cf1igKYR; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on0720.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::720])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgqlZ4YBGz3cJQ
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 07:52:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCSK2BeyjB2pIlxEpIKICCFw+xZCsAuBQhs8nvb8nAVTqz1n5CaLuti4Yj4eP+9JMYAlgyktNK1zJkH1b02eIvab6bUXg+DJxj92BE9imjXQp4PdH1A51ifiduHXcw/Ov2q9tXcCdNMsYuyVoqHArxESYWmNx2XW7tSNpPtlovXKEky9Hb7xulAMXDKxu871lAUanKOtTIk3/eb4H4qQN7ZWog+1Hh/n4BW+LLojJCVrgztbNNlmnptM9GveYSveKpqbvVNVzrJpJb7kltXURSddddIf//dYN3AzBgx65C02fE5C+TQgc3Z8JspF1er3/PsBzmE53wZGm2tFNer/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6PN7JzW0Bzxa6Pg7f5m8tHyjkWgoAUP69sEZ6I00ZQ=;
 b=Y3jVIV52GSgVJkMvzCGpwV2PT90Hk/HWVm1f6w1jOPV0GS+T0/xJUG2TOd6o1WnQgbGFCNN/8qoADy/T3nfBR6BWtIdQqCyVbqNdOtbCi67QYrcp7C4F8xb8DSZaZifW6DpasIZAH9rVeqmmDzjpxFGzghFB85qG6PGAeZkNSZTot4HMsdrsYJJSPGlbKuHHGA1F6uLlTY1jINGAQD1XgAKk/qpZsn6cvPEtoORHH9FEMXOmIhwL4z2FbxFijdOZcU4XkLmdqCbPBbvNni94gkWoRX5XW0ltKZ42ZUGrErm31y0p6Myni7Aaj9edo4kwlo9YlDGvlc1Bt7bg/ABkXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6PN7JzW0Bzxa6Pg7f5m8tHyjkWgoAUP69sEZ6I00ZQ=;
 b=cf1igKYRGitJCgEuSWEZ/AL5o3bNCm4LXmpL75lSS7x+8tEqFltMrJgT/vihtUxXC6sBVKvG69LuZ0PnI7LIZVKpW7t5lKbWeDlQ7ZJkvTHzalYwpBhYxcq95EtXp0Qe8VsnLzeMZV33/D+8cXSglSbgUaaC/chw6Kl7SaZYsOs=
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com (2603:1096:4:59::20) by
 SG2PR02MB4363.apcprd02.prod.outlook.com (2603:1096:0:f::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.28; Wed, 17 Feb 2021 20:51:43 +0000
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::740c:c7c0:872f:1ccc]) by SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::740c:c7c0:872f:1ccc%7]) with mapi id 15.20.3846.039; Wed, 17 Feb 2021
 20:51:42 +0000
From: Udupa.Ashwini ISV <udupa.ashwini@inventec.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: Redfish v1/Systems/system/EthernetInterfaces
Thread-Topic: Redfish v1/Systems/system/EthernetInterfaces
Thread-Index: AdcA6cGzNFkuOxBET+q6tGgjuo9o4ABSXQ1wAABT3oAAzSYpUAAAbvSAAAC2Q9A=
Date: Wed, 17 Feb 2021 20:51:42 +0000
Message-ID: <SG2PR02MB2796D7A6B15C18F348369F0A85869@SG2PR02MB2796.apcprd02.prod.outlook.com>
References: <SG2PR02MB2796B5FB2DB9AAAE2594BA1E858B9@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <SG2PR02MB27961D3A938C94341747757C858A9@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX807_KpeTHnMqPMt8E+h_ggMpKy0_Jr82HPV+oRushXdXw@mail.gmail.com>
 <SG2PR02MB2796736A2D3DCEB0AC9AEC9985869@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX80r9dYEGbwftH32Sc6fRmDLHeYg24tdO+8hME9V_bDDCg@mail.gmail.com>
In-Reply-To: <CACWQX80r9dYEGbwftH32Sc6fRmDLHeYg24tdO+8hME9V_bDDCg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=inventec.com;
x-originating-ip: [24.6.83.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8f0b204a-0549-4ed8-169e-08d8d385d4c9
x-ms-traffictypediagnostic: SG2PR02MB4363:
x-microsoft-antispam-prvs: <SG2PR02MB4363C7E04477484ACD24E25E85869@SG2PR02MB4363.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 75Djbka+EUcF1Vzb5YErPXs0GzpFmK1Sa7FZS2eNSRrdWfDm5zlNcHUQDy5Dbd1Lj55pgTWYLoq1U+Bi/JA/42beKMtioZgF+c6lyz6B8Q3G+gu4//s0DjDravOpm9k2NbP6+wSOqT32YR/QnqZnwR/c3zsIt3JFSmfzokWnUO/VllYvd+DXc0YmvRAd1vGON9fBT1qzHvm+0iFBtfjq3lPNexUqjjT5eE39Oohnvq4T0Rd2Y0K04WB7XgBfVqS4JeN67I5UBfUfgY8XFRkFAih7hq9JU8hxrazgTRod+o+c21vnG8vHM6UbpGDSKIb0Rem8EjBsbkDz3WT2Rkc2KbPf8iXcg/zWBd5NNGhvotPZwKYM8KK1QVFF0DxuOo20IrgDcSF/s2kyFXI+2lag66i9/NdJPZoPo9Yp8zuzRrn3vS0sZbDTbiPOoSs4l+oIbbyetHQDGFg7GY0J9j0aQpYz+Lw3+iuYMRUQ0hzwKx+brNydTA+ReFPsZynOUUpxL/882uXLU7G1aORzabH0myoCSOZIqkUUFCTuvtSrt1DYWDg+YRs8Q9zXiCBuLJK2/vgirO1jKEIwAguN5A1MkplVspw+CBZY+8L7m/dXOlc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR02MB2796.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(66446008)(966005)(76116006)(53546011)(6916009)(5660300002)(55016002)(2906002)(64756008)(66556008)(71200400001)(66476007)(86362001)(7696005)(52536014)(186003)(66946007)(26005)(33656002)(8936002)(19627235002)(4326008)(8676002)(83380400001)(6506007)(9686003)(316002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aWRwRDlma3pUd0RHeFlBTExqeDdwL3pkeG1SZSswTUVDbW8wMGVhMUJpd3dQ?=
 =?utf-8?B?bEpRalYrZHN2OWFsZzRFbG9SMGN3ek52a3kzL0UzK3RtSU1OT2NSUGN1TWRB?=
 =?utf-8?B?K1cwRjNpbEpJdWhGTmZiMExhT2RvcjNiNDgreHVrVWxTRGZaYzJxU2ZTMjRq?=
 =?utf-8?B?VU5lR1RucU5PSGR2MStRbk9HdjB3OGMwc0VraVFsZnZyaG9NWlVvQ1JTUFZH?=
 =?utf-8?B?S3FIcWVFa1Y1NjNZTlFsSGpEbFJYS0JlcDJyM3FJZ2plbkh2UUx2MDNINE9u?=
 =?utf-8?B?NGFheDFVTDRtbVNxUWh6UEJpejRiTWNXbVIvUXNBcStXYmRCbi9ueXlUcHIr?=
 =?utf-8?B?TmtYdFF2UzNtOXhDak9IUUE0WmFUK2RDT0RKV3F5cWRoMU1jdm9DRlFGblUw?=
 =?utf-8?B?VnVlQ3FGbGI0QjlaWHJRYXluUUEzMTdhWVB1aDhscU80RjlBaEtBT0I0ZHp3?=
 =?utf-8?B?ZGRSTXZWWWtIVW51SHo5TFhVZEo2VEQwR0tQSXZheHYrKy9oVGpiYjNqbWtW?=
 =?utf-8?B?T1VjNzlVSkRubHJUNTREVkNiSmJUL1hPTjBZZUdSTGFOdzBDYmVJTzFwTEM4?=
 =?utf-8?B?R3AxUHp1MW9WSU9ZNkNSb1d1VUJ1aERzVXcvOXhMUzlISWI5eXJvSVk1d0pD?=
 =?utf-8?B?OElUZVhjdEk3ellxZXlkUnp1UTF3cFNKWWM2RmVZNHlHWXhBTk9CZy94WlBG?=
 =?utf-8?B?MExCL0pEK3VOWEtsY1hDelJXb2R1aTJhQnBPdGpXWW03QWk3OUMvTklkTzQ2?=
 =?utf-8?B?K3BMci8waWRZR0lwN3FWc051Z2lzR2h5eHVOSWczRDhWMTFXZHMzU20xaHNX?=
 =?utf-8?B?WFNXVVlSeHVIS1puTy9MWW5TaGs1MUJjVDA3WkNlZHJoMUp1QmptK3lDS203?=
 =?utf-8?B?RkdnRm1TNnhzcllpSTd1MnZvaUlsbTdiMGxwQnlBd3NLNGlYL1NmYVo5OCtp?=
 =?utf-8?B?RDVYNE5XckkzOC93aDBHd0VvQTQxeUlNMEJEOVVSWktiTzlVWTE3K1UwNEpN?=
 =?utf-8?B?dDdiYXdSZVQ3dEx6VWE2bit0L1RBVC9qeFhlWEN4YzNsU1lnTXMyN3JNRjcz?=
 =?utf-8?B?dGkybmxjenZNZ2xDZGRmWWNPR3RHd3VQaTlEeXJWYzdkSjhUOWM3SDdKRmJX?=
 =?utf-8?B?TWFLNW1Sc2Zuc3B1aFcyOGZRTFY1Mm9qUkE0MDZFY20waDhnYkhhbzExR1Zj?=
 =?utf-8?B?UVcrM3VTZDZHK3RFRFd1N2VualJHS0xlS0ZCeUZncXg4UnRDdE9KWDQ4RTdj?=
 =?utf-8?B?VUxYUzhGS2YyeXNUYXF3NFd5RW1Ec3Y0bVFDYTROb2djQTBLVnlDNFkwdy9l?=
 =?utf-8?B?djlSOU81aW1oL1RkeEc4RVc4WGovSmNONFBPVHl3R3QyUmZJUWlVM1ZmSUhs?=
 =?utf-8?B?bzZheUhmQnVaR0hvOVlyOU9EUi9ZK0poNkNwNGpIY00yL2FUNmgwVzBpZzNH?=
 =?utf-8?B?TGZUaThiTURGSjF6a1U4NDB2bDZOdEVVN2p0ZFhBNVlrOGtKSXcvOXhBVXhZ?=
 =?utf-8?B?aTRnRlZ4dnhuRzFOM3ZJR3hTOHRDL0RBd0hHSXZFT2Q5cjIycHU5d1IwSjRp?=
 =?utf-8?B?UVlmZnAyMkhNZTNJaENFQzhhTmlMWkMzc0Q0RlZ3K20zMHIvaFQ0VW5xNytD?=
 =?utf-8?B?b2hYZUtjTFNPZGt5NlNxZXpUSDg0ODRsNWNHRWh5UXBtdnhIMy9ScTBxTExD?=
 =?utf-8?B?Q3VyaFBVSXVRUWExUzJtODZ2MWF3ZFJmZERReFNLc1dmNmxjSGVVaEw4c0I3?=
 =?utf-8?Q?Zpq0xRq3K0/M5xbFNs=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB2796.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0b204a-0549-4ed8-169e-08d8d385d4c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2021 20:51:42.5815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JZMWeERmkaWbGCWYSwGYCK65rCn5c6609PLj7Qun83x+mx+I30RroERcBvPW5uvEJUzbl2PTrw54o6oJPhf02+glVSUBJQlCQwggYUE+D5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB4363
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmtzIEVkLg0KU28sIG9ubHkgdGhvc2UgaW1wbGVtZW50ZWQgaW4gImJtY3dlYi9yZWRmaXNo
LWNvcmUvbGliLyIgIGFyZSBjdXJyZW50bHkgaW1wbGVtZW50ZWQgaW4gT3BlbkJNQyBSZWRmaXNo
IHJpZ2h0Pw0KSSBkb27igJl0IHNlZSBiZWxvdyBpbXBsZW1lbnRlZCB0b286DQpTeXN0ZW1zL3N5
c3RlbS9Cb290T3B0aW9ucw0KDQpCdXQsIGFyZSB0aGVzZSBpbXBsZW1lbnRlZD8gDQoxLiBTeXN0
ZW1zL3N5c3RlbS9OZXR3b3JrSW50ZXJmYWNlcw0KMi4gU3lzdGVtcy9zeXN0ZW0vUENJZUZ1bmN0
aW9ucw0KSWYgc28sIHdoYXQgY2hhbmdlcyBhcmUgbmVlZGVkIHRvIG1ha2UgdGhlc2Ugd29ya2lu
Zz8NCg0KUmVnYXJkcywNCkFzaHdpbmkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IEVkIFRhbm91cyA8ZWRAdGFub3VzLm5ldD4gDQpTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5
IDE3LCAyMDIxIDEyOjI0IFBNDQpUbzogVWR1cGEuQXNod2luaSBJU1YgPHVkdXBhLmFzaHdpbmlA
aW52ZW50ZWMuY29tPg0KQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6
IFJlZGZpc2ggdjEvU3lzdGVtcy9zeXN0ZW0vRXRoZXJuZXRJbnRlcmZhY2VzDQoNCk9uIFdlZCwg
RmViIDE3LCAyMDIxIGF0IDEyOjEzIFBNIFVkdXBhLkFzaHdpbmkgSVNWIDx1ZHVwYS5hc2h3aW5p
QGludmVudGVjLmNvbT4gd3JvdGU6DQo+DQo+IEhpIEVkLA0KPg0KPg0KPg0KPiBJdHMgSW52ZW50
ZWMgcGxhdGZvcm0uDQo+DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvdHJl
ZS9tYXN0ZXIvbWV0YS1pbnZlbnRlYw0KPg0KPiBJIGp1c3Qgd2FudGVkIHRvIGtub3cgaG93IHRv
IGltcGxlbWVudCAvcmVkZmlzaC92MS9TeXN0ZW1zL3N5c3RlbS9FdGhlcm5ldEludGVyZmFjZXMu
DQoNCkV4Y2VsbGVudCwgdGhhdCBoZWxwcy4gIEkgb3JpZ2luYWxseSBtaXNyZWFkLCBhbmQgdGhv
dWdodCB0aGUgaW50ZXJmYWNlIHdhcyBtaXNzaW5nIG9uIHRoZSBwbGF0Zm9ybSwgbm90IHRoYXQg
eW91IHdlcmUgdHJ5aW5nIHRvIGFkZCBpdCB0byByZWRmaXNoLg0KDQo+DQo+DQo+DQo+IFJlZ2Fy
ZHMsDQo+DQo+IEFzaHdpbmkNCg0KUGxlYXNlIGRvbid0IHRvcCBwb3N0Lg0KDQo+DQo+DQo+DQo+
IEZyb206IEVkIFRhbm91cyA8ZWRAdGFub3VzLm5ldD4NCj4gU2VudDogU2F0dXJkYXksIEZlYnJ1
YXJ5IDEzLCAyMDIxIDEwOjE4IEFNDQo+IFRvOiBVZHVwYS5Bc2h3aW5pIElTViA8dWR1cGEuYXNo
d2luaUBpbnZlbnRlYy5jb20+DQo+IENjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gU3Vi
amVjdDogUmU6IFJlZGZpc2ggdjEvU3lzdGVtcy9zeXN0ZW0vRXRoZXJuZXRJbnRlcmZhY2VzDQo+
DQo+DQo+DQo+DQo+DQo+DQo+DQo+IE9uIFNhdCwgRmViIDEzLCAyMDIxIGF0IDEwOjExIEFNIFVk
dXBhLkFzaHdpbmkgSVNWIDx1ZHVwYS5hc2h3aW5pQGludmVudGVjLmNvbT4gd3JvdGU6DQo+DQo+
DQo+DQo+IEhpLA0KPg0KPg0KPg0KPiBJIGFtIG5ldyB0byBPcGVuQm1jIGFuZCBSZWRmaXNoLg0K
Pg0KPiBJIHNhdyBpbiBibWN3ZWIvUmVkZmlzaC5tZCwgdGhhdCBiZWxvdyBSZWRmaXNoIGlzIHRh
cmdldGVkIGZvciBPcGVuQm1jOg0KDQpUaGlzIGRvYyBpcyByZWFsbHkgb2xkLCBhbmQgd2FzIG9y
aWdpbmFsbHkgd3JpdHRlbiBhcyBhbiBpbml0aWFsIHN0YWIgYXQgd2hhdCBpbnRlcmZhY2VzIHdl
IHNob3VsZCB3cml0ZS4gIFVuZm9ydHVuYXRlbHksIHdoZW4gaXQgZ290IGNvbnZlcnRlZCBpbnRv
IGEgImhlcmUncyB0aGUgaW50ZXJmYWNlcyB3ZSBzdXBwb3J0IHRvZGF5IiBkb2MsIHRoYXQgcGF0
aCBkaWRuJ3QgZ2V0IHNjcnViYmVkLiAgV2UgZG9uJ3QgaGF2ZSBhbiBpbXBsZW1lbnRhdGlvbiBv
ZiBpdCB0b2RheS4gIEkgY2FuIGdldCBhIHJldmlldyBvcGVuIHRvIHVwZGF0ZSB0aGUgZG9jLg0K
DQo+DQo+IC9yZWRmaXNoL3YxL1N5c3RlbXMvc3lzdGVtL0V0aGVybmV0SW50ZXJmYWNlcw0KPg0K
Pg0KPg0KPiBCdXQsIGluIHJlZGZpc2gtY29yZS9saWIvc3lzdGVtcy5ocHAsIEkgZG9u4oCZdCBz
ZWUgRXRoZXJuZXRJbnRlcmZhY2VzIGFuZCBJIGRvbuKAmXQgc2VlIGl0IG9uIG15IHNlcnZlciBS
ZWRmaXNoIHRvby4NCg0KVG9kYXksIHdlIGRvbid0IGhhdmUgdGhpcyBpbXBsZW1lbnRlZCBiZWNh
dXNlIHdlIGRvbid0IHJlYWxseSBoYXZlIGEgcGF0aCB0byBnZXQgdGhhdCBpbmZvcm1hdGlvbiBm
cm9tIHRoZSBob3N0LiAgRG9pbmcgdGhhdCB3b3VsZCByZXF1aXJlIGVpdGhlciBhbiBpbi1iYW5k
IGFwcGxpY2F0aW9uIHJ1bm5pbmcgb24gdGhlIG1haW4gcHJvY2Vzc29yIHRvIHNlbmQgbmV3IGlw
IGFkZHJlc3NlcyB0byB0aGUgYm1jLCBvciBhbiBOQ1NJLCBNQ1RQLCBvciBQTERNIGNvbm5lY3Rp
b24gZGlyZWN0bHkgdG8gdGhlIE5JQyB0aGF0IHN1cHBvcnRlZCBnZXR0aW5nIHRoYXQgbGV2ZWwg
b2YgaW5mb3JtYXRpb24uDQpCb3RoIG9mIHdoaWNoIGxpa2VseSByZXF1aXJlIGEgbmV3IGRhZW1v
biB0byBleHBvc2UgdGhvc2UgQVBJcyB0byBkZWJ1Zy4NCg0KV2UgZG8gaGF2ZSAvcmVkZmlzaC92
MS9TeXN0ZW1zL2h5cGVydmlzb3IvRXRoZXJuZXRJbnRlcmZhY2VzIHRvZGF5Lg0KV2UnZCBpZGVh
bGx5IHdhbnQgdG8gZm9sbG93IHZlcnkgY2xvc2VseSB0byB3aGF0IHRoYXQgZG9lcywgZXhwb3Nl
IGEgbmV3IHBhdGggb24gREJ1cyB0aGF0IGltcGxlbWVudHMgdGhlIHh5ei5vcGVuYm1jX3Byb2pl
Y3QuTmV0d29yay5FdGhlcm5ldEludGVyZmFjZSBpbnRlcmZhY2UsIGFuZCBncmFiIHRoZSBkYXRh
IGZyb20gaXQuDQoNCj4NCj4NCj4NCj4gV2hhdCB1cHN0cmVhbSBzeXN0ZW0gYXJlIHlvdSB0cnlp
bmcgdGhpcyBvbj8gIElmIHlvdXIgcGxhdGZvcm0gaXNu4oCZdCB1cHN0cmVhbSwgY2FuIHlvdSBw
b2ludCBhdCB0aGUgY29kZSByZXZpZXcgd2hlcmUgeW914oCZcmUgYWRkaW5nIGl0Pw0KPg0KPg0K
Pg0KPiBJZiB5b3UgZG9u4oCZdCBoYXZlIGVpdGhlciwgdGFrZSBub3RlIHRoYXQgaXTigJlzIHJl
YWxseSBkaWZmaWN1bHQgdG8gaGVscCBkZWJ1ZyBvciBtYWtlIHN1Z2dlc3Rpb25zIGZvciBwbGF0
Zm9ybXMgdGhhdCB3ZSBjYW7igJl0IHNlZSB0aGUgY29kZSBmb3IuDQo+DQo+DQo+DQo+IEl0cyBv
bmx5IHByZXNlbnQgaW4gTWFuYWdlcnMvYm1jL0V0aGVybmV0SW50ZXJmYWNlcy4NCj4NCj4NCj4N
Cj4gSG93IGRvIEkgYWRkIFN5c3RlbXMvc3lzdGVtL0V0aGVybmV0SW50ZXJmYWNlcyBSZWRmaXNo
IHN1cHBvcnQ/IFdoYXQgY2hhbmdlcyBkbyBJIG5lZWQgdG8gbWFrZT8NCj4NCj4NCj4NCj4gUmVn
YXJkcywNCj4NCj4gQXNod2luaQ0KPg0KPg0KPg0KPiAtLQ0KPg0KPiAtRWQNCg==
