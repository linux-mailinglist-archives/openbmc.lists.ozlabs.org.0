Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A66290C33
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 21:23:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCbf31bW0zDqGc
	for <lists+openbmc@lfdr.de>; Sat, 17 Oct 2020 06:23:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64;
 helo=hqnvemgate25.nvidia.com; envelope-from=nkrishnan@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=J+deezt0; dkim-atps=neutral
X-Greylist: delayed 303 seconds by postgrey-1.36 at bilbo;
 Sat, 17 Oct 2020 06:01:56 AEDT
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCb9c41CBzDqPC
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2020 06:01:55 +1100 (AEDT)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f89ecc10002>; Fri, 16 Oct 2020 11:56:01 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 18:56:46 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 16 Oct 2020 18:56:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKsX5qiOofl2vQ/XD4Ia6M2XZf11pYVezBo9vfRBc1TwV6bDE4cMc/UI8OGFvKAXajgZnnSN1PMpXXH1TnpQlmFR94ejgukA4oOR4jk4EdUxfAYJueKyNyuvr6dgi2zwgSLQ+KR9kBeNeL/DUvEdc6rk0iANhuT1A2vuiCHCUTryK2HVfTyHVF/SGQcNTkBg8bWkfAaboxCsf77VdtNBYt9W5+0Yo0NNZuGWNg/c1/sOjZKj0KotGc+Hhp+QDhzlvD0X+Jdqq5pRoei+OmbIPAe5NMKB5RCsywBPwdq+w5CJN/NE5hTr19UAhP3EEs7gVNRFMUSuTWLmwRHHU5huMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4EbIRw2KfRbMe0Fi2MoYK/+zI0sYDXLUEDVwkZFIws=;
 b=loZP/24HJp2fZ9JAB4d+FnRfYs2awh6C9y1pTZP6NC1WDfyuRbsXt0xdSkCi0inLPC/sk/j6z4HpEtUTdefKESXzrTblBuNawCevtvcyxA+bcxJVVL5XL5/dG6QJqKYR7IcOOWb9iXhaB7/p1tA4vn84qqltPXlDjfDSN/+34hQzg/Q6zZch8lE9q2kk7rKiPH37M1BaLn4msSNH0SmwT2hZGgvF917KaQGVX+auRAqIMrlzWNQ86Oo3W8X5QHjaNMNPPVk1pt68poTHXGHjb8SIo9XG8Cn+GGWoCju/I9NvA1+imxH3eWQDyBfl9GCgKMgBD+d045TgpnPM3gT5Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2677.namprd12.prod.outlook.com (2603:10b6:a03:69::26)
 by BY5PR12MB4276.namprd12.prod.outlook.com (2603:10b6:a03:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Fri, 16 Oct
 2020 18:56:44 +0000
Received: from BYAPR12MB2677.namprd12.prod.outlook.com
 ([fe80::d08c:1633:98eb:dd5]) by BYAPR12MB2677.namprd12.prod.outlook.com
 ([fe80::d08c:1633:98eb:dd5%4]) with mapi id 15.20.3455.035; Fri, 16 Oct 2020
 18:56:44 +0000
From: Nirenjan Krishnan <nkrishnan@nvidia.com>
To: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Subject: Re: Kernel panic when net booting OpenBMC
Thread-Topic: Kernel panic when net booting OpenBMC
Thread-Index: AQHWooOo5rJ4kM64L0iEPbZ3CvbR06mYgeuAgAGf4oA=
Date: Fri, 16 Oct 2020 18:56:44 +0000
Message-ID: <82D7487C-C1AD-4021-BED0-0ECE635EE1D9@nvidia.com>
References: <65961456-D5F6-41CC-AD10-93E716386953@nvidia.com>
 <CAM=TmwWc4aCsa_UZiwKByor32f6=1OmofKuY6XjuMa7RpC_9xQ@mail.gmail.com>
In-Reply-To: <CAM=TmwWc4aCsa_UZiwKByor32f6=1OmofKuY6XjuMa7RpC_9xQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.41.20091302
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55fa6630-794a-4d34-f4fc-08d872053a12
x-ms-traffictypediagnostic: BY5PR12MB4276:
x-microsoft-antispam-prvs: <BY5PR12MB4276E88316B23B5234996BBBCC030@BY5PR12MB4276.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U58i6SzkebE0jZzC6SqoKp6ebVupVdfP+FuyqocoNzDzJSI+RrX5NMfAKYvrhUvsTRBCPJARbo1OfDOWCtrAk6dPx8wRpUkIok0lPdHzwRxfKPf1JMmdfQ4baufSfId4KY4IgbCv3F56F83wGBW7Cua8J5AcnxsvCc1E04g7FI+WC79nrvmPQ2RL2NvznZxtPiCqfItg8NF1WXrPs5kHYbbRO+hz1TNpT89ottk+K2tLh+tRyxrktzWnWto7q09RJzForWAMtUkNhKLw3BxVd3zQIAmpv3BauZCd7jmXk9CfYw0RLCdVlzTD/1kWwQbis8qlUn7iQi89az7ExPuTAQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2677.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(6512007)(66946007)(66476007)(66556008)(66446008)(64756008)(33656002)(8676002)(186003)(2616005)(76116006)(8936002)(26005)(71200400001)(4326008)(2906002)(86362001)(316002)(478600001)(6506007)(83380400001)(6486002)(6916009)(5660300002)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: l8zKGOJYr5b/7SE4ue8zg5XSYp/bIpmzG4/DGTzsuhPovJScovwQ9ywO8JhaWceRbV3qC5sGT0dBFRMEXwgdUFN+4a7bO0oYx+bj8CqZjAhzpAZuli+HUmWmS40T/Bg1kNDXitg8JDaEBSET9UcRQDJvBcWdBcZfhAJeI6pIEfXxRUFnfLC2QGSGKUwz1i676izYEDXRo8zuk628oEafNCj06TnxBl7uQ8IusCV1mpnUSUtZE9XqfW+xbjrwA92IaRaMzoWoXWy11GbTI9+l7JoqcQ6t+AMyHKNjQtGq+DIEh8pVtRcfLY5HrFEqEUqewcYHLMf1cL33oQoQ90jaRXu57KTbGVApVpVRUqYZjUvm3yyoEUqQBf8Zj+KlOHQUnJyLKkSy988zxFc8ZjoG9ha23xfY4XgPLs7VUBfui1x1FIwSBCpZ5EYgVHBpvliwgsxayKZQ8HLAeZuXkXL3NWTmTsPaWnmMOYAfdQpb6wwIr/5jLDJl+K5i1ZRHn1QdFJWvFYwgTxWBWak5uI6jtYeZas1zcTo1L/YsmWFx5Ye4E/RcN3FH53WMm712n2Wk9XDN/jMrZ6ls8JL6dPJp+avf1UjZnrkm3PtVozcYpYIr4NRy9itvFVsLTyjVas7r37+XijLbpfxKvlS7TIzMgw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D1053AF823D3644B739E2555A241394@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2677.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fa6630-794a-4d34-f4fc-08d872053a12
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 18:56:44.6229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1O2i4x7S7Y4xhqWuekHeb3wEMANa51su1MEcxw8Q4UVSKsINFe7t55b+pN0fIPC93kWmm+jjRwUkWeKY+Udb7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4276
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602874561; bh=K4EbIRw2KfRbMe0Fi2MoYK/+zI0sYDXLUEDVwkZFIws=;
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
 b=J+deezt0WKyruXl06YD5cJqNYOlB1f8vIrjm6sIvTo/QXAXQwFNIFW1k1X7v/dlyG
 y/ussdssxkbjQsNZB/taURZgVQIMwkJuOdqkTXvS8ZISi6fJwrORgJUX3Q8OP/Gs69
 aaXVlPoCwIrEq0KLgcq1a+1a1svir2NFacADncZxn2Tl/xsL7HhjExyaRoQtif38z5
 TNwOYXx7/Y1pYihTifJbM9niGhOVK9ettMxKgA8CijiR5rV9Wa4gu7okg7ObBRTD3q
 huYLhmJOlLinRJwEo+YEV28x5ZqOO5lq9qOamG5nJwIrcwGUIKXN5z+Rqvnwcq6OeF
 qPqNrNaDoJ4vA==
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

SGkgRGVlcGFrLA0KDQo+IEl0IHNlZW1zIGxpa2UgdGhlIHJvb3RmcyBjYW4ndCBiZSBmb3VuZC4g
VGhlIGZpdEltYWdlIGJhc2VkIGFwcHJvYWNoIHVzdWFsbHkgd29ya3Mgd2VsbCBmb3IgbWUuIENh
biB5b3UgZWxhYm9yYXRlIHdoYXQgeW91IGRpZCB3aXRoIHRoZSBmaXRJbWFnZSANCj4gYmFzZWQg
YXBwcm9hY2g/IEkgdHlwaWNhbGx5IGRvIHRoaXMgKG9uIGFuIEFTVDI1MDApIDoNCg0KPiAxKSBB
ZGQgSU1BR0VfRlNUWVBFUyArPSAiY3Bpby4ke0lOSVRSQU1GU19DVFlQRX0udS1ib290IiB0byB0
aGUgY29uZg0KPiAyKSBDb3B5IGZpdEltYWdlIGFuZCBvYm1jLXBob3NwaG9yLWltYWdlLTxwbGF0
Zm9ybT4uY3Bpby5sem1hLnUtYm9vdCB0byB0aGUgdGZ0cCBzZXJ2ZXIuDQo+IDMpIFNldHVwIHRo
ZSB0ZnRwIHNlcnZlciBhbmQgdGhlIEJNQyBuZXR3b3JrDQo+IDQpIHRmdHAgMHg4MzAwMDAwMCBm
aXRJbWFnZQ0KPiA1KSB0ZnRwIDB4OTMwMDAwMDAgaW5pdHJkIChpbiBzdGVwIDIgSSBoYWQgbmFt
ZWQgdGhlIGNwaW8gaW1hZ2UgYXMgaW5pdHJkIG9uIHRoZSB0ZnRwIHNlcnZlcikuIEF0IHRoaXMg
c3RhZ2UgJ2ltaW5mbycgc2hvdWxkIHNob3cgd2hhdCBpbWFnZXMgaGF2ZSA+IGJlZW4gbG9hZGVk
Lg0KPiA2KSBib290bSAweDgzMDAwMDAwIDB4OTMwMDAwMDANCg0KSSBoYXZlIGFkZGVkIHRoZSBD
UElPIGltYWdlIHRvIGxvY2FsLmNvbmYsIGJ1dCBJIGRvbid0IHNlZSBhbiBvYm1jLXBob3NwaG9y
LWltYWdlLTxwbGF0Zm9ybT4uY3Bpby4qLnUtYm9vdCwgb25seSBvYm1jLXBob3NwaG9yLWluaXRy
YW1mcy08cGxhdGZvcm0+LmNwaW8ueHoudS1ib290LiBJIGZpZ3VyZWQgdGhpcyBtaWdodCBiZSB3
aGF0IHlvdSBpbnRlbmRlZCwgYnV0IHRoYXQgZG9lc24ndCB3b3JrIGVpdGhlci4gUGVyaGFwcyBp
dCdzIGFuIGlzc3VlIHdpdGggdGhlIGxvYWQgYWRkcmVzcyBhbmQgZW50cnkgcG9pbnQ/IEJvdGgg
c2hvdyBhcyAwMDAwMDAwMCBvbiB0aGUgZ2VuZXJhdGVkIENQSU8gaW1hZ2UsIGJ1dCBpZiBJIGxv
b2sgYXQgdGhlIGluaXRyYW1mcyBzZWN0aW9uIG9mIHRoZSBmaXRJbWFnZSwgdGhlbiB0aGVzZSBh
ZGRyZXNzZXMgYXJlICJ1bmF2YWlsYWJsZSIuDQoNCldoZW4gSSB1c2UgdGhlIGNvcnJlc3BvbmRp
bmcgaW5pdHJhbWZzLmNwaW8gZGlyZWN0bHksIHRoZSBzeXN0ZW0gaGFuZ3MgYXQgTG9hZGluZyBr
ZXJuZWwsIEkgZG9uJ3Qgc2VlIGFueSBvdXRwdXQgb24gdGhlIGNvbnNvbGUgYWZ0ZXIgdGhpcy4g
SWYgSSBjaGFuZ2UgdGhlIGluaXRyYW1mcyBsb2FkIGFkZHJlc3MgYW5kIGVudHJ5IHBvaW50IHRv
IGFuIGFkZHJlc3MgaW5zaWRlIERSQU0sIHRoZW4gaXQgc3RhcnRzIHRoZSBrZXJuZWwsIGJ1dCB0
aGVuIEkgZ2V0IGEga2VybmVsIHBhbmljIGFzIHNob3duIGJlbG93Lg0KDQpbICAgIDEuMjQ4MDc0
XSAvZGV2L3Jvb3Q6IENhbid0IG9wZW4gYmxvY2tkZXYNClsgICAgMS4yNDg2MzRdIFZGUzogQ2Fu
bm90IG9wZW4gcm9vdCBkZXZpY2UgInJhbSIgb3IgdW5rbm93bi1ibG9jaygxLDApOiBlcnJvciAt
Ng0KWyAgICAxLjI0OTEzOV0gUGxlYXNlIGFwcGVuZCBhIGNvcnJlY3QgInJvb3Q9IiBib290IG9w
dGlvbjsgaGVyZSBhcmUgdGhlIGF2YWlsYWJsZSBwYXJ0aXRpb25zOg0KWyAgICAxLjI1MDA1Nl0g
MWYwMCAgICAgICAgICAgMzI3NjggbXRkYmxvY2swDQpbICAgIDEuMjUwMDk0XSAgKGRyaXZlcj8p
DQpbICAgIDEuMjUwNjI2XSAxZjAxICAgICAgICAgICAgIDM4NCBtdGRibG9jazENClsgICAgMS4y
NTA2MzNdICAoZHJpdmVyPykNClsgICAgMS4yNTEwMzZdIDFmMDIgICAgICAgICAgICAgMTI4IG10
ZGJsb2NrMg0KWyAgICAxLjI1MTA0Ml0gIChkcml2ZXI/KQ0KWyAgICAxLjI1MTUwOV0gMWYwMyAg
ICAgICAgICAgIDQzNTIgbXRkYmxvY2szDQpbICAgIDEuMjUxNTE1XSAgKGRyaXZlcj8pDQpbICAg
IDEuMjUxOTc4XSAxZjA0ICAgICAgICAgICAyMzgwOCBtdGRibG9jazQNClsgICAgMS4yNTE5ODNd
ICAoZHJpdmVyPykNClsgICAgMS4yNTI0NTBdIDFmMDUgICAgICAgICAgICA0MDk2IG10ZGJsb2Nr
NQ0KWyAgICAxLjI1MjQ1Nl0gIChkcml2ZXI/KQ0KWyAgICAxLjI1MjkzOF0gMWYwNiAgICAgICAg
ICAgMzI3NjggbXRkYmxvY2s2DQpbICAgIDEuMjUyOTQ0XSAgKGRyaXZlcj8pDQpbICAgIDEuMjUz
NTg1XSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogVkZTOiBVbmFibGUgdG8gbW91bnQgcm9v
dCBmcyBvbiB1bmtub3duLWJsb2NrKDEsMCkNCg0KT25lIG9ic2VydmF0aW9uIHRoYXQgSSBoYWQg
aXMgdGhhdCBieSB1c2luZyB0aGUgaW5pdHJhbWZzIHRoYXQgaXMgaW50ZWdyYXRlZCBpbnRvIHRo
ZSBmaXRJbWFnZSwgSSdtIGFibGUgdG8gYm9vdCBpbnRvIGFuIGluaXRyZCBzaGVsbCBieSBhcHBl
bmRpbmcgdGhlIGZvbGxvd2luZyB0byBib290YXJncyAtIGRlYnVnLWluaXQtc2ggZW5hYmxlLWlu
aXRyZC1kZWJ1Zy1zaC4NCg0KQmFzZWQgb24gdGhhdCBzaGVsbCwgaXQgYXBwZWFycyB0aGF0IHRo
ZSBpbml0cmQgZG9lcyBub3QgcGljayB1cCB0aGUga2VybmVsIElQIGNvbmZpZ3VyYXRpb24sIHdo
aWNoIGlzIHBlcmhhcHMgd2h5IHRoZSBORlMgbW91bnQgaXMgZmFpbGluZy4gSXMgdGhlcmUgYSBz
dGFuZGFyZCBsb2NhdGlvbiBmb3IgdGhlIGluaXQgc2NyaXB0IHRoYXQgaXMgYnVpbHQgaW50byB0
aGUgaW5pdHJhbWZzPw0KDQpUaGFua3MgYW5kIHJlZ2FyZHMNCk5pcmVuamFuIEtyaXNobmFuDQoN
Cg==
