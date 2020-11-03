Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 018CF2A5A66
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 00:00:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQlcK2vZqzDqLP
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 10:00:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jonathan.doman@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=y0xfOUM3; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQlbP6bgZzDqKq
 for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2020 09:59:20 +1100 (AEDT)
IronPort-SDR: SWU8DJNhTuRyK1dJ7lw/EnZWkf4igvDqO1/RVzc9iv1HlhhBJ6Jkq8b94ANBTrkMPoSMD2/0fx
 eqTSmruJwfTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="148989762"
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; d="scan'208";a="148989762"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 14:59:16 -0800
IronPort-SDR: xkXbDVQfiNcvM+hL8YYP6zoUgWsnPe8oVPwFSxrBWTYPytdb7UmtzJlmVoEbt5GKzWhzfL3KVY
 bWSAbLduI2Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; d="scan'208";a="336671505"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 03 Nov 2020 14:59:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Nov 2020 14:59:16 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Nov 2020 14:59:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 3 Nov 2020 14:59:15 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 3 Nov 2020 14:59:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIMJuO20ikOl0OcZuz2LzlL06x0eDVKDLjJqQoJD0thWRvOrfF6dIP33p+WhjzszSE/ZsxkmzDDzEknTjWOKerO1gLfpdGxJ2QXXy0ioP3HvuUzmakBWu3VZNfOTd0J749RZDcUOJykTDlstzn3B+Xlpw9n1GOT/DfNXrxnytUNEOixyoVBn+LD70/OakBq9SXfQc7nPU93hOZFvFZPb2ehlqKdZMnbXIc+SQfTHa8Ahpbkym6B7vLnHV/zvhG6XiODqKYGs+DmfwWhFS09OhhdFYQOHT/PVv9x0Kim03H7Up2y3oqOCgVFKChNgYvuQyq7r/g8GASTZIMxUxrYPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WucFu09/3+AVpaRYQdCyE+z25OKPmUBaQgHvchsCzl8=;
 b=mZyCYpoIxaXD6eqHh9YJ653G6U4ZXJRG2ZGoVqRQ9Hj2WyB+zUyhuelbW4ZgZl24ZeVIAmlAsjxonzJ2zZC02UGKAX/foxBF1dkfSg1suBO39Z6q6xG6QPkkfNAS5HARr0bdEGeWi4mn3B7k0bq94bKrwheZabfSbtSQ+efXqTJmdLaRxZ/T4bsSw7IuakVC25//ZG0qMeKc7olVHkMXe2AtQLfGyQx+zk5P4gKpmuMwazKWTx0ETQM8TUTbtrN+iQpvmkfOBO6E7kVzFDrTgpbNy1QWXYkLHYPUcELkzP2dCZL1kKKaimywN8YrzGR7nD3Qtjn4/DOXdBDBEbJKTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WucFu09/3+AVpaRYQdCyE+z25OKPmUBaQgHvchsCzl8=;
 b=y0xfOUM3WP0QFhEz2yUu6ZdwFW+/i1H2Imf1dDPQJ7YFLkY2FDufeB7r2R8zr49Z3eFlSfYzHvSY4T9Dg2LLnTl7oYg42Et3psgmbrXDEM9J+XFpGFX3F/6APP0HV1drCp2vUQHobUJuGO//lZethmXS6tI7ELTOdA5evjB/hIY=
Received: from MW3PR11MB4635.namprd11.prod.outlook.com (2603:10b6:303:2c::20)
 by MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 22:59:14 +0000
Received: from MW3PR11MB4635.namprd11.prod.outlook.com
 ([fe80::951f:136f:e4b4:4b4d]) by MW3PR11MB4635.namprd11.prod.outlook.com
 ([fe80::951f:136f:e4b4:4b4d%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 22:59:14 +0000
From: "Doman, Jonathan" <jonathan.doman@intel.com>
To: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "deepak.kodihalli.83@gmail.com"
 <deepak.kodihalli.83@gmail.com>
Subject: Re: Secure boot/signed images and GPL code
Thread-Topic: Secure boot/signed images and GPL code
Thread-Index: AQHWsgXXoiQcKIIA90WjeYOlckVOaKm242wAgAAibgA=
Date: Tue, 3 Nov 2020 22:59:14 +0000
Message-ID: <3c527de22b682210b536859ceefd2bf0eea07913.camel@intel.com>
References: <CAM=TmwWinuWjpNr+NeTXTmPv0wUCCzg5BUKhhR=Rp=mfmma_6Q@mail.gmail.com>
 <20201103205600.GA38269@patrickw3-mbp.lan.stwcx.xyz>
In-Reply-To: <20201103205600.GA38269@patrickw3-mbp.lan.stwcx.xyz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.77]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2c27ae2-d336-443f-b255-08d8804c1604
x-ms-traffictypediagnostic: MW3PR11MB4715:
x-microsoft-antispam-prvs: <MW3PR11MB471546C8B1EEF9BC4E79A9C891110@MW3PR11MB4715.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TSvj9m3fbJlXdbrnfejJAJ41g3tqTkZF+m+Vv2pm5Vcg9O9unm8JZ8PWGK2+5jZdL32ogGNHU6twEyDXrvTZC6qZCA4oPtGAwNPOmv/S6g1+RS03PYffs/43LCMuQWOCR+KpnSnB5n8HfaNTqrRbLQwytcqoMGmrv5ajiEJyjSXSsFs15gOa9R5p/WHedS/u8wHnWk4A0qbczbuvuUXDxKN1EaXXNTSA3q7xICCKO1GMjollBqgMI7GTVefHRbZOeyvq/84s3hjuMT/8r9E56C0gZdyCEY4dthR2vIeSyqrT5qlceVr66FJc+fHBf5B1w38FFm4vQCZnFfBLFfP6Fg7S/CWxMqpSpcZHccoO6C3Q+oOtMjHYMGrLDDjYZ5Rd5Uhf4pUFqC6ts2gi1Fx5UA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4635.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(36756003)(5660300002)(4744005)(66556008)(66946007)(6506007)(2906002)(76116006)(91956017)(4326008)(66446008)(64756008)(66476007)(2616005)(508600001)(186003)(83380400001)(6512007)(26005)(110136005)(6486002)(8936002)(54906003)(86362001)(966005)(71200400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: aamMJmud1n7ZJGvuhas+NMqAst4HvSOK9WU6Gq9vN2z5CLBUUduATWSq1L30fioat1KdHsxYMSEFKf78sHRcuKOyquIDJYro3vtx5Qafn3f32+QQ07u0IvOVsNfRu7CDOL4i9DepWIykclZ0+QsgGLuE6RuBD6gbZfd43RLdY2RlOyH1XikhxKXMCXmmzRtFysW3e3iFX+7xvb8tfmEQts6pSSTFXeWdv7/Hw2S6pPDYh74di19b/P57MsZBW9DJlY3xenuErbsmqgGnr5KTUIl+3GQbzd3loiuxgKWe0Kl2fZOjy8yQ7y9O82hmJNKN+/DRFF3pC5xP70slgn2Dvm41nQy2WAxlxbn/eykORzvDH2WLnMMZ0RmzqduBgZf4ukOktdKyjWFielYDM8eZj6BsyWj//so5N5L2AzikyOELV9ix+tXqvc2J1zMT7LiQqYRRgvXXRLSWuljwRzs8834PFD52O+6rqqncioX3ZRZDApMYh0E1YWNrMK847zH2QGEnlrZob14VMIN1MbeLNiqBQoZ2DZYv/OJOAmR9l7S29ro946PyW0AkGbAD0pxa7wpRYCQfjqbi5sjT2FNYyG4fDJAqjNwjxUnqtckG16IonmjS8cjYAsm5bqcETl9cI8ejtsShlNeheSJ6H/dBRw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CE9C12FBE576C4FBF0BBCF84587052E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4635.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c27ae2-d336-443f-b255-08d8804c1604
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 22:59:14.7345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O0Fsp9A9sfdxXaic3se1nm7cF4InmUXHj7+w7mHD/kHYuCagPcGYQIHVahcGKZhh2kFndqwnS142lWX0REphSoaIwdN2sMU9u4xVhN8zL6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4715
X-OriginatorOrg: intel.com
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
Cc: "cjengel@us.ibm.com" <cjengel@us.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "joseph-reynolds@charter.net" <joseph-reynolds@charter.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

KEFsc28gbm90IGEgbGF3eWVyIGFuZCBub3Qgc3BlYWtpbmcgZm9yIG15IGVtcGxveWVyLikNCg0K
T24gVHVlLCAyMDIwLTExLTAzIGF0IDE0OjU2IC0wNjAwLCBQYXRyaWNrIFdpbGxpYW1zIHdyb3Rl
Og0KPiBJbiB0aGUgY29udGV4dCBvZiBhIHNlcnZlciwgSSBkb24ndCB0aGluayBtb3N0IGNvbXBh
bmllcyB3b3VsZCB3YW50IGENCj4gd2F5IHRvIGRpc2FibGUgc2VjdXJlIGJvb3QuICBJdCBkb2Vz
IHByb3ZpZGUgZmFpcmx5IGltcG9ydGFudCBwcm90ZWN0aW9uDQo+IHRvIHRoZSBpbnRlZ3JpdHkg
b2YgdGhlIHNlcnZlci4gIEJ1dCwgaXQgaXMgdmFsdWFibGUgdG8gbWFueSBjdXN0b21lcnMNCj4g
dG8gaGF2ZSBhIG1ldGhvZCB0byB0cmFuc2l0aW9uIHRoZSB0cnVzdGVkIHNpZ25pbmcga2V5cyBm
cm9tIG9uZSBlbnRpdHkNCj4gdG8gYW5vdGhlci4NCg0KQWNjb3JkaW5nIHRvIG9uZSBhbmFseXNp
cyBbMV0gb2YgdGhlIEdQTCwgdGhpcyBkZXNpcmUgdG8ga2VlcA0KZW50ZXJwcmlzZSBzeXN0ZW1z
IGxvY2tlZCBkb3duIGlzIHdoeSB2MyBjb250YWlucyBsYW5ndWFnZSBkZWZpbmluZw0KIlVzZXIg
UHJvZHVjdHMiLiBJZiB5b3VyIGRldmljZSBpcyBub3QgYSBVc2VyIFByb2R1Y3QgKCJmb3IgcGVy
c29uYWwsDQpmYW1pbHksIG9yIGhvdXNlaG9sZCBwdXJwb3NlcyIgb3IgImZvciBpbmNvcnBvcmF0
aW9uIGludG8gYSBkd2VsbGluZyIpLA0KdGhlbiB5b3UgYXJlIG5vdCBvYmxpZ2F0ZWQgdG8gcHJv
dmlkZSBJbnN0YWxsYXRpb24gSW5mb3JtYXRpb24NCmNvbnRhaW5pbmcgc2lnbmluZyBrZXlzIChv
ciB3aGF0ZXZlciBpbmZvcm1hdGlvbiBtaWdodCBiZSBuZWVkZWQpLg0KDQoxOiBodHRwczovL2Nv
cHlsZWZ0Lm9yZy9ndWlkZS9jb21wcmVoZW5zaXZlLWdwbC1ndWlkZWNoMTAuaHRtbCN4MTMtODUw
MDA5LjkuMg0K
