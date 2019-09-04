Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A13A96C8
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 00:58:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Nzkh2tZDzDqyj
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 08:58:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=wdc.com
 (client-ip=68.232.141.245; helo=esa1.hgst.iphmx.com;
 envelope-from=prvs=14358afca=alistair.francis@wdc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=wdc.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=wdc.com header.i=@wdc.com header.b="FPL569HV"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.b="NF/efJWp"; 
 dkim-atps=neutral
X-Greylist: delayed 66 seconds by postgrey-1.36 at bilbo;
 Wed, 04 Sep 2019 14:07:51 AEST
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NVfH54V8zDqV6
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 14:07:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1567570071; x=1599106071;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=164Yh6rKowta3lflfqZ1HBP+fkFtAA+9Bv2Mle+qbTI=;
 b=FPL569HVsjOCvmVy98tcY25tGnpgqTdhGeuDeFG8geTe4f2dt2Z7d1v6
 ynXetwr5e/Fxvahj/pUpgDJhEiYjEa0gl2uk6XqKCGQRQO7XJPLA7vcFM
 8cyaYw5msUQBD5E8+kr3kFbLEk6rN5WUyfpmomZNewy3GR5qLae/z1/oi
 NqJ6lAEDZOxM26OLITWUonRFgaf9hFwXEu1O45uiEviSEQAQtfPPbv/CY
 TOfZ2DzcueWG+fNNGEE06OXY/DDOe4ET7Mt0HNGgJGmZmBTiSEI1vnpUN
 TbXARIJX9uFOJ3H3Jm7gy9DG7E2VxFAOAKftmZfZs51R5BPS4Ax9UC0Ss Q==;
IronPort-SDR: Eas3l/Jzb9FBP+ZblMRmUKkDnJX0jRqaZv72bAc8QeKPfZb95DG1zxnUE/lthRzNLGKbDoKO09
 ZpDzb8HXfuX+1k8dhnedyo9gMZQeY1AsggBiYTbvpGu2bMGFWSxYeLnjBC2EI8vnaZNvnq6ABP
 pH0VCb0HHQjlKCNmKTwjQK7ST2yHNm9q/0OfG+vaG/EgMAmJKA9CstRA+5zxY0VdUL7kjgy1kr
 Rhbf/6Ra4E2KMkPAmuFXEno/+1Gaxog7CoF8OYX+Ynb5kZ6X5gsiHQvula/uwNKAWtEJB6hJ1d
 Acw=
X-IronPort-AV: E=Sophos;i="5.64,465,1559491200"; d="scan'208";a="224080152"
Received: from mail-sn1nam01lp2050.outbound.protection.outlook.com (HELO
 NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.50])
 by ob1.hgst.iphmx.com with ESMTP; 04 Sep 2019 12:06:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaITRWgCxO016VSR2o0OZAHvLNLwxZ/iHuGMutbDVoOuHi+q5SKYRYr5aemVsfdJ3T/O4zDsrDdOv2Qi1ju82TAK3+QygEafUfeIwAQcKn4Vm1BdniqcVCFQT3qamtIjRX91oiI0P4q4ewstf2MThVKpzeap39WFPad3WZSnDhbPD71ZFDZGSToUMZLBGILirhvF7JI6eDhn0qIfTNDniudeduGDR8ppa36Kd51JRWI8SNYFx1hYDJpaDJ10IU9DsNgaIe4R8w2QOpLowxqvCWZ+oHgO2ESMO8LYdXtYS4E//0rM+W8uwg5SDXSVboz9jF7z0nMLdRJ7cY4ssyTn3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=164Yh6rKowta3lflfqZ1HBP+fkFtAA+9Bv2Mle+qbTI=;
 b=cBeyNiHPbwJlkK80u8qRdQuGNV+OLZl2kOGosyN76zotyaZ+CuF19esSvdq7sQ1tmSP0stBRW+i0DsxpwH8jjdJtoBN5t2jh2QC285v9n0i5gKWlOe02gjYzFM5oSKm4ayllaRjkm3JHryxOHbHzOZgdd5QBWa/dQAf30KNuKFGNPNIs7NgWeT2BY/kcvMnp21N4Sy1TmSRtutj7dyNDaznqKnbDgojD1TYcXVCGmXpa7lNdWKHsDhx/pqyPZKp+RLD5lhyMI44EwiNqv7y0IM1nXv3ovX63SVjS9U7TuVKWzjA3ddcF8sH4CDn+yH+bo8/Cy++fsmufSfBZdfKmeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=164Yh6rKowta3lflfqZ1HBP+fkFtAA+9Bv2Mle+qbTI=;
 b=NF/efJWpJe+PvwlSpD6DzwJM1/k7a3FgA/5yWSG0wYx8djqOTU0hV/kmlSLc9Z15KxquaYrfDmaYuFaWe+MMZVYe5RW3cg5/Z17q0ddkJSW6YkPO8AunDJ9H3sRJ+yGhNT/Oip4mNGZWkqGtbRmExY4vuuOG/E3//IFZ5FzsbYc=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
 BYAPR04MB4741.namprd04.prod.outlook.com (52.135.240.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.22; Wed, 4 Sep 2019 04:06:38 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
 ([fe80::702b:2326:3cee:c07a]) by BYAPR04MB4901.namprd04.prod.outlook.com
 ([fe80::702b:2326:3cee:c07a%2]) with mapi id 15.20.2220.013; Wed, 4 Sep 2019
 04:06:38 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: Khem Raj <raj.khem@gmail.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: RE: [yocto] Build break in the latest openbmc tree.
Thread-Topic: [yocto] Build break in the latest openbmc tree.
Thread-Index: AQHVYrxGh1x5UMnETk+y+elLJi0mX6ca5qdA
Date: Wed, 4 Sep 2019 04:06:38 +0000
Message-ID: <BYAPR04MB49012E6EA2DB6416DA40BAD890B80@BYAPR04MB4901.namprd04.prod.outlook.com>
References: <038f49d9-099e-dabd-2957-d31e7b8bbf41@linux.intel.com>
 <628d5b4c-63d4-78b6-83d8-1781cbc86e0f@linux.intel.com>
 <7694CCA3-89BD-44FE-90D1-99569476E980@fuzziesquirrel.com>
 <fbcfc988-687f-55ad-1ca9-ace092f09a99@gmail.com>
 <68bddbec8c08cbd9d31f561222bb3afde814a94b.camel@fuzziesquirrel.com>
 <9e7fa5a8-3ac4-a187-e878-2e6a24b1713d@linux.intel.com>
 <6C9B290B-77CA-4324-9480-891F0DC1EB7D@fuzziesquirrel.com>
 <8d75f35e-fb35-7b7e-7945-f212a9519bce@gmail.com>
In-Reply-To: <8d75f35e-fb35-7b7e-7945-f212a9519bce@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [2601:646:8e00:37b2:a8b0:eeeb:1562:9bcc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0712ad7c-9227-4034-14c8-08d730ed4906
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR04MB4741; 
x-ms-traffictypediagnostic: BYAPR04MB4741:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR04MB4741BD39550E6D93589E29A590B80@BYAPR04MB4741.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(13464003)(199004)(189003)(31014005)(54094003)(66476007)(66556008)(64756008)(66446008)(316002)(4326008)(229853002)(966005)(76116006)(66946007)(25786009)(86362001)(14444005)(53936002)(5660300002)(52536014)(478600001)(8676002)(81166006)(81156014)(54906003)(14454004)(99286004)(76176011)(8936002)(6436002)(476003)(6506007)(55016002)(7736002)(305945005)(11346002)(486006)(6306002)(7696005)(6246003)(9686003)(46003)(71200400001)(71190400001)(256004)(102836004)(446003)(53546011)(2906002)(6116002)(74316002)(186003)(33656002)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4741;
 H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jUUyxUAczdt0cufEizC00O+hqpX3CSy+zrjoAczsEZGYIHyoRKefS4so9kUWroj9Beq/1uCksdSNuXTU3DHWcmabrFLU6Q6e6e44JzLug5Es6TVp9FRLV3CDlDAb7lB4O8/IJ+V2MGbhSBujJKUhkcxhmAn7jfxhITEMiW0PLnn1PijQCi4JhIe6sfTSreHvW8FIabS+X0Dqm27gKbqzM4Al9BWPXjYomTXpzyn7i6OtcQZupHPF+bsU7KES2MS+5LZ8usZzb57HX+RP4UAGo23L+fr26fxiKFA/XelNUwudWcvlfNSCLQ8yA2ae4nanUR34QsKOInOUXZQkvHM3Y1IVsyopj3Vk8BQbfVH1oEJdEaSeXEKJqeZ32hdezLWQTffTgvhhJWctXYN5dwBGqImLSM7uT2Rc+1jXvhA2pD8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0712ad7c-9227-4034-14c8-08d730ed4906
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 04:06:38.5363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bnrAsoSXECRENxvdJr4UmhX0y9pp9XZ35sGp4wmdaf6+zBkmN9tgu7zxx5gny3ebNB9oHus/YIFkHz6OrWdUlTMoQgUoU5JXb5BKuVRVN7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4741
X-Mailman-Approved-At: Thu, 05 Sep 2019 08:56:45 +1000
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
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, akuster808 <akuster808@gmail.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCAzIFNlcHRlbWJlciAyMDE5IDY6MDEgUE0NCj4g
VG86IEJyYWQgQmlzaG9wIDxicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+OyBKYWUgSHl1biBZ
b28NCj4gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20+OyBBbGlzdGFpciBGcmFuY2lzIDxB
bGlzdGFpci5GcmFuY2lzQHdkYy5jb20+DQo+IENjOiB5b2N0b0B5b2N0b3Byb2plY3Qub3JnOyBP
cGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+Ow0KPiBha3VzdGVyODA4
IDxha3VzdGVyODA4QGdtYWlsLmNvbT47IEphbWVzIEZlaXN0DQo+IDxqYW1lcy5mZWlzdEBsaW51
eC5pbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbeW9jdG9dIEJ1aWxkIGJyZWFrIGluIHRoZSBs
YXRlc3Qgb3BlbmJtYyB0cmVlLg0KPiANCj4gDQo+IA0KPiBPbiA5LzMvMTkgNTozNiBQTSwgQnJh
ZCBCaXNob3Agd3JvdGU6DQo+ID4gYXQgNToxNiBQTSwgSmFlIEh5dW4gWW9vIDxqYWUuaHl1bi55
b29AbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4gPg0KPiA+PiBPbiA4LzI3LzIwMTkgNTowMCBQ
TSwgQnJhZCBCaXNob3Agd3JvdGU6DQo+ID4+PiBPbiBTdW4sIDIwMTktMDgtMjUgYXQgMTA6NDkg
LTA3MDAsIGFrdXN0ZXI4MDggd3JvdGU6DQo+ID4+Pj4gdGhlIG1ldGEtc2VjdXJpdHkgbGF5ZXIg
c2hvdWxkIGJlIGZpeCBub3cuDQo+ID4+Pj4NCj4gPj4+PiBwbGVhc2UgdXBkYXRlIGFuZCBsZXQg
bWUga25vdyBpZiBub3QuDQo+ID4+PiBUaGFua3MgQXJtaW4hDQo+ID4+PiBKYWUsIEkndmUgcHVs
bGVkIHRoaXMgaW50byBPcGVuQk1DLsKgIENhbiB5b3UgZ2l2ZSBpdCBhIHRyeT8NCj4gPj4NCj4g
Pj4gVGhhbmtzIEFybWluLCBCcmFkIQ0KPiA+Pg0KPiA+PiBJIHRyaWVkIGl0IHVzaW5nIHRoZSBs
YXRlc3QgdHJlZSBhbmQgY2hlY2tlZCB0aGF0IHRoZSBidWlsZCBicmVha2FnZQ0KPiA+PiBoYXMg
Z29uZSwgYnV0IGEgbmV3IGlzc3VlIGhhcHBlbmVkIHdoaWxlIGl0J3MgYnVpbGRpbmcgJ3FlbXUt
bmF0aXZlJy4NCj4gPj4NCj4gPj4gfCBFUlJPUjogRXhlY3V0aW9uIG9mDQo+ID4+ICcvaG9tZS95
b29qYWUvd29ya3NwYWNlL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsveDg2XzY0LQ0KPiBsaW51eC9x
ZW11LW5hdGl2ZS80LjEuMC1yMC90ZW1wL3J1bi5kb19jb25maWd1cmUuMjM5NicNCj4gPj4gZmFp
bGVkIHdpdGggZXhpdCBjb2RlIDE6DQo+ID4+IHwgRVJST1I6IHVua25vd24gb3B0aW9uIC0tZGlz
YWJsZS1saWJzc2gNCj4gPj4NCj4gPj4gU28gSSBtYWRlIGEgcGF0Y2ggdG8gZml4IHRoZSBuZXcg
aXNzdWUuDQo+ID4+DQo+ID4+IC0tLSBhL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS5pbmMNCj4gPj4gKysrIGIvcG9reS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LmluYw0KPiA+PiBAQCAtMTM3LDcgKzEzNyw3IEBAIFBBQ0tBR0VDT05GSUdbY3Vyc2VzXSA9DQo+
ID4+ICItLWVuYWJsZS1jdXJzZXMsLS1kaXNhYmxlLWN1cnNlcyxuY3Vyc2VzLCINCj4gPj4gwqBQ
QUNLQUdFQ09ORklHW2d0aytdID0gIi0tZW5hYmxlLWd0aywtLWRpc2FibGUtZ3RrLGd0ayszIGdl
dHRleHQtbmF0aXZlIg0KPiA+PiDCoFBBQ0tBR0VDT05GSUdbdnRlXSA9ICItLWVuYWJsZS12dGUs
LS1kaXNhYmxlLXZ0ZSx2dGUgZ2V0dGV4dC1uYXRpdmUiDQo+ID4+IMKgUEFDS0FHRUNPTkZJR1ts
aWJjYXAtbmddID0gIi0tZW5hYmxlLWNhcC1uZywtLWRpc2FibGUtY2FwLW5nLGxpYmNhcC0NCj4g
bmcsIg0KPiA+PiAtUEFDS0FHRUNPTkZJR1tzc2hdID0gIi0tZW5hYmxlLWxpYnNzaCwtLWRpc2Fi
bGUtbGlic3NoLGxpYnNzaCwiDQo+ID4+ICtQQUNLQUdFQ09ORklHW3NzaF0gPSAiLS1lbmFibGUt
bGlic3NoMiwtLWRpc2FibGUtbGlic3NoMixsaWJzc2gyLCINCj4gPj4gwqBQQUNLQUdFQ09ORklH
W2djcnlwdF0gPSAiLS1lbmFibGUtZ2NyeXB0LC0tZGlzYWJsZS1nY3J5cHQsbGliZ2NyeXB0LCIN
Cj4gPj4gwqBQQUNLQUdFQ09ORklHW25ldHRsZV0gPSAiLS1lbmFibGUtbmV0dGxlLC0tZGlzYWJs
ZS1uZXR0bGUsbmV0dGxlIg0KPiA+PiDCoFBBQ0tBR0VDT05GSUdbbGlidXNiXSA9ICItLWVuYWJs
ZS1saWJ1c2IsLS1kaXNhYmxlLWxpYnVzYixsaWJ1c2IxIg0KPiA+Pg0KPiA+PiBCcmFkLA0KPiA+
PiBQbGVhc2UgYXBwbHkgdGhpcyBjaGFuZ2UgaW50byB0aGUgcWVtdSByZWNpcGUuDQo+ID4NCj4g
DQo+IHRoaXMgd2FzIGludGVudGlvbmFsbHkgaW50cm9kdWNlZCBpbiBbMV0gYWx0aG91Z2ggY29t
bWl0IG1lc3NhZ2UgZGlkIG5vdA0KPiBtZW50aW9uIGFib3V0IGl0IHNvIGl0IGNvdWxkIGJlIHVu
aW50ZW5kZWQgY2hhbmdlLCBzbyBJIHdvbmRlciBpZiB0aGVyZSBpcw0KPiBzb21ldGhpbmcgbW9y
ZSBnb2luZyBvbiwgaXMgdGhpcyBwYWNrYWdlY29uZmlnIGVkaXRlZCBieSBzb21lIG90aGVyDQo+
IGJiYXBwZW5kcyBmcm9tIG90aGVyIGxheWVycyBpbiB5b3VyIHNldHVwDQo+IA0KDQpJdCB3YXMg
aW50ZW50aW9uYWwgYXMgUUVNVSBub3cgdXNlcyBsaWJzc2gyLiBTb3JyeSB0aGF0IEkgZGlkbid0
IG1lbnRpb24gaXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQpBbGlzdGFpcg0KDQo+IA0KPiA+
IEhpIEphZQ0KPiA+DQo+ID4gUGxlYXNlIHNlbmQgeW91ciBwYXRjaCB0byBPRS1Db3JlLg0KPiA+
DQo+ID4gRldJVyBJIGFtIGFibGUgdG8gYnVpbGQgcWVtdS1uYXRpdmUgd2l0aG91dCBpc3N1ZSB3
aXRoIE9wZW5CTUMNCj4gPiA5M2VlOTgwZWQ5IGFsdGhvdWdoIEkgYW0gbm90IHVzaW5nIG1ldGEt
c2VjdXJpdHkuDQo+ID4NCj4gPiB0aHggLSBicmFkDQo+IA0KPiBbMV0NCj4gaHR0cHM6Ly9naXQu
b3BlbmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRkZWQtDQo+IGNvcmUvY29tbWl0Lz9pZD01MGE3ZGVj
OTU2MTgwODA5NjJlNTZmZDM0N2Y1MDVlNjkxYjdhZDZmDQo=
