Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C91832317
	for <lists+openbmc@lfdr.de>; Fri, 19 Jan 2024 02:45:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LzLJcnQX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGMrl4sG7z3btZ
	for <lists+openbmc@lfdr.de>; Fri, 19 Jan 2024 12:45:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LzLJcnQX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=zhikui.ren@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Fri, 19 Jan 2024 12:45:12 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGMr86l7Qz2xLR
	for <openbmc@lists.ozlabs.org>; Fri, 19 Jan 2024 12:45:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705628713; x=1737164713;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=kJaY6Za2QHzCZlNqAZymtbZ0BTb7NvclLlIDCdNdJ8s=;
  b=LzLJcnQXNMchlGJZ9ZxDFqYWUd+335czOwIag3aO+Gp/1cnf9I1NqNBH
   kfz/5ODynInurDdTFb1nvrdprX7vDkfs3B87Z1aI5n77MWfQfmPGcaDhC
   Uj6cps4Hnowuu/o+zMoGbbssn4i0q+6U+uheFrKEKR/Fcf8Byuo9uChNh
   Vxdx9RtGKCGtkB75ayLr4GL2c3q/AFVSQ+95fZKWzeYcBPCY8wDqtGBOa
   Vgd3AZqLc0PwLCtDn4lVB4IRt0pqXcKLsk2v52ZnKo+MEzsApTDD3KxTM
   G3XEmvai/nYmmyzOv/o1WQt4ieZcxJ/rlI7+wyWvFpHKQAESEz+Xy2tEo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7722719"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7722719"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 17:43:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="532679"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Jan 2024 17:43:49 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 17:43:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 17:43:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 17:43:47 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 17:43:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zu/rBnkujEU7XqoR8qky39eLJyz3KK9W7BEwWq7v8yWsFTEzURECYu+IFpSnQ6ytHBOn3PhLTawZoD8qAnKmldO4Ud4T5M4DOt6nM1KnvupFbsVHFichd2Fb/n9pNpaMoh4o/6Jv+pIHMRgV4osM41FLs3cRNDTseQp/BegAxmvGogPGIpDQpzBoJQzqhpxTBKexhzKWsOpgJR1Fr7OPJIQK+rVUpWxfhMprB9ntOJ3UDNThigSkTnOvjpKSELUNvFk5mjIEG39vU8Gswx9rCaO4u2haymWprsDDCZ2IXdcnovSy+ZBPEtzZQyhKKrc9PaO6GmMIuNITs9oj5Ndykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBgpbSzokGAICZymIqex/182JPHbEkJ9ri2CJjdE7/I=;
 b=O4P/0Oz7HljJXaPSRCM/ybERBh7L5w4t30p93RZZWI7deDZH/8Q/zbCh0mxrwp2+w/BE/oh5GIwi53cG6VB/eyb2GWrNlptKOAIt9Wb0w1nk+7nhUjfOllAnXTkTi7wmYa7FQnNArK77ywF4BPxrLPlRQNrowPdxsTSvvqGbgtuQr+sESKuy9ddvpSd85abNkgWZ6FGmj0h6sTxELiFlbIACLofMKqwaROGngqRVe+asEIcipGswUeTi/bNgyfUFh6C2vVrLn/qrdIpfeB152KXSJYo8H2GdfkR7r2/rhjLthleKwo2zLZWG5g8sulymc8i8SudIRjYPuXjGnjUZ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM4PR11MB5472.namprd11.prod.outlook.com (2603:10b6:5:39e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 01:43:40 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::b9aa:d3a9:d300:cd5a]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::b9aa:d3a9:d300:cd5a%6]) with mapi id 15.20.7202.020; Fri, 19 Jan 2024
 01:43:40 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: Patrick Williams <patrick@stwcx.xyz>, OpenBMC List
	<openbmc@lists.ozlabs.org>
Subject: RE: TOF elections for 2024H1
Thread-Topic: TOF elections for 2024H1
Thread-Index: AQHaR/PworeQLdCmfkGcfEzU8l9tpLDgXlhg
Date: Fri, 19 Jan 2024 01:43:40 +0000
Message-ID: <DM6PR11MB4410B49AA8BF066DC7B1500E94702@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <ZaWZY3A4TZth-ons@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZaWZY3A4TZth-ons@heinlein.vulture-banana.ts.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4410:EE_|DM4PR11MB5472:EE_
x-ms-office365-filtering-correlation-id: bc52048b-c9cc-4ddc-567e-08dc18901040
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s9in7deuefAB5uGBRJAa/Ed3YTQwrftL93MZQNPA9GdjNWqDQbicnDdpq4ko/mmWRWNqu/Lra3Wpjgsy9sceLQdJ7rEmboo0D1ePmH4VMKf9/R9tvmGoHantAwwnL1ilyxjwB2ts1F2NQn09c3Zc7Vh8FjGPdQYzWVP2mlkV82aILUiyRykUN1N6hmLh+mvi4p9j7SIypseKKBArqD5GBxF6iBWXW2SJAGrvFPO2m7QBHn/iE/yMW65bjkbTbo9+P6ABfXzehRnXwk7ddTa5CrYxgBqu2EUzy8IiIqAk0Orp6mvLp3P7idlymj8ffXjZ9yUkGwPp/Ocm/hDYpXJqaq5j+5hsNNqNs2tCeZPm1jY6RbMzGxPEyQX3GfVt2gp/AinqQFjnmw1ONIE0pYsFMCUeretlLVc6UNzJMwWuvaWazRL+50lEtUE0AX4tToDKnX5VNN/12rB8POneUXGj/FNa/7QyWAV4gfuPyuSRhvvvUgvbGbglPTu9G4qfaIwXmgUiqi0GODLE+9QxJIGuQu1y7SZ/jK3A2G1vVMIe6okcr8Zu0RTPq3LVAL6ntaCK5LgtZxnJaPOcOxgNfURe2EVgDVvRtAhh0hxwsk+rAbSdqDiJOwORKOOhlXK5sjlal1VtulElZe9sHnqJCo83WQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(39860400002)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(9686003)(66556008)(2906002)(38100700002)(122000001)(66446008)(52536014)(8676002)(478600001)(966005)(66946007)(8936002)(5660300002)(41300700001)(76116006)(316002)(110136005)(66476007)(7696005)(71200400001)(64756008)(33656002)(86362001)(82960400001)(6506007)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U4M/1aKiWZSybbcze2/t/GIu5lfNbwHj9G8yj8IMwdhCs0e8HaZHtMeaw0UE?=
 =?us-ascii?Q?YQvAwVxHhnc7BS6QzJ6bGROjDbBqn3a+v74m2uOCCoZHiFMMpsprehj5X/XG?=
 =?us-ascii?Q?qAAiZDDvN4GqZZrO0Kv0LkN6/cpy3Eihh5rhNs9hbN+qlAvsg8lm8QBhZVzK?=
 =?us-ascii?Q?bZfxCHmwtovdB/zHLEZeB4PFPGz2Y6RaKFH+qlkU9++qvAxVR4ck2EE8Wb39?=
 =?us-ascii?Q?W0mvjh3n2a3SLd8E7Bks2mRptOcudtCg8+N5iWHZhZ8DkdhHAHkGtcY9A3MW?=
 =?us-ascii?Q?Vo0MO3Y1o0ZDj8At+f7lh6+Ak5AZBjL8zPdl0JhUwBAdILQTMGEvmplj2DiV?=
 =?us-ascii?Q?zbs10RGhXvmRF3S3XpkQ7rynrRU48j81I8Vsby/OXntoyb0csJFiiHwzP8H1?=
 =?us-ascii?Q?dlTftbrMXk7XzPlLpr9F+F07qhlt/270LC8zYWv/bB1gYGv0GCCWm4bypBMZ?=
 =?us-ascii?Q?4s+FA5nfpXUuv+BmYxcU18GjEuVZ5hHCynC7wO/WErVio5vD9ljaRwbZ7YCC?=
 =?us-ascii?Q?97VuGh8bOy+PSYpgO+Ml+ms95C4NzEQ11dwl2MIYUnwF0DfmT9MqwX/Uh2CL?=
 =?us-ascii?Q?cNCoSNSmS2yKmYkvsxgEx6aFeceP6l+36Jz0mcCDY6zQ/PfRYzKKjVBvx99b?=
 =?us-ascii?Q?OmGoWbdmQSHkNRcSqMElPxbpbimsjcNxtavF7JWn7ze0bssCS4/uhXgIHbBw?=
 =?us-ascii?Q?FgPbeNtP0jV49KVF10pwDvLgLd4fY0k/UNDR2t/M+RxmHYhImJE0cmj+f7Jy?=
 =?us-ascii?Q?+RY57yyBBU0bt5z3RhBg/lnljP8eUTKpDksRvTv9k8kzWblmW4cNLz7HnS/w?=
 =?us-ascii?Q?QPwjdBt9GsakC8JidMKcu/O8qGDZnSmw0X317R1cBeuQzV454Zjmy+SH+Nwx?=
 =?us-ascii?Q?SeUkm/ZEmwQOAaWUQLVGLX44hafUMfPpiWeE4oKiyCLKwygJwzW6FUf7SQ34?=
 =?us-ascii?Q?rNJCkCZxMTEXWa+YdILfFNVNVB9IF7mK1AJVjwlg/XIH+s7lm8gADE5cUMut?=
 =?us-ascii?Q?HVUKAc6eZCygwnFmh/wQH4IMWAbyzQ7ZnhYE+E07HtTkegvRyimFc9EFAW4v?=
 =?us-ascii?Q?UezmausvpEyu5jMHr675OQe+zPW9waTz0eL5hkOnP4bNdaMAovFikapvzMNe?=
 =?us-ascii?Q?Hfbt83nsCJ9W6PEBuPmmZ4GEHBE/HQlpD2LgditLGNjo+fWVOdCPSnNsC3+U?=
 =?us-ascii?Q?CeNzbI5hNhcJaX/bS2UsbQ8YSad/qoBL4bHfaKSShPrJ4WoKW1gGCiiFsGTj?=
 =?us-ascii?Q?aqFFlEnKCausnPC0PqlTVyxpEwLGVb5h7kIyeQrD4SMg57zl2XvDbAgiTVEh?=
 =?us-ascii?Q?2Ib4iSygOF2qYywHTiq2Joii2Fu3L/1zLDK7olCVumcKRf3L7sCyD5q9H2G7?=
 =?us-ascii?Q?exyqpBGMHgoZN1FpoTkNLOPwi+tfQm3rdCRG97GD0HzVIn6GqMSuamGF98w2?=
 =?us-ascii?Q?t5EolL9VPkXqdl/+cRpYPcvrRmGG4yh4iuoP4UY0Lo+DMjkjU7PteBp1k8rI?=
 =?us-ascii?Q?OHC64EPuFqRXSQdME0VXCxkB35cB5IOF0TdM+CygA6VR45fRR9XayP5Ty2XT?=
 =?us-ascii?Q?tptCkct9Mey10Zilp88BSHdfX5v9CaqEpcoFOmi+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc52048b-c9cc-4ddc-567e-08dc18901040
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 01:43:40.6222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uJZs/SvSr+wMdTmmy9sxot3MHVr8hnWEKvfD7ODOOBeEMiY0MUY0Lf8DqeFIe4P3tOKlLiGS92IuHGC2z1JUyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5472
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

On Mon, 2024-01-15 at 14:45 -0600, Patrick Williams wrote:>=20
> Hello everyone,
>=20
> It is that time again for TOF elections[1].  The current election roll-ca=
ll is
> available at:
>     https://github.com/openbmc/tof-election/blob/main/2024H1/rollcall.jso=
n
>=20
> For this half, we have 4 seats up for election.  Currently those are held=
 by
> Andrew J., Jason, Patrick, and William.
>=20
> Nominations for those 4 seats may be sent to the mailing list by replying=
 to this
> email.  Only those eligible to vote may be nominated.
>=20
> Disagreements with the roll-call (ie. your body of contributions are not =
reflected
> in our current score system) may be petitions for inclusion at
> https://github.com/openbmc/technical-oversight-forum/issues
>=20
> 1. https://github.com/openbmc/docs/blob/master/tof/membership-and-
> voting.md
>=20

I would like to nominate Jason Bills for the TOF.=20
Since the inception of the LF community,  Jason has been actively involved =
in the LF community as maintainer, reviewer, submitter and mentor etc.
He is well known and respected in the community. He has done a great job in=
 OpenBMC TOF for the past term.=20
It would be great to have Jason continue to be TOF member.

Thanks,
Zhikui
