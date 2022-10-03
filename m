Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C375F4E09
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 05:17:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mj09V0sDzz3bjP
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 14:17:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NJhKZ2uw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=qianjin.xu@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NJhKZ2uw;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mgt2W2kMGz3bZB
	for <openbmc@lists.ozlabs.org>; Mon,  3 Oct 2022 18:37:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664782627; x=1696318627;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=7OJzEFkmjOu3l5KPBLBz+RrUIs6oB9VSlKVSGVYL/hM=;
  b=NJhKZ2uwNZpGouxzR0jejs/jC76G4HsC8eGiOxLUWDgnmzO11prJ5pb3
   KDF1Y4AqxhVE09j46TzljNUl32uD5qBBUHwyWPNsmBsa0sRRU7dSX+DPY
   4N6HyTuJfzT2roM+hsrz2MRJiIecBg6Z2eLuyo2SPR1QWp0Gaf9F8Wc7P
   +wp0PLDGjdTLP/6oe5oXF6dMgd2oQaBhbs73zyzc6ie76Px91G5r69hbS
   vgPtR2PS9XaY3cwhCmTBfJcedgLaS59Bh9yqEIWJtuqlDgrDjLe+uCGsF
   w7ouk22TV7zwHFD9haMsFYl5fi6GEfI/sv5sENarV4NabpAb9mUTIRMsA
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="285705989"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; 
   d="scan'208,217";a="285705989"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 00:37:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="798634414"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; 
   d="scan'208,217";a="798634414"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga005.jf.intel.com with ESMTP; 03 Oct 2022 00:36:52 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 3 Oct 2022 00:36:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 3 Oct 2022 00:36:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 3 Oct 2022 00:36:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 3 Oct 2022 00:36:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ib0qGaS5el/BKBnArSuKgpgzmsUCC5fGoahxiGRKzboOHd5Zxn3l2+4U4Ma1dTz+vpZJBHByO38gZKSaCp3aSq7r5gpp0ku7dqXvGYN8QHqkWm6kvFfB+p89utVXLtYEXCXKOhw/SOIvxC8DqACBZaXgxoMnMBPb86zoFQRO+M6z/ktTyw2F/yhgVYA6CNCov5h0s+OayENTMuTYBpNunuBy/NuRMrathUm8HvijFf5ADMert0jtJfmX/M6W79eA3b9OMTUOcNRPtY44/7UK8HzZYG6oJ/u0QAEp1qMiD/Uegl3oh7ifl5SXSs/4nR5CIwJH9HW00PLlyyv6+U2LHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dBJp16d+3rn4CozJgATkPBe30unXx+tHczm7mZpXrU=;
 b=KP2ksDfsTLeB7lBcsIWDAiEahZ180oyZNIS6JpKZJIhCw1RhB/cuReu2NlJ6NmoMr4TeiaXZ6uXBCU5pIjaUfnAS1eYenzgNGyZzUdqHaoG6/jucF8mc8kUslUxIM6QtDeqA/xDhEvA/79iyu86TTHtxT2eBOZ99PyX14s/kdeYrQGjDQlyUI0FzqHmM60O+wsytzy7F2o7IL4UADfmSk1cpl/DxFSO/1CVWdr2NOx7fzW35DlTB6QE0sfEUxM0rd2zA1ERj+bZmcOblYIky+1vQpzlkwj9MfoIMhy1veoWa307uf5mwSuXWQhI5q9CQbr8YZ1fz0QuXPWEbqr0SRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 3 Oct
 2022 07:36:50 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::1427:9330:d44d:2c17]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::1427:9330:d44d:2c17%5]) with mapi id 15.20.5676.024; Mon, 3 Oct 2022
 07:36:50 +0000
From: "Xu, Qianjin" <qianjin.xu@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: how to enable RNDIS-over-USB host driver by default without
 installing INF file?
Thread-Topic: how to enable RNDIS-over-USB host driver by default without
 installing INF file?
Thread-Index: AdjW+oLaLBy3u5CmTt6HS2gzI8knrg==
Date: Mon, 3 Oct 2022 07:36:50 +0000
Message-ID: <DM4PR11MB555099C3327AB1A3FA89114A965B9@DM4PR11MB5550.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5550:EE_|CH0PR11MB5428:EE_
x-ms-office365-filtering-correlation-id: e8470ac8-82af-4e8e-5690-08daa51208d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BtbTk5OLhKZWFFCeKgj/pU5r6zcdm9Xs2LXGY6g/QbzkX75Eor7VgOGZ1TKVweETG8P4mDSfaf7ZWKovISVxg17IqodpYEjWEauww2Ii/4ksTZXFvdks31JYZH9mE5FuwUyui/e1ny1d+y2cbUmr5c6nN8mzhjKiDQgPa81ag9IC5zqstcaAKjnYtE+ppDuSbNWWSVkUIsMZUG9YkqwM21dhvJ9Da0x2fVxkRd6UQb2iguBxxK2PG2TSs7yaBaDQcFmzBxpP952YYLBOukVmDIA6TEW2egFJMt0o4zSNoRJrQD9s0KFuFS3CxLKxs9D8CNJudCKZ5DD3wRb5DJYhVbYoTMOmIRitj9wZ5u0zekxOuDmVo0VEoehXbQQE4s+NTIAZv/B8ZguoaDdfXQVd4HhvQifTTdg+9Xo36COw6RrT8QP9NriBKaJIcNnykTi/OHc3LBDSlIAq2Uzw4bqRp2xVuFIlR2+UJb6AU6y8G3aAAhDTzm3KbGVZ8Pj7ypsg51FsPFWusPAq+UaBX1PzDnwpRL6DxKHaCjG5P++jqlGKJsH80LXF0jwnIuAoCyS/3QIZrNNqoywhRc8bWu5g8n9ic52IHmiRTBY3XUuSqKdGmccVTsG1LgPXNXosXiLMHlK3aHmYAmfDeZ/fmY0JA1J3iESHTsh5OKFcrwUHBMgyTxtL0iGXfMeIsjFUzNf4HZegqUa9EYxwQ7mF/b7+1UbF46QGoEm9NSnrMVbgMmw8/4efGdoAL5dXIAHCenFW4Ob5noVfCjH2y2JToXdiRqS9RdvzynmIft6yTF8AF7k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199015)(6506007)(2906002)(38070700005)(86362001)(33656002)(122000001)(7696005)(166002)(38100700002)(9686003)(82960400001)(26005)(107886003)(6916009)(71200400001)(54906003)(316002)(478600001)(4326008)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(41300700001)(4744005)(52536014)(8936002)(5660300002)(8676002)(186003)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AgzxhZ3EuKNiCBCOINP7MPIw35QTEhjA01vZhF61gc+quQrkbGNwzt8jBw1i?=
 =?us-ascii?Q?woeILoHcNcL6lvMl1fJegH2wIcJIVj9MehhoGFuvtnQu9ouAvr3O1k6TbDVv?=
 =?us-ascii?Q?FrQaonjAsSH9d+II6kzyBl27TVns8orayoRSKg3iqcsCnc2Fnz3z1aJYB/lf?=
 =?us-ascii?Q?ybo4TYJJgB4Ey5p7wc1dYzjcrHQrggDyGL7tPMSiVXhIC7UzZitkW9xG2T0E?=
 =?us-ascii?Q?KdcwZ7+Ba/2y+bAeOb7jmWnS0wb8BYEw+48xNTtDkYVlPx84PKzJblQJkhrt?=
 =?us-ascii?Q?0fO7H8QFKHTogEivTpC2/lWsn8vl9qI72LUNrqgyW1BjYGqjVtXOR0Uv/apr?=
 =?us-ascii?Q?CiXH1axS3z8nxT+axazNxjVs2B9FENRlp6teFQFB2WyzGGwQf80G3gtXy8/D?=
 =?us-ascii?Q?+uZsUzmhq394lSxffGZGlXAGxqRqZneX0oe6SRkp50PjRoVh4vH4a5YEd/yn?=
 =?us-ascii?Q?1/+7J4Zv94sUADiHD4+7Uxmk0R/r4KXtFzo6lW46Wbzv2LKmRJJyvZ4imz0z?=
 =?us-ascii?Q?ctSFeQDmQArZo0tDRUGz5wCKT/cJUfWyYea29dKWkpTUGBEBQhsP2KGyl/kz?=
 =?us-ascii?Q?hXRWW7gEJ5iLwZfXnMiXevDT7sMv7A+MQcqvMiNb36ZifbmUtqh0D9iaJ8F/?=
 =?us-ascii?Q?+fFUE8+rSMrWBn84scU/jwMGCF2gUbsjiV61vrwx8Cr1nNvoL+Yqff+AZzWb?=
 =?us-ascii?Q?c6ouUH6dR0DzQACWxBDkDrvBUKKrAZwdnIyxlnBq1ZNTDsajEAdXmi0ybDmL?=
 =?us-ascii?Q?RagbLbGO/hAK9rI9BebKuTuq3WR0KpDMzL5lp6uN9kIZIysgIhp6UnX3OQrj?=
 =?us-ascii?Q?CcWykvc6JuE0axdgg11BVKVoKguVcUFM5Olg8fF5ZS3L4Vei2KyJFLpf4oz1?=
 =?us-ascii?Q?6nLBchHDp9zYeT/UAjdzbHFmGLQHB4FjhAUEsJ/N0/+C+dm9fGNsizuXSLtC?=
 =?us-ascii?Q?sKQp140ltty5SQm7+hOynwqQOLz83Ii4aMB0KSfqbmFxuh/uetbvodjeBqh/?=
 =?us-ascii?Q?+ZergpJ+XBG5UtLRF8Lvu7249I/9lf45dpCFkVF7uAsi5LmUkkEWyS/mXhSO?=
 =?us-ascii?Q?HSJv4LAG6wH/z75yeUFaghxzfkA7zb51miok/BNZ433kUftA3KtddC2vc2O2?=
 =?us-ascii?Q?BSd9Fy48QzVVtdRAwY/XxDngT15DTkvvATH8BpfHY/dvbMGWTQaVeCgzc6Eb?=
 =?us-ascii?Q?4ciVs75Pqd0SPzKytIosGIi3rInMCdg5dTV9T5Q9eUIQ2w4UwgYSDoGaY3G6?=
 =?us-ascii?Q?tJ7iEE40zGC1QGv9nGO5WuJAsZCi9ODyGPYtxbCW3I6Oqeul8/nt0zwvTUMJ?=
 =?us-ascii?Q?yvWen5ARjIJlS5f1SK/vkhOLyyol0TwYaWl/p1ENxsCZlp7lLUq1nQpsM5Ne?=
 =?us-ascii?Q?hchY2gywbbVt/L5I4Se5aQchzhRjuf8/eNiPmc33S4PdoZOpBKnlZnE16Q1P?=
 =?us-ascii?Q?e7U/qMSNUSr4xdGu0qu4Vt/4duU112/Y3NrnzO+Bk++JMJ4/J/8NeBQO2Wiw?=
 =?us-ascii?Q?Hq6AJZkv0V/CqNrY8GAp56vKN0v21w21BlCkcQUVBWZQ8x4ffCcdUy8Uq6Gt?=
 =?us-ascii?Q?4enLuT39OgxtqLVgBFx3Uy0uYNq+EW23SjStjXUO?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB555099C3327AB1A3FA89114A965B9DM4PR11MB5550namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8470ac8-82af-4e8e-5690-08daa51208d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 07:36:50.2136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jAywu8r649ZgVKP8Dtq5NFPB2ifLPaTJzI3B3pYIpES2BN1kLPrl2TCZKehSAHZW8fl0VnM5bYkj9c6cW/V/6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5428
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 05 Oct 2022 14:16:32 +1100
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
Cc: "Yuan, Joy" <joy.yuan@intel.com>, "Li, Yuan" <yuan.li@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM4PR11MB555099C3327AB1A3FA89114A965B9DM4PR11MB5550namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

                Host side network device does not show up on Windows OS aft=
er host redfish interface is enabled.
                After some investigation, I found out Remote NDIS INF file<=
https://learn.microsoft.com/en-us/windows-hardware/drivers/network/remote-n=
dis-inf-template> must be installed to enable RNDIS-over-USB host driver on=
 windows OS, then the network device comes up.
                Do you know how to enable RNDIS-over-USB host driver by def=
ault without installing INF file.

Thanks very much,
Qianjin

--_000_DM4PR11MB555099C3327AB1A3FA89114A965B9DM4PR11MB5550namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
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
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Host side network device does not sh=
ow up on Windows OS after host redfish interface is enabled.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; After some investigation, I found ou=
t <a href=3D"https://learn.microsoft.com/en-us/windows-hardware/drivers/net=
work/remote-ndis-inf-template">
Remote NDIS INF file</a> must be installed to enable RNDIS-over-USB host dr=
iver on windows OS, then the network device comes up.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Do you know how to enable RNDIS-over=
-USB host driver by default without installing INF file.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks very much,<o:p></o:p></p>
<p class=3D"MsoNormal">Qianjin <o:p></o:p></p>
</div>
</body>
</html>

--_000_DM4PR11MB555099C3327AB1A3FA89114A965B9DM4PR11MB5550namp_--
