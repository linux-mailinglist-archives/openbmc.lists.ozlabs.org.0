Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D79CF2C0E33
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 15:59:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cfr0G0d89zDqQv
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 01:59:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-usa.com (client-ip=40.107.92.77;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=lancelot.kao@fii-usa.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fii-usa.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=Hqe0CeGJ; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cfqz26XKczDqGh
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 01:58:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZ16TrcbAPlXtZKTS/ZLGymx+6YfiHBfWf8oAD86XEQxB+xU775x6+ZisR8nPUTAPLSvGaPe0TTDG3rI7RnCZhkRjilzZAuMd9YK66y0ualDEwmXbfFz5vY4Q2vu14Lr8wB3EOIUU4Nfh4EAaOxD8Ivim78mxMz2n4bGn90gHuIy0iDHUpAJRRPU54Uhetou3wDpGBO0edZX4nFOsdx1JXRIXHmMZz6dw3D/UGtvyb5iHCqupff2sQpe7HgmBmTCZ+uIBrA4q6qQgQM0PDpWRk6trlrDBYrHGOca40dAAmUjOcXZVu2EHTR3v2Yt+BKWxtBQg1hNGzTVwq5eAnFAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XyBi9StaV/QdGHtLCxabOhUWDX4nx5dg5ZFMQmf6aM=;
 b=ZrNC3ortTtPOjgIpd8YiCHfukF5SS7GDW+WjunTKOR2ra7208jsDblWLorNWzQ94C9yDsLBlh0WwAur/LxvOLbaK8nL7i2jrpWJza3NFY14nJczA9lpDNu+/kBr7Ppv69ctjEFAqeH8jqwHak9JBuv5Yz2MiYW3icrIRONDC09F1oqxtpzqg/67SmXLy+yrSWc09iOzAaQya7uURrwIPhMRcWwaskvaydQzYzL9GExue4tE7WxDgKEov+m5Lnyaj5H6x+CW7rTp7D//EGtVLblcNgOhmQNdPrdqyewyLJX2MmQNZNJG/Ezusl0z1EniToNtn1FZ+GEGNmU3YeSaUJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-usa.com; dmarc=pass action=none header.from=fii-usa.com;
 dkim=pass header.d=fii-usa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XyBi9StaV/QdGHtLCxabOhUWDX4nx5dg5ZFMQmf6aM=;
 b=Hqe0CeGJXifKYYqwtB+pS9iBaW0WiOjh40TW/vU2e7m7JSpdZ54y+uXk0WgxDHSjhGisAX/1+nozQ99e2d1joVSI8LfQRcZnMheMgDxBjLOIkEeJPQejBOHXi0L/iwa8/34BaVP0rmd0e5pLq2NYNtb86RuSSHptTEDxzNG0ITF0hXkswujsVkVR6HCQGncNzom8k20LyLAc2SUFbhWdzM+6OtX2+m+ZyclbfMxLAKzraHfWWk8BsZCYXirOQ8VSdlPgGvdo0BvYUnvk5/i/CSCY5TyR/n9Awu5jAEPj4khV5r4qL/V4NVIQjDFyJLYWnSYhAswevXrvcB3ft3KGzQ==
Received: from DM6PR08MB4890.namprd08.prod.outlook.com (2603:10b6:5:43::18) by
 DM6PR08MB4075.namprd08.prod.outlook.com (2603:10b6:5:8d::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.28; Mon, 23 Nov 2020 14:58:14 +0000
Received: from DM6PR08MB4890.namprd08.prod.outlook.com
 ([fe80::40be:143a:73a2:b33e]) by DM6PR08MB4890.namprd08.prod.outlook.com
 ([fe80::40be:143a:73a2:b33e%7]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 14:58:14 +0000
From: Lancelot Kao <Lancelot.Kao@fii-usa.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Please add meta-fii as a subtree
Thread-Topic: Please add meta-fii as a subtree
Thread-Index: AQHWuVr0Lfdt4OXU2Eq6f0o3g+w+EanVetaA
Date: Mon, 23 Nov 2020 14:58:14 +0000
Message-ID: <80891975-EB98-4516-B282-C3BFABF16998@fii-usa.com>
References: <101AF305-0894-4AE9-8FD9-2FF0B4F09A81@fii-usa.com>
In-Reply-To: <101AF305-0894-4AE9-8FD9-2FF0B4F09A81@fii-usa.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=fii-usa.com;
x-originating-ip: [207.110.225.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb8b3efd-cf6b-4617-0d86-08d88fc03431
x-ms-traffictypediagnostic: DM6PR08MB4075:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR08MB4075072A2F555197C6BA9D12C0FC0@DM6PR08MB4075.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AIfqjVy+5owvgjb3lc+0rxMPLvByfab7bE71h6/qoTJZ8bJ0/vqVOZ2T40w9Z1arVGw6hNc1IyHv4Mx3XWgRu2Fs9AlS2E13krQlvOzFr5XYerotfI00acSI3fVGwGDh0pxdjCGkgzdi/WykwaYgVJDx+YYSEI5x8rcQcyPLSo3JrdkK9NWPDR8tPSHDwrOl0Wpq1hrVYR9CosRVYsfobtdqzZqqqvJV5aLDyBZVCh5cCDVbFmxKuKmeUBt4fvJDu10Lf1jChYkPo9C5TLXI+BSLGxFBN4XOzLhoe3v5UAPUncFWfASi5pbueIAiZN2NX8hM2TVSmOMhj6XHU2nTUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR08MB4890.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(346002)(366004)(396003)(39850400004)(2616005)(76116006)(6512007)(66946007)(186003)(54906003)(91956017)(478600001)(8676002)(6486002)(26005)(6916009)(33656002)(2906002)(6506007)(5660300002)(53546011)(66476007)(66556008)(86362001)(64756008)(71200400001)(66446008)(316002)(8936002)(4326008)(107886003)(36756003)(4744005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: zxjU2Ol8qg8hffA8AjuD6me+So2JHafRiucr0elNvhjnonEkNRaqqF0Prhj/2CLPy8XYJCVpq5nO0UovGlVLWqdcgKkjZZkFVhxKT1D/84rEtuh4YIbDZwlOOgPHkKIQBeAWGGmQXAzgibdPi52+jWRjGg2TGkEtVwDaYOQJUKEPf3LiLb33eVCu6EkJwHkigr3p4ZX2chcOXPavxhtw9wjfXYmtJ34NmJQyzqWO7NKMXfYAxXGUQx3KanTlW6bmyev9S7XKgbQGVCKKnuThBlLE8+Sx8GZIat5Mx0dpOHvvQoFVq2XppHxTYwCD89XZmB5HKSZiO+xIRLBvG4NmchPRmhM6WJ5k8YncljXhiQO1eznp2/Kikv1kjBsrsvWAYmQEdIp+0b3o8XhwKvnQV6eTzY9bp6tCzA8Cx9kZjtsRd+uQA8bAskCksoD7YTeM7W58tSaDwHuKIs7DtmefbDlVCTmnElSWsxbAv60akD2etpDEdZFz5wtua3bAgBgFIqIj/ktniwFUyn7sgjZOcssdUNP9tzajqhZ0Xssb1FfBF/uOfYEP8KAeCq3LsFYVpuNPSxc+3mgNVp8BAQ65wuuPzpH9v8Kva0+8W2ozQHPv+eub1m2dctvr3XcX8Y6AIyamSXIfwktQNuLY4hFqrTTISwhzMLYV7M2vDDT47bgWiXvzyDG64sGcjRtMR+FqHzM2Rxznu6NA0fktJxkFPrnwdmBdgJGSfwzrJC2TP+nRCo7zDHxYACxm5Xa6k0jzvUw2fQ0k3gKSiJojaP5VQUg9kVkpXmTZfcJglBc6w9LumcQA19cxhTLyAhK4wqaZLfGz7fn4kq+OTZQE3GOIxMkmJN0FgujxDJLODrNoSsjzpLuUOUz4i5VWFlcB5emCcO6pVu57YXNrOOjV8K6V0Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9EDA0091EB7BA4882BF82300C69EE01@namprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fii-usa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB4890.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8b3efd-cf6b-4617-0d86-08d88fc03431
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2020 14:58:14.3778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GTcX0xuTys355ixPN6PgGGjQrnlzL2L6eMbitZaYucPOl6H//Fmwbu78OXyCrhLTZcropy9QuB05PF3iCLXhSJGb93oXKQRmxpoRs3upqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB4075
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
Cc: Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>,
 Vivekanand Veeracholan <vveerach@google.com>,
 Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>,
 Benjamin Fair <benjaminfair@google.com>, XP Chen <Xiao-Peng.Chen@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksIEJyYWQNCglDYW4geW91IGhlbHAgdXMgdG8gbWFrZSBvdXIgbWV0YS1maWkgYXMgYSBzdWJ0
cmVlIG9mIHRoZSBvcGVuQk1DIHVwc3RyZWFtPw0KDQotLQ0KQmVzdCBSZWdhcmRzLg0KDQpMYW5j
ZWxvdCBLYW8gDQoNCkZyb206IExhbmNlbG90IEthbyA8TGFuY2Vsb3QuS2FvQGZpaS11c2EuY29t
Pg0KRGF0ZTogVGh1cnNkYXksIE5vdmVtYmVyIDEyLCAyMDIwIGF0IDc6MTggUE0NClRvOiAib3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnIiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KQ2M6IFZp
dmVrYW5hbmQgVmVlcmFjaG9sYW4gPHZ2ZWVyYWNoQGdvb2dsZS5jb20+LCBCZW5qYW1pbiBGYWly
IDxiZW5qYW1pbmZhaXJAZ29vZ2xlLmNvbT4sIE1vaGFpbWVuIEFsc2FtYXJhaSA8TW9oYWltZW4u
QWxzYW1hcmFpQGZpaS1uYS5jb20+LCBNdXN0YXRmYSBTaGVoYWJpIDxNdXN0YWZhLlNoZWhhYmlA
ZmlpLW5hLmNvbT4sIFhQIENoZW4gPFhpYW8tUGVuZy5DaGVuQGZpaS1uYS5jb20+DQpTdWJqZWN0
OiBQbGVhc2UgYWRkIG1ldGEtZmlpIGFzIGEgc3VidHJlZQ0KDQpIaSwgDQrCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgTXkgbWV0YS1maWkgYXBwcm92ZWQgYW5kIG1lcmdlZC4gQ2FuIGFu
eW9uZSBoZWxwIHRvIG1ha2UgdGhlIG1ldGEtZmlpIGFzIGEgc3VidHJlZSBvZiB0aGUgb3BlbkJN
QyBtYXN0ZXI/DQrCoA0KwqANCi0tDQpCZXN0IFJlZ2FyZHMuDQrCoA0KTGFuY2Vsb3QgS2FvDQrC
oA0KQ0FCRy9GaWkNClVTIDogKzEtMjgxLTY1NS0yNjY4DQplLW1haWwgOiBsYW5jZWxvdC5rYW9A
ZmlpLXVzYS5jb20NCg0K
