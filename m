Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB152E75B5
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 03:48:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5G25726JzDqHj
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 13:48:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=6269517ed=harvey.wu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=PkvwwZnW; 
 dkim-atps=neutral
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4D5G1H2Ky3zDqGg
 for <openbmc@lists.ozlabs.org>; Wed, 30 Dec 2020 13:48:01 +1100 (AEDT)
IronPort-SDR: IXA1GhgWwC4h9ECPcSkgD1nJF8U4ZlbaGC0DayTfjmG7fpw0k0TlgtBgLUHrHnC9FGli2BMF6r
 hRynL3XwYqHA==
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 30 Dec 2020 10:47:59 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 30 Dec
 2020 10:47:58 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (104.47.124.52)
 by mailbx05.quanta.corp (10.243.91.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Wed, 30 Dec 2020 10:47:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POfmpt49qxWQYBWdGSR0yKi+bZc6do/QFJ25KY6zF/6ztGtp0KqXJ2amwmgaJEIHY7xDlzL0vOP7cgx4adD3HmipXFxuAqARxJtx2Wgtp0IJcc8yEL4QPHpJqUWJfR8TW5P6hQrz1HDvoFBQmNfvry2nILeEP9grjihfugzVUp2a2bV6ErG7hN85Op3fdvduYpo+MDEQSADp7qvB9eD1ytXuotZ+q4lwhh2KJrjFvcE+ms0OoerepHyXiLpLdtp3GlBrChIwr7ILk1+cfPoS+YHAO+TcCLT0Ack1wRF25cXxeO56Om8oB68jzd9inLL71Zi/lQKlqkH5FsDW00UeCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfeGmtPdcoo1UaVDuzFRT1Zbg/ccsRoBYWHLfKX+Ngk=;
 b=BSMvznZfrbl6bC9dF6zU/a0nd74GFjvry4kWTCq6zVpZT8HoyIb/ZcFlVnfk3DyAB3XcZ01JCCygisIc99P+5GBD99CR9CdHgsboNaMUsIMnAzNdTe6wq7jhvWqSdT1YEz5/3/Aund0QWUiTqWNK/67BYmjRqc95bKdQD4rs3afOfMnYADmPOyt84b/VmsHtMuKeWMh+Xs0aBU4nqKxFinqq9uySHE7pKhG+FhSGFoYtW4WoEz6RUS8bqGpDEjWZWA9aY3b1N67fbBGMN5xRN0SvrbdxiB/Al6X07lnl3UTWsxx/w9ZKgtpza5hCGPBuFt60AMSeCIOCks1BvJBvRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfeGmtPdcoo1UaVDuzFRT1Zbg/ccsRoBYWHLfKX+Ngk=;
 b=PkvwwZnWpMDx3AArH0flCVgPJyhWE1qUFexpiiWGOCUhhXcnA0WJQwhQb7ZKfRAgFVYn6ElT8qs5NZXDKYlSnmFCu3ziedzG/o3D7hu4+CtmFKrV5h0Xuo2h5nTfOF6NdlltLRkhWY9+/39i/tFc8aHr5hWX1Q96zafhS3qutCo=
Received: from TY2PR04MB3933.apcprd04.prod.outlook.com
 (2603:1096:404:8004::16) by TY2PR04MB2958.apcprd04.prod.outlook.com
 (2603:1096:404:37::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.30; Wed, 30 Dec
 2020 02:47:57 +0000
Received: from TY2PR04MB3933.apcprd04.prod.outlook.com
 ([fe80::e86c:66b9:97f3:22ea]) by TY2PR04MB3933.apcprd04.prod.outlook.com
 ([fe80::e86c:66b9:97f3:22ea%5]) with mapi id 15.20.3700.031; Wed, 30 Dec 2020
 02:47:56 +0000
From: =?big5?B?SGFydmV5IFd1ICinZLFSuvsp?= <Harvey.Wu@quantatw.com>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: RE: [phosphor-virtual-sensor] Add new feature to get Warning or
 Critical property
Thread-Topic: [phosphor-virtual-sensor] Add new feature to get Warning or
 Critical property
Thread-Index: AdbeTetCIk4HSRZcQba2tGU0hZY5twABSy4AAABYFTA=
Date: Wed, 30 Dec 2020 02:47:56 +0000
Message-ID: <TY2PR04MB39337E262BA43CA7378F2B6C95D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
References: <TY2PR04MB39331267ECA5147A09FF691495D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
 <CAGm54UH0kgwdmvSe7ZgmE6HV1fHzeJY7KOaFHcfYgNOAnPV-EQ@mail.gmail.com>
In-Reply-To: <CAGm54UH0kgwdmvSe7ZgmE6HV1fHzeJY7KOaFHcfYgNOAnPV-EQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bytedance.com; dkim=none (message not signed)
 header.d=none; bytedance.com; dmarc=none action=none header.from=quantatw.com; 
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb14f546-f851-4027-2259-08d8ac6d5028
x-ms-traffictypediagnostic: TY2PR04MB2958:
x-microsoft-antispam-prvs: <TY2PR04MB295832B548B2368893F7C92695D70@TY2PR04MB2958.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EMz9Nu3TXok3OwOUezDchcTkur2YbT1aYUSXE/PG8FToCeu1ynvfjPeLRFMMTZ9SKL2Ki8BquDlzJ2dokjuWiwiew2sz4c9d42929OQxGf5S8YMFZCzUJeINCgUA5Ay23sOTAeWBC0KhxQ+yfe4gJVO+cA7IoGbe2WPxNV9r/doTZU0RfRu4uIduJH3av/vi3xwFC2fEFMNhYpuwQIra+ZV8er0qaaUorcyz0473uyLnFTtXvztY0EAzfnC6EuAkuW59v5JnpzeJvP3hwysnF4qMLlR4Wfr66a9g7eGrZMXRNOYLr+qxKCoYked+c09L3cW3G+jkqIypJst0n4ARvlu9bSHN22l4bZ9HN+qg1axQl6/bwHOwcwh7zRZVmBAGakr/ydKYBPycIXEACjjqG8jWZmVXZMIGGv0Kikd/66km3XNufeEKcF1X2qgkwxvOMcjYtfKWkSZDQgPDarfxnw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR04MB3933.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(66556008)(186003)(316002)(5660300002)(2906002)(8676002)(83380400001)(55016002)(66946007)(6506007)(64756008)(8936002)(33656002)(66446008)(478600001)(7696005)(9686003)(966005)(53546011)(86362001)(85182001)(71200400001)(45080400002)(76116006)(66476007)(52536014)(6916009)(4326008)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?S3p4azlla0FSSjVVQlNqZzRHVU9CdlIwb09hS1pKOVVwV0VhLzhSdGpnT3ZHZWJl?=
 =?big5?B?L1Rxd1dOaEUxbW9ydDdGc3VVUjJ1dmZ5VVlRMkxpdVBWblk4TS9jNkJzRktlQkhZ?=
 =?big5?B?V202UmdmRTI5SWQ4UU1NNDFnejQyWCtoN0h1amlDTkdZL0tWS2NnQ3padUdPQTdB?=
 =?big5?B?aEVJOUlqcVYydWdKV2RzN3E3UlAxeFVOcUtYQkwvTnd3TCsrRTFGdDYralBwSGJ6?=
 =?big5?B?WjIvUWFnK0s5R2JlV0Y1M2FVaWMxaEVHcklSOTRLSDRXK1lCcG4xQjhLc3F6dUZZ?=
 =?big5?B?MkJpTHFjS1ZTU05XUEVaVGZPbFJjaG52V0QvaC9TTEdKZGRJa3hhQ3NndmNVMExR?=
 =?big5?B?clUyMGRxb3l5RVYzQytSeFdCNG5oTXZDOEhKd2Fpakd2Y2h2blRVRFBnNkRhNFBk?=
 =?big5?B?MzFmUXhsOFZHb3JBcXBacEE4ZGQ5SG9QbnhiQWxNZkZyYVR0QjVVRFE3VW1EaXEz?=
 =?big5?B?KzN5NGRHUUJtUW83bDl5YTZVYWxMOGtuMmRpNWlCUDlrSGZWUi9na3BVVFc5WXUw?=
 =?big5?B?aStjSlRieG16QUFORGdqb1dla2tuN0RpQWw4TjdLUXZ5RWttVW84c3pHeDlBNGhq?=
 =?big5?B?NXZxamlhZTBNeG5rVS9DSkJPRlFCWEY4b2JnNHFGbldnbkloazhmSUJIVzVudTZv?=
 =?big5?B?bzU0NlNrRGNHKzMwTXV3TmdSS1BOUW5lM0dGMVp1dWluR29PTGVGTms2eHVka2Rk?=
 =?big5?B?ei92UDVGdmNFMjdYM3M3Y0tFZmxZMkZyNkY2YmJ4NjFmdVUrNURWQUxiWkhEcFp3?=
 =?big5?B?cEtaaG12MDhWT3hqeXE1dWpoWG96a3NLRGVyTUtscHBsYWpDOEhMdVhyMFAxYVpj?=
 =?big5?B?VFA4bUVrYnI5Z1lSNDc0bFNjZjVVT0plMHhIejAvOEQxVGdGakZGaW1Ha0pzb21y?=
 =?big5?B?UjFETVVHQW9USXJ3MkFnZG9hKzl3UllwSTJrMUtiazd6bEFQTXpsRHA5bmJ0ZFg1?=
 =?big5?B?UVVWTzFvWjFGK0VBbWxhaEgwZFZRbVduV0doalgrRU03bjZPelBDWHJrK3JBeWwz?=
 =?big5?B?SnpsU1RvT1hoRHlnZ0dyVjdhNlBBdEpjT2JRa0FtZlJJd3YyYm92UW9zNEdpZ282?=
 =?big5?B?TUEyZ1VoWEhqa1Qxd2tWQUFDa0MvdkpQVzloaE15UWV6Ym5sVTNVU3FqZFRUQ20r?=
 =?big5?B?dUNiamxjYytHMWljMWw5MklzZ2s0ZkdQc2ZZdExDT1d1ZFUyRy9vMHY0YTJuZWE2?=
 =?big5?Q?z6GvZa8nDNortUxYXuAF8GA6TaIuUUckUkpG4xaUyUU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR04MB3933.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb14f546-f851-4027-2259-08d8ac6d5028
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2020 02:47:56.7990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JE77bWlA5qCsLLYeRCR5W9xPJtsUe08H+Nka0Zj8Hxa04qXWYrnZ2QqTi5C46up3OBzcWYL8TtPkNWknhKolVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB2958
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBPbiBXZWQsIERlYyAzMCwgMjAyMCBhdCAxMDoxOSBBTSBIYXJ2ZXkgV3UgKKdksVK6+ykNCj4g
PEhhcnZleS5XdUBxdWFudGF0dy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgQWxsLA0KPiA+DQo+
ID4NCj4gPg0KPiA+ICAgICAgICAgVGhlIGN1cnJlbnQgcGhvc3Bob3ItdmlydHVhbC1zZW5zb3Ig
RGJ1c1BhcmFtIHZhbHVlIGlzIGZyb20NCj4gREJ1cyChp1ZhbHVloaggcHJvcGVydHkgd2hpY2gg
aW50ZXJmYWNlIGlzDQo+IKGneHl6Lm9wZW5ibWNfcHJvamVjdC5TZW5zb3IuVmFsdWWhqC4NCj4g
Pg0KPiA+IEJlY2F1c2UgSSB3YW50IHRvIGdldCB0aGUgcHJvcGVydHkgoadDcml0aWNhbEhpZ2ih
qCB2YWx1ZSBvbiBEQnVzLCBjb3VsZCBJDQo+IGFkZCBhIG5ldyBmZWF0dXJlIKGnSW50ZXJmYWNl
oaggcHJvcGVydHkgaW4ganNvbiBmaWxlPyBUaGUgcHJvcGVydHkgY2FuIGJlDQo+IKGnQ3JpdGlj
YWxIaWdooaggLCChp0NyaXRpY2FsTG93oaggLCChp1dhcm5pbmdIaWdooaggb3IgoadXYXJuaW5n
TG93oaguDQo+IA0KPiANCj4gQWNjb3JkaW5nIHRvDQo+IGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtz
LnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yi4NCj4gY29t
JTJGb3BlbmJtYyUyRnBob3NwaG9yLXZpcnR1YWwtc2Vuc29yJTJGYmxvYiUyRm1hc3RlciUyRnZp
cnR1YWxfDQo+IHNlbnNvcl9jb25maWcuanNvbiUyM0w4LUwxNCZhbXA7ZGF0YT0wNCU3QzAxJTdD
SGFydmV5Lld1JTQwcXVhbnRhdA0KPiB3LmNvbSU3QzE0NzllYmQ1YWVkZDRiOGE3YzMzMDhkOGFj
NmE0MzkzJTdDMTc5YjAzMjcwN2ZjNDk3M2FjNzMNCj4gOGRlNzMxMzU2MWIyJTdDMSU3QzAlN0M2
Mzc0NDg5MTk2OTM4NTA4NTMlN0NVbmtub3duJTdDVFdGcGINCj4gR1pzYjNkOGV5SldJam9pTUM0
d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNg0KPiBNbjAl
M0QlN0MxMDAwJmFtcDtzZGF0YT0wS3lyblJrWktyOU01OURFZyUyQm55VXJ1aWVnZSUyQjNFRFhi
DQo+IG14elIlMkI2eGVuZyUzRCZhbXA7cmVzZXJ2ZWQ9MCwNCj4gdGhlIHRocmVzaG9sZCBwcm9w
ZXJ0aWVzIGFyZSBhbHJlYWR5IHN1cHBvcnRlZC4NCg0KVGhlICJUaHJlc2hvbGQiIGluIGpzb24g
c2VlbXMgb25seSBjYW4gc2V0IHRoZSBzZW5zb3IgY3JpdGljYWwgb3Igd2FybmluZyB2YWx1ZSwg
YnV0IEkgd2FudCB0byB1c2UgdGhlIGNyaXRpY2FsIG9yIHdhcm5pbmcgdmFsdWUgaW4gIkV4cHJl
c3Npb24iLg0KQWZ0ZXIgY2hlY2sgdGhlIG5ld2VzdCBjb21taXQsIHRoaXMgZnVuY3Rpb24gc2Vl
bXMgZG9lc24ndCBpbXBsZW1lbnQgaW4gY3VycmVudCBzb3VyY2UgY29kZS4NCg0KPiANCj4gLS0N
Cj4gQlJzLA0KPiBMZWkgWVUNCg0KDQpIYXJ2ZXkgV3UNCg==
