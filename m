Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD231AD492
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 04:40:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493L0Z2Q4CzDsND
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 12:39:58 +1000 (AEST)
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
 header.s=mimecast20170203 header.b=Xixyu5/E; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=Jdnl3a7w; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493Kzr3DBlzDrhb
 for <openbmc@lists.ozlabs.org>; Fri, 17 Apr 2020 12:39:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1587091153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Iv0jjBwOR5kxctjiWQShf5cEce6bEzEdXC86txlxOqw=;
 b=Xixyu5/EgdfUYrQKOB0Fgjauc5rmGnZf0YkPE+vLKbm+ppN5wMFDUfxpIeTVYCEgsm/kua
 6AZS2eO1VsuQumWyMniFiwvYdRHwTJapNF5b8nzhaA/ayoDncP4EyTZ2RUxQYZ5Fh4KACZ
 HJf6UVfG2VkUZDIf75Q4+72l8KqYQRA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1587091154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Iv0jjBwOR5kxctjiWQShf5cEce6bEzEdXC86txlxOqw=;
 b=Jdnl3a7wy07zZ3xUSM9P9HGve6RkTXi5qhT3NrwVAHsPKPZajY6k6nNlR0PeCUm13xS4JS
 W0ezMaEQxg4NLUdGTH0x4Qx9zADPKpkKZgVLkKYMaIaJZ3GLoEBxifNl3ViAEQIHeRvQW4
 v4zO16NPhwDgVSuFNtkKIcjucJWItTU=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-LmlG-SjnMvSiS2E_YmcYXg-1; Thu, 16 Apr 2020 18:28:45 -0400
X-MC-Unique: LmlG-SjnMvSiS2E_YmcYXg-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Thu, 16 Apr 2020 15:28:43 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Thu, 16 Apr 2020 15:28:43 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: PSU (PMBus) fault monitoring / logging
Thread-Topic: PSU (PMBus) fault monitoring / logging
Thread-Index: AdYUPUOzhfShaeRKTfKjB4RwKlmmUQ==
Date: Thu, 16 Apr 2020 22:28:43 +0000
Message-ID: <337b91ad1ac2401a982113f025564da7@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.126.102.102]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: multipart/alternative;
 boundary="_000_337b91ad1ac2401a982113f025564da7SCLEXCHMB13phoenixcom_"
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

--_000_337b91ad1ac2401a982113f025564da7SCLEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Is there a module that instantiates sensors for PSU PMBus based faults afte=
r the entity-manager probes the busses and finds the PSUs by FRU?

I'm looking for the method by which the faults are monitored and logged.  I=
 see that there's kernel hwmon support for PMBus but I'm trying to understa=
nd how IPMI sensors and logging tie in.


--_000_337b91ad1ac2401a982113f025564da7SCLEXCHMB13phoenixcom_
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
<p class=3D"MsoNormal">Is there a module that instantiates sensors for PSU =
PMBus based faults after the entity-manager probes the busses and finds the=
 PSUs by FRU?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I'm looking for the method by which the faults are m=
onitored and logged.&nbsp; I see that there&#8217;s kernel hwmon support fo=
r PMBus but I&#8217;m trying to understand how IPMI sensors and logging tie=
 in.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_337b91ad1ac2401a982113f025564da7SCLEXCHMB13phoenixcom_--

