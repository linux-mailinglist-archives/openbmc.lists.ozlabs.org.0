Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A95292159
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 05:07:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CF1rP0NlSzDqdG
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 14:07:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com; envelope-from=leo_cheng@phoenix.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=p5+cbo+n; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=p5+cbo+n; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCPRH4skkzDqRb
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 22:43:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1602848582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=DfQ/ffrXCcFhbLXyS+t7k5NVnVcb9N33xXKBVMs3Zq8=;
 b=p5+cbo+nsHFacZ8bxfyswNJ2dAXj1Bd9/KrDxERJfP1h5QYOT9zUKvzCfNMeGRvddgO3ZR
 eQYw42fXX68mb8aA8P+01gBLc/oXzuAp/kZMdtXu+H3FYpMKoMPdgLHw6pPfDt6LmA9GIb
 nKP5oCqidJcArWpx0MU89MpwPWFlkSw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1602848582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=DfQ/ffrXCcFhbLXyS+t7k5NVnVcb9N33xXKBVMs3Zq8=;
 b=p5+cbo+nsHFacZ8bxfyswNJ2dAXj1Bd9/KrDxERJfP1h5QYOT9zUKvzCfNMeGRvddgO3ZR
 eQYw42fXX68mb8aA8P+01gBLc/oXzuAp/kZMdtXu+H3FYpMKoMPdgLHw6pPfDt6LmA9GIb
 nKP5oCqidJcArWpx0MU89MpwPWFlkSw=
Received: from TWN-EXCHMB-13.phoenix.com (123.51.168.5 [123.51.168.5])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-IINIUKXNM8O4G4bU1IHdtA-1; Fri, 16 Oct 2020 03:39:04 -0400
X-MC-Unique: IINIUKXNM8O4G4bU1IHdtA-1
X-CrossPremisesHeadersFilteredBySendConnector: TWN-EXCHMB-13.phoenix.com
Received: from TWN-EXCHMB-13.phoenix.com
 (2607:f0dc:5001:ff01:3897:a901:3564:6014) by TWN-EXCHMB-13.phoenix.com
 (2607:f0dc:5001:ff01:3897:a901:3564:6014) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Fri, 16 Oct 2020 15:39:00 +0800
Received: from TWN-EXCHMB-13.phoenix.com ([fe80::3897:a901:3564:6014]) by
 TWN-EXCHMB-13.phoenix.com ([fe80::3897:a901:3564:6014%12]) with mapi id
 15.00.1156.000; Fri, 16 Oct 2020 15:39:00 +0800
From: Leo Cheng <Leo_Cheng@phoenix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Redfish CPLD version
Thread-Topic: Redfish CPLD version
Thread-Index: AdajjhBw1rlB3cFuQSCts0YVv0dN1Q==
Date: Fri, 16 Oct 2020 07:39:00 +0000
Message-ID: <5a6195e0729c4cd0a522f41d5b3aa3f1@TWN-EXCHMB-13.phoenix.com>
Accept-Language: zh-TW, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2607:f0dc:5001:ff01:6dda:3ed6:6392:3d9a]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: TWN-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=leo_cheng@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_5a6195e0729c4cd0a522f41d5b3aa3f1TWNEXCHMB13phoenixcom_"
X-Mailman-Approved-At: Mon, 19 Oct 2020 14:06:21 +1100
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

--_000_5a6195e0729c4cd0a522f41d5b3aa3f1TWNEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Dear Teams,

There is BIOS version defined in Redfish.
Will you plant to have CPLD version in the future?

https://github.com/openbmc/bmcweb/blob/master/Redfish.md


Best Regards,
Leo Cheng

--_000_5a6195e0729c4cd0a522f41d5b3aa3f1TWNEXCHMB13phoenixcom_
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
=09{margin:0cm;
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
=09{size:612.0pt 792.0pt;
=09margin:72.0pt 72.0pt 72.0pt 72.0pt;}
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
<p class=3D"MsoNormal">Dear Teams,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">There is BIOS version defined in Redfish.<o:p></o:p>=
</p>
<p class=3D"MsoNormal">Will you plant to have CPLD version in the future?<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/bmcweb/blob/ma=
ster/Redfish.md">https://github.com/openbmc/bmcweb/blob/master/Redfish.md</=
a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Leo Cheng<o:p></o:p></p>
</div>
</body>
</html>

--_000_5a6195e0729c4cd0a522f41d5b3aa3f1TWNEXCHMB13phoenixcom_--

