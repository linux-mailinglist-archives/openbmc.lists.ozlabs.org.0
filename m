Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3C71412B4
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 22:19:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zv806Ff2zDqpf
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2020 08:19:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=rf4Uxn58; 
 dkim-atps=neutral
X-Greylist: delayed 65 seconds by postgrey-1.36 at bilbo;
 Sat, 18 Jan 2020 08:17:34 AEDT
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zv666Dk4zDr02
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2020 08:17:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1579295851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=8ut7neIQLd+CjdmdpNRJyOZkW0wkdKXNQK5wsTnS52U=;
 b=rf4Uxn589bIkfGMyWhe3BT/fU7N6wWmVjprwi3yyhmpzoD7gfsF9ti5Pi3I3NnI2dPFYbp
 +NgTIC5SnnVopu1i7/qN7H8OJqYEP+DzOr5svnnuioPIvX2MK3pxxpGrC7Y2DrOUBuv6UB
 0kkgqMiwThDyf2GK6gOdf3zfcB2bj18=
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-jmP5EIJwPveBopXMNcfxzw-1; Fri, 17 Jan 2020 16:16:19 -0500
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Fri, 17 Jan 2020 13:16:05 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Fri, 17 Jan 2020 13:16:05 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Intel S2600WF (Wolf Pass) BMC MAC addresses issue.
Thread-Topic: Intel S2600WF (Wolf Pass) BMC MAC addresses issue.
Thread-Index: AdXNe1Okbt5KnpvmSYyhXwYaRUZYzA==
Date: Fri, 17 Jan 2020 21:16:05 +0000
Message-ID: <a1f915ec674647f383696f113915d404@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.174]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-MC-Unique: jmP5EIJwPveBopXMNcfxzw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: multipart/alternative;
 boundary="_000_a1f915ec674647f383696f113915d404SCLEXCHMB13phoenixcom_"
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

--_000_a1f915ec674647f383696f113915d404SCLEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On my Intel S2600WF (Wolf Pass) the original Purley BMC FW gets its MAC add=
resses properly and consistently,
when reflashing the BMC SPI FLASH the BMC will still get the correct and sa=
me MAC addresses.

Then all I change is using OpenBMC (from here https://github.com/Intel-BMC/=
openbmc) and then the BMC gets
different MAC addresses each time I reflash the BMC SPU FLASH.
Is this the present expected behavior?
If so will it be corrected to behave like the Purley BMC FW for MAC address=
es?

Thanks!


--_000_a1f915ec674647f383696f113915d404SCLEXCHMB13phoenixcom_
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
<style><!--
/* Font Definitions */
@font-face
=09{font-family:PMingLiU;
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
=09{font-family:PMingLiU;
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
=09{font-family:Consolas;
=09panose-1:2 11 6 9 2 2 4 3 2 4;}
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
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:Consolas;
=09color:windowtext;}
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
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">On my Intel S26=
00WF (Wolf Pass) the original Purley BMC FW gets its MAC addresses properly=
 and consistently,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">when reflashing=
 the BMC SPI FLASH the BMC will still get the correct and same MAC addresse=
s.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Then all I chan=
ge is using OpenBMC (from here
<a href=3D"https://github.com/Intel-BMC/openbmc">https://github.com/Intel-B=
MC/openbmc</a>) and then the BMC gets<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">different MAC a=
ddresses each time I reflash the BMC SPU FLASH.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Is this the pre=
sent expected behavior?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">If so will it b=
e corrected to behave like the Purley BMC FW for MAC addresses?<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Thanks!<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><o:p>&nbsp;</o:=
p></span></p>
</div>
</body>
</html>

--_000_a1f915ec674647f383696f113915d404SCLEXCHMB13phoenixcom_--

