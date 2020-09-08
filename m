Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DC92612EF
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 16:47:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bm7L12PstzDqSR
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 00:47:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=05203cc116=jorge.cisneros@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=fjO4jcPU; dkim-atps=neutral
X-Greylist: delayed 810 seconds by postgrey-1.36 at bilbo;
 Wed, 09 Sep 2020 00:46:29 AEST
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bm7JP102dzDq7W
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 00:46:28 +1000 (AEST)
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 088EMviC013826; Tue, 8 Sep 2020 14:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=pps0720; bh=tX+m5Juf8gldXf9J64hyNsvc9tdRm2ku+yyl+WV0KBw=;
 b=fjO4jcPU5bqPHuyeg+GLxjvpADeFYetTlXUM29RV+YuaG8wolL+6W5Gi3TfV9C8oguR2
 PWPDmZrL1FLAAlJtyodcZb6+ZDxMQzxLnoeRXZRBt3r8wNvNI0eJsLg3mlTwig0SmMGB
 OlVln5J753Hcz+ccc7SjfZj8YehASrchx1c1TauR8r7AxEAosWIW29jGg5RjugfQBtuc
 gVyHgNAalmfd3mZgjvH4sds/Ezpwn7gB56aQbhMXDYcJEcdD9g/3bufI8a+kpwyDdar8
 gMFdmHfI6YV51RS1I1/ryQnUSkW7HGwcP2o+C3cbnRrT6whqQ5VVRL4FB1eT2Obgwoxc DA== 
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
 by mx0a-002e3701.pphosted.com with ESMTP id 33cmj4bar4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 14:32:51 +0000
Received: from G9W8453.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net
 [16.216.160.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2352.austin.hpe.com (Postfix) with ESMTPS id 1DFD7B1;
 Tue,  8 Sep 2020 14:32:51 +0000 (UTC)
Received: from G1W8107.americas.hpqcorp.net (2002:10c1:483b::10c1:483b) by
 G9W8453.americas.hpqcorp.net (2002:10d8:a0d3::10d8:a0d3) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 14:32:39 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (15.241.52.12) by
 G1W8107.americas.hpqcorp.net (16.193.72.59) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 8 Sep 2020 14:32:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cK7ely57fxg6wLtmnv0dK5UO6J63W7ofD6CV5T0WhKTAhzVeq8COlsenXtgtTKSHikACwLsBluub1quDxLppnk52oY+jiMktuZTB+L4/OmpukuUurXvmGDswRETLqmDpWpjfsH3p7MXeiq+aV06bbpd04t4mHN9bhHyOYVW/ADIZrc4zHCV5rmxcKyAsQGmY6L0MLJswePIUnNEMihDKJg0iQgu9+qncDloLe3lJMh4skV6ZenY4xCVz6OfEWsYm+BwfPPhlHMkYJvOtf0TtlFrQSjmxl5hGaD6JoAb+pXh0keICwLiLXdF+460JsRe73EPpkGM52P5QUCgCnrH+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJJW9+VEf8ZVo3jQGtBzsGpOS7uC6QC5bb6AQgjCQYM=;
 b=MHJiWKyXJ/TgHY7Af0U5vjIA9DIS7CICUMTaA9JZQ0FJz7Fn0iVntdnHomyHnleDYtvCK/RtwH3es3QmY5o7zxiaAi60HS8gFuDfh2paoUk1m8tRBv7qoAtAfTHBGO+bTuo5jUK+iNOp88pc/Tnp94M8Yf2Zz8WPsJVfbVm3dKqfJsYJdgALDayIoPT7oIJzUS7vXNZ2CiGLSviNOFubCrwv3LHrzc2RAU4wfN3gXqEMeJ/+kJZWSnkge5ZUWQ7T3sdM09SxS2+36AmETfk2if2CV3t4kJZrwh8KptQdSDKiiiGwFGPsbDchBuv6iiybUYCxx8/3wGtltx38mCcnUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7513::8) by CS1PR8401MB0885.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7510::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 14:32:38 +0000
Received: from CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::24e1:1bda:6de5:5b08]) by CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::24e1:1bda:6de5:5b08%9]) with mapi id 15.20.3370.016; Tue, 8 Sep 2020
 14:32:38 +0000
From: "Cisneros, Jorge (George)" <jorge.cisneros@hpe.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: FW: Request to add meta-hpe as subtree 
Thread-Topic: Request to add meta-hpe as subtree 
Thread-Index: AdZ/wFscHWSEcHy2R5ekgo0hGzz1gQGLFjdA
Date: Tue, 8 Sep 2020 14:32:37 +0000
Message-ID: <CS1PR8401MB0566C7D5CDBC13FE4CFAEED68F290@CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM>
References: <CS1PR8401MB0566CA9B0A0D168049F6D0E58F510@CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <CS1PR8401MB0566CA9B0A0D168049F6D0E58F510@CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none; fuzziesquirrel.com; dmarc=none action=none header.from=hpe.com; 
x-originating-ip: [98.194.85.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 11de8bc8-2e4b-4b79-41b2-08d85404090e
x-ms-traffictypediagnostic: CS1PR8401MB0885:
x-microsoft-antispam-prvs: <CS1PR8401MB08851FDA03D727AF6FC45D4D8F290@CS1PR8401MB0885.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A6BOQ86cPhhk5T6sZaNIYEm47exFeidbAQ6U8VkvWqfdyDdVMTonkduaIDcdYdEdkx6bNP0sc9Hzt0MR4UmOm60fnfs2IYLz7N9S0mfCnJfRz5/jOFeTtk4JZhPmNK5ArA6A1PA0RYlyv5lNc8HTDm+6ZwPy2e8EB4+dtDsD72oX0Uua6nl60ih6rLgoO+q5Svy3KqytIuOvLvWcxIm9gHXSJxa+Y/fYfGB3nzx2sQoyigy+PqC5dIxutpiU7cnDysYIwXfE8drLI6uK3w2X0og8j/Mh6aFXAOJdkyMk6aaMnAAcJ2Q91/9rMDQ5MjZhk47Y51jI2cVo5RTpNRkFuw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(376002)(346002)(366004)(39860400002)(396003)(136003)(478600001)(4326008)(5660300002)(66946007)(66446008)(64756008)(66556008)(66476007)(76116006)(66616009)(9686003)(7696005)(53546011)(4744005)(6506007)(26005)(71200400001)(55016002)(316002)(2906002)(52536014)(6916009)(186003)(99936003)(83380400001)(86362001)(8676002)(8936002)(4743002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: VdhaIsNL4qmWyBuw1MU/GoaOrMBf99qUA/C2TAodln4xrC3A/4T7gMaxj7bs0XAk6t6ikfFJ4W6xyRYabjw+sYiEikUKg95C38G8xmITU0ZkiOX9p/HMWs0VKGuVpJQU/Vljq62iVUpwMlH7Avt12oIWsNy9GHGDXmMC/chZWshBL4ZBBaOcvAQfTSzn7/HbZARyg5jxdErarll0+Q2WlahC5+SymlhYetjemoFJbLUSsGRF1YBWluPDBQGJCt/EDrifNAMg/2NByX8OoJSbnVw7duovAYBj6AW+EUoRNqBtrFyO4iUTWWMtCs4eCiuszc6wFyOWBlhWy/M3yKDms9Tgug6RKHlo9MzRqwk9JAKMp/g0X+mVnebGB36ymAAGkXOrcXCZXPAWE1B3uZ1hI7QFVKilXHTzhme5JRj0qmvfzHILFmszbqLcmrx32rqnRlgSsaRBczBfgFh0PnED6oU4UFd3d2swC5PZaKXX++62QMfTeTC0yHhgCO+L5ja/jMFHA8lgrOysbFqYHTSf0io1qyLKdZPcPl7i3WwkUbOIqIapm39qJh46oxKRASu2ZGJkqW/px0AFpIE+SBwCRHJ3aOUlugeXrbse9bwqeljPeV1qmKMEGVr2jdVPKqYuyxyqyX0MlX4CCkvD/BAmQw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=SHA1; boundary="----=_NextPart_000_0035_01D685C2.FCE89960"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 11de8bc8-2e4b-4b79-41b2-08d85404090e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 14:32:37.9937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VPUx1fEVInUzeptoKvNWhz/ZTbYb/RidCFshfoa2DbpXYXjn376PXmsAvQyjrCcMH4CZaUwACc6RB7szUdoL1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB0885
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-08_07:2020-09-08,
 2020-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009080137
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

------=_NextPart_000_0035_01D685C2.FCE89960
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0036_01D685C2.FCE89960"


------=_NextPart_001_0036_01D685C2.FCE89960
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

A kindly reminder, please help to add meta-hpe into openbmc as subtree,
thanks!

 

Jorge

 

 

From: openbmc
[mailto:openbmc-bounces+jorge.cisneros=hpe.com@lists.ozlabs.org] On Behalf
Of Cisneros, Jorge (George)
Sent: Monday, August 31, 2020 1:20 PM
To: openbmc@lists.ozlabs.org
Subject: Request to add meta-hpe as subtree 

 

Hi All

 

Today I did our first commit to the meta-hpe repository,  could somebody
kindly please help me to add the meta-hpe repository into openbmc as
subtree?

 

Thanks!

 

 


------=_NextPart_001_0036_01D685C2.FCE89960
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
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoPlainText>A kindly reminder, please help to add meta-hpe into =
openbmc as subtree, thanks!<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>Jorge<o:p></o:p></p><p class=3DMsoNormal><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><div><div =
style=3D'border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in'><p class=3DMsoNormal><b>From:</b> openbmc =
[mailto:openbmc-bounces+jorge.cisneros=3Dhpe.com@lists.ozlabs.org] <b>On =
Behalf Of </b>Cisneros, Jorge (George)<br><b>Sent:</b> Monday, August =
31, 2020 1:20 PM<br><b>To:</b> =
openbmc@lists.ozlabs.org<br><b>Subject:</b> Request to add meta-hpe as =
subtree <o:p></o:p></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>Hi =
All<o:p></o:p></p><p class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>Today I did our first commit to the meta-hpe =
repository,&nbsp; could somebody kindly please help me to add the =
meta-hpe repository into openbmc as subtree?<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>Thanks!<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_001_0036_01D685C2.FCE89960--

------=_NextPart_000_0035_01D685C2.FCE89960
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
AKCCAp0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAwOTA4MTQz
MjM2WjAjBgkqhkiG9w0BCQQxFgQU8ZAWtq/xNYZEHszHs8tm+A0OmE4wgZMGCSqGSIb3DQEJDzGB
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
AQEBBQAEggEAdf86gWSgQFmTydRfxda0+rJhG/52xjw4cEPjBpsCKVvv3vVmyanKBbtjyFn14YeU
c538dQEP68Ror2LFjZEpmLh5Wo5RF/Qz4p/WVudjStRpyCxAOqrJfH2lV8ybtxJoCQ3QqHOzvIkI
8JeapeNAroXHq+W65i6q1yYyYXrX/Wm3kIqMqFVjtTfbMgTk7DIOT6chWQNRqvqwHjOa4kVg3wqt
kcijd6vjHk1zdvJGCu7+u4ToLc9sBPx80q1vBnGlNdgEEMVM8ydyCrCF75+2+BeCVIdswVqDb4eN
I+p3ZX1MQGxi/FRih1Pb2ylXQ+ZSCtvrZHCdym7WrQY3RwrEuQAAAAAAAA==

------=_NextPart_000_0035_01D685C2.FCE89960--
