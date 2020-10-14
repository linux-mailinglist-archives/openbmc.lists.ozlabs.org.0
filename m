Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2DE28E940
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 01:43:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBTWG2ScgzDqSy
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 10:43:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65;
 helo=hqnvemgate26.nvidia.com; envelope-from=nkrishnan@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=S6hkZ8AB; dkim-atps=neutral
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBTVK2ScwzDqSc
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 10:42:27 +1100 (AEDT)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f878cd20000>; Wed, 14 Oct 2020 16:42:10 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct
 2020 23:42:22 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 14 Oct 2020 23:42:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmiFlhRiCougvn3jf2RWPmkG+UCblKEMiyPvZKVWMAg4PSSd/H59Gk5G/XQd4qgVGBbX8yT+5KuLuXd75/6rm9WYxTGGNsWEnZh2gMsruUbKqNmiMhE5CxlGzL0bGPbSJaPIxIpd8QfaI+EOJ7kBnHua4Le6q8LuNSXGhhQxxqhdxpRam/hzsvoc/hCRnTUJrk3ehF5syDVXzQvYu3XIIB0Be76/t916uK9avtWCOCiTuhzp2q3TB+QmcbnXMHmytE6MYWZ4sCfJxRMMEfIniQiUou/ANbAMgs90wJIOmBzalubg6Q3vbygQPG8EHcrVFAWkAi/wXDvd0ljNqrROhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pewmTL+cJw1djqPIAvDfe+BY1xC5eaHOUfEIjSx+Dng=;
 b=QucvqnkmDD3EeVwVFHWJCdKpSsuG8aeC0lotHW75Qmzf0e6KXBfO3d4Qa0wrdixX7p6rrNFvZ4ufIrov/JtdkBkSjvPgJDFv7UrRgka2zneeLJ7Hx2AGQz4OX9yyGQIgK9CZ5GWtSW6/HUZv2+enDSMVyPMdbXr3plKjdPxkXRKi+OVb5yZEsiCpIMWixYA4zCXmE7u3memv/ih31Cw0Y/mY04j4MjEBqMIUJAuFQhByHY56yVUc35PwCZvjopTX0i7RTBAkLjXdynoHvC3KICivZ8d1EU3SrWGRe9pb1ckOh1bYFFFGqBN4DQjhfuv7DxZcWlzeJa1BBr2eMRjBtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2677.namprd12.prod.outlook.com (2603:10b6:a03:69::26)
 by BY5PR12MB4289.namprd12.prod.outlook.com (2603:10b6:a03:204::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 14 Oct
 2020 23:42:21 +0000
Received: from BYAPR12MB2677.namprd12.prod.outlook.com
 ([fe80::d08c:1633:98eb:dd5]) by BYAPR12MB2677.namprd12.prod.outlook.com
 ([fe80::d08c:1633:98eb:dd5%4]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 23:42:21 +0000
From: Nirenjan Krishnan <nkrishnan@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Kernel panic when net booting OpenBMC
Thread-Topic: Kernel panic when net booting OpenBMC
Thread-Index: AQHWooOo5rJ4kM64L0iEPbZ3CvbR0w==
Date: Wed, 14 Oct 2020 23:42:21 +0000
Message-ID: <65961456-D5F6-41CC-AD10-93E716386953@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.41.20091302
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2dd833fb-e23a-4531-0709-08d8709acb51
x-ms-traffictypediagnostic: BY5PR12MB4289:
x-microsoft-antispam-prvs: <BY5PR12MB4289605D32818AD4DFCEEDE9CC050@BY5PR12MB4289.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pr8Jh8uY+UxWNX+yr9B8FMtsItBNsk+QEEgHa/TuGKQgAh/V+XiJF1Ho0xelK0Pz4XsjGJban2w3tjbFCXq0QCDtzRqpByH6SM8CqZh4aMXlNPn5ULTtCfAL1cdLw4j3UOuNdnfA7qlAIlP9UI7q789WFDgNFTyeyt7TeAx/8TOjh4O7Zlh+bIDqnheY5jh0v/woArH/0Zk3FdgVxDvQdr+RWZPTXMYPHa41FhWmja74Eoyq4dn+GhGjkwYyeCI7+r5tlR/mkLIKM+qQ+O00kP0C/GiI0EiZ0/LeAYvtBFSuTmuxgYkJBKosg9N4ZwEGhGcSyIwpWxDgq3Aq5QSW+ZlMtjrKUuzPhVUVV9yqMPakLLO3I+dZdC6X0MbAwkEuIAnWFD36Lg5VN7DKg0QP6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2677.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(36756003)(66556008)(66946007)(6506007)(66446008)(76116006)(66476007)(64756008)(2616005)(8936002)(26005)(6512007)(316002)(71200400001)(8676002)(86362001)(83080400001)(478600001)(186003)(6486002)(966005)(2906002)(83380400001)(33656002)(5660300002)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: hE5XQU5nepNEBfJsCauXVGwGnV+NQcayJGzPPY5v6lEk9F8R1CoW0nJdMeEmItKBlwT/ygCWgOJr5ABw9GL2n50kU6YA7VdJsWLViI0jKga9VV2ZwpwcJzPiH/oAtdsuij+/4L/S7EI7AgS4wvDfM1QSSyvJvfuIuhY9PE1QUyTex/Lj6ggJXyPrS6UWVwYlqX3DsImfLpNePRdftH6yGtJpumEw22uzlQy/GpQBDzeJURFCCsvQon7yYafoFAPFj8Bu9EaN7oOvSAab0T/WaagWXOv4g1Rm3wzWvPvFcxAL7tGMtHv6VZgnhIG0v4Sz+qIDKqthE57xGN84F6iBFdMh7UsGUzeOB5hXmS5EXXGylw6P/fA+MphQSRuq6bRQFuLELlr7l4/dQYD2UyAIUxX7Pa4CmLJRj7Xt+rnNFDLDulGRfASVOc8HZOjoHLxyj2xGa6CduY9pcteTp3TBKdXiyqv+/ckNvE7bh9kgkMzFzqbML85NUxoNvamlX99w3XrUzE/zV+CNXq5O3Bk9j23kxrR/pEhdtkuxdAAU6fSw72fIOaXPCgBpuEvWcw25KD1MSI6XiNsDJJuPXLCXA1P6LHjd31A7IkAFb3AWAdPyfxjIeILaVaPKoA0GMdewfNcpF/QQ8nRnuPsMPdrFpQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C9D8A448CCB0F418B5480FF8AD3A8B2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2677.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd833fb-e23a-4531-0709-08d8709acb51
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2020 23:42:21.0805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4KFHTJJvazFPhvEr+uC69BhBuvA/e1BcxJNQmdRSkLRT/7FxsQzxK1hu1jFbP7bgbCoZhM5i7wSwWdw6XZzF8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4289
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602718930; bh=pewmTL+cJw1djqPIAvDfe+BY1xC5eaHOUfEIjSx+Dng=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
 Subject:Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
 authentication-results:x-originating-ip:x-ms-publictraffictype:
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
 b=S6hkZ8ABxUyL02/GxIKTU8sBXmBz86e785HTX4pSaQQEjuWeT8RP5efr5JFsSVT6p
 Sk2+9uHhq+LFDop68T9eb4fhq0OehJ8MePa/TekuXHeZrYTcaHoqfvKPr5DAUnn1Zn
 up2RGBS6Go7/QwAMJNlNqMU8dZENPUdGp2YXIkeEKtISo/bmAnJZMJjPixg1cfiDSp
 YjaLtZoh2JKq56tHbUWOQ4DXmYDw/SSbJNXhZPqNDKvXbiCKtRSUxqY60Q8z//vLer
 wZRN5EHPIGYOHJuOdQCNl5fUU+YARZtpfqGxDAx4PdsN7ZDSFv77AGET4TxdkKh/op
 lvMjo/D2m1/eQ==
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

SGksDQoNCknigJltIHRyeWluZyB0byBuZXRib290IGFuIE9wZW5CTUMgaW1hZ2Ugb24gYSBjdXN0
b20gdGFyZ2V0IGJvYXJkIHRoYXQgd2UgYXJlIGJ1aWxkaW5nLiBUaGUgYm9hcmQgYm9vdHMgZmlu
ZSB3aGVuIHdlIGJvb3QgZnJvbSBmbGFzaCwgYnV0IHdoZW4gYm9vdGluZyBmcm9tIHRoZSBuZXR3
b3JrLCBJIHJ1biBpbnRvIHRoZSBmb2xsb3dpbmcga2VybmVsIHBhbmljOg0KDQpbICAgIDEuMTk1
MTA2XSAvZGV2L3Jvb3Q6IENhbid0IG9wZW4gYmxvY2tkZXYNClsgICAgMS4xOTU0MjVdIFZGUzog
Q2Fubm90IG9wZW4gcm9vdCBkZXZpY2UgIm5mcyIgb3IgdW5rbm93bi1ibG9jaygwLDI1NSk6IGVy
cm9yIC02DQpbICAgIDEuMTk1NzM2XSBQbGVhc2UgYXBwZW5kIGEgY29ycmVjdCAicm9vdD0iIGJv
b3Qgb3B0aW9uOyBoZXJlIGFyZSB0aGUgYXZhaWxhYmxlIHBhcnRpdGlvbnM6DQpbICAgIDEuMTk2
MzkxXSAxZjAwICAgICAgICAgICAzMjc2OCBtdGRibG9jazANClsgICAgMS4xOTY0MzhdICAoZHJp
dmVyPykNClsgICAgMS4xOTY3NjldIDFmMDEgICAgICAgICAgICAgMzg0IG10ZGJsb2NrMQ0KWyAg
ICAxLjE5Njc3NV0gIChkcml2ZXI/KQ0KWyAgICAxLjE5NzA3NF0gMWYwMiAgICAgICAgICAgICAx
MjggbXRkYmxvY2syDQpbICAgIDEuMTk3MDc5XSAgKGRyaXZlcj8pDQpbICAgIDEuMTk3MzU3XSAx
ZjAzICAgICAgICAgICAgNDM1MiBtdGRibG9jazMNClsgICAgMS4xOTczNjJdICAoZHJpdmVyPykN
ClsgICAgMS4xOTc2NDddIDFmMDQgICAgICAgICAgIDIzODA4IG10ZGJsb2NrNA0KWyAgICAxLjE5
NzY1Ml0gIChkcml2ZXI/KQ0KWyAgICAxLjE5Nzk0OV0gMWYwNSAgICAgICAgICAgIDQwOTYgbXRk
YmxvY2s1DQpbICAgIDEuMTk3OTU1XSAgKGRyaXZlcj8pDQpbICAgIDEuMTk4MjQ2XSAxZjA2ICAg
ICAgICAgICAzMjc2OCBtdGRibG9jazYNClsgICAgMS4xOTgyNTJdICAoZHJpdmVyPykNClsgICAg
MS4xOTg3MTNdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBWRlM6IFVuYWJsZSB0byBtb3Vu
dCByb290IGZzIG9uIHVua25vd24tYmxvY2soMCwyNTUpDQpbICAgIDEuMTk5MzEwXSBDUFU6IDAg
UElEOiAxIENvbW06IHN3YXBwZXIgTm90IHRhaW50ZWQgNS44LjAtNjcxNTUwZS1kaXJ0eS0zYWUy
YzE4ICMxDQpbICAgIDEuMTk5ODYwXSBIYXJkd2FyZSBuYW1lOiBHZW5lcmljIERUIGJhc2VkIHN5
c3RlbQ0KWyAgICAxLjIwMDIyOF0gQmFja3RyYWNlOg0KWyAgICAxLjIwMDY3MV0gWzw4MDEwNmYx
Yz5dIChkdW1wX2JhY2t0cmFjZSkgZnJvbSBbPDgwMTA3MTcwPl0gKHNob3dfc3RhY2srMHgyMC8w
eDI0KQ0KWyAgICAxLjIwMTE1NV0gIHI3OjAwMDA4MDAwIHI2OjgwOGVjNGI0IHI1OjAwMDAwMDAw
IHI0OjgwOGZlMjU4DQpbICAgIDEuMjAxNTEyXSBbPDgwMTA3MTUwPl0gKHNob3dfc3RhY2spIGZy
b20gWzw4MDdhNTQxND5dIChkdW1wX3N0YWNrKzB4MjgvMHgzMCkNClsgICAgMS4yMDE4ODJdIFs8
ODA3YTUzZWM+XSAoZHVtcF9zdGFjaykgZnJvbSBbPDgwMTE2MTYwPl0gKHBhbmljKzB4ZjgvMHgz
MjApDQpbICAgIDEuMjAyMjI5XSAgcjU6MDAwMDAwMDAgcjQ6ODBiODQyOTANClsgICAgMS4yMDI0
OTldIFs8ODAxMTYwNjg+XSAocGFuaWMpIGZyb20gWzw4MGEwMWFhMD5dIChtb3VudF9ibG9ja19y
b290KzB4MmU0LzB4Mzk4KQ0KWyAgICAxLjIwMjg4MV0gIHIzOjgwYjAzMDA4IHIyOjAwMDAwMDAw
IHIxOjhlNGExZWM0IHIwOjgwOGVjNGI0DQpbICAgIDEuMjAzMTY4XSAgcjc6MDAwMDgwMDANClsg
ICAgMS4yMDMzMTZdIFs8ODBhMDE3YmM+XSAobW91bnRfYmxvY2tfcm9vdCkgZnJvbSBbPDgwYTAx
YmNjPl0gKG1vdW50X3Jvb3QrMHg3OC8weDk0KQ0KWyAgICAxLjIwMzcxOF0gIHIxMDo4MDk4Y2Yw
NCByOTo4MGEyOTgzYyByODo4MGEyOTg1YyByNzowMDAwMDAwOCByNjo4ZTQ5NjZlMCByNTo4MGEy
OTg3NQ0KWyAgICAxLjIwNDEwMl0gIHI0OjAwMDAwMGZmDQpbICAgIDEuMjA0MjQyXSBbPDgwYTAx
YjU0Pl0gKG1vdW50X3Jvb3QpIGZyb20gWzw4MGEwMWQyND5dIChwcmVwYXJlX25hbWVzcGFjZSsw
eDEzYy8weDE5NCkNClsgICAgMS4yMDQ2NDBdICByNTo4MGEyOTg3NSByNDo4MGI4NDAyOA0KWyAg
ICAxLjIwNDg0MF0gWzw4MGEwMWJlOD5dIChwcmVwYXJlX25hbWVzcGFjZSkgZnJvbSBbPDgwYTAx
NTRjPl0gKGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4MWIwLzB4MWY4KQ0KWyAgICAxLjIwNTI4Ml0g
IHI1OjgwYjg0MDAwIHI0OjAwMDAwMDk2DQpbICAgIDEuMjA1NDk1XSBbPDgwYTAxMzljPl0gKGtl
cm5lbF9pbml0X2ZyZWVhYmxlKSBmcm9tIFs8ODA3YmVkYzQ+XSAoa2VybmVsX2luaXQrMHgxOC8w
eDEyMCkNClsgICAgMS4yMDU5MTNdICByMTA6MDAwMDAwMDAgcjk6MDAwMDAwMDAgcjg6MDAwMDAw
MDAgcjc6MDAwMDAwMDAgcjY6MDAwMDAwMDAgcjU6ODA3YmVkYWMNClsgICAgMS4yMDYzMDVdICBy
NDowMDAwMDAwMA0KWyAgICAxLjIwNjQ1NF0gWzw4MDdiZWRhYz5dIChrZXJuZWxfaW5pdCkgZnJv
bSBbPDgwMTAwMTI4Pl0gKHJldF9mcm9tX2ZvcmsrMHgxNC8weDJjKQ0KWyAgICAxLjIwNjg5OF0g
RXhjZXB0aW9uIHN0YWNrKDB4OGU0YTFmYjAgdG8gMHg4ZTRhMWZmOCkNClsgICAgMS4yMDczMDNd
IDFmYTA6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAwMDAwMDAwIDAwMDAw
MDAwIDAwMDAwMDAwIDAwMDAwMDAwDQpbICAgIDEuMjA3ODMxXSAxZmMwOiAwMDAwMDAwMCAwMDAw
MDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAw
MA0KWyAgICAxLjIwODM1M10gMWZlMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAw
MDAgMDAwMDAwMTMgMDAwMDAwMDANClsgICAgMS4yMDg3MzldICByNTo4MDdiZWRhYyByNDowMDAw
MDAwMA0KWyAgICAxLjIwOTUwNV0gLS0tWyBlbmQgS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6
IFZGUzogVW5hYmxlIHRvIG1vdW50IHJvb3QgZnMgb24gdW5rbm93bi1ibG9jaygwLDI1NSkgXS0t
LQ0KDQpJIGVuYWJsZWQgQ09ORklHX05FVFdPUktfRklMRVNZU1RFTVMsIENPTkZJR19ORlNfRlMg
YW5kIENPTkZJR19ST09UX05GUyBpbiB0aGUga2VybmVsIGNvbmZpZ3VyYXRpb24sIHJlYnVpbHQg
dGhlIGtlcm5lbCBhbmQgdmVyaWZpZWQgdGhhdCB0aGUgZmxhc2ggYm9vdCB3b3JrcyBmaW5lLg0K
DQpUaGVzZSBhcmUgdGhlIGNvbW1hbmRzIHRoYXQgSSByYW4gdG8gbmV0Ym9vdA0KDQphc3QjIHRm
dHAgODMwMDAwMDAgdUltYWdlDQphc3QjIHRmdHAgODQwMDAwMDAgYXNwZWVkLmR0Yg0KYXN0IyBz
ZXRlbnYgc2VydmVyaXAgMTAueC54LngNCmFzdCMgc2V0ZW52IGJvb3RhcmdzIHJvb3Q9L2Rldi9u
ZnMgcncgbmZzcm9vdD0ke3NlcnZlcmlwfTovZGF0YS9uZnMvdGVzdCxub2xvY2ssdGNwIGNvbnNv
bGU9dHR5UzQsMTE1MjAwbjggbWVtLmRldm1lbT0xIGlwPSR7aXBhZGRyfToke3NlcnZlcmlwfTok
e3NlcnZlcmlwfToyNTUuMC4wLjA6OmV0aDAgbmZzcm9vdGRlYnVnDQphc3QjIGJvb3RtIDgzMDAw
MDAwIC0gODQwMDAwMDANCg0KSSBhbHNvIHVzZWQgdGhlIGZpdEltYWdlIGRpcmVjdGx5IGluc3Rl
YWQgb2YgYSBzZXBhcmF0ZSB1SW1hZ2UgYW5kIERUQiwgYW5kIHJhbiBpbnRvIHRoZSBzYW1lIGVy
cm9yLiBJIHRyaWVkIGVuYWJsaW5nIENQSU8gaW1hZ2UgYnVpbGRzIGJ5IGFkZGluZyB0aGUgZm9s
bG93aW5nIGxpbmUgaW4gbG9jYWwuY29uZjoNCg0KSU1BR0VfRlNUWVBFUyArPSAiY3Bpby4ke0lO
SVRSQU1GU19DVFlQRX0udS1ib290Ig0KDQpIb3dldmVyLCBpZiBJIHVzZSB0aGUgZ2VuZXJhdGVk
IENQSU8gaW1hZ2UgZGlyZWN0bHkgYXMgdGhlIGluaXRyYW1mcywgdGhlbiBhbGwgSSBzZWUgaXMg
IlN0YXJ0aW5nIGtlcm5lbCAuLi4iIGFuZCBubyBmdXJ0aGVyIG91dHB1dCBmcm9tIHRoZSBzeXN0
ZW0uDQoNCkNvdWxkIHlvdSBwbGVhc2Ugc3VnZ2VzdCBob3cgSSBjb3VsZCBnbyBhYm91dCBkZWJ1
Z2dpbmcgdGhpcz8gSSd2ZSBmb2xsb3dlZCBhbGwgdGhlIG5ldGJvb3Qgc3VnZ2VzdGlvbnMgZnJv
bSB0aGVzZSB0aHJlYWRzIG9uIHRoaXMgbWFpbGluZyBsaXN0OlwNCi0gaHR0cHM6Ly9saXN0cy5v
emxhYnMub3JnL3BpcGVybWFpbC9vcGVuYm1jLzIwMTgtSnVuZS8wMTIwNTQuaHRtbA0KLSBodHRw
czovL2xpc3RzLm96bGFicy5vcmcvcGlwZXJtYWlsL29wZW5ibWMvMjAxNS1PY3RvYmVyLzAwMDAx
MC5odG1sDQoNClRoYW5rcyBhbmQgcmVnYXJkcw0KTmlyZW5qYW4gS3Jpc2huYW4NCg0K
