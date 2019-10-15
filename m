Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91554D8312
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 23:53:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t8M248B2zDr7F
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 08:53:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=phoenix.com
 (client-ip=216.205.24.170; helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.b="ueM05pCB"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t8KM6xNNzDqfy
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 08:52:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1571176322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=RJx/qA04I/1E9wvCptvfwfCtBfrYxi8PuwpmHY90RVE=;
 b=ueM05pCBCnf1UFj9uYUwoHusaVQ7kP6tnYT4IYr0LiKQ9wzTA0SzvI/YJix6XATvgAR4u6
 wRjPTe08ByKagmNWkAdBJEPpJQhcmsqqQiZTPfkGMbzit3wKi5qrhPKRlCujPvzoLG4Ikk
 UdwXEM4YdqsXoaUYDtFgA7di1DTLQ7E=
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-4ssyT8wsPtaIA2FSl5cJbg-1; Tue, 15 Oct 2019 14:49:15 -0400
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 15 Oct 2019 11:49:14 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Tue, 15 Oct 2019 11:49:14 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: "No Hardware Required" qemu-system-arm no services running Ports 80, 
 443, and 623, why?
Thread-Topic: "No Hardware Required" qemu-system-arm no services running Ports
 80, 443, and 623, why?
Thread-Index: AdWDiSqGzoGkr1ALTMiUlUEtgft2sA==
Date: Tue, 15 Oct 2019 18:49:13 +0000
Message-ID: <8b5e67d9cd5d478b9ceb1201c56fc25a@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.170]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-MC-Unique: 4ssyT8wsPtaIA2FSl5cJbg-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/alternative;
 boundary="_000_8b5e67d9cd5d478b9ceb1201c56fc25aSCLEXCHMB13phoenixcom_"
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

--_000_8b5e67d9cd5d478b9ceb1201c56fc25aSCLEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hello,

In the 11/3/2016 CAusten-OpenBMC.pdf presentation it is stated, on page 12 =
of 18, "No Hardware Required".
I have obmc-phosphor-image-romulus.static.mtd and obmc-phosphor-image-s2600=
wf-20191004165402.static.mtd
booting with qemu-system-arm and login in, however neither have any TCP ser=
vers running on Ports 80, 443, and 623.

So what am I missing in the process?


Thank you.

--
Bruce Mitchell
BMC Engineer
503-567-3032 direct
bruce_mitchell@phoenix.com

Phoenix Technologies Ltd.
15266 NW Greenbrier Pkwy
Beaverton, OR 97006 USA
503-567-3000 main

www.phoenix.com<http://www.phoenix.com>


--_000_8b5e67d9cd5d478b9ceb1201c56fc25aSCLEXCHMB13phoenixcom_
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
=09font-family:"Calibri","sans-serif";
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
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Hello,<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">In the 11/3/201=
6 CAusten-OpenBMC.pdf presentation it is stated, on page 12 of 18, &quot;No=
 Hardware Required&quot;.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">I have obmc-pho=
sphor-image-romulus.static.mtd and obmc-phosphor-image-s2600wf-201910041654=
02.static.mtd<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">booting with qe=
mu-system-arm and login in, however neither have any TCP servers running on=
 Ports 80, 443, and 623.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">So what am I mi=
ssing in the process?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Thank you.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">--<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Bruce Mitchell<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">BMC Engineer<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">503-567-3032 di=
rect<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">bruce_mitchell@=
phoenix.com<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Phoenix Technol=
ogies Ltd.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">15266 NW Greenb=
rier Pkwy<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Beaverton, OR 9=
7006 USA<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">503-567-3000 ma=
in<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><a href=3D"http=
://www.phoenix.com">www.phoenix.com</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><o:p>&nbsp;</o:=
p></span></p>
</div>
</body>
</html>

--_000_8b5e67d9cd5d478b9ceb1201c56fc25aSCLEXCHMB13phoenixcom_--

