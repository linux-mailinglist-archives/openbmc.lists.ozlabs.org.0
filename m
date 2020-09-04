Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B86260D61
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 10:18:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blyj53f7VzDqBP
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 18:18:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=051629f67f=matt.muggeridge2@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=dWscB3Ig; dkim-atps=neutral
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjJ8K5dbLzDr9C
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 10:14:36 +1000 (AEST)
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08408Kkh008395
 for <openbmc@lists.ozlabs.org>; Fri, 4 Sep 2020 00:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=pps0720;
 bh=VLMB+BwZEMgRV7zFdS/1iQK2mszQv+g5dlAnUQ/juzc=;
 b=dWscB3Igaiu8Bl4OM1NghzB7rv2/XqNgr5rHOnbXYL9iAIE5qn3RQu6z8Ba+Ac+iKasf
 j23UmzRRVyA+p7w82ta6JzR+rW4CZsOmPYVnL4V5M9J5d5LuImuNd/2jyUR//NmL2+jS
 CPYcamYL3JMvpliMRJfuIEZoLcppUl/2rDFSJ36pKs4s+XtFpe17R8sfQX3lcGwbmj6p
 L9YOz+i8E/C4hiJcm31REpR0JB1b0lhf/YCLZOJnsWoofNuCGXqBEDO7/3PTB1GcGB0Y
 ro32vLFXxfZ7+fAtJ5LD6Ve44vnrwbSto3+erZ76pg6FGpT+Kmr0o88gzQAvdCGdfV3k IA== 
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
 by mx0b-002e3701.pphosted.com with ESMTP id 339xcq5drx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 04 Sep 2020 00:14:33 +0000
Received: from G9W8455.americas.hpqcorp.net (g9w8455.houston.hp.com
 [16.216.161.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g9t5009.houston.hpe.com (Postfix) with ESMTPS id 6F67C5B
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 00:14:32 +0000 (UTC)
Received: from G4W9121.americas.hpqcorp.net (2002:10d2:1510::10d2:1510) by
 G9W8455.americas.hpqcorp.net (2002:10d8:a15e::10d8:a15e) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Fri, 4 Sep 2020 00:14:32 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.241.52.12) by
 G4W9121.americas.hpqcorp.net (16.210.21.16) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Fri, 4 Sep 2020 00:14:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGhOAfzw4CoXhiNiMa/00MUfuJe8vn3ju2O2eugYqi2WlHwjzDKsN2cQxQwLVIuWJncIAAYTn6x0UJLWbcgF7I7C/AjeA36quuhXeAYjejoaFcCAZGkyo2fuYPEw7AlMY+G085pZsnARni0oiyNAzc9Qy5sm3jKGivdg/cKuNOMF5BgiA/Lgf+00Qis0iAUd4bxfN6quGan9SotpaHgLU2KCo55KygJvn+J+HTjqEUq/TzHdoIuXpjbQo3u3k7JyfyZo90FNsJzCmMCoRVO4LxugjVNWFCHLf5gQuMpY1Z5lxe76hszMI90YFgmocogM7baoUkthoqEmOcSSuHC4Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLMB+BwZEMgRV7zFdS/1iQK2mszQv+g5dlAnUQ/juzc=;
 b=J2b+IgWam3WwZhLr9CVlv0gPCa2Rw8FgJrWgd+K0FgQ26PbWCFVDvjhjYMhEk5WwjtdoHMN14E0Im2N+OOG72CWt12hMClkyvo/OJw/ToQSMLoukR7/m6BQKjnoidLT3j0HnoFB9r0RvUkFLNKbxvAhSope7wsTtxw9BCf88qhBEnkUqU4Puh5yGYk0bPOGhZumrGPrTkrVjpZLH517g6mQ5BnGgoPMegeC7Hjxtr2kEpWfsWpXHWma9Sty0akeY9wVgURj6R19fiJfcukGnueuysKvTWHK+KOrcxgoyl6jD28+2F57B8FhThw0kVi/WpTMuLFR3Qe8cO0Af+So/oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:742a::14) by AT5PR8401MB0818.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7423::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Fri, 4 Sep
 2020 00:14:30 +0000
Received: from AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5594:258e:ba5d:ff9c]) by AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5594:258e:ba5d:ff9c%7]) with mapi id 15.20.3348.016; Fri, 4 Sep 2020
 00:14:30 +0000
From: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: How to comprehensively search the OpenBMC Archives
Thread-Topic: How to comprehensively search the OpenBMC Archives
Thread-Index: AdaCT4037hVOiC8xQnSMcBhx9fHJOg==
Date: Fri, 4 Sep 2020 00:14:30 +0000
Message-ID: <AT5PR8401MB12193C196089B8572EE50F05D82D0@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [2001:8003:79bf:e900:f5b8:711f:ef48:d16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c27bfc25-ba73-44fb-a9ce-08d850677e8a
x-ms-traffictypediagnostic: AT5PR8401MB0818:
x-microsoft-antispam-prvs: <AT5PR8401MB0818C7D04247152D686EF3F8D82D0@AT5PR8401MB0818.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dsuD7ddhSxVToYp3Xc/v46kZgEC4WwCVimUnBdpzTkYgAVyKwpeMCh8514bCKGNvmlpOjX4gHVsTPweNQbGXwT7jRzjdlMuDoDWXMOd+LvHWDwlfrcbvgXCoCc6CTOOSVgQBUQahnpHK6Oi9tzsILKugfGLn8HE3VSmG0comssEO+UnHUEXyYUHrVgvjIJ4zePNDf6eqXedG2KAk1XhFuZtUU3L0+UucKINqrXo8hYc1GPrDjlSBvnMag/EGLwccGHAw+hKpNl5DyaExxYe6/7U2Mrj55g3YBGThwLLvCKcQ8GSbvCJHBxFZt3ub8dYXaffQiS4nH2UfQxw/PUB9lGlbc6zgkccnbDjqwxM6P3P1JBrY5DNeK7Ai13d7FvOwbeskCce9C+/gZD0uYEfKrw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(366004)(346002)(376002)(55016002)(316002)(33656002)(6506007)(71200400001)(86362001)(52536014)(5660300002)(9686003)(6916009)(8936002)(66946007)(66446008)(4744005)(186003)(8676002)(2906002)(66556008)(7696005)(66476007)(76116006)(83380400001)(478600001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: yG4afdwg5Wpju8tBXUZ4nGwv8urU1//VbC8Zi1afQtLgunR70GBs4/VkxnwClLOHN3OAaoBW+ypywkVvRMhnKJ7i97NbAGb9nxAzEj78MhkNYXh+rsxrKYrw4T4vKBRGcHqtM91o9+NXGMVFdkgvvNKAeQ1/3lg6/12qP5QsXZQAvBD9rx1Sd/LAyMZncqOyJ5OZa41ux7HKW/EFCMxTQOMU/RsspjAi3qgtC3vi3/AToRDD/6tTPywWoTQlzIxFSkY/OMNK01sCVZPbof0ddKDn4SgAT5stXb78OnNIAT+LhNAzTKff+rQhvOKjYGkb87GO2b74f1L9DRISgGOE0GZ6LIEetuGqhdXba0UXCqXA/FlCrlNtU9sRs09862nkPTOiotrVLowC7yB7bJKS5NM/PuuMn1JBlFN9pSMvUMN3SRs0AF10qJPEMU253BP+/gzSwJOcmWE5VcEBUHMhIz03Wfd4ZzJ5CZzLLzU/PcDKFta3uReXeZTcwat7LU+038c1/hEDphIiSPECS6aRewNaHB9uExXb5JCPR+qqpKhqTOrRSlh0IEflw2ttLGoXZTZ+nZjtSAQNfbUeL+ZzMiYDnPVsYdrkWjB4/4Tj4AqPctd7qmS+SdXcOaCU/YdOwOv7khWwlwA7zn2akMHHHd1bv5swFFj0omwo+CAzaYDr+PhUWCozoYJzaPgM9h7h7PSnD7No0fu/ihzQSEz6sQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_AT5PR8401MB12193C196089B8572EE50F05D82D0AT5PR8401MB1219_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c27bfc25-ba73-44fb-a9ce-08d850677e8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2020 00:14:30.6765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Aa6U3hfuW2Qb4Uqx1Q71OLhOulKBlGpurNzpOKXzRaHtE10F7TNKx2ciSDqA4WChUDmGW9TsC13Zhp4mCMfDcJN7uMZZxKSpy8pB37R51c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB0818
X-OriginatorOrg: hpe.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-03_14:2020-09-03,
 2020-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=805 clxscore=1011
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009030214
X-Mailman-Approved-At: Tue, 08 Sep 2020 17:47:23 +1000
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

--_000_AT5PR8401MB12193C196089B8572EE50F05D82D0AT5PR8401MB1219_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is there a more comprehensive/reliable way to search through these mamil ar=
chives?

I have been using google to search the archives, but have noticed the resul=
ts are not complete.

E.g. if I wanted to find my old posts, I would enter a search term like thi=
s into google:

muggeridge site:https://lists.ozlabs.org/pipermail/openbmc/

Though, that returns no results (and similarly for other search terms for w=
hich I know there are matching archives).

Thanks,
Matt.


--_000_AT5PR8401MB12193C196089B8572EE50F05D82D0AT5PR8401MB1219_
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
<p class=3D"MsoNormal">Is there a more comprehensive/reliable way to search=
 through these mamil archives?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have been using google to search the archives, but=
 have noticed the results are not complete.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">E.g. if I wanted to find my old posts, I would enter=
 a search term like this into google:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt">muggeridge site:https:/=
/lists.ozlabs.org/pipermail/openbmc/<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Though, that returns no results (and similarly for o=
ther search terms for which I know there are matching archives).<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Matt.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_AT5PR8401MB12193C196089B8572EE50F05D82D0AT5PR8401MB1219_--
