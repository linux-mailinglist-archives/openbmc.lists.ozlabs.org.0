Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F14DB22AB95
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 11:15:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC69g2hsZzDr2m
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 19:15:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=0473587565=abner.chang@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
X-Greylist: delayed 1929 seconds by postgrey-1.36 at bilbo;
 Thu, 23 Jul 2020 19:06:51 AEST
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC60C6czszDr2l
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 19:06:49 +1000 (AEST)
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N8X350027028; Thu, 23 Jul 2020 08:34:33 GMT
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
 by mx0b-002e3701.pphosted.com with ESMTP id 32ejyh8m0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 08:34:33 +0000
Received: from G1W8107.americas.hpqcorp.net (g1w8107.austin.hp.com
 [16.193.72.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g9t5008.houston.hpe.com (Postfix) with ESMTPS id 0B99257;
 Thu, 23 Jul 2020 08:34:31 +0000 (UTC)
Received: from G4W9119.americas.hpqcorp.net (2002:10d2:14d6::10d2:14d6) by
 G1W8107.americas.hpqcorp.net (2002:10c1:483b::10c1:483b) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 23 Jul 2020 08:34:31 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.241.52.11) by
 G4W9119.americas.hpqcorp.net (16.210.20.214) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 23 Jul 2020 08:34:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcowWu8gLLwpQrLes5qc3gWhmE74dMaK+oEPs/N0fRVBwCXI5569onW0l/QdykCxeDGp3acLeDvMsVLpTbmHFqcFzOGtJR28xeh1h0uP4jUhAwX2BAYgU9xtvThdWqfxWzuaTPSlhxcqj5J8xHk4azhoOKJC7djtf7PCCh+QeCVgipERdhf83Vm/42eAD8ivoacWLAdUrCnXcShkZadTG7W+xUY/54lBn6kLgws5maR1YOveELfgg+gaGHGtIK6Fal4B0cRdyHG0ZyX3YOHhG8q0w5K/TlCcnms34TUqF/2SVR3dTd8HyWCDXhMzcxIu9oCm948WyFxXHglVF1bbAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvxaDI4u33MOCgwjbvd1os8Pld1n7qYEeLdqt3bPuc0=;
 b=B3ZQyjuxbzVgeoMKHSh5kcBcuXxUxR5JFBDEWCecRaCf4+yO84qyO5z/IsiNZvjIX7LDM3wR7V+jhEGiVzgNIt8mOxiACVy87GIbf9N10YgwFs+LcXSAV/eGYoWI5vYNKHZJ4vvtIR+2hjIkTbqLBaWgaGfAIr3E1x2KZYej14n/e64ANeORniQ817kqIQPttaMz/jlsVj+xg4bb/ADozSxLASIaDGcS96KiimH8TcifCHeyRndiLAZ1UkZ1e8pJwQkHAqsnnQum+smGYvOh4B74s/98HpNF2aQXscMO2NU8Iru9+KVU3oTBPwlqdsi6p7sJE7YTDsUFZcRkaXjFSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7508::16) by CS1PR8401MB0421.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7508::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 08:34:30 +0000
Received: from CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::58f4:cfb4:beb0:f5d5]) by CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::58f4:cfb4:beb0:f5d5%7]) with mapi id 15.20.3216.023; Thu, 23 Jul 2020
 08:34:30 +0000
From: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>
To: "suryakanth.sekar@linux.intel.com" <suryakanth.sekar@linux.intel.com>
Subject: Question about OpenBMC Remote BIOS configuration proposal
Thread-Topic: Question about OpenBMC Remote BIOS configuration proposal
Thread-Index: AdZgyrFMz0kBQ4JpRYCZI6XSJUYpdA==
Date: Thu, 23 Jul 2020 08:34:29 +0000
Message-ID: <CS1PR8401MB11440816B91B39DAD21E3CB2FF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [16.242.247.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ac5066e7-d0e6-44ac-8267-08d82ee337cc
x-ms-traffictypediagnostic: CS1PR8401MB0421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CS1PR8401MB0421B1F4B240E14F626C16B6FF760@CS1PR8401MB0421.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x80BbUZ5c7Daw4+hxdYRHwPnABqbKLs4ig8ST2TMCyy+qL9Ra9UYUctS+lOWSdZqxJRwV6FDJHM331C2QCAslPGdpPfUXcaje7wQx2hcH/ZIq8Cj4FqAXKYfLOzjFLyvVW3XePXjTbz2Y3qAjnhDHAMAt+f8UeM4UQXsH37YxW+HxdimaAkZhooWTgDmUDX8WrC0bd4nDMtuWuNT4yPvuuabEpEJMK55DWpb+zQgV200EkUIl38nFYYH6hd7+eDM4/O8m0lK8pCLZbeEhUja0/fE0vpaBhGTvvdZ3ApBe6r8pCYkWwWgxmnlYi44uRk8IhQPDRHHoLEEkmUxYyHuzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(39860400002)(346002)(366004)(396003)(136003)(6506007)(2906002)(26005)(186003)(478600001)(83380400001)(71200400001)(52536014)(86362001)(54906003)(316002)(9326002)(5660300002)(8676002)(4326008)(55016002)(6916009)(7696005)(33656002)(64756008)(66556008)(66476007)(9686003)(66446008)(8936002)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: rhnrBawSuMmunWemNqQM1+fUSv3D86Ogp7be6f8m1LUXmiyb2KcbYgiHcWh4jAy29V1i5zWYbzxPGXvyb68VFJwRcxFCGV9gLzoGzwgdma8C5NVkwBOdnFlMhIHyRmLiOx43jBmxd8RNG+aWzPYu5f5c7WmKOsmd5VRga2PC4JVAMIlBkOHgJLbkb/vKHjS+rSjN4TbOwvemUT46TwyKb5RK+e8XRttItt73CFqSY/MXtH6cl1qxS89Tvbwru+VNRtrTlQwpFvMLuEHzcCvT4Jwt4Igd46fgRTkY0rlilUTapVCrds9SizqVWivVtI76KSE1k3PGFMNFrJLwVVJmdAS/i8qz/yF+LIPLKYYIyfJQ0HES2xg3FvWiCibtQ49OE9bm0OPXQKAelmGEr/kULfLPdpqMOt5HKsXLMSKjOMvta7Lhv0Bf+8SUKsc93qoC861470p80WU38BkwYprWlergxSfoFi6+ZTCewLIgUjrWkRiMDNMmPTKSXM08z50I
Content-Type: multipart/alternative;
 boundary="_000_CS1PR8401MB11440816B91B39DAD21E3CB2FF760CS1PR8401MB1144_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5066e7-d0e6-44ac-8267-08d82ee337cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2020 08:34:29.9929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 75mJ/WYWgQY7dK2kXchzM9K7cJcjyylyqJxf6AxrxixkcvmB0Ub8nnwaVK5LNtk6VR96Jg0Ic/3fjO5ZY98RnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB0421
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_02:2020-07-22,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 clxscore=1031
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230064
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
Cc: "Garrett, Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Wu, Frank \(ISS
 Firmware\)" <frank.l.wu@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_CS1PR8401MB11440816B91B39DAD21E3CB2FF760CS1PR8401MB1144_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi Sekar,
This is Abner Chang from HPE Server BIOS team, our team is also working on =
UEFI/EDK2 Redfish open source solution (just FYI the POC code is almost don=
e).

I read through the Remote BIOS configuration proposal and would like to see=
 if we still have chance to make some changes on it to reduce the efforts o=
n both BMC and BIOS. Also get rid of using PLDM BIOS control/Configuration =
methodology because we can find the equivalent method if use Redfish servic=
e.
I understand that this proposal is focus on the early system firmware POST,=
 and the firmware solution could be EDK2 + Linux boot. That means this firm=
ware solution may not have the network driver stack to communicate with Red=
fish service through vNIC. So some ideas proposed here are understandable s=
uch as the special format of BIOS resource and the IPMI channel to BMC. How=
ever, some of the designs proposed here would be the additional effort to c=
urrent system firmware (e.g. EDK2 PEI/ or early DXE phase) implementation a=
nd BMC as well.
The proprietary format of BIOS resource (Type 0/1) is one issue. We think i=
t would be better to just leverage JSON format (which follows BIOS/Attribut=
eRegistry data model) and carried by HTTP. The payload could be compressed =
by Redfish supported compress algorithm (gzip) and delivered over whatever =
non network stack based channel (e.g. IPMI proposed here) in the early POST=
.
With this, we may leverage system firmware drivers for building up the payl=
oad between BIOS and BMC. This could reduce system firmware effort and get =
rid of proprietary format of BIOS resource in XML. Furthermore, the archite=
cture of OpenBMC Remote BIOS configuration would be more closer to the curr=
ent Redfish service implementation. BMC can leverage the implementation of =
Redfish service if the payload is carried by HTTP message with JSON format =
which follow Redfish BIOS data model
We don't have much concerns of the transport layer between BMC<->BIOS becau=
se it is used in the early system POST, stay with IPMI looks fine for now.

Thanks
Abner



--_000_CS1PR8401MB11440816B91B39DAD21E3CB2FF760CS1PR8401MB1144_
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
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
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
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white">Hi Sekar,</span><sp=
an style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;co=
lor:#24292E"><br>
<span style=3D"background:white">This is Abner Chang from HPE Server BIOS t=
eam, our team is also working on UEFI/EDK2 Redfish open source solution (ju=
st FYI the POC code is almost done).<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white">I read through the =
Remote BIOS configuration proposal and would like to see if we still have c=
hance to make some changes on it to reduce the
 efforts on both BMC and BIOS. Also get rid of using PLDM BIOS control/Conf=
iguration methodology because we can find the equivalent method if use Redf=
ish service.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white">I understand that t=
his proposal is focus on the early system firmware POST, and the firmware s=
olution could be EDK2 + Linux boot. That means
 this firmware solution may not have the network driver stack to communicat=
e with Redfish service through vNIC. So some ideas proposed here are unders=
tandable such as the special format of BIOS resource and the IPMI channel t=
o BMC. However, some of the designs
 proposed here would be the additional effort to current system firmware (e=
.g. EDK2 PEI/ or early DXE phase) implementation and BMC as well.</span><sp=
an style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;co=
lor:#24292E"><br>
<span style=3D"background:white">The proprietary format of BIOS resource (T=
ype 0/1) is one issue. We think it would be better to just leverage JSON fo=
rmat (which follows BIOS/AttributeRegistry data model) and carried by HTTP.=
 The payload could be compressed by
 Redfish supported compress algorithm (gzip) and delivered over whatever no=
n network stack based channel (e.g. IPMI proposed here) in the early POST.<=
o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white">With this, we may l=
everage system firmware drivers for building up the payload between BIOS an=
d BMC. This could reduce system firmware effort
 and get rid of proprietary format of BIOS resource in XML. Furthermore, th=
e architecture of OpenBMC Remote BIOS configuration would be more closer to=
 the current Redfish service implementation. BMC can leverage the implement=
ation of Redfish service if the
 payload is carried by HTTP message with JSON format which follow Redfish B=
IOS data model<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white">We don&#8217;t have=
 much concerns of the transport layer between BMC&lt;-&gt;BIOS because it i=
s used in the early system POST, stay with IPMI looks fine
 for now.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white">Thanks<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white">Abner<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CS1PR8401MB11440816B91B39DAD21E3CB2FF760CS1PR8401MB1144_--
