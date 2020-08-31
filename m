Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C50CD2571A6
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 03:46:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BftN05bFyzDqRt
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 11:46:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=ZY3+tPQl; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BftM46xZxzDqKX
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 11:45:32 +1000 (AEST)
IronPort-SDR: xbwal9e8aPydCJJZ1O7AhMkDkgv74BojTrFhOSMl0eulw3w0lEzDluI5vePy28uCJkl5MEN5Re
 6mizhnkByA0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="221136543"
X-IronPort-AV: E=Sophos;i="5.76,374,1592895600"; d="scan'208";a="221136543"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2020 18:45:29 -0700
IronPort-SDR: +hDOwe1jkcpmQS5tn09BePH+Mgx7z6WAtTWQJhWz1Ay05QZAWsQm3bZiW8yR1twsHYi0bJ/DhD
 LpZquVPtUXGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,374,1592895600"; d="scan'208";a="330551251"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 30 Aug 2020 18:45:29 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 30 Aug 2020 18:45:18 -0700
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 30 Aug 2020 18:45:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX112.amr.corp.intel.com (10.22.240.13) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 30 Aug 2020 18:45:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 30 Aug 2020 18:45:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnSV+c+LQEkb40eNggABOBFlRILHv7fn02D8Bdp/rRIkoctrTVfde1SQMWLbwcqcO4QOKqHLsuQ5TvzqeMwinTteKhYhZiNzf1XHX5OivKalUZkB7lLgH4MEpyrqS/PFKqZ29h+9sNYvGcd1vD5bhviO523bYZQ+ZbQq5HA+WOILw7+rKPG0b+XTK1dsbHEYiNN5aEL1Xt1zGFFpvTaHTLFcelrrtJ6qFO+KxlaifodCi/2DnG2ySAdQM/7bADVCOkVscC5EKmfYW3PZMRye/Le8FnNv0aAW8cd57ecEyz1hbrZb5pf8rB0ElQeZ3aWCn+JA+MJrxfwMspg0laPpaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oUSkHbExHSgmkV8yNQ+kfuCwYjR9cfcImFHMPB5oXE=;
 b=LfUgiBrinzJ2wyR3bCceducg8wRx19O0GtS7aTAniPdXJamgfzIpsaXOGbBWEJK0nj2O/W85C8HDWyXm335ebz82XR8gujcbcwqqLVECC4KjRB5tOv7JD6k33rXL4y99LhPOiKT19TZ4PWpuM84qFY6lYiEwfk/zKpfmk4jTSjIiYnOxpp0pQ93MAj3kzSqbvUhUBsHGIXaSXc+vkEOhaKHwmpU+/ZzHU6Szy2241DCzWke3t8HUFf4pFy2lKnmm1F03W01YiO63TN32G504kH9EYJ8+sHqNHyXrrXR5DIhgzBgvb5Dmya2te0Nw5+dARjc4dZd9WO1F2haaX88hwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oUSkHbExHSgmkV8yNQ+kfuCwYjR9cfcImFHMPB5oXE=;
 b=ZY3+tPQlPn7C2c+6ZgS+GJdbknIz+F7lAbnU2Rh58SGjoSAwKAqm1s7/0EFGNrD1A/0srlnwll2Gi/FvYN8YN5hM9U+cM+GY4S/p9/Yk5EgCUYwZMRuZWKpX0WgbuZiv6jRDQM5mox1tIyduSXOxHzG56iVxiyjq86NMO5X4yb4=
Received: from SN6PR11MB3520.namprd11.prod.outlook.com (2603:10b6:805:cf::12)
 by SN6PR11MB3517.namprd11.prod.outlook.com (2603:10b6:805:dc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 31 Aug
 2020 01:45:17 +0000
Received: from SN6PR11MB3520.namprd11.prod.outlook.com
 ([fe80::d933:53ea:b87a:f917]) by SN6PR11MB3520.namprd11.prod.outlook.com
 ([fe80::d933:53ea:b87a:f917%4]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 01:45:17 +0000
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Need update CI build config for new repo smbios-mdr.
Thread-Topic: Need update CI build config for new repo smbios-mdr.
Thread-Index: AdZ8T8WMWe7UjTu1QQafCbbBYikJpQBJL32AAHDrLbA=
Date: Mon, 31 Aug 2020 01:45:17 +0000
Message-ID: <SN6PR11MB35205154DB67E625EF74388A90510@SN6PR11MB3520.namprd11.prod.outlook.com>
References: <SN6PR11MB35203BE16B23BAD1193FCB9F90550@SN6PR11MB3520.namprd11.prod.outlook.com>
 <5a9a43046be525f9ed5d23bc40eac14d4ed8d53c.camel@fuzziesquirrel.com>
In-Reply-To: <5a9a43046be525f9ed5d23bc40eac14d4ed8d53c.camel@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjYwMWY4ZmEtZjk0Ny00MzdiLTkyM2UtNzRmZjI3Mjc3OTAxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZW5Fb2pzOU12cExFcmVwd3k0YkFqZFpqSVhoMXJOUVFUa3dIbnBzbGZlYjhweTlnVkd4cXM2K21DXC90YUNwWGcifQ==
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none;fuzziesquirrel.com; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [192.55.46.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 331e2adf-5937-42dd-cf1e-08d84d4f8342
x-ms-traffictypediagnostic: SN6PR11MB3517:
x-microsoft-antispam-prvs: <SN6PR11MB3517A5DC7426F6D7A77BBDDC90510@SN6PR11MB3517.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 85t8gbbZU+p95yup4ENEU7uve28K9othctAmerULwe7MR2WAZkZ1jLK5LA+y/bAX2GPEtwsdfcrJ2ECVekCL+uGLwQUfgMx47GIKNyUdbsCqXpbG0d05oMrHtfLZIh9uZYf4WtZodlahtTpn/ystgN43ua0iM7lmKocgkMNkz3IUI8r4F1xvGaO76d/MwfMRCYxu5K24k8UWsTFr0Jb0oo70Hc5ZEs6rnG2o1HM5dz9UkSHZg9DzzxmtAQHfMYQ8UH7GCCl/CrMKmwlKszmZuw+3mbSNccaqtcL+hSgGs1ia6dzAtBDe+Pch48GFar7Dm9Xk5oEtfeHGhk9Fc9Mnh7DRTjPjuuXeu9gugERj/A85uiRDFKblNxFwxl46J1/1he2rFMy3LMxpofhgDqUPNA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3520.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(33656002)(83380400001)(4744005)(478600001)(7696005)(86362001)(8936002)(26005)(8676002)(6506007)(186003)(9686003)(66476007)(76116006)(66946007)(66556008)(110136005)(66446008)(64756008)(316002)(966005)(5660300002)(2906002)(55016002)(71200400001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: LF+qI5PO+z7tSyPIn7MC2yhvErjuUqxoiz4S4zP9ThnAupeCaCeOwWz4MSZwoQJXlmOY+32/p+id+4Ts//JFgWX3ZVODvYfh/ml3zbyAoHXLc2Vnz5R+3v3Vz/eOv1Hp+OeL4XrxUGXyfEi0ue0RDfCqhZxVc/eI6bXmuDSJYXQXcyA5YijEuUlYsxMQj4iEtxGVqOIHbOeuQmcRlvzlG0MXh80abVFTv8+k01/orrjFzOi2KsU3EHuSOBFYx6HDWvh2bNL3bYhoYD7vS/mCiwftWNuoJM2eHnYOt7u5PgVbZjgxtExp0FkXKRtReycYcRFqDqeusgPtcv/NswZdmBomTUIaED1AEeF5N/AyfeVX97Rx+rx/zqlgZeSE7W8EssFTE97+bpUbr0kGPTChjESBh9JYU/Geap6QeR+ZN/LaKiBlr6XDtVbmTRNzRD++/vmgZ9cqMlCC/ltqAnC2hHOltFv9KHAsHkqjJjRwelBibH9ss0exJmMwAccaplEQwYfjMi6wS44lqYMYZrGp1MjczzdPf0+g1P/EW1nokVLD6zH1v0EfRgDqnRBeBI8vJiF9RLbanjlJgjQ2KqRy8KO0AQHvVNivmbJiUsG8FXvYgDCDn1amkiSP+i8xlR1uCjBvC9txGz1Je8/f3LEIvg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3520.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331e2adf-5937-42dd-cf1e-08d84d4f8342
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 01:45:17.1544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pAfTI1nrRnyVNgDghSUUrsR8bslKxd4MtebBHBwO0nuatB6SqLKewwrGooYcn/8dmsWO5+gHqNncFhKoohQncA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3517
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

IEhpIEJyYWQsDQogSSBhbSBzdGFydGluZyB0byBlbmFibGUgdGhlIG5ldyByZXBvIHNtYmlvcy1t
ZHIsIGJ1dCB0aGVyZSBpcyBidWlsZCANCiBmYWlsdXJlLg0KIENJIGJ1aWxkIGNvbmZpZyBuZWVk
IGFkZCBiZWxvdyBkZXBlbmRzOg0KIERFUEVORFMgKz0gIiBcDQogICAgIGF1dG9jb25mLWFyY2hp
dmUtbmF0aXZlIFwNCiAgICAgYm9vc3QgXA0KICAgICBzeXN0ZW1kIFwNCiAgICAgc2RidXNwbHVz
IFwNCiAgICAgc2RidXNwbHVzLW5hdGl2ZSBcDQogICAgIHBob3NwaG9yLWRidXMtaW50ZXJmYWNl
cyBcDQogICAgIHBob3NwaG9yLWRidXMtaW50ZXJmYWNlcy1uYXRpdmUgXA0KICAgICBwaG9zcGhv
ci1sb2dnaW5nIFwNCiAgICAgbGlicGVjaSBcDQogICAgIGkyYy10b29scyBcDQogICAgICINCiAN
CiBodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6LyMvYy9vcGVuYm1jL3NtYmlvcy1t
ZHIvKy8zNjAxMS8NCiANCiANCiBUaGFua3MsDQogS3dpbi4NCg0K
