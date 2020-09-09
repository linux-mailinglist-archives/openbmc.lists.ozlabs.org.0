Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6846A26242B
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 02:46:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmNcn3pnDzDqLs
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 10:46:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64;
 helo=hqnvemgate25.nvidia.com; envelope-from=jan@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=R7CevJIz; dkim-atps=neutral
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmNbl51TjzDqJR
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 10:45:37 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f5825790000>; Tue, 08 Sep 2020 17:44:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 08 Sep 2020 17:45:31 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 08 Sep 2020 17:45:31 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Sep
 2020 00:45:31 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 9 Sep 2020 00:45:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOzGyWt1EBqn5zdkI+NK5mjGz2kCBbTGXA/gLbwYZaFwtnNUu0Ohchg2J4lMmkbJ5DSOeT/b2Y+rOmmn2hupttM5WeztoknanyIhtSt+kGyLzjvTbTPoya2KEUIYPQJQkg9Ns+ZHMGQI8XB/+56mIpkjhLtKLeBCYyXv88cZ2Md0UDOiRrqkwy/ZxXGHpNA45d9irOkzaPXT4oZM1y1fv9DwxuZ/qVuA3CDc/eVCURltL98cCcdvkmfv5Yjab2Jal0i0N2HKtDQv9Y1ZvZAFHd5HMq9zbUe02r/KR+nqb1aorbPPVAsyDx8nkd/iJ3OU4cWU6/QUwQYiUHYxdlIb1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHmF19cEyRE4zs5Fv6FHg/hAq270zsokT6eriNfwwpo=;
 b=BhEVmqXBpQljMFems9mjGQCUJDioN6ZWOmIRRQBm2q16nUOHcYahfe9eigFhWiHs3EUIYPzkyMy9P9kME08xK4olFUeuMORGR2vI/LYLS/+LovsKCHcvP2VnSMr0KHiZ8bWksgL+1yymFrKLESymCWmGlCNaHHKZb7V1huIX/+6o8bwmuBeptL2uawanaYv4aEEInmfDNRf8zwejiCQIiOSXdwy4hFDD1ADqeTviaz/mTCFl0ptPI9EX2/z4AHNLNBxcDpq+a7nJcXoL1SNfmuykDP1KVborS35k3793Q+RB0MeNnlwqBo8rIL6aeFX6B/CvtOh1vcyecN7vjpj7MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3020.namprd12.prod.outlook.com (2603:10b6:5:11f::15)
 by DM5PR12MB1242.namprd12.prod.outlook.com (2603:10b6:3:6d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Wed, 9 Sep
 2020 00:45:30 +0000
Received: from DM6PR12MB3020.namprd12.prod.outlook.com
 ([fe80::b5a1:ab5d:a3aa:273f]) by DM6PR12MB3020.namprd12.prod.outlook.com
 ([fe80::b5a1:ab5d:a3aa:273f%3]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 00:45:30 +0000
From: Jiandi An <jan@nvidia.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, Kun Zhao
 <zkxz@hotmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Enable UBI support for a platform
Thread-Topic: Enable UBI support for a platform
Thread-Index: AQHWgxUUsfcLfr+u/UKWYAqBzK09TalZ/84AgAOO8YCAAVP3AIAAmr+Q
Date: Wed, 9 Sep 2020 00:45:30 +0000
Message-ID: <DM6PR12MB3020FE5674F3DBE642D392C8CD260@DM6PR12MB3020.namprd12.prod.outlook.com>
References: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
 <242dee50-7e1b-3fc3-5105-ca33f288d959@linux.vnet.ibm.com>
 <BYAPR14MB2342A17C9B9BE853C0616E9CDC280@BYAPR14MB2342.namprd14.prod.outlook.com>
 <4e89c963-1ddd-2627-47c8-be13b903bc64@linux.vnet.ibm.com>
In-Reply-To: <4e89c963-1ddd-2627-47c8-be13b903bc64@linux.vnet.ibm.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=jan@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-09-09T00:45:28.0236241Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=d31b5c37-c016-42b9-a39d-631dadfa39d3;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: linux.vnet.ibm.com; dkim=none (message not signed)
 header.d=none;linux.vnet.ibm.com; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 096fe5ae-aff9-4c2e-8250-08d85459a6ea
x-ms-traffictypediagnostic: DM5PR12MB1242:
x-microsoft-antispam-prvs: <DM5PR12MB1242118381AE3C8346186066CD260@DM5PR12MB1242.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GGZXtkab9fq5/g3JQk6lC8sx1j0TOwnfjOKC+gym3mSFScPAYIUXmw/ls2epdUTp3cKKV/lfXl2A5D4Zsyi8LgP6j2Wd8phSg1NUBX00JtvpCJVDwaN8X5RejDhpiD8JwOmVuX1atbEcqSDw8yPqcMqlFmX4itvVOrY69Ltrf7TVv1cKnptqggUcQ18hx21ZuEINNRxOou5q6bbilxlXJdNt6Lj8++PcbwGPq0lKpwpVH43C26yuC/31scs7oLeI4nQnq68Wic00TbIUIcfnswO9Srg7kEJ0D221zplNkSKHFjYKQNj+t2Fdu5weJJTdilNJV5rU0mROe+nR1I5KVoWKbPCUmTTdIdADXX4VsAzvk9g/tL8igiggRHfYWnoclwFNnL9lz02WIC9wexoRfw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3020.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(478600001)(45080400002)(55016002)(9686003)(110136005)(7696005)(6506007)(53546011)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(26005)(186003)(86362001)(8676002)(71200400001)(52536014)(966005)(8936002)(83380400001)(83080400001)(2906002)(316002)(33656002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: jpbkFSbO+MzHJxwhWAiTkTZWL+ZTC6UjaYG/5TDiiXJyZERefFmctVIsxuCICh/zgH3aSpqBUYBQW0a7uYrkQc/ZvgAzSIub81jN/HvB8Roz6feLAIMJdirCTspurm9knh6MgxaYSLbgcXzCYPyJV+OYkxvuhZ0oT+v2RxyN1EHnJWb41xhYWoZifUn+g3O1cI2dONziYH/5mHt+Kp7M7/bgdo7qPDTCY0cXcIq7uLCkzyp6e6EAAQE87g9dkRoTA9fKmluttK1gVbx1YLoYLkbt0E8UgkXWqj9HugX44mtGLPy4FbtqsUn+Gct6G3Szpr38NgB6GxQM/QN7tuIak6umF30qUQhOD/xexe2+odlqL/MQ3rM98PmtrvkOELl+Xa+8Mk8kZr8WXMBOBWcypy6y/fuB6Fuye5PROLNBIPfkZMZDTCYOPjNo7IvX6I5c+4iSQNLHpNJNIjlj1Erer1s5em7KSkDHaaOebL8sRKDKxudcCO4BYWMQrCpfyN+bOQh7b7C7MZNFL+bkLh9ffKGQxqI+Xd3gcT0dr5rAOPrL7CuAIb33sF1evuCGAK6yUDskprzEbL5cieww3870EHK6r5zw/Cwjky2S3yP0H9lmeW5mLrBYg9EfRSNMDr+P9iR9nI9dE53gt2p5w/KELQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3020.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096fe5ae-aff9-4c2e-8250-08d85459a6ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 00:45:30.1674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozXtRHUQ/UipE5wdT/T906euUTHxDuy+GeddwbdTVsTfE0U7g25tjSGJoMV1Ok2u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1242
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1599612281; bh=rHmF19cEyRE4zs5Fv6FHg/hAq270zsokT6eriNfwwpo=;
 h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
 ARC-Authentication-Results:From:To:Subject:Thread-Topic:
 Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
 authentication-results:x-originating-ip:x-ms-publictraffictype:
 x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
 x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
 x-ms-exchange-senderadcheck:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
 MIME-Version:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
 Content-Language:Content-Type:Content-Transfer-Encoding;
 b=R7CevJIz5u2J4ZQk7ibiYvmpirdDI70N9CEX3fvJuSBk1cVsix33GAHxIFwGclkGI
 hPXD8gyFb0LdBGNbDJ5JLGmbXHOD+azSkmbvaFZrWpSi06wUi9WxXpoIcPXiOSqgC+
 uKxMyJ+r2SDDCZtC0H/6y5f3Kl+gcynxZOJHQtIirJVAkOZ4B9ySpQA6h77GLXrVbs
 lqLisQYpLJ9sJKVqPdbtLUwpLkV2uF4bbBxcmGylnhrLxJrHl/FqJ4m6EDjIXuhUQb
 QQEowlLdnGBRJbRVNx+YxBIFt0bCL//AJVkUaQy+4c02HINNvI51fOENdWODmO5H2l
 l6YXpnoCG40LQ==
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

DQo+IE9uIDA4LzA5LzIwIDEyOjM5IGFtLCBLdW4gWmhhbyB3cm90ZToNCj4gPg0KPiA+IE9uIDkv
NS8yMCA1OjQ5IEFNLCBEZWVwYWsgS29kaWhhbGxpIHdyb3RlOg0KPiA+PiBIaSBLdW4sDQo+ID4+
DQo+ID4+IE9uIDA1LzA5LzIwIDU6MzIgYW0sIEt1biBaaGFvIHdyb3RlOg0KPiA+Pj4gSGkgVGVh
bSwNCj4gPj4+DQo+ID4+PiBNeSBwbGF0Zm9ybSBpcyBiYXNlZCBvbiBhc3QyNTAwLCBhbmQgSeKA
mXZlIGFscmVhZHkgYmVlbiBhYmxlIHRvIGJ1aWx0DQo+ID4+PiBvdXQgdGhlIHViaSBpbWFnZS4g
QnV0IHdoZW4gSSB0cmllZCB0byB0ZXN0IGl0IHdpdGggcWVtdSwgaXQganVzdA0KPiA+Pj4gc3Rv
cHBlZCBhdCB1LWJvb3QgYmVjYXVzZSDigJhjYW7igJl0IGdldCBrZXJuZWwgaW1hZ2UsDQo+ID4+
Pg0KPiA+Pj4gcWVtdS1zeXN0ZW0tYXJtOiBBc3BlZWQgaUJUIGhhcyBubyBjaGFyZGV2IGJhY2tl
bmQNCj4gPj4+DQo+ID4+PiBVLUJvb3QgMjAxNi4wNyAoU2VwIDA0IDIwMjAgLSAxOTo0Nzo0OCAr
MDAwMCkNCj4gPj4+DQo+ID4+PiAgICAgICAgICBXYXRjaGRvZyBlbmFibGVkDQo+ID4+Pg0KPiA+
Pj4gRFJBTTogIDQ5NiBNaUINCj4gPj4+DQo+ID4+PiBGbGFzaDogMzIgTWlCDQo+ID4+Pg0KPiA+
Pj4gKioqIFdhcm5pbmcgLSBiYWQgQ1JDLCB1c2luZyBkZWZhdWx0IGVudmlyb25tZW50DQo+ID4+
Pg0KPiA+Pj4gSW46ICAgIHNlcmlhbA0KPiA+Pj4NCj4gPj4+IE91dDogICBzZXJpYWwNCj4gPj4+
DQo+ID4+PiBFcnI6ICAgc2VyaWFsDQo+ID4+Pg0KPiA+Pj4gTmV0OiAgIE1BQzAgOiBSR01JSQ0K
PiA+Pj4NCj4gPj4+IE1BQzEgOiBSR01JSQ0KPiA+Pj4NCj4gPj4+IEZUR01BQzEwMCMwDQo+ID4+
Pg0KPiA+Pj4gRXJyb3I6IEZUR01BQzEwMCMwIGFkZHJlc3Mgbm90IHNldC4NCj4gPj4+DQo+ID4+
PiAsIEZUR01BQzEwMCMxDQo+ID4+Pg0KPiA+Pj4gRXJyb3I6IEZUR01BQzEwMCMxIGFkZHJlc3Mg
bm90IHNldC4NCj4gPj4+DQo+ID4+PiBIaXQgYW55IGtleSB0byBzdG9wIGF1dG9ib290OiAgMA0K
PiA+Pj4NCj4gPj4+IFdyb25nIEltYWdlIEZvcm1hdCBmb3IgYm9vdG0gY29tbWFuZA0KPiA+Pj4N
Cj4gPj4+IEVSUk9SOiBjYW4ndCBnZXQga2VybmVsIGltYWdlIQ0KPiA+Pj4NCj4gPj4+IGFzdCMN
Cj4gPj4+DQo+ID4+PiBBbmQgSSBmb3VuZCB0aGUgYm9vdGFyZ3MgaXMgbm90IHJpZ2h0LA0KPiA+
Pj4NCj4gPj4+IGFzdCMgcHJpbnQNCj4gPj4+DQo+ID4+PiBiYXVkcmF0ZT0xMTUyMDANCj4gPj4+
DQo+ID4+PiBib290YXJncz1jb25zb2xlPXR0eVM0LDExNTIwMG44IHJvb3Q9L2Rldi9yYW0gcncN
Cj4gPj4+DQo+ID4+PiBib290Y21kPWJvb3RtIDIwMDgwMDAwDQo+ID4+Pg0KPiA+Pj4gYm9vdGRl
bGF5PTINCj4gPj4+DQo+ID4+PiBDaGVja2VkIGluIHRoZSBidWlsZCBmb2xkZXIgZm9yDQo+ID4+
PiB0bXAvd29yay9teXBsYXRmb3JtLW9wZW5ibWMtbGludXgtZ251ZWFiaS91LWJvb3QtYXNwZWVk
LzFfdjIwMTYuMDcrZw0KPiA+Pj4gaXRBVVRPSU5DKzFkZWQ5ZmEzYTItcjAvIGFuZCBmb3VuZCB0
aGUgbm9uZSBvZiB0aGUgZm9sbG93aW5nIHBhdGNoZXMNCj4gPj4+IGFyZSB0aGVyZSwNCj4gPj4+
DQo+ID4+PiAwMDAyLWNvbmZpZy1hc3QtY29tbW9uLWhhY2stYm9vdG9wdHMucGF0Y2gNCj4gPj4+
DQo+ID4+PiAwMDAzLWNvbmZpZy1hc3QtY29tbW9uLUFkZC1ib290b3B0cy10by1zdXBwb3J0LXVi
aS1hbmQtbXQucGF0Y2gNCj4gPj4+DQo+ID4+PiAwMDA0LWNvbmZpZy1hc3QtY29tbW9uLUFkZC1j
b25kaXRpb25hbC1mYWN0b3J5LXJlc2V0LWNvbW0ucGF0Y2gNCj4gPj4+DQo+ID4+PiAwMDA1LWNv
bmZpZy1hc3QtY29tbW9uLUZhbGwtYmFjay10by1zZWNvbmRhcnktZmxhc2gtb24tZmEucGF0Y2gN
Cj4gPj4+DQo+ID4+PiBJIHRoaW5rIHRoYXTigJlzIHdoeSB0aGUgYm9vdGFyZ3MgaXMgbm90IGNv
cnJlY3QuDQo+ID4+Pg0KPiA+Pj4gVGhpcyBpcyB0aGUgZGV0YWlscyBvZiBob3cgSSBlbmFibGVk
IHRoZSB1Ymkgc3VwcG9ydCBpbiBteSBwbGF0Zm9ybQ0KPiA+Pj4gcmVjaXBlcywNCj4gPj4+DQo+
ID4+PiAxLiBJbiBtZXRhLW15cGxhdGZvcm0vY29uZi9kaXN0cm8vb3BlbmJtYy1teXBsYXRmb3Jt
LmNvbmYsIEkgYWRkZWQsDQo+ID4+Pg0KPiA+Pj4gcmVxdWlyZSBjb25mL2Rpc3Ryby9pbmNsdWRl
L3Bob3NwaG9yLWJhc2UuaW5jDQo+ID4+Pg0KPiA+Pj4gcmVxdWlyZSBjb25mL2Rpc3Ryby9pbmNs
dWRlL3Bob3NwaG9yLXViaS5pbmMNCj4gPj4NCj4gPj4gWW91IHNob3VsZCBqdXN0IG5lZWQgdGhl
IG9uZSBsaW5lIGFib3ZlLCBwbHVzIGEgZGV2aWNlIHRyZWUgY2hhbmdlIGZvciB5b3VyDQo+IHN5
c3RlbS4gVGhlIGRlZmF1bHQgb3BlbmJtYy1mbGFzaC1sYXlvdXQuZHRzaSBkb2Vzbid0IG1ha2Ug
YSB1YmlmcyBwYXJ0aXRpb24uDQo+IFlvdSBjYW4gZm9yIGVnIGxvb2sgYXQgd2l0aGVyc3Bvb24n
cyBkdHMsIHdoaWNoIHVzZXMgdWJpZnMuDQo+ID4gSGkgRGVlcGFrLCB0aGFuayB5b3UgZm9yIHJl
cGx5LiBJJ3ZlIHRyaWVkIHRvIHVzZSB0aGUgd2l0aGVyc3Bvb24ncyBmbGFzaCBsYXlvdXQNCj4g
cGVyIHlvdXIgdGlwcyBoZXJlLiBCdXQgaXQgc3RpbGwgc3RvcHMgYXQgdS1ib290IHdpdGggImNh
bid0IGdldCBrZXJuZWwgaW1hZ2UhIiBlcnJvci4NCj4gRG8gSSBuZWVkIHRvIGVuYWJsZSBhbnkg
a2VybmVsIGNvbmZpZyBvcHRpb25zPw0KPiANCj4gDQo+IEhpIEt1biwgSSBkb24ndCB0aGluayB5
b3UgbmVlZCBhZGRpdGlvbmFsIGtlcm5lbCBjb25maWcgdXBkYXRlcy4gSSBzdXNwZWN0DQo+IHNv
bWV0aGluZyB3cm9uZyB3aXRoIHRoZSB3YXkgdGhlIGltYWdlIGlzIGJ1aWx0LiBBcmUgeW91IGFi
bGUgdG8gc2VlIGV4cGVjdGVkDQo+IHZhbHVlcyBmb3IgdGhlIHUtYm9vdCBlbnZpcm9ubWVudCB2
YXJpYWJsZXMgYW5kIE1URCBwYXJ0aXRpb25zPyBGb3IgZWc6DQo+IA0KPiBhc3QjIG10ZHBhcnRz
DQo+IGRldmljZSBub3IwIDxibWM+LCAjIHBhcnRzID0gMw0KPiAgICM6IG5hbWUgICAgICAgICAg
ICAgICBzaXplICAgICAgICAgICAgb2Zmc2V0ICAgICAgICAgIG1hc2tfZmxhZ3MNCj4gICAwOiB1
LWJvb3QgICAgICAgICAgICAgIDB4MDAwNjAwMDAgICAgIDB4MDAwMDAwMDAgICAgICAwDQo+ICAg
MTogdS1ib290LWVudiAgICAgICAgICAweDAwMDIwMDAwICAgICAweDAwMDYwMDAwICAgICAgMA0K
PiAgIDI6IG9ibWMtdWJpICAgICAgICAgICAgMHgwMWY4MDAwMCAgICAgMHgwMDA4MDAwMCAgICAg
IDANCj4gYWN0aXZlIHBhcnRpdGlvbjogbm9yMCwwIC0gKHUtYm9vdCkgMHgwMDA2MDAwMCBAIDB4
MDAwMDAwMDANCj4gDQoNCkhpIERlZXBhaywNCk9uZSB0aGluZyBpcyBubyBtdGRwYXJ0cyBjb21t
YW5kIGZyb20gdS1ib290LiAgRG8gd2UgbmVlZCB0byBhZGQgQ09ORklHX0NNRF9NVERQQVJUUz8N
CkhlcmUgdGhlIGNvbW1lbnQgc2F5cyBhZGRpbmcgQ09ORklHX0NNRF9NVERQQVJUUyB3b24ndCB3
b3JrLg0KaHR0cHM6Ly9saXN0cy5kZW54LmRlL3BpcGVybWFpbC91LWJvb3QvMjAxMi1EZWNlbWJl
ci8xNDI4MzcuaHRtbA0KDQpBY3R1YWxseSB1c2luZyB3aXRoZXJzcG9vbidzIGZsYXNoIGxheW91
dA0KaHR0cHM6Ly9naXRodWIuY29tL2libS1vcGVuYm1jL29wZW5ibWMvYmxvYi9PUDk0MC9tZXRh
LWlibS9tZXRhLXdpdGhlcnNwb29uL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LWFzcGVlZC8w
MDAxLUFSTS1kdHMtQXNwZWVkLVdpdGhlcnNwb29uLTEyOC1VcGRhdGUtQk1DLXBhcnRpdGlvbmku
cGF0Y2gNCg0KU28gdGhlIG9uZSB3ZSBoYXZlIGluIHRoZSBkZXZpY2UgdHJlZSBpcyBhcyBmb2xs
b3dzLi4NCg0KJmZtYyB7DQoJc3RhdHVzID0gIm9rYXkiOw0KCWZsYXNoQDAgew0KCQlzdGF0dXMg
PSAib2theSI7DQoJCW0yNXAsZmFzdC1yZWFkOw0KCQlsYWJlbCA9ICJibWMiOw0KLy8jaW5jbHVk
ZSAib3BlbmJtYy1mbGFzaC1sYXlvdXQuZHRzaSINCg0KCQlwYXJ0aXRpb25zIHsNCgkJCSNhZGRy
ZXNzLWNlbGxzID0gPCAxID47DQoJCQkjc2l6ZS1jZWxscyA9IDwgMSA+Ow0KCQkJY29tcGF0aWJs
ZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsNCgkJCXUtYm9vdEAwIHsNCgkJCQlyZWcgPSA8IDAgMHg2
MDAwMCA+Ow0KCQkJCWxhYmVsID0gInUtYm9vdCI7DQoJCQl9Ow0KCQkJdS1ib290LWVudkA2MDAw
MCB7DQoJCQkJcmVnID0gPCAweDYwMDAwIDB4MjAwMDAgPjsNCgkJCQlsYWJlbCA9ICJ1LWJvb3Qt
ZW52IjsNCgkJCX07DQoJCQlvYm1jLXViaUA4MDAwMCB7DQoJCQkJcmVnID0gPDB4ODAwMDAgMHg3
RjgwMDAwPjsNCgkJCQlsYWJlbCA9ICJvYm1jLXViaSI7DQoJCQl9Ow0KCQl9Ow0KCX07DQp9Ow0K
DQo+IA0KPiA+PiBEb2VzIGFueW9uZSBrbm93IHdoeSB0aGUgZGVmYXVsdCBpcyBzdGF0aWMgcGFy
dGl0aW9ucywgYW5kIG5vdCB1Ymlmcz8NCj4gPj4NCj4gPj4gUmVnYXJkcywNCj4gPj4gRGVlcGFr
DQo+ID4+DQo+ID4+PiAyLiBJbiBtZXRhLW15cGxhdGZvcm0vY29uZi9tYWNoaW5lL215cGxhdGZv
cm0uY29uZiwgSSBhZGRlZCwNCj4gPj4+DQo+ID4+PiBJTUFHRV9GU1RZUEVTICs9ICIgbXRkLXVi
aSBtdGQtdWJpLXRhciINCj4gPj4+DQo+ID4+PiBPQk1DX01BQ0hJTkVfRkVBVFVSRVMgKz0gIiBv
Ym1jLXViaS1mcyINCj4gPj4+DQo+ID4+PiBEbyBJIG1pc3MgYW55dGhpbmc/DQo+ID4+Pg0KPiA+
Pj4gVGhhbmtzLg0KPiA+Pj4NCj4gPj4+IEJlc3QgcmVnYXJkcywNCj4gPj4+DQo+ID4+PiBLdW4g
Wmhhbw0KPiA+Pj4NCj4gPj4+IC8qDQo+ID4+Pg0KPiA+Pj4gemt4ekBob3RtYWlsLmNvbSA8bWFp
bHRvOnpreHpAaG90bWFpbC5jb20+DQo+ID4+Pg0KPiA+Pj4gKi8NCj4gPj4+DQo+ID4+DQo+ID4g
S3VuDQo+ID4NCg0K
