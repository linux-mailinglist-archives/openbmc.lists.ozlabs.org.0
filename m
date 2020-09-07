Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3401D25F238
	for <lists+openbmc@lfdr.de>; Mon,  7 Sep 2020 05:53:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlDsF26L8zDqS4
	for <lists+openbmc@lfdr.de>; Mon,  7 Sep 2020 13:53:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=hyvedesignsolutions.com (client-ip=66.46.24.197;
 helo=smtp5.synnex.com; envelope-from=bradc@hyvedesignsolutions.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hyvedesignsolutions.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=synnexcorp.onmicrosoft.com
 header.i=@synnexcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-synnexcorp-onmicrosoft-com header.b=S29g69GG; 
 dkim-atps=neutral
X-Greylist: delayed 905 seconds by postgrey-1.36 at bilbo;
 Mon, 07 Sep 2020 13:52:31 AEST
Received: from smtp5.synnex.com (smtp5.synnex.com [66.46.24.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlDrH5z2MzDqKs
 for <openbmc@lists.ozlabs.org>; Mon,  7 Sep 2020 13:52:31 +1000 (AEST)
Received: from GSC-EXCH5.synnex.org ([10.84.32.33])
 by smtp5.synnex.com  with ESMTP id 0873bBID013368-0873bBIF013368
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=CAFAIL)
 for <openbmc@lists.ozlabs.org>; Sun, 6 Sep 2020 23:37:15 -0400
Received: from GSC-EXCH6.synnex.org (10.84.32.34) by gsc-exch5.synnex.org
 (10.84.32.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 6 Sep 2020
 23:37:15 -0400
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.54) by
 gsc-exch6.synnex.org (10.84.32.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Sun, 6 Sep 2020 23:37:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UakyUFCzpFI42v2c10SazPCWD/sbhCqmSZqNRdSxEdhmiPY/UlHlIYbQNQZJByd0qsPYLd/onVaRgFUphushPVsq058aiyDOratGs0Y9joNU/gOekKYJaUGnlw4Oa0DOcV3oMbfbAJxvAlQNg4Heq7wHeMAE/CFLMz609L1NjpxdkIbosWrDovXSBW4ycY0NbiUEhwkV6zcwTdwMk/7kWt0lddLQh+zmBzEyGEKdbiBqSZZ3nBkkeqxMMelEnD5H0PTqNmDhQVDeAQvAw07abQM7GAPP9GRDyS2hCXNlUX7iVYK8NR0tlnhxZ+8GSL5KoLwLBhpA5j56Vp8Tc6Lduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nigSWHcRxUUvpflmxQdyJtEjo7JnazD6YSCf16MKY9Y=;
 b=e3FfNWyvOiXXGW7wBkfGZvEMLvEww+7KPcF1w2rWSOjA/IE5Ip01YNiWyltGAkaJFusiVaWPadZfcRpQ1OYIkb4vXobssybdAjWdNcDjpcmAAn3lBXYEECMAymitRevE6aoEcVJv53E8TGuJfkcbyCoEFdgG2ps86wqoNArrz1UoDoDprdkVzdBdGo7xh2GYHUPmSD1Nsv6eQB3xUOQIXU0dnB7li1ab4vlJyAtOx5AxSPFj83T2lvUgkXfFYp6CND3fMD+FfgkAkJL0VVPOUzUkTvhl9XX74VSe7ArsEH/9pRSHJmQ7jajrBqkuTZI4USUee1J6OYtf1Rg/DB7TUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hyvedesignsolutions.com; dmarc=pass action=none
 header.from=hyvedesignsolutions.com; dkim=pass
 header.d=hyvedesignsolutions.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synnexcorp.onmicrosoft.com; s=selector1-synnexcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nigSWHcRxUUvpflmxQdyJtEjo7JnazD6YSCf16MKY9Y=;
 b=S29g69GGVFoqxuYHS5CiNzRiFdYUAhP9EXdwFLllfYEJFHt/twHl6B0pqTuRyqwGCbZzSK/+e92TjSXRPAuDfKI4S27LwZXje7zbVx1YUsOAtVQY/O83+KiP2nnNBJgipSmh1I18URo9M0VPZFW5jO0FbJfHwdBvECnLOzNJeHg=
Received: from CY4PR04MB1033.namprd04.prod.outlook.com (2603:10b6:910:54::14)
 by CY4PR04MB0374.namprd04.prod.outlook.com (2603:10b6:903:bb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Mon, 7 Sep
 2020 03:37:10 +0000
Received: from CY4PR04MB1033.namprd04.prod.outlook.com
 ([fe80::a19e:7cbd:edf6:ed50]) by CY4PR04MB1033.namprd04.prod.outlook.com
 ([fe80::a19e:7cbd:edf6:ed50%3]) with mapi id 15.20.3305.035; Mon, 7 Sep 2020
 03:37:09 +0000
From: Brad Chou <bradc@hyvedesignsolutions.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: What is the purpose of Phosphor Inventory Manager
Thread-Topic: What is the purpose of Phosphor Inventory Manager
Thread-Index: AdaExUmzA4tGaNk3S5yhmajeaO0mjg==
Date: Mon, 7 Sep 2020 03:37:09 +0000
Message-ID: <CY4PR04MB1033C04444A28A488631A5ABB9280@CY4PR04MB1033.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hyvedesignsolutions.com;
x-originating-ip: [61.222.103.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5995005-198b-4c43-1ded-08d852df4d21
x-ms-traffictypediagnostic: CY4PR04MB0374:
x-microsoft-antispam-prvs: <CY4PR04MB037493DF59714210BBDF9C26B9280@CY4PR04MB0374.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C9fT5y4x1Rhc3qIXnrfrq8K1tLQlOnkEXgDwthaW8TtAfY0Buv1iRZVGLr83eiaYaEzz44qyQNAPISG1MCFcNmM/Y2XtLrbv1bo9RFX6jirNzOxpKAGvJoykb29vTA+i5yd2GRq6qRiLwZY6jxt2MmNONNfbldldcCXIoj4GiwRc6rtb/YWnqLDoPVxQhVrIsIZGrZYcJpkw607xhFr15MnTvkI5YHDWbEV3R9n92SjkKCND6TxYT1GDCJkUQN2IS7bLr1t5cAo26HPMW0lZktL2TIZEKUkgyZh5yX0rv0biT35nqQbS1qhCUPF59S1Rr5wDzJzn4+pLimPBBHSidQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB1033.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39850400004)(376002)(346002)(366004)(33656002)(76116006)(66946007)(83380400001)(8676002)(66446008)(66556008)(64756008)(66476007)(8936002)(316002)(186003)(71200400001)(9326002)(9686003)(6506007)(7696005)(26005)(4744005)(478600001)(55016002)(86362001)(52536014)(5660300002)(2906002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8Gv6GqIb4w2X4AfeBpaHoqepisbMSiCC/dIGNl4g5k0+s4SmuT7QAqmtidAFe6dEhRtkm80xY1XNdJSFv1YZ7DBYDm+cSHmbxpEqv/QMjmAP9LxF6lWBJEnkszZhVRtl+v+p0bJzQOs4aHMf4Bym/JZWYHQ6MG4QYGDEuERakzmiAIh3Gt2itGPzDjClreyxSUj1icMiZ/NxnoRNK8RlkY9lIkHrw3lxSA9WyKi3CRItoRMgebojIivJl1As7kjrf7+WIMFlDnV8lui+dJDlYLTKCWA2qVWJZybfLIAwYTzxgWLkH5j7b/syEsgm/FXhKNoQh1z7XGoe+tq/+hqpxA6oja2UcxFQuDxuOtHFeQhjVQ5jXjv81BK4MEBdZ37//6s0K4oGM8K6d6HlDUP7TN4J/scdMPPuCl62CyL0rwek/PJZ09VC6y1vdacyx3t3FOc0lLGX6lxnF9ZflWBvCaPE1E0LHsa6jjMagk1qWAxmHSHxKC5HICFecNZf1G6wm6ISEDdUXTjPWD0efvQxKhwM15xYpJ00qpoM8BJiAw913Carzei+Fsch1ls1RNBgAPDWdEMegLWYzRHDkc/Wpho720BDs1sYCnc4/obX2xgMQxGjq2wuSyfCw/wZA6Nay0y+2Y8A7whyWWYRS4eYsQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_CY4PR04MB1033C04444A28A488631A5ABB9280CY4PR04MB1033namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB1033.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5995005-198b-4c43-1ded-08d852df4d21
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2020 03:37:09.6206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 972a0e27-c355-4fd7-9225-9266c8f332ac
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JaZX0ygsQR2rwvcybv0zIj0sds+eQsY0is1MhvMYKL3yCnD/N8rlwxnDXUE5aRtlcj39ElyeelLkiuwlhbDdvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0374
X-OriginatorOrg: hyvedesignsolutions.com
X-FE-Policy-ID: 6:1:1:SYSTEM
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

--_000_CY4PR04MB1033C04444A28A488631A5ABB9280CY4PR04MB1033namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
I am doing some study of what Phosphor Inventory Manage does.
After read the README.md and the examples directory, I think it does two th=
ings.

  1.  Create/Delete/Update Object or Properties based on some other propert=
y changes.
  2.  Create Associations between sensors and it's belonging hardware.

There is no enough example to tell me when should I create/delete/update ob=
jects and properties based on other properties.
Is it necessary ?

Also, when I use entity-manager with dbus-sensors to expose my sensors, I f=
ound the dbus-sensors create the associations of all sensors for me.
I don't need to write another YAML file in the Phosphor Inventory Manage to=
 generate it.
Does it mean I don't need to use Phosphor Inventory Manage because dbus-sen=
sors already doing the same thing ?

Thanks.

--_000_CY4PR04MB1033C04444A28A488631A5ABB9280CY4PR04MB1033namp_
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
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:312367485;
	mso-list-type:hybrid;
	mso-list-template-ids:189961524 67698703 67698713 67698715 67698703 676987=
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal">I am doing some study of what Phosphor Inventory Man=
age does.<o:p></o:p></p>
<p class=3D"MsoNormal">After read the README.md and the examples directory,=
 I think it does two things.<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">Create/Delete/Update Object or Properties based on some other propert=
y changes.<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-le=
ft:0in;mso-list:l0 level1 lfo1">Create Associations between sensors and it&=
#8217;s belonging hardware.
<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">There is no enough example to tell me when should I =
create/delete/update objects and properties based on other properties.<o:p>=
</o:p></p>
<p class=3D"MsoNormal">Is it necessary ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Also, when I use entity-manager with dbus-sensors to=
 expose my sensors, I found the dbus-sensors create the associations of all=
 sensors for me.<o:p></o:p></p>
<p class=3D"MsoNormal">I don&#8217;t need to write another YAML file in the=
 Phosphor Inventory Manage to generate it.<o:p></o:p></p>
<p class=3D"MsoNormal">Does it mean I don&#8217;t need to use Phosphor Inve=
ntory Manage because dbus-sensors already doing the same thing ?<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
</div>
</body>
</html>

--_000_CY4PR04MB1033C04444A28A488631A5ABB9280CY4PR04MB1033namp_--
