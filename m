Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A85484809
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 19:47:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT1nh1S0pz2ynV
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 05:47:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fu2KbxmL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=james.mihm@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Fu2KbxmL; dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT1nC0Dv7z2xsg
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 05:47:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641322031; x=1672858031;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zvDys8AmRH6OZFJGjdPhXE1myVhzZR80TLTzyplnfO0=;
 b=Fu2KbxmL9s5bLflwIcLwJ+XqlpJyzZFnU3SBhUYYhBHUVl/whJghOahE
 d6b2OwuoIWBPNPhgJ0MD78mEu6mzte3TxTLpV98FsGZBosO3Y7BHJp9VK
 QBbMYQe2RnfJT92FZi9hScYLh/vfRoW0/bdMaN0eenPZe10SZqkXDk7+v
 qamvmYE88xwbwFCHzjhUPYie7uy2/3I1waaJwyPSATJ8SIDTeff7VZ6Sr
 aiFaSgh/Nuh0pn995u00xEMkfIZhJDxbsx4IX6etva1o15auHcStX8ayk
 QwV0zv1UUydlXRdP+6nyWCB+HkjeK9H5gg7BtU1PBJoPThsI/PH7rP48x A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="241096559"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="241096559"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 10:46:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="667829694"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2022 10:46:00 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 10:46:00 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 10:45:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 4 Jan 2022 10:45:59 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 4 Jan 2022 10:45:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdialp8q5Zct+5duX4+zwMINgB8728dO5ucM5CpGNuucoh6j2bNe9PQY+elAAAH8VgTZ5tOX+FjldIp9gYlLnMI0NJltJ/Wlb5MLLqEbyxYfwuv4BY2IXO0RN171AhavQ/Zvwc8l0tik98EjSyf1hi7Wmt35uZaOCuy3M5+h0ATsz2GXBvOPmQkq3Dgp+V6r9RICn56LJAsESfAyp5AnkjJpcQV12VYTkcLsQaG0Whf1cw8mYfOOXqUq+EIfSIzCoFwOJNWPCAhZsFbSeCUjBgwG/I8synehmcgORPJmdfqQepHyArlZPyzYtzDBOfNY96/u4kobxwH3v3Yp6aZN+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvDys8AmRH6OZFJGjdPhXE1myVhzZR80TLTzyplnfO0=;
 b=OSXGc9aAZ3H3J4K7hCL5so4FS9QdmI2PwVG+xmUqNx+M25TdphxeIkSqj7J/uw08z6LKi1uEiGKvTz/Fb68WK2fGaVOG+Ms0d43M0RWXQa7TX6JyaX9D8+tbanM5hGpIa+tKjRDhub0khPNEqPFNoLi0Ya12faHV6WAi9prXYrCgAAanoyKz12WmNJDsFabk4mi8/8jOsqu9gYjiTVpujzohW0LVHwu344tyjEmEkpRetzSrnOQRHjAG93i6YZ0hJftTnymy2EyuRLDnYKFDFlC54VeIZyqTkGbn8T2QoBB+skpRKAxcWF2WF92yfIL9c1f6NAmTo92uqei8KjjpbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5638.namprd11.prod.outlook.com (2603:10b6:8:27::13) by
 DM4PR11MB5565.namprd11.prod.outlook.com (2603:10b6:5:39a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14; Tue, 4 Jan 2022 18:45:57 +0000
Received: from DM8PR11MB5638.namprd11.prod.outlook.com
 ([fe80::8576:25de:4179:6116]) by DM8PR11MB5638.namprd11.prod.outlook.com
 ([fe80::8576:25de:4179:6116%3]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 18:45:57 +0000
From: "Mihm, James" <james.mihm@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "hpham@amperecomputing.com"
 <hpham@amperecomputing.com>, "amithash@fb.com" <amithash@fb.com>,
 "yuenn@google.com" <yuenn@google.com>, "gkeishin@gmail.com"
 <gkeishin@gmail.com>, "chen.kenyy@inventec.com" <chen.kenyy@inventec.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>, "chyishian.jiang@gmail.com"
 <chyishian.jiang@gmail.com>, "Lee, PK" <p.k.lee@quantatw.com>, "Amelkin,
 Alexander" <a.amelkin@yadro.com>
Subject: RE: removal of company specific, general-developers teams
Thread-Topic: removal of company specific, general-developers teams
Thread-Index: AQHYAZiaw8PmC7uBf0G5+EymVCaJLqxTMrdQ
Date: Tue, 4 Jan 2022 18:45:57 +0000
Message-ID: <DM8PR11MB56383E5D136A57DDA9DB74F3904A9@DM8PR11MB5638.namprd11.prod.outlook.com>
References: <20220104182619.ua6xl655s72d44wu@cheese.fuzziesquirrel.com>
In-Reply-To: <20220104182619.ua6xl655s72d44wu@cheese.fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: request-justification,no-action
dlp-version: 11.6.200.16
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85586c74-d214-4951-2c2c-08d9cfb2724a
x-ms-traffictypediagnostic: DM4PR11MB5565:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM4PR11MB5565829D8690FF2A532ED2EF904A9@DM4PR11MB5565.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DYe8cMVcqq7oWsn+0Wnn1cCF+bS9f+Jjp1q5M25Q3KFGAMMg4a782JkJj36HZXy6PzRN0gtsekpofXWPr3R59q8a3EkwrWkOjDhhwG+IAqqHjYpFcd0xqEu9pbnPmN+CnJtxfo2NRGLVOk3CiEbpM77od1tDWaFC1lEFrHvy3H9GIRzYLQGtT/UaB9UecQ0sgl8XN+ieV1+utX15IyJ/4sZwVqOwNncZZZIgkH5JSXmeNtLVXvSSXVvztH3UeOfxfM4/RrL0HUki8MJfVAZ+pqcRfDLgPyivdpxTqte89Fb2pHS5OrfElv90WLFWO7Cgtk7FKadvO3Kl7ZS49SRzZnxWUXHwMFLJzS7zAnlDaf287//GyT8CHbbiuHRntvKu/QB90ME47n2cy68NJwIWXCAWVO9DAXpCpBFEYMuuqHuaC7JzmHCb+EDj/1lensfVS36GH4ps58yR78jXMbuROaK39HrGZJSZNFk3nTGt2ihbacWGA2wy+DSt/S5pgLxBThULAUlf5fh5DcMRFXbKp/1wohcKLUp2t4MnM1qvCd7RUmxgJ6nhyEVgom31I7mxiDmkWAPYD/NY8BDNLRjdeVnS1sAPzCTFAzuFl0kZRGB1HiJzmJy9XgOeYJQkAfOlmKaVUe3zQsUQkYMmQ1Mh8dG4eZH0St9xaS0qYfQJTj4qHVdszbhfSOJTKgVWTWWXLfCU9S569GTIdOrN6+2/D11k4dWzbjlXFWiu4m4GX7U6VFOkgNwD/Eq9a2agLHIemGTXTkIT/p6jIrWiviUu0m3fwoDgxkJk1dkI+WpXY1Viw93JWpeBD0ueQAJPLNP+CwjfbeOmQflRqWmk2sewU+gI2167T7mXdIsBrB8kOD0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5638.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(2906002)(82960400001)(110136005)(83380400001)(6506007)(5660300002)(921005)(9686003)(71200400001)(38100700002)(52536014)(122000001)(508600001)(33656002)(186003)(55016003)(66476007)(66446008)(64756008)(66556008)(8936002)(7696005)(86362001)(76116006)(26005)(316002)(66946007)(7416002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ugC6DyVKRalFGbMo3iv/IUo6co3gpp2EptbYxhjFKhnHUymgvyYdm/tabFkU?=
 =?us-ascii?Q?iuRXUdM0pYGftvgHJv3r+3s9SSCpvckafkVq7uYDGKJ2aQ2++7fZ17J98JEg?=
 =?us-ascii?Q?uCPYseySlQ0wf/Z3H27aK5PgLd+9GPHtJFPk+4FWuq889QN0pPX5b2HQo021?=
 =?us-ascii?Q?Xs2wUe7fbRtnmWTCJYYYrZfekRy+6pydiq64jyd5U4myg8yoHegPhvfitkqx?=
 =?us-ascii?Q?7d8YFvkLEQtpup88V2rTTxK8LT/X/SxB0v5mxCxBW/piVUK6DpULWHpAlWf/?=
 =?us-ascii?Q?7vr5S3a5qBzCDTRgXmrDNL9tagccXoswtUzQE5vbOzrqFKJ51DAvKn1nDbl5?=
 =?us-ascii?Q?/eKBRa4V4AmJtMzdIAu5fIM+xmGSF2iDQnL0tuV1qLg4eFVszC8/8KmrvUmx?=
 =?us-ascii?Q?C7AEfkxgMYgMSfJKAXU4LXi87OwnMZudpc41IgS03yfeyEveLrt4GcE4jTuZ?=
 =?us-ascii?Q?HJETNM11azzSuDlbDI9i5L1hpQaNzLf56ZFzfABlPFbVJUJW+lxDupQ+Swdn?=
 =?us-ascii?Q?pYSceXk/detvCJCq14rpVGkmBT0s6Kk/hxNSbIfmDzyQEnVcLeIZzQ+fiYJV?=
 =?us-ascii?Q?PdJpFbga3pMoMEp4k+LyYVFSqs3reiV828QdPjErUuffFoyU9cHUlWEUim1q?=
 =?us-ascii?Q?Vhj6qwD+leB9ST62QHXOGM61HaZXntIaqmXQ+xJ0hkxeYevaK/8EtOwiGLXF?=
 =?us-ascii?Q?aWauubLZDB0rgqGezIpnAjIE5NpNCyJlziRo6Rgiudpb0Tldh1TpRedYrPtN?=
 =?us-ascii?Q?yfgodN1bw0I6+GvZguV+cndT1/iDSJu6EDjoV9zLilxfIMnPNCNxZ5zN5Xj9?=
 =?us-ascii?Q?RnESfaM/LeIK38cYB9/w5b8NIpEo3FUox8twK5D1dSNmHTd2EohqW955zhoe?=
 =?us-ascii?Q?CbZ88xuNmv4qkR+UCv43GRqVGC9l1LDAkDQgYOWhTVKWUWj2DOKCTGK8mDNV?=
 =?us-ascii?Q?j0Ve0OTYWKxoOPSmp2d8dx//Jx6+jc+JGkTWXIxRPDI2m5aDGfSOfyKNpCW0?=
 =?us-ascii?Q?LIW782E9ciZLwwEugFGZb0yJV1hKujvpq1VkjQ6xxB9gDNz+T+5coNbBSYy3?=
 =?us-ascii?Q?5NZsQutVgc3npWLX53ofzynD9Wga/KbOMsuT8+4L+OAKzFRVRpZDvpljdNTT?=
 =?us-ascii?Q?9PyyvlGTOZghlRUI+eZwIwNOV6IThaUiMxHR0CwqKFVEA3NLgb2P3kUWRdQn?=
 =?us-ascii?Q?77qDWmw4Hbl9REieelN8OSoqgcPH22nT5O8gv4lnPzbqM5aM5II+Mbirtdt0?=
 =?us-ascii?Q?FQg9UeU2mrCdpMp4sl4Zg1dohXWq4M8CQpQzf1r5b+ikz3V6GBzfu934LGPG?=
 =?us-ascii?Q?5cW+uq6fA8sjLnKzrB30ANw3Btlc3bNEGYjPVys7kgnOhyRP91/71/5TepR+?=
 =?us-ascii?Q?pd/pz1j6qRN8LqFcshD+VzU4yWUfSN47OInF9jwZzV0bfDWDIV05oQntfo6P?=
 =?us-ascii?Q?cw5KkXjvbUMowwhIrN3TT4i6Jq1ITAw3elUK9fETJjYyi3hugx5bA6QxzkQM?=
 =?us-ascii?Q?HLmKzHMMWZk/98PXdBQxtZe4+s2IZAxD/5K7YABXA8GLRI57Ge1IRblI2mfK?=
 =?us-ascii?Q?hCG8RizNahRJQgrMnXPlTMDt052dH/2kApclstVxvZ9C8laziENt7veYySkF?=
 =?us-ascii?Q?IQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5638.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85586c74-d214-4951-2c2c-08d9cfb2724a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2022 18:45:57.6977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MptMHYHqud37G/qB/CQt70J6pxyRLLaBASTnByHRhjyPpbilt3MEpsO8tzh8ThIzk1t24moQCpVzdj2f3JlmCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5565
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

I'm ok with deleting the intel team.

Regards, James.

>-----Original Message-----
>From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>Sent: Tuesday, January 4, 2022 10:26 AM
>To: openbmc@lists.ozlabs.org; hpham@amperecomputing.com;
>amithash@fb.com; yuenn@google.com; gkeishin@gmail.com; Mihm, James
><james.mihm@intel.com>; chen.kenyy@inventec.com;
>tmaimon77@gmail.com; chyishian.jiang@gmail.com; Lee, PK
><p.k.lee@quantatw.com>; Amelkin, Alexander <a.amelkin@yadro.com>
>Subject: removal of company specific, general-developers teams
>
>Hi all
>
>There are a number of github teams that as far as I know are unused so I
>would like to delete them:
>
>https://github.com/orgs/openbmc/teams/general-developers
>https://github.com/orgs/openbmc/teams/ampere
>https://github.com/orgs/openbmc/teams/dell
>https://github.com/orgs/openbmc/teams/facebook
>https://github.com/orgs/openbmc/teams/google
>https://github.com/orgs/openbmc/teams/ibm
>https://github.com/orgs/openbmc/teams/ibm-development
>https://github.com/orgs/openbmc/teams/ibm-test
>https://github.com/orgs/openbmc/teams/intel
>https://github.com/orgs/openbmc/teams/inventec
>https://github.com/orgs/openbmc/teams/nuvoton
>https://github.com/orgs/openbmc/teams/quanta
>https://github.com/orgs/openbmc/teams/yadro
>
>If you are aware of any use of these github teams please let me know.
>If I have not heard anything by February I will assume the groups are
>unused and delete them.
>
>thanks!
>
>-brad
