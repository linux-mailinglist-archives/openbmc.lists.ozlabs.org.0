Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7987939282E
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 09:09:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrJpp4Tqgz300b
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 17:09:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=fodkHSpL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.130.120;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=fodkHSpL; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300120.outbound.protection.outlook.com [40.107.130.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrJpW0RHWz2xvN
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 17:09:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bI2eewr6VMfFYX4iISOVvRc8Lw7amtV63eUQfvmymm/AeXKgjPp7duBMEzgOJwBw649dHZJtCxlg3YA55fmx00ba2t/bDizjpejcxHTU4f5aOFQvWxXZeXIQWecT/GPdpihN9wZVM7zZpcdxg6jjnBm8YlmspbLlyjxxa8uQKLmbkCYXZEVyrUEKjvnlbbnMF7DeZrVxRNBJV0pzo+9+uMS+nDVZb8F6pEAWKUsXGWBIsy+veVWohE+LtuFCYrUCVUYRBawpQMateZLwPfc64CTk3p2FI3iuWrwaUMhrBcItCWnYc+AlKo6ZJpBf2y84zTKY0v/EElPuL2QMfnNWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsdUA5dG211cKOWo35QQ3zfTGNmtd5oLykauJFf+YvQ=;
 b=UhnIu9Nae86XZLKcvQsm6MUmqCsiJ2iQ7COkmnlNPPXLyV6p9aqHHzyx807YCFh0GX0Yp0YivaF2uzUsEwGrP1xR9VuPkVCia0a2TxDEoYyKZmWwkDo+vsbSA2oMGoGF5hWA4RHLpyAWzUj9JNnDjlOyqrnoh0G/us5U4RLpWgTD3rVgFp1OOc2V8K7K3gwhDs2T+/Ov9O8SJc4wZxHqIRCSKMQdBuhfW2HgjTkVSyPrIofaIDr2Umh99kR0lgbbVu5eSIbbYQSGQBlfayQEMcfjZ2kiwEFY4ilKLOPi5jMzwHZZ46t9NRxwAOo/XV+m9SHX4c3YKlBGliHR7naZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsdUA5dG211cKOWo35QQ3zfTGNmtd5oLykauJFf+YvQ=;
 b=fodkHSpL4tfrsfs9UIVqS/j53a5zft0K5jNKNO3km/DdIblWHiIMPol8v4YSfCijSSIHWcGyWK1gK4CZ6gogOHqz3a2rBAEYlNmliq+kf3Esa7MHEvFvLBIwLaISpIPDGYBJdPVAEvibT4oI+Rtz234LxIDgE37nO8cySo8dOHI=
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com (2603:1096:203:8f::22)
 by HK0PR04MB2290.apcprd04.prod.outlook.com (2603:1096:203:4d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Thu, 27 May
 2021 07:09:02 +0000
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::58c5:e1bc:4f7:5fc0]) by HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::58c5:e1bc:4f7:5fc0%7]) with mapi id 15.20.4150.027; Thu, 27 May 2021
 07:09:02 +0000
From: =?big5?B?U3BlbmNlciBLdSAopWqlQLfsKQ==?= <Spencer.Ku@quantatw.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, "sunnsr25@in.ibm.com"
 <sunnsr25@in.ibm.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Implement PCIeType Property
Thread-Topic: Implement PCIeType Property
Thread-Index: AddSxrrWMZyaJu7rSDuh0zFsBYRnoA==
Date: Thu, 27 May 2021 07:09:02 +0000
Message-ID: <HK0PR04MB329955B4A773802B019E1477E4239@HK0PR04MB3299.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [114.43.150.14]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6623a52-d6c0-4998-d202-08d920de4ee4
x-ms-traffictypediagnostic: HK0PR04MB2290:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR04MB2290DCFDE946DBD2875F488CE4239@HK0PR04MB2290.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rd5SuNynoDE2NnnRqQAQEKbTQXVImC3Pim2jn4qVq1t6F85VWC9Xh1PlZGgUsGonpvm88ymzYOh4r2545E3aqCcsB/cd5wqTVJ4JX07rUw/PlC1NdAB63sKBbfX4iZvKE1DJoN6bHeXqkqsl7AHP+rEWffw3SwknB0n23qmRfZncEX58DGKN98+lvQQhsy215VoC1UZaETr2ytZD0EYUiNYPf1bbmADl+oHY32xGR0+oETkS7PkYfuyoCP1YOgcIZbVAlZ/vC+3Mox8KvVfsF76qxObPkwno315CjkIyxAwmdD+Xc3Ca4SfHfkiTZ3uUNyG0y02sdWUbfDmtdXuyR/H+wPq3Mb1bM4Vr7qMgh+OKdSyoM1/WHMQJaYz/KNDYLppbDNM3Y0xB07TEha1Eoso6Yy6ZjkHkZmxzEOXXaAcbzNC16L2JQGdNh9s7TWrpLGXlh6Qq38ow0A4t+/7OJwzM3T+7v5MVA3q5fNhtSGWJElGZar5o6MLYAfcSfVenQjxgwnaJ+56GZBMpiWNBhheIGD7vyQPT8t4PfanTbIPZtXn9wayutZ+K9yiNVRpqILoLSL6RXrCUnJBGjg3yR1Rr6MKZLouRHnIe3qFk+2jCamhG+vtxGDwpIwHXLxmmB9BkT+o0FkzuP3FHs4H3YX/f/UlxbsrBWR0enH8oOhqSdxkboPyMOFiiV2qvZ3HrBKCYXatXlX3bDrXaSGJ74xwwG6KAFNw+05bBCLPFtg9d/QwvHVOofgeOC5lhvrwT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3299.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(316002)(6506007)(64756008)(186003)(7696005)(3480700007)(8676002)(38100700002)(4326008)(2906002)(71200400001)(86362001)(478600001)(966005)(110136005)(5660300002)(8936002)(54906003)(7116003)(122000001)(66476007)(66446008)(76116006)(33656002)(52536014)(66556008)(26005)(9686003)(66946007)(85182001)(55016002)(11716005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?QkpiMk9McHhsVXMrTEMvcStvSnFJS05HcFQ4NU1CeWVTWkVWQ2ZHaHlRdThBdE1a?=
 =?big5?B?N0ZEY3UwUlVjK2taeXFFOVFLNFoxR2hjZnQzdHdvdGFMVm43QklDR3N1ZUpKRTBk?=
 =?big5?B?OS9ITmVPZW9iMVNxcjdsdERabE9NVDVzaEFPMzd6bFVIRVlmNVVvSExrOTB5dEFV?=
 =?big5?B?VXpKQklGU0hMV1VuUzJlZFZVemtiMTV0enhaRzU2M2hvYnY0Uk9NSFU0WW1oUkpp?=
 =?big5?B?T0tsTDlsSWNURVI0dFVjTnNuY3NKWUg3Nlprcms4anhRUGJGQXlTL214ZzVRKytq?=
 =?big5?B?S2tRUkVxSEo1SEZ1WFpQMUdReFNmTm96dWpESUdRYTBpSDI4bjcvaVZVVVNEbXky?=
 =?big5?B?RW5kNkJCK3R2b0xUdGJNYU9oT0p1cEtNV2w0M2JvUUZ4MFdQTktYb25tZjl1WHVY?=
 =?big5?B?SG9zM29kWlVYUWJ3aUJyV05mR1Iwb2RET2tLejFORVZwS1hPVkNOZnVYWlVaMG9B?=
 =?big5?B?eTIrQ1BKWGo4OWFlT052ajZXQXlteEwxeTgwZnc2NzNlYTk1UVlqbkZKd0szbzdE?=
 =?big5?B?WDNRc1lMcnl3SlJVWHVTQU1RWUlNd1IrSXZpRVdLWGpYc0djakhKdWRDOU82cng0?=
 =?big5?B?Rk03a0U0REdUZGdxUE1sVUkyUVh0Y0QwU3BpMWxGbmh1OWJpaUdIVVp1T0dmekla?=
 =?big5?B?Zk5Gb3M0a1VxalY0TVZtSUk4d1kvK2FrcExWOElpdHFQOEtnWnZ0d0xoaEkzN2kv?=
 =?big5?B?UmV0MW9XNUJxRVNINXRnNGhMMUdNNC9XQ0VRTXovU0hyaGtHVHp1NHZNdHh2VWpF?=
 =?big5?B?cUN4ajR2b3V4ZUZwOGlaLzRtellTcStxNlRIL04rYWR0Q2t2UDRoVURNRnFSTlc0?=
 =?big5?B?NWJSTGtzWHJQMmVHdGQ5ME8xWWdzaGtmUmN3Qm5UTWZ2c3hpdzBucUIrNUExTWQx?=
 =?big5?B?WWNoVXlKZ25veE53Mk5CWlNFU09ZQ0w1c3pTU1ZqeFZkamdVdEZhNFJqQU9Ocnow?=
 =?big5?B?Y1Nqc3BvcW9LRnZHYkMxRGhCTEtxSWozaDROQ3o3bVpCQ3VoRUxMRVVNemErbzBl?=
 =?big5?B?MXkzYWlIeHdzeGw2MnlzaTlvVXJyWEJ4djkwcW1naitRUzJXM2pDMS8yZExpWnc0?=
 =?big5?B?dGVYNk9Nb2sxODgyK1p3VjlKODZtZkh1UjQvUU1zWnRjVmd2N3dIYkk5Ti81eGFL?=
 =?big5?B?Z1FwQm4yZDhVei80aWFvTTJpZmdadGVGTS9ESWk0bW1YMFp2b05PcFFRM2dEQ2Rj?=
 =?big5?B?RDJhSHRwZnNpMVNRMUU1L0hyYWhTbDFmYjR5TXBoVmxteVRpTDNXcDlNTHFjS3ZJ?=
 =?big5?B?SXA1Q0JoaWdHSGw0YS9EaE1uV0ZJNFZWdk1Na1FOck5mTUtVaXNEUWQvTkFIODN3?=
 =?big5?B?ZW1XVktqdlM0QkNFRXFzVkdwUjhxVHhEQnc2Kzl6TnZuQk9nQUtZR21SOEpGMitw?=
 =?big5?B?Mk1tZXFZMk9sNEJqK0ptZVlYNmpEUW85MGxjQjU2RTNOcS9GTWxzZzdWdEhZZURF?=
 =?big5?B?ZGxHSXJkRUIzdG1MT3luMHhvK3FldWgvRnBYU2FERjIrK1F0TVNaMEtRZzVzWmdV?=
 =?big5?B?SGpBc2QzWjJIZ21zbWZuRXNHUitFM0NzMHFDYVVpdGxhQnVXeFlnTDZsa0FvVjBy?=
 =?big5?B?aDdZbHh5bTVnMTIvM0cvd2t1N1l1OHpOMGNwaXMrWW1WUGJzdGowL1QxTWZDTks1?=
 =?big5?Q?90WpznVKOThDhyRFIOlWpbihsBE=3D?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3299.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6623a52-d6c0-4998-d202-08d920de4ee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2021 07:09:02.6174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rReAbVizIU047XN+qzbz81kf8ZmcYr+VlBo8/jV1WNGa13bz9bN9uuA3d9ygWboNpTDRUMh9a45idnut7fPRAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2290
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
Cc: =?big5?B?TGl0enVuZyBDaGVuICizr6dR2nop?= <Litzung.Chen@quantatw.com>,
 Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQWxsLA0KICBXZSB3b3VsZCBsaWtlIHRvIGltcGxlbWVudCBQQ0llSW50ZXJmYWNlICJQQ0ll
VHlwZSIgcHJvcGVydHkgb24gYm90aCBwZWNpLXBjaWUgYW5kIGJtY3dlYiwgdGhlbiBJIGZpbmQg
dGhlIFBSIHdoaWNoIGltcGxlbWVudCBpbnZlbnRvcnkgcHJvcGVydGllcyBsaWtlIFNwYXJlUGFy
dE51bWJlciwgTW9kZWwsIFBhcnROdW1iZXIsIFNlcmlhbE51bWJlciBmb3IgUENJZSBkZXZpY2Vz
IGluIGJtY3dlYjogaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMv
Ym1jd2ViLysvNDAwNTENCg0KSSB0aGluayB3ZSBtb2RpZnkgc2ltaWxhciBwYXJ0IG9mIGJtY3dl
YiwgYnV0IEkgYW0gbm90IHN1cmUgZG9lcyBpdCB3aWxsIGltcGxlbWVudCAiUENJZVR5cGUiIHBy
b3BlcnR5IGluIHRoZSBmdXR1cmUuIFNvIGNvdWxkIHdlIGltcGxlbWVudCAiUENJZVR5cGUiIHBy
b3BlcnR5IGZpcnN0IHNpbmNlIHRoZSBQUiBzdGF0dXMgaXMgV0lQPyANCg0KQWJvdXQgdGhlIGlt
cGxlbWVudCBtZXRob2QsIGZvciBwZWNpLXBjaWUgcGFydCwgZmlyc3Qgd2UgdXNlIHBlY2kgY29t
bWFuZCB0byBnZXQgdGhlIHBvaW50ZXIgb2YgY2FwYWJpbGl0eSBpbiBQQ0kgY29uZmlndXJlIHNw
YWNlLiBUaGVuIGdvIHRocm91Z2ggY2FwYWJpbGl0eSBzdHJ1Y3R1cmUgdG8gZmluZCBjYXBhYmls
aXR5IElEIGluIDNyZCBjYXBhYmlsaXR5IHN0cnVjdHVyZS4gSWYgdGhlIElEIGlzIFBDSSBFeHBy
ZXNzLCB0aGVuIGdldCB0aGUgbGluayBzcGVlZCBpbiBsaW5rIHN0YXR1cyByZWdpc3Rlci4gRmlu
YWxseSwgc2V0IHRoZSBQQ0llVHlwZSBwcm9wZXJ0eSB0byBELUJ1cyBhZnRlciB0cmFuc2xhdGlu
ZyAodW5kZXIgL3h5ei9vcGVuYm1jX3Byb2plY3QvUENJZS88c3RyPikgLg0KDQpBbmQgZm9yIGJt
Y3dlYiBwYXJ0LCB3ZSB3aWxsIGNyZWF0ZSBQQ0llSW50ZXJmYWNlIHsiUENJZVR5cGUifSBsZXZl
bCAodW5kZXIgL3JlZGZpc2gvdjEvU3lzdGVtcy9zeXN0ZW0vUENJZURldmljZXMvPHN0cj4vICkg
YW5kIGZpbGwgdGhlIGluZm8gZnJvbSBELWJ1cy4gDQoNCk9uIHRoZSBvdGhlciBoYW5kLCB3ZSBh
bHNvIGludGVyZXN0ZWQgYWJvdXQgaG93IHRvIGdldCBQYXJ0TnVtYmVyIGFuZCBTZXJpYWxOdW1i
ZXIgaW5mb3JtYXRpb24/IEkgYWxyZWFkeSB0cnkgdG8gZ2V0IGZyb20gRlJVIG92ZXIgSTJDIGJ1
dCBJIGNhbm5vdCBtYXBwaW5nIHRoZSBpbmZvIGJldHdlZW4gRlJVIGFuZCBwZWNpLXBjaWUsIG9y
IGlzIGl0IGNhbiBlYXNpbHkgZ2V0IGJ5IHBlY2ktcGNpZT8gQW55IGNvbW1lbnRzIGFuZCBzdWdn
ZXN0aW9ucyBhcmUgd2VsY29tZSENCg0KUGxlYXNlIGxldCB1cyBrbm93IGlmIHRoZXJlJ3MgYW55
IGlzc3VlLCB0aGFuayB5b3UhDQoNClNpbmNlcmVseSwNClNwZW5jZXIgS3UNCg==
