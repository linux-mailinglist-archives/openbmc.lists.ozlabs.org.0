Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E422580EE
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 20:21:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgJSH6PbJzDqTC
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 04:21:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=0512a5f931=jorge.cisneros@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=CPoO610c; dkim-atps=neutral
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgJQW3xP7zDqRc
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 04:19:54 +1000 (AEST)
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07VIHHEB025152
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 18:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=pps0720;
 bh=7uZMVXfaksvCdVOKgKg3JBbV+8K39ME91l1odLVaRwc=;
 b=CPoO610c2D7IxMm+0JenHTI3JtmoPGgXufCRJQ3mQ/U48T0C1wre4+/YBn4UXOU4an8h
 +/hJruqsFRKWSIycQzbO3tcMjVCAyKfvoO+yWZSO5TKu/wa9ZGweET1sDMthIKpZLmgZ
 Ei8emZytDr+oyO9cLg+mJ0aAL0kDncL/NnyY4b5ntI0Pg0uL+W/ANkvm/Y8cIiHuqkC0
 wUui0TGDqJu6MOmV0xOLzWIo1eq61gFg/kB6vXVdn/vLAFMv+a4w8n4Byu0nXWSZqyeV
 R7mv034AVuoArw5yHZryFgeYds12nPwx3rrNNn/WuJUH0dw1VTxZbXsbQfQ6y0ocGuWM gA== 
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
 by mx0b-002e3701.pphosted.com with ESMTP id 337e4vf7f7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 18:19:50 +0000
Received: from G1W8107.americas.hpqcorp.net (g1w8107.austin.hp.com
 [16.193.72.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2352.austin.hpe.com (Postfix) with ESMTPS id E626462
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 18:19:49 +0000 (UTC)
Received: from G9W8454.americas.hpqcorp.net (2002:10d8:a104::10d8:a104) by
 G1W8107.americas.hpqcorp.net (2002:10c1:483b::10c1:483b) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 31 Aug 2020 18:19:49 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (15.241.52.13) by
 G9W8454.americas.hpqcorp.net (16.216.161.4) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 31 Aug 2020 18:19:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9O6eUCbM3p2qBgZ7i5GJBMByqrCaPiaXR2Vj4ShwJRV51tMY1fn7EyKR1TGgjlALRX5B9w5WnWsCCJ/NcqhuhX/y7BR7uvzIU/+iVxUKYMBwdqfendkH9y8O+CR/Gyau1dkEvSyX9rx2/HsqFI2DuIzAT6ghvEhIIjRmUyada/6z+JP2LeAkAKjqNlEXaQam2RzJWVWb45YGVnGG7dP9c7CSjAV99YjI3CW21nCYSQrj9PGY+F/So8Ps6EG+s4mGupfkKKIEL8eDoVG86dhozZEbJKgjTwMm45tflEi/BZaNzcOgY3gbyBTZB4yF8xeoH5A10BV6YBXamE1FCoYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9wdACGNgM8jJSYCnREMOqAPnv7CXSUXdd1mdcIvGm0=;
 b=i5RfNdf7Vo6lfgy8O89BF8VSTzbtXh3cW4o+FYt9bVv+9QW+3SwobulcEk8XEZZs2ARnGo99MscFrY8zCywIzabZBihu5rQj6e/oJdnSsqJLFOcCFyn7jxgC/jmeZ2hjnzbxIgj4GdDNjv58iCJLCVo4jWQNEU8IZstkoUkMEj97I5Rkv6lOUjB3afcvYK7TJUNUj7q0zSGreeG4XrplTPvgo0oPSlVUiWccVGH7ab0DmFpEFFNnVL8PYUbCTW9ret8XESoI23C5pZ2ltn1gV/xLUZMAAzWMqkkB5SRXrBG6WG1aJ7DNh20rqmStm8wzz/Bs6bInuQPXZpacmfkLKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7513::8) by CS1PR8401MB1319.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7507::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.25; Mon, 31 Aug
 2020 18:19:48 +0000
Received: from CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::24e1:1bda:6de5:5b08]) by CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::24e1:1bda:6de5:5b08%9]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 18:19:48 +0000
From: "Cisneros, Jorge (George)" <jorge.cisneros@hpe.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Request to add meta-hpe as subtree 
Thread-Topic: Request to add meta-hpe as subtree 
Thread-Index: AdZ/wFscHWSEcHy2R5ekgo0hGzz1gQ==
Date: Mon, 31 Aug 2020 18:19:47 +0000
Message-ID: <CS1PR8401MB0566CA9B0A0D168049F6D0E58F510@CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [98.194.85.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 54fd0f34-37bb-4cc8-57a3-08d84dda71d7
x-ms-traffictypediagnostic: CS1PR8401MB1319:
x-microsoft-antispam-prvs: <CS1PR8401MB1319F19DEB3DE8D7794DC7318F510@CS1PR8401MB1319.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: clXA2HImxM6wYCVKhxba91S+x25iDML5+2ER6E2Gw51Siw5MyCM8gTak4QgblsikukKe6TlAVVLecEKAx+dcIj7Ew385gKYAoDq9G4ZUOBQ6gAHJKIVdAGBXgGXzX0rDyUikIe3Wf2kq32nPicJflW6y9T8P6rRErYkLngyWfeBDpq5am/kQ1QhyMzaMVPz8+qcOB5rPMzVgwVunhYJGTuIhH4vZsvml7FstJnoLH2wR44t+nCZC/BP8CZUGTfcLq2I9YdPkdxBTI6LOMxy4D7pkUeVzRyOADrvqDjmb+JGHQIqlIUAzH6SUkxqSMGkd8KMnz468/qNft5sKEBqIKg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(346002)(396003)(136003)(376002)(5660300002)(52536014)(2906002)(26005)(558084003)(8676002)(186003)(4743002)(33656002)(55016002)(9686003)(66946007)(66556008)(64756008)(66446008)(71200400001)(8936002)(86362001)(478600001)(99936003)(6506007)(66476007)(66616009)(76116006)(6916009)(316002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ISvvFDVY2j46qhh1y9LS0p2XRt6F4yrJhodygRfZokRzbO2z1Ar8rvC2knM2ffECRKkFmrCAPlaJ3z9TXYETYxHHCx7EtlCJIarw5TUc2egpxHLTI9B5azvgLqjktynVb1VaYEKhYME0us+hNx5NCtMC2Atiov/mDDKzSC3/HNwxs9sWz0GuD+gEiBBNyf27nleCm+VaOxD6gwWpHcvRBnMIE2VrVyKg2PpgGPSMsnHCWo3qsiAvR9MucYm00paI6aEZTMinKxzveoYqL4si/Mj+qeEgZxZzYFEKbTKWVAbl0g317YJAmEwkwe2huaZEphIS9IxmsUupDRjbRrF3x+zY8ADi+116p3v6Yqj6fQgcUG0Vb/FvmK3amKM2auYnGF865g6zVDO2lzkDfSb3GxIBE+5KJdAzi7mpajeGkn1Z/7aX3TlUtUj4PPP9I+up3RGMnYQBAngeETOSbD0TH/PqR5JudBDChbYlTtJNbnULqBYEu5MiIau45z1gMSxq/0OOshQRJQb4GAOND1TJlOO5VfD5QKHNfeadRaC8uJCei1IVb9yeyXMVatzhmbVkMzxTeaqrkSP7JKbPS+Ke8Dm/Jn7Eml4imwF3v0gDKjQtA8w8irowKwob4dx3He4heK46ac93VzdJJvMJ1Uupkw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=SHA1; boundary="----=_NextPart_000_0179_01D67F99.6586DF70"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fd0f34-37bb-4cc8-57a3-08d84dda71d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 18:19:47.9583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f0XDhvIl2CCgsPafvh5ZddGuf5ZuudpxfOldYrn5wuzV1tA2WeTTXDg4H1UyIHqEU4bmqpNuwSThcsObORNQmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB1319
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_09:2020-08-31,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=780
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310109
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

------=_NextPart_000_0179_01D67F99.6586DF70
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_017A_01D67F99.6586DF70"


------=_NextPart_001_017A_01D67F99.6586DF70
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All

 

Today I did our first commit to the meta-hpe repository,  could somebody
kindly please help me to add the meta-hpe repository into openbmc as
subtree?

 

Thanks!

 

 


------=_NextPart_001_017A_01D67F99.6586DF70
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoPlainText>Hi All<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>Today =
I did our first commit to the meta-hpe repository,&nbsp; could somebody =
kindly please help me to add the meta-hpe repository into openbmc as =
subtree?<o:p></o:p></p><p class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>Thanks!<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_001_017A_01D67F99.6586DF70--

------=_NextPart_000_0179_01D67F99.6586DF70
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
BHoweDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEUm9v
dEcyLmNybDA6oDigNoY0aHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElE
Um9vdEcyLmNybDCB0wYDVR0gBIHLMIHIMIHFBglghkgBhv1sBQIwgbcwKAYIKwYBBQUHAgEWHGh0
dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwgYoGCCsGAQUFBwICMH4MfEFueSB1c2Ugb2YgdGhp
cyBDZXJ0aWZpY2F0ZSBjb25zdGl0dXRlcyBhY2NlcHRhbmNlIG9mIHRoZSBSZWx5aW5nIFBhcnR5
IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9ycGEtdWEwJwYD
VR0RBCAwHqQcMBoxGDAWBgNVBAMTD0RpZ2lDZXJ0UEtJLTMtMTANBgkqhkiG9w0BAQsFAAOCAQEA
X1nerrl1BXZsFMZla3hsjfUbITS1JJqv5VqARgBjdinDquRgauGZl7dCwqe2mTmspri0g9ZkYI9u
Rcc2Bxp62VIBFVPjQmRFidTi8bDGPzdwmfuQR11UPAvlZCT6D73oWWTusfIkadA6TBJVIGCXEWnM
ZqEySr9tLb+NGjwVe9I1Q8NArPScqUWM/8MM+W+sfMoqeP21Fl6J4LU9PHGrOKCEc4aHMS/cXVZU
9c5BVCh8Eu3Vctn+5QcK3CXxXWd35tieYmZjLYenwzJD/hGbdFHONQt3Wl97VkZAIviJ4av+IZbu
/cDa6hgVKY5c93X58/z1K1uc6n8Ltpe6dG9myDCCBpowggWCoAMCAQICEEGCTrf62yrKy++V3cIV
e38wDQYJKoZIhvcNAQELBQAwgasxCzAJBgNVBAYTAlVTMSswKQYDVQQKEyJIZXdsZXR0IFBhY2th
cmQgRW50ZXJwcmlzZSBDb21wYW55MTUwMwYDVQQLEyxDbGFzcyAyIE1hbmFnZWQgUEtJIEluZGl2
aWR1YWwgU3Vic2NyaWJlciBDQTE4MDYGA1UEAxMvSGV3bGV0dCBQYWNrYXJkIEVudGVycHJpc2Ug
Q29sbGFib3JhdGlvbiBDQSBHMjEwHhcNMTkwNzA4MDAwMDAwWhcNMjEwNzA3MjM1OTU5WjCBpzEs
MCoGA1UECgwjSGV3bGV0dCBQYWNrYXJkIEVudGVycHJpc2UgQ29tcGFueS4xJjAkBgNVBAsMHUVt
cGxveW1lbnQgU3RhdHVzIC0gRW1wbG95ZWVzMQ8wDQYDVQQLDAZTL01JTUUxFzAVBgNVBAMMDkpv
cmdlIENpc25lcm9zMSUwIwYJKoZIhvcNAQkBFhZqb3JnZS5jaXNuZXJvc0BocGUuY29tMIIBIjAN
BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4IqUICf5Us8s6PyqIl926cUCQKuxLVFk+5Qaw7Wj
azs84PL5yGoMOIJRY1Islfs4kLqx0XWFgVIMqXUNsOSAkSOvVOfc7EG4zAws8CycbjOtGbH3b8AT
Vk1eUS5tNOs7sfmP4GIT7k2BbEMg4VEUtuBx4BJIFzGGJWHrM6c6dtUxafLt+sB0+bimr8CqvYsP
6rOTfTVvIE7dgLlsrqCOdD27ZP2cZu5SlyNsdi6HLBuTTmmXO3D4H89hfBsEcuH0fqq2Lv1TNCwv
rmeQe710IJnAbGrPgw3rcRIVDv49YVUgwky3zyk7DcRKVxdxgnnikYiG714DB1ye45kQUBYYjQID
AQABo4ICujCCArYwDAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYI
KwYBBQUHAwQwHQYDVR0OBBYEFGrzk3JJl3n2PkzM4RZArJmA3uSoMCEGA1UdEQQaMBiBFmpvcmdl
LmNpc25lcm9zQGhwZS5jb20wgdIGA1UdIASByjCBxzCBxAYJYIZIAYb9bAUCMIG2MCcGCCsGAQUF
BwIBFhtodHRwOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwgYoGCCsGAQUFBwICMH4afEFueSB1c2Ug
b2YgdGhpcyBDZXJ0aWZpY2F0ZSBjb25zdGl0dXRlcyBhY2NlcHRhbmNlIG9mIHRoZSBSZWx5aW5n
IFBhcnR5IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9ycGEt
dWEwXQYDVR0fBFYwVDBSoFCgToZMaHR0cDovL3BraS1jcmwuc3ltYXV0aC5jb20vY2FfOGZkZTU2
YmZkZDEwMmNlMDMwMjY4Njc2MjVkMDNiMWYvTGF0ZXN0Q1JMLmNybDA4BggrBgEFBQcBAQQsMCow
KAYIKwYBBQUHMAGGHGh0dHA6Ly9wa2ktb2NzcC5kaWdpY2VydC5jb20wHwYDVR0jBBgwFoAUFJlS
kglh0NGUMxEoPnytc73MTnEwQgYJKoZIhvcNAQkPBDUwMzAKBggqhkiG9w0DBzALBglghkgBZQME
AQIwCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBKjAuBgpghkgBhvhFARADBCAwHgYTYIZIAYb4RQEQ
AQICAQGCx+ajERYHMTA2MDQ1NjA5BgpghkgBhvhFARAFBCswKQIBABYkYUhSMGNITTZMeTl3YTJr
dGNtRXVjM2x0WVhWMGFDNWpiMjA9MA0GCSqGSIb3DQEBCwUAA4IBAQCVXK4Umi92MQi3sccdg8b8
uovGiUX9UhBgVwASwAhDxRTZfe/VpSfPEgUAhT007sRRYmit9/mx6/rvPRl00wLLGePXz3uSOA8X
M4VDPYnQGBxyUfcs0RDan4n3NHf4yDA+7FPwZa4bThqWA5b8MnKgY0SynxxwugG3fqDZClU3V95Y
ZTg+jzVIroFcy1X7Eau3YtyvgWw5bdixkXKBnwxL5qkADuY+EQsg27jVjXIGaI2AAgISolWVIr80
RHw3bqyy9MYRhtL2nsceQdDO/+UTxxM9bZqOHnHQaAB11KxnwSVjPejK+aY6Y1xynADlLarp9VDL
Bqp9vB5FpkQoLSAiMYIEiTCCBIUCAQEwgcAwgasxCzAJBgNVBAYTAlVTMSswKQYDVQQKEyJIZXds
ZXR0IFBhY2thcmQgRW50ZXJwcmlzZSBDb21wYW55MTUwMwYDVQQLEyxDbGFzcyAyIE1hbmFnZWQg
UEtJIEluZGl2aWR1YWwgU3Vic2NyaWJlciBDQTE4MDYGA1UEAxMvSGV3bGV0dCBQYWNrYXJkIEVu
dGVycHJpc2UgQ29sbGFib3JhdGlvbiBDQSBHMjECEEGCTrf62yrKy++V3cIVe38wCQYFKw4DAhoF
AKCCAp0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAwODMxMTgx
OTQ2WjAjBgkqhkiG9w0BCQQxFgQUimWSCIXHKz0WXk190p7g89mIJQIwgZMGCSqGSIb3DQEJDzGB
hTCBgjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAoGCCqGSIb3DQMHMAsGCWCGSAFlAwQBAjAO
BggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAhowCwYJYIZIAWUDBAIDMAsGCWCG
SAFlAwQCAjALBglghkgBZQMEAgEwgdEGCSsGAQQBgjcQBDGBwzCBwDCBqzELMAkGA1UEBhMCVVMx
KzApBgNVBAoTIkhld2xldHQgUGFja2FyZCBFbnRlcnByaXNlIENvbXBhbnkxNTAzBgNVBAsTLENs
YXNzIDIgTWFuYWdlZCBQS0kgSW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBMTgwNgYDVQQDEy9IZXds
ZXR0IFBhY2thcmQgRW50ZXJwcmlzZSBDb2xsYWJvcmF0aW9uIENBIEcyMQIQQYJOt/rbKsrL75Xd
whV7fzCB0wYLKoZIhvcNAQkQAgsxgcOggcAwgasxCzAJBgNVBAYTAlVTMSswKQYDVQQKEyJIZXds
ZXR0IFBhY2thcmQgRW50ZXJwcmlzZSBDb21wYW55MTUwMwYDVQQLEyxDbGFzcyAyIE1hbmFnZWQg
UEtJIEluZGl2aWR1YWwgU3Vic2NyaWJlciBDQTE4MDYGA1UEAxMvSGV3bGV0dCBQYWNrYXJkIEVu
dGVycHJpc2UgQ29sbGFib3JhdGlvbiBDQSBHMjECEEGCTrf62yrKy++V3cIVe38wDQYJKoZIhvcN
AQEBBQAEggEAdRfvO44zSgaHK59oyT6Q9VW9IDdxXLSzS+7x7VgghmW/J8qKDMLqLx9r8gC2iY3r
3U1y41BZl84Q9ZshvKfjdot7oPfYz336TVWz2HbfvmzB1t6fwOQ06SGojM+/lUFF3TxGGluOOjtl
Pl7ZX2om/QpOVFsuiaEJse/z0CR4AcWM4cJvx2RQUjjc9+DdTO0XPVfFTotTcXlXDFpWT9zPQZas
AA1uQ6WrzVLhfONOugpd4tQLXF5BeS5RLkI83+tGMjVK3dqXPOt/OAdwR6yJbIagEzifyd7h6IPr
JejjkvSkb7DWQ95G8uQ4kQbwfzzb72Y3YldfpVAZ7jLHVXraEwAAAAAAAA==

------=_NextPart_000_0179_01D67F99.6586DF70--
