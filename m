Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7566A2638E4
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 00:14:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmxBm1FZTzDqbw
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 08:14:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com; envelope-from=neil_bradley@phoenix.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=e+agJObI; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=e+agJObI; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bmx9s3DzMzDqZD
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 08:13:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1599689609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Omfc0D4Fcta+s2vCe5mIzHxihAIdJxuDtsY98z4wL5A=;
 b=e+agJObIvEfcx1sjDX3OsTXbEL5fIAkH6wqXvbpmUHR+cH7/0WB4hnjA54OPPELTpw7WFH
 BlY9ACYwyYaGYNw4oF4lrUCdXHhr++Y0Tv87r2OazEVk3OYYLj2l9nL3gnRcDvSa9eCAey
 SyOPnuhmh22MszPDL6bHw4efa9J11l0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1599689609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Omfc0D4Fcta+s2vCe5mIzHxihAIdJxuDtsY98z4wL5A=;
 b=e+agJObIvEfcx1sjDX3OsTXbEL5fIAkH6wqXvbpmUHR+cH7/0WB4hnjA54OPPELTpw7WFH
 BlY9ACYwyYaGYNw4oF4lrUCdXHhr++Y0Tv87r2OazEVk3OYYLj2l9nL3gnRcDvSa9eCAey
 SyOPnuhmh22MszPDL6bHw4efa9J11l0=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-szWkuymjMVOEygyEkU-9Fw-1; Wed, 09 Sep 2020 18:13:25 -0400
X-MC-Unique: szWkuymjMVOEygyEkU-9Fw-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 9 Sep 2020 15:13:22 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 9 Sep 2020 15:13:22 -0700
From: Neil Bradley <Neil_Bradley@phoenix.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: bmcweb 30 second lockout
Thread-Topic: bmcweb 30 second lockout
Thread-Index: AdaG9iozMxnfwn4/QwqseainYVjCAA==
Date: Wed, 9 Sep 2020 22:13:21 +0000
Message-ID: <1f5b34f7029a48f39a5dfdbf9aad9e93@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.43.115.202]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=neil_bradley@phoenix.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: phoenix.com
Content-Type: multipart/alternative;
 boundary="_000_1f5b34f7029a48f39a5dfdbf9aad9e93SCLEXCHMB13phoenixcom_"
Content-Language: en-US
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

--_000_1f5b34f7029a48f39a5dfdbf9aad9e93SCLEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

I had recently read somewhere on the OpenBMC mailing list (forgive me, as I=
 can't find it anywhere now) recently indicating that there'd be a 30 secon=
d lockout for a given user if there were 3 consecutive failed login attempt=
s. My question is firstly, is this the case, and secondly, is it tied to th=
e user globally regardless of connection or is it per user and connection? =
The reason I ask is that the former would still allow for a denial of servi=
ce attack and want to make sure that's not actually the case.

Thanks!

-->Neil

--_000_1f5b34f7029a48f39a5dfdbf9aad9e93SCLEXCHMB13phoenixcom_
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I had recently read somewhere on the OpenBMC mailing=
 list (forgive me, as I can&#8217;t find it anywhere now) recently indicati=
ng that there&#8217;d be a 30 second lockout for a given user if there were=
 3 consecutive failed login attempts. My question
 is firstly, is this the case, and secondly, is it tied to the user globall=
y regardless of connection or is it per user and connection? The reason I a=
sk is that the former would still allow for a denial of service attack and =
want to make sure that&#8217;s not actually
 the case.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Wingdings">&agrave;</span=
>Neil<o:p></o:p></p>
</div>
</body>
</html>

--_000_1f5b34f7029a48f39a5dfdbf9aad9e93SCLEXCHMB13phoenixcom_--

