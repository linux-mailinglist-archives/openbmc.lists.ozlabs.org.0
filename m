Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 220622BA1FB
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 06:42:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ccln11rG0zDqvp
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 16:42:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-na.com (client-ip=40.107.94.67;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=mohaimen.alsamarai@fii-na.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fii-na.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=JBHWBTk/; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbJp35cZPzDqNB
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 08:23:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3bz8/FlrQzex8W6ZZufoG5AiFSN4aFFl5HXfRRrbN9LuS3fbppaL7wZdQpZ+LpJmOPLISNz/pf6PYW0MEA4YTAya4wS0d0krqpt2Wz4/GooG6wuHkOodCcvT14ZfqFWsa7WUOorOPZN8ObLcCMjNByNQnnBIbiwNJBxKRjc8VHXGJwkQLrrC/3UQxKagLHJFUvSmMUzebb3ovxG0LZ/WPsvJoX/tsr5asZYzhNQBoaMN4GpRZLmEwJoqc6iIm7xLkEjhDTvdNLYhIxCAw3i4d2hDb5IqZjtKE9Zt/XuVZn7Pm5yrFL8IBwVEwHiCjUFQ4QIpTUSwVjFHupapPDSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7NCmmJLnKsn/lvq5duQ2XzgylWe+cGEekwSuhghgz0=;
 b=DIxGzF2l7uYoBCOdJtiHvSXsi0Tzs6nUehAtoK0GpGSprT1Gqd6Nkf2RCKrHN3SaE5IF86UwKVOsNfvYtqjE9l3QvA7bdw1cjVr0nXAIGhydVRWQmrc7jQVGzudXpJclVS68AOrDKadSRfzgfxOt+H5hhdF/fuBedRIAzLmb4xU5tdFskJVdFdvyQtBZa5N36zK7NEG1wi/xQm2HP86EK2jRNq6cEZyvftaTgDCHVhltAdi3YBl0pZKaqPY0RNJ4JhxvHyivXqhAacOF2g/KxFRF8joitcJ27qRMFOjn0X2LTZerZjjjIPsVJ+yAOU+ezIMI7IjXkyVqO5KcFn8OQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7NCmmJLnKsn/lvq5duQ2XzgylWe+cGEekwSuhghgz0=;
 b=JBHWBTk/hkT99BaJFtm97tUP0tT5ujv6wnl5GiN3LT54i2Wkdsd8ZlqtUb2FUHro3YS2bGyc/CGr8EPhgPgdcka/NOMCCCQFxBzBoKhFtX5iblOwNSLYKUu7JkHV4tek8TnkXZHwQED/SAY1tzzgaigd19md8N9AZyrEmWR7DvCMGMAYd/2jPAnxSovoOuLoR+r/vbeyHHrhdu9ueJxe5VhvzeUulMTI+lq7AEhMaQurSPSYrVEv6w6HU4e64nte49me6hKdd0uOw/kgjVB+jcbHAaol/wlgBFk9D5y3H6ICmL9wOJNY9uTb1V7m6I6svVPvnSqJrRbXIybH1Tq87g==
Received: from DM6PR08MB5883.namprd08.prod.outlook.com (2603:10b6:5:152::18)
 by DM6PR08MB6139.namprd08.prod.outlook.com (2603:10b6:5:103::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 21:23:15 +0000
Received: from DM6PR08MB5883.namprd08.prod.outlook.com
 ([fe80::b0ec:23cd:3a5:4cb3]) by DM6PR08MB5883.namprd08.prod.outlook.com
 ([fe80::b0ec:23cd:3a5:4cb3%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 21:23:15 +0000
From: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: phosphor-ipmi-flash build error
Thread-Topic: phosphor-ipmi-flash build error
Thread-Index: Ada9JfK8weeOoKkOTu2JHZHbpAKwRw==
Date: Tue, 17 Nov 2020 21:23:15 +0000
Message-ID: <DM6PR08MB588362D381EC3603682F9B32B2E20@DM6PR08MB5883.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=fii-na.com;
x-originating-ip: [65.205.114.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c6d256f-0ef3-4297-4771-08d88b3efef5
x-ms-traffictypediagnostic: DM6PR08MB6139:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR08MB613934BB0D191731C83883C2B2E20@DM6PR08MB6139.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PROiuWMEG6oDGk7jrIGwYnhaWOaBQ4w8NSbXMQxVQ7GjFjfe1mhtMWNNq22S9LUgEfflLum3xB2t8yxkXXKgSSPM3Gi47kKJnqlsJ9Ly6EzVzBs4+2UNEjA+aE6XR+BflzVixx5lW3xb/PmBSsM/Y8Rd4/CxcM30VhA5wzyIAZMrhaZ8CWFXP5sFYe3sqNWKolkHAPsGg+XfXvX+HheXB8t4/DimqyiE8SZjCTrGO5uz2YVgqfzttZvvU8PjLS9sAns7UOJ2OQZft9PYkrFJnEdTYxYVXXYb7iD7bpA8Nw6J5Slp/yuPuNG9rWRrswUUmDz5zQNsDdgYBLlU0Du9ts1cxz2OP9W+ZSUdnyEAvvXsAvZ+FDTNGjZN4yXvBHIUuWd0QjWcG8jSVhlpL3+mKQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR08MB5883.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(366004)(346002)(39850400004)(396003)(54906003)(316002)(66446008)(33656002)(5660300002)(8936002)(478600001)(7696005)(186003)(26005)(6506007)(6916009)(9326002)(55016002)(8676002)(9686003)(2906002)(4326008)(66556008)(64756008)(66476007)(66946007)(52536014)(166002)(83380400001)(3480700007)(86362001)(76116006)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: peR3U8TZALbiytZBWhH/+edvfsl9L+VjMgomkzEzdQBRT1ul5gsRPkJVpyrdsOPCzi7m1k/wh4QU0u04nAccp4CzZPFm9oxJeUqBXLRg7EA1BGNpaEhEFA9/48d63p+9VppadnC8twATEGlm1EGk7EhyKp0rRB7VOmsaIEwbJYNjXPYWyt/IpsUlaybS+w8OIItBzr6yFbKRjpJ8HM0vlvbX4pGGO36JhC4umygp6l7zMaQoQD07Eq1M8OM2YBdhOSco+lvRYEUehS2eG5VVacANGS2dlfHp/q7w1fFyzb1R5murzUdhHI4UAoB2B1v5I6jGLbPuHMc9thKkSBzmR5WkzDcIi9aHR4cYsM0gCu01Yt6x4fCTDLXAavlHFsTJHCCFTij5nChIOb8zC6DrGMHUBeWtOnGFaO2z2jM9GjblykqtWm9idWuqE9yLkQEDZK8JiNdJqgu+noWeSYL57jGH/8o/TyOk2Ei1Fghxn3sHNYAjiU1i71E6k1P5vWfig0g8kwzmzFwms8E2Ex37bBtBa3cediOAowkWQGeU39an3u20BR719KTCPsSsx0rvBAerp551pe34vXZtQlkWWxbJcBmxYSFSE6n6ao88DvKjSLAdHOtoOPL8Wgy3ros+zTqjqHcHJjccmMiz88M2vw==
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB588362D381EC3603682F9B32B2E20DM6PR08MB5883namp_"
MIME-Version: 1.0
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB5883.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6d256f-0ef3-4297-4771-08d88b3efef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2020 21:23:15.3386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c7JezQItb92w8W31yQFGIh8bSWjJPOQAn6IGEzsgDUSCmfSxnAS5C500z0YYAGESbpWn/PZmA7y7IRjulopjq7XuYtQy1OtygbUmPEC2mmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6139
X-Mailman-Approved-At: Fri, 20 Nov 2020 16:41:20 +1100
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
Cc: XP Chen <Xiao-Peng.Chen@fii-na.com>,
 Lancelot Kao <lancelot.cy.kao@fii-na.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM6PR08MB588362D381EC3603682F9B32B2E20DM6PR08MB5883namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,
                We are trying to build the phosphor-ipmi-flash<https://gith=
ub.com/openbmc/phosphor-ipmi-flash> and we counter issue at the make step p=
lease see below for the error message, can you advise us what we can do to =
pass that error


[root@localhost phosphor-ipmi-flash]# make
make  all-recursive
make[1]: Entering directory '/root/phosphor-ipmi-flash'
Making all in .
make[2]: Entering directory '/root/phosphor-ipmi-flash'
make[2]: Leaving directory '/root/phosphor-ipmi-flash'
Making all in tools
make[2]: Entering directory '/root/phosphor-ipmi-flash/tools'
Making all in .
make[3]: Entering directory '/root/phosphor-ipmi-flash/tools'
  CXX      burn_my_bmc-main.o
In file included from p2a.hpp:5,
                 from main.cpp:21:
pci.hpp:40:39: error: 'span' in namespace 'stdplus' does not name a templat=
e type
     virtual void write(const stdplus::span<const std::uint8_t> data) =3D 0=
;
                                       ^~~~
pci.hpp:40:43: error: expected ',' or '...' before '<' token
     virtual void write(const stdplus::span<const std::uint8_t> data) =3D 0=
;
                                           ^
pci.hpp:51:39: error: 'span' in namespace 'stdplus' does not name a templat=
e type
     virtual void write(const stdplus::span<const std::uint8_t> data) overr=
ide;
                                       ^~~~
pci.hpp:51:43: error: expected ',' or '...' before '<' token
     virtual void write(const stdplus::span<const std::uint8_t> data) overr=
ide;
                                           ^
make[3]: *** [Makefile:699: burn_my_bmc-main.o] Error 1
make[3]: Leaving directory '/root/phosphor-ipmi-flash/tools'
make[2]: *** [Makefile:725: all-recursive] Error 1
make[2]: Leaving directory '/root/phosphor-ipmi-flash/tools'
make[1]: *** [Makefile:615: all-recursive] Error 1
make[1]: Leaving directory '/root/phosphor-ipmi-flash'
make: *** [Makefile:475: all] Error 2
[root@localhost phosphor-ipmi-flash]#



Thanks,
Mohaimen Alsamarai
BMC developer
FII USA



--_000_DM6PR08MB588362D381EC3603682F9B32B2E20DM6PR08MB5883namp_
Content-Type: text/html; charset="us-ascii"
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.EmailStyle20
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We are trying to build the <a href=
=3D"https://github.com/openbmc/phosphor-ipmi-flash">
<span style=3D"color:windowtext;text-decoration:none">phosphor-ipmi-flash</=
span></a> and we counter issue at the make step please see below for the er=
ror message, can you advise us what we can do to pass that error &nbsp;<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">[root@localhost phosphor-ipmi-flash]# make<o:p></o:p=
></p>
<p class=3D"MsoNormal">make&nbsp; all-recursive<o:p></o:p></p>
<p class=3D"MsoNormal">make[1]: Entering directory '/root/phosphor-ipmi-fla=
sh'<o:p></o:p></p>
<p class=3D"MsoNormal">Making all in .<o:p></o:p></p>
<p class=3D"MsoNormal">make[2]: Entering directory '/root/phosphor-ipmi-fla=
sh'<o:p></o:p></p>
<p class=3D"MsoNormal">make[2]: Leaving directory '/root/phosphor-ipmi-flas=
h'<o:p></o:p></p>
<p class=3D"MsoNormal">Making all in tools<o:p></o:p></p>
<p class=3D"MsoNormal">make[2]: Entering directory '/root/phosphor-ipmi-fla=
sh/tools'<o:p></o:p></p>
<p class=3D"MsoNormal">Making all in .<o:p></o:p></p>
<p class=3D"MsoNormal">make[3]: Entering directory '/root/phosphor-ipmi-fla=
sh/tools'<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; CXX&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; burn_my_bmc=
-main.o<o:p></o:p></p>
<p class=3D"MsoNormal">In file included from p2a.hpp:5,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from main.cpp:21:<o:p></o:p></=
p>
<p class=3D"MsoNormal">pci.hpp:40:39: error: &#8216;span&#8217; in namespac=
e &#8216;stdplus&#8217; does not name a template type<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; virtual void write(const st=
dplus::span&lt;const std::uint8_t&gt; data) =3D 0;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;^~~~<o:p></o:p></p>
<p class=3D"MsoNormal">pci.hpp:40:43: error: expected &#8216;,&#8217; or &#=
8216;...&#8217; before &#8216;&lt;&#8217; token<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; virtual void write(const st=
dplus::span&lt;const std::uint8_t&gt; data) =3D 0;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^<o:p></o:p></p>
<p class=3D"MsoNormal">pci.hpp:51:39: error: &#8216;span&#8217; in namespac=
e &#8216;stdplus&#8217; does not name a template type<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; virtual void write(const st=
dplus::span&lt;const std::uint8_t&gt; data) override;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~<o:p></o:p></p>
<p class=3D"MsoNormal">pci.hpp:51:43: error: expected &#8216;,&#8217; or &#=
8216;...&#8217; before &#8216;&lt;&#8217; token<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; virtual void write(const st=
dplus::span&lt;const std::uint8_t&gt; data) override;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^<o:p></o:p></p>
<p class=3D"MsoNormal">make[3]: *** [Makefile:699: burn_my_bmc-main.o] Erro=
r 1<o:p></o:p></p>
<p class=3D"MsoNormal">make[3]: Leaving directory '/root/phosphor-ipmi-flas=
h/tools'<o:p></o:p></p>
<p class=3D"MsoNormal">make[2]: *** [Makefile:725: all-recursive] Error 1<o=
:p></o:p></p>
<p class=3D"MsoNormal">make[2]: Leaving directory '/root/phosphor-ipmi-flas=
h/tools'<o:p></o:p></p>
<p class=3D"MsoNormal">make[1]: *** [Makefile:615: all-recursive] Error 1<o=
:p></o:p></p>
<p class=3D"MsoNormal">make[1]: Leaving directory '/root/phosphor-ipmi-flas=
h'<o:p></o:p></p>
<p class=3D"MsoNormal">make: *** [Makefile:475: all] Error 2<o:p></o:p></p>
<p class=3D"MsoNormal">[root@localhost phosphor-ipmi-flash]#<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Mohaimen Alsamarai<o:p></o:p></p>
<p class=3D"MsoNormal">BMC developer <o:p></o:p></p>
<p class=3D"MsoNormal">FII USA<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR08MB588362D381EC3603682F9B32B2E20DM6PR08MB5883namp_--
