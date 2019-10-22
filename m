Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80921E0DF0
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 23:57:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yS654T30zDqPR
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 08:57:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=01982f51da=matt.muggeridge2@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
X-Greylist: delayed 2413 seconds by postgrey-1.36 at bilbo;
 Tue, 22 Oct 2019 14:47:36 AEDT
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xzwm354WzDqJf
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 14:47:35 +1100 (AEDT)
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9M37EUu031012
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 03:07:17 GMT
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
 by mx0b-002e3701.pphosted.com with ESMTP id 2vsgs6wvr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 03:07:16 +0000
Received: from G1W8106.americas.hpqcorp.net (g1w8106.austin.hp.com
 [16.193.72.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2352.austin.hpe.com (Postfix) with ESMTPS id D502E107
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 03:06:51 +0000 (UTC)
Received: from G9W8674.americas.hpqcorp.net (16.220.49.0) by
 G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 22 Oct 2019 03:06:51 +0000
Received: from G9W9209.americas.hpqcorp.net (2002:10dc:429c::10dc:429c) by
 G9W8674.americas.hpqcorp.net (2002:10dc:3100::10dc:3100) with Microsoft SMTP
 Server (TLS) id 15.0.1367.3; Tue, 22 Oct 2019 03:06:51 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.241.52.11) by
 G9W9209.americas.hpqcorp.net (16.220.66.156) with Microsoft SMTP
 Server (TLS)
 id 15.0.1367.3 via Frontend Transport; Tue, 22 Oct 2019 03:06:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJRg3Pd2uHJTEmazP4J8rnOkaEd4UlwgzvC5VccUN6YGsNqIyD080vk47bPinzLPhE0+7WeX+GPRU72HnNhRZrbp5EF4TVgj4GZ/f/pLgf8h4fdTS9tsqHiCtXfTC0emOtz9pV/A6xn+MUwAQiEpIYq5E1E4dwLOO8aO++xJgqODo/CrX4ezOyBAIld5nm8cZ+jW70WeQv4mY9ZKN75sJKxezZPjjmOnAsmO+K6K7lgOF/yRCpulx63Ar6exIdKcoYO4LXkwL7IpIEqapMDFKelYdVlajd6eBXWCuGKj22mmn/YJD72S0ZGmc6nBoXQfHlKiTghEIIaT2XOxwWjAQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF5Oosu2B7GNeK/j2ybK0+hE56O7xmWpl7MgP3MQtuk=;
 b=PmvbibCjE2fUlwPQfqumBngBpX3fkueeGSGWlCgAX2HEzmfe635BWVsIl9AHL6RdUG9PdzfC2gCLKmzKolrP61kkCxpKME9BlkkcHGSUiI+UvqZnZXmWBoiuTKRN2VXNYmNP5UT7x5ZokSvRMIxlsIK3FG3u4TTPqY/Ak0UUL0HwduwKbM9Xj0mvfyGyrXqumKW1RKVBywmjdZopKBRmToH5sw+YQSJM41xm565/cADW32Umr2w1CONpINxnwZk5KJMZAetJpc8Mmdrk8haaHIOyISTcONvxYOEfhiKVIXcMSQahQuaWkMhU/x+7YvuiKYIztnfC+f2aotWvcta2VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM (10.169.92.136) by
 DF4PR8401MB1082.NAMPRD84.PROD.OUTLOOK.COM (10.169.92.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 22 Oct 2019 03:06:49 +0000
Received: from DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::549c:5769:d777:bb3a]) by DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::549c:5769:d777:bb3a%6]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 03:06:49 +0000
From: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Searching the openbmc mail archives
Thread-Topic: Searching the openbmc mail archives
Thread-Index: AdWIhVKKBrQWkDx7So2Yph7TvCsesA==
Date: Tue, 22 Oct 2019 03:06:49 +0000
Message-ID: <DF4PR8401MB10848A550EA75ADAB33B0B29D8680@DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [60.226.189.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d1ad0f1e-be9c-4215-afeb-08d7569ce1a6
x-ms-traffictypediagnostic: DF4PR8401MB1082:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DF4PR8401MB108262082685C8FC46E04F48D8680@DF4PR8401MB1082.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(396003)(39860400002)(366004)(136003)(199004)(189003)(2351001)(2501003)(606006)(14454004)(5660300002)(33656002)(186003)(26005)(6436002)(256004)(99286004)(102836004)(6916009)(7696005)(478600001)(55016002)(6506007)(54896002)(476003)(6306002)(236005)(76116006)(71200400001)(6116002)(790700001)(3846002)(66476007)(64756008)(66946007)(9686003)(66556008)(486006)(8676002)(86362001)(1730700003)(8936002)(316002)(81166006)(81156014)(74316002)(558084003)(25786009)(7736002)(5640700003)(66066001)(2906002)(52536014)(71190400001)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DF4PR8401MB1082;
 H:DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hpe.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x9buMG5dkmYkedI/sjP0jQSckv1zOUotfEtK7Hj9NrqnqE4R7wodQzJaL3kYTn2GWxnVibzLPH+cAJBxmJDVwGQrGJrJ4j24SO0AVUaZ1mVMAnnYCDj0Y9Y2I5m1x+JCBam3bI5j2/X1/3Ie8/2S23H1+gyUsCm2XO3IWoe3iwfscy8mXfd+l9No3Nkp02cugtthp0iWd/RmQRL9ej4k/ep3wWgZhZwLaUsN96BgxolVZfBh1DtMmAKTnxtit39xLGE+IpeHk2E3cP+sLe4Fxp9P0JfdYBu8PoQI0pE6NS7DNMmR4Zok/Ras03Dc2j9Q3yklbaVqXfnvV93CXTt3S+Wst5Z8FHGCuP/oUTwFA4FzqW9S0eoGvK9rarHHjYllf3Zkfk1GTkMAID3ideCquxVdXGi7gsaqPwqkOXgV4kx2MA2lkprXsiz8xBfw9bKnHckdakIu9dQgXme7dDY+Wa2yIzLOXVjjtq7MEnaJFEo=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DF4PR8401MB10848A550EA75ADAB33B0B29D8680DF4PR8401MB1084_"
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ad0f1e-be9c-4215-afeb-08d7569ce1a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 03:06:49.5309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+p65dJ2rL+adH72iINDVgS25Kl0xLsRIrwmj2yhtBduPhX1ubBIEJJZKocCTKFD/16GX1hzwORN1B3iAqI21Z6eyhFnp/2/MgOuP4YiWjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB1082
X-OriginatorOrg: hpe.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-22_01:2019-10-21,2019-10-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 clxscore=1011 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=406 spamscore=0 mlxscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1910220030
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:55:44 +1100
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

--_000_DF4PR8401MB10848A550EA75ADAB33B0B29D8680DF4PR8401MB1084_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello OpenBMC community,

I'm a new member to the list.

After some searching, I'm yet to discover how or if I can search the openbm=
c mail archives<https://lists.ozlabs.org/pipermail/openbmc/>.  Is there a w=
ay to do that?

Matt.


--_000_DF4PR8401MB10848A550EA75ADAB33B0B29D8680DF4PR8401MB1084_
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
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
<body lang=3D"EN-AU" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello OpenBMC community,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m a new member to the list.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">After some searching, I&#8217;m yet to discover how =
or if I can search the
<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/">openbmc mail archiv=
es</a>.&nbsp; Is there a way to do that?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Matt.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DF4PR8401MB10848A550EA75ADAB33B0B29D8680DF4PR8401MB1084_--
