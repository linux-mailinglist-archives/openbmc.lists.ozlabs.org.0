Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 302293B2C78
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 12:32:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9c0C3DL8z3bry
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 20:32:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=zcwLXMln;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.131.97;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=zcwLXMln; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310097.outbound.protection.outlook.com [40.107.131.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9bzv2X7Gz2xtk
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 20:32:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hc7Ztk4rdtPOupRkln2P/HuTuBSrTyyguhSoTDxgVxH0fN6IOpEYMa1NzvwTJ4dg0Q60CRvHia+5nQdW7YgTH1Lm+4PmFYNi3NeqmiAjdSx+q+H2Cs3MNgm617MXsnD57mxY6JgHF/yEAH9RmQKyvrG8j9+pjpoOBgAF7FxECHDOfxYF94KlKrYHjclRluKFQvrKhcZw4Lu1J94U7gNQU6kwF/4HI7Q08jLEXyb4jgYC7hI61A1giELpuOdnuQq0p/NELt2CC86CgNRFGXwmHezb5il7PmYPykx7pRB15OEoRJxHb9kX7NT2+qpPkocxkHZvs2DNg/OVAimIpvOhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTc6EDSflRGqu1PPhhFE7LmHxdJOXzico+i4Jc1o77Y=;
 b=JXmuI05oBnNqdNqUGEIYH/vULbJQc5VWReNO3UuuAdJsafNtT7rYMt4s81tYKv5G1m2KRGa8onaXSkYOKkmeoGY3AiI8ggi7XHLPK2QTv0RCX1SiTkDBDg3JkUOS5ssNn3SXzMeb8Euk5tXyH8Xup4lQ9iptMmofoLkbJSFvKAxJ9ZU93VWLxeEqOEcqOOMwRKbLA9G8m2kI34EfC/ym5pZxN4AtZl7dOqkoinNH+wi4WyO0cPbNHY/N1pvHVi3OWgBLOjU/QrGIlRonA4d5VdKIbDRSF41xW5QuOraFt6PnP9feSeCMVHpvKDsEDDenBZfhJqh8EbwtJ7nFaNmiQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTc6EDSflRGqu1PPhhFE7LmHxdJOXzico+i4Jc1o77Y=;
 b=zcwLXMlnCny1IVmVy/0j790efEfMVqIfX2FiPduQjrcC7apc3e32i3KM5HQKx3d4lUMuGR4q5Rt/xMcLmALpHvy9Dk9Sa+B0jk/k/U3gDsbIZCKalFfVAgtiSqIKAPo8mf2LVlkW1olkIj6MpG8K12F8gFDlqsInGcRzHBFpJ0I=
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com (2603:1096:203:46::21)
 by HK0PR04MB3395.apcprd04.prod.outlook.com (2603:1096:203:8c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Thu, 24 Jun
 2021 10:32:16 +0000
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::413b:f02:85d8:d3c4]) by HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::413b:f02:85d8:d3c4%7]) with mapi id 15.20.4264.019; Thu, 24 Jun 2021
 10:32:15 +0000
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: Lei YU <mine260309@gmail.com>
Subject: RE: IPMI SEL logs from phosphor-logging
Thread-Topic: IPMI SEL logs from phosphor-logging
Thread-Index: AddorFgGhia7RR/HS3OBZTqnX6OaRAAKaTSAAAN2TnA=
Date: Thu, 24 Jun 2021 10:32:15 +0000
Message-ID: <HK0PR04MB2339F60563CC547CF6CF90D68F079@HK0PR04MB2339.apcprd04.prod.outlook.com>
References: <HK0PR04MB23393424624A1F752D3BDAAB8F079@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <CAARXrtmf2S+oma1_60=pkHCEMFBAxFP4dSVSnR6Nqurt1PFEgg@mail.gmail.com>
In-Reply-To: <CAARXrtmf2S+oma1_60=pkHCEMFBAxFP4dSVSnR6Nqurt1PFEgg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e01eaa6-d14f-4540-968c-08d936fb5624
x-ms-traffictypediagnostic: HK0PR04MB3395:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR04MB3395C8B38FF5252438C8DD718F079@HK0PR04MB3395.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KJ8qe48Vr4OIAiau+/lvfOn2nKiOUsUIOhtzZ/pVpuMAS28TUqpBBsnWuQ0V8YB8fZKKzXc02XWOh6OosFojBvjNhUkN/Zo0fCDeNMsKihnAwaw/vJO/xOmYr9xLn9/B+AUYLdkHqqJrP3QZ5pScCGnW6eXtWi9Q6OxWJYUD/RVvVQ/xkmtSaWWhnSco4arnRqj2CLQoCygbCgxDZi0NxQFF6JfPNfommcUlSXg8tuuRFhSOB1HJZnhcn2AztsmmO59xBSr9CnoFFoNyRvpllKG8T70beThxdKt5vOG1vfeuL1wIW9w8+U6pdqTnj2Bh/VAR3nipytSiuhdxzHtPuPuWZl9q6Tp9wBnsLS01Z1lAOBHMd4dunF9Pmb4tsog/wk+eIcJCKwSzk4ztPEsjbC2/bA0nc3eHI6UgAssCRt15WAn09v6OdTwrYZAGAFZcorNTVh3LGvxLUV2EB8JdDXwE9fSOnjL0jWAw4sjiSrTqaGRFsJXmK9hSXjV/vILHgiXNpEQAXpdhGonWvHLiveXrHP0e5XOlss8JHMLUGNkSyJJpnEL5mEPgDHL1NuwQDuvL9/Lez2PEKpObHCp1B9bcNAtXk4R1dS8QYXsVWMhG0P/UP9iLMlQHfktbyUUL0UGlicrlnbyf8thUuUxywwaVoP5t5akY7IXRl+KHbcBHqdNO7GXd4DWc94XM5t+GRxfJxuvaDtCokRXQKuvbAEU1QS5u09GCRxyhocrXhp/5Yo1A7QCtJgzOEXh5pL3bWM6tH0XFEdrmN4vhD1XUVg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2339.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(136003)(366004)(346002)(396003)(76116006)(26005)(5660300002)(85182001)(33656002)(316002)(66946007)(83380400001)(2906002)(6916009)(122000001)(45080400002)(6506007)(86362001)(478600001)(52536014)(186003)(8936002)(66476007)(66556008)(66446008)(64756008)(38100700002)(8676002)(71200400001)(55016002)(7696005)(4326008)(54906003)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?UGhhelFpYUVqUlFzeUFsV2FJckhrK3ZiMGhFL0FkbjlpQ0g5YVlOT2V4bjFqMCtN?=
 =?big5?B?L1BlRDkxbXRUWmNsOTJZZDFKZ1NhVHNhTWl3WGlJa2lwV2dXM0pDNzBqVVc2czd2?=
 =?big5?B?a0pjYTlUWGttdFVzWnRQWTJIc0s1QWlWVnAzSFVSbWhjelNOUkVmY084WTM0RWx1?=
 =?big5?B?OXBjVWdkZndIV1B4N2NuUmhqWG1MczZWRGxzd1NKSTNySkJFZHNiZURFRVFndDNw?=
 =?big5?B?L2FPOHV4RnhucG05SSt4NDhVdFNqL0JmT2JDY1N4dyt2YVZmZzVkdm8yQ3VsVGUv?=
 =?big5?B?VVNVUlk0ZGw2NVVCSmR3eUUvRzk2b3lIYVF3ajNoeUV5cEhsamNPRUJHdHJsLzFN?=
 =?big5?B?ejZCaWJYUjRQcUxIbGI4ZkJOT1FGSEZ1NmdDZTArSUdraG1rUDIzRlVYRnZBeld5?=
 =?big5?B?d2ZvN0hhN3F1WW9QSnRjeGs1SXRXOUg2SkFPSUZTMGJ4bThiWlh4YmJ6clhSU0N6?=
 =?big5?B?UExXRmtQdHBwUXFHdVp1ZFJINTYvVENIbit0MWorREdKUmlLS3kzenJLSTVHd01x?=
 =?big5?B?ajRaWmJ5dHJuMmhoNHE2TGpWQ21URWJoVGx5OGIxTmhkTFJTUmdEektRT3dnL2JO?=
 =?big5?B?ak9DSldVRkhRQnppaG52REY3Ym16cXhCWEtOdk1kd0FSRDMvNHBVS3dOQ1E1aTI3?=
 =?big5?B?VHB2UVpta2U5L1pZdDlETjZ6N1k4VnZSSktWM0o0WGovVW1FTlM1NVlTTW94VTlJ?=
 =?big5?B?WVZJa2luUlFhcVIyUnNFaTJraFNyeTcvdlI3dGZMMTZsUlhQUTEzRUNXYnJPc0Jz?=
 =?big5?B?LzI4cDRFM3M5UUFHcUFNMm1PN1g3OVhReUY1U2IzMk1saEJVNW5XOTQyWUE2eU5z?=
 =?big5?B?VkYwNG5nQWRkSk5RbTZJelVqTnNYZms1d1RwUWJ3ODhrZ3pKczJZNmlxKzVWaTd2?=
 =?big5?B?SzB3Y2ZOTWNHV2dVcHczbGxSUGx5MTdxalRSUVlyRWNYdzUxZGdCYUwxSXgzQzE4?=
 =?big5?B?L2dOeFdYMVVDaHlPdnJ4QXg0bm83K1pNMGRFRjVmS29vUGxOY2hhTlgySzNLZ3ZL?=
 =?big5?B?VzIyREpqZDZISWhWUGE0bnJzU1FqaVp4NmUyVlpOQVdOdmlTZ0ZuRXdPS3lRd1lC?=
 =?big5?B?ZGM2U2ZqU3NYd1hjK1QzaVkrUDIvUTdreGhQSStCbStpRWhHbGE3MnY0bkR0cSs3?=
 =?big5?B?VGpYZE81cjZoWmdVUHhRcEtld1c3MlhLb2ZkcU5SdjJZbjE5ZDczRVlxaC9yTExX?=
 =?big5?B?Z2VmZE15WlpzbW5QelFlWFc5b210ekwzVTNhNmx5WXVqVkNSS0VmWG9lcFdiNnlZ?=
 =?big5?B?VkxMYlNwa3NsaW5TYWc4SFlSZ2p4bWJDV0hNUVgwNjc2Vkl1YTdSbDJzMWg2WVNj?=
 =?big5?B?SGZPTXUxSk5OSnIvNDNoV1ZOdmVUTlVyR3FBeVEvcnFIR2M2Z2t6eTc4YTRUb0RN?=
 =?big5?B?WEJwQ0JJQkkzMlhLS0NkVHlCQzNxWEpaNFVLZXBqeTZpU2tYWUNQdTRrZ3dhM043?=
 =?big5?B?WXdsSVNTaFJtY09iMmFYWHh2UEg3Rzc4RlEzWTBja3hEYklPZzFKVWVmK3ErZ2Iz?=
 =?big5?B?eENrdE43YmtoZ0IzUmx5TmlSd2NtY0FKdU1RZlpvOWNEVGVUcGQ5dGEzWFZ5Nlha?=
 =?big5?B?NGxjT2FmWEU2dk1SOG05MlNJS0V1bFhhcnN0cUpXbHF6ZGZrbGdpUVJSYTluZ0JK?=
 =?big5?Q?A+8tqX7E6kHYOZL3NZ0QPo+66ozteMWnfbDfarBLOfCaEa/3?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2339.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e01eaa6-d14f-4540-968c-08d936fb5624
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 10:32:15.8705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Phl0fd4DBQyIruC3tnAvS0QEn+oCdNiFQ7Du0cV7jBJFAPCm/60G+QygpDBKCa4saN4hIwApHGM+tBN/FEcbIH5IRjDRVUsFMmKMtfnEHx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3395
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
 "yulei.sh@bytedance.com" <yulei.sh@bytedance.com>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 Brandon Kim <brandonkim@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgTGVpLA0KDQpJdCBjYW4gd29yayBub3cuDQoNCiMgaXBtaXRvb2wgc2VsIGxpc3QNCiAgIDEg
fCAwNi8yNC8yMSB8IDEwOjI4OjEzIFVUQyB8IFdhdGNoZG9nMiAjMHhmYiB8IEhhcmQgcmVzZXQg
fCBBc3NlcnRlZA0KICAgMiB8IDA2LzI0LzIxIHwgMTA6Mjk6MDEgVVRDIHwgU3lzdGVtIEV2ZW50
ICMweGZlIHwgVW5kZXRlcm1pbmVkIHN5c3RlbSBoYXJkd2FyZSBmYWlsdXJlIHwgQXNzZXJ0ZWQN
Cg0KDQpUaGFua3MgYSBsb3QgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NCg0KQmVzdCBSZWdhcmRzDQpH
ZW9yZ2UgSHVuZw0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBvcGVuYm1j
DQo+PG9wZW5ibWMtYm91bmNlcytnZW9yZ2UuaHVuZz1xdWFudGF0dy5jb21AbGlzdHMub3psYWJz
Lm9yZz4gT24gQmVoYWxmDQo+T2YgTGVpIFlVDQo+U2VudDogVGh1cnNkYXksIEp1bmUgMjQsIDIw
MjEgNDo1MSBQTQ0KPlRvOiBHZW9yZ2UgSHVuZyAorHipvrdxKSA8R2VvcmdlLkh1bmdAcXVhbnRh
dHcuY29tPg0KPkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IHl1bGVpLnNoQGJ5dGVkYW5j
ZS5jb207IEZyYW4gSHN1ICiufbt4wb4pDQo+PEZyYW4uSHN1QHF1YW50YXR3LmNvbT47IEJyYW5k
b24gS2ltIDxicmFuZG9ua2ltQGdvb2dsZS5jb20+DQo+U3ViamVjdDogUmU6IElQTUkgU0VMIGxv
Z3MgZnJvbSBwaG9zcGhvci1sb2dnaW5nDQo+DQo+T24gVGh1LCBKdW4gMjQsIDIwMjEgYXQgMToy
MSBQTSBHZW9yZ2UgSHVuZyAorHipvrdxKQ0KPjxHZW9yZ2UuSHVuZ0BxdWFudGF0dy5jb20+IHdy
b3RlOg0KPj4NCj4+IEhpIExlaSwNCj4+DQo+PiBJIGVuYWJsZSBTRUxfTE9HR0VSX1NFTkRfVE9f
TE9HR0lOR19TRVJWSUNFIG9wdGlvbiBmb3INCj5waG9zcGhvci1zZWwtbG9nZ2VyIGFuZCB0aGVu
IHdvdWxkIGdlbmVyYXRlIElQTUkgU0VMIGxvZ3MgZnJvbQ0KPnBob3NwaG9yLWxvZ2dpbmcgc3Vj
Y2Vzc2Z1bGx5Lg0KPj4NCj4+IEJ1dCB0aGUgcGhvc3Bob3ItbG9nZ2luZyBzdGlsbCBoYXMgb3Ro
ZXIgZXZlbnRzIGlzc3VlZCBmcm9tIGVsb2cgZnVuY3Rpb24NCj5hbmQgYWxzbyBwdXQgdGhlbSBp
biB0aGUgIi92YXIvbGliL3Bob3NwaG9yLWxvZ2dpbmcvZXJyb3JzIiBkaXJlY3RvcnkuDQo+Pg0K
Pj4gRm9yIGV4YW1wbGU6DQo+Pg0KPj4gMDAwMDAwMDAgIDAzIDAwIDAwIDAwIDAzIDAwIDAwIDAw
ICAwMyAwMCAwMCAwMCA2NyBmZiBlNiAzOA0KPnwuLi4uLi4uLi4uLi5nLi44fA0KPj4gMDAwMDAw
MTAgIDdhIDAxIDAwIDAwIDMyIDAwIDAwIDAwICAwMCAwMCAwMCAwMCA3OCA3OSA3YSAyZQ0KPnx6
Li4uMi4uLi4uLi54eXoufA0KPj4gMDAwMDAwMjAgIDZmIDcwIDY1IDZlIDYyIDZkIDYzIDVmICA3
MCA3MiA2ZiA2YSA2NSA2MyA3NCAyZQ0KPnxvcGVuYm1jX3Byb2plY3QufA0KPj4gMDAwMDAwMzAg
IDQzIDY1IDcyIDc0IDczIDJlIDQ1IDcyICA3MiA2ZiA3MiAyZSA0OSA2ZSA3NiA2MQ0KPj4gfENl
cnRzLkVycm9yLkludmF8DQo+PiAwMDAwMDA0MCAgNmMgNjkgNjQgNDMgNjUgNzIgNzQgNjkgIDY2
IDY5IDYzIDYxIDc0IDY1IDAxIDAwDQo+PiB8bGlkQ2VydGlmaWNhdGUuLnwNCj4+IDAwMDAwMDUw
ICAwMCAwMCAwMCAwMCAwMCAwMCAwOSAwMCAgMDAgMDAgMDAgMDAgMDAgMDAgNWYgNTANCj4+IHwu
Li4uLi4uLi4uLi4uLl9QfA0KPj4gMDAwMDAwNjAgIDQ5IDQ0IDNkIDM4IDM3IDM1IDM0IDAwICAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMA0KPj4gfElEPTg3NTQuLi4uLi4uLi58DQo+PiAwMDAwMDA3
MCAgMTkgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIDc2IDMzIDJlIDM3IDJlIDMwIDJkIDM0DQo+PiB8
Li4uLi4uLi52My43LjAtNHwNCj4+IDAwMDAwMDgwICAyZCA2NyA2NiAzMiAzNiAzOSAzNiAzOSAg
NjYgNjQgMzQgMmQgNjQgNjkgNzIgNzQNCj58LWdmMjY5NjlmZDQtZGlydHwNCj4+IDAwMDAwMDkw
ICA3OSA2NyBmZiBlNiAzOCA3YSAwMSAwMCAgMDAgICAgICAgICAgICAgICAgICAgICB8eWcuLjh6
Li4ufA0KPj4gMDAwMDAwOTkNCj4+DQo+PiBUaGlzIGV2ZW50IHR5cGUgaXMgbm90IElQTUkgU3lz
dGVtL09FTSBTRUwsIHNvICJpcG1pdG9vbCBzZWwgZWxpc3QiIHdvdWxkDQo+cmVzdWx0IGluIHRo
ZSB1bnNwZWNpZmllZCBlcnJvcjoNCj4+DQo+PiAjIGlwbWl0b29sIHNlbCBlbGlzdA0KPj4gR2V0
IFNFTCBFbnRyeSAwIGNvbW1hbmQgZmFpbGVkOiBVbnNwZWNpZmllZCBlcnJvciBHZXQgU0VMIEVu
dHJ5IDANCj4+IGNvbW1hbmQgZmFpbGVkOiBVbnNwZWNpZmllZCBlcnJvcg0KPj4NCj4+IEhvdyBk
byB5b3UgZGVhbCB3aXRoIHRoZXNlIGV2ZW50cyB0aGF0IG5vdCBiZWxvbmcgdG8gSVBNSSBTRUwg
bG9ncyA/DQo+DQo+U3VjaCBsb2dzIGFyZSBtYXBwZWQgdG8gdGhlIHN5c3RlbSBzZW5zb3IgYXMg
IlVuZGV0ZXJtaW5lZCBzeXN0ZW0NCj5oYXJkd2FyZSBmYWlsdXJlIi4NCj5lLmcuDQo+DQo+ICAy
MyB8IDA2LzIxLzIwMjEgfCAwNjoyNjozNSB8IFN5c3RlbSBFdmVudCAjMHhmMCB8IFVuZGV0ZXJt
aW5lZCBzeXN0ZW0NCj5oYXJkd2FyZSBmYWlsdXJlIHwgQXNzZXJ0ZWQNCj4NCj5TZWUNCj5odHRw
czovL2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0El
MkYlMkZnaXRodWIuYw0KPm9tJTJGb3BlbmJtYyUyRnBob3NwaG9yLWhvc3QtaXBtaWQlMkZibG9i
JTJGbWFzdGVyJTJGc2VsdXRpbGl0eS5jcHANCj4lMjNMMzY1JmFtcDtkYXRhPTA0JTdDMDElN0Nn
ZW9yZ2UuaHVuZyU0MHF1YW50YXR3LmNvbSU3Q2Y2OGJhMDENCj5kZjllMzQ2ZThlMzA2MDhkOTM2
ZWQyZmEzJTdDMTc5YjAzMjcwN2ZjNDk3M2FjNzM4ZGU3MzEzNTYxYjIlN0MxDQo+JTdDMCU3QzYz
NzYwMTIxNTE5NDA5NTQ0MCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNA0KPndM
akF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0Mz
MDAwJmFtDQo+cDtzZGF0YT1waE9PMGZST0d5NGliWUl4bW16ZVhjRTV0Tm5CS3k1b3lLZnQyRTRQ
SkFRJTNEJmFtcDtyZXNlcnYNCj5lZD0wDQo+Zm9yIGRldGFpbHMuDQo+DQo+U28geW91IG5lZWQg
dG8gZGVmaW5lIHRoZSBpbnZlbnRvcnkgc2Vuc29yIG9mDQo+Ii94eXovb3BlbmJtY19wcm9qZWN0
L2ludmVudG9yeS9zeXN0ZW0iIGluIHRoZSBzeXN0ZW0ncw0KPmlwbWktaW52ZW50b3J5LXNlbnNv
cnMueWFtbCwgdGhlbiBzdWNoIGV2ZW50cyBjb3VsZCBiZSBtYXBwZWQgdG8gdGhpcw0KPmludmVu
dG9yeSBpZiB0aGVyZSBpcyBubyBDQUxMT1VUIG9yIG5vIFNFTCBtZXRhZGF0YSBpbiB0aGUgbG9n
Z2luZyBlbnRyeS4NCg==
