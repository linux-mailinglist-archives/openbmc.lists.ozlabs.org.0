Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04786263204
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 18:33:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmndr1QghzDqZj
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 02:33:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqnvemgate24.nvidia.com; envelope-from=jan@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=sH2MJ128; dkim-atps=neutral
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmnZV1klMzDqXV
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 02:30:56 +1000 (AEST)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f5902b40000>; Wed, 09 Sep 2020 09:28:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 09 Sep 2020 09:30:51 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 09 Sep 2020 09:30:51 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Sep
 2020 16:30:50 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.52) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 9 Sep 2020 16:30:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgkmHp9NAQOWHS9bSybYP5exS5Bpuai2zbYZWEYQJ+Cf1U6FiBZO2GD78ZGG1OC3h7XlAyXVXYrMeFmDOFHVWS49V6Dc0AkZS8L6k0O2T6/G1gDEZKHv6dwpcEBQvnchAGLgPWW4jDTPxJtr9nIPR2HliRmSrSBb4U2Ndmv3r0tST2yFWPI4z+9cUv9krHUwvYiSRwIXs/KErDt/+voyDBhpO5M5v8oZFLKpFzDobTpJucWhFt2Lj6FL7D6U1JIZMDol7VlSn6NiaqboQC3cUNnq6OoUo1naOws4H+QawCyKZgnwIc6SDNMUoTn8W7rlidmDwlBmqPUwokJfwXItaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3gVwLte9g7UmxKCNZ/FVn37zAEb780IWjW5fR8SSAw=;
 b=idJj4ch+50pvfamAzPnZWWDfRtazGsqgTnQC+ceymvjVbNXIV7Ap7s3CIkZL5a/oKOV/Yca6UA0VSzOEfDlI7ClXLJw0EKxYn43a47RXCjkea2lu21U1Ft2kt2DHmg0F8eIh5N97lYgHt4JOvJCEPBH7HorHRaemHCuO0xeC3ONzw0mJvFiqGv0+KB7j8rQcEQ0cVDXPSsglHF55ZcMH8fqVuPzgj+0Cd01KRBaFX4+DWV8NRRMILmC8cr1ypcSHU6Ul66K5Td3DO/anxUtitlKHHwV6l5YDrtXB6oRx/Grv3NvgwVjLiPpsjDS1Ueqv2z8ic5Q4fCG/j273UigJpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3020.namprd12.prod.outlook.com (2603:10b6:5:11f::15)
 by DM5PR1201MB0204.namprd12.prod.outlook.com (2603:10b6:4:51::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 16:30:46 +0000
Received: from DM6PR12MB3020.namprd12.prod.outlook.com
 ([fe80::b5a1:ab5d:a3aa:273f]) by DM6PR12MB3020.namprd12.prod.outlook.com
 ([fe80::b5a1:ab5d:a3aa:273f%3]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 16:30:46 +0000
From: Jiandi An <jan@nvidia.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, Kun Zhao
 <zkxz@hotmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Enable UBI support for a platform
Thread-Topic: Enable UBI support for a platform
Thread-Index: AQHWgxUUsfcLfr+u/UKWYAqBzK09TalZ/84AgAOO8YCAAVP3AIAAmr+QgACJ5oCAAHz7cA==
Date: Wed, 9 Sep 2020 16:30:46 +0000
Message-ID: <DM6PR12MB3020425CE8126F5A3FECCFE8CD260@DM6PR12MB3020.namprd12.prod.outlook.com>
References: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
 <242dee50-7e1b-3fc3-5105-ca33f288d959@linux.vnet.ibm.com>
 <BYAPR14MB2342A17C9B9BE853C0616E9CDC280@BYAPR14MB2342.namprd14.prod.outlook.com>
 <4e89c963-1ddd-2627-47c8-be13b903bc64@linux.vnet.ibm.com>
 <DM6PR12MB3020FE5674F3DBE642D392C8CD260@DM6PR12MB3020.namprd12.prod.outlook.com>
 <fffe9522-2c57-8ef0-4132-5d7c9cc831d4@linux.vnet.ibm.com>
In-Reply-To: <fffe9522-2c57-8ef0-4132-5d7c9cc831d4@linux.vnet.ibm.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=jan@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-09-09T16:30:44.3025087Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=5d205fa8-f100-4306-80ab-ddec9e254a8d;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: linux.vnet.ibm.com; dkim=none (message not signed)
 header.d=none;linux.vnet.ibm.com; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7928a47f-f753-497b-5274-08d854ddb476
x-ms-traffictypediagnostic: DM5PR1201MB0204:
x-microsoft-antispam-prvs: <DM5PR1201MB02047D76FBDF97223CC9F00CCD260@DM5PR1201MB0204.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q/sJB0KA1lruYpRQNpT/jMdl6Klh8E9l3nUzk/pcNvq5A+FNa1e32B7DeK/8cuAwZNiGMqZruVaobuV58x47Qcy40bA5UTnlr18dpAUbzGjAKtg9kjHa36CFQZXtjWMcDizcFRhqTfuWVtEGqNNhqBqzAr3liHg1YX1orn0Qohz6tpaOfiU3OnPm8gexuueyQEFsEtS/JvcFl/fdY1zZ2eq/0jhtYi9Wk9D7oXmwF2fhI2Yok+uM5FpotMP0cwryDRsLrCvHpquWZpcnFP8GkllPKzrkogU7SoiumRwf+t3f/N86eF8ZSexXaUoPXKS7WeAJN2r/LB1wtef0DCQM4FqsdHHfS5a/JQ31Li88ywwiGUX/GF4HzP/jIQUyQqT0sgATto7sa14e0I1v2SyVoQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3020.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(478600001)(7696005)(52536014)(45080400002)(53546011)(6506007)(316002)(186003)(19627235002)(26005)(8676002)(2906002)(86362001)(55016002)(5660300002)(83380400001)(8936002)(83080400001)(66446008)(64756008)(66556008)(66476007)(66946007)(9686003)(71200400001)(76116006)(33656002)(110136005)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: lhIRnoWkjHv8InefA3FJjJnoVTbXTanaMFnUhUtAPdHzxxWC8CkvMflPX/tbOcXGO4DP/ucOyca3rjwk+EQyMvaDgDlxYmKhhhUAs2mlsGlFvmPSR4xUYzDoR27gjNBeeIqg7EcQlZdWNReX10t8vsLfD4p7ZMmqSyE2Ji7JxUn64JZhNB9diEMSyBvj+OytnAb6AbJvUmBwCTAgOojX7YLOsvPuHR6TMYFNtH7jB1UK2Fq2uv4per5ZT+aaJLT6l+R7d+58mHsveGoMIjUB8yHZr4rTi2o+jpqON19jIlDJBIbJZakBGzITQeJ4RY5UhrkubMvLLFN5u8FylZTqWVXWSx5rpgjv8WrJ937KFKpMgqIxQrXBAM1c4u++9Wl5bcSEnhLO3wkkkMM8JW8qePbKf8zN1FMa6gc5Px62WtztH4NNdXIoKg1TI4+Ry0oOf2YW6fJvm3JMn8AWdP18kSfU7kzW6admiffWyq7czcWXq8Um32WCWvcuYXaHToAH7+jCIaawKfi9Xn+aUdAt5xLaq2Y51v1Ofr5buj62pAb3lzNI0TVA9tP4i3H0kCLx1he48g3aAINxc9+NRmom0l0eN8QVfdYAyW+FZkwUtIXEY+ZxYRhPdw3ZYO67M77qWyb+Ft9ZmtjAHdyF40UTGA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3020.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7928a47f-f753-497b-5274-08d854ddb476
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 16:30:46.3404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ekvka9JEFYgcqfIlpwJHEeEVVV0/ARXaSQblyh1LbxwjSxp51gCJidAxVUKFQ3r2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0204
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1599668916; bh=h3gVwLte9g7UmxKCNZ/FVn37zAEb780IWjW5fR8SSAw=;
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
 b=sH2MJ128h2Ii4OLHGL4n3uPG3t5hMzoDehD6BBc623Jr85zEW8ee3akYguhi6C9wq
 5lmxvSI7vnQs58GlQlP2NT4zhwvTAXz2dx+2wI6sGmmcbPrS9kdLy27ooKakffE7+M
 l8FJNjTwu+mXzLksZnBrh20cYPxdieBA7jpulbOLz8ysJjV9hRJ7ikE0v5bT/icrGS
 okuA6+IH5B0eQaWrmsNNfH+OEavo+VDrQM9mWFptoBzx1uRSUHDuB9eDHhjgr6Wp6l
 oEn4c60au7tTB1felPVZx4Jm8bMfeYHWawkhekPHAW+A+VrcmNGB6FKyjI2pqQ9tZ1
 5r702jwwyJbGA==
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

PiBPbiAwOS8wOS8yMCA2OjE1IGFtLCBKaWFuZGkgQW4gd3JvdGU6DQo+ID4NCj4gPj4gT24gMDgv
MDkvMjAgMTI6MzkgYW0sIEt1biBaaGFvIHdyb3RlOg0KPiA+Pj4NCj4gPj4+IE9uIDkvNS8yMCA1
OjQ5IEFNLCBEZWVwYWsgS29kaWhhbGxpIHdyb3RlOg0KPiA+Pj4+IEhpIEt1biwNCj4gPj4+Pg0K
PiA+Pj4+IE9uIDA1LzA5LzIwIDU6MzIgYW0sIEt1biBaaGFvIHdyb3RlOg0KPiA+Pj4+PiBIaSBU
ZWFtLA0KPiA+Pj4+Pg0KPiA+Pj4+PiBNeSBwbGF0Zm9ybSBpcyBiYXNlZCBvbiBhc3QyNTAwLCBh
bmQgSeKAmXZlIGFscmVhZHkgYmVlbiBhYmxlIHRvDQo+ID4+Pj4+IGJ1aWx0IG91dCB0aGUgdWJp
IGltYWdlLiBCdXQgd2hlbiBJIHRyaWVkIHRvIHRlc3QgaXQgd2l0aCBxZW11LCBpdA0KPiA+Pj4+
PiBqdXN0IHN0b3BwZWQgYXQgdS1ib290IGJlY2F1c2Ug4oCYY2Fu4oCZdCBnZXQga2VybmVsIGlt
YWdlLA0KPiA+Pj4+Pg0KPiA+Pj4+PiBxZW11LXN5c3RlbS1hcm06IEFzcGVlZCBpQlQgaGFzIG5v
IGNoYXJkZXYgYmFja2VuZA0KPiA+Pj4+Pg0KPiA+Pj4+PiBVLUJvb3QgMjAxNi4wNyAoU2VwIDA0
IDIwMjAgLSAxOTo0Nzo0OCArMDAwMCkNCj4gPj4+Pj4NCj4gPj4+Pj4gICAgICAgICAgIFdhdGNo
ZG9nIGVuYWJsZWQNCj4gPj4+Pj4NCj4gPj4+Pj4gRFJBTTogIDQ5NiBNaUINCj4gPj4+Pj4NCj4g
Pj4+Pj4gRmxhc2g6IDMyIE1pQg0KPiA+Pj4+Pg0KPiA+Pj4+PiAqKiogV2FybmluZyAtIGJhZCBD
UkMsIHVzaW5nIGRlZmF1bHQgZW52aXJvbm1lbnQNCj4gPj4+Pj4NCj4gPj4+Pj4gSW46ICAgIHNl
cmlhbA0KPiA+Pj4+Pg0KPiA+Pj4+PiBPdXQ6ICAgc2VyaWFsDQo+ID4+Pj4+DQo+ID4+Pj4+IEVy
cjogICBzZXJpYWwNCj4gPj4+Pj4NCj4gPj4+Pj4gTmV0OiAgIE1BQzAgOiBSR01JSQ0KPiA+Pj4+
Pg0KPiA+Pj4+PiBNQUMxIDogUkdNSUkNCj4gPj4+Pj4NCj4gPj4+Pj4gRlRHTUFDMTAwIzANCj4g
Pj4+Pj4NCj4gPj4+Pj4gRXJyb3I6IEZUR01BQzEwMCMwIGFkZHJlc3Mgbm90IHNldC4NCj4gPj4+
Pj4NCj4gPj4+Pj4gLCBGVEdNQUMxMDAjMQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBFcnJvcjogRlRHTUFD
MTAwIzEgYWRkcmVzcyBub3Qgc2V0Lg0KPiA+Pj4+Pg0KPiA+Pj4+PiBIaXQgYW55IGtleSB0byBz
dG9wIGF1dG9ib290OiAgMA0KPiA+Pj4+Pg0KPiA+Pj4+PiBXcm9uZyBJbWFnZSBGb3JtYXQgZm9y
IGJvb3RtIGNvbW1hbmQNCj4gPj4+Pj4NCj4gPj4+Pj4gRVJST1I6IGNhbid0IGdldCBrZXJuZWwg
aW1hZ2UhDQo+ID4+Pj4+DQo+ID4+Pj4+IGFzdCMNCj4gPj4+Pj4NCj4gPj4+Pj4gQW5kIEkgZm91
bmQgdGhlIGJvb3RhcmdzIGlzIG5vdCByaWdodCwNCj4gPj4+Pj4NCj4gPj4+Pj4gYXN0IyBwcmlu
dA0KPiA+Pj4+Pg0KPiA+Pj4+PiBiYXVkcmF0ZT0xMTUyMDANCj4gPj4+Pj4NCj4gPj4+Pj4gYm9v
dGFyZ3M9Y29uc29sZT10dHlTNCwxMTUyMDBuOCByb290PS9kZXYvcmFtIHJ3DQo+ID4+Pj4+DQo+
ID4+Pj4+IGJvb3RjbWQ9Ym9vdG0gMjAwODAwMDANCj4gPj4+Pj4NCj4gPj4+Pj4gYm9vdGRlbGF5
PTINCj4gPj4+Pj4NCj4gPj4+Pj4gQ2hlY2tlZCBpbiB0aGUgYnVpbGQgZm9sZGVyIGZvcg0KPiA+
Pj4+PiB0bXAvd29yay9teXBsYXRmb3JtLW9wZW5ibWMtbGludXgtZ251ZWFiaS91LWJvb3QtYXNw
ZWVkLzFfdjIwMTYuMDcNCj4gPj4+Pj4gK2cNCj4gPj4+Pj4gaXRBVVRPSU5DKzFkZWQ5ZmEzYTIt
cjAvIGFuZCBmb3VuZCB0aGUgbm9uZSBvZiB0aGUgZm9sbG93aW5nDQo+ID4+Pj4+IGl0QVVUT0lO
QytwYXRjaGVzDQo+ID4+Pj4+IGFyZSB0aGVyZSwNCj4gPj4+Pj4NCj4gPj4+Pj4gMDAwMi1jb25m
aWctYXN0LWNvbW1vbi1oYWNrLWJvb3RvcHRzLnBhdGNoDQo+ID4+Pj4+DQo+ID4+Pj4+IDAwMDMt
Y29uZmlnLWFzdC1jb21tb24tQWRkLWJvb3RvcHRzLXRvLXN1cHBvcnQtdWJpLWFuZC1tdC5wYXRj
aA0KPiA+Pj4+Pg0KPiA+Pj4+PiAwMDA0LWNvbmZpZy1hc3QtY29tbW9uLUFkZC1jb25kaXRpb25h
bC1mYWN0b3J5LXJlc2V0LWNvbW0ucGF0Y2gNCj4gPj4+Pj4NCj4gPj4+Pj4gMDAwNS1jb25maWct
YXN0LWNvbW1vbi1GYWxsLWJhY2stdG8tc2Vjb25kYXJ5LWZsYXNoLW9uLWZhLnBhdGNoDQo+ID4+
Pj4+DQo+ID4+Pj4+IEkgdGhpbmsgdGhhdOKAmXMgd2h5IHRoZSBib290YXJncyBpcyBub3QgY29y
cmVjdC4NCj4gPj4+Pj4NCj4gPj4+Pj4gVGhpcyBpcyB0aGUgZGV0YWlscyBvZiBob3cgSSBlbmFi
bGVkIHRoZSB1Ymkgc3VwcG9ydCBpbiBteQ0KPiA+Pj4+PiBwbGF0Zm9ybSByZWNpcGVzLA0KPiA+
Pj4+Pg0KPiA+Pj4+PiAxLiBJbiBtZXRhLW15cGxhdGZvcm0vY29uZi9kaXN0cm8vb3BlbmJtYy1t
eXBsYXRmb3JtLmNvbmYsIEkNCj4gPj4+Pj4gYWRkZWQsDQo+ID4+Pj4+DQo+ID4+Pj4+IHJlcXVp
cmUgY29uZi9kaXN0cm8vaW5jbHVkZS9waG9zcGhvci1iYXNlLmluYw0KPiA+Pj4+Pg0KPiA+Pj4+
PiByZXF1aXJlIGNvbmYvZGlzdHJvL2luY2x1ZGUvcGhvc3Bob3ItdWJpLmluYw0KPiA+Pj4+DQo+
ID4+Pj4gWW91IHNob3VsZCBqdXN0IG5lZWQgdGhlIG9uZSBsaW5lIGFib3ZlLCBwbHVzIGEgZGV2
aWNlIHRyZWUgY2hhbmdlDQo+ID4+Pj4gZm9yIHlvdXINCj4gPj4gc3lzdGVtLiBUaGUgZGVmYXVs
dCBvcGVuYm1jLWZsYXNoLWxheW91dC5kdHNpIGRvZXNuJ3QgbWFrZSBhIHViaWZzIHBhcnRpdGlv
bi4NCj4gPj4gWW91IGNhbiBmb3IgZWcgbG9vayBhdCB3aXRoZXJzcG9vbidzIGR0cywgd2hpY2gg
dXNlcyB1Ymlmcy4NCj4gPj4+IEhpIERlZXBhaywgdGhhbmsgeW91IGZvciByZXBseS4gSSd2ZSB0
cmllZCB0byB1c2UgdGhlIHdpdGhlcnNwb29uJ3MNCj4gPj4+IGZsYXNoIGxheW91dA0KPiA+PiBw
ZXIgeW91ciB0aXBzIGhlcmUuIEJ1dCBpdCBzdGlsbCBzdG9wcyBhdCB1LWJvb3Qgd2l0aCAiY2Fu
J3QgZ2V0IGtlcm5lbCBpbWFnZSEiDQo+IGVycm9yLg0KPiA+PiBEbyBJIG5lZWQgdG8gZW5hYmxl
IGFueSBrZXJuZWwgY29uZmlnIG9wdGlvbnM/DQo+ID4+DQo+ID4+DQo+ID4+IEhpIEt1biwgSSBk
b24ndCB0aGluayB5b3UgbmVlZCBhZGRpdGlvbmFsIGtlcm5lbCBjb25maWcgdXBkYXRlcy4gSQ0K
PiA+PiBzdXNwZWN0IHNvbWV0aGluZyB3cm9uZyB3aXRoIHRoZSB3YXkgdGhlIGltYWdlIGlzIGJ1
aWx0LiBBcmUgeW91IGFibGUNCj4gPj4gdG8gc2VlIGV4cGVjdGVkIHZhbHVlcyBmb3IgdGhlIHUt
Ym9vdCBlbnZpcm9ubWVudCB2YXJpYWJsZXMgYW5kIE1URA0KPiBwYXJ0aXRpb25zPyBGb3IgZWc6
DQo+ID4+DQo+ID4+IGFzdCMgbXRkcGFydHMNCj4gPj4gZGV2aWNlIG5vcjAgPGJtYz4sICMgcGFy
dHMgPSAzDQo+ID4+ICAgICM6IG5hbWUgICAgICAgICAgICAgICBzaXplICAgICAgICAgICAgb2Zm
c2V0ICAgICAgICAgIG1hc2tfZmxhZ3MNCj4gPj4gICAgMDogdS1ib290ICAgICAgICAgICAgICAw
eDAwMDYwMDAwICAgICAweDAwMDAwMDAwICAgICAgMA0KPiA+PiAgICAxOiB1LWJvb3QtZW52ICAg
ICAgICAgIDB4MDAwMjAwMDAgICAgIDB4MDAwNjAwMDAgICAgICAwDQo+ID4+ICAgIDI6IG9ibWMt
dWJpICAgICAgICAgICAgMHgwMWY4MDAwMCAgICAgMHgwMDA4MDAwMCAgICAgIDANCj4gPj4gYWN0
aXZlIHBhcnRpdGlvbjogbm9yMCwwIC0gKHUtYm9vdCkgMHgwMDA2MDAwMCBAIDB4MDAwMDAwMDAN
Cj4gPj4NCj4gPg0KPiA+IEhpIERlZXBhaywNCj4gPiBPbmUgdGhpbmcgaXMgbm8gbXRkcGFydHMg
Y29tbWFuZCBmcm9tIHUtYm9vdC4gIERvIHdlIG5lZWQgdG8gYWRkDQo+IENPTkZJR19DTURfTVRE
UEFSVFM/DQo+ID4gSGVyZSB0aGUgY29tbWVudCBzYXlzIGFkZGluZyBDT05GSUdfQ01EX01URFBB
UlRTIHdvbid0IHdvcmsuDQo+ID4gaHR0cHM6Ly9saXN0cy5kZW54LmRlL3BpcGVybWFpbC91LWJv
b3QvMjAxMi1EZWNlbWJlci8xNDI4MzcuaHRtbA0KPiANCj4gSGkgSmlhbmRpLCB0aGUgY29tbWVu
dCB5b3UgcG9pbnRlZCB0byBpcyBpbiB0aGUgY29udGV4dCBpZiBhIHZlcnkgb2xkIHUtYm9vdCBy
ZWxlYXNlLA0KPiBzbyBJIGRvbid0IHRoaW5rIGl0IGFwcGxpZXMgdG8gdGhlIHUtYm9vdCByZWxl
YXNlIHRoYXQgT3BlbkJNQyB1c2VzLiBNVEQgYW5kIFVCSQ0KPiBzdXBwb3J0IGlzIG9wdGlvbmFs
IGluIHRoZSB1LWJvb3QgQVNUIGNvbmZpZywgYW5kIGlzIGVuYWJsZWQgaWYNCj4gTVREUEFSVFNf
REVGQVVMVCBpcyBzZXQuIFRoaXMgZmxhZyBmdXJ0aGVyIHNldHMgQ09ORklHX01URF9QQVJUSVRJ
T05TLg0KPiBNVERQQVJUU19ERUZBVUxUIGlzIGVuYWJsZWQgdmlhIGEgdS1ib290IHBhdGNoIHRo
YXQgd2UgY2FycnksIGFuZCB0aGF0IGlzDQo+IHBpY2tlZCB1cCBpZiB0aGUgJ29ibWMtdWJpLWZz
JyBkaXN0cm8gZmVhdHVyZSBpcyBlbmFibGVkIChzZWUgbWV0YS0NCj4gcGhvc3Bob3IvYXNwZWVk
LWxheWVyL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3QtYXNwZWVkLmluYykuIFNvIGl0IHN0aWxs
IHNlZW1zDQo+IGxpa2UgdGhpcyBmZWF0dXJlIGlzIG5vdCBlbmFibGVkIGluIHRoZSBpbWFnZSBv
ciB0aGVyZSBpcyBzb21lIG90aGVyIGlzc3VlIHdpdGgNCj4gYnVpbGRpbmcgdGhlIGltYWdlLg0K
PiANCj4gPiBBY3R1YWxseSB1c2luZyB3aXRoZXJzcG9vbidzIGZsYXNoIGxheW91dA0KPiA+IGh0
dHBzOi8vZ2l0aHViLmNvbS9pYm0tb3BlbmJtYy9vcGVuYm1jL2Jsb2IvT1A5NDAvbWV0YS1pYm0v
bWV0YS0NCj4gd2l0aGVyDQo+ID4gc3Bvb24vcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgtYXNw
ZWVkLzAwMDEtQVJNLWR0cy1Bc3BlZWQtV2l0aGVyc3Bvbw0KPiA+IG4tMTI4LVVwZGF0ZS1CTUMt
cGFydGl0aW9uaS5wYXRjaA0KPiA+DQo+ID4gU28gdGhlIG9uZSB3ZSBoYXZlIGluIHRoZSBkZXZp
Y2UgdHJlZSBpcyBhcyBmb2xsb3dzLi4NCj4gDQo+IFdpdGhlcnNwb29uLTEyOCdzICh3aGljaCBo
YXMgYSBkaWZmZXJlbnQgZGV2aWNlIHRyZWUgdGhhbiB3aXRoZXJzcG9vbikgQk1DIGhhcw0KPiBh
IDEyOE0gZmxhc2ggKHlvdSBjYW4gc2VlIHRoZSBzaXplcyBvZiB0aGUgcGFydGl0aW9ucyBiZWxv
dyBpbiB0aGUgZGV2aWNlIHRyZWUgYWRkDQo+IHVwIHRvIDEyOE0pLiBTbyB0aGlzIHdvdWxkIHdv
cmsgaWYgeW91ciBCTUMgaGFzIGEgMTI4TSBmbGFzaC4gVGhlIG9ibWMtdWJpDQo+IHBhcnRpdGlv
biB3b3VsZCBiZSBzbWFsbGVyIGZvciBlZyBmb3IgYSAzMk0gZmxhc2guDQoNClRoYW5rcyBEZWVw
YWsuICBTbyBJIHRyaWVkIHdpdGggYXNwZWVkLWJtYy1vcHAtd2l0aGVyc3Bvb24uZHRzIG5vdw0K
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9hcmNoL2FybS9i
b290L2R0cy9hc3BlZWQtYm1jLW9wcC13aXRoZXJzcG9vbi5kdHMjTDIzMQ0Kd2l0aCBvYm1jLXVi
aSBzdGFydGluZyBhdCAweDgwMDAwIHdpdGggc2l6ZSAweDFGODAwMDANCg0KJmZtYyB7DQoJc3Rh
dHVzID0gIm9rYXkiOw0KCWZsYXNoQDAgew0KCQlzdGF0dXMgPSAib2theSI7DQoJCW0yNXAsZmFz
dC1yZWFkOw0KCQlsYWJlbCA9ICJibWMiOw0KLy8jaW5jbHVkZSAib3BlbmJtYy1mbGFzaC1sYXlv
dXQuZHRzaSINCg0KCQlwYXJ0aXRpb25zIHsNCgkJCSNhZGRyZXNzLWNlbGxzID0gPCAxID47DQoJ
CQkjc2l6ZS1jZWxscyA9IDwgMSA+Ow0KCQkJY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25z
IjsNCgkJCXUtYm9vdEAwIHsNCgkJCQlyZWcgPSA8IDAgMHg2MDAwMCA+Ow0KCQkJCWxhYmVsID0g
InUtYm9vdCI7DQoJCQl9Ow0KCQkJdS1ib290LWVudkA2MDAwMCB7DQoJCQkJcmVnID0gPCAweDYw
MDAwIDB4MjAwMDAgPjsNCgkJCQlsYWJlbCA9ICJ1LWJvb3QtZW52IjsNCgkJCX07DQoJCQlvYm1j
LXViaUA4MDAwMCB7DQoJCQkJcmVnID0gPDB4ODAwMDAgMHgxRjgwMDAwPjsNCgkJCQlsYWJlbCA9
ICJvYm1jLXViaSI7DQoJCQl9Ow0KCQl9Ow0KCX07DQp9Ow0KDQpTdGlsbCBzZWVpbmcgZHVyaW5n
IGtlcm5lbCBib290IHRoYXQgL2Rldi9tdGRibG9jazogY2FuJ3Qgb3BlbiBibG9ja2Rldg0KDQpb
ICAgIDEuMzU2MDI1XSBDaGVja2VkIFcrWCBtYXBwaW5nczogcGFzc2VkLCBubyBXK1ggcGFnZXMg
Zm91bmQNClsgICAgMS4zNTYzNDZdIFJ1biAvaW5pdCBhcyBpbml0IHByb2Nlc3MNCnJvZnMgPSBz
cXVhc2hmcyByd2ZzID0gamZmczINClsgICAgMi4wMzM0MDhdIC9kZXYvbXRkYmxvY2s6IENhbid0
IG9wZW4gYmxvY2tkZXYNCm1vdW50OiBtb3VudGluZyAvZGV2L210ZGJsb2NrIG9uIHJ1bi9pbml0
cmFtZnMvcm8gZmFpbGVkOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQpbICAgIDIuMDQzMjQ3
XSBNVEQ6IENvdWxkbid0IGxvb2sgdXAgJy9kZXYvbXRkYmxvY2snOiAtMg0KbW91bnQ6IG1vdW50
aW5nIC9kZXYvbXRkYmxvY2sgb24gcnVuL2luaXRyYW1mcy9ydyBmYWlsZWQ6IE5vIHN1Y2ggZmls
ZSBvciBkaXJlY3RvcnkNCg0KTW91bnRpbmcgcmVhZC13cml0ZSAvZGV2L210ZGJsb2NrIGZpbGVz
eXN0ZW0gZmFpbGVkLiAgUGxlYXNlIGZpeCBhbmQgcnVuDQoJbW91bnQgL2Rldi9tdGRibG9jayBy
dW4vaW5pdHJhbWZzL3J3IC10IGpmZnMyIC1vIHJ3DQp0byB0byBjb250aW51ZSwgb3IgZG8gY2hh
bmdlIG5vdGhpbmcgdG8gcnVuIGZyb20gUkFNIGZvciB0aGlzIGJvb3QuDQpFbnRlciBwYXNzd29y
ZCB0byB0cnkgdG8gbWFudWFsbHkgZml4Lg0KQWZ0ZXIgZml4aW5nIHJ1biBleGl0IHRvIGNvbnRp
bnVlIHRoaXMgc2NyaXB0LCBvciByZWJvb3QgLWYgdG8gcmV0cnksIG9yDQp0b3VjaCAvdGFrZW92
ZXIgYW5kIGV4aXQgdG8gYmVjb21lIFBJRCAxIGFsbG93aW5nIGVkaXRpbmcgb2YgdGhpcyBzY3Jp
cHQuDQpHaXZlIHJvb3QgcGFzc3dvcmQgZm9yIHN5c3RlbSBtYWludGVuYW5jZQ0KKG9yIHR5cGUg
Q29udHJvbC1EIGZvciBub3JtYWwgc3RhcnR1cCk6DQoNCkkgc2VhcmNoZWQgYW5kIHNhdyB0aGlz
IGZlYXR1cmUgZGlzY3Vzc2lvbg0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy9p
c3N1ZXMvMzE3Nw0Kd2hpY2ggaGFzIGEgY29tbWl0IGZvciB1Ym9vdDogQWRkIHN1cHBvcnQgZm9y
IHViaSBhbmQgbXRkIHBhcnRpdGlvbmluZw0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0
Lnh5ei9jL29wZW5ibWMvb3BlbmJtYy8rLzU5MTENCkl0IHdlbnQgaW4gbWV0YS1waG9zcGhvci9j
b21tb24vcmVjaXBlcy1ic3AvdS1ib290L2ZpbGVzLyBhcyBhIHBhdGNoLg0KaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5ibWMvb3BlbmJtYy9jb21taXQvZGQ3MDE1MzkzZmRhYjkzNDI2YWFiNjFhMDhi
NDhhNjk4YzljMTAwZA0KDQpUaGVyZSBpcyBhbHNvIHRoaXMNCmh0dHBzOi8vZ2Vycml0Lm9wZW5i
bWMtcHJvamVjdC54eXovYy9vcGVuYm1jL29wZW5ibWMvKy8xMDU3Nw0KVGhlc2UgYXJlIG5vdCBp
biBvdXIgY29kZSBiYXNlLg0KRG8gd2UgbmVlZCB0aGVzZSBwYXRjaGVzPw0KDQo+IA0KPiA+ICZm
bWMgew0KPiA+ICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiAgICAgICBmbGFzaEAwIHsNCj4g
PiAgICAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiAgICAgICAgICAgICAgIG0yNXAs
ZmFzdC1yZWFkOw0KPiA+ICAgICAgICAgICAgICAgbGFiZWwgPSAiYm1jIjsNCj4gPiAvLyNpbmNs
dWRlICJvcGVuYm1jLWZsYXNoLWxheW91dC5kdHNpIg0KPiA+DQo+ID4gICAgICAgICAgICAgICBw
YXJ0aXRpb25zIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
IDEgPjsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8IDEgPjsNCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgdS1ib290QDAgew0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJlZyA9IDwgMCAweDYwMDAwID47DQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbGFiZWwgPSAidS1ib290IjsNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgfTsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgdS1ib290LWVudkA2MDAwMCB7DQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPCAweDYwMDAwIDB4MjAwMDAgPjsN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsYWJlbCA9ICJ1LWJvb3QtZW52IjsN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
b2JtYy11YmlAODAwMDAgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwweDgwMDAwIDB4N0Y4MDAwMD47DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bGFiZWwgPSAib2JtYy11YmkiOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICAg
ICAgICAgICAgICAgfTsNCj4gPiAgICAgICB9Ow0KPiA+IH07DQo+ID4NCj4gPj4NCj4gPj4+PiBE
b2VzIGFueW9uZSBrbm93IHdoeSB0aGUgZGVmYXVsdCBpcyBzdGF0aWMgcGFydGl0aW9ucywgYW5k
IG5vdCB1Ymlmcz8NCj4gPj4+Pg0KPiA+Pj4+IFJlZ2FyZHMsDQo+ID4+Pj4gRGVlcGFrDQo+ID4+
Pj4NCj4gPj4+Pj4gMi4gSW4gbWV0YS1teXBsYXRmb3JtL2NvbmYvbWFjaGluZS9teXBsYXRmb3Jt
LmNvbmYsIEkgYWRkZWQsDQo+ID4+Pj4+DQo+ID4+Pj4+IElNQUdFX0ZTVFlQRVMgKz0gIiBtdGQt
dWJpIG10ZC11YmktdGFyIg0KPiA+Pj4+Pg0KPiA+Pj4+PiBPQk1DX01BQ0hJTkVfRkVBVFVSRVMg
Kz0gIiBvYm1jLXViaS1mcyINCj4gPj4+Pj4NCj4gPj4+Pj4gRG8gSSBtaXNzIGFueXRoaW5nPw0K
PiA+Pj4+Pg0KPiA+Pj4+PiBUaGFua3MuDQo+ID4+Pj4+DQo+ID4+Pj4+IEJlc3QgcmVnYXJkcywN
Cj4gPj4+Pj4NCj4gPj4+Pj4gS3VuIFpoYW8NCj4gPj4+Pj4NCj4gPj4+Pj4gLyoNCj4gPj4+Pj4N
Cj4gPj4+Pj4gemt4ekBob3RtYWlsLmNvbSA8bWFpbHRvOnpreHpAaG90bWFpbC5jb20+DQo+ID4+
Pj4+DQo+ID4+Pj4+ICovDQo+ID4+Pj4+DQo+ID4+Pj4NCj4gPj4+IEt1bg0KPiA+Pj4NCj4gPg0K
DQo=
