Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A07E1A4CEA
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:51:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBNl50CgzDqLp
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:51:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=commscope.com
 (client-ip=216.71.142.185; helo=esa6.commscope.iphmx.com;
 envelope-from=richard.schmitt@commscope.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=commscope.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=commscope.onmicrosoft.com
 header.i=@commscope.onmicrosoft.com header.b="cr7YTsM7"; 
 dkim-atps=neutral
X-Greylist: delayed 69 seconds by postgrey-1.36 at bilbo;
 Fri, 23 Aug 2019 00:29:38 AEST
Received: from esa6.commscope.iphmx.com (esa6.commscope.iphmx.com
 [216.71.142.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Dn3k2HLDzDrJP
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 00:29:38 +1000 (AEST)
IronPort-SDR: UZOdgqENc1DxJTvqbZ9s1HS6aKk+BNOogyyIodHgGvV2dMa/Wn+D0i93ZzKYS/3G+2TBmGHt8J
 9o9GuCRvfs4RjdA3i6fvRtS52MfJM+n7wcNF6/0kwq5g7VfoMbf2R4lddJpwWGNod0KlSbvlMK
 WlQOqERTh02RxtTy5cPHGn23X/pnfaiqfOfsT5NM/nq6tJIy2PIko4RIQXQ0ctDCVEMf915MWj
 46qbD0qjsHpxCDHwKFjeE16Wx9cH8JFtEVGZNhopGFEVLlcB1ZIV6g1+sLvAvgs+IwIYo7hpdf
 qMY=
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; d="scan'208";a="29326779"
Received: from mail-cys01nam02lp2058.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.58])
 by ob1.commscope.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 10:28:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bu0qtlgikR/R4dw+Dl1Lu8ff/sIVwU/mEyssubVulJ3I6kMI/ld6ula8gUmh3X83WJeb8owtPC70DeD3s+drGyMrLEp1D5S55Mxa3NZKrEgXQJEcChXQKljJQ6FtSUB+KlsTPvGqv/CcKsM+n6WowHu+OGaM8W5vxeYkVPol9A0n1dLQjmrpgyhTvsWgzKvXed05aKDRoX+Vial8O184FxtBg+9rhHvWHwHL5F+8zdurwy1mk55gC3KfftyeQANeBjJneKb5R2FRQcv/t3sn3ZuH5qGT3NkjeK9TbObQR75h7FKYgGE5SKqAMIFxupDSNKpa7yRebZ6hhBdFlTVrwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7nmvQc1N+w+/qvNvq/EcXvm31F438Hfp7PvjTZM7Vs=;
 b=jcEmgQYi/tZeoGCoN8FuirmRP05FM3GG2gLTmYLmZWmUf183tHLT418GEqPfFrFJw+Pkh+ujTgmXO1pMADHEGKdwon7Q7SGtC5D3TGhrTF9t2/cnP5W923Buw6IuwTELh1veaNp/XDLTu15lpdmWxKgDLLlMKDMsdnMu+Vt5Cmj0B8Qtyh1xO+65bVPehS46bTYp5eIcE7DIf1wMwX8mBLms+txy9vcPM6Dn2/KHVPfQ4uVgJjoAGkXX3UFitmwhNNQHZkAMSdj7cr/3DR18IXnuKT5B3X+hqEul96li5z/Yy+SqZCJk27+wGMRU/Dblz7TsUyuudK4MNv+AmhjfVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=commscope.com; dmarc=pass action=none
 header.from=commscope.com; dkim=pass header.d=commscope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=commscope.onmicrosoft.com; s=selector2-commscope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7nmvQc1N+w+/qvNvq/EcXvm31F438Hfp7PvjTZM7Vs=;
 b=cr7YTsM7JSSaQ/1dGKmO/3Nc3alXnm4u1bHXCCQlRwkcBh6+NNIXSWNl/bWgkcni6/9DmGAhtg8I/n98GdocWC18C1jmtrOVQppjv0J0HEmPdE+w8BonEhs8u6gxjHdTNNrWh+dUtKCgfpwE+yMBmXbWG64BI8HGbDh98wwLHdI=
Received: from MN2PR14MB2655.namprd14.prod.outlook.com (20.178.244.155) by
 MN2PR14MB4094.namprd14.prod.outlook.com (52.135.49.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 14:28:23 +0000
Received: from MN2PR14MB2655.namprd14.prod.outlook.com
 ([fe80::f45c:5f79:b24c:391]) by MN2PR14MB2655.namprd14.prod.outlook.com
 ([fe80::f45c:5f79:b24c:391%7]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 14:28:23 +0000
From: "Schmitt, Richard" <Richard.Schmitt@commscope.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, "yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: RE: [yocto] assembling lvm disk images
Thread-Topic: [yocto] assembling lvm disk images
Thread-Index: AQHVWPVn+/re73u+P0GdxSbCqs9o7qcHOXHg
Date: Thu, 22 Aug 2019 14:28:23 +0000
Message-ID: <MN2PR14MB265597F84291C8F0D51C00FDE6A50@MN2PR14MB2655.namprd14.prod.outlook.com>
References: <38CEEC26-E746-42DE-B4AD-24BCB29ED326@fuzziesquirrel.com>
In-Reply-To: <38CEEC26-E746-42DE-B4AD-24BCB29ED326@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Richard.Schmitt@commscope.com; 
x-originating-ip: [198.135.207.104]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd0c925a-ad04-4abb-d6e4-08d7270cfd11
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR14MB4094; 
x-ms-traffictypediagnostic: MN2PR14MB4094:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR14MB4094784329D401EFE1DC0851E6A50@MN2PR14MB4094.namprd14.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(199004)(189003)(13464003)(99286004)(2501003)(5660300002)(478600001)(33656002)(102836004)(186003)(7736002)(81156014)(8936002)(55016002)(14454004)(76176011)(446003)(81166006)(966005)(52536014)(8676002)(486006)(26005)(7696005)(2906002)(6436002)(3846002)(305945005)(6116002)(9686003)(6306002)(11346002)(5024004)(71200400001)(229853002)(53936002)(256004)(25786009)(74316002)(4326008)(6246003)(476003)(316002)(76116006)(66946007)(66556008)(86362001)(66476007)(6506007)(53546011)(110136005)(66446008)(71190400001)(64756008)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR14MB4094;
 H:MN2PR14MB2655.namprd14.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: commscope.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YCSiHN4b4Qlu4cWi/Zra1x0JrXOttqQai58G0WAmVWJaJebnPN/EFmA6JxVFvm7Kj9BdqGb/ZwNv2fdTlXzKFHqNoDgUquU2JtUQxXRgMoeDx2KrYUXzVJflQdimDpIwknY+fn7CdfT5785IOJH+SzGUnWFWuHhtiFPs0QJ4VS8MsDmaAQ3n7e3fmi1x1/vDdNY48AhyR0U7ijKI0NLOdx2Oi7VGsgx89ZEaAWHApDpUAroY8eCNrO+D1YwwjnKAJWXJ2oa3DxNcRL4WvhCNDkLPjsVzj4e8XppSgr2LcgYFtf0dnThY86gOugm3Und3yp4rduSQ0dl/RC2lma0me+qwnMGjaUJM4m5x5Rpz85HY7uDetrZ/HwfOLI/pDIqUNbHlgaUWwPDpQ3F7RMAsb62j6FAPpJ+S+lGEKkm/QeI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: commscope.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0c925a-ad04-4abb-d6e4-08d7270cfd11
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 14:28:23.3780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 31472f81-8fe4-49ec-8bc3-fa1c295640d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K9FEEiLlTAGu8nLBvh1+wR8N7pA3VN0bRH/zR7VPEzhMrOfQqYuLV33IQsl26o5X00qsbArfzbaGVj4NItesRsr09U3sO6GHlm5hicLyRvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR14MB4094
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Tm90IHN1cmUgdGhlIHR5cGUgb2YgbHZtIHlvdSdyZSB0cnlpbmcgdG8gdXNlLCBidXQgd2Ugc3Vj
Y2Vzc2Z1bGx5IGJ1aWxkIGEgZG0tdmVyaXR5IHJvb3RmcyBvZmZsaW5lLiAgDQoNCkl0IHByb2Jh
Ymx5IGlzIHNwZWNpZmljIHRvIHdoYXQgdHlwZSBvZiBsdm0geW91IGFyZSB1c2luZy4NCg0KUmlj
aA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogeW9jdG8tYm91bmNlc0B5b2N0
b3Byb2plY3Qub3JnIDx5b2N0by1ib3VuY2VzQHlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBP
ZiBCcmFkIEJpc2hvcA0KU2VudDogVGh1cnNkYXksIEF1Z3VzdCAyMiwgMjAxOSA5OjEzIEFNDQpU
bzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPjsgeW9jdG9AeW9j
dG9wcm9qZWN0Lm9yZw0KQ2M6IEFkcmlhbmEgS29ieWxhayA8YW5vb0B1cy5pYm0uY29tPg0KU3Vi
amVjdDogW3lvY3RvXSBhc3NlbWJsaW5nIGx2bSBkaXNrIGltYWdlcw0KDQpNZXNzYWdlIHJlY2Vp
dmVkIGZyb20gZXh0ZXJuYWwgc291cmNlLiBFeGVyY2lzZSBjYXV0aW9uIHdoZW4gb3BlbmluZyBh
dHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIGV4Y2hhbmdpbmcgaW5mb3JtYXRpb24uDQoN
CiANCg0KRG9lcyBhbnlvbmUgaGF2ZSBhbnkgZXhwZXJpZW5jZSB3aXRoIGFzc2VtYmxpbmcgYW4g
bHZtIGRpc2sgaW1hZ2UgZnJvbSBhIGJpdGJha2UgdGFzaz8gIE15IG5haWl2ZSBhcHByb2FjaCB0
byB0aGlzIHdvdWxkIGJlIHRvIGludmVudCBhbmQgaW1wbGVtZW50IGFuIElNQUdFX0ZTVFlQRSB0
aGF0IGJ1aWxkcyB1cCB0aGUgaW1hZ2UgaW4gYSBkb19pbWFnZV9mb28gdGFzay4NCg0KQnV0IHRo
ZSBMVk0gdXNlcnNwYWNlIHRvb2xzIGRvbuKAmXQgZG8gb2ZmbGluZSBtb2RlIHNvIHRoaXMgc2Vl
bXMgdG8gcmVxdWlyZSAgDQp0aGUgdXNlIG9mIHRoaW5ncyBsaWtlIGxvb3BiYWNrIGRldmljZXMg
YW5kIHN1ZG8uICBJcyB0aGF0IGEgY2FuIG9mIHdvcm1zPyAgIA0KRG9lcyBhbnlvbmUgaGF2ZSBh
bnkgYWR2aWNlIG9uIGhvdyB0byBkbyBzb21ldGhpbmcgbGlrZSB0aGlzPyAgUG9pbnRlcnMgdG8g
c29tZXRoaW5nIHNpbWlsYXI/DQoNCnRoeCENCg0KYnJhZA0KLS0NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQp5b2N0byBtYWlsaW5nIGxpc3QNCnlvY3Rv
QHlvY3RvcHJvamVjdC5vcmcNCmh0dHBzOi8vc2VjdXJlLXdlYi5jaXNjby5jb20vMTEyLWF2OEVE
SUlJWGJZOGhTaWUxUVh2V3B5bzUwS3FuREtBQzhOYlM5cWdEbjM3aW84WnZfc3VEb0xXOWRXVGpP
ZFlRX19wazY2Y2dzMzlkc3JORU10bE05NmY5bXJDYXR5QkNsZl83ejNrbTFUZGFXdlhLWmFYWXNx
c3pEc2QwN2UwcnZMdzFFTUcwZGFBcEowS0Znc1A2aFFYWUMtZk1oeldOZVdla3VrUkZNSFlBa1Zj
Q1hVUkVHZm05S0dpTHhjVzI2aF9pUkRtNTFJRzJsTjVBODFPdnljc3duZnloc0pvb294WWR4MEhG
cG5xOE95dWNXdkh2QUZHUDl4bHc4UFRBRnRHR2xXVG5OUGNZTm84cHZfLTRXbW9qY3R3TXF4RjB0
aFdKLUg0bGExVVY3X3IweFVCZkJ4NWNwaHBPL2h0dHBzJTNBJTJGJTJGbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZyUyRmxpc3RpbmZvJTJGeW9jdG8NCg==
