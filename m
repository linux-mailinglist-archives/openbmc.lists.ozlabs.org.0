Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB511294421
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 22:56:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG5XR6jXbzDqgN
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 07:56:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com; envelope-from=neil_bradley@phoenix.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=edaeHAcw; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=C4k16KhO; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG5Wf2PX6zDqfP
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 07:56:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1603227367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=GzWQozOozElAK5ellgMH8/uQQFNnpa6o5+Lv7SuuBlE=;
 b=edaeHAcwXzjiWsOsNl8QENZ4JQ5HK1ZfskOOKFQYUp+C5g3mxug734YcVsVbQvfThpmPMx
 eDzwMQdsOogZ9yZI+CuYxAKUVRCE8lpAZR6xfs9JcjpiPeaArgrUkcbTrTGRKlJyIEQptm
 MaXh+LcfBh5xJaJCvoKRR5ZtW8OeXdE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1603227368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=GzWQozOozElAK5ellgMH8/uQQFNnpa6o5+Lv7SuuBlE=;
 b=C4k16KhOAFV70irxdDPvEWZ5A38LdXb4dxBKE7kkzCGU71uwwEmqiY1bYsh1pAPalfSJL2
 tSPdms5JVgLTGW3jA1/RARapeWY4qFhz5BSSJZTUIfx42CdqcP4GVSf3cdFtjkALtc2OGm
 jVcfWO9ZZhz9vE8JEYh5oChiVvoMFZA=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-GyVt9yEVPyetAKBBIGR_iA-1; Tue, 20 Oct 2020 16:56:02 -0400
X-MC-Unique: GyVt9yEVPyetAKBBIGR_iA-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 20 Oct 2020 13:56:00 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Tue, 20 Oct 2020 13:56:00 -0700
From: Neil Bradley <Neil_Bradley@phoenix.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Tioga Pass OEM 0x30/0x38 commands
Thread-Topic: Tioga Pass OEM 0x30/0x38 commands
Thread-Index: AdanIx1RPqBBK5fVQxeI3zX+aS9ndA==
Date: Tue, 20 Oct 2020 20:55:59 +0000
Message-ID: <1b7930bda58f48a3ad7a5a7c18a707e0@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.43.115.205]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=neil_bradley@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_1b7930bda58f48a3ad7a5a7c18a707e0SCLEXCHMB13phoenixcom_"
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

--_000_1b7930bda58f48a3ad7a5a7c18a707e0SCLEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Greetings fellow OpenBMCers -

I was looking through the Tioga Pass (TP) product specification and see the=
re's a table of OEM commands (0x30/0x38) that, after testing with the TP BM=
C on the latest OpenBMC tree, have found they are not there. Does anyone kn=
ow where (or if) these commands are implemented, and where they're located?

Additionally, it seems like some of the commands are semi-duplicated functi=
onality-wise with pushing the entire SMBIOS table down to the BMC, which we=
 are doing for one of our customers.

Thanks!

-->Neil

--_000_1b7930bda58f48a3ad7a5a7c18a707e0SCLEXCHMB13phoenixcom_
Content-Type: text/html; charset=WINDOWS-1252
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
=09{font-family:Wingdings;
=09panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
=09{font-family:PMingLiU;
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:"\@PMingLiU";
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Greetings fellow OpenBMCers &#8211;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I was looking through the Tioga Pass (TP) product sp=
ecification and see there&#8217;s a table of OEM commands (0x30/0x38) that,=
 after testing with the TP BMC on the latest OpenBMC tree, have found they =
are not there. Does anyone know where (or
 if) these commands are implemented, and where they&#8217;re located?<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Additionally, it seems like some of the commands are=
 semi-duplicated functionality-wise with pushing the entire SMBIOS table do=
wn to the BMC, which we are doing for one of our customers.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Wingdings">&agrave;</span=
>Neil<o:p></o:p></p>
</div>
</body>
</html>

--_000_1b7930bda58f48a3ad7a5a7c18a707e0SCLEXCHMB13phoenixcom_--

