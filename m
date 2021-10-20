Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A9A434A38
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 13:38:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZ7t20wy6z2ypR
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 22:38:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=Dta9AXO1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=mei.xie@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=Dta9AXO1; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZ7Vh25FJz2yHq
 for <openbmc@lists.ozlabs.org>; Wed, 20 Oct 2021 22:22:02 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="209552018"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
 d="jpg'145?scan'145,208,217,145";a="209552018"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 04:20:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
 d="jpg'145?scan'145,208,217,145";a="594623367"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 20 Oct 2021 04:20:55 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 20 Oct 2021 04:20:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 20 Oct 2021 04:20:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 20 Oct 2021 04:20:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 20 Oct 2021 04:20:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMD9WYBE9T8yyyrW9M+SuYJacvbWssmfTAZniDd2kc+elCiRzdmxl0VTdr2IrPBSiYkyL2CKF8/6f65Pcr08SqSrTW1FxGG5O759RD86+oCqh0WUQPchLhNuo8ESn+pQRQl3D7AkOt+DYM/MPY6H/etEKH17pl49/NK/7Phb2GgU3Jt6lATrH9fQ+7H51RbKFENZF9oA35rA5Co4T7R68ylAeTblsgj2+ByyYdITrH9hBqcK0Qcrst+A8vN+4Ui9cdO2rTJpcvpVtZM1x65Lb9zEhW6FDpESQWWJDx9hhNngANE+8LCL4Mpm8Ppm8mXlWICExKpUmiSHHHs5nd8lJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsneFH1/dsw2/aTHKX0QIOt97oSJUFZwm4mdQDipBKM=;
 b=IIfK/jv6L07c9UZbxQ2Uhfr10n8kc4tWxgFm/AXh2Pt1hlU0k0OHEEuUr3OJkXVxYIaYVh551mxfzUboIysdcZ5iPbsuIgCAPOktjH7MXr8MEy6SpmTZdJfx7wLFdagEEKyNm49HfBeMCRe2OWlEQjlnmkoXpvPOO2waZ3cnPXfvMi39VV3c8GPww/y/rvd5H4hT19wtj4nrtXIPqrJtbSX4ONY9bB6muNp78PsYOI5w/9UdR8pFRHlI1U306ctH5T8nwr0FJTPNcL7wDrU/DdDPAWTXX3maREUYJFpjtNNaF1N+ANfNGwxF9nLKYE1xkixQhl2HcsZhUDLfS7/UWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsneFH1/dsw2/aTHKX0QIOt97oSJUFZwm4mdQDipBKM=;
 b=Dta9AXO1ZhQhm7hsD3ZveOVh3Lb12fgDENkiJmYIiD8y/QF0GK8u2BjZvYKT1d1XkFTVTDyOI1IklLG5qWCEc+xxqgxyNSS9rn6fkVlAW1sSdUqR459KV9aMX6IaR8EdpagmCQdz1DFpviRYdirEeDAL52Ov8CbYNUIC5YbdQTE=
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DM6PR11MB3178.namprd11.prod.outlook.com (2603:10b6:5:56::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Wed, 20 Oct 2021 11:20:53 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::4c7b:bf49:9511:30da]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::4c7b:bf49:9511:30da%7]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 11:20:52 +0000
From: "Xie, Mei" <mei.xie@intel.com>
To: "geissonator@yahoo.com" <geissonator@yahoo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Question about power_restore_policy one time in
 phosphor-state-manager repo
Thread-Topic: Question about power_restore_policy one time in
 phosphor-state-manager repo
Thread-Index: AdfFpIiEpcPEwnNhRkKb6EfunqCKlA==
Date: Wed, 20 Oct 2021 11:20:51 +0000
Message-ID: <DM4PR11MB53098DFBA31C8060FA3B7FD7F4BE9@DM4PR11MB5309.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: yahoo.com; dkim=none (message not signed)
 header.d=none;yahoo.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04084d6e-e099-4768-a074-08d993bbad08
x-ms-traffictypediagnostic: DM6PR11MB3178:
x-microsoft-antispam-prvs: <DM6PR11MB317806BA10CD6DA7B43D867AF4BE9@DM6PR11MB3178.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sTN0KwPjVTLlEWq559cxxguZZsWNG380bXb6JJIPLeZQKp7JK44SeI4XSU3JR8N1LRpmg0bDLvJ71dUO+joM/cJmq8hj9BBY+E6mMBuVJ1xp9bDsyFrUT4nKrztKqr7B0+XI/tsrRhAQOpjl90Fyoc492WoSd8ec0p5/0EMfq1JESqTU46PAgcmG6UNWTPHGIZCQGtwD25gcSNBlPeDcurB78WAxhXjwpcPVPIe/XXrSZiFcZ3J5YhZrEL+9eSLq2t3bzFz81CRMC8biZlRmBp2RRJ2tVL2m7tfvElSOqtD5mnIfJ4Zvl2I9SJRUEIAvAEl4UO9IqJD3e9xRerAgjOQcWnKhGAb2uxl8IU5fXRU3WjbPzH5/rRtk0ZYxu1de/fXQrBN5FcrkpepQUaXhp6F857JsTQxtEtH5xM9BoBCPKXBDau8OruYhZsd2APyEfVmbv/M17Ga72nU8rPPFBu1cR+FRGpxksALctrU9afyrHkgwf8B/ZFpW4PgrC1TgGL0D12trF4HbZpA58Ykdr9xxRzmGnkcr4FHymgNptP4ZGY+DZJBNNT8Ko0dag1G/WBPwitzdZ4LvP7RHbzLWHZHXIkYPXtjb/fdE/TsFgVFgsHpXY7QuiRgO1XyXYLVW6EqT/7yxviJxfFX9qLSA3E71JPE9VwflcsL54eLZEJsYEJxgIwOgRV/o44eIW9+62RZXnFqpOhCXFfTLU77L4DIoR9QN04DR6XafWIO6IdgZKfuW/J2RlN0MklUaMc+dkm1YaWIfU4puynE1rUbpzh5/WT5CPQneSstujvWAEDs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(52536014)(7696005)(38070700005)(5660300002)(33656002)(86362001)(122000001)(9686003)(8676002)(186003)(508600001)(76116006)(55016002)(66946007)(316002)(26005)(110136005)(66556008)(166002)(66446008)(8936002)(83380400001)(66476007)(64756008)(82960400001)(2906002)(6506007)(38100700002)(99936003)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dxxjv6gW//2rmDGjkmfYcEAniCgjpBBtEkGSzzjk7LzRNqmJjPwaPd/YBoTB?=
 =?us-ascii?Q?9ZuPEv7qXAO8Voi6QDv/MlwpFi5Mx4hpEKEvpHKwX0OGtoda1yLanMauizjI?=
 =?us-ascii?Q?g+Lq6/sB9fm6HRpuCLDzwlaxajNowW1ukAUdDLtzjQdtngyH1rLshlP7zAxK?=
 =?us-ascii?Q?S+lSM+Za+80w2WydM+lymvUjJauJGUqkVehH7eCdVe+oC/+705RpfbVDkmiH?=
 =?us-ascii?Q?gd4HZstNGEE8XX5TuM8y0ZUTF4+svt6jSrF5I4EJ3b9vyfz4sSeyWrN0aS87?=
 =?us-ascii?Q?YgfO+3rFC1henjcTpDNAsz54R7rLbYkM4NI9olkv0uajXdB07UqcnCZ04XlN?=
 =?us-ascii?Q?Cqmh6taenKAcWX2j/K64xvfM9NcRpTylY7bqeGQO1N10YJHna3uevNa6aSCz?=
 =?us-ascii?Q?2x5x6k8fOhSqiXkon5FRVeAUpG/byQlsO7nQeAf3jaPhqivFnFIewStAOddb?=
 =?us-ascii?Q?X07w+Ec6coJbf1PIDUK+zrYy03Bv7agcKXQW6dxNZ//rKEYxy8nfhc1KHfaC?=
 =?us-ascii?Q?xHrbq8g+97LXBch3zAjfB7E1slXjZyVGmFzke8sMgK49gW+bPF6w8vW5rMZz?=
 =?us-ascii?Q?PpxjzNKUmDTxZ/+nYvpTlP/WbBsdGKbsGTgIihFoB7pIRv0/6M33MI3hzqmM?=
 =?us-ascii?Q?2qtNlNcdcdGBEdmrgpOmZO4aAQw26UGrBBsdmuVexAR75+MF2bUDjkt6EoER?=
 =?us-ascii?Q?xDxrV09UBKQe6gc0J6G7gmv2UqHsLIkR0j8SfHF8XeUzz2Qwzz8gdHGpJm1L?=
 =?us-ascii?Q?+BQFb7iBLXqZWAzJRbPjo3LpX3Ce+pPHcyHsXNfdD+jm1xOwmJx4Mw9qfLHz?=
 =?us-ascii?Q?skPCFBfHoJpNWi3cvViS1OstOyNX8hSF8q5/BOtbyvJ7xjfVjDa0uGWaPUa0?=
 =?us-ascii?Q?5s1nz4R1U6sKw8cyur4ELXbLMG8GxLTklzVXg9gjv1wz00E3D8UUImYmj5vL?=
 =?us-ascii?Q?8Ve/B/yUEXTEiXpAbo6usU1OB35/477o8TxBdqAXnc083Ycl88E6I9gnbfAn?=
 =?us-ascii?Q?YZNi02k0cPBYfGRMNqloB70DSnkOnS/PJt5JPa43DdXthZD7dHhzi57U6/c4?=
 =?us-ascii?Q?20evvnKYE8RWgFu8ECYsfKOEeaQ5U0vgGwnc98xf94mWaDnaX3kt9+Qc5fmX?=
 =?us-ascii?Q?Intc+pzrLpRO7Sd6GZosa4riBlEHBqM9sbV2VRUIjGA/tbHnxal5EIPv7fv5?=
 =?us-ascii?Q?VdlyHYXVwv97n+KxGUJcahoe7OYOWMe0IPxAUTetuYk9wYTptRzziCORlagK?=
 =?us-ascii?Q?5SvX+BYNIsCGM00EcwPbUeSAx3/NANqPZ1fgObIh1q07V2Wn+0grWq7Cwl9A?=
 =?us-ascii?Q?chtElmJJAxN4eIggx/WroGv0?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/related;
 boundary="_004_DM4PR11MB53098DFBA31C8060FA3B7FD7F4BE9DM4PR11MB5309namp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04084d6e-e099-4768-a074-08d993bbad08
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 11:20:51.9433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDNl1xV4c68+Hyuud0G7lbpQrQgShgX93v74evNqGlxEliWbS+ysL95ip7C64HFhJbpOX2q68YAZJ48qFwyerg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3178
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 20 Oct 2021 22:38:26 +1100
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

--_004_DM4PR11MB53098DFBA31C8060FA3B7FD7F4BE9DM4PR11MB5309namp_
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB53098DFBA31C8060FA3B7FD7F4BE9DM4PR11MB5309namp_"

--_000_DM4PR11MB53098DFBA31C8060FA3B7FD7F4BE9DM4PR11MB5309namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Geissler/all,

I am Xie Mei from intel. I am focus on OpenBMC development. I met some ques=
tions, hope you can help me to figure it out. Thanks. :)

I see the below patch in phosphor-state-manager repo.
We also need to auto power on after bios in-band update.
But I have below questions, could you please help to look at them?

  1.  Do you know where is the definition of /xyz/openbmc_project/control/h=
ost0/power_restore_policy/one_time? Because in my code, It doesn't have /xy=
z/openbmc_project/control/host0/power_restore_policy/one_time path.

[cid:image001.jpg@01D7C5E7.96C59F50]

  1.  I see your commit info, you use dbus to invoke one_time path. Where w=
ill invoke this one time function in code?
  2.  In /user/bin folder, I don't have phosphor-discover-system-state in m=
y platform. So maybe phosphor-state-manager service isn't existed in my pla=
tform. There are several service in phosphor-state-manager repo?https://git=
hub.com/openbmc/phosphor-state-manager/commit/35ca2e34cd04b7288a5b659e4e7dc=
d4590056b7d

I am really appreciate if you can do me a favor.

Best Regards,
Mei


--_000_DM4PR11MB53098DFBA31C8060FA3B7FD7F4BE9DM4PR11MB5309namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1830363114;
	mso-list-type:hybrid;
	mso-list-template-ids:309375320 67698703 67698713 67698715 67698703 676987=
13 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Geissler/all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am Xie Mei from intel. I am focus on OpenBMC devel=
opment. I met some questions, hope you can help me to figure it out. Thanks=
.
<span style=3D"font-family:Wingdings">J</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I see the below patch in phosphor-state-manager repo=
. <o:p></o:p></p>
<p class=3D"MsoNormal">We also need to auto power on after bios in-band upd=
ate. <o:p>
</o:p></p>
<p class=3D"MsoNormal">But I have below questions, could you please help to=
 look at them?<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">Do you know where is the definition of /xyz/openbmc_project/control/h=
ost0/power_restore_policy/one_time? Because in my code, It doesn&#8217;t ha=
ve /xyz/openbmc_project/control/host0/power_restore_policy/one_time
 path.<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph"><img width=3D"1325" height=3D"59" style=3D"wi=
dth:13.8in;height:.6166in" id=3D"Picture_x0020_1" src=3D"cid:image001.jpg@0=
1D7C5E7.96C59F50"><o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">I see your commit info, you use dbus to invoke one_time path. Where w=
ill invoke this one time function in code?
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso=
-list:l0 level1 lfo1">In /user/bin folder, I don&#8217;t have phosphor-disc=
over-system-state in my platform. So maybe phosphor-state-manager service i=
sn&#8217;t existed in my platform. There are several service in
 phosphor-state-manager repo?<a href=3D"https://github.com/openbmc/phosphor=
-state-manager/commit/35ca2e34cd04b7288a5b659e4e7dcd4590056b7d">https://git=
hub.com/openbmc/phosphor-state-manager/commit/35ca2e34cd04b7288a5b659e4e7dc=
d4590056b7d</a><o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am really appreciate if you can do me a favor.<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Mei<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM4PR11MB53098DFBA31C8060FA3B7FD7F4BE9DM4PR11MB5309namp_--

--_004_DM4PR11MB53098DFBA31C8060FA3B7FD7F4BE9DM4PR11MB5309namp_
Content-Type: image/jpeg; name="image001.jpg"
Content-Description: image001.jpg
Content-Disposition: inline; filename="image001.jpg"; size=27145;
	creation-date="Wed, 20 Oct 2021 11:20:51 GMT";
	modification-date="Wed, 20 Oct 2021 11:20:51 GMT"
Content-ID: <image001.jpg@01D7C5E7.96C59F50>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQEAeAB4AAD/2wBDAAoHBwgHBgoICAgLCgoLDhgQDg0NDh0VFhEYIx8lJCIf
IiEmKzcvJik0KSEiMEExNDk7Pj4+JS5ESUM8SDc9Pjv/2wBDAQoLCw4NDhwQEBw7KCIoOzs7Ozs7
Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozv/wAARCABKBngDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDZ+PH/
ACJVp/2EE/8AQHrw2+1O71Mwm7m8028KwR/KBtjXoOBzj35r3L48f8iVaf8AYQT/ANAevI5/CVxa
RW5u9Rsbc3lutxbq7tmUEZC8DAPTrgc8GjoC3Ktl4q1rT7aK3t7tQkBPks8KO8OeuxiCV/AiobDX
tR04TrBcK0dwQZo5o1lSQg5BKsCCc9+tX7Xwfd3ENm0t7Z2k2oc2kE7MHlGcAjAIAJ4GSM1DZ+Gb
ueG8uLuaDT7eyl8maa5LYEmcbQFBJPHYUAUb/U7zUr43l5OZZuMPwNoHQADgAegq5ceKtXuru3vJ
poWuYJFlWdbdEkLDoWYAFvxJqxB4YNr4itdP1O7tYoZtkqSkuyTxsRjaVBPPPXGO+Kva94UtB4yk
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
BiaaFGPlnOQcECqbd9CYxi4q769zObTo/tUMMV/bTLMwUSLuAUk9wQD+lWF8P3TX95ZuyRtYqzTO
5O0Afh37VTuoILZlWG8juD13RKwC/mBzXVa7qMf/AAitvcqpW91WNBOenyx8ZHqCaTv0CnGEr36a
/wDAMHQLKC4uJrq8UtZ2kZklGcbj0VfxNMtNJe8tpL6SaGztRJsV5ScFj/CMAmrepf8AEq0C20wf
LcXWLm5+n8C/lzSW9zZ3nhtdLuLpLSaG4MiO6sysrDkfKCcjFO76AoxXuvzYxPDF8Z7mFpIE+zRC
ZnZjtZD0IOKr3eiXNs1qI3juUvP9S8JJDHOMcgHNbc2uae51BEmYobBLaAspzIVI59u/Wqya5a21
noTRsZJLGRnljAIPJ9enShNlShTWzKVz4euLaG4kS5t53tR+/jiYlo/rkYPPHGax/rXUahq48u7N
rqlqYrhSPLjswkjAnO1jt/XNcv1NEW3uZ1VBP3To/Dek2GoRXr3VxCWjtnZEbeDGR/EcDGPzrKW0
gN6kAv7dkOD5xV9n0xtz+lXPDl9b2c90l1J5Ud1bNF5mCdhPsKqxWlst75f9pWyxphhNtcq3sBtz
n6ijW4/dcI2SvqaF3ot1e+JLixzZwSohdvKysQAXJxxnpUd14Yubeze6W6t5lSJZtqFsmNjgNyB+
vNa0uo6UniW61NdSikhmgeNVEb7gSmBnK46+9MOtaf8A2dLD9o+dtKS3A2n/AFgbkVN5Gyp03e7/
ABMqDw5cypArXFvFPcrugt3J3uMcHgYGfc1Fo9vZvqUkOo7VjWKT77bcOBx39a2n19Lk2t1Bf21n
LDEqss1mHcFRjKttOfxIrlriRp55ZWbcXYsTjGffHaq1bMZKnG3LqQ0U+ARtcRrMxWMsA5HUDPNW
NTSzj1GZNPkeW1D/ALp3GCRTMraXKdFFFMkKKKKACiiigAooooAKKKKACiiigAooooAKOaKKACii
igAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA5ooooAKKKKACiiigAooooAKKK
KACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAOaKKKACiiigAooooAKKKKACiiigAooo
oAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig
AooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAD
miiigAooooAKKKKACiiigAooooA674Wf8lC0/wD3Jv8A0U9FHws/5KFp/wDuTf8Aop6KAPUPjx/y
JVp/2EE/9AevAq99+PH/ACJVp/2EE/8AQHrCsNG0t9HvHbTbRmXw/byhjApIchst06n160+jBHj9
XbHVLnTcm2MaMTkM0Ssy/QkEj8K9J+H+k6befD7VLm60+1nnRm2SywqzLx2JGRWR8JdPstQ8RzxX
tnBdRiIkJNEHHX0IpBzNO5w0aS3d0saZklmcAZPLMT6/WpNQsLnS76WxvIvLuIW2yIGB2n6jivUP
CWmafJ8VtZt3sbZoYBmKMwqVjOV5UYwPwroPiHpenR3miXEdhbJNPqiebIsKhpOv3jjJ/Gn2Hfc8
g/4RPWvIMn2Rdwj80w+cnnBMZ3eXndjHOcVRtbD7Ta3Vx9qtovsyBvLlk2vJk4wg7nvXrvgy2gub
vX72eCOW6TVJEWd0DOq4PAY849qx49K04/Bp746fam7Bb9/5K+Z9/wDvYzSvp8g/zPLc+9SQQPc3
EcES7pJGCoM9STgV6d8MtK0690+FrvT7W4Y37qTLCrkr5fTkdKl8E6bYSfFLWoJLK3eGDJijaJSs
ZDrgqMcfhTW6E3ozzG/sLnS72WxvI/LuIG2yJuB2n6jiqwr2j41abYW2jxXcFlbxXEt388yRKrt8
vdgMmsrxXpWnW/wl0q8h0+1iuZFj3zJCodvqwGTUrYbOGk8OMNCl1i31K0uYIHRJUj3hkZug+ZQD
0PQnpWLXU6Z/yTTW/wDr8t/61y1V1YlsAq1p1lLqeo21hCyrJcSrGhY4AJOOfar/AIRhiuPFWmwz
xJLG86hkdQysM9wa9A8aadY6d8S9AjsbO3tUM6ErBEqA/OOwFNasHseXX9s9jf3FnIytJbyNGxU5
BKnBx7cVWr2P4gaVp0XhCK7jsLZLmS/bfMsKh2/eHq2Mmun/AOEc0LdAP7F0/BSTP+ipzx9KlbDe
587ZOMZ4or0D4XafZX/jWe3vLOC5hCHEc0SuvX0IrA8WW8Fv45vreGGOKFLkBY0UBQMjgAcUIRzt
FdL8QraCz8a6hBawxwRKy7Y4kCqOB0ArmqALUNldXEZeC3llUMqEohIDN0GfU9vWopYnhkaKVGR0
JDKwwQR1BHrXa+DB/wASmwHY69Bn3+Rq5DVCW1W7JJJM75J/3jQ9AOw+Hfh3Sddtr99StfPaF0Cf
Oy4BDZ6EegrV8a+EdC0jwvcXtjZeTcRugVxK56sAeCSKb8I/+PPVf+ukf8mra+I//Ik3f/XSL/0K
rWwHjGTVm8vri+ZGuJN5jjEa8AYUdBxVWioHdhRRRQIKKKKACtCDV7m3hEKR2pVe72sbN+ZGTWfS
0DTaLV3qEt6F8xIF29PKhSP89oGaqUppKAvcKKKKBBRRRQAUUUUALWhBrFzbwrCkdqVXoXtY2P5l
cms6lFA7tGk+u3zRyxqYI1mTy5PKgRNy9cHAFZtFFFgcm9xKKKKBBRRRQA5GKOGGMg5GRkVav9Su
tSlWS6k3lV2qFUKFHoAOBVQ0lA03YMk9eaKKKBBRRRQA5WKMGGCQcjIzWj/b13/zysv/AACi/wDi
azaSjcpNx2Jri4e5kMrhAzdQiBB+QAFQ0ppKBXuFFFFAgooooAKKKKACiiigAooooAKKKKACiiig
AooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC
iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK
KKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo
oAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig
AooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigDsfhOu/4j6Yp4BEo4/65PRS/CT/k
pWlf9tf/AEU9FAH/2Q==

--_004_DM4PR11MB53098DFBA31C8060FA3B7FD7F4BE9DM4PR11MB5309namp_--
