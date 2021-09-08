Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4331403C89
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 17:31:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4R225Bkmz2yJP
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 01:31:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=Od9eMknL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=Od9eMknL; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4R1S6wZLz2xXD
 for <openbmc@lists.ozlabs.org>; Thu,  9 Sep 2021 01:31:03 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="220544106"
X-IronPort-AV: E=Sophos;i="5.85,278,1624345200"; d="scan'208";a="220544106"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 08:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,278,1624345200"; d="scan'208";a="469644500"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga007.jf.intel.com with ESMTP; 08 Sep 2021 08:29:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 8 Sep 2021 08:29:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 8 Sep 2021 08:29:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 8 Sep 2021 08:29:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 8 Sep 2021 08:29:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKT5C0CyUVd6bocGKtNMYTthL2YBvySS0s4DyNjcgUUhLYSbqaB2wGgvBNr5yZR8tSdgUmiBS9wYiFT51I0vGJaNT2i0JY6ErR8U9gnAq2Wy26HEW2Q7L1nYOoQzgHAxvZtwMy1Qwv3Y0KJs4vcOKE+JvJqfW7bNUCud87ToBZobdnY+jk9jFLwYSuOGjlnXx4Acu8jisYFtDfICTU8Kz4r8gMcb8pFe1OTnhQeEb+Y/95rv0P5w2sAkLQp0QM9/SPs/sENeXXWOlwtcY2r35GrEHbKB5akSTekGuOo/DsbNDE8pM3FkRIoKn/MbczBhdKKOgCe2jO0aKb1ysoslIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=TVRAjnYAbYnB2cAFHKHMwTnGREar0YWxIuxciYnfA5E=;
 b=TyswgLakrCwOqzNTERe+ViTmfNFagoNs/w9onDpH5VvaeIGtUjm9Y2qXjEc3deTpwfEXZ7T43Gbo/LpvQhHD1z56Um0IReAxlRQQHsKMUXIkhPUNsICzfPNHE4G4L9YmzSSHQTo5/W5SDb6Ysm1y2lqyWbPUNvvnE06JEXVm6ycK6wlCMXy1WyO7RRq5vYU8nwxxPbc6bRMa7zig2NrYZRPStBAXzwMew3P3QGYTFMQSQwcZgY8pndrTp8iJsAgTHI8VZmmi2oRJkMFSlVl7p/LZ47FwuEWqUDzdujkYiTUVSaC7lPR/DgS3zBWhwBJEzZHIA1GelRCtvd4r6VrAjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVRAjnYAbYnB2cAFHKHMwTnGREar0YWxIuxciYnfA5E=;
 b=Od9eMknL2pDCcemdXBdesGUmZBxvPL0+RUIASbcrAJIs/SjTzzK+OfnB/Z1jnPYKd6b6aGiRmAfJVm4MeGc3GPq4kBj97yN4CH9O/JgiKwu6eS+0f+1qo/BHo38uZBSJ0jI4PlOnW99+Q0bDTiJIsgJuaZiaBq75Ygyl+PhWizs=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM6PR11MB4299.namprd11.prod.outlook.com (2603:10b6:5:1df::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 15:29:48 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::b0bd:9d01:a28c:6367]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::b0bd:9d01:a28c:6367%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 15:29:48 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: beep code manager  for openbmc
Thread-Topic: beep code manager  for openbmc
Thread-Index: AdegNz4ix6KDZmesSHKifuGcFpVNkQADnnSAAR+hl4A=
Date: Wed, 8 Sep 2021 15:29:48 +0000
Message-ID: <DM6PR11MB4410B4A178CF1DC94978349894D49@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <DM6PR11MB4410B40F9D7DC46B72B0C87594CE9@DM6PR11MB4410.namprd11.prod.outlook.com>
 <YTFJHVW+bYoa1vIT@heinlein>
In-Reply-To: <YTFJHVW+bYoa1vIT@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65b3b4a4-cb4b-4e52-93b2-08d972dd7ea4
x-ms-traffictypediagnostic: DM6PR11MB4299:
x-microsoft-antispam-prvs: <DM6PR11MB4299AB061E6109C1ED1A925094D49@DM6PR11MB4299.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +d0ia3zI5iG2f6gu2B5uJU0NMylbRdRCLocSwh16qsoe+03EjKQJWIQHLoWsw9c4C5RhZZM6Sl77lqQBOgRnYBT4ibl+qBXoCmjqfRoy+i5kaQY5EabApfHBAYKVkVlPiDuyT1tz4V9ixvY0j2mXeX9g538rMGOscS6dizS66n5NREypG4gDE+Z0SVE0Kn08uGkZebcGyTJTYWTdyGD2x+TqscA507VzV8Cn86A2vSf8mMvq47z2HGbC4uAtYaJzY6lnoiPnCBsJIPZ0Jih4LSW26mZwI0UeG53ZjHooFQo2r31QGqVZsXo0NfHnlLg3vhkVaeSCXuVkzN3PU/NGcoRmcRctlL/TPG5ev8yr5MS/4a3Y6KLrG7FiXsY48Cnm1pzZSya09sXbkJscT+7e5P0ZEo3A40JiuuBGM6c5eAuC8hKddzyBeDhyegSE0r3WdllfXCgew4gwH4F30nWMr+ZZfrP52Bld7YpQe3n0At0nxkPJLLOy1dOoB+LGPQ5iYR83WQn8yxP/irwUYHinQhyC0ckHEZZnR7iyVO/fO6w7W3kJncWGpoBTiHuwBHFSlSt1n3rV5aFbJHKGkDKBNHtM2M5IjJqqXfP5Eq5IOpawTHj04vALHExpNVvNlUdvdv6s9jqJOrIl8WTynSutbUNcqvwas4l7DYCcJxjVo/1mw9s97ko4RrR+AngcUnNI4Ng58SgguoP0ieZPhO1f5KmtTR+sbzMEEyIhPA+xokGDCJC52xRsM3vCS5wKbVPF4F2wae+2Q2FysowLK5gvkuZXH98Wav6jb7yCp8JRVvI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(7696005)(38070700005)(66446008)(66556008)(66476007)(66946007)(52536014)(26005)(64756008)(76116006)(54906003)(9686003)(8936002)(71200400001)(478600001)(316002)(5660300002)(2906002)(966005)(83380400001)(33656002)(86362001)(8676002)(38100700002)(4326008)(186003)(122000001)(6916009)(55016002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e/lY79rIDeEk73UB5SGqQOPFfLO0gxFzCR2vm9V9KaDlO/N6TDSQa/aMVDYm?=
 =?us-ascii?Q?eUYiLGnxAXYnWN5UUmDHsIAtd5sOzQ6kktYdG4Dfti1BUuo8LsSMowLXzam/?=
 =?us-ascii?Q?KgcwqkOOvns2lwpohKaboIKrNS1vvXCaHTHhg1iNU0A4EfAV2lOAjYmU/Eey?=
 =?us-ascii?Q?LlREwxTK4GqGYtisCC12aY3RM7TIdWmeVVCqJNlbJIctBl7pWgZzqunPP2Ak?=
 =?us-ascii?Q?fu81QkvMD/TDfFpMTCThROWAfmThNkodwdcvImOpzk3JywPLEwDyPre8AE2i?=
 =?us-ascii?Q?c4z5oKARwPDR0BJVA1w7iEY9CEIeL/Rt3LPI0Lm/MFkj4CluFqG9kcwLfFqX?=
 =?us-ascii?Q?hv4H+vn9xS/6n/SZX4kIM2MSU/Mshj8eOGUT/gPphhHae6cIC8UUnGjwGLoR?=
 =?us-ascii?Q?EeiCZZphVH1/9Q/t1zoUv/eTP5NLMo5hUOLJHREgwZ51Jm50vudBk17cuiN6?=
 =?us-ascii?Q?t9IITOrHBV3JktnvmxYry49YMdIRUb1GV3jTw6opY3tCA0FtICAWsUszWZ0J?=
 =?us-ascii?Q?mC+q9ObBJ6OdKzaGqJpJmUGu7gNGut7P3Qnx694nchXLTPJjUZnOWAmzVQeG?=
 =?us-ascii?Q?yAoyHEezZ0iCLMfDUJTHX+UEB5U8FNk2wBMTUVxyDsooQsckh8mTfbEYb/h1?=
 =?us-ascii?Q?MGpyl6Kz8T7C+O9XSLVh2H1EtU4y7wZCsX7RXt1EfNSkmQ+gbxX2mCevok/D?=
 =?us-ascii?Q?w2lN0k2nJIF+1nPUTOsSP6oqmTYwG7Sa3sPlccgQAkYdinCxI09julZIkYp0?=
 =?us-ascii?Q?XgQHrKIFxerx6V+gc1CWGnHj3yFSHyFANTIXSQ9M42DZ98k0F6Gha6jkJmDt?=
 =?us-ascii?Q?9Wxpop2IxJootYmxX1UpqMfu56O+0v31CaoE8m2ELQcC6pG8BkU5DP/H1E42?=
 =?us-ascii?Q?Ce93WpLkB2Q+0TQEUApcsoxH+iFf6rbQogKNPLwg6b4X+eANzlJ7t64n3JF5?=
 =?us-ascii?Q?k7rndWyJIgz6eSwGq/PIJAjQmxP+whYreBCgnySa1qUaaYhUIjZMJ1Jsv3xy?=
 =?us-ascii?Q?BcWVfmYRq2kEYA6WCe0wUtLQXz81jznBzUdfxN8v8sDma3U42zvmu20T10wd?=
 =?us-ascii?Q?qlfEy3Chi298XHHSLF97k691m07KKbyJQ0s6c4sDJabNLCSxNo3oXQZq7lww?=
 =?us-ascii?Q?69pjLrgwEeG3/I70W10lINFt8ksk+qxRYh1S3D96quwNKwE7YAlkvpoRio3C?=
 =?us-ascii?Q?GFpEfUR0ue0XiGwFBAy3E9xybs6zdiIz6dFQE/yYVPUoJx2hnYNoPnX2vfFi?=
 =?us-ascii?Q?1JYNG34OVPrNAkxEHoBI9NcBq8b04oLwx3ELTADxdDaM8vpy0YXrU81QHnu6?=
 =?us-ascii?Q?uJQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b3b4a4-cb4b-4e52-93b2-08d972dd7ea4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 15:29:48.6980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R8mzleI+wmwJmqI/gLAA8lKew/pnjeHuh6Ck1DVg8DPpUFTM0FBYzOL1NRsuj8dg+v08WhVcae/QJ1ly6YNffw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4299
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>-----Original Message-----
>From: Patrick Williams <patrick@stwcx.xyz>
>Sent: Thursday, September 2, 2021 2:59 PM
>To: Ren, Zhikui <zhikui.ren@intel.com>
>Cc: openbmc@lists.ozlabs.org; Brad Bishop <bradleyb@fuzziesquirrel.com>
>Subject: Re: beep code manager for openbmc
>
>Hi Zhikui,
>
>A few questions...
>
>On Thu, Sep 02, 2021 at 08:15:21PM +0000, Ren, Zhikui wrote:
>> Hi All,
>>
>> Beepcode manager is a stand-alone beep code service should be created to
>manage the beeper hardware, and provide D-Bus methods to expose the
>beeper function globally, all other services can use the beeper hardware b=
y
>calling the beep methods.
>>
>> This package has been included in our distribution. Now we would like  t=
o
>upstream it and make it available to the community.
>> https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-
>mods/meta
>> -common/recipes-phosphor/beepcode-mgr
>>
>> Since it is now a very light service that only have one source file and =
a service
>file. I am wondering whether this service can go to an existing repository=
.
>> If not, we would like to request a new repository for it.
>>
>> Thanks,
>> Zhikui
>>
>
>I see it creates dbus interfaces but I don't see them defined anywhere.  C=
an
>we get that added to phosphor-dbus-interfaces?
>
[Ren, Zhikui] Yes, I will submit a review on that.
>It isn't obvious to me from looking at what interfaces are there who would=
 call
>it.  I see various "beep code" patterns:
>
>    {beepVRWatchdogTimeout, "1-5-1-2"}, {beepPSUFailure, "1-5-1-4"},
>    {beepCPUMIssing, "1-5-2-1"},        {beepCPUCatError, "1-5-2-2"},
>    {beepCPUErr2, "1-5-2-3"},           {beepVoltageMismatch, "1-5-2-4"},
>    {beepCPUConfigError, "1-5-2-5"},    {beepPowerFail, "1-5-4-2"},
>    {beepPowerGoodTimeOut, "1-5-4-4"},
>
>How do these get triggered?  Do arbitrary programs call into the "BeepCode=
"
>service when they hit their own event?  This doesn't seem very maintainabl=
e;
>shouldn't the beepcode service react to events through some other method,
>similar to what is going on for Redfish events?
>
[Ren, Zhikui] Currently, an application can call into the BeepCode by calli=
ng the dbus method
One of improvement ideas is to make the beepcode service monitor the events=
 it is interested in.

>How easily configurable would this be for someone who has a different
>beepcode policy than Intel's?  Are you planning to update it with some JSO=
N
>config or leave that as an exercise for the next user?
>
[Ren, Zhikui] Good idea.  However I don't have a definitive plan on that cu=
rrently and open to suggestions/collaborations.

>--
>Patrick Williams
[Ren, Zhikui] To summarize, I think the following steps can be taken:
1. Find an existing home or create a new one for Beep code manager
2. Upstream existing code as initial check in
3. create phosphor-dbus-interfaces for it=20
4. update to use phosphor-dbus-interface
5. further improvements including the two discussed above

Any comments/feedback?=20

Thanks,
Zhikui
