Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 884242EBD9F
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 13:25:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9pVR5D64zDqgn
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 23:25:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com; envelope-from=stanley_liu@phoenix.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=H/vTQiXI; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=H/vTQiXI; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9Zmh2rKDzDqV3
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 14:37:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1609904223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=XpcRQP5b1R+sUhAeO/xUCM0gt9k8vLQafs2GJw7MEUM=;
 b=H/vTQiXI3o5ISyoSbHZsr+kikk7QosYayqmccMxhtnW3ia7/EgGJhjUJy8KBaHeszvKBEu
 +RV8EbFVIDebbzmYJbfUICg2ED9vN7iBFI2l8b2RRuYKob9pb43Np3M/dDvjqEzWk2y6I2
 ed9QR6vRs4cheGvph+hdllbeU4npsTo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1609904223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=XpcRQP5b1R+sUhAeO/xUCM0gt9k8vLQafs2GJw7MEUM=;
 b=H/vTQiXI3o5ISyoSbHZsr+kikk7QosYayqmccMxhtnW3ia7/EgGJhjUJy8KBaHeszvKBEu
 +RV8EbFVIDebbzmYJbfUICg2ED9vN7iBFI2l8b2RRuYKob9pb43Np3M/dDvjqEzWk2y6I2
 ed9QR6vRs4cheGvph+hdllbeU4npsTo=
Received: from TWN-EXCHMB-13.phoenix.com (123.51.168.5 [123.51.168.5])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-yF5t8OcNNDuwcKI5z4vHoQ-1; Tue, 05 Jan 2021 22:36:59 -0500
X-MC-Unique: yF5t8OcNNDuwcKI5z4vHoQ-1
X-CrossPremisesHeadersFilteredBySendConnector: TWN-EXCHMB-13.phoenix.com
Received: from TWN-EXCHMB-13.phoenix.com
 (2607:f0dc:5001:ff01:3897:a901:3564:6014) by TWN-EXCHMB-13.phoenix.com
 (2607:f0dc:5001:ff01:3897:a901:3564:6014) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 6 Jan 2021 11:36:56 +0800
Received: from TWN-EXCHMB-13.phoenix.com ([fe80::3897:a901:3564:6014]) by
 TWN-EXCHMB-13.phoenix.com ([fe80::3897:a901:3564:6014%12]) with mapi id
 15.00.1156.000; Wed, 6 Jan 2021 11:36:56 +0800
From: Stanley Liu <Stanley_Liu@phoenix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC add sensor in IPMI interface
Thread-Topic: OpenBMC add sensor in IPMI interface
Thread-Index: Adbj3S2qHM4WsJSiQ7+4l/eukD6dNw==
Date: Wed, 6 Jan 2021 03:36:55 +0000
Message-ID: <a1ff707523a84fccbfa7e7abfa572081@TWN-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2607:f0dc:5001:ff01:117e:628a:aa8e:1fe0]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: TWN-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=stanley_liu@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Language: en-US
Content-Type: multipart/related;
 boundary="_004_a1ff707523a84fccbfa7e7abfa572081TWNEXCHMB13phoenixcom_";
 type="multipart/alternative"
X-Mailman-Approved-At: Wed, 06 Jan 2021 23:14:50 +1100
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

--_004_a1ff707523a84fccbfa7e7abfa572081TWNEXCHMB13phoenixcom_
Content-Type: multipart/alternative;
	boundary="_000_a1ff707523a84fccbfa7e7abfa572081TWNEXCHMB13phoenixcom_"

--_000_a1ff707523a84fccbfa7e7abfa572081TWNEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Greeting,
Could you share any document or specification for add a sensor and can show=
 up from ipmitool, please?
I tried to add serval sensors with ISL68137 but fail.

--
Stanley Liu
BMC Technical Manager
+886.(2)77455671

[cid:image005.jpg@01CC9FA7.483A8010]

www.phoenix.com<http://www.phoenix.com/>


--_000_a1ff707523a84fccbfa7e7abfa572081TWNEXCHMB13phoenixcom_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
=09{font-family:PMingLiU;
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
=09{font-family:PMingLiU;
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:Tahoma;
=09panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
=09{font-family:"\@PMingLiU";
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:blue;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:purple;
=09text-decoration:underline;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
=09{mso-style-priority:99;
=09mso-style-link:"Balloon Text Char";
=09margin:0in;
=09margin-bottom:.0001pt;
=09font-size:8.0pt;
=09font-family:"Tahoma","sans-serif";}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri","sans-serif";
=09color:windowtext;}
span.BalloonTextChar
=09{mso-style-name:"Balloon Text Char";
=09mso-style-priority:99;
=09mso-style-link:"Balloon Text";
=09font-family:"Tahoma","sans-serif";}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri","sans-serif";}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Greeting,<o:p></o:p></p>
<p class=3D"MsoNormal">Could you share any document or specification for ad=
d a sensor and can show up from ipmitool, please?<o:p></o:p></p>
<p class=3D"MsoNormal">I tried to add serval sensors with ISL68137 but fail=
.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:JA">--<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:JA">Stanley Liu<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:JA">BMC Technica=
l Manager<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:JA">&#43;886.(2)=
77455671<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:JA"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><img width=3D"118" height=3D"50" id=3D"Picture_x0020=
_1" src=3D"cid:image001.jpg@01D6E420.3BDE2930" alt=3D"cid:image005.jpg@01CC=
9FA7.483A8010"><span style=3D"font-size:10.0pt;mso-fareast-language:JA"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;mso-fareast-language=
:JA"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:JA"><a href=3D"h=
ttp://www.phoenix.com/"><span style=3D"font-size:10.0pt;color:blue">www.pho=
enix.com</span></a></span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_a1ff707523a84fccbfa7e7abfa572081TWNEXCHMB13phoenixcom_--

--_004_a1ff707523a84fccbfa7e7abfa572081TWNEXCHMB13phoenixcom_
Content-Type: image/jpeg; name="image001.jpg"
Content-Description: image001.jpg
Content-Disposition: inline; filename="image001.jpg"; size=2458;
	creation-date="Wed, 06 Jan 2021 03:36:55 GMT";
	modification-date="Wed, 06 Jan 2021 03:36:55 GMT"
Content-ID: <image001.jpg@01D6E420.3BDE2930>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwgHBgoICAgLCgoLDhgQDg0NDh0VFhEYIx8lJCIf
IiEmKzcvJik0KSEiMEExNDk7Pj4+JS5ESUM8SDc9Pjv/2wBDAQoLCw4NDhwQEBw7KCIoOzs7Ozs7
Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozv/wAARCAAyAHYDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD2aiii
gAooooAKKKQ5xx1oAiurq3srd7i6mSGJBlnc4ArnZvEGs6t8nh3SysR/5fLwbEPuq9TWsNHiubhb
rUSLqVDmNGH7uL/dX19zz9Kr3+sXTzPZaJaC7uVO2SVzthhP+03c+wqHc7aKgn7seZ+ekV/Xn9zM
d/B2taj82r+JZznkx242qP1A/Sqb/DnRxhP7akWQdclPw4rSk8H6hqh363r9zLnrDbDy4x/n6U1v
hpoLA4a7Vv73mg4/Ss+S/T8T0Y4zk09vb/DFW/T8jAvfh9rGmhrjSb77RjnEbGOQ/rg/nVGx8beI
dGuDBeO1wIzh4boYcfj1/PNbV14H1rR/9I0DVpnK8+UW2E/0P41z2p6y+pBrTxBaeXfQ/Kt0ke2R
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
iiimYn//2Q==
--_004_a1ff707523a84fccbfa7e7abfa572081TWNEXCHMB13phoenixcom_--

