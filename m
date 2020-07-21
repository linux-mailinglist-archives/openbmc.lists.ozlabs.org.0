Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 854492286D5
	for <lists+openbmc@lfdr.de>; Tue, 21 Jul 2020 19:11:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB4r92Q7nzDqJS
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 03:11:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=L0TvnHeQ; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB4py4ZgFzDqJP
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2020 03:10:12 +1000 (AEST)
IronPort-SDR: o+zab+QJvV8XvmOVRB5fCSrLEOA6c+lNaUL0NT2VUi9EJJnb/IM018b0rbVgF4ofoI62X+1hAV
 6ZC8JZtG11wg==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="149348301"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="149348301"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 10:10:08 -0700
IronPort-SDR: oDfiv1O9pRkKc37xRPB1gE9mopolVUR3ReP0z8GPUkg/PieHXsLwWQVxfa0EvzeA/z0F24c68T
 gAbgplmpp4Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="326432886"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Jul 2020 10:10:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 21 Jul 2020 10:10:07 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 21 Jul 2020 10:10:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 21 Jul 2020 10:10:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gs1ANwWGmKOyTqeeIKLEmnUciGBeuw7X9516DBxKwXcnM8o+I8b0xjw3aPSBdtvRRmzh7pydry2BArvnRnd0YSiYilx2eqVRsnJ+kjYmmbDtrhQDDUEcIPXefR2Smy12i9gSgh6i6qD8kuseZcWhZcrSixVTQ/OFX/FZLSMWI3CdjxgAoJBwJIhNMwEV4oE3B4s+E/7lTEagqVIcrCO0qH7t652IdxJC6YFP9cB2+S9bpS6gIlLF01gMYuovZORt/iuD95X5vtXmTG3IQ5PqLiRU7UY6AO7iDymdqLq5yvKHT/sIm+Qq6iatJPwF7Vr55LBfO0fKA4UmOW2P9HaxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zZ9gX/LalSv/SUWUodnu8UsszfFn1Pc2BCeqwKAwoE=;
 b=IvLIKkXIpsvy4Yi3C/Uee7tHiLOhx9xyhng9BAW21aYylGyUpBH1z6Xde5J4Hj3TzavGqEVh0kFc7nM/B2LuUQZ6+Zf3Mhuvrp1RzbrQ5FV90wQrtvAuMWVKetOv6MxXvpJt0/04yQZw2K7hqIZMCAyXoQAE9x6TUukpLS/kIB0XD2fO5NXJzbCecgzCehu/GDegvNKNjghDSIgdnC72zBLSU0bh2exytHOF0LpWzvk5yKJn1h2MHtZ3j3Ko2h3LMbwQ+DwOxn7YKBCrKANnGi+/gcwJ3Wg7DxONMuVv0HAaYEtQ9HpqU8itf32yiSUyrxt/xfWQZJW0AZ+i730Qsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zZ9gX/LalSv/SUWUodnu8UsszfFn1Pc2BCeqwKAwoE=;
 b=L0TvnHeQWkvG4N5GJDSAtp51NuJC/Bvk4Apl0VrHKMGIbeBUP0E7xYvg+KFtP3B1POdOt3WmeeSTB4jUvNR8djJviltl4nszjaj5vC8DM8pMyZLfToCRjR+RSQT6uMRMFw9cAD9I3D9nS7yljVximHkimUzBTzRu5IDn797aFGs=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM5PR1101MB2137.namprd11.prod.outlook.com (2603:10b6:4:50::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Tue, 21 Jul
 2020 17:10:05 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::c42:f20f:e1aa:3376]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::c42:f20f:e1aa:3376%7]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 17:10:05 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: Manikandan <manikandan.hcl.ers.epl@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: add multi-host support in the phosphor-post-code-manager
Thread-Topic: add multi-host support in the phosphor-post-code-manager
Thread-Index: AQHWXq+mhza35ZDnykiDwP2psifYNqkSRKOw
Date: Tue, 21 Jul 2020 17:10:04 +0000
Message-ID: <DM6PR11MB441079DE8A76ECF6C35E185094780@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <20200720160013.GB17117@cnn>
In-Reply-To: <20200720160013.GB17117@cnn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.11.44.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b598021-32b6-4cc4-4903-08d82d98e99c
x-ms-traffictypediagnostic: DM5PR1101MB2137:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB2137AD8DCD5A4C1EB24C333594780@DM5PR1101MB2137.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ui8Se4QPj6Cs8/2FmwBDKf2mpsvWdw8kEkeFE6biifFnOkY9DVTDwkYLwNh9/WS4sjoJlzWri0BcOB5FnBJspB7c9De7SywuB97xXpYuhA2o6FG0JiQB1I5nILy/smjZsgbP8Le2/aiE8CNtWN6w9UiBErjJgrRjbd0PBTbfoah1QEUD03PHMDhhqU2NQauWUzYcI+vY5624L3qGSCubMLqdSfG9asJVFN7sK4dXtb3uasW+mgqXXEaheNcHCMzSVq/8bSM7d/1UOwLTrJ7/eGB6nqBc2VBVmtSrh04EE5YaqJNazct6cnE8yaq/4UwoLJq/80JddqZCS7k6CcIQVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(19627235002)(4326008)(110136005)(478600001)(83380400001)(54906003)(8936002)(9686003)(316002)(64756008)(5660300002)(2906002)(66476007)(66556008)(66946007)(66446008)(76116006)(8676002)(7696005)(55016002)(186003)(26005)(33656002)(52536014)(6506007)(53546011)(71200400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: SS0V8YeJlVyB5je/RLwg64EuPYA/Q8k8lcncnNsec/4kjD+Lab4h+qfhXpl3h6RltkYS0lBV2EfjcZSHYqZBh4BVT8/4tbBE9c8iGDZwpJ1m1leQqoTi/D/FmTmCht5S8qWN2OOtQG38OouR4Pf9Sq/DbleLfkWyi5K7Bjie1bLGZ/kZWwnJv0cE3p8/KeMOcZLzRtg4I+PdUIruj+v/y5PL0HhaS5psY4odujoVTfoD8CIRcpqAz/QJvQBJPArNqIZ4z/XgARwK/CJtaC1RJvhNwP5AJido9tGkzzsRTOvlDu3rrftt2W9SL6yNF3koQSQ2e6nlRmob/9ac7ta4jsThskVF85wSD4Nu0VR0FRyxkRQpGvEwPFQ6CmVd5N57Y3FPd3wGwqfs6qv5Gf7jIwipEf73MQ0wwIcuHPTCmrPF9jjP608hexoDEUk1BGevzhN5M/ijDZrU2PaCXY1ia8nL3M1eFFtK/8fBpkQot4c=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b598021-32b6-4cc4-4903-08d82d98e99c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 17:10:04.8109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: co09zGgbY/P76bH4ba4N+X5nFvIZYjUW3tciVxeY+iyI7rkSGBE2TItl38jDp2POJZ6hQmz/DBEx/kYX22iHTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2137
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
Cc: "Wang, Kuiying" <kuiying.wang@intel.com>,
 "velumanit@hcl.com" <velumanit@hcl.com>,
 "manikandan.e@hcl.com" <manikandan.e@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I would think that one process to handle all post-code is a cleaner design.=
=20

-----Original Message-----
From: openbmc <openbmc-bounces+zhikui.ren=3Dintel.com@lists.ozlabs.org> On =
Behalf Of Manikandan
Sent: Monday, July 20, 2020 9:00 AM
To: openbmc@lists.ozlabs.org
Cc: Wang, Kuiying <kuiying.wang@intel.com>; velumanit@hcl.com; manikandan.e=
@hcl.com
Subject: add multi-host support in the phosphor-post-code-manager

Hi All,

 We woukld like to get opion on below multi-host support approaches.

Background :
------------
  The Phosphor-post-code-manager supports only host to store/retrieve the h=
ost postcode history.

Approaches:
-----------
Approach 1: << run the multiple process >>

Create and run the multiple phosphor-post-code-manager process to handle ea=
ch host postcode history.

   xyz.openbmc_project.State.Host0.Boot.PostCode
   xyz.openbmc_project.State.Host1.Boot.PostCode
   xyz.openbmc_project.State.Host2.Boot.PostCode
   xyz.openbmc_project.State.Host3.Boot.PostCode

Approach 2: << pass number of host to single process >>

Pass number of host to single process phosphor-post-code-manager to registe=
r dbus object and handle each host postcode.

   xyz.openbmc_project.State.Host0.Boot.PostCode
   xyz.openbmc_project.State.Host1.Boot.PostCode
   xyz.openbmc_project.State.Host2.Boot.PostCode
   xyz.openbmc_project.State.Host3.Boot.PostCode


Thanks
Mani.E
