Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4889E75F9E6
	for <lists+openbmc@lfdr.de>; Mon, 24 Jul 2023 16:30:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0wS5xN1h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8jHx16frz2yVP
	for <lists+openbmc@lfdr.de>; Tue, 25 Jul 2023 00:30:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0wS5xN1h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e88::60b; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8jHH6TTCz2yDc
	for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2023 00:30:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDR150IkVKh86eIzNqy+Au6Yag5hvCGexLEWyk8u/EixpwQBHBGC1x2Z0CQkP9zYrZuN+MfltueniH5S9Qng88UhriIFieSMvUeqWbd8qpNyGv1qrvI/uo6QXnBZBAPxuUWh2/a7b9hN0WIwSCCgwqLz2ynB2pCJhUXssPULWU8j4sJ6vlb8Yy3ySLgk9h8K0pyTd9mC+ptLp2VJJdO6LOGPD6K7on0xGY7kG+ztiQJWfqubkvxJWfb0oWjFiqwnvbd+78ziRwOlLrmkJZvpbJYRlMTvSxVOky6tuXbmyB2KVy+8q/UUNzrnOpaftbdthcr6RJbujDBLnC+KjSCqiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slC+8jbqP0MBsRXheF70qZ8qyWI+IuDAvLURUqBQtwQ=;
 b=NlWzBSkGJPmET9Kdarv7Wkt/xq6nmmzeewqO+eqmQPZlHSIir/OH9t6dDUsW/Zz44ZEp7GGxfQbAZYK7HzON1hQEz1IBVhpuDwOdIG2ZLurrChZLpMwYkhwMMvxM/IhwsQjTwqwUg/mUjo3phElzdRrmvAHb2N/aQqBbHqawPmqXPGFiNLk7znv78IAcITKf2xQr7xaaSGJk8rMH+yTU/Swcau82jmjt6qgflxN4qX6f0dKvyisaQTeWQPxJwbVh26RAm/vJ0vzQQbituRQX95BtFdhZsVqics8ll3dAgXIxuiVi78/itHgD4UStkTRbMnOEC8+PRncetLsxtBK9tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slC+8jbqP0MBsRXheF70qZ8qyWI+IuDAvLURUqBQtwQ=;
 b=0wS5xN1hJCL4Of47TY4Vfnz0VXSoNTi5u/nncHmuyirlMa/+zmEv1eBdJs9YsDKEIQPkz2UVhXF1RKz6DWzILJ9NPdnAJywmz+74eZr1t7F/ZIxCVCGjFThalk/UAGssWTfUAX9KbhdxVKH+/DtVBrthwPheo0p7ZcE5uuM5dS8=
Received: from SN6PR12MB4752.namprd12.prod.outlook.com (2603:10b6:805:e9::10)
 by SN7PR12MB6862.namprd12.prod.outlook.com (2603:10b6:806:265::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 14:29:41 +0000
Received: from SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::b768:e26e:6540:664b]) by SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::b768:e26e:6540:664b%6]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 14:29:41 +0000
From: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [RFC] BMC RAS Feature
Thread-Topic: [RFC] BMC RAS Feature
Thread-Index: AQHZW7QOFWzAFQP9VEqfgxia17VY46+6hyOAgA812hA=
Date: Mon, 24 Jul 2023 14:29:40 +0000
Message-ID:  <SN6PR12MB475228EBE67B4A125D9BD2EA9602A@SN6PR12MB4752.namprd12.prod.outlook.com>
References: <07621845-19a4-0568-be0e-f556ba40b813@amd.com>
 <7d5f86f9-f39a-829f-fd64-62d244c04ef4@linux.intel.com>
In-Reply-To: <7d5f86f9-f39a-829f-fd64-62d244c04ef4@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels:  MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=6cf3bb1f-41cb-4a9d-9bb8-2b422eb1ea3b;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-24T14:21:55Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR12MB4752:EE_|SN7PR12MB6862:EE_
x-ms-office365-filtering-correlation-id: 3b4c3065-e55f-40fd-aa60-08db8c526ad5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  a5KaEEE2fYQHHuQljTsUryjIKIn/UVslK9Va18PTRxMpTta/xigxgSmWo1AP5pcX1gD8EjB0/hBYbbTKHsqShkZsKArjqlh0CaVpIcm+xOtwY66AeKg0KNZsJb4mESuiDqF5T/c8QhW9Pu3VciDIFdJNZPAdjTRqYJxoRq63CAK+5P8UozEKqv2voFc45csreak0Ie32Ek+nv5tiiJDVdfUAvUbsJ4K6D8eQ9jpe+QcH47eaMA9TGvGfpn/H1GiCHH92P1UYOUctM0P5tVp2b3qTFx1M4ZI98fcVYxDtwRc2Vr4ZssXyUdeoPBll9kDpUWtT/90ZASwklNM48l/E3sb2VgsHwNkMBSgwJckp9M2HWFe9xO+P8SZyVwu9GjQjkUzjIiUJtQBWvNiseJZhYs7eaLcNr1Bc8N0t7JbTjKbj0PnKERculStg5fx0K0l/xPa2Yib0WD7h5xy62WP6BoFNxyNN75FWaOfdpkX0XPVK85pc3PEl8Q4GIaFLVuqAH5y+I0F/NuZy4AJB9L+GY2deIE/C1HlOnaIkE/VZMITAcvUqPW00ft4IfsiOUmrejqdF8n8/z3i2JMDiB0xHUaDosiRUm4brx3+Qz2Om1Wo=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4752.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(71200400001)(9686003)(7696005)(478600001)(110136005)(186003)(53546011)(6506007)(26005)(2906002)(76116006)(41300700001)(66446008)(66556008)(64756008)(5660300002)(52536014)(316002)(8936002)(8676002)(66946007)(66476007)(38100700002)(122000001)(33656002)(38070700005)(86362001)(83380400001)(55016003)(66899021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cnN0VWo1REs3YllZN2RrS2JJSjdXN3cvSFZMTmZNUHJrQ0xyMnV1ZU91cHZO?=
 =?utf-8?B?eHdUVEw4R0N3S3lieFR1WDFjUlIyMVFhc2hvOWhQQ2QzTVN4aHhyL0J0RUw2?=
 =?utf-8?B?K3ZxOTJ5UU9XWmd6eHpyZlNwc042U0ROWW1KdFU2NUxiZmNoTEhqNE5Vb1dv?=
 =?utf-8?B?ZHR6N2JyOFpJNjJGYVZGbVV3WjRmNXlBYUN3SU9PZllUSTN6NWg4a1VvRWJH?=
 =?utf-8?B?NnRVekwrbjVLZVRvWVIzUkJyRXl4T21TN3N0Y0lqNUw0ekNNU1BaM3RMMDU2?=
 =?utf-8?B?cmdjWFE2TGRYTW5tSjYrSnZhUXhUOGR5bzBNL0t6ZlpUL2EyVTVqMFoySGl4?=
 =?utf-8?B?WTFwZEVvQUN5S0k3RStjM0NFWS9iUGdWOXhSQ3JpMFFvS0pXRUpMTk45SHVL?=
 =?utf-8?B?WGN2TkszK1NqeFlhOTN0Nk8wWkJSZXB5UzhFUVMxVXlabFZERk9SZDFnYTdD?=
 =?utf-8?B?K3dORXhJdjJtRk9IdzQ5cFBPdTJNMzBUYWZvaS9SNlM5dE93S0lDTTBGRldn?=
 =?utf-8?B?SkNpR3hhT3dHV3hZQmZ2RE5FVklUVUJnclVJKzh2UGR3R2VLYXJOVExKbUxx?=
 =?utf-8?B?a1NKUnMxdkgrS3BqSFdtNlpTZDMwZElYMStucWk0RHQwR3pzT01GRHJEOUwr?=
 =?utf-8?B?RWY4blBOT1pEM2dyVlV0SFV5a1RMVCtMVnhrRFNsYUs2L250K2NSUm5PN24x?=
 =?utf-8?B?Qk80VGV5clEwQXE4a3FFYnNkUmZhbHVRUHJKUkkrSFlHaUhadmlBMlh1R0Js?=
 =?utf-8?B?TDhCaGhzYk11TXJuNjRYRi8zZWgwS2RpTjhyVVRNWk8waFp4TmZkNGxvUkto?=
 =?utf-8?B?bkpkcXZRVlZETnA3SlZzdHNsU1pLVjhtVXFhTUI4K3lOb2FvcENiTXBteWhm?=
 =?utf-8?B?dWZ1QVl5M0dRSEhVNVhXcC90WjVLLzdwSlk1MkZtUGdRVzlUR1VBMlVJcU9s?=
 =?utf-8?B?MytpUXhDS3ZuNjZvQVdjd1BVTmRZQjFlUmFEQ21KTDd3SjlLM09UZnJwQ0Ju?=
 =?utf-8?B?OUdpRk9SUWtzdGM0ZW9TNGRXdlMxb2tya3BvbVU1SmtmQnBwamVEK0hvd2oz?=
 =?utf-8?B?UHNINDdhOEF0QWxZbUczTlNaaHJCSFpYQXI0Q1VxRUVXVWF6dXdEWkV6Tkp4?=
 =?utf-8?B?cjdITFIybnB0ZUNHdlRwUy94Rkh4b0g0ZjhZS2tzMTcwa2doTkJmYThmdDJG?=
 =?utf-8?B?aWJZMVhJeHBObHdsWC9vNnU1eUdYUThHc2s5RGxWLzNFMzJUUitpdFZ5VHRI?=
 =?utf-8?B?S1E0YVoyZ05MV2ZibzI5TngzYlE3RUNoUFRJZC9BdmdvREI0dDk1blhLZTJC?=
 =?utf-8?B?akxBc3N0QXVZcThQTWVxNytjS1BGbDh2WW9FMWVaRUgzZnZWclpZZDlabVhr?=
 =?utf-8?B?QmFqVjZ2aEJwbUpJaXR3NkhWa0xnb0l0alljUmlpZmdDd2dieXRvdUdVQjdE?=
 =?utf-8?B?U2xmbHM2YVRGcVJuWnUzTmNESkNPalcvV0ZzL2phSThEQ2FUT1NZWTkxd1p2?=
 =?utf-8?B?a3NtbURuZkpXUHlHK2toT2tHOUtBdUlLMTRuYTBxN1NOeDRCY0lvOUZ0d05T?=
 =?utf-8?B?SWI1M3M0RTJnOHJrLy9CTWkzYWVRTGRFT3NRZmhJeGRhMWtNQ1hFY0tHN0FR?=
 =?utf-8?B?ZFgySEh1dndCZFFnWWxhQ3pjbVJwYzllRFJSNjVsZjFMcjU2YVhrejJBclpR?=
 =?utf-8?B?NmdvdXVQMEZZOTNka0dZaUxrKy91cjZSelhvVEx1YTFrUjNwVXZIVHhncXFl?=
 =?utf-8?B?R0poUVlSQ3hMM0pJcmpPMUxENW95WDFTNWlmN0VyWjRkNlRDemhtN205TlM5?=
 =?utf-8?B?bmhEQU9XY29QNWF6d2JNNStiWmVvRDFWUTRhTGE5UlpqMnpsdERwemlodVFZ?=
 =?utf-8?B?Zm83Z3RTaGdwWndFNFZIYmUyNjV0K283Y3RBcU9zNXVaR285U29EaVJJMGZa?=
 =?utf-8?B?OHZEMGVuQldOWlV6UXZ5OFJXTTVxTmJ1N1FUcTFac2dwTDVFVDVmV0JMMU9p?=
 =?utf-8?B?UDhad00zZ3YzSVU2QitucUpiWFJvdEhUQ01tMFBYOVVFazd6SXRMWFZTY2xk?=
 =?utf-8?B?QUMrdnQ3WWFlVGZTOGM3cGhEOWMyM0daTkg5Z25zNGozbnU1SEE3OXpBSjdn?=
 =?utf-8?Q?ALbM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4752.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4c3065-e55f-40fd-aa60-08db8c526ad5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 14:29:41.0145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hyHCo8mJlFg1xx1UkPSrD+QBCNh5/22CwLIbjvVLV3D6NG5KWhWVUPaMw9jg+6FGOmvOUJsDlujovLk4HleiYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6862
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClRoYW5rcyBmb3IgeW91ciBmZWVk
YmFjayBKYXNvbi4gU29ycnkgZm9yIHRoZSBkZWxheSBpbiBteSByZXNwb25zZS4NCg0KMS4gVGhl
IGZvcm1hdCBjYW4gYmUgYW55dGhpbmcuIFtXZSBjb3VsZCB1c2UgcGhvc3Bob3ItZGVidWctY29s
bGVjdG9yIHRoYXQgY29sbGVjdHMgZGlmZmVyZW50IGRlYnVnIGR1bXBzXQ0KMi4gQWdyZWUgd2l0
aCB0aGlzIHBhdGgNCiAgICAgICAgaS4gUmVkZmlzaCAtPiBwcm92aWRlZCBieSBibWN3ZWIgd2hp
Y2ggcHVsbHMgZnJvbQ0KICAgICAgICBpaS4gRC1CdXMgLT4gcHJvdmlkZWQgYnkgYSBuZXcgc2Vy
dmljZSB3aGljaCBsb29rcyBmb3IgZGF0YSBzdG9yZWQgYnkNCiAgICAgICAgaWlpLiBwcm9jZXNz
b3Itc3BlY2lmaWMgY29sbGVjdG9yIC0+IHByb3ZpZGVkIGJ5IHNlcGFyYXRlIHNlcnZpY2VzIGFz
IG5lZWRlZCBhbmQgdHJpZ2dlcmVkIGJ5DQogICAgICAgIGl2LiBwbGF0Zm9ybS1zcGVjaWZpYyBt
b25pdG9yaW5nIHNlcnZpY2UgLT4gcHJvdmlkZWQgYnkgaG9zdC1lcnJvci1tb25pdG9yIG9yIG90
aGVyIHNlcnZpY2UgYXMgbmVlZGVkLg0KV2UgbmVlZCBhIHJlcG9zaXRvcnkgZm9yIHByb2Nlc3Nv
ci1zcGVjaWZpYyBjb2xsZWN0b3IuDQoNClRoYW5rcywNClN1cHJlZXRoIFZlbmthdGVzaA0KU3lz
dGVtIE1hbmFnZWFiaWxpdHkgQXJjaGl0ZWN0ICB8ICBBTUQNClNlcnZlciBTb2Z0d2FyZQ0KDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5j
ZXMrc3VwcmVldGgudmVua2F0ZXNoPWFtZC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxm
IE9mIEJpbGxzLCBKYXNvbiBNDQpTZW50OiBGcmlkYXksIEp1bHkgMTQsIDIwMjMgNTowNSBQTQ0K
VG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IFtSRkNdIEJNQyBSQVMg
RmVhdHVyZQ0KDQpDYXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVy
bmFsIFNvdXJjZS4gVXNlIHByb3BlciBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywg
Y2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcuDQoNCg0KU29ycnkgZm9yIG1pc3NpbmcgdGhp
cyBlYXJsaWVyLiAgSGVyZSBhcmUgc29tZSBvZiBteSB0aG91Z2h0cy4NCg0KT24gMy8yMC8yMDIz
IDExOjE0IFBNLCBTdXByZWV0aCBWZW5rYXRlc2ggd3JvdGU6DQo+DQo+ICMjIyMgUmVxdWlyZW1l
bnRzDQo+DQo+IDEuIENvbGxlY3RpbmcgUkFTL0NyYXNoZHVtcCBzaGFsbCBiZSBwcm9jZXNzb3Ig
c3BlY2lmaWMuIEhlbmNlIHRoZSB1c2UNCj4gICAgIG9mIHZpcnR1YWwgQVBJcyB0byBhbGxvdyBv
dmVycmlkZSBmb3IgcHJvY2Vzc29yIHNwZWNpZmljIHdheSBvZg0KPiAgICAgY29sbGVjdGluZyB0
aGUgZGF0YS4NCj4gMi4gQ3Jhc2ggZGF0YSBmb3JtYXQgc2hhbGwgYmUgc3RvcmVkIGluIGNvbW1v
biBwbGF0Zm9ybSBlcnJvciByZWNvcmQNCj4gICAgIChDUEVSKSBmb3JtYXQgYXMgcGVyIFVFRkkg
c3BlY2lmaWNhdGlvbg0KPiAgICAgW2h0dHBzOi8vdWVmaS5vcmcvc3BlY3MvVUVGSS8yLjEwL10u
DQoNCkRvIHdlIGhhdmUgdG8gZGVmaW5lIGEgc2luZ2xlIG91dHB1dCBmb3JtYXQ/IENvdWxkIGl0
IGJlIG1hZGUgdG8gYmUgZmxleGlibGUgd2l0aCB0aGUgZm9ybWF0IG9mIHRoZSBjb2xsZWN0ZWQg
Y3Jhc2ggZGF0YT8NCg0KPiAzLiBDb25maWd1cmF0aW9uIHBhcmFtZXRlcnMgb2YgdGhlIHNlcnZp
Y2Ugc2hhbGwgYmUgc3RhbmRhcmQgd2l0aCBzY29wZQ0KPiAgICAgZm9yIHByb2Nlc3NvciBzcGVj
aWZpYyBleHRlbnNpb25zLg0KPg0KPiAjIyMjIFByb3Bvc2VkIERlc2lnbg0KPg0KPiBXaGVuIG9u
ZSBvciBtb3JlIHByb2Nlc3NvcnMgcmVnaXN0ZXIgYSBmYXRhbCBlcnJvciBjb25kaXRpb24gLCB0
aGVuIGFuDQo+IGludGVycnVwdCBpcyBnZW5lcmF0ZWQgdG8gdGhlIGhvc3QgcHJvY2Vzc29yLg0K
Pg0KPiBUaGUgaG9zdCBwcm9jZXNzb3IgaW4gdGhlIGZhaWxlZCBzdGF0ZSBhc3NlcnRzIHRoZSBz
aWduYWwgdG8gaW5kaWNhdGUNCj4gdG8gdGhlIEJNQyB0aGF0IGEgZmF0YWwgaGFuZyBoYXMgb2Nj
dXJyZWQuIFtBUE1MX0FMRVJUIyBpbiBjYXNlIG9mIEFNRA0KPiBwcm9jZXNzb3IgZmFtaWx5XQ0K
Pg0KPiBCTUMgUkFTIGFwcGxpY2F0aW9uIGxpc3RlbnMgb24gdGhlIGV2ZW50IFtBUE1MX0FMRVJU
IyBpbiBjYXNlIG9mIEFNRA0KPiBwcm9jZXNzb3IgZmFtaWx5IF0uDQoNClRoZSBob3N0LWVycm9y
LW1vbml0b3IgYXBwbGljYXRpb24gcHJvdmlkZXMgc3VwcG9ydCBmb3IgbGlzdGVuaW5nIGZvciBl
dmVudHMgYW5kIHRha2luZyBhY3Rpb24gc3VjaCBhcyBsb2dnaW5nIG9yIHRyaWdnZXJpbmcgYSBj
cmFzaGR1bXAgdGhhdCBtYXkgbWVldCB0aGlzIHJlcXVpcmVtZW50Lg0KDQoNCk9uZSB0aG91Z2h0
IG1heSBiZSB0byBicmVhayB0aGlzIHVwIGludG8gdmFyaW91cyBsYXllcnMgdG8gYWxsb3cgZm9y
IGZsZXhpYmlsaXR5IGFuZCBzdGFuZGFyZGl6YXRpb24uIEZvciBleGFtcGxlOg0KMS4gUmVkZmlz
aCAtPiBwcm92aWRlZCBieSBibWN3ZWIgd2hpY2ggcHVsbHMgZnJvbSAyLiBELUJ1cyAtPiBwcm92
aWRlZCBieSBhIG5ldyBzZXJ2aWNlIHdoaWNoIGxvb2tzIGZvciBkYXRhIHN0b3JlZCBieSAzLiBw
cm9jZXNzb3Itc3BlY2lmaWMgY29sbGVjdG9yIC0+IHByb3ZpZGVkIGJ5IHNlcGFyYXRlIHNlcnZp
Y2VzIGFzIG5lZWRlZCBhbmQgdHJpZ2dlcmVkIGJ5IDQuIHBsYXRmb3JtLXNwZWNpZmljIG1vbml0
b3Jpbmcgc2VydmljZSAtPiBwcm92aWRlZCBieSBob3N0LWVycm9yLW1vbml0b3Igb3Igb3RoZXIg
c2VydmljZSBhcyBuZWVkZWQuDQoNCklkZWFsbHksIHdlIGNvdWxkIG1ha2UgMiBhIGdlbmVyaWMg
c2VydmljZS4NCg0KPg0KPiBVcG9uIGRldGVjdGlvbiBvZiBGQVRBTCBlcnJvciBldmVudCAsIEJN
QyB3aWxsIGNoZWNrIHRoZSBzdGF0dXMNCj4gcmVnaXN0ZXIgb2YgdGhlIGhvc3QgcHJvY2Vzc29y
IFtpbXBsZW1lbnRhdGlvbiBkZWZpbmVkIG1ldGhvZF0gdG8gc2VlDQo+DQo+IGlmIHRoZSBhc3Nl
cnRpb24gaXMgZHVlIHRvIHRoZSBmYXRhbCBlcnJvci4NCj4NCj4gVXBvbiBmYXRhbCBlcnJvciAs
IEJNQyB3aWxsIGF0dGVtcHQgdG8gaGFydmVzdCBjcmFzaCBkYXRhIGZyb20gYWxsDQo+IHByb2Nl
c3NvcnMuIFt2aWEgdGhlIEFQTUwgaW50ZXJmYWNlIChtYWlsYm94KSBpbiBjYXNlIG9mIEFNRCBw
cm9jZXNzb3INCj4gZmFtaWx5XS4NCj4NCj4gQk1DIHdpbGwgZ2VuZXJhdGUgYSBzaW5nbGUgcmF3
IGNyYXNoZHVtcCByZWNvcmQgYW5kIHNhdmVzIGl0IGluDQo+IG5vbi12b2xhdGlsZSBsb2NhdGlv
biAvdmFyL2xpYi9ibWMtcmFzLg0KPg0KDQo=
