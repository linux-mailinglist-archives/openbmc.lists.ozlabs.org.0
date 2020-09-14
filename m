Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D10A26844F
	for <lists+openbmc@lfdr.de>; Mon, 14 Sep 2020 08:00:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqbL85Q3NzDqTk
	for <lists+openbmc@lfdr.de>; Mon, 14 Sep 2020 16:00:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=sumanth.bhat@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=mATcUZbw; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqbKK4ydHzDqTG
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 15:59:13 +1000 (AEST)
IronPort-SDR: a1JGpaA23y0HyF5Np2wCl/N9Ke4cirSs2YsVSh/g5GdY/MYHIHKc7Mfi/ikQ72PF+f30vWAACi
 HMS9KdgzgjYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="177088056"
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; d="scan'208";a="177088056"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 22:59:10 -0700
IronPort-SDR: LVyQhvnEKk7gjeuriZfdQlG69UNbzCEoxfRycLs4uKdppQs/KhKLmmhi1Bq4crVbfipa8wdcFj
 ye/oSWFh4oYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; d="scan'208";a="482209669"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 13 Sep 2020 22:59:10 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 13 Sep 2020 22:59:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 13 Sep 2020 22:59:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 13 Sep 2020 22:59:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgaDBactWRw0BM0EbxEVvQ5mDRkAmVcxULIPz1HSI5euhKnCrCnGX1Igo1MxG1zz4lc+InNfjWtwHuRr5iuXv+H8fu+SdT7SuCFv0CWR+y6E3tRZHZlZNCysR92D9ovOI8utXNlL3rjP7WIHwipFQO+z/MXweSG9Vki40OlRFFku7AafN2iL5iMyozNo+YVIT02sICSP6xiJWCwY3UnJjEpI0d6Ybag+LV9z6dnSTzI81Qm/XSVy45U4nLtfhhkx4Kl9cSBvjfKvJsLJOeL3Qv+MstN/WRzxnxLmVtXqy3OvH6n0s2E3sPgrALY9QuS6MCY2isXYoxMv7UoSIH8ORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mq4UH4CasjJNUd+k1BeUWn5Sa2IxoN/Tas8Rh75d2Us=;
 b=ZEL6zmXcv8uxQ+5NtUqFT7Fqe99ylj4748pn0Vh0n0BGWaGODY9LcUesAxYgFPlKZonRcZWDTFQ3uWRX+K182jjiwl1fdaP9T2mChqrjzEQe5GkfGs7Ieqh8ekFGF8V1s2UTnRG1m+E3QpaDTf7sFkL5HZQIKAIuzu9l3DIOX4vQD53et6hmQ/amUqrlhVA31sziNgPJU8BYHDGcJ0KMEHeFc3N9xNaZzkB5T/ahJlkNt85R4K7P+EXQKO/mfNygEFN632JKl9SjZvUMrA4PcWNBXYPSHX139O6dz4g12NbfVY9yjZU4NOp031GIUjBGxA8rFKRt4frBDpTN40RR9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mq4UH4CasjJNUd+k1BeUWn5Sa2IxoN/Tas8Rh75d2Us=;
 b=mATcUZbwRZGVVZyDId/0uiGziLKdQzJsfbK57ZDe8UWodv7r7HOCVNmEO04ch+rMPs+fS+JdzMPaEAoTHKo5auPz0fIopXDpBXlT2kJbDSrcqbi+5PCtcknYcwpMFnVHmsD1Mc56hP3HOthN741UDXvBY59wmcAMjFE5Ik+AcBA=
Received: from MWHPR11MB1312.namprd11.prod.outlook.com (2603:10b6:300:2b::15)
 by MWHPR11MB1853.namprd11.prod.outlook.com (2603:10b6:300:112::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 05:59:07 +0000
Received: from MWHPR11MB1312.namprd11.prod.outlook.com
 ([fe80::9098:94d5:9d7a:1926]) by MWHPR11MB1312.namprd11.prod.outlook.com
 ([fe80::9098:94d5:9d7a:1926%3]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 05:59:07 +0000
From: "Bhat, Sumanth" <sumanth.bhat@intel.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, Andrew Jeffery
 <andrew@aj.id.au>, "Winiarska, Iwona" <iwona.winiarska@intel.com>, "OpenBMC
 Maillist" <openbmc@lists.ozlabs.org>
Subject: Today's OpenBMC PMCI WG 9/14/2020 meeting - cancelled
Thread-Topic: Today's OpenBMC PMCI WG 9/14/2020 meeting - cancelled
Thread-Index: AdaKXCINgpa7/HDrQmyXAgSDNpbWHg==
Date: Mon, 14 Sep 2020 05:59:07 +0000
Message-ID: <MWHPR11MB1312EA380E52020CFD68129386230@MWHPR11MB1312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [106.66.143.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df9a9357-2bb4-46e5-344b-08d858734add
x-ms-traffictypediagnostic: MWHPR11MB1853:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1853A67DCEE84B49DCD37C7786230@MWHPR11MB1853.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z7lnuvdD52uqgcWjTVg6n2fDlGiXYFG9vCCn4eycdMFPVhhDQrOPteZKpRCk14FNImg7++bm08DyA0wSkiCcncRaXeq5BJouWNXMrObk50H5QzGXBiO77Dax1Mz29DVA3mFTP9K6b3oqu8f7fsB1R5lAdkM45mXfbMYsGcQAvX/jSGayG2oPJk1TfhNeqzQfKc6zqln+r3lK4b+SgtnaxWqrNVzeO5uvLZSpHeTFqBShrehwB9Px4gMq2s9BURTqvlDbsLXXfag09f4CzsTUbcMyYIO/5pRgd2+5NOKEZ3OLsHYIJTOUof3IVC8ZSfWMAHeGSN81pfH+GW9Fh23fFg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(110136005)(478600001)(2906002)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(558084003)(33656002)(52536014)(8936002)(8676002)(55016002)(9686003)(71200400001)(186003)(26005)(316002)(7696005)(5660300002)(6506007)(55236004)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: YRVezbnQcoZkVrYG9mfJPJU6jN60ArzNhH9KDGcALSosN313ehMv4fNexNFZvggkpk48VNulm9RCcFzQlLFsH5FFwSLbET76LlIRnLUswPhmZcytKbEwO0GCL/bsHdP29HRCjWtostaRGYt2xq727St3N7EyEIJ103Hs7TdOVjV8DK11OlXokgD0Uoi9Pp25FmVPzw1WxAHHeSgyr2xIauGidH4bkSCM2wqhJGi9ifbeFHsbIm2MSeMpnT9jhCXJ6sioNZcfjpNLO6QPDfe38LpPeBGWKAJwVbi7Fp7NWsjMokDNpWLGDXA5hYZ0Hv2v5C5/oZ/AfnyWgTzUC0Hr0+EwRVYszfL+AhFRLYK4EiC/5oW7YsFiZPElhA5GnNmOWi1SmqBHZY9bxz/kIKkf6u76Z36/85dDMbfVaLcXeAeaP7MEp3RLODcQNBRyUIUMYEz6bBL6IY1sIOlaf4nxLd3/kpGxP+7G9ah1mGgUQJMzcGkRgGVi9hrVwErCeGYVE0sBViU6L1HXejTV9eVYNC8mjksHbwCyNeRi1xboz1VyWEFBDyk7B+YV4Ty9+7lyoeLgcMtjbuybFqNV2SWfVaHCAD+rTnVWm1B6W2aRK5EUI86dZvGlLxrhvIBgvyxvYC3Oi9p0rN3Y5etaeMYd0Q==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9a9357-2bb4-46e5-344b-08d858734add
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 05:59:07.2789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RacbkXiHZva1GMJ1T8cKxoO8HtTVQl+iv4Ol0YVs+X6nl30/NNj/b03PyAgLZuaOAWtA/76dY/SSIKZ8fZKqJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1853
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgYWxsLA0KICAgIFRvZGF5J3MgT3BlbkJNQy1QTUNJIFdHIG1lZXRpbmcgaXMgY2FuY2VsbGVk
IHNpbmNlIHNvbWUgb2YgdXMgYXJlIG91dCBvZiBvZmZpY2UuDQoNClRoYW5rcywNClN1bWFudGgN
Cg0KDQo=
