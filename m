Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E7B543B1A
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 20:10:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJFdL0WkKz3bq5
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 04:10:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ztsystems.com header.i=@ztsystems.com header.a=rsa-sha256 header.s=mimecast20210607 header.b=NfOLRNcC;
	dkim=pass (1024-bit key) header.d=ztsystems.com header.i=@ztsystems.com header.a=rsa-sha256 header.s=mimecast20210607 header.b=ljWHOZiu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ztsystems.com (client-ip=170.10.133.115; helo=us-smtp-delivery-115.mimecast.com; envelope-from=jeff.friedman@ztsystems.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ztsystems.com header.i=@ztsystems.com header.a=rsa-sha256 header.s=mimecast20210607 header.b=NfOLRNcC;
	dkim=pass (1024-bit key) header.d=ztsystems.com header.i=@ztsystems.com header.a=rsa-sha256 header.s=mimecast20210607 header.b=ljWHOZiu;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Thu, 09 Jun 2022 04:10:03 AEST
Received: from us-smtp-delivery-115.mimecast.com (us-smtp-delivery-115.mimecast.com [170.10.133.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJFcq5C5Kz2xTc
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 04:10:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ztsystems.com;
	s=mimecast20210607; t=1654711800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ezpZehK9Zzt/bCQK+JZckAiGDOv/fQSRMtYmjMAZSeY=;
	b=NfOLRNcCU+P5na1RIpWauUawzuyt9WSrf7neZA3roddUN3IbLsZYoh0aMntr7ptoa54D3Z
	5SapFR1LfjTkbQ5nfEBY1dKvGRtYT3/yKRjQ0N5MemJ8OPkD0ITV0MLAW/xgarYO92v2SY
	wuFSW8ArdMs0wniXUYQaRT6OXwZ33Zo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ztsystems.com;
	s=mimecast20210607; t=1654711801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ezpZehK9Zzt/bCQK+JZckAiGDOv/fQSRMtYmjMAZSeY=;
	b=ljWHOZiuHH0ZLZM87fMtnrIAMDAdJiOP7F95lC/bjU6PPhCHsxYfpK/1KYjwMKJVTgpKI4
	wEFUknF1sxInPR+k04zyArqZbJ4MY6CiAZscDCgbRas2qBSyGZY48Qu/jYiyC8KTeHCT4V
	2C8w7QgMKkiqqYQU8O9oIg24s4xJ/wI=
Received: from ztcsla-ex01.ztgroup.com (67.212.155.84.static.coresite.com
 [67.212.155.84]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-2tO0hZ7kNAW_8HXNRnBa_w-1; Wed, 08 Jun 2022 14:08:46 -0400
X-MC-Unique: 2tO0hZ7kNAW_8HXNRnBa_w-1
Received: from ztcsla-ex01.ztgroup.com (10.1.80.51) by ztcsla-ex01.ztgroup.com
 (10.1.80.51) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Wed, 8 Jun
 2022 11:08:43 -0700
Received: from ztcsla-ex01.ztgroup.com ([fe80::f4f5:f679:b90b:d1a5]) by
 ztcsla-ex01.ztgroup.com ([fe80::f4f5:f679:b90b:d1a5%5]) with mapi id
 15.01.2308.027; Wed, 8 Jun 2022 11:08:43 -0700
From: Jeff Friedman <jeff.friedman@ztsystems.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: FW: Newbie question on Redfish URI resource names
Thread-Topic: Newbie question on Redfish URI resource names
Thread-Index: Adh7YaUQhINiiir+SKqIjbsJIX1DoQAAREzA
Date: Wed, 8 Jun 2022 18:08:43 +0000
Message-ID: <68063aedd81c42b39d1b343e3a0748b5@ztsystems.com>
References: <1593fdf40a6046a7a614407f7d08be15@ztsystems.com>
In-Reply-To: <1593fdf40a6046a7a614407f7d08be15@ztsystems.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJpbWFnZTAwMS5naWYiIHA9IiIgc3o9IjAiIHQ9IjAi?=
 =?us-ascii?Q?IGg9IiIgaWQ9IiIgYmw9IjAiIGJvPSIwIi8+PGF0IG5tPSJib2R5Lmh0bWwi?=
 =?us-ascii?Q?IHA9ImM6XHVzZXJzXGplZmYuZnJpZWRtYW5cYXBwZGF0YVxyb2FtaW5nXDA5?=
 =?us-ascii?Q?ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0w?=
 =?us-ascii?Q?NjY1MzQ4Zi1lNzU2LTExZWMtYjYwNi1lNDVlMzczMzViOWRcYW1lLXRlc3Rc?=
 =?us-ascii?Q?MDY2NTM0OTEtZTc1Ni0xMWVjLWI2MDYtZTQ1ZTM3MzM1YjlkYm9keS5odG1s?=
 =?us-ascii?Q?IiBzej0iNTEzNCIgdD0iMTMyOTkxODUzMjEyNDIyMzI4IiBoPSJiQmxpWDhQ?=
 =?us-ascii?Q?NTZWMHZSS2VXc3VnbjlneDBObzg9IiBpZD0iIiBibD0iMCIgYm89IjEiIGNp?=
 =?us-ascii?Q?PSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFNSUVBQUM0VUwvSVludllBYUxXYWdx?=
 =?us-ascii?Q?U3QrdThvdFpxQ3BLMzY3d0hBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSEFB?=
 =?us-ascii?Q?QUFCU0JBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRUFBUUFCQUFBQU9zM1dP?=
 =?us-ascii?Q?Z0FBQUFBQUFBQUFBQUFBQUo0QUFBQmhBR1FBWkFCeUFHVUFjd0J6QUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFB?=
 =?us-ascii?Q?QUFuZ0FBQUdNQVl3QmZBR01BZFFCekFIUUFid0J0QUY4QVlRQnVBSGtBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFBQUFDZUFBQUFZd0IxQUhN?=
 =?us-ascii?Q?QWRBQnZBRzBBWHdCd0FHVUFjZ0J6QUc4QWJnQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCakFIVUFjd0IwQUc4QWJRQmZBSEFB?=
 =?us-ascii?Q?YUFCdkFHNEFaUUJ1QUhVQWJRQmlBR1VBY2dBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBRUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FB?=
 =?us-ascii?Q?QUFBQW5nQUFBR01BZFFCekFIUUFid0J0QUY4QWN3QnpBRzRBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQVpRQnRB?=
 =?us-ascii?Q?R0VBYVFCc0FGOEFZUUJrQUdRQWNnQmxBSE1BY3dBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUI2QUhRQVh3QmpBRzhBYmdCbUFH?=
 =?us-ascii?Q?a0FaQUJsQUc0QWRBQnBBR0VBYkFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRUFBQUFBQUFBQUFn?=
 =?us-ascii?Q?QUFBQUFBIi8+PC9tZXRhPg=3D=3D?=
x-dg-rorf: true
x-originating-ip: [10.1.80.38]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA15A415 smtp.mailfrom=jeff.friedman@ztsystems.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: ztsystems.com
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_68063aedd81c42b39d1b343e3a0748b5ztsystemscom_";
	type="multipart/alternative"
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

--_004_68063aedd81c42b39d1b343e3a0748b5ztsystemscom_
Content-Type: multipart/alternative;
	boundary="_000_68063aedd81c42b39d1b343e3a0748b5ztsystemscom_"

--_000_68063aedd81c42b39d1b343e3a0748b5ztsystemscom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hello all,

New to OpenBMC, and am not clear on one thing as pertaining to the Redfish =
schema and URI resource names:

The DMTF Redfish schema URIs are defined as:

/redfish/v1/Chassis/{ChassisId}/
/redfish/v1/Managers/{ManagerId}
/redfish/v1/Systems/{ComputerSystemId}

Vendors can use their own names for {ChassisId}, {ManagerId}, and {Computer=
SystemId} as long as they conform to the syntax rules.

Question: Does OpenBMC specify names for these resources as part of the Ope=
nBMC spec? Or does OpenBMC just refer to the existing DMTF Redfish schemas?

I ask because I have seen reference to the following names in examples for =
Managers and Systems on the OpenBMC website:

/redfish/v1/Chassis/{ChassisId}/
/redfish/v1/Managers/bmc/
/redfish/v1/Systems/system/

In summary, does OpenBMC specify these resource names as part of their spec=
, or does it refer to existing DMTF Redfish schema specs?

Thank you!

Jeff Friedman
Sr. Field Systems Engineer | ZT Systems
M: 206.819.2824
[ZT Systems]<http://www.ztsystems.com/>

This email and any files transmitted with it are privileged/confidential an=
d intended solely for the use of the individual to whom they are addressed.=
 If you have received this email in error, you are not authorized to distri=
bute it in whole or in part. This communication does not constitute a contr=
act offer, amendment, or acceptance of a contract offer, unless explicitly =
stated.


--_000_68063aedd81c42b39d1b343e3a0748b5ztsystemscom_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-size:10.0pt;}
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
<p class=3D"MsoNormal">Hello all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">New to OpenBMC, and am not clear on one thing as per=
taining to the Redfish schema and URI resource names:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The DMTF Redfish schema URIs are defined as:<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">/redfish/v1/Chassis/{ChassisId}/<o:p></o:p></p>
<p class=3D"MsoNormal">/redfish/v1/Managers/{ManagerId}<o:p></o:p></p>
<p class=3D"MsoNormal">/redfish/v1/Systems/{ComputerSystemId}<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Vendors can use their own names for {ChassisId}, {Ma=
nagerId}, and {ComputerSystemId} as long as they conform to the syntax rule=
s.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Question: Does OpenBMC specify names for these resou=
rces as part of the OpenBMC spec? Or does OpenBMC just refer to the existin=
g DMTF Redfish schemas?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I ask because I have seen reference to the following=
 names in examples for Managers and Systems on the OpenBMC website:<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">/redfish/v1/Chassis/{ChassisId}/&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p=
></o:p></p>
<p class=3D"MsoNormal">/redfish/v1/Managers/<b><i>bmc</i></b>/&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal">/redfish/v1/Systems/<b><i>system</i></b>/&nbsp;&nbsp=
;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In summary, does OpenBMC specify these resource name=
s as part of their spec, or does it refer to existing DMTF Redfish schema s=
pecs?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"color:#DF4826">Jeff Friedman</span=
></b><span style=3D"font-size:9.0pt;color:#1F497D"><br>
</span><span style=3D"font-size:9.0pt;color:gray">Sr. Field Systems Enginee=
r | ZT Systems</span><span style=3D"font-size:9.0pt;color:#44546A"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:9.0pt;color:#7F7F7F">M: 206.819.2824<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><a href=3D"http://www=
.ztsystems.com/"><span style=3D"font-size:10.5pt;font-family:&quot;Arial&qu=
ot;,sans-serif;color:#4A58AB;text-decoration:none"><img border=3D"0" width=
=3D"115" height=3D"46" style=3D"width:1.1979in;height:.4791in" id=3D"Pictur=
e_x0020_2" src=3D"cid:image001.gif@01D87B26.F8CE6840" alt=3D"ZT Systems"></=
span></a><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans=
-serif;color:#6D6E71"><br>
<br>
</span><span style=3D"font-size:7.0pt;font-family:&quot;Arial&quot;,sans-se=
rif;color:#7F7F7F">This email and any files transmitted with it are privile=
ged/confidential and intended solely for the use of the individual to whom =
they are addressed. If you have received this
 email in error, you are not authorized to distribute it in whole or in par=
t. This communication does not constitute a contract offer, amendment, or a=
cceptance of a contract offer, unless explicitly stated.</span><span style=
=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#6D6E71=
">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_68063aedd81c42b39d1b343e3a0748b5ztsystemscom_--

--_004_68063aedd81c42b39d1b343e3a0748b5ztsystemscom_
Content-Type: image/gif; name="image001.gif"
Content-Description: image001.gif
Content-Disposition: inline; filename="image001.gif"; size=1474;
	creation-date="Wed, 08 Jun 2022 18:08:43 GMT";
	modification-date="Wed, 08 Jun 2022 18:08:43 GMT"
Content-ID: <image001.gif@01D87B26.F8CE6840>
Content-Transfer-Encoding: base64

R0lGODlhcwAuANU/AKmpqnd3d/r6+vT09O+mjurq6uBNKmVlZoSEhemGaPri1PjX0Ly8vFZWV7W1
tdvb29XV1czMzfbItkdHSMTExOLi4ud6WuJVOPvq5ORkSNwpJv3w6N9KJfnUv99CJt0xJvnby52d
npOTlPK4ouJdRd45KdsfJuiEX/728d9ELd9GMuyXed48KOqNceiAYfbMwfjVzfjWxt40KN9KKU9P
UPDw8G5ub2BgYeVsUI6OjuFTJeNeQEJCQ////99HJf///yH5BAEAAD8ALAAAAABzAC4AAAb/QNxl
Rywaj8jkEecivDa/qHRKrVqv2KwWe/F5v+CweEz2ZgiorXrNbkt35bg8nnm57/g7fM7v+wx2eYKD
Vnt+h2UXGISMhIaIkGEJjZR4j5GYPguVnGuXmZAEnaNZn6CHk6SqVKanfRlpq7KtrnMGCrKztZEG
MLmrtLtlBpu/pMHCY8TGx8mHy8ydyM5g0NGV02Uc2xy8xdeU2WIGLCbmJj7dz9/gjOJhJRctCQku
Ph6I1u2OkBwmFj0CbkjxQV0fffsEvfviD2BABSlkGOSDMKGlMNwyatz2L2APiDIMrLPIz0u3DyhT
qkwpwwQOjwo+mJDhYWKciiTbGOrGgkWJ/59Ag/784PBjRBY1D7LL6WYPBxkXOoDoQLWqVaoSQHhE
QRWEBQ02yeBkqmaPAQ0XPKpdy3atCxNhlS0l68mLgQ8XNrBF0bbv27jj5tLdYhav3h4jErSwQEAt
iHqNA2KYt2JHCaWDm9pF67GFuRIxPIJQYe7lw3MsRFIUnBmL03gjRkg4YeJD6IAoSMDt+DAiYLGC
BUBgQKEAox7NTPr4oEEG8xFqLZgw0BCm75FUKgTgwZ1GCAF5InxP/gWfBxMr1HpOytuoROxSCjTg
cUPEdh4i8ECYcEPVJQ4GmOCCWiOYwII67YH0m1xUMEDfAFGIwEMDNdRQAXhRDPCAcT9UEP9BBBwK
EAIPNhSAYQ0RQIDhDxb+MEAED0RRQHFTvBhBBVH8ZwIsHr2gQQk6bONDgtf5gRAFPNDgAIcUUCBA
DhOEEIUA2zHww4jdOfCDg9zxQMEPEdzAXQA4/hBAAwyIOQEDEUww4ZdgisldDgU8clYKGMCkggwl
nDNkUQrCl6EN3QUAQA1RIEkDohDwMEENDgbAAABuPvDAfBPYUEEBboYgIYU/EMoDAgh0KUKpNAzA
qZIMHMBDDobcJcMLW+nmwQ4uuGDBDAl6UIJqmFExQA40dNmAlj2I+eWICPyQw6vGVfAAhA6QCF6p
UjrLAwBmjhqFq/kNUKylSapYAwR12nX/HnQC4WCCBiZE1sMFAsL0bglJrXZFAQzkgCmOAPAgpatf
ttmdCGVG+oMA89mAQA6uBhAqD1Z2+2UNxaoo6gQBfLnHeel5tIIGKqhQQmQo0Dsgbi5o8EG+tizl
AAIRxDcftw/QBwENDUDYoQjzcWelgza4ON8BATicA7eEakmllz8UUGzNPQDgKncIwMGBBniqFQMI
CigAwmEbqLxWBzF8teAXCJXaAIcVFGtlD9u5yu0PFABQwAAVlFq0whNr2aGTgS+83ZdS84AuABBE
XS0PWpOsQF9qpWxCWmzRtrZdSz3gZgOeFnsAoj88PkGMP5R6w4bbSemgdwVEkGSTbtbs36rThFrJ
KQ8PNMqDAzVUe0PkKhxGeUAXwNsCX2r9pS8VEVzNnQ2ouyimDchFfR/WEBYgp5VYcjde0wvnHnXt
PwBQLHcHQLAHCymckMAJ9Ndv//wz4GPCDisQ4P8KF7jM84RFAQawaUVRINTdpBABBzigZlKogAM5
BAEHNi4KD2AABSmAKAFEgAI+qwADHMAACDllSOdIoQrRsY3zqDA1wVLDjCREAw5ZZCEY6YYHdpiP
TWBgEVqQHXcWaJEuUKMPGFAADkawhQEAIAQQzIkQlEDFKlrRCENIYgsk0JotBAEAOw==
--_004_68063aedd81c42b39d1b343e3a0748b5ztsystemscom_--

