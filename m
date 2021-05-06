Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B3D37580D
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 17:59:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbdZ726nvz30Dq
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 01:59:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=iPV50QKd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.114;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=iPV50QKd; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2114.outbound.protection.outlook.com [40.107.220.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbdYp4jXPz2xYp
 for <openbmc@lists.ozlabs.org>; Fri,  7 May 2021 01:59:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmqTyAq4xEICcZl0iyodACimD1p16SG1QWWTeJ46yceIu8LVPUYAPyyEGgySTaUQccC9l1x7Tt/A9PkwpPJ1noAjIB6GErL0q8N7ZQ5ZhD04Hq2GOFxaTB+U59wz+H5Hdrc9UYuWJTiPTUsQKvy9t/Sp4psIF6icJ6tapfn8wQVG2dVIuhiE8w6VKWvdz0RzUaBHHmNMh9CxlWx+Tl1nLOFX/7adMqY+FaLA3fLY6EB/fP52RFf7ZJcyBQF+bw/ryqvCfcMj9GgW9hDbpUZtj7SAuC4k0JlT1fPwreWNLAw6wtPEpNX+mue4pVwCXwF9jBmBje6ZBdwOrLwOTyfBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0CjXnwVr6+0s+UcYtUx4RKMmQhwR9q9wpEh4xJGaoQ=;
 b=dk8c/6lyenqX8/o8u2BzkUzqIIAtko/zxEEQ3SPPjpxY9xglfmoaT90ZGUInVFpON7m2gl2hIgmKBYHxpZ4KozNL3JeUKXINaUTw+4u5xJsPRtu2SJr/U6DrtM1sq7PsWGioqlfxLQOhJV1Q4Umg8+nZRqjMa32sZbxHTPi7PJqwaz6TSFjL4iAApMCBxXEypO7ZbH7VqepE4/HAd1Ff0zsctZtFj2zGLySi/b/H8lvUFWoZUb7mZuBpeJoCS+afimGGfffzgJGxTtc00/fDHBgq5OyDF9M4mJRczZ39yDFVy7acB2fUJklVzb8XM2GchDW0eRL31V7JlFSnQF7aNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0CjXnwVr6+0s+UcYtUx4RKMmQhwR9q9wpEh4xJGaoQ=;
 b=iPV50QKdNe9ajAx8iZvLiyTYEsA/HKqQ276yrE1cqOBL3lxe2/LqpyhLcvDNWvwvxs2QD2gbfX4QQTwys7GR+uhWvHeI0Ja2Xd6AC8oLImAxOuHGqQCzGZEZwtqlEXa53Oz5mImN0C4g6sLevaxYTxSxiJqv55XkwT1uD8v54V8=
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB5835.prod.exchangelabs.com (2603:10b6:5:14f::27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.27; Thu, 6 May 2021 15:59:19 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d%5]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 15:59:19 +0000
From: Thu Nguyen OS <thu@os.amperecomputing.com>
To: Matthew Barth <msbarth@linux.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
Thread-Topic: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
Thread-Index: AQHXQllQCBPi6KR9P0WKkzFc+/PDQ6rWbTWAgACk+oA=
Date: Thu, 6 May 2021 15:59:18 +0000
Message-ID: <DAC41731-7B29-4743-87D8-40324324FF96@amperemail.onmicrosoft.com>
References: <B6120112-33DD-41A6-A0F2-7A9FBFEEB081@amperemail.onmicrosoft.com>
 <d6b2354e-f0e6-8819-4b39-1481660d1361@linux.ibm.com>
In-Reply-To: <d6b2354e-f0e6-8819-4b39-1481660d1361@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
x-originating-ip: [2402:800:6344:392d:a1d3:195d:8023:5cd4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c41973d-a1aa-4334-7556-08d910a7e82e
x-ms-traffictypediagnostic: DM6PR01MB5835:
x-microsoft-antispam-prvs: <DM6PR01MB583577F0B5560B897FAF2CA590589@DM6PR01MB5835.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wdP8F1zz6NWdu+/pchtAJY/Vd8R48XoDPxRm/Asv8zJsGWN8KHpRpT+qGVbZKrFZNKSrx93tcrhbQa3k81qNT+SlkRHWgscx0JIrgnz2iQKRGKH2ZDwTGItIRoTqierD3JpHw2WBLlI6IL5eqDFdw5AFMchn/qPN870+LVVloqU8C/ZTPdJB//JY/QF9zXjdBSR4ub5KJPP1MuRk7cErStL43kQJ5cnIPaMXYeARdZO5cwEVLwjhoo6SeiMCZYssRl1MmG+WIGjSE34LFfcZMgoa2yCWfuhkZdYIXrQ6FqVN6vJT1URTZsks6//88ZsE9yCrO3Sp/z2o4zv6DTm4bgEOF1d8JMFqnbujv8eH2DFP2O+cPkZGbMsoGzm2R0vwXDH3ncRBDf91orkxbdvuNctQTAUZYCQRTD+olvsPiZA3zvwQI1ojWEdSSHTVZ9dduskn391Ow+n9HEzSKDxhhsFQdxvpWBG5Bap7ptsbvwSFSHJKHbspex9RsNaDhm6Im0iRqQTdkr0m8yjZl9NG4vOLptskc3+6ZaClWwUN9OqfOnvyXw8XBQe2M5CFdReIiZA1h09Afvmt/y4k8gb2Xo6UYZzNlG4Q+dzUvSObzGyIYQgr3gG1aXpTN/PcbD85YzPQVfpld5XifP02+5I6ZV3cNKWT+RQ343tfu64Cxs0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(366004)(136003)(346002)(376002)(316002)(86362001)(66476007)(186003)(76116006)(478600001)(53546011)(91956017)(6486002)(71200400001)(2906002)(5660300002)(966005)(8676002)(33656002)(122000001)(83380400001)(66946007)(38100700002)(6512007)(64756008)(9686003)(66556008)(110136005)(8936002)(66446008)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WmszVzIrS3AxUzFXY0ZsZ2dBcHFiSjRPci9zcTFoWHAvb0JYRVA0RGpHR0Mz?=
 =?utf-8?B?cWNjMUw4aGZ5TFlUd25GRGQ1dmJtTEVBWEN1RDFLWWRuUE9IMzM5TjI4NWhq?=
 =?utf-8?B?SllXVkcxc0ROSjB6RndMTlRwdkkyUXZCdENCYVk3NGhoM3hiWC9rMzdobXZm?=
 =?utf-8?B?bWFNVytRRHJ5YTN6c05BaEZpbENSSzFRR09pN2J0U2IzaFJUT2RraFYvNHhR?=
 =?utf-8?B?Zm9lNS96NEtCM2hrWm1BdlVueGZkU1RrMUFpUkcvVFNnNjZJaFdIb1dSQWU3?=
 =?utf-8?B?TTZFaHpiZGh1WVRmQ2dVbHpXWmhVNnduYW04eHFGdEVZTk5nZXJpQU1iSWU3?=
 =?utf-8?B?SHJaZUdxV2FTbGxEMjdNenk0NkhzTkY0RE13bThDY2JUU1N6emZsdlRyekVs?=
 =?utf-8?B?NFJRQlcwbXI3U0NiWTBDT0kwV3NBMG9iYk9aYkdGZXVXYytRQ1BjanY5QnJi?=
 =?utf-8?B?b2Ywc2pLQmloNXZHYkgwRGk4Yy9TZEhVN0FGc2JhYXNvYStNNEx6RE1GUFE2?=
 =?utf-8?B?NjFnYVNZZnUzMlcxZWhwV05NY0hHb2FvTDdHZTBFWGZ0VkpRaWJuTFVnV0o4?=
 =?utf-8?B?V2x0S2NBY2ZrbUZqOUo4QVI3Y0JsTWFTREFEdU9RMVNNa1JTNTVMY0d3YkxT?=
 =?utf-8?B?eXFPb0ROUGY1bk1JeXpnTW1EMzBiWXVDZmVNbWdERzRaMzdiR0YrREh4bndV?=
 =?utf-8?B?VTk4N3VzU2NDYjB4VzY2UGsyeXl2bzUveUV0cStpeDY5eERWVldUWWZXK0VS?=
 =?utf-8?B?dzhFSzdzdGVJczJLc09zaFZ0WUxSd0ZCM0xBVU9ReGwwTjNsaG9xbzFUcmtE?=
 =?utf-8?B?SmNYdklOMmFsbUt4WW9XSUdDb0RmZjZLaWt2RXpNeFVYVlZOMkNhNklDd1hD?=
 =?utf-8?B?d2Q3dU5SVGwycU91cEx4bktSZ0FFM1JRVWNLa1AvNTdHUitKR1dwZjFpTFdZ?=
 =?utf-8?B?Q0M3K2k2bEoycjJORDhXaEN2QTM5SUpBK0Vwcmd2Z3dsOTZTM2QwMFBpV21J?=
 =?utf-8?B?c2tmM1lhQWNaNXpqM29iMSt2MVcxQjdScFZiL2xZOUF0RmtNdFU2S3dScllC?=
 =?utf-8?B?RXNJU25WVHdKa0dYa05VeC9lSjlmZUNxczJKS1lMVTl0aThJWXJHeVc4RFBa?=
 =?utf-8?B?NWNmdktVQWo3L3ZqOWlka3hBcXhud2pOZmQydERPcTZhM2xma2VxUXhyb2M0?=
 =?utf-8?B?L3Rjbmp5akxiQWNLMitNWTd6b0tjQWpGV25iM25zRkJTR2kzeHJzQ2NWQnVP?=
 =?utf-8?B?bTNpamFoTUFIcllkczduWUNValVKeHc1MnVUQ21zOHBaOUJxeWF6eloweVpW?=
 =?utf-8?B?cWxTc09RWnYzbkRsOXFiZUN4V3UzTzdHUEZWVnRJeUkxV3FsOWI4ZEpLd1Y4?=
 =?utf-8?B?dFFkQWtEbDRzZ3VQYW5oZFROWTVSZlh0N0d1K2dTNGVHdU0vaW5NWGZjUDdX?=
 =?utf-8?B?Smp1c2dXZU1ESE50TmNGL25FNnFWQUZoMkM4TVBDa2orbTlDcGloK3pPV2VB?=
 =?utf-8?B?ZDd3NUg3aFRqdURVTDdMZS90Nkxyc1FqMGtFUWQ0U2UvU3hiS0l5YW55aFVZ?=
 =?utf-8?B?d2sxcDdMWm5sU2x1VUVKNkNDVU1UeEZveDFhUnRQM0Q2dTYxY0owRm5wV0VT?=
 =?utf-8?B?bDFrb0lEOXVrYlJ0VHAvV0J2dFVmV09uNHJtY0lGNGM2OVNwK2k4bW5UM1Q2?=
 =?utf-8?B?UjhGM3hodE9MdFNnRWR1K2xkYzNvMEZjdk9SVDlET3d6Z1FtYk5HblpKVHht?=
 =?utf-8?B?enlPRzMrUU5oclBDbUQvU05ISnhpQVRkRStoNDQ3V1J2R0FZVExrc3o1czlj?=
 =?utf-8?B?YkxudkVRb2pZUWUrMVUzRkY5dklXWUNKZFMyZUpQeTFLUjZxWlFqWE9FVnM4?=
 =?utf-8?Q?/oHximbM3YkLo?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <95659C8ACEA1A44FAB3F0DB60CABBB69@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c41973d-a1aa-4334-7556-08d910a7e82e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 15:59:18.9048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vE4UZhU2VpXUOEOtTkG4NqW1I5ocRvviTbrWHOY10SSYodrtCwEMBjJmNTN3Og3AkHQnxZOCzS54SjwioIh3s3wJAS3x7V+KncHfUHicsbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5835
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDA2LzA1LzIwMjEsIDIwOjA5LCAiTWF0dGhldyBCYXJ0aCIgPG1zYmFydGhAbGlu
dXguaWJtLmNvbT4gd3JvdGU6DQoNCg0KICAgIE9uIDUvNi8yMSA0OjIyIEFNLCBUaHUgTmd1eWVu
IE9TIHdyb3RlOg0KICAgID4gSGksDQogICAgPg0KICAgID4gSeKAmW0gc3VwcG9ydGluZyB0aGUg
ZmFuIGNvbnRyb2wgYWxnb3JpdGhtcyB1c2luZyBwaG9zcGhvci1mYW4uIFBob3NwaG9yLWZhbiBt
b25pdG9yaW5nIGFuZCBjb250cm9sbGluZyByZXF1aXJlIGludGVyZmFjZSB4eXoub3BlbmJtY19w
cm9qZWN0LkNvbnRyb2wuRmFuUHdtIGluIHRoZSBmYW4gaW52ZW50b3J5IG9iamVjdC4NCiAgICBU
aGF0IGlzIGEgc2Vuc29yIGludGVyZmFjZSwgbm90IGFuIGludGVyZmFjZSB0aGF0J3MgYWRkZWQg
dG8gaW52ZW50b3J5IG9iamVjdHMNCiAgICA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bo
b3NwaG9yLWZhbi1wcmVzZW5jZS9ibG9iL21hc3Rlci9kb2NzL21vbml0b3IvaW52ZW50b3J5Lm1k
DQogICAgV2hhdCB5b3UgbGlua2VkIHRvIGhlcmUgcmVmZXJzIHRvIHdoZXJlIHRoZSBmYW4gaW52
ZW50b3J5IG9iamVjdCBpcyBsb2NhdGVkIGFuZCBub3RoaW5nIHRvIGRvIHdpdGggd2l0aCB0aGUg
ZmFuIHNlbnNvcnMgdGhhdCBmYW4gbW9uaXRvciBpcyB0byBiZSBtb25pdG9yaW5nLg0KDQpbVGh1
IE5ndXllbl0gVGhlIGxpbmsgZGV0YWlsIGFib3V0IHRoZSBpbnZlbnRvcnkgY29uZmlndXJhdGlv
biBpbiBtb25pdG9yLnlhbWwgZm9yIGZhbiBtb25pdG9yICBhbmQgZmFuLnlhbWwgZm9yIGZhbiBj
b250cm9sIGZlYXR1cmUuIEl0IHNob3VsZCBiZSAiIFRoZSByZWxhdGl2ZSBwYXRoIHVuZGVyIGlu
dmVudG9yeSB3aGVyZSB0aGUgZmFuJ3MgaW52ZW50b3J5IG9iamVjdCBleGlzdHMgIi4NCg0KTG9v
ayBhdCB0aGUgZXhhbXBsZSBvZiB0aGUgZmFuIGNvbnRyb2wgY29uZmlndXJhdGlvbiAgZmlsZSBu
YW1lZCBmYW4ueWFtbCBiZWxvdyB5b3UgY2FuIHNlZSB0aGUgeWFtbCBmaWxlIGluY2x1ZGVzICJp
bnZlbnRvcnkiIHNldHRpbmcuIEFuZCB4eXoub3BlbmJtY19wcm9qZWN0LkNvbnRyb2wuRmFuUHdt
IGludGVyZmFjZSBpcyByZXF1aXJlZCBpbnRlcmZhY2UgZm9yIHRoYXQgaW52ZW50b3J5IHBhdGgu
DQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1mYW4tcHJlc2VuY2UvYmxvYi9t
YXN0ZXIvY29udHJvbC9leGFtcGxlL2ZhbnMueWFtbA0KDQogICAgPg0KICAgID4gQnV0IEZhblNl
bnNvciBkYWVtb24gb2YgZGJ1cy1zZW5zb3Igb25seSBhZGRzIC94eXovb3BlbmJtY19wcm9qZWN0
L3NlbnNvcnMvZmFuX3RhY2ggdG8gaW52ZW50b3J5IGxpc3QsIGFuZCB0aGlzIHBhdGggZG9u4oCZ
dCBzdXBwb3J0IHh5ei5vcGVuYm1jX3Byb2plY3QuQ29udHJvbC5GYW5Qd20gaW50ZXJmYWNlLg0K
ICAgIEkgY2FudCBzcGVhayB0byB0aGUgc3VwcG9ydCBvZiBkYnVzLXNlbnNvcnMgYW5kIHRoZSB1
c2Ugb2YgdGhlIEZhblB3bSBpbnRlcmZhY2UsIGJ1dCBwaG9zcGhvci1mYW4tbW9uaXRvciBjYW4g
c3VwcG9ydCBlaXRoZXIgdGhlIHVzZSBvZiBSUE0gb3IgUFdNIGZhbiBzZW5zb3JzIGZvciBtb25p
dG9yaW5nIGFuZCB1cGRhdGluZyB0aGUgY29ycmVzcG9uZGluZyBPcGVyYXRpb25hbFN0YXR1cyBv
ZiBhIGZhbiBpbiBpbnZlbnRvcnkuDQogICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhv
c3Bob3ItZmFuLXByZXNlbmNlL2Jsb2IvbWFzdGVyL2RvY3MvbW9uaXRvci9zZW5zb3JzLm1kDQoN
CiAgICBTdXBwbHlpbmcgdGhlIGAgInRhcmdldF9pbnRlcmZhY2UiOiAieHl6Lm9wZW5ibWNfcHJv
amVjdC5Db250cm9sLkZhblB3bSIgYCBkaXJlY3RzIGZhbiBtb25pdG9yIHRvIG1vbml0b3IgdGhl
IGZhbiBzZW5zb3IgdXNpbmcgdGhlIFRhcmdldCBwcm9wZXJ0eSBmcm9tIHRoYXQgaW50ZXJmYWNl
LiBXaGVuIHRoZSAidGFyZ2V0X2ludGVyZmFjZSIgaXMgbm90IHByb3ZpZGVkIG9uIGEgZmFuIHNl
bnNvciwgdGhlIGRlZmF1bHQgaXMgdG8gdXNlIHRoZSAieHl6Lm9wZW5ibWNfcHJvamVjdC5Db250
cm9sLkZhblNwZWVkIiAoUlBNKSBpbnRlcmZhY2UuDQpbVGh1IE5ndXllbl0NClRoZSBwb2ludCBo
ZXJlIGlzIHRoZSBwaG9zcGhvci1mYW4tbW9uaXRvci9jb250cm9sIGV4cGVjdCB4eXoub3BlbmJt
Y19wcm9qZWN0LkNvbnRyb2wuRmFuUHdtIG9yIHh5ei5vcGVuYm1jX3Byb2plY3QuQ29udHJvbC5G
YW5TcGVlZCBpcyBpbmNsdWRlZCBpbiAveHl6L29wZW5ibWNfcHJvamVjdC9zZW5zb3JzL2Zhbl90
YWNoLg0KQnV0IGRidXMtc2Vuc29yIGRvbid0IHN1cHBvcnQgdGhhdC4gSW4gZGJ1cyBzZW5zb3Ig
eHl6Lm9wZW5ibWNfcHJvamVjdC5Db250cm9sLkZhblB3bSBpcyBvbmx5IGF2YWlsYWJsZSBpbiAv
eHl6L29wZW5ibWNfcHJvamVjdC9jb250cm9sL2ZhbnB3bS4NCiAgICA+DQogICAgPiBEbyB5b3Ug
aGF2ZSBhbnkgc29sdXRpb24gdG8gbWFrZSBwaG9zcGhvci1mYW4gd29yayB3aXRoIGRidXMtc2Vu
c29yPw0KICAgID4NCiAgICA+IEnigJltIGN1cnJlbnRseSB1cGRhdGUgRmFuU2Vuc29yIGluIGRi
dXMtc2Vuc29yIHRvIGFkZCB4eXoub3BlbmJtY19wcm9qZWN0LkNvbnRyb2wuRmFuUHdtIHRvIC94
eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMvZmFuX3RhY2guDQogICAgUmVmZXIgdG8gdGhlIGRv
YyBsaW5rIEkgcHJvdmlkZWQgYWJvdmUgb24gaG93IHRvIHV0aWxpemUgbW9uaXRvcmluZyBmYW5z
IHRoYXQgdXNlIGEgUFdNIHRhcmdldCBvbiB0aGF0IGludGVyZmFjZS4gVGhlbiBwaG9zcGhvci1m
YW4tbW9uaXRvciB3aWxsIHVwZGF0ZSB0aGUgZmFuIGludmVudG9yeSBvYmplY3QncyAoYXMgY29u
ZmlndXJlZCB3aXRoIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWZhbi1wcmVz
ZW5jZS9ibG9iL21hc3Rlci9kb2NzL21vbml0b3IvaW52ZW50b3J5Lm1kKSB4eXoub3BlbmJtY19w
cm9qZWN0LlN0YXRlLkRlY29yYXRvci5PcGVyYXRpb25hbFN0YXR1cyBGdW5jdGlvbmFsIHByb3Bl
cnR5IGJhc2VkIG9uIGhvdyB5b3UgY29uZmlndXJlIGZhbiBtb25pdG9yIHRvIG1vbml0b3IgdGhl
IGZhbiBzZW5zb3JzLg0KICAgID4NCiAgICA+IFJlZ2FyZHMuDQogICAgPiBUaHUgTmd1eWVuLg0K
DQo=
