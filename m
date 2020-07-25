Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3F322D483
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 05:54:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDBz53pHCzDrgD
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 13:54:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=047577b105=abner.chang@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDBxV4BKjzF1QS
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jul 2020 13:53:12 +1000 (AEST)
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06P3r8wY010319; Sat, 25 Jul 2020 03:53:08 GMT
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
 by mx0b-002e3701.pphosted.com with ESMTP id 32gcrk831m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Jul 2020 03:53:07 +0000
Received: from G4W9120.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net
 [16.210.21.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g9t5008.houston.hpe.com (Postfix) with ESMTPS id C299556;
 Sat, 25 Jul 2020 03:48:50 +0000 (UTC)
Received: from G9W8456.americas.hpqcorp.net (2002:10d8:a15f::10d8:a15f) by
 G4W9120.americas.hpqcorp.net (2002:10d2:150f::10d2:150f) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Sat, 25 Jul 2020 03:48:50 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (15.241.52.11) by
 G9W8456.americas.hpqcorp.net (16.216.161.95) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Sat, 25 Jul 2020 03:48:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1XUu+c1amCmu5rGuP1BmIQtKPZy+M7MlAUZ1Tv4x4ZOyKOlvd5xdeNnlPr9+t/+vqefyaD+Kz/AlfrFsThm2i9XdE8uF/2sRb0KN5KotF4fc3CFCpMtdf5UXJmrzqCiYZkfM7m5c7QMtYKaaW3ysMFcjEn7bkIf1LMmA2Jh78jeOyoTRkwr+BYqz9tu+gIuGzlbebFewTj1XlTR6Y7qnpsxoxVOe05oxWrFWxV2SSGzqLd0ZzRme1hGjqPIefQR36rkw489tjTLzSV29WJiUjFkL/dp1oGB85Leg+tiHhn6WUlKLUlOTfGO7sXrPBVE+CYpwmxNwrjg+F7SySZEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8FTFS+B9CLs07xbal89Hv1ObOCb2u/N062CBEeV7pU=;
 b=W69mGeE7/guecmPCjbWCQWVLdJUpGWbYomgr2Xbpc4BxNR8sfcHFx33zVmZHTgJRs8SuoRzVchlC3T61LgPH0aBm2Qa8sBnHvHydN+xAro2e573linM9bdTkL8XIgCJiisHDiduhCkMi/bwROzEkZI9K7K6QFzd3UH+Y4zWljfx7BVm4Jzih9dwfZsvyNcM0JqnancpCSyb0Yr3LGc61l0jvdatFPKPcITbsUMt483YUr3QYj33JPlxqveSZfoSI2x3wZoysJFYAmaRebSsAkaO8Hw/6GPCNzd4cU61fF0noUXx/pQXDato7Ftr3Tkk/mp/hY/yCNo7Aka/oWIvDQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7508::16) by CS1PR8401MB0853.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:750e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Sat, 25 Jul
 2020 03:48:48 +0000
Received: from CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::58f4:cfb4:beb0:f5d5]) by CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::58f4:cfb4:beb0:f5d5%7]) with mapi id 15.20.3216.026; Sat, 25 Jul 2020
 03:48:48 +0000
From: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>
To: "suryakanth.sekar@linux.intel.com" <suryakanth.sekar@linux.intel.com>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Fix content rendering issue on RemoteBiosConfiguration doc
Thread-Topic: Fix content rendering issue on RemoteBiosConfiguration doc
Thread-Index: AdZiNn5KWJT9vXnOQm2LeRMxyQeKbA==
Date: Sat, 25 Jul 2020 03:48:48 +0000
Message-ID: <CS1PR8401MB11443DA57173714807F29080FF740@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [16.242.247.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fd7d6618-e18f-4666-7f24-08d8304da377
x-ms-traffictypediagnostic: CS1PR8401MB0853:
x-microsoft-antispam-prvs: <CS1PR8401MB0853520F9193402E96C9FAE8FF740@CS1PR8401MB0853.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bNYsnwYTuPloMPc5sHfPgRqeLc3UK53kxrWpBVq9tPC0CR1EEP7ccG8AwFf6Uk3c+FniwYLTB9tg7lWAtvZR2Pfvl+uP8EnZG+EQverA+0xIJtCDWrKeAm1UVtd+Kc5WVPa3M+42WeUvcX9hzu7ZzA07p72kKFqwxGGWEmKz6tyDmFbMo9EjXFyIJ76DC79hgE7YCOpaxGQGjNzLBlrdBRBsbAGrZ5HyI++d1Tg5JHRGCoj65Ro/EqDURp0/KN0XJ+3z8yPOM+tvA2q9enyPV9Hw8rFDU7xiO3gBs1okIGGLwfZB8kf0YQfFVQqe+7q5DWDS8KMQAsjwyTEu4IymHi+Lim8PkT0ayx6NhL9LiwXs52eFigsL64j3mZhlVlhCi4eRERWF38odkha9E4Pkiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(346002)(39860400002)(136003)(366004)(376002)(8676002)(316002)(55016002)(5660300002)(52536014)(2906002)(33656002)(8936002)(558084003)(71200400001)(86362001)(9686003)(76116006)(66946007)(66556008)(66446008)(66476007)(64756008)(110136005)(966005)(83380400001)(478600001)(4326008)(6506007)(26005)(7696005)(166002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: TkVaeGImxUmUxf5et8eBI+P0WML/eQPSZXHC5SEs5sif0i4fnJFylIu5pHejLnW2i+06R8ZNxyyC8bVdiL+nG1GenYxya7p2W+ObCYv6Lead4zLFh65mfX+p+qzXKCmyfi7TuxNY0S2myDfhnkp5yhEvbOFs3PxL8uEVL7jgLahYjPY9Q36VgzMzAuEz8mcCUDcPIn72txbbacvml+4mq2eaXe3aEZ9Dzo5XNrfNPquaT80zL6pEqW2GRG7+A9GJvXyILVn84XP89W7pAG8gQrAosynN1ZP6X9suF0LNidKNNF05vKoD+SM45tPi5dvUMaj0LynbU4bPU8+aYAvNJa0pVVoHrJ0aR0GklcGvsF0zcfeh2L0HwswMkXM17F7MQfsLVqvnWSbd+IXlLFqrtZdKOC1v0AbZdz7LqgdX2WvMuf5rBHZ2uj7Klk+TUKZs/PCdIjL7dinpKzwAkeZ6MGKLb6IOVKJoEOFhJQvrhLi72dMXuGjjCRPHXBN3KqsO
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_CS1PR8401MB11443DA57173714807F29080FF740CS1PR8401MB1144_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7d6618-e18f-4666-7f24-08d8304da377
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2020 03:48:48.5028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oC6DFF0TTGzNyy2MEjf25mHoTTxWavq1uDvZUfGf9EhMY/2/speu/pO04N5y8zMMcWp0YIJZyV39KL9YR8w7BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB0853
X-OriginatorOrg: hpe.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-25_01:2020-07-24,
 2020-07-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=664 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 mlxscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007250028
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

--_000_CS1PR8401MB11443DA57173714807F29080FF740CS1PR8401MB1144_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Sakar and Deepak,
I create a PR https://github.com/openbmc/docs/pull/53 to fix content render=
ing issue. Please take a look and merge it if you have no problem with it.
Thanks
Abner

--_000_CS1PR8401MB11443DA57173714807F29080FF740CS1PR8401MB1144_
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
	panose-1:2 2 5 0 0 0 0 0 0 0;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Sakar and Deepak,<o:p></o:p></p>
<p class=3D"MsoNormal">I create a PR <a href=3D"https://github.com/openbmc/=
docs/pull/53">
https://github.com/openbmc/docs/pull/53</a> to fix content rendering issue.=
 Please take a look and merge it if you have no problem with it.<o:p></o:p>=
</p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">Abner<o:p></o:p></p>
</div>
</body>
</html>

--_000_CS1PR8401MB11443DA57173714807F29080FF740CS1PR8401MB1144_--
