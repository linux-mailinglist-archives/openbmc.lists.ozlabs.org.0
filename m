Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F012A77C0
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 08:09:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRZPx3MKXzDqGb
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 18:09:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=e0cZvl5g; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRZNg0LpdzDqlQ
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 18:07:58 +1100 (AEDT)
IronPort-SDR: Oh/5IV5gQGq3ptWzWnGSBm03O3gvWmDd+zNG06y85cXcndM2RHT2yktV6zN/BH2Rlq+1DXmYnL
 WmXted/mDEBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="148618366"
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; 
 d="scan'208,217";a="148618366"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 23:07:54 -0800
IronPort-SDR: J/MKot1YEtERQITtAZQtQRoY0V5GSrFYGuwS8/FutNuQvcdYz9Lyqt/Nmj0dCCTIvy0RD6wn9C
 F8Gg9Pdlx4tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; 
 d="scan'208,217";a="306737803"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 04 Nov 2020 23:07:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 4 Nov 2020 23:07:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 4 Nov 2020 23:07:54 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 4 Nov 2020 23:07:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0mnhfPwZWpvnsNO+nlQGdSz2nEIs6iuH8iSNZu2wXVPM2g1Zy4oXuspw3BsA7BMgqa5fyfH5cwgA+Mlv47UJc1OXxYrcVLEM3PYQGk2HOVp93oFq5kBeEFL+0xR7Br3Kzbi97cv4p7i3R+v+Q9GxCfkop4cqkuNKjw84iL7cONkYzFaf2+e97gTuD8lJnEur7Ncgvk2BgZ/ZMAWrWAlY2WgwkU9mGxplzMSJPazUXKMQkn90XKwGxzftwZokfghqX0IYwbAFdykDDK0vpxOxlkoYUYUO4Y8E2jV8LephsizSomTzSFqWyNgU1AmnQ1ri+/yyij8ALTVQ6lgxvPS+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKYiBU45zO6CHeY1KFeQLv7a7QbiDAia1ptxlRaWAQw=;
 b=MR+VFk5cnjUOeD6twApS6LbEH1fegI55O6uxUzh30DtlbieyZDcjZRVXJm8t6ZRIpCprk1qxGBcm+5KP/t1GMY/7DQ+YWR4ApD45IPYo63YtwKSMNy74hVNRcJez9HqChUiXM3nwF+DNS4ll2iKrDWE8sDKeeXFAjiixZBKyaByNQkJhwrNJXFvXp2Mg4RQKp7Z6LrjZUYTZS9t0ckKaddws7+XlZAqK2nJMF27uB2zi3fHSkkPVMQrO8FFaRunNMabFJ5g06QrXJYVS6GUg1wPm/aHkdWHaqHideVmMO6UFiIcCZOkVdq29NrYyzZuOTF0zZoHLock85WbjjATK/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKYiBU45zO6CHeY1KFeQLv7a7QbiDAia1ptxlRaWAQw=;
 b=e0cZvl5g8NZ2O3JPVJD3+2Ms2mBJQXtgC230/TkO/jtsZVn+UNSggNFwMUYHlJmyhHdqXd6qOOAjyMGSQXlNDRx+BGghJoEIpOLBeSRd1HNgjNlnn1oC4/hVFxvZDbjjlaQESs4jZQSN1XXhEHNbYEhSM2+JtAUtn3ImBQi1m7o=
Received: from SN6PR11MB3520.namprd11.prod.outlook.com (2603:10b6:805:cf::12)
 by SN6PR11MB2800.namprd11.prod.outlook.com (2603:10b6:805:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 5 Nov
 2020 07:07:51 +0000
Received: from SN6PR11MB3520.namprd11.prod.outlook.com
 ([fe80::81fa:cb4e:7479:e399]) by SN6PR11MB3520.namprd11.prod.outlook.com
 ([fe80::81fa:cb4e:7479:e399%6]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 07:07:51 +0000
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: =?iso-2022-jp?B?QnJ1Y2UgTGVlICgbJEJNe3o0PVQbKEIp?=
 <Bruce_Lee@quantatw.com>, "yugang.chen@linux.intel.com"
 <yugang.chen@linux.intel.com>
Subject: RE: Please help provide some examples for how to use smbios-mdr via
 intel-ipmi-oem
Thread-Topic: Please help provide some examples for how to use smbios-mdr via
 intel-ipmi-oem
Thread-Index: AdazPL6EMls5bWeYTdWBCftty23oqQABVJEQ
Date: Thu, 5 Nov 2020 07:07:50 +0000
Message-ID: <SN6PR11MB352082A063F3C4BD437E5CCE90EE0@SN6PR11MB3520.namprd11.prod.outlook.com>
References: <da65b69b77144a94ad9e278b0fe72b5d@quantatw.com>
In-Reply-To: <da65b69b77144a94ad9e278b0fe72b5d@quantatw.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjk5YmM3ZDUtNWM0My00MzIyLTkyZTgtNzk0NDg4Nzg5Y2UwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibVA2WGJLalVLR1RFY1NIM2FNb0syanpSSDFKOXlSd3dFa3FNQTNvSHNCV2xRUW03QURKS0pYcGV1dG9wVEtURSJ9
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
authentication-results: quantatw.com; dkim=none (message not signed)
 header.d=none;quantatw.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.46.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 489a1e47-7ea1-4646-5d0a-08d881598257
x-ms-traffictypediagnostic: SN6PR11MB2800:
x-microsoft-antispam-prvs: <SN6PR11MB2800856B495BECBEF3654C2C90EE0@SN6PR11MB2800.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VSabCLPgIFNJJQtQooqhPBEhYkfKJR7R2xehjIbU186CqNYlVxMN1h/7llZQRAF/XHk7nK/gacgIJZVABibUX4M2AxjOhTVgZdikzbqGSwxE9CeBreJRPMx2/VeeN493hyR1kKuuu71L0EIwZp36vw3ZKRWU0IE4Re+xxDFkDYpPDwtzeIOeH4vZnCgkwNS9wRfkpw6ufFmhDrgpi3EsaVa/RVyPd0FBkPnAsQG5TwGHxLv2CDXpg1EW2B7IIrozG9bnaz8khkLlPu1xon+8aWdiyOWTd1UgUHDFX6WhbuUQ0SucFcXxH8Y3mS8FIn9qifCC/HaIRXwVpZ60SeM41d5eAJ5dmN7dpjQOmsMn0JA1bkqjWwmeTFf3PwjNwmQl2VPInl5q3qBIKw9lE7eiSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3520.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(110136005)(9686003)(7696005)(2906002)(26005)(186003)(5660300002)(66446008)(316002)(66556008)(64756008)(66476007)(71200400001)(33656002)(55016002)(52536014)(6506007)(53546011)(86362001)(966005)(4744005)(76116006)(4326008)(166002)(478600001)(8676002)(66946007)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: psvQMpigkchi2C6N6dee09+fIgUP9kqtw5fQULw/lgvm8P7QMvbVJ2guWr3fHT+p9b9Azy4qEpi45vOqu1B65y503nQbJYDZMzy5UmLNXICgXzI51flV05tt7hL18KKFSzUY1IcNtsO18uNYS4PUT19//EF6vU6abjh2MFbK+ckIx9GdNXZx4FN/W0NWza8c+q1z4uTxL0hwe+rWDNj5MIjfIOGJCXPE4qwQpAbHC5EtQWuPutmBaj393oK6mbBfVpgsc2nQMuRleXs+lR4uKkBHCpktDs9Yok8bg/N0uE5Fy2je0u/6bEAXBOFeLSEa6/0kdV4k83iM6oe3wf8kpt/qvERVxa3cNBYm9vf4ozU6E6HLVv17zG3MzlSetPdOxiAnskgEO+g7GCQPIQe/Km3zKM+UsUCCVcRZ2T1MOwSrtLcWnpQPTRntQCu4QPY9LfK1XoBpe0dKClUcJI+WX0mmF1ISMJIThgU1FpIvK0psYHJxfG2Epo00I3ECOzFyADQvs1vgepP2wEnFxtkxeBceASVELo+qEDD52Vi+1eof6oQ+4FtbpaLzh+dNSdzYn7rtxW7RV4aYmPsGoN4u5O75uHXa/rZ5gSFM8Iu1B/322jfj767hry2YfkhtYVhKJqLxus3n7tGZZwgEJHFOMQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SN6PR11MB352082A063F3C4BD437E5CCE90EE0SN6PR11MB3520namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3520.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489a1e47-7ea1-4646-5d0a-08d881598257
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2020 07:07:50.9132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5XtWgURS4E4ukpsr6pgHwbbB84ggyC38Oq4HUQVss+rvWefpnpMaLWA72NZeCup/QjDPs/v5YTSpwIpfV81Ygg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2800
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SN6PR11MB352082A063F3C4BD437E5CCE90EE0SN6PR11MB3520namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Please apply this spec on smbios-mdr through your Intel channel.

Thanks,
Kwin.

From: Bruce Lee (=1B$BM{z4=3DT=1B(B) <Bruce_Lee@quantatw.com>
Sent: Thursday, November 5, 2020 2:30 PM
To: cheng.c.yang@linux.intel.com; yugang.chen@linux.intel.com; Wang, Kuiyin=
g <kuiying.wang@intel.com>
Cc: openbmc@lists.ozlabs.org
Subject: Please help provide some examples for how to use smbios-mdr via in=
tel-ipmi-oem

Hi all,

Please help provide some examples for how to use smbios-mdr via intel-ipmi-=
oem,
maybe it=1B$B!G=1B(Bs a lots series intel-ipmi-oem,
I want to know how to send a smbios file via function =1B$B!F=1B(BstoreData=
toFlash=1B$B!G=1B(B
and then smbios-mdr functions will to read smbios file via function =1B$B!F=
=1B(BreadDataFromFlash=1B$B!G=1B(B

below links is reference from upstream,
https://github.com/openbmc/smbios-mdr
https://github.com/openbmc/intel-ipmi-oem

thanks,
Bruce.

--_000_SN6PR11MB352082A063F3C4BD437E5CCE90EE0SN6PR11MB3520namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Bodoni MT Poster Compressed";
	panose-1:2 7 7 6 8 6 1 5 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:ZH-TW;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:ZH-CN">Please apply this spec on smbios-mdr through your Intel channel.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:ZH-CN"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><i><span style=3D"font-size:16.0pt;font-family:&quot=
;Bodoni MT Poster Compressed&quot;,serif;color:#00B0F0;mso-fareast-language=
:ZH-CN">Thanks,<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-size:16.0pt;font-family:&quot=
;Bodoni MT Poster Compressed&quot;,serif;color:#00B0F0;mso-fareast-language=
:ZH-CN">Kwin.<o:p></o:p></span></i></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:ZH-CN"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b><span style=
=3D"font-size:11.0pt">From:</span></b><span style=3D"font-size:11.0pt"> Bru=
ce Lee (</span><span lang=3D"ZH-TW" style=3D"font-size:11.0pt;font-family:&=
quot;PMingLiU&quot;,serif">=1B$BM{z4=3DT=1B(B</span><span style=3D"font-siz=
e:11.0pt">)
 &lt;Bruce_Lee@quantatw.com&gt; <br>
<b>Sent:</b> Thursday, November 5, 2020 2:30 PM<br>
<b>To:</b> cheng.c.yang@linux.intel.com; yugang.chen@linux.intel.com; Wang,=
 Kuiying &lt;kuiying.wang@intel.com&gt;<br>
<b>Cc:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> Please help provide some examples for how to use smbios-mdr=
 via intel-ipmi-oem<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please help provide some examples for how to use smb=
ios-mdr via intel-ipmi-oem,<o:p></o:p></p>
<p class=3D"MsoNormal">maybe it=1B$B!G=1B(Bs a lots series intel-ipmi-oem, =
<o:p></o:p></p>
<p class=3D"MsoNormal">I want to know how to send a smbios file via functio=
n =1B$B!F=1B(BstoreDatatoFlash=1B$B!G=1B(B<o:p></o:p></p>
<p class=3D"MsoNormal">and then smbios-mdr functions will to read smbios fi=
le via function =1B$B!F=1B(BreadDataFromFlash=1B$B!G=1B(B<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">below links is reference from upstream,<o:p></o:p></=
p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/smbios-mdr">ht=
tps://github.com/openbmc/smbios-mdr</a><o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/intel-ipmi-oem=
">https://github.com/openbmc/intel-ipmi-oem</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Bruce.<o:p></o:p></p>
</div>
</body>
</html>

--_000_SN6PR11MB352082A063F3C4BD437E5CCE90EE0SN6PR11MB3520namp_--
