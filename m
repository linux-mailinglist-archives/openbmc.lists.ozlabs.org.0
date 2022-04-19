Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8798C50622A
	for <lists+openbmc@lfdr.de>; Tue, 19 Apr 2022 04:33:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kj7Ck2wsdz2yb9
	for <lists+openbmc@lfdr.de>; Tue, 19 Apr 2022 12:33:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=TqCLBkWu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::71d;
 helo=apc01-tyz-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=TqCLBkWu; 
 dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::71d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kj7C83r8Nz2xy3
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2022 12:33:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyUw+1Nc4x9xT7Q9O//JHD51AygRic67Eb1TD8Wy2OcD1oLqa/c4NAnx/M4p4Z+FfrNwhQHeQxxj2fe2ajlTnlL7zMtrkrQ7NgG0sgaISPih5Tmd5A81nMkmfGXIUb+xpdbOGGPJHgGjv1MES61XIE11udYtQOY+EEV1wu+9ha3fV157tORolcSzkbYgGjst9tTfvCGKSleFdIThQMotBWCj95Qq5JoYLNFjm40uVbtgjDkvsuZkm7fOB59HHCcNxWoJDuKxMAhzJB82PWAh7Tn3M0awOjljU9+33DrDyPO//i7v6tkQAg/fLyCre0d1tmdoOVnTeAjXrKw1LiqIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQ/bWDREScYtppH06hOm89SQrhIk2T5R0cUiZw9hBVE=;
 b=CQoT/12SzHMYyJBGsYN8ce/xzndrQWl91y8vXy92lixnCegN8S5JtUFXZuu2knzuby1lnnnORIfjdxvwLY/Wr8u+WurrZh2FgCqEmTxGJ4mnnO/L5p1/BtcNFY000fqMQCgD89fuQKYJcIh8JZE/tqvsJ477DLC0D3WK+NNONfbjZnSZ3cvcV02591Cm01zn/Yl3WNCXcsVXjSfToNwpYHhc+h4CDwf395jvOT7JcA2OcWSzNMl+AjOsz/JUPvkYfPyV003gaXBwI5OX2nhID0NFmXJXR0a4lbu6oSlU6i05vKhpSfqUWi1jb/fJYWjtcbRvtoflnkIM1+xuAqIOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQ/bWDREScYtppH06hOm89SQrhIk2T5R0cUiZw9hBVE=;
 b=TqCLBkWusc5o6Ycm09YYihwvTow9bHrj+o2OtPbHCTws4mVREEBd7IvnjpWjR+hutZ3wG/aHuRr6q8YJddCaeZ/hMeB2JQKM7xAIJGp9gqktRjiqnwrZRDCe1hLZ/IZ/uXi3z5g4hF/zus4i+G+ZNmY4wXcWNcbsF0ZQB88+Y3JD1b5rqisCxcsGYwzNwL93Pa1RxYGmmMu2TKsixB2k8ssoM6bmTZ2hqdSym56/JlXYLobZd0GHhpTxZML2vjTGK66CLLMhf0M5+1kVBJVHQp99fZhPwoxSy3gGDYLToyZD1rVVBEE3XOj7hV6zHXsvg8YATwCNt9bTw76nSuYBWw==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by TYAPR06MB2174.apcprd06.prod.outlook.com (2603:1096:404:1f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Tue, 19 Apr
 2022 02:32:56 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::a897:fe76:bf0b:3558]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::a897:fe76:bf0b:3558%3]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 02:32:56 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: RE: [PATCH u-boot v2019.04-aspeed-openbmc v2] aspeed: add
 CONFIG_ASPEED_ENABLE_BACKDOORS
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc v2] aspeed: add
 CONFIG_ASPEED_ENABLE_BACKDOORS
Thread-Index: AQHYUFCjQ4cXcwiUTUOHxDLCRcfyL6zwTs5AgABPPACAAAG4UIAF0Q8AgAAZMDA=
Date: Tue, 19 Apr 2022 02:32:56 +0000
Message-ID: <HK0PR06MB33800677F5A1735DF472A90EF2F29@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20220414224004.29703-1-zev@bewilderbeest.net>
 <TY2PR06MB3391889683F53ACE067875ADF2EE9@TY2PR06MB3391.apcprd06.prod.outlook.com>
 <Ylkm5L2wPl/OYR9g@hatter.bewilderbeest.net>
 <TY2PR06MB33910DF8FDDE1072646911B4F2EE9@TY2PR06MB3391.apcprd06.prod.outlook.com>
 <Yl4JcpZNvPQWcL3C@hatter.bewilderbeest.net>
In-Reply-To: <Yl4JcpZNvPQWcL3C@hatter.bewilderbeest.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5966ddab-c23c-4e70-0449-08da21ace9d9
x-ms-traffictypediagnostic: TYAPR06MB2174:EE_
x-microsoft-antispam-prvs: <TYAPR06MB2174F0E3ED1D188598FA0ADDF2F29@TYAPR06MB2174.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lQmh9YPLM2qIFcltUzo8KjNeUhMl1QDLQTFz6XMkgUO2naT0CEz8V/NPwa/n/kOwPhTh2DpWkIPGytsSVwcDEVJokSzmSljpxyXU+nwHjxn+WNycwgFPQc18xQEGD825umuVjl8lVlS28abZoWjzJtf0Teu2FNyCGHIEDAvpbypY+lacJYLZ7wsvJuoHu7B74dXE8sfSpbejfMDh5X4AY+0bWEt8/qHOw9F11TH1Q8/i6otvHwcetJOdNQIzoPCnmZ4QZGUCHYlWd76UW5obQnNvxddN46EUoWYB/RvF9cvv//xkzxzz7Qb+fm/78QWG/iFrQZ82sqVZBdA6F03giE2HliIXumnffOFo58i2c98gn0z5HyDNDWUCmNqxzU0ixPbshLYp3ot+G479YhsOhmd3u68omRxZhkVFWEY4tNi57PJl5waoQoDYINGc2jrdRIpwIU0a/jlONRfCOP2lbOn3ifvFx/xAbL6yYZ6A2hGpmf77RztwOWhj5dKUpB4lT2cm6QsW0dnFr/XSlWppsWchkwzKITNh/T8BqygvxnASwcwzgsCwsLBlLJOVgUmnvu2ZyiFJt1ePjV4LSOlDhr/kpfFIGHOjnoXSTkVjlojFZ0Jr46BgNumWICGVPVhGQpw4S60RuVVZs10AhRcy7A3h0Y8sUQZRjKpGSAkL6FQB0+J2zJTSc16SkFRhd+2dk/OVDhIMkH7CcT0Qg1zbCg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(136003)(376002)(396003)(39850400004)(346002)(366004)(26005)(186003)(33656002)(8676002)(71200400001)(38100700002)(7696005)(83380400001)(54906003)(316002)(6916009)(122000001)(6506007)(55016003)(2906002)(4326008)(53546011)(86362001)(508600001)(76116006)(9686003)(66556008)(66446008)(38070700005)(5660300002)(64756008)(66476007)(66946007)(52536014)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?23J4x8l/q1G4k+1IxlR1Flo5KUYLBvX4RJX9D29KwU7yft/o72MaRvLpGBQj?=
 =?us-ascii?Q?BXC1jPlRqN/tWnWQa1+ydSI1tliU0rCxNEkvXYWhAPAvOY0OVvtQkwHKrYRr?=
 =?us-ascii?Q?PIcJ2zPEFU4yUK8nJ/bz9u3Vyp79rpJCODyNJnsVGrG/+Q/zBIOmCB3CWBHt?=
 =?us-ascii?Q?WBG3xq9jUgniIou2vjZ2AVMlOzS0+jVhy9IeoezNTvco4kaAfyST8tTUGLEx?=
 =?us-ascii?Q?2q3J6OqzZCMs1hkJs4N8CcpBgI+1/oVOFWlCcYjC39wVaNCnjfTI3Yef3mPM?=
 =?us-ascii?Q?JYrkWGqE684a51/qpeApyHG2xUO75cu1eWdT3JBFdckUotG7tBajhkxjqxkv?=
 =?us-ascii?Q?tOmS8SUBljGOnb4f6zKPDTP1xjJYrO6Gka78NR5VWN8M+NNcJZhX6japRKly?=
 =?us-ascii?Q?HcUCrTox2ShkcoweiIfaAZ+0uVckBwg24rYV5wfXcKXGk9X/MafZ91/DK0bO?=
 =?us-ascii?Q?SOl7BpRMXAqz5EsCnDkBBiakcS9nTzInrf43vu7VRLRiWJjj9qc2iHfUzgH6?=
 =?us-ascii?Q?e0P0mCJadr+mUmRNZLeBPal6hqetL9yUytuFueL/F5ZA4s3F5NAJhFD30KWo?=
 =?us-ascii?Q?avaMcDRC+AV8B4ZGMnesoSG53yMeRg7j0toBN0zbO00mbMxJ6fct8dbx57Wv?=
 =?us-ascii?Q?MuXGAUhMPaPVMpCG5w3Jae83sZzThFh5JaKZV4KV1EGCUi1PposhOKtYX2ly?=
 =?us-ascii?Q?xewzDaZSKQGl4rKEFm45dBi0tzuAgfOnvCsW4szeAoHSygb1tH7tzkap61JC?=
 =?us-ascii?Q?7OoTUBkCLcl4wTX3LampecnvQWrVbU9554GiAEIJVhORYGZdgRStEGaXS5C9?=
 =?us-ascii?Q?EIyRDIA+xusrNZOnuISWXpRTc23K4PY5GG83QHNyagihtTgb+u7FKUXAY6Wd?=
 =?us-ascii?Q?gAM0Xle+uKlKNMgq14ucXyBO7f1jfi5WMPxGAycelDYVCRWcoOJjJJL3rEfL?=
 =?us-ascii?Q?M6/Hw0pBGtWmVjZrJXlZ4L8zCrin0ymaWgVysJr8IvXyH40S1FuiXtl5NICI?=
 =?us-ascii?Q?s5NGqNrI87NklFN6PXoFgmjhXpbeBN74MtIprpU6kEbR2k9obVgW0gy4byOq?=
 =?us-ascii?Q?RkpYYlSAFOhfI1QMdk/MA5XXqrN0CLLyIWZsgapAQqPgOexk+sEKislG74pM?=
 =?us-ascii?Q?9jvTzuS8EymxVSkh1eudqcgeITEJ0ZDVWZneMQ68wAk/wuOwJ2IVIpFL+3Pq?=
 =?us-ascii?Q?v2UTjBz34DABPfOYgbUDhmzovsf64nzEhluI1b69Ss/sV2SEggP+LfX/T7HD?=
 =?us-ascii?Q?ff3bCeoQR8w/h19b8DQe3iCemJgzgMYHTnTpys3MibQhel3JR2NCDLpZdu5v?=
 =?us-ascii?Q?/7V7PRANGHXtInSqIVIUBwWMYd2XQFeY89oCSMofWlLrWHWVSSjeEWd7p3s9?=
 =?us-ascii?Q?mZBfpfv0/okkN8MSTXvGT3wtvDGfJ35M9980+bdvMcnjlUkxYxhaVHKU5n4x?=
 =?us-ascii?Q?jx7+13JhRQMwKZ8lkMtQwkQuXxDo0eUqH9PgUtNRnTeRw24qVV4fu4WRnH9a?=
 =?us-ascii?Q?oEtxwB5sXoYZCbBmg6w73eYT5JFRF8BcAh4RGitqkfYF6m8MtWAj4ShJLwdJ?=
 =?us-ascii?Q?DHLXpPs88W9E4fiw9FXD1EQK1iEy0a6Iu4MdFStAShoy5/l3BOTEqHhUiXK/?=
 =?us-ascii?Q?0xM1PrgpW4xio1XgshR0Vs1iJYqDG2YvoWr3sj9pCgBTTUgoyXFS6JX29dUm?=
 =?us-ascii?Q?NnJ46mMQ7GxzJrXfVJe4YU+siuKOFxZxRawW9quJLzlZKPnTV7/+Bi18PYiq?=
 =?us-ascii?Q?wi1fy9msOCeqjzP+cvk5fytcoZaz+cc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5966ddab-c23c-4e70-0449-08da21ace9d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 02:32:56.6189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IATSodtoBitftMjel8Bc8svK5KIDIvBPUNwtoagEpJGLDze8Jlot6For2IVrVcyniUECvrqVxXak2b3v3HRsknCWoG2k+ylL2nx1m1+xiIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR06MB2174
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Ian Woloschin <ian.woloschin@akamai.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,
	Yes, leave SCU70[20] =3D0, set HICR5[8] =3D 0, HICRB[6] =3D 1 is enough to=
 disable LPC2AHB.
	HICR5[6] is LPC fw cycle it is allowed.

Ryan

> -----Original Message-----
> From: Zev Weiss <zev@bewilderbeest.net>
> Sent: Tuesday, April 19, 2022 9:00 AM
> To: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>; openbmc@lists.ozlabs.org; Andrew Jeffe=
ry
> <andrew@aj.id.au>; Ian Woloschin <ian.woloschin@akamai.com>
> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] aspeed: add
> CONFIG_ASPEED_ENABLE_BACKDOORS
>=20
> On Fri, Apr 15, 2022 at 01:11:09AM PDT, Ryan Chen wrote:
> >Hello,
> >	Thanks your response.
> >	And yes, I prefer apply patch without any config to disable it.
> >
> >Ryan
> >
>=20
> After thinking about this a bit more, I remembered that Ian Woloschin
> (CCed) had mentioned at some point that the systems he works with do in f=
act
> use the AST2500's built-in Super-IO, and hence would presumably be broken=
 by
> a patch that unconditionally disabled that.  And in contrast, the ASRock =
boards
> I've been working with require the AST2500 Super-IO to be disabled for th=
e
> host to boot properly, so it seems like we'll need
> *some* minimal amount of configurability to support at least those two
> classes of systems (i.e. a Kconfig boolean that determines whether the
> Super-IO should be enabled or disabled).
>=20
> I don't know offhand what the interactions between SCU70[20], HICRB[6], a=
nd
> HICR5[10] are though, and I don't have any hardware that actually uses th=
e
> AST2500 Super-IO to test with.  Would leaving SCU70[20]=3D0 to enable the
> Super-IO while leaving HICRB[6]=3D1 and HICR5[10]=3D0 work for systems li=
ke
> Ian's to enable the Super-IO while keeping everything else locked down as
> much as possible?
>=20
>=20
> Zev

