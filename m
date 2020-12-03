Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A092CDEB4
	for <lists+openbmc@lfdr.de>; Thu,  3 Dec 2020 20:24:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cn5Nx0SHnzDrHF
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 06:24:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=venkata_chandrappa@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=vJnVed+J; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=uUX3edh7; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cn5N36NJXzDr7M
 for <openbmc@lists.ozlabs.org>; Fri,  4 Dec 2020 06:23:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1607023388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=LbTOSMZOvrp5dFrUMtQMtTWoNncJkUgj60pzhWzQF5o=;
 b=vJnVed+JnU/zB6rvYch6xWXU+nYuDND3y/ctrl45/X7kIVfDLbTx/dUtDf0H9Ns53elUQ4
 RGE+rJHGGmy3bYiTAWayLVQ1fEv2MJA9EYW2HfmyEu1n3ITa2lksg9pGin5598eda35epY
 Cnjqcl19hYG7Lco122SFdQ7rp75o6AE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1607023389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=LbTOSMZOvrp5dFrUMtQMtTWoNncJkUgj60pzhWzQF5o=;
 b=uUX3edh770JobKa4TYFuODtxl456DvvUIiB5SiHWLd6EjulAM+MetTKvf7/7i1DTQSjg30
 +E4JlmFpqXSAKoozj1+CUOdW+g/otlKIJCeQIfINEUOPQBo44aG2+7c9AYiWZJaRr+28+1
 EBxpz5UT7bProzcieopjG5gDwJAxVQY=
Received: from TWN-EXCHMB-13.phoenix.com (123.51.168.5 [123.51.168.5])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-KmbfrtT2PWaLpiWqUOgVOg-1; Thu, 03 Dec 2020 10:20:35 -0500
X-MC-Unique: KmbfrtT2PWaLpiWqUOgVOg-1
X-CrossPremisesHeadersFilteredBySendConnector: TWN-EXCHMB-13.phoenix.com
Received: from TWN-EXCHMB-13.phoenix.com
 (2607:f0dc:5001:ff01:3897:a901:3564:6014) by TWN-EXCHMB-13.phoenix.com
 (2607:f0dc:5001:ff01:3897:a901:3564:6014) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Thu, 3 Dec 2020 23:20:30 +0800
Received: from TWN-EXCHMB-13.phoenix.com ([fe80::3897:a901:3564:6014]) by
 TWN-EXCHMB-13.phoenix.com ([fe80::3897:a901:3564:6014%12]) with mapi id
 15.00.1156.000; Thu, 3 Dec 2020 23:20:30 +0800
From: Venkata Chandrappa <Venkata_Chandrappa@phoenix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: LDAP group privilege mapping does not exist
Thread-Topic: LDAP group privilege mapping does not exist
Thread-Index: AdbJh0jl6iWlKGvjRia6TgDbkOc06w==
Date: Thu, 3 Dec 2020 15:20:29 +0000
Message-ID: <664a67f7de0f4402a9ec217d8c49c7e9@TWN-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [49.159.160.82]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: TWN-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=venkata_chandrappa@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_664a67f7de0f4402a9ec217d8c49c7e9TWNEXCHMB13phoenixcom_"
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

--_000_664a67f7de0f4402a9ec217d8c49c7e9TWNEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Everyone,

I'm looking for information regarding privilege mapping of LDAP users. I ha=
ve a LDAP server running with a group set to "priv-admin" privileges and th=
ere is one user added to this group. After setting the LDAP data in BMC web=
, I've added a Role Group with the same name as the LDAP group name and ass=
igned administrator privileges to it. The LDAP user is able to login to the=
 BMC web and redfish, however the user cannot perform any actions that an a=
dministrator is allowed to perform, even viewing information in the overvie=
w page is disallowed.

Journal logs seem to indicate the mapping doesn't exist, so I'm wondering i=
f the role groups added in BMC web have been setup correctly.
phosphor-user-manager[257]: LDAP group privilege mapping does not exist
One more thing to note is when I added the role group, there was a 404 resp=
onse generated. However, on refreshing the page or navigating back to the p=
age, the role group was added successfully.

I'm hoping this is a LDAP configuration issue and appreciate if someone cou=
ld provide some direction on this. Thanks.

Best Regards,
Venka

--_000_664a67f7de0f4402a9ec217d8c49c7e9TWNEXCHMB13phoenixcom_
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
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
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
=09{mso-style-type:export-only;}
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
<p class=3D"MsoNormal">Hi Everyone,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m looking for information regarding privileg=
e mapping of LDAP users. I have a LDAP server running with a group set to &=
#8220;priv-admin&#8221; privileges and there is one user added to this grou=
p. After setting the LDAP data in BMC web, I&#8217;ve added
 a Role Group with the same name as the LDAP group name and assigned admini=
strator privileges to it. The LDAP user is able to login to the BMC web and=
 redfish, however the user cannot perform any actions that an administrator=
 is allowed to perform, even viewing
 information in the overview page is disallowed. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Journal logs seem to indicate the mapping doesn&#821=
7;t exist, so I&#8217;m wondering if the role groups added in BMC web have =
been setup correctly.
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in"><i>phosphor-user-manager=
[257]: LDAP group privilege mapping does not exist</i><o:p></o:p></p>
<p class=3D"MsoNormal">One more thing to note is when I added the role grou=
p, there was a 404 response generated. However, on refreshing the page or n=
avigating back to the page, the role group was added successfully.<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m hoping this is a LDAP configuration issue =
and appreciate if someone could provide some direction on this. Thanks.<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Venka<o:p></o:p></p>
</div>
</body>
</html>

--_000_664a67f7de0f4402a9ec217d8c49c7e9TWNEXCHMB13phoenixcom_--

