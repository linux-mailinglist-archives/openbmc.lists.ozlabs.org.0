Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA56036D044
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 03:26:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVLYh57b9z2yyP
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 11:26:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=g8iY8sim;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.132.108;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=g8iY8sim; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320108.outbound.protection.outlook.com [40.107.132.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVLYQ3njyz2xfd
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 11:25:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFRWozot3VJ8v8QioJ2HTbs3/rXlAnbbyFu0Gt8wBdeyLFpL0Di0K3zMSlSFlbmu9I9K32gLKrs0pxmXkukGU3n0YTtq/B6BJO4rq7Qr3aH5Knqg4Js53Gtcfaruv5lyT/N5vu5PogFfVuzPQHy2JnTYDQf9nlAOWSHMw6rPuiu07ZURjnSg6ng+hAHfRcWFw4A9mdBREj0o3nApZWLL1KrbTciLUWeclSLLXFDvBcBSTqhcOjOCg9Xfa2wE6TiF1b0vPd5c29qlyRXbD6bw/x1Wa3FsQx90pOGpDnBX54+PTiPNHvAhPSjsyOfyV93S5Q8+XHJ3+RbYU1DJmSQOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydbupE9d3gM7j0i0/l1HQzHImXvQCixytrPW2MZkv64=;
 b=aQ8qe9XD/Ha6vEE4YBzKAv4KgN2Xj1mTsbpiOxCu3fDlqeW9TGWed7jcILv2wFnkLKJyGDKlMs8S/h+FttXtVSYkx7c8cQbws1qVq+eRo9jGAwoGSkWiu9mkUfuijXkZCMMe2kJPpJz6kKVfq5gmyZ7iPcGMevCYRJZlkHpO277L9HqQgbIVzJrzhCQEcgdo5gSzp/pfbQDKq+ckDSp6ZW70YvQhBXIBxqsL5r107SZGXVTmopLTx+jnKj6HWfI5tEZ5avRXuK+rmZccAoY+pN+rQKDjGc3kcLxjjZ4Um4d7kD66gwOGeFcpbuT5lHBbwuKLFTinMVQ5IPF4ALFJBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydbupE9d3gM7j0i0/l1HQzHImXvQCixytrPW2MZkv64=;
 b=g8iY8simvS5RZQ5HcD41hUnWPdmqGokyuvayuqCWso2UYzIAB7od1ZdyDEpNPsDppPzVl6iPsaf89kvIFiggjpXfq2oa9e9Ipfc4tmpyxnSFwVCjPIlqK5uDef5IiJ5jkU0kELM4XKu1RPFo63dEoNnRBmkLFgOQHWBjRCif/M4=
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com (2603:1096:203:46::21)
 by HK0PR04MB2868.apcprd04.prod.outlook.com (2603:1096:203:59::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 01:25:35 +0000
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::8522:3491:faa6:e255]) by HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::8522:3491:faa6:e255%4]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 01:25:35 +0000
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Stop IPMI watchdog timer in x86-power-control
Thread-Topic: Stop IPMI watchdog timer in x86-power-control
Thread-Index: Adc7zDgomqOcFoWoTBK/4LKFJxnKcQ==
Date: Wed, 28 Apr 2021 01:25:35 +0000
Message-ID: <HK0PR04MB23393BF8FED16A647A49577D8F409@HK0PR04MB2339.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [61.218.113.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82a21ed8-6296-4abc-c781-08d909e485f0
x-ms-traffictypediagnostic: HK0PR04MB2868:
x-microsoft-antispam-prvs: <HK0PR04MB2868944D6E6DA4D14AF142BA8F409@HK0PR04MB2868.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dqkE+bXYjmzu+/5gIyG0zL2jXni5kse7bSzsTx7Sp+xGcUbzlhGBNLBQdW+pNDA+v5FZ1+m0CavzyeFuN3ilJPL9web/EsNN0QBx4mSf7yAe+RcQKcYjihGXp1WIC3xz5nv7AmybzHrqBdTJ3ctycq+PhH+Ak+GTQrib0o+1cQXXwDMrfOmP/d4gAPVKa3ZJ7k9GPWN34/2/aWXBidpTdmjQot+99+yZNGn3aI3Hn5cMq0ekKu8dmGnsPtFwAJYmKSoK5sttaqhSdg10UJHUsCAOJpdLVdIs+PMuk9esVS3HMbu0ZoHXdRvHxK5l1AsYGTR3gfSoXHVmxxKAuzCT73qqwlatfB4o0bht2FDLWZuXwEBSHaRbJBLwqReUEbcOPC2eAPbmQOCqc+SsIYYbxZWnIXnw7guCUEHX+pVXoSIobEnzzEpPfRY7iJK7r3mKwbeQXoD1AualYaw3+sViKgXmdbmk3rEwRv5tQ/wbszlDeZ3WIu4SblBu2NDWY6uO1fi9wNd9InNNo2JEZls+CHsarQGeyQ4VnC27MJ+AvHyYQ4cyrCRNMATzBl261oDjZuBIW5WsUCsteB2leo7v+K1hl2o62kzuh6UlK4jnTN8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2339.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(2906002)(6916009)(316002)(83380400001)(4744005)(186003)(4326008)(55016002)(6506007)(5660300002)(478600001)(54906003)(64756008)(7696005)(66946007)(9686003)(66476007)(33656002)(8936002)(8676002)(38100700002)(66556008)(122000001)(52536014)(85182001)(71200400001)(26005)(76116006)(86362001)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?THVBL1ZIN1cwTTc4eGl0OUw0NmtPK25GdEFrMVVoTXcvZmtreTZhOFFRaC9SZjhQ?=
 =?big5?B?QzBwMkluVWlaVzRTNEtMOXRhUERNTXo2WG1FeXBBQ21iYUs1U2JoWHM3MitNeDI2?=
 =?big5?B?Q1d3aDhZWjlXK2VzZWl3Z2tCWklnOGNXK1NiK2IweEtMdDRkK2YwNjRHUkEyNWRD?=
 =?big5?B?SVRYSVlRTFJiYmk3aDRTZENXR3RkejA0L20vRFNhY1IwVFhzamNvdkxEQk5yTms0?=
 =?big5?B?QzhyM09CSzNFY2N3d2tHcHB6WFFpUzFyRjNKZHY5RURSWEM1RGZZZ3hTTW5sblg0?=
 =?big5?B?TTBPRzhaaFBKblJYaDZXejNoUCtkaXVKTjVxOWI5YmU5b1RhNWdjMG5OMnV5TUVT?=
 =?big5?B?RmVSd0l3Ym1yOHJmai9vaHdVTi9tdVJXelFOODRHS1BlRjhZSTBSMlpsaksvUW9C?=
 =?big5?B?YjNnaDc2VGlJbmI2dXYxeGJqcFcyWWZubWpZUXVJSVNtVGJvalJRNG9wZ21QY1JN?=
 =?big5?B?Z1UxR2lzUytidmZmNFVqN0RmbHZ2ektBZzhJamsvTFNjcTFkd1MyMGlUSXRRY2Vz?=
 =?big5?B?d2kxTmcwTFhmZ2lreWRpQVBnaWhWZlFFL2NMcFV1aExsT1FuaUZoeU1US1J5ZVNU?=
 =?big5?B?R3hrenpLcFVHNCthaDl0MThUY3pQczlPQlBrWGJpZVEwK2VTc0ZPdHg1SGMvT0E4?=
 =?big5?B?QXdyU2lFRXljckN4NlBWVjZJNk1TS0pETStWbkFvamdpR0psTVJKRHFpSkNUNjQw?=
 =?big5?B?aHFuQzRUaEpiN1JTNndoa1RKbG4xTkRaKzBheFc3My9JanhlcGNMUzNUd21xdmhH?=
 =?big5?B?OVVRQ0ltVXkwL0kwM3VBMmJETDlVK05xSmx5RzhUZjlRNFRQcHVyNFd0U21JWHRs?=
 =?big5?B?K2RBWU1JaTJ0Zld6dWtsOHFxa09uanJXN01SaG9ZN0xWTXZDTHhLdU5UQVBtLytr?=
 =?big5?B?SlBsM09UYTdOTjYwQlRKMnpxc2tnK3dGR21nWHZSZ21FS2o3bG9iV1lKL2JnN2h6?=
 =?big5?B?RTFUV0szRWlrUmpLbS9aUkxpQmhyWWN2cXNFRFRNQVZOb2hWdXpGUFllVGxhdDM0?=
 =?big5?B?RXRIdEw0a0ZjenY0QzlmTTRCMVplV0M4SUIreTUvZ0w5ZW9OZjI3UWd4WnorT0Vs?=
 =?big5?B?Sk5hMkJkRGt5SHhPaVVoa3ZWU3k0dm1IWTZvWlZ1Qk5nQ3dXQ0ZvVXp4K1l0TVVJ?=
 =?big5?B?TVRlVmVOcjJVd0hZMkh2cDlBM2NIa1VTaVQxRi9GdktyWU1PUzlJU2kyVnRYTEds?=
 =?big5?B?STVEMmZmR1l5SHBtMjJnRUowb1hSNVRjSGVwRWxCZVdDaXdCYzV6d1QyV0hxY1Bl?=
 =?big5?B?dXNnSFF5NGNJYzV1a0ZwVThXbjJkOUU5eUxIZmpTM0NrOG9IMXNFd25ZZUpjR1gv?=
 =?big5?B?ZkNEcnQ3V2FUNkNVNFd6RVpwaDFTRC9wOHJnMDF3L0ZxMVI3NEh5ekJoTHRVdFFC?=
 =?big5?B?ZDIwcERPTVU0RWJKMlYzeGhWVWhLS3ZDR2Nhdmg5K1FuYUdWcnBoZkpYbHZmSUFC?=
 =?big5?B?cWpaVjZHd2xFeFFFWFVaRGJjdFhVT3Fab3NWcitEd2RrUXZDbzJDL00vY0VCQm5j?=
 =?big5?B?RDUxenZHZ21SaDRGdnB0NmFJeGQvNTRoSCt1eGxMSTdYQlJrODNOaEZnb0ZZeTJh?=
 =?big5?B?UDdhVDFMSDNvOE5FM3RZVnZtbEo5MStnYTlnTUZpSmxXRmlINnVCRSsyajQrZllq?=
 =?big5?Q?Crzo6vm4MsBR9lvlyHX5Q9fRxPQMvuk8fV2Ik/EDGkOEcldf?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2339.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a21ed8-6296-4abc-c781-08d909e485f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 01:25:35.2059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PxlDTnetFTgDlrpCdcB7iEzPmj5OMIKQIBWsFsgRmqO529HSYfzvL38JnvCgvfjdy5kf5SgtbUkXw61e634iXmNqChZowIID6+/4asS6eO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2868
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
Cc: "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 Brandon Kim <brandonkim@google.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksDQoNCkN1cnJlbnRseSB3ZSBtZXQgb25lIGlzc3VlIGlzIHRoYXQgb3VyIGhvc3QgT1Mgd291
bGQgc2V0IGlwbWkgT1Mgd2F0Y2hkb2cgdGltZXIgKGRlZmF1bHQgYWN0aW9uIGlzIGhhcmQgcmVz
ZXQpIHRvIEJNQyBhbmQga2VlcCByZXNldCB0aGUgdGltZXIgaW4gYSBwZXJpb2Qgb2YgdGltZSwg
YnV0IHdoZW4gd2UgcG93ZXIgb2ZmIHRoZSBzeXN0ZW0sIG5vIG9uZSB3b3VsZCByZXNldCB0aGUg
dGltZXIgc28gdGhhdCBCTUMgcmVzZXQgdGhlIHN5c3RlbSBkdWUgdG8gd2F0Y2hkb2cgdGltZW91
dC4NCg0KTXkgaWRlYSB0byBmaXggdGhpcyBpc3N1ZSBpcyB0byBhZGQgdG8gc3RvcCB3YXRjaGRv
ZyB0aW1lciBiZWZvcmUgc2VuZGluZyBwb3dlciBvZmYvY3ljbGUgcmVxdWVzdCBmb3IgeDg2LXBv
d2VyLWNvbnRyb2wsIGJ1dCBJJ20gbm90IHN1cmUgaXQncyBhIGdvb2Qgc29sdXRpb24uDQpJZiB0
aGVyZSdzIGFueSBzdWdnZXN0aW9uLCBwbGVhc2UgZmVlbCBmcmVlIHRvIGdpdmUgbWUgc29tZSBj
b21tZW50cy4NCg0KDQpUaGFua3MuDQoNCkJlc3QgUmVnYXJkcyANCkdlb3JnZSBIdW5nDQoNCg==
