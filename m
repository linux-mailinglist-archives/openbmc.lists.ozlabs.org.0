Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 201DCE6C05
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 06:39:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471k6W45jHzDqgH
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 16:38:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=0200d20659=matt.muggeridge2@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46z7G35MYhzDqMW
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 11:21:26 +1100 (AEDT)
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9O0BOO0002147
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 00:21:22 GMT
Received: from g4t3426.houston.hpe.com (g4t3426.houston.hpe.com
 [15.241.140.75])
 by mx0b-002e3701.pphosted.com with ESMTP id 2vtp4kn9nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 00:21:22 +0000
Received: from G1W8106.americas.hpqcorp.net (g1w8106.austin.hp.com
 [16.193.72.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3426.houston.hpe.com (Postfix) with ESMTPS id 624524F
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 00:21:21 +0000 (UTC)
Received: from G4W9327.americas.hpqcorp.net (16.208.32.97) by
 G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 24 Oct 2019 00:21:21 +0000
Received: from G9W9209.americas.hpqcorp.net (2002:10dc:429c::10dc:429c) by
 G4W9327.americas.hpqcorp.net (2002:10d0:2061::10d0:2061) with Microsoft SMTP
 Server (TLS) id 15.0.1367.3; Thu, 24 Oct 2019 00:21:20 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.241.52.12) by
 G9W9209.americas.hpqcorp.net (16.220.66.156) with Microsoft SMTP
 Server (TLS)
 id 15.0.1367.3 via Frontend Transport; Thu, 24 Oct 2019 00:21:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQim0xWwlFAWbyNcldjYETLP6jWokx0idtYVv/+Q/jpHvxXrOFfrSMQr0GnvIGTXrsGRIPmzYwWNM52chV3mFqXJS3TD3oAUhsJxIEYm2OmBymn7JRlS7ZcQc28hWMuVzXgnaOB46g1ZBevXea3zKetFuZ1/FdhD1tHkG2ZT7med1+gf0Q1momyvMNpRf7B1ksLiUPW+cOssHtzKC7RE4xJdUA4sJ5OlmWbgt1UIwr9WMPek+1njiKuHrhO324Y245MXziZU2paEzVmE+5HvZbJzMWmbhXHTbKVlyWe1vk3XMTsY/V9WXEFvfHKoa/5Phs7vIU/blTE49Ud8XFWw2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnJ2RUXJKq14dTiUoqCc9x8hb+4wPFDjxoH2hXJpZ3k=;
 b=NDbzie3t8cVi6FzU5rjqe/gt9OrrKP2ivXB7QnOc+ADIXROOM13+QuNPY4EQONTZTP9Le42bzSyUUjhFdWcxD/gS3STSl9ByzCfx1VhaQMwKk+zUNqZkMZVL7gw9HUwGce5dftzs9QeaRb2mKEWKGJLaFm9KWk5upWKHsD/ILsUpZPLN/MJ2DQVx9Up3Tso/Wb+4FpZd8wFKxQQ5hHRG8zUFJhPjgDi9DFTRgYXNqvSNjOeG7LYPAIvFbWFHnQ1N8e41p585QJLp0aI4s68dPkVqnb0w9nNQmAwwzz/43zm2OQCb1+0UDwEZAET8z1ijdimOMFkvHWfUOuz+HwT1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM (10.169.92.136) by
 DF4PR8401MB0907.NAMPRD84.PROD.OUTLOOK.COM (10.169.87.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Thu, 24 Oct 2019 00:21:18 +0000
Received: from DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::549c:5769:d777:bb3a]) by DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::549c:5769:d777:bb3a%6]) with mapi id 15.20.2387.021; Thu, 24 Oct 2019
 00:21:18 +0000
From: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Curiosity: Why is the OpenBMC layer named "phosphor"
Thread-Topic: Curiosity: Why is the OpenBMC layer named "phosphor"
Thread-Index: AdWKAHHvH4cEuoZBQpKgd9B6kReChA==
Date: Thu, 24 Oct 2019 00:21:18 +0000
Message-ID: <DF4PR8401MB10841D9A4AB2C85B587D477FD86A0@DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:8003:793e:b800:68b8:2314:ddd1:edb2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1dcfc1fb-0d8f-48a6-f9f5-08d758181734
x-ms-traffictypediagnostic: DF4PR8401MB0907:
x-microsoft-antispam-prvs: <DF4PR8401MB0907DD988BD80478354D01CFD86A0@DF4PR8401MB0907.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(39860400002)(366004)(346002)(376002)(199004)(189003)(486006)(74316002)(54896002)(6306002)(9686003)(186003)(102836004)(55016002)(7696005)(7736002)(6116002)(316002)(6436002)(71190400001)(790700001)(71200400001)(6506007)(46003)(2906002)(256004)(476003)(99286004)(66476007)(558084003)(52536014)(66446008)(25786009)(64756008)(66556008)(14454004)(81166006)(81156014)(478600001)(76116006)(5660300002)(8936002)(8676002)(6916009)(66946007)(86362001)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DF4PR8401MB0907;
 H:DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hpe.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9tebdNnU1TQnqFD6q90l6fum+YJmevTNvo98svoJz2OK8NQOrRaRz4n1YoBiEfZi5SmB+0kRYUUqNUR7SIJcQfh7HTao/PTIkwn/XYarpKsqWc6ahx8sO3wCKPs+/ppdSFDZ7WcM39oNHYQJTE9VoGlKMKAE1v8DCNmck5gJkzDCxnFaiSBLiEU5vgnP4qxGEdKGqEytioHv8poK3MQJi++8OjddUqsCsTkOvfsf7N7Rpgkb2Sz2StKcGF0Viy2p4YNv/73pfALDfDRU1N44gMyrr5HRHVeufaDrKVlqdsc3tk15qFxSWvgYHJiliv8oYZ8lzdkpUqC8HjDH1SS6WNC9Xt4thWQjJkQsEC8DxTFZNBTNJFyCTeU4mXvpw3yI5IurPBL/CdMbItKxWUXeU3IV4YEgMDq9Yy+hXOBivzdjxcgoZVylPA3fVlPNgUKX
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DF4PR8401MB10841D9A4AB2C85B587D477FD86A0DF4PR8401MB1084_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcfc1fb-0d8f-48a6-f9f5-08d758181734
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 00:21:18.7641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +dLLRJ99x6FswpVIRNNHPVZ3X+xxywx98OY/bnQrR23xMw2zB9IFRsDserXkelq7gJrqNCl1cO18UN+5XRQtyFnfYrRg8UH+Pdcys9iyTOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0907
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_06:2019-10-23,2019-10-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxlogscore=466 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910240000
X-Mailman-Approved-At: Mon, 28 Oct 2019 16:36:40 +1100
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

--_000_DF4PR8401MB10841D9A4AB2C85B587D477FD86A0DF4PR8401MB1084_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I see "phosphor" shows up all over the place in openbmc.  E.g. meta-phospho=
r is the OpenBMC layer.

Is phosphor a project name that will evolve with OpenBMC generations or is =
it forever static?

Matt.


--_000_DF4PR8401MB10841D9A4AB2C85B587D477FD86A0DF4PR8401MB1084_
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
<p class=3D"MsoNormal">I see &#8220;phosphor&#8221; shows up all over the p=
lace in openbmc.&nbsp; E.g. meta-phosphor is the OpenBMC layer.<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is phosphor a project name that will evolve with Ope=
nBMC generations or is it forever static?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Matt.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DF4PR8401MB10841D9A4AB2C85B587D477FD86A0DF4PR8401MB1084_--
