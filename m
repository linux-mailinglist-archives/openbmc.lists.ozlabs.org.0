Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F2C1DF1A5
	for <lists+openbmc@lfdr.de>; Sat, 23 May 2020 00:06:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TLDC2NsrzDr1x
	for <lists+openbmc@lfdr.de>; Sat, 23 May 2020 08:06:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=hDmrLUal; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=hDmrLUal; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TLCM5Nx4zDqxj
 for <openbmc@lists.ozlabs.org>; Sat, 23 May 2020 08:05:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1590185127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=9OKoGLoe8fJ9Wrh2dD1yRywtNIKDAHjOAtu0s0tdjGY=;
 b=hDmrLUalYBJMRVLb+9Mkk6c8w10njecNdCDUuukvYSnyc4RJ7DDjLTz7oBmI5/3bEy7bbS
 f3ucxJ0eDFx/DHHMsvGHd54bCNYCRGDb1R2RCTwbd69BVMAhquWHB7gB6D3vzTZxYAQeuG
 kJ1S0fs8tUmiziyt/1AIHtZPpfszy74=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1590185127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=9OKoGLoe8fJ9Wrh2dD1yRywtNIKDAHjOAtu0s0tdjGY=;
 b=hDmrLUalYBJMRVLb+9Mkk6c8w10njecNdCDUuukvYSnyc4RJ7DDjLTz7oBmI5/3bEy7bbS
 f3ucxJ0eDFx/DHHMsvGHd54bCNYCRGDb1R2RCTwbd69BVMAhquWHB7gB6D3vzTZxYAQeuG
 kJ1S0fs8tUmiziyt/1AIHtZPpfszy74=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-7AuK7BD9OOqOIWJfpCVw3Q-1; Fri, 22 May 2020 18:05:23 -0400
X-MC-Unique: 7AuK7BD9OOqOIWJfpCVw3Q-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Fri, 22 May 2020 15:05:21 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Fri, 22 May 2020 15:05:21 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: phosphor-ipmi-flash state recovery
Thread-Topic: phosphor-ipmi-flash state recovery
Thread-Index: AdYwe01TRgfLKJ7fSOiPeZ5iSAOYbQ==
Date: Fri, 22 May 2020 22:05:21 +0000
Message-ID: <bbd0955547ff46728528fd14d52fb04d@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.39.166.255]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: multipart/alternative;
 boundary="_000_bbd0955547ff46728528fd14d52fb04dSCLEXCHMB13phoenixcom_"
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
Cc: Patrick Venture <venture@google.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_bbd0955547ff46728528fd14d52fb04dSCLEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

When running burn_my_bmc, if I exit the program during image upload with ct=
rl-c, it seems that the bmc gets left in a state that is difficult to recov=
er from.

When attempting to run the update again I can see that the /flash/active/im=
age blob is present.  burn_my_bmc opens the cleanup blob, commits it, and t=
hen closes it but the state doesn't change. I don't have the cleanup-delete=
 option enabled but it doesn't look like that cleans up the state anyhow.

Internally, it looks like I need to get to abortProcess() but to do that I =
need to close the current session but I don't have a way to obtain the sess=
ionID after the fact.  Also the stale session doesn't seem to expire (as me=
ntioned in the readme.md) and I can't find the support for that in the code=
.

Can you give me a pointer on the best known way to recover from this scenar=
io without rebooting the BMC?


--_000_bbd0955547ff46728528fd14d52fb04dSCLEXCHMB13phoenixcom_
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
<p class=3D"MsoNormal">When running burn_my_bmc, if I exit the program duri=
ng image upload with ctrl-c, it seems that the bmc gets left in a state tha=
t is difficult to recover from.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When attempting to run the update again I can see th=
at the /flash/active/image blob is present.&nbsp; burn_my_bmc opens the cle=
anup blob, commits it, and then closes it but the state doesn&#8217;t chang=
e. I don&#8217;t have the cleanup-delete option enabled
 but it doesn&#8217;t look like that cleans up the state anyhow.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Internally, it looks like I need to get to abortProc=
ess() but to do that I need to close the current session but I don&#8217;t =
have a way to obtain the sessionID after the fact. &nbsp;Also the stale ses=
sion doesn&#8217;t seem to expire (as mentioned in
 the readme.md) and I can&#8217;t find the support for that in the code. <o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can you give me a pointer on the best known way to r=
ecover from this scenario without rebooting the BMC?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_bbd0955547ff46728528fd14d52fb04dSCLEXCHMB13phoenixcom_--

