Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30145346CC5
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 23:26:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4mDK1gPNz30MT
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 09:26:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=FIIcorp.onmicrosoft.com header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-FIIcorp-onmicrosoft-com header.b=fnef0WKd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-na.com (client-ip=40.107.220.72;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=mohaimen.alsamarai@fii-na.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=fnef0WKd; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxwlN2J37z30Hd
 for <openbmc@lists.ozlabs.org>; Sat, 13 Mar 2021 06:25:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCsHb+lj/ro3IWqL6xnG6iAF2bg7lFApHLXruco3gsa3aXahAJwTrFIIMfDBkp+yidF14Y0kughtYEjMuMsSzLijnDCVj3/C4RfjQzpgut6pjihiu3wqs4ChCHampdwTBCO4WKxnRFo++V1PbGOzwWZhFDZjcTuYWYGKbflzfR0eCiHKo/HTaSAvMy5XQG+i/KMDfLnVYfntZYbeuk5mR9JdPX8Qt55KEn/7cV9dNuVToLHTa9am6CNtquyeTAOt2EWXJEOI1PvgTawwEvqj2RpaIdXiSm9shNR9+1bpta7bR9gsDABUZFUTy8J77+zTU33BcU8YqESuXXotWxIEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzyfUMkczppC93DYJbiGuMIbaGqlq4fyXJ7syeyZrJ8=;
 b=UkLcz9JLGaAarHFohzipB84E85R/Pt2NbIWPZBRlzsFkQxKWzONYaTuHpq0PqAWtSDHSjfG4fVTAMNK5dFvJJtVR25l/uIs/Y7MO2rSywTv4hTj5We2oITTt7dNnZNP7ObkHaPj8q6AHoWzlbSyeYRhdJ9D0KAKNtewGGzvcaf+HeKBA/ianUoBjaHmWGlIDIPSVuyj9Hht57sFNAdyD0huT+KEWsWHt52F0O6xVV1pO8qpFP9oETlJzXvQhmi16HUwywYUcyW50NCrrwSThhG/bSj5zYQBDVugfZwDDHKV7JpQQefBkSSyn/EQmYfB+mJTa+HUqe31jGNfIZ9TxDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzyfUMkczppC93DYJbiGuMIbaGqlq4fyXJ7syeyZrJ8=;
 b=fnef0WKdbhcWrRX65le9L3ihhqvlSz31WtsmMH+9DmjMqIDYkelhofLfQ8c4TcWiovZjS44N9yvhoiihfokb4n1j2ByWpkAIvwAlrolWtRlhczG3PBi/c7qTcV0jireK5PKpn+IIaVkjbrWOnMAJgUC2Rk+tNXxBeP2Sa3o8l4Hlol5j7WxGsMbxVq1PR0xaOkUBzXF1jhqcBkopaTdzFR3vbvdObQW/uXu0V8u1/gR0x9iSye9qrJB5U+8csLy1Q7xRNFrpulbrlmfxGm1lWLIG/YsiXtUnZWlPNsgzSJpG1htzeRJ8j5zKEhELLbkFglKQJ9dtoWxdQ3OQ1VqctQ==
Received: from DM6PR08MB5883.namprd08.prod.outlook.com (2603:10b6:5:152::18)
 by DM6PR08MB5596.namprd08.prod.outlook.com (2603:10b6:5:10b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Fri, 12 Mar
 2021 19:25:43 +0000
Received: from DM6PR08MB5883.namprd08.prod.outlook.com
 ([fe80::1cfc:cf12:cc1d:3298]) by DM6PR08MB5883.namprd08.prod.outlook.com
 ([fe80::1cfc:cf12:cc1d:3298%3]) with mapi id 15.20.3846.054; Fri, 12 Mar 2021
 19:25:42 +0000
From: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>
Subject: group for foxconn CI  / fii oem repo 
Thread-Topic: group for foxconn CI  / fii oem repo 
Thread-Index: AdcVIZiiqI1Mo4UGRXSPEPz8kXQKEACU66GA
Date: Fri, 12 Mar 2021 19:25:42 +0000
Message-ID: <DM6PR08MB58834FC516032C1D11C9F9F9B26F9@DM6PR08MB5883.namprd08.prod.outlook.com>
References: <DM6PR08MB58838020F8543D03C6235064B2929@DM6PR08MB5883.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB58838020F8543D03C6235064B2929@DM6PR08MB5883.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=fii-na.com;
x-originating-ip: [65.205.114.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9772e551-434e-411e-a434-08d8e58ca0dc
x-ms-traffictypediagnostic: DM6PR08MB5596:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR08MB559696541C14A70F389D7597B26F9@DM6PR08MB5596.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U+H9J6rMIvdYldOH52DAYDBoDZ/crTRjiWS6FfD7tKUBQJIxY3et8IH8Qh3RrrtNtkXEEVBpNaJ60OwTniZ9Fb0Z/QFB0UBIVfPJQDW0QcdwM6JnHzulfp7YlXEfZW/8OKU3KTE7jReQ2TSncZml3MgM49nekrfsemJlJx/uX/Xh9jH2RLvpKjRcONpWQqw7YQTdIMJGQWIH5tvntPjNsZRFtTmxZTmRpcAPkF3WFPBVxt4GgKWPzOyunFpRgpHQG9uSKAxw2FxyHSmTaKWD2ttFsONTy9POFBWeu2NQeC4xvIZ+DxnP5xFGWQOzrq4JATDXLTrmu+76jEDeBWvmypHh7NreRc1EGPA1/6srB3iojXHMaG4MYI42Zcvt/4Ryh035iE6/4cd0REpGw/kingH8xzP4mgx3nSKAWVZNNS8HLUUpY/vA3QXPPCyIP0nc6eyy65EuH97AUlFHvQcUBJt7hk5+9wZcPslps3KlrKlyOnh2ExFYPrqMBg5sB8t8z39SCJcuCqFDpa3mnnWeaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR08MB5883.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(136003)(346002)(396003)(39860400002)(4326008)(186003)(33656002)(2906002)(8936002)(7696005)(316002)(558084003)(9326002)(76116006)(478600001)(71200400001)(107886003)(4743002)(52536014)(8676002)(6506007)(66446008)(66476007)(64756008)(66556008)(86362001)(9686003)(66946007)(110136005)(26005)(5660300002)(54906003)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?2Dzx02KeUE4L0wTGd07dXhPG3X2xpHnklYq70jzq2iB1JFHa8dJDhic46GnL?=
 =?us-ascii?Q?RGDmISB2npoK6WK+XIeoZ9eEE9SuUW+xtQZUycC6YyUvoLwD4iqiJv0TcYzW?=
 =?us-ascii?Q?uPV01YkiQMDK31CEwhHU00XL1p9UTuCjjbL5U6Os40EHB7K+IftN5oamIbfn?=
 =?us-ascii?Q?86XMAORAXT7kJz2LzS6hqbQmp4NzpMzRl7u40462wIJH7bom6XBGVBqM5UNv?=
 =?us-ascii?Q?WBRlZM8hyl/Z3uOvJwnskCOp9sEkj1g37YjVPlgpuj+wpNPnlrpugGFez/A4?=
 =?us-ascii?Q?e75Phbay/bbhLxNE6Hlh0SKplik4EdlMtVZROCtOsiAv7G4bSF16Je5i8HWk?=
 =?us-ascii?Q?ldpCew6TzUyDpUY/j7y6INJHmwMmIW0A6wmlwMmV3BVMwQ10X6sAbK84bHGu?=
 =?us-ascii?Q?z1q2A31Ll9u/5tpV02c7xCkugxU8EUNoENE6dPT0CUaPDxJba4/mYtxX1FNl?=
 =?us-ascii?Q?+tfnyOt6KwXsNCe8NVfm/kT8xMxiFWrwDvzS6TB/dfkWkYxRZe141JOov0VJ?=
 =?us-ascii?Q?zQqc8ef2jEw7od9x+QbPtzUfVVN5Q6w7y10mDCceh3jiymW9QNuLpKOw/ht5?=
 =?us-ascii?Q?DvxSmOCn1i9m068xuWDbFL0653msUo4vFCoc/GaGZgc+GBzJs+uYiMl6O0+H?=
 =?us-ascii?Q?kaO1XguapAYUCLY2PbBZeKhD1cMzVKWaDQlUIZ57Al1vvSfTPRAQw1m/Nrpl?=
 =?us-ascii?Q?CqM+iEqs0H+xBI0Fpp8C3rF4a2QPAhb+MQpHzYKXxDNH4FsQtO8K/qTIoxno?=
 =?us-ascii?Q?n+S43Pqqpo7hp5EKbeNvxGcIm3n7p0D4EdJvulYXLGpY2q+PeYWmtaFZMtwn?=
 =?us-ascii?Q?8ToF+sXQmd4YhKYI8hc54yZIQh8reFBBSWofpsIXKhduYjziaDWDLT0vCFCV?=
 =?us-ascii?Q?Lhx2u9JxacuhUeQua86eTM9NEtE0UAqPq3Lt1db7ZQHhr3dvigi2bXYwUtZx?=
 =?us-ascii?Q?IimE88U135LyWxhAvt3f8p+ZX6FqVBEQR4GSP1YntgBc7gn/LsYEM+fAHB3X?=
 =?us-ascii?Q?MoNIB+6xnp9pMUEW0+QzQUk+IeRDimlpjry888Nn+u34Q6j2F0B9OcPfXZi5?=
 =?us-ascii?Q?MacjnC96pDo/6sWIUcgKdfPQuRwIh4EHax7eaw098j2Lb1sJqagy30LkGsdd?=
 =?us-ascii?Q?FfP2qBoEsASkBj9433P4qjE0LW404ZihL2sWsmc+6k3OB4rCgg1tCl+CoASZ?=
 =?us-ascii?Q?oJE6tDqAbyh5+0AtBkK0HwWgLelial/L52F/ZHNjkZpzuXK9Ur6u44jR5DSB?=
 =?us-ascii?Q?jfzbozo9IJ2fcfVsxrGzhOhupmJtLbTl2qkcDVSYkLIZFSmrDOzE9clmD1RA?=
 =?us-ascii?Q?bVhJh8SlBWU51jL+XAmjv66l?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB58834FC516032C1D11C9F9F9B26F9DM6PR08MB5883namp_"
MIME-Version: 1.0
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB5883.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9772e551-434e-411e-a434-08d8e58ca0dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 19:25:42.9432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q0wi2SqYbyeXWYvVnLfUEwrXOjIiYzqpknSq16IHuHPI/pwCKbHN5eHCz/lMN3HGEGEJg2WEVTKGeE3MjbVu92At38rYfq9hNrR0o+oGFxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB5596
X-Mailman-Approved-At: Wed, 24 Mar 2021 09:25:27 +1100
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
Cc: Lancelot Kao <lancelot.cy.kao@fii-na.com>,
 "vveerach@google.com" <vveerach@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM6PR08MB58834FC516032C1D11C9F9F9B26F9DM6PR08MB5883namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Brad,
                How can we create Ci group on gerrit and add people to it
And we need to create new repo for the Foxconn ipmi oem

Can you please help with that


Thanks,
Mohaimen Alsamarai
BMC developer
FII USA



--_000_DM6PR08MB58834FC516032C1D11C9F9F9B26F9DM6PR08MB5883namp_
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
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Brad,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; How can we create Ci group on gerrit=
 and add people to it
<o:p></o:p></p>
<p class=3D"MsoNormal">And we need to create new repo for the Foxconn ipmi =
oem <o:p>
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can you please help with that <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Mohaimen Alsamarai<o:p></o:p></p>
<p class=3D"MsoNormal">BMC developer <o:p></o:p></p>
<p class=3D"MsoNormal">FII USA<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR08MB58834FC516032C1D11C9F9F9B26F9DM6PR08MB5883namp_--
