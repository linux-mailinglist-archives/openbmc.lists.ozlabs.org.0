Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA8828ECCE
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 07:41:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBdSj0Xk6zDqTD
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 16:41:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=203.18.50.4; helo=nat-hk.nvidia.com;
 envelope-from=nkrishnan@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=Dpu12Yu8; dkim-atps=neutral
X-Greylist: delayed 311 seconds by postgrey-1.36 at bilbo;
 Thu, 15 Oct 2020 16:40:55 AEDT
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBdRq210yzDqS1
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 16:40:54 +1100 (AEDT)
Received: from HKMAIL102.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f87dfa00000>; Thu, 15 Oct 2020 13:35:31 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct
 2020 05:35:27 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.56) by
 HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS)
 id
 15.0.1473.3 via Frontend Transport; Thu, 15 Oct 2020 05:35:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9h8dXCmf/aETAXFBBVomtTRxy3gHMQzPysRPqZuD4q+5ZvddOuigM1uMeOqC6B39jfBoV8RX9o4WsdOc68Vd7hSXep/Nt5XPwRMg6xUdLOkCC83G3m31kyInJVL6AFD3IjB4xnhSaAZJXN7AJJGVhNWzvpJW0Rf3x6iw67I5Z5zUn9o6eMLfIptiVDzqj6GEZxp+04cGXxSWLQT/5grKm44cpxx/Q/AI4GIx18/TwmLLT8EjlsWAWwERNz14mPenwg2moQVpmpDBYDJMS3dQhn5Gk7ZIG4LprbwYjdTV4Y6efIMtqmGN191CaIExc7q2mZc7muCV2bgqJcsVdyILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30DCUKjPkPJYZKY9Yh7mhCp9sSvGhGAd+KTXV+FfTh4=;
 b=lbpqy6iv22InLlSKeT8rHuVM0HMCmLKWV79LoDzxG1J6ZY25POAFe4f8O9diAB2q7YYBjyAWO7Ft2xH0P9guQ4bvVrsrPL8VMbfneikYmFXqT9xb0PAZ96+74g/zSgdgEGjPRK6st5LrB1fJxI0MNIQxH5W1oj6m4NLvOA1cLQZ1dNNrpJg4YSAoL88okFcYAOKGgiqhbN8sRvpXWVuxDZQhVbwnBRFQ80CMOztpbyrhxM+s1OJDgVIOBo0OUV9EDAkPMxqffzodGu01ighzrxT7jeMiYzBEnFsz2i9OV4tAfFYBZwlKsigdjFg+TNEmcYbVyZB/84FasBO3wjfB/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2677.namprd12.prod.outlook.com (2603:10b6:a03:69::26)
 by BYAPR12MB3335.namprd12.prod.outlook.com (2603:10b6:a03:dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 05:35:25 +0000
Received: from BYAPR12MB2677.namprd12.prod.outlook.com
 ([fe80::d08c:1633:98eb:dd5]) by BYAPR12MB2677.namprd12.prod.outlook.com
 ([fe80::d08c:1633:98eb:dd5%4]) with mapi id 15.20.3455.030; Thu, 15 Oct 2020
 05:35:25 +0000
From: Nirenjan Krishnan <nkrishnan@nvidia.com>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: Kernel panic when net booting OpenBMC
Thread-Topic: Kernel panic when net booting OpenBMC
Thread-Index: AQHWooOo5rJ4kM64L0iEPbZ3CvbR06mX56KA///H8wA=
Date: Thu, 15 Oct 2020 05:35:25 +0000
Message-ID: <3A6CDD61-FC1C-4698-BD88-856C4B677DF8@nvidia.com>
References: <65961456-D5F6-41CC-AD10-93E716386953@nvidia.com>
 <CAGm54UFhaViOLjWuGQXW3catJ62Y1gx5pA89VDZ06TtshXFbvA@mail.gmail.com>
In-Reply-To: <CAGm54UFhaViOLjWuGQXW3catJ62Y1gx5pA89VDZ06TtshXFbvA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.41.20091302
authentication-results: bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdaaf6a8-7226-46f4-ba64-08d870cc1e0e
x-ms-traffictypediagnostic: BYAPR12MB3335:
x-microsoft-antispam-prvs: <BYAPR12MB3335D3B2C4D7B4A3C5CF40B8CC020@BYAPR12MB3335.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GsV6GQneSVL5lXLxMZhpl/xLKS5GWVMgLi1nNYOnj/FlSjXWrrMVG9thBUu2rDI7DAPm1PqPYmCiFd2qJCnSdb8dTz+rLj3sU6OFaw9M2k4s4BBDZcK70hzvllAdxYjPrfJM3aNWNehZDfgyG1wTvM9eUeVVErl5zWY7UK2/EYhD+6OeTXf6FjjRgF0MujVpU6zyw1W2EtHJpDQ23JKzXXuAZ35z9+7SuX/+8wHvbaQmrrPYd8EXrkmme48bIYviyZOoUsLCa2x8iBvfkpRItoKELcPWLnhB8rzc39gFuc2mdMtNnpfw/7MzsFdlLg4x7LRtqKTQYOHR1LPIw3lR/tj27XoNf9cEwNRK0nzvYpSfrI77pSCJIGNCRphr63r4Q9DUqbkKEq2B+mAn3/tAlg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2677.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(966005)(76116006)(2616005)(6486002)(5660300002)(66476007)(64756008)(66446008)(66556008)(478600001)(4326008)(2906002)(66946007)(26005)(6506007)(4744005)(186003)(6916009)(53546011)(8936002)(8676002)(86362001)(6512007)(33656002)(83080400001)(36756003)(71200400001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ynn+O1B4xh5c3Fa87NAbnZPk7eLUymIHTQYWDj+FmVA8VNPq/0lSoqBkyqXTGNxBSqt3M7nwcx0ER/m3ixRTh7Z2SE6+F3mKhMeY8wGilgzxBpJ9Ka3YHnlK3ATdhDpIdi4Vu8RIuwA3Di88Z81C/HN2PZEWmUVK3vzD4k20tm+z8tYw8XncaL9Ys9f5ja73iV3maamVZR9POj5gV3PPrN0D7G4rJrCZUoEzAF/fq3bOvwcKjZSarshIWdWLEgnKadVlvYwdkRUiQFZxscCtTe7W724sHCf0YxW7D7d1LJhHg4LvouA5V9L2dOtB5FqqxVj2R+cFLubk54gH7/DLVq7x3/nW1s/LMudeKDvc7WIzwSaeoQddWsHQAf3hyDfhMj1YW33n27be5h5Qq0zuwO/UDkdIEcr6uw8LZ/mVY6ICcPAx+jQbqxUOoHXV9+zspKHNQmFjfDdPXjnm3SARa97xiPJMg4gb6zyh0HiHiLytxNbvxNKWG+AUVO3KTrFO4eQQSrM/j/JyE4UR7ZYNaiqla9Rtvleden9GOuN2qDu3f2jNZuBlElFyAJpf86jJlnRMiuNyohfv5JVOTUMDiIvoqBI3BZBaqk3sqwKtUAbaypkVkVwJFuIDxh1ISlkRAyVnRxME4lUlAz5ZVOAvhg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D44C7BEDE5E864C812698B6035F803E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2677.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdaaf6a8-7226-46f4-ba64-08d870cc1e0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 05:35:25.1556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSVgwN6HaqHbKnFZYcMoNUJqyTi0+3SnPZs/6WkK5o/c+APwOePb39nNSNkeTPuZkJkQ9usNJYuoAKETAKL9PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3335
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602740131; bh=30DCUKjPkPJYZKY9Yh7mhCp9sSvGhGAd+KTXV+FfTh4=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
 CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:user-agent:authentication-results:
 x-originating-ip:x-ms-publictraffictype:
 x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
 x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
 x-ms-exchange-senderadcheck:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
 Content-Type:Content-ID:Content-Transfer-Encoding:MIME-Version:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=Dpu12Yu8YnfSY4qtbI1cFc2ERz0u05sgm0bK35PjLIzKCM+EHH+mnIFH4rQl8dbV8
 YnGDyDQqVrzfHwChlnX9Sl99ipNiaLSKwbQP8FAd1oL29h0tesTlB5Upj1/f1HH/m2
 LQSIffDvNjr3jOWYevBmDvaIY65RuSkVCNKCzeCC5mGMvUMEbUclQhJpMcMhwOrXqM
 K/SAhysj7sJiMOtz0PFijR95IS9xixUnB/a9uIyxDWTvKo/DJlaTaI6MOMkKDfxqnN
 R3MaC2aSNzwJBLKIwNhYx7ZNq1zTd8UdSrUrBFprif5YUMdaKa830M0F1tyw4yE8QF
 lkj4rE+FX7mug==
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

SSB0cmllZCB0aGF0IHRvbywgc2FtZSBlcnJvci4gSSBhbHNvIHRyaWVkIGFkZGluZyBgZGVidWct
aW5pdC1zaCBlbmFibGUtaW5pdHJkLWRlYnVnLXNoYCB0byBib290YXJncyB0byB0cnkgYW5kIGRl
YnVnIHRoaXMgZnVydGhlciwgYnV0IGl0IHBhbmljcyBiZWZvcmUgaXQgZ2V0cyB0byB0aGUgZGVi
dWcgc2hlbGwuDQoNCu+7v09uIDEwLzE0LzIwLCA2OjU2IFBNLCAiTGVpIFl1IiA8eXVsZWkuc2hA
Ynl0ZWRhbmNlLmNvbT4gd3JvdGU6DQoNCiAgICBFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24g
b3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cw0KDQoNCiAgICBPbiBUaHUsIE9jdCAxNSwgMjAy
MCBhdCA3OjQzIEFNIE5pcmVuamFuIEtyaXNobmFuIDxua3Jpc2huYW5AbnZpZGlhLmNvbT4gd3Jv
dGU6DQogICAgPiBDb3VsZCB5b3UgcGxlYXNlIHN1Z2dlc3QgaG93IEkgY291bGQgZ28gYWJvdXQg
ZGVidWdnaW5nIHRoaXM/IEkndmUgZm9sbG93ZWQgYWxsIHRoZSBuZXRib290IHN1Z2dlc3Rpb25z
IGZyb20gdGhlc2UgdGhyZWFkcyBvbiB0aGlzIG1haWxpbmcgbGlzdDpcDQogICAgPiAtIGh0dHBz
Oi8vbGlzdHMub3psYWJzLm9yZy9waXBlcm1haWwvb3BlbmJtYy8yMDE4LUp1bmUvMDEyMDU0Lmh0
bWwNCiAgICA+IC0gaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL3BpcGVybWFpbC9vcGVuYm1jLzIw
MTUtT2N0b2Jlci8wMDAwMTAuaHRtbA0KICAgID4NCg0KICAgIFByb2JhYmx5IHlvdSBjb3VsZCBm
b2xsb3cgdGhpcyBvbmUNCiAgICBodHRwczovL2xpc3RzLm96bGFicy5vcmcvcGlwZXJtYWlsL29w
ZW5ibWMvMjAxNy1EZWNlbWJlci8wMTAyNjQuaHRtbCwNCiAgICB3aGljaCBzdWNjZXNzZnVsbHkg
Ym9vdHMgdGhlIEJNQyBmcm9tIFRGVFAgKyBORlMgcm9vdGZzLg0KDQogICAgLS0NCiAgICBCUnMs
DQogICAgTGVpIFlVDQoNCg==
