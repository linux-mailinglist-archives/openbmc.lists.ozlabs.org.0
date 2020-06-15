Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2651FA3B6
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 00:50:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m6415jfszDqcJ
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 08:50:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64;
 helo=hqnvemgate25.nvidia.com; envelope-from=vasantp@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=Twz588N/; dkim-atps=neutral
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m2lM5JKvzDqbl
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 06:20:42 +1000 (AEST)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ee7d7e50000>; Mon, 15 Jun 2020 13:19:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 15 Jun 2020 13:20:37 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 15 Jun 2020 13:20:37 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 15 Jun
 2020 20:20:37 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 15 Jun 2020 20:20:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTkAnOsO0ApmT0dMmDEnDP9HUcpNOAmZtOufOQxjIeJuvzJTgMHi/o62YmE51qx52P7Rf8EnHrsf6Z/UiYPmZdMj1V0vEX0zpvKUoHLVsJXjoOT91gvsvbb+QSOJAqhdQ4tWMCgVPsOXLM+6UcwTQM2VLBLI1q/S4xvgp52PN5Npbs8NNdC6Wr+bVuNQ5PLKNtxmvd9pRukZa5yZX45WmfRbrbldDd10/qCYvm4AoVRrszHUr7VLiSM72EzUR/6JbrBa/eY9xEoHoufkUsdEc4xtglbnO18j7RODTUQqrLR0XnhZYVV4MwQsSLorD0qnGym9ahHbtRoeuMhv+0ImbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpxkkDag/hFQHSIwY+zz4P0pgvCcrZ0khHxDpJm4FPQ=;
 b=IqMa3ZJZ/VmRTLMFAfcC4D4Ikofkqoj4A/HcpKBQsKvYrPeW34ky/sZ6osMDzsgU8sAs/vfGkgU89XdCoGxf72UwuQsxZsG3q7V8VkWOPLy4LkFEU0h56pWU63DsfT1Zob0+C7FGfWG1/exG+ydy+aBIQ/hB43bir/GUB8mruZK650NG0DT/+ZDPU2EuqkWrYl80YWVtnvkPJP/5m3mI7GQ66SiYFnuSMSCrfRSdK8pdzeb6OAAC0xCesiQhDv74bJHT+TQ9CMcRrvsHN7o+TVMu6QbHO35GVxaqrhwLvjG17+d1mhLRk0gyP/44RLeLWBZwtmymymfmbumjI3a0LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BN8PR12MB3282.namprd12.prod.outlook.com (2603:10b6:408:9e::27)
 by BN6PR12MB1122.namprd12.prod.outlook.com (2603:10b6:404:20::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Mon, 15 Jun
 2020 20:20:36 +0000
Received: from BN8PR12MB3282.namprd12.prod.outlook.com
 ([fe80::7892:2d85:21b0:770a]) by BN8PR12MB3282.namprd12.prod.outlook.com
 ([fe80::7892:2d85:21b0:770a%3]) with mapi id 15.20.3088.028; Mon, 15 Jun 2020
 20:20:36 +0000
From: Vasant Patil <vasantp@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC Radish support and Working Group meeting
Thread-Topic: OpenBMC Radish support and Working Group meeting
Thread-Index: AdZDUdFaBV2wt1byS1OoEsMoGh3/VA==
Date: Mon, 15 Jun 2020 20:20:36 +0000
Message-ID: <BN8PR12MB32820451E47D3AE41B7401A8C79C0@BN8PR12MB3282.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [12.22.141.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc91a98e-e357-4754-e99c-08d811699059
x-ms-traffictypediagnostic: BN6PR12MB1122:
x-microsoft-antispam-prvs: <BN6PR12MB112221B197221FEC465F860DC79C0@BN6PR12MB1122.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fe3BqMpWtZRLISxBG+iTWkpeK9Dv9FwCaeQzD0unMZppyRJ5qw11SC8ovkZIp5VgM+U9KPe1KTiSoCpiBe0rYX/YIRv1sKWU3yFCvN96Bp4tCX/5VG5VgY+8MK0s7DhFgyvCvkE2xsBhmuoPSR9C/DaYbphWEjnjfWBNuSM2N739DYZ5gzO+sbbJxyhrBLNDDBLLbfjgirE7X54AgvRXmV99HtVdUF0mayTwGdcOIu4cqk9JEapCdMARA3/w40gfMdoEgpfZZzvKEf0casI0O23uHRw8XiLodvLWxZYWSzVXmmMJFZtu3CSDKkDhE2cTsMW3PON8CMeb308u4Sem2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3282.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(346002)(396003)(366004)(136003)(376002)(86362001)(66946007)(9326002)(186003)(33656002)(52536014)(6506007)(8936002)(5660300002)(7696005)(8676002)(26005)(66476007)(66556008)(66446008)(6916009)(64756008)(76116006)(71200400001)(478600001)(55016002)(316002)(4744005)(2906002)(9686003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: trBdUx4PSRJa2oBTeNNrTWJjK1YibIErAg8qU+lo6wTI8D2rXRdH2N80fWhbmaFd5UOabSU0DsXvCggVQ6YYtUj4SdLJAmAB3L47haPQZWMGiIpm7AjZ77ky1yFdp6amOut2F1Wf+SoEWDAj7bIBcgvf8XDDBeCmXR2ylME8GmaCDE+RQkO0/3D3T6km9qzhGUqOxosBZbCgMYI9XoiZnZUC7slKo60tS8haFfW7kI/9A8k4RPXKIKpEQyFyGRDtmchKv+geKyoIVha4AWEiRTAT5CtP6pv1y1nmf+B0LbwhmRzvGIvOzZb0yAEwyEiO+XPnFB85mSYjPUssSPcah/wmClVODDMJuFy3fAW4kQubssv87y4ek/3oJs/XhnbG+lAAzx5dQ9rmN1mVVcQZ3JBLXS/gBEBMvnOb86+KgRWdE9slpm2i1DC0Gupk38eaxJA99IOftW28w2udWYzkQ8P72EuDBU4zxGaE0n1yO1oDcgIRp4fKMoMOf1/Ys/bo
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fc91a98e-e357-4754-e99c-08d811699059
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 20:20:36.2186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o35th2Bfio8GTJCXugIqbujGcYeMWUxY66y5LHfsL/Hht1bYLr9asBCi3FPsijIIwpD+Mp4m3We2bJ9bL2wC6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1122
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_BN8PR12MB32820451E47D3AE41B7401A8C79C0BN8PR12MB3282namp_"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592252389; bh=VpxkkDag/hFQHSIwY+zz4P0pgvCcrZ0khHxDpJm4FPQ=;
 h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
 ARC-Authentication-Results:From:To:Subject:Thread-Topic:
 Thread-Index:Date:Message-ID:Accept-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
 x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
 x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
 x-ms-oob-tlc-oobclassifiers:x-forefront-prvs:
 x-ms-exchange-senderadcheck:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
 MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
 Content-Language:Content-Type;
 b=Twz588N/G3Ks/jCS1n9oqB/S5gFZdeNe0DaSD208PckPdQJruf2XWjTkqhxOh8xFE
 ToDr0qUzIyhd5ob/RjbGRcGTMNGAQMEri1uD6P+ScwDP1kja+3n6Ykp6YdVll7BWXC
 X6ctiY/yW3qe8opDW560KdtYxmxZIufSwpoPGn0CPQPh4I4nYK49U+AJpZtnIqk8w5
 Tk/F+ItEhOlv8Xa7kKDVh3+lghV2J9c0zTh/60ZuXIeNFFHMdRrx9cv+Rf5PPeqePk
 5NRhTufyqfAACTl19FNxB93+3KceMMUMGKsDHQXBk5/+wAEabERKXc8eI+c+DIWEs5
 PIf3zUGXXhPSg==
X-Mailman-Approved-At: Tue, 16 Jun 2020 08:49:28 +1000
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

--_000_BN8PR12MB32820451E47D3AE41B7401A8C79C0BN8PR12MB3282namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

I am Vasant from NVIDIA corporation. We are exploring adopting OpenBMC for =
our products.  Thanks Andrew J, Deepak K , Patrick Williams, Ben Wei and Sa=
i for your guidance so far.  We have below questions . I will create separa=
te question

Is below two functions supported via redfish

  1.  System Boot order change
  2.  Changing SBIOS(UEFI) configuration parameters e.g. Hyperthreading ena=
ble/disable etc.

General Question:

  *   Are users allowed to attend the working group (like PMCI) meeting who=
 have not yet signed the CCLA?

Regards,
Vasant

--_000_BN8PR12MB32820451E47D3AE41B7401A8C79C0BN8PR12MB3282namp_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1518814741;
	mso-list-type:hybrid;
	mso-list-template-ids:-1803277234 2070165562 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1
	{mso-list-id:1998457612;
	mso-list-type:hybrid;
	mso-list-template-ids:1322023026 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
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
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am Vasant from NVIDIA corporation. We are explorin=
g adopting OpenBMC for our products. &nbsp;Thanks Andrew J, Deepak K , Patr=
ick Williams, Ben Wei and Sai for your guidance so far.&nbsp; We have below=
 questions . I will create separate question
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is below two functions supported via redfish<o:p></o=
:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo1">System Boot order change
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso=
-list:l1 level1 lfo1">Changing SBIOS(UEFI) configuration parameters e.g. Hy=
perthreading enable/disable etc.<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><u>General Question: <o:p></o:p></u></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo2">Are users allowed to attend the working group (like PMCI) meeting who=
 have not yet signed the CCLA?<o:p></o:p></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Vasant <o:p></o:p></p>
</div>
</body>
</html>

--_000_BN8PR12MB32820451E47D3AE41B7401A8C79C0BN8PR12MB3282namp_--
