Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 017A0570E81
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 02:03:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhgvL6MFQz3c2V
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 10:03:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ztsystems.com header.i=@ztsystems.com header.a=rsa-sha256 header.s=mimecast20210607 header.b=OAT89Du8;
	dkim=pass (1024-bit key) header.d=ztsystems.com header.i=@ztsystems.com header.a=rsa-sha256 header.s=mimecast20210607 header.b=H9KGbb/1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ztsystems.com (client-ip=170.10.129.115; helo=us-smtp-delivery-115.mimecast.com; envelope-from=jeff.friedman@ztsystems.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ztsystems.com header.i=@ztsystems.com header.a=rsa-sha256 header.s=mimecast20210607 header.b=OAT89Du8;
	dkim=pass (1024-bit key) header.d=ztsystems.com header.i=@ztsystems.com header.a=rsa-sha256 header.s=mimecast20210607 header.b=H9KGbb/1;
	dkim-atps=neutral
X-Greylist: delayed 96 seconds by postgrey-1.36 at boromir; Tue, 12 Jul 2022 10:03:03 AEST
Received: from us-smtp-delivery-115.mimecast.com (us-smtp-delivery-115.mimecast.com [170.10.129.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lhgtv582Xz3bmD
	for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 10:03:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ztsystems.com;
	s=mimecast20210607; t=1657584180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=edCZJZJOlgrscANFERoPflX771eYUBZaS+JGvRCmW98=;
	b=OAT89Du8iOso6dGdVxoYPEGijkGJTpFYaktk0RyGNVwF9TKcPPnD2QsMqjs3U8AFwWxYDv
	QhuKb8dm85WPeiB1UBTMMVt3Ci3uko72qVaWgDBNOZcaL8DyTsKaYg0JY9BBx40jbqmlh+
	xTTnKLv9nPa8aeNUv5NzEIGGiGndO70=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ztsystems.com;
	s=mimecast20210607; t=1657584181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=edCZJZJOlgrscANFERoPflX771eYUBZaS+JGvRCmW98=;
	b=H9KGbb/1Q0j9iwNQYbTwvofC4wTjsO474THyPlqQIUohd6+48R3NTHFUTtenb1TG0woQ43
	+zJtyashCx9XbBgperWACJydwmlRop00quNnxwriCy6FQtmxVuLPBafcSolt67ZclnLsHE
	yP+yjjNGyS+jcOIhbBLYYx0RvT6utyQ=
Received: from ztcsla-ex01.ztgroup.com (67.212.155.84.static.coresite.com
 [67.212.155.84]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-gBpO5uFwNoum17nhEpGggg-1; Mon, 11 Jul 2022 20:01:19 -0400
X-MC-Unique: gBpO5uFwNoum17nhEpGggg-1
Received: from ztcsla-ex01.ztgroup.com (10.1.80.51) by ztcsla-ex01.ztgroup.com
 (10.1.80.51) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Mon, 11 Jul
 2022 17:01:16 -0700
Received: from ztcsla-ex01.ztgroup.com ([fe80::14a6:5e68:9df2:9d9e]) by
 ztcsla-ex01.ztgroup.com ([fe80::14a6:5e68:9df2:9d9e%5]) with mapi id
 15.01.2308.027; Mon, 11 Jul 2022 17:01:16 -0700
From: Jeff Friedman <jeff.friedman@ztsystems.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Virtual media support in the Redfish spec
Thread-Topic: Virtual media support in the Redfish spec
Thread-Index: AdiVgl2k4FOM//r9TFSQ72x1oSR2NA==
Date: Tue, 12 Jul 2022 00:01:16 +0000
Message-ID: <8eb6301e501941659eddfd6eb3fba15b@ztsystems.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5Lmh0bWwiIHA9ImM6XHVzZXJzXGplZmYuZnJp?=
 =?us-ascii?Q?ZWRtYW5cYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVl?=
 =?us-ascii?Q?LTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1iZWQ2MGU4OC0wMTc1LTExZWQtYjYw?=
 =?us-ascii?Q?ZC04Y2FlNGNkYzg2ODVcYW1lLXRlc3RcYmVkNjBlOGEtMDE3NS0xMWVkLWI2?=
 =?us-ascii?Q?MGQtOGNhZTRjZGM4Njg1Ym9keS5odG1sIiBzej0iMzI5OSIgdD0iMTMzMDIw?=
 =?us-ascii?Q?NTc2NzUzMDI5NjQ2IiBoPSIrQ2FGZS9HWCtyVHVlM3dBS3lLb0MwZU9HOW89?=
 =?us-ascii?Q?IiBpZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dV?=
 =?us-ascii?Q?QUFNSUVBQUFPa2k2QmdwWFlBYVZyZUdPeHNDUndwV3Q0WTdHd0pIQUhBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBSEFBQUFCU0JBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBRUFBUUFCQUFBQU9zM1dPZ0FBQUFBQUFBQUFBQUFBQUo0QUFB?=
 =?us-ascii?Q?QmhBR1FBWkFCeUFHVUFjd0J6QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdNQVl3QmZBR01BZFFC?=
 =?us-ascii?Q?ekFIUUFid0J0QUY4QVlRQnVBSGtBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFB?=
 =?us-ascii?Q?QUFBQUNBQUFBQUFDZUFBQUFZd0IxQUhNQWRBQnZBRzBBWHdCd0FHVUFjZ0J6?=
 =?us-ascii?Q?QUc4QWJnQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFCQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRB?=
 =?us-ascii?Q?QUFCakFIVUFjd0IwQUc4QWJRQmZBSEFBYUFCdkFHNEFaUUJ1QUhVQWJRQmlB?=
 =?us-ascii?Q?R1VBY2dBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR01BZFFCekFIUUFi?=
 =?us-ascii?Q?d0J0QUY4QWN3QnpBRzRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFB?=
 =?us-ascii?Q?QUFBQUFBQ0FBQUFBQUNlQUFBQVpRQnRBR0VBYVFCc0FGOEFZUUJrQUdRQWNn?=
 =?us-ascii?Q?QmxBSE1BY3dBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFK?=
 =?us-ascii?Q?NEFBQUI2QUhRQVh3QmpBRzhBYmdCbUFHa0FaQUJsQUc0QWRBQnBBR0VBYkFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBIi8+PC9tZXRhPg=3D=3D?=
x-originating-ip: [10.1.80.38]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA15A415 smtp.mailfrom=jeff.friedman@ztsystems.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: ztsystems.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8eb6301e501941659eddfd6eb3fba15bztsystemscom_"
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

--_000_8eb6301e501941659eddfd6eb3fba15bztsystemscom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hello Redfish forum users,

I was recently working with a BMC vendor and asked about Redfish virtual me=
dia support, and their reply was they follow the Redfish 1.9 spec. So I was=
 looking for virtual media functionality in the spec but only found the fol=
lowing regarding this function (Redfish Spec 1.9.0):

5.6.5. Remote access support clause. Remote management functionality typica=
lly includes access mechanisms for redirecting operator interfaces such as =
serial console, keyboard video and mouse (KVM-IP), command shell, or comman=
d-line interface, and virtual media. While these mechanisms are critical fu=
nctionality, they cannot be reasonably implemented as a RESTful interface. =
Therefore, this standard does not define the protocols or access mechanisms=
 for those services but encourages implementations that leverage existing s=
tandards. However, the Redfish schema includes resources and properties tha=
t enable client discovery of these capabilities and access mechanisms to en=
able interoperability.

I define this as DTMF has decided not to include virtual media (an other re=
mote access functions) in the specification, instead provide schema support=
 and encourage "implementations that leverage existing standards". Meaning =
there is no formal requirement for virtual media support defined in the Red=
fish spec. So a BMC vendor can adhere to the spec and not provide virtual m=
edia functionality. Am I interpreting this correctly?

Thank you,

Jeff Fredman

--_000_8eb6301e501941659eddfd6eb3fba15bztsystemscom_
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
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello Redfish forum users,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I was recently working with a BMC vendor and asked a=
bout Redfish virtual media support, and their reply was they follow the Red=
fish 1.9 spec. So I was looking for virtual media functionality in the spec=
 but only found the following regarding
 this function (Redfish Spec 1.9.0):<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><i>5.6.5. Remote access support clause. Remote manag=
ement functionality typically includes access mechanisms for redirecting op=
erator interfaces such as serial console, keyboard video and mouse (KVM-IP)=
, command shell, or command-line interface,
 and virtual media. While these mechanisms are critical functionality, they=
 cannot be reasonably implemented as a RESTful interface. Therefore, this s=
tandard does not define the protocols or access mechanisms for those servic=
es but encourages implementations
 that leverage existing standards. However, the Redfish schema includes res=
ources and properties that enable client discovery of these capabilities an=
d access mechanisms to enable interoperability.<o:p></o:p></i></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I define this as DTMF has decided not to include vir=
tual media (an other remote access functions) in the specification, instead=
 provide schema support and encourage &#8220;implementations that leverage =
existing standards&#8221;. Meaning there is no
 formal requirement for virtual media support defined in the Redfish spec. =
So a BMC vendor can adhere to the spec and not provide virtual media functi=
onality. Am I interpreting this correctly?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"color:#DF4826">Jeff Fredman</span>=
</b><o:p></o:p></p>
</div>
</body>
</html>

--_000_8eb6301e501941659eddfd6eb3fba15bztsystemscom_--

