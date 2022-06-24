Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDC2577E54
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 11:06:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmbgf1DKdz3c6K
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 19:06:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BehCLdOA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=michaelx.jones@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BehCLdOA;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV3QS228Jz3c5C
	for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2022 03:04:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656090304; x=1687626304;
  h=from:to:subject:date:message-id:mime-version;
  bh=aVfVPejcKV7YHwkjiQuIp7dYscbXUeLwTqGcLdAwhAU=;
  b=BehCLdOAhJ0Y5+vdLEqFkyCuoBGZqHtK7PGDXc4Lp4/3q/ECtZ9hnEOb
   L25koFBdqMcADnAQ9rFgdhq07indWzbLEGWxO41WpEmGabGvLYDcoHa4t
   THWocIhBlaRfwPYdHQWUHthlfbAo0vp7AdR5li8M20qmmf81L16iE6den
   0ViIDm6fDgwTEH5pucjG9J5xlhNF/TApBuCZp+V3SRLSSn5QnFD2cShqj
   dxSVkDYmarSWoPqFVFRbxi2x5bKX0O19Emli5wFMz3VhuXYfsRTz5Y6a3
   hTXpX+O6rhg1lzdu2mZ1NOkydWukmnoxnTZHJoRNyih2763VGBlZkJcOz
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="367361722"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; 
   d="scan'208,217";a="367361722"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2022 10:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; 
   d="scan'208,217";a="678615525"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2022 10:04:53 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 24 Jun 2022 10:04:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 24 Jun 2022 10:04:53 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 24 Jun 2022 10:04:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4mqTytrvnN1b3KEvg89Nl76Pg6Kx043Ogyt1F3LOearXZO+iNWUP2YEN4gw1hqKCz1FlyRlKy4PsTPAPwcd0/t4oipc5u0OvQrXcOWKjou4X0yALRIvDjDJYQL+uO4h/sGjAH8E14QzHMUwKAtErHnUccqsTOZUugC7S+spvL5A4tb+Jye6tWEi6YtUzKXApoO7qpbbT9N/wdIxZW7ykLQlZg3SS3XYzdRjy2KpDk6UVbnDDyPUKi4P58KwM7aVtMjISroLYtBjLfS/ChsMy4kfYy3OdBNIVHlcrfH+shNU8ZxDSrXQMGUgHEhVER3Mye1lQCn294feE0wSrc7KNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJNCl7Hp+OsN+TFSXAzFdJUl4A9u2FVf1Psxx7Ku/w4=;
 b=F08aWA5NxGDdj/7dmsEjt8bKnZBclxbtcV/OSLoqEijefkaRgcsZVR0guJqvsSd1e3bRkwITXjWs7dYnEVNfBDZvlhds3+y7O4i7QM9LuzfE1e0ZZCYlMXFC/dO/41AJxjLyu+CgECgDw2Nv+C2JEv+lRqNwVnvyj47S0rGPazEV46/+zHgDl9R6Z2729jlXdZcEpLlSoDLi3+u2x7HQHOTHXRkohYWtAwx2S2vt8xJjL9yLmHI1poyje5SY7dCl1PKmEBT7PEKXFqZsEjkLoWHrVShLicpptl+rMZul4Gp0Dr/8ZAQwuOko7OQqMkrdtnb98KVGcTgvWOmld8tezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6180.namprd11.prod.outlook.com (2603:10b6:a03:459::14)
 by SA2PR11MB4969.namprd11.prod.outlook.com (2603:10b6:806:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 17:04:46 +0000
Received: from SJ1PR11MB6180.namprd11.prod.outlook.com
 ([fe80::4978:50df:1f2:f6e8]) by SJ1PR11MB6180.namprd11.prod.outlook.com
 ([fe80::4978:50df:1f2:f6e8%7]) with mapi id 15.20.5353.015; Fri, 24 Jun 2022
 17:04:46 +0000
From: "Jones, MichaelX" <michaelx.jones@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Request for Discord account.
Thread-Topic: Request for Discord account.
Thread-Index: AdiH7FvgF/OAksayTsOmyOGo8FlPkg==
Date: Fri, 24 Jun 2022 17:04:46 +0000
Message-ID: <SJ1PR11MB61808DA9ECADAC2AB15FBF3C83B49@SJ1PR11MB6180.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3187bea9-eb2e-4ed7-02a4-08da5603a413
x-ms-traffictypediagnostic: SA2PR11MB4969:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GaZXgY3y6HJGh57f6f8wgkPK+EJjdtz0dpYcIeq7equvJ8DTwIOj9Von2cqgB/czJBfAi549Fepol/eRiJo8ry6pfZwZrsxi6cSOX3HjtXeN0fHCNYqI+Z0cKvcE/7l7d3rqdbfnAJW1nLqSlT0ryl7jfq+kdNMkmvG5DbmYpkJTdtpWc6VpcOTXdEOmBc7KToL53EE1sUjctAg1wUChLxEart2sM8gbDJU4Ny5Pw7ebwvMcZxVqKLrih7PmcLjEcyp/KOIR03sfzDe5d37OLp3N/y+KdGML5IazaFIrrTJl4wSEWgjUtHhoM5skun505heNEgwNrPP2gMYGGroNUmMCUIziCSYg48EUoW2MZxwXmj34BI/jiGjV0n5Tgt6aqkr6P1kREPbDo2j+pcMsDEB++77xcbTasu+jOslzaq+VwzWNv+F59qC0WBGNPHYSL6FBSQ0cFpZrsCRyF0D1wFjc1tH6VxbHV2ItQVXl+Pz3mqgi/dIw8XXbuU0Q+U/6T3UHQ5PcdaEYh8ymM0Fn+Z+bo8eAIwXI4kuG0FqlFhb79Pkq3r90cI2IWw+iiUUKkXsaTa+UDD8CPlpQVWXfn4IL178uMgLgfj+oWhtwsujUCLk+gLUPQOCRwrhJ0jrdfNuERsulFR0fR79XISAc5Rp22jeLQAAJnq8S+6fCUWTuXyiuHHmEdaAMx07S6ibdQc+kE99JNEG82BpFrTmePXehrOSiwufDywBN7VBEiMXylP8YtSREbGQdZQgG+WO3g10R3MsIY3Gdu1qQ5PyiKESvf0wQb8yLkPNIszdzp2E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6180.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(366004)(376002)(396003)(39860400002)(8936002)(52536014)(66556008)(478600001)(558084003)(66446008)(66946007)(6916009)(71200400001)(2906002)(9326002)(64756008)(83380400001)(8676002)(26005)(5660300002)(76116006)(41300700001)(66476007)(9686003)(33656002)(6506007)(316002)(122000001)(38070700005)(38100700002)(82960400001)(55016003)(186003)(3480700007)(86362001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ms73a6Ye1Z/q+5PfddiqOAFB7/VJOMpstdLE7wVna6DaBGmgb/+ZRmIJgOYk?=
 =?us-ascii?Q?1XsBSUei1xJPeNjWCabAAnaAGSwxwHfdLb1zWP9H+WEGVRGbWq4e+ZcgXqmf?=
 =?us-ascii?Q?N7xDLuDQTi/9yxyr8t5qOuHxhUkRq6zfQ9SDOO8IIL9nJ32EXOLzBad78lec?=
 =?us-ascii?Q?DLy4Z71UJNiK2peaUDJwVqtc2KjLziTnAxVdI5CEQUoTPgnxyfe/UZ06be4n?=
 =?us-ascii?Q?0+t6eIvhMkzROmJVYYF8rnwsVKRnleOUfG43qpB3+Puwggpy/R7ULElgRe17?=
 =?us-ascii?Q?WfODf4QqMSRmG2w4Xqc6M50E7XjIfWP2/a+Bxp3LG7CsXvH4CqBb4bQ5IW7I?=
 =?us-ascii?Q?JtATm6fvRLCZGQZpBSSk5iLfwTXXoBE7tfmb057mm2l8iJVSQTSqF4myKhKE?=
 =?us-ascii?Q?4EAD3vmBY+0tUG4ag+BFCdhf5xvGOfkrXmtnXnfKTT15yBESe80djcS3wR28?=
 =?us-ascii?Q?O/mcIEmd8g4q9uUa9mOhg1Y07oDu1aXYbk9Gf14e0GDhS11TfVmXWdzojJWK?=
 =?us-ascii?Q?YS0+23PJVOJVAQ27QKpG2IWXlNBNSFYQcSxyx9OgV4B0eCLl/CUjf8tDNJ8S?=
 =?us-ascii?Q?4xeZJttnp9414dS9cxC+SLrPgBKtYp3g0KQvyg4R+eVl4xz9mOz4AVgfvYMv?=
 =?us-ascii?Q?jk59f4qeAL9WoFbxUhxTjQpLTp5AqE7KX2A03A4otkuPUlMBN3R2lPdyuSx4?=
 =?us-ascii?Q?Y5Kud4xupR3PHVQj1KcxetmVCXQgtA+C9H5Fdew10mH5BSvbPwjCEFM+rDUS?=
 =?us-ascii?Q?nB7+et8/DpMwnIkG7V9w9YH1+wzzGcOxbUYW3Z0oMn/hsQcOn2ZjAohR5S1+?=
 =?us-ascii?Q?lPKZaJ58gdLRdsgQKRiPsXIm+Gj+/Wg9uY5re9nGR6aLOMF1/gyR4tVBLQOL?=
 =?us-ascii?Q?+ajg2Rw8OpqWl8iVXWVJwOM4I2sn1fnLf20UdmrfY/iC9h/yaTWKXRpXWfpH?=
 =?us-ascii?Q?mlX+GefjOfXDH7M6Gnjl7dz1q7AtP8t/XaYY7FqQspCxkMpc5PIbPRNh5Uhr?=
 =?us-ascii?Q?TAYTai9q4H21ewTuzIeA8j2aHgg8/mQldr7vOvEdRL4TrQtOB7sTWGJnewdq?=
 =?us-ascii?Q?eZrrlSKhh6TyljMnqn+pSG+AkfE81nzOR9EkmxcS8LwqnwbJeaGv+cpQT36z?=
 =?us-ascii?Q?/7LJW9DBzR9Ptd7rU0YboGZvfwG4zEaWHzBYsaiTDaY0TiAyKZNY2EMQJq7n?=
 =?us-ascii?Q?v85YddDfpf9+/5TzQoqL2uK8xiHmeR8W8de8SXxoNIdbNg3Xymnb31pBBfGd?=
 =?us-ascii?Q?qEa90xqO0r64cfIUHBuMD5TWXuXKCD2LBcpMeO6OxMymX0q0dVQB0S87iDYK?=
 =?us-ascii?Q?PuXtdigsLWxLdWvcnCsJ2+c8DZBw3Mjj99n8WFP8sP458iLnULyqC79Uz0xo?=
 =?us-ascii?Q?eJLl+rhWsvKHSImYVeoBqekefjPvr8Nf1VveeyKv/lle27Hhvkryy+GJIFQq?=
 =?us-ascii?Q?XCbfLP0AsgD2LLphfzNB2E6mbO7ZFtFRSGzDGOR7o/cFRy8LETD8VXyhyJ56?=
 =?us-ascii?Q?/dvM+SFasf1tO8/tC1DTShkYleXVTyRBsQ/XIP19w+Y/Cly+tf05v8ZDB0Eq?=
 =?us-ascii?Q?HFs7cCgOhiQjmT/oVMmlryiltJhAYd2xBCloiZOP?=
Content-Type: multipart/alternative;
	boundary="_000_SJ1PR11MB61808DA9ECADAC2AB15FBF3C83B49SJ1PR11MB6180namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3187bea9-eb2e-4ed7-02a4-08da5603a413
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 17:04:46.3315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQ+odnQvkPkEvzgvY31NDH9TIV9bpYO5ooSsG06Iit3ad8ys4bMtTzzisfimyJ9TcTNFffGmaIb2rr1k4zyHuP4Rk3z3GITHtu1R1Nv6HR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4969
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Mon, 18 Jul 2022 18:59:37 +1000
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

--_000_SJ1PR11MB61808DA9ECADAC2AB15FBF3C83B49SJ1PR11MB6180namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Folks,
  For my work here at Intel I wish to have access to the OpenBMC community =
to learn.
Thanks in advance
Mike Jones.

--_000_SJ1PR11MB61808DA9ECADAC2AB15FBF3C83B49SJ1PR11MB6180namp_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
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
<p class=3D"MsoNormal">Hi Folks,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; For my work here at Intel I wish to have acce=
ss to the OpenBMC community to learn.<o:p></o:p></p>
<p class=3D"MsoNormal">Thanks in advance<o:p></o:p></p>
<p class=3D"MsoNormal">Mike Jones.<o:p></o:p></p>
</div>
</body>
</html>

--_000_SJ1PR11MB61808DA9ECADAC2AB15FBF3C83B49SJ1PR11MB6180namp_--
