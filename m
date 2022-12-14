Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 347F764C829
	for <lists+openbmc@lfdr.de>; Wed, 14 Dec 2022 12:38:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXD056WxWz3cH9
	for <lists+openbmc@lfdr.de>; Wed, 14 Dec 2022 22:38:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kai9GUOv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.244.83; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=ropai@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kai9GUOv;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXCzT66Vlz3bh2
	for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 22:38:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpmKNNuIHpXyGXhFxOR5RIdQV7LOv71rLMT4lXGrd7WbZo+PU99RbROQBkSvd2aHadQm+/hekdE+mpcPsZNaDin0UmMQ/gLV+fm9IOLaFPHgrmI352js6o+TrLFjqpPm1pmSl2U1mbUOmjx7Fz+4DQM1HCfGe+7Ufjd/EJH7JJY/SEPWg4uT0jGDvFYUyG6rYUEkdm35qMEKw/ys6/w3yJS7CD/5GhBr1vs5bsOS7gGNT8JOd2AU3FlM7qFOdlSBP1Pnf/oDKfuz4i0QGOxOpejEA2/qYZpkvUydfQHY1a4H1a/gCDYAa5OuneVBRlfrk22T2g6yBjbeUgvdxlqDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AMJHB0HGpkDTb9t15YNAOGadzhlcWMQ7vdgnpQuaWc=;
 b=U0jHn4/rJ0kpwAGQI590WaD43ZRCnp2iI689FM21ySenCa7IZgmmCq5X7mJpbuGHv4y9y+MNYM+7j65NYoA5aPvsx7013ZUQf0BKIhBvF12ztMoAq2qc9A9iyeRyhNMtBo+W9bIOXyPSJtxb2hp7gYSwg2Ip6wBnf41wprc838lcGa+4PUMAg96THb9a6bxAYkpF2pXPL8SMpRgrUEfXCOn09j2NCHA0TlfsABJJLKp/c7tdtkuoKPRkJbe1+mjXaZx0HOxGV2NW6xHqGRp4jn2UVJIfkv0wtRc9q6DITM1zDsMtcM4qxNYsGgU+O1olZSK2kxFuaKJeM7s0TIeAFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AMJHB0HGpkDTb9t15YNAOGadzhlcWMQ7vdgnpQuaWc=;
 b=kai9GUOvu3KSNlLkAkp94MiKzPtu8rIkLtPgMaxEck8gaoE2OVuqUH3tlT+pcS8OtFd+oLaN/JAs4KwNV32/4L1h9pIDGiSO9FjefNwK62YnJaLYM0v27ljb3e8q6Zsq3TTEmZYcmLE2E2vmb1KFBz0az3AmJpYKoNRmBqN99T7MLkZW9hddy4dIMZyDvnopadHdt1HIWjeU4uiY/tT5iD6RN3H93YcOhTKclt54HPiFO1c4ASMS46q5Y2/LU67hUSDZtX1QgCalmzGTky+KXDuPK500E3amXiuJIeJl78jSIF2voV9T9X4W1TXWrSWVYI9j29dfY746cjnRKR+5ZA==
Received: from LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 by MW4PR12MB7262.namprd12.prod.outlook.com (2603:10b6:303:228::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 11:37:51 +0000
Received: from LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::3b0:528b:6b8e:7e02]) by LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::3b0:528b:6b8e:7e02%2]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 11:37:51 +0000
From: Rohit Pai <ropai@nvidia.com>
To: Alisa Gataullina <argataullina@gmail.com>
Subject: RE: [OpenBmc][JournalD] Persisting Journal Logs
Thread-Topic: [OpenBmc][JournalD] Persisting Journal Logs
Thread-Index: AdkFjbCrabD490h1TBytiH0FZvC7fgA75CcAAkzBvrA=
Date: Wed, 14 Dec 2022 11:37:51 +0000
Message-ID:  <LV2PR12MB60149789D1C8A0863AC55133CDE09@LV2PR12MB6014.namprd12.prod.outlook.com>
References:  <LV2PR12MB6014244EC8301F492BB8BF84CD149@LV2PR12MB6014.namprd12.prod.outlook.com>
 <2cf8fd4925cd441b1f131497450486d3ed113e27.camel@gmail.com>
In-Reply-To: <2cf8fd4925cd441b1f131497450486d3ed113e27.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB6014:EE_|MW4PR12MB7262:EE_
x-ms-office365-filtering-correlation-id: 8a9204bd-c0a6-4ed7-05e5-08daddc7a25f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZRrgSPuzP4XhgUumtLo1z2gTvL3Bu026UnLgLacQT2Cizlg1rGu7qj7v8+M0Y1sHGxQF/Hjg8G899JApcA6pLegkD4O4A65C5zeOJEmXWtkWPI8vVkgoTHAYCopV3Ot8OMs1XPI6jupy8G0AEcMmFiqh6gV/Rp9IvkL4CebfOZqX2k1zHeQ5YjAcqxeduB6+eZiac8wysGz7qMh19qvcayVoiPVaDmWPdUd1ubIm9ehSCfzyqqVa0E2756CgEpdsRzvb6uEgcLoTbNZsS2YAMGhoSa6hbugUXTJOG8Xs75jgwu39eoAim/s59hrbvrSyKHMcXI9ZIxpUtO70V+zrcnJJXQjh6G7rpqTHompMXTfdSSqz3dzn73G66XsfJH1nw+uKys3Jhjp1v/lYd7QHZ0yUv71JhAMd0s75U9McLAEojUBqX8kfYzz3zPqk4ShTLSKLJWJndzjLAycC6jh3/Tvj9lAVnrNyAE06hjW4gOu/Y+ah9zpslVxZ26IjEpk322XzahKWeCAxBlpHQSop1A3h+k5LFRLBiDFNHhcpHg4t3z069aF87FPA4SMYlHU4YVFwTDkR2tLVYoso5tQzI6omACoxfYTkvrylM/XtsrlZWBWS+1QEbTUTiKHur9jC3LEf+gOsdpVVaSwqSYPnildvF6lAr3/0+vzHZpk8WYpR39yXYcKd68E/scnyKzwd0HoDpbWraPjkmfaBrVcaFBVj7VJqDk7IS3nAe3GsC0ifikPLvAbTPoXK3csX07IELYhviyJtkeoWCyP9/+VUY6kVhQDUL68mh5z1Kh2wrzg=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB6014.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199015)(83380400001)(86362001)(38070700005)(55016003)(52536014)(38100700002)(122000001)(2906002)(8936002)(5660300002)(186003)(26005)(41300700001)(478600001)(9686003)(966005)(6506007)(53546011)(71200400001)(66946007)(76116006)(66446008)(64756008)(66476007)(8676002)(66556008)(7696005)(4326008)(316002)(6916009)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?LzJBRC80cHFraStHSCtmU01JcEdwNVk2eDhmenlyZG53Zyt1cGIxdVBya1lD?=
 =?utf-8?B?Um9YU25ZTnMyWENaMjNac0NMRnZDeUNWaUdzbG84eU9zZWVFYi9tUXpaa0JE?=
 =?utf-8?B?SW1yN0lxMzNwcytXckFFSmlhcGUya1JXcDlJNi9GY1M4UHMwM1pRb0lncUk4?=
 =?utf-8?B?WFd3NnlrQ1RXZnIydW5kc1o2TjY3TmVNUzNaZkpLWGV4S0ZkbnQvdk9lQTJ2?=
 =?utf-8?B?cDd4TGJCYS8wcHRoQVBDUy90ZUhHR3BNcFN0S2RZV3lpYmRnMXN4R2h2dGha?=
 =?utf-8?B?T3F6RlZkejdJT0lSM3dnemxiNGk5UVVvUWdPckszZWo5N3JxQ2d0TVo3Ykhp?=
 =?utf-8?B?elpCUDRFVUZWR1FmdUl6WlAyZnZmVnd0aG5YN041ZXZ0Mk51aTlQKzZKSmlE?=
 =?utf-8?B?L1BmMTg1aGxOQjN1VUZRdjlQQVNMK2ptZ0toZ1YvTzdiZUFadmxlUWkxKzlV?=
 =?utf-8?B?Tzg1QTNZVjZuRThVSEgwcmJsUXlVTnRJNlVmMDExWURRVzl1T3N0SVdTU1pD?=
 =?utf-8?B?MVdPNHdnTWpQUXd1S0FlajNyZHNWSEh6L0tFNld0UngwRHYwTDM3dnA5QWVt?=
 =?utf-8?B?My9BL2EvSmZJbGQ3azFzaXR0WDl6ZkN1eTJ0MS9lVHNyMExiZXpYVldBNHY0?=
 =?utf-8?B?My85YzhjemlteVFvVDNCZ2FDYzNON01uSWp1M0U4VkYyeFMxaFNZbVJ2dTFt?=
 =?utf-8?B?VittclRhM1FDSTc5aUJ5dmZkd1owR0huY3lvUlhwYmtML2Zic1JSR0JqWHRo?=
 =?utf-8?B?Y2xoTW8wNm1CYXpGNEMyVGxpYmhFR1ZtaFR1Q2xCcTJGcmM1ZFgwYXlITERm?=
 =?utf-8?B?cUlOVTV5NVlaUG40bEkvd0w2SDh3ZzJveUpXeTZmVmF0TStyc1ptWHhjQ3d6?=
 =?utf-8?B?SFNodlNrOTJMRFVjK0RTWStlaEowa3RsSXlwTFVlN3IrTEVqRkExSkxjeVNh?=
 =?utf-8?B?KzkrYnpxMkJ3MGRaWGdmK1FaSS9wd3IvTms2VHVnM2lDdzIzRXEyb2VVcnBF?=
 =?utf-8?B?NDFGR3c3a2lmdWhQVTY1YVdKaEtFWW1IVnhDZWkrSHk3Z2FpQjVlS2xRcDNG?=
 =?utf-8?B?MXNTdytPbkQyN0s4Z0QvVUg5b1ZNUE83UDIxcWZuczJKN3FBK1NZdngyQ1dU?=
 =?utf-8?B?aWgxUGdib2xBSllyNHNNNWhqYXV3UHZBTE0xMFhsN1ptVlpMdG1wZGRGWUY4?=
 =?utf-8?B?OFNqYytVcGEvc2FTaU40THc0cmpFUTI3VExrbUVyK2pGRk81UmF1WHhvRjE1?=
 =?utf-8?B?dVJWb0tUTGJ4ZDQ2SnJMdnlOdzcxT3JCRFRXa2Y4VXQyQTd2eG1SZWVpbEVz?=
 =?utf-8?B?OWpFaGJKYkFLV1VQZjNPYUx2RzZaL3ljMkp4VzNDNHB1Tk5HUitTSnFoYkxu?=
 =?utf-8?B?Zm1yQ0FxUmllTmRXVWduRlZSeU5NNmdEYU11ZU53clV5dnBwbnNicTc4RDhw?=
 =?utf-8?B?TE1xalZ5Y0ltcEYvTjIrK3piZG96N0hhUkpCZjJpYll3YlhhVGQvZjFJRlEy?=
 =?utf-8?B?SVp6c0JwSUhVb25ic24zNlduU2NTWVh0SEh6enh2SWdaN2x5Z2hnd3hQbDFT?=
 =?utf-8?B?a0VtZlkzbUlWMEc3d2NObFROSHlZZFJnWXI3cVB0TkdWRWFYYXFaencxUDVM?=
 =?utf-8?B?MmxKMnNtczRYVVRTSTlPODFOMWtnM0tkRVQ2K0d1bHJGak4wd2JaZkZURyty?=
 =?utf-8?B?Z2xoaFlvZFhGRHJsV1JSSjNZY1g2VU41b1NtTmtTdENoa295azlKVGxNb0d3?=
 =?utf-8?B?VHQrcXFoNFladU1wVlQvYWNNMUZRb2N4VWVtYmFoaE5BbEl1UVBxYTJDdGNZ?=
 =?utf-8?B?R0xQVTdSRHIwbHhRWkxqR3JxZVVpT3ZwVkpxbGt6OFVXMS9RbjllVE1VL3Uz?=
 =?utf-8?B?NG1iUkw3ci9GajJFdEgvUzNROFlYNXpxaEZlOGFpNXAxV1VQL2lPQjVLZlI2?=
 =?utf-8?B?dXM3YWVyYmI0WFd5UWxjcXdjdXlTTHhhaEVjTWQ4WFhIU0tKdmxtcjRKUWZw?=
 =?utf-8?B?azlQcWRnOFozdDhuRFM3R0hSVHFvT0tKOGl2a0xNUDNBczZNRld3Rk85RDJ3?=
 =?utf-8?B?SzBTaFhVcjZraUdoUGx2MkF2WXdQdW0wUGVZSHh0MWE1SVFSQmxoOHIwdlF0?=
 =?utf-8?Q?EuCE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB6014.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9204bd-c0a6-4ed7-05e5-08daddc7a25f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2022 11:37:51.8088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wIE9pVPxOVrJsuRKm/cQFV0xGfhz8f8J/+N3H848JRDcE+8Ec2v3JW0ovLGbeckNcTg1j/B46ywaBqYEh0FUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7262
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

UGVyc2lzdGVudCBKb3VybmFsIGRvZXMgbm90IHdvcmsgd2l0aCBqZmZzMiBmaWxlIHN5c3RlbS4g
DQpNb3JlIGluZm86IGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvaXNzdWVzLzI1
NzEyDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbGlzYSBHYXRhdWxsaW5h
IDxhcmdhdGF1bGxpbmFAZ21haWwuY29tPiANClNlbnQ6IFNhdHVyZGF5LCBEZWNlbWJlciAzLCAy
MDIyIDEyOjA4IEFNDQpUbzogUm9oaXQgUGFpIDxyb3BhaUBudmlkaWEuY29tPg0KQ2M6IG9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IFtPcGVuQm1jXVtKb3VybmFsRF0gUGVy
c2lzdGluZyBKb3VybmFsIExvZ3MNCg0KRXh0ZXJuYWwgZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5p
bmcgbGlua3Mgb3IgYXR0YWNobWVudHMNCg0KDQpPbiBUaHUsIDIwMjItMTItMDEgYXQgMTQ6MDQg
KzAwMDAsIFJvaGl0IFBhaSB3cm90ZToNCj4gSSBhbSBydW5uaW5nIG9wZW4gYm1jIHdpdGggTGlu
dXggNS4xNSBhbmQgc3lzdGVtZCAyNTEgKDI1MS4yKykuDQo+IEkgaGF2ZSBjb25maWd1cmVkIHBl
cnNpc3RlbnQgbG9nZ2luZyBmb3Igam91cm5hbC4NCj4gL2V0Yy9zeXN0ZW1kL2pvdXJuYWxkLmNv
bmYNCj4gW0pvdXJuYWxdDQo+IFN0b3JhZ2U9cGVyc2lzdGVudA0KPg0KPiBDcmVhdGVkIGZvbGRl
ciAvdmFyL2xvZy9qb3VybmFsLiBUaGlzIGlzIG1vdW50ZWQgb24gbXRkIGZsYXNoIA0KPiBwYXJ0
aXRpb24uDQo+IFRoZSByb290ZnMgaGFzIG92ZXJsYXkgd2l0aCBSTyBmaWxlc3lzdGVtIGFuZCBS
VyBmaWxlc3lzdGVtIGNvbWluZyANCj4gZnJvbSBtdGQgcGFydGl0aW9uLg0KPg0KPiBscyAtYWx0
IC92YXIvbG9nL2pvdXJuYWwvDQo+IGRyd3hyLXNyLXggICAgMiByb290ICAgICBzeXN0ZW1kLSAg
ICAgICAgIDAgSmFuICAxIDAwOjAzDQo+IDJiNDMwNWY2NzA0ODRkMWZhNmI5YzRkZWVlMzM2Yjkx
DQo+DQo+IEpvdXJhbmxkIGNyZWF0ZXMgYSBmb2xkZXIgdW5kZXIgL3Zhci9sb2cvam91cm5hbCBi
dXQgSSBkb250IHNlZSANCj4gYW55dGhpbmcgZ2V0dGluZyBzdG9yZWQgaGVyZSBldmVyLg0KPiBJ
IGRvbid0IHNlZSBqb3VybmFsIGJlaW5nIHBlcnNpc3RlbnQgYWNyb3NzIHJlYm9vdHMuDQo+IEpv
dXJuYWwgbG9ncyBhcmUga2VwdCBvbmx5IGluIC9ydW4vbG9nL2pvdXJuYWwsIGFuZCB0aGlzIGlz
IHRtcGZzIGluIA0KPiB0aGUgc3lzdGVtIGFuZCBnZXRzIGVyYXNlZCBvbiBlYWNoIHJlYm9vdC4N
Cj4gSSBoYXZlIHRyaWVkIGpvdXJuYWxjdGwgLS1mbHVzaCB0byBzZWUgaWYgYW55dGhpbmcgZ2V0
cyBwdXNoZWQgdG8gDQo+IGluc2lkZSAvdmFyL2xvZy9qb3VybmFsIGJ1dCBub3RoaW5nIGlzIHN0
b3JlZCBhcGFydCBmcm9tIHRoZSBmb2xkZXIgDQo+IG5hbWUuDQo+IGpvdXJuYWxjdGwgLS1yb3Rh
dGUgYWxzbyBoYXMgbm8gaW1wYWN0Lg0KPiBJIHNlZW0gdG8gYmUgZG9pbmcgZXZlcnl0aGluZyBh
cyBwZXIgdGhlIGpvdXJuYWxjdGwgZG9jdW1lbnRhdGlvbiBidXQgDQo+IHN0aWxsIGl04oCZcyBu
b3Qgd29ya2luZy4NCj4NCj4gQW55b25lIGVsc2UgaGFzIHNlZW4gdGhpcyBpc3N1ZSwgYW55IGhl
bHA/DQo+DQo+IFRoYW5rcw0KPiBSb2hpdCBQQUkNCg0KSGVsbG8NCg0KVG8gY2hhbmdlIGpvdXJu
YWwgbG9nIGRpcmVjdG9yeToNCg0Kc3lzdGVtZC10bXBmaWxlcyAtLWNyZWF0ZSAtLXByZWZpeCAv
dmFyL2xvZy9qb3VybmFsIHN5c3RlbWN0bCByZXN0YXJ0IHN5c3RlbWQtam91cm5hbGQNCg0KSXQg
bmVlZHMgdG8gY2hlY2sgam91cm5hbCBsb2cgcm90YXRlIHNldHRpbmdzLiBCdXQgdGhpcyBpc24n
dCByZWNvbW1lbmRlZCB3YXkgZm9yIGVtYmVkZGVkIHN5c3RlbS0gdG9vIG1hbnkgcmV3cml0aW5n
IGN5Y2xlcy4gVGhlIGJlc3Qgd2F5IGlzIHRvIHVzZSByZW1vdGUgc3lzbG9nDQoNClRvIG1vdW50
IC92YXIvbG9nIG9uIHBlcnNpc3RlbnQgc3RvcmFnZSB3aXRoIHlvY3RvIHlvdSBjb3VsZCBhZGQg
Vk9MQVRJTEVfTE9HX0RJUiA9ICJubyIgIGludG8gY29uZiBmaWxlIG9mIG1hY2hpbmUuDQpBZnRl
ciB0aGF0IGFsbCBSZWRGc2gsIElQTUkgYW5kIGFsbCBvdGhlcnMgbG9ncyBkZWZpbmVkIHdpdGgg
cnN5c2xvZy5jb25mIHdpbGwgYmUgdGhlcmUgb24gcGVyc2lzdGVudCBzdG9yYWdlLiBBbHNvIHlv
Y3RvIGNyZWF0ZWQgZGlyZWN0b3J5IC92YXIvbG9nL2pvdXJuYWwgYnV0IGpvdXJuYWwgdXNlIGRl
ZmF1bHQgbG9nIHBhdGggL3J1bi9sb2cvam91cm5hbC4gQW5kIHlvdSBuZWVkIHRvIHNldHVwIGl0
Lg0KDQpCZXN0IFJlZ2FyZHMsDQpBbGlzYQ0K
