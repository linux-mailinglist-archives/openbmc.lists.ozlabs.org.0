Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E6E10D4CE
	for <lists+openbmc@lfdr.de>; Fri, 29 Nov 2019 12:28:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PXM70SlxzDqS8
	for <lists+openbmc@lfdr.de>; Fri, 29 Nov 2019 22:28:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="tVl6rKTY"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PXL53WXczDqQ0
 for <openbmc@lists.ozlabs.org>; Fri, 29 Nov 2019 22:27:41 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6264F437FA;
 Fri, 29 Nov 2019 11:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1575026853; x=
 1576841254; bh=jKHu4W6jU+zo9fvnwfXOMGShYfvCUsX9CIFwFnO6FtA=; b=t
 Vl6rKTYkMaJ73I5apfKs2hTaxHQzI/S8Km/6vXwuMfS7G1jH1f54+GnA5yz9loZJ
 gBTYQIHhuaQOPwHJXN4If/R18rD2wAbxf4g/eilsY5jV3WrWvoansZY6RPIKwM/M
 Cma9kukWdFoRrd/E+nRRwMWE50MJzLcVYNH5LKHH7w=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P5Bsm-o81VTr; Fri, 29 Nov 2019 14:27:33 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 6D2A843B4E;
 Fri, 29 Nov 2019 14:27:32 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 29
 Nov 2019 14:27:32 +0300
Subject: Re: license conflicts with OpenSSL
To: Yong Li <yong.b.li@linux.intel.com>, <openbmc@lists.ozlabs.org>
References: <000001d5a682$2b3fabd0$81bf0370$@linux.intel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <b0b878b8-ff90-9e22-2831-44b086c0d8a2@yadro.com>
Date: Fri, 29 Nov 2019 14:27:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <000001d5a682$2b3fabd0$81bf0370$@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YNm9d4q0tPCv9pkKk77zfeMWWmQcXY167"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

--YNm9d4q0tPCv9pkKk77zfeMWWmQcXY167
Content-Type: multipart/mixed; boundary="MBM538bstfSc1MQXu2iWmCLBiRTWYh43D";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Yong Li <yong.b.li@linux.intel.com>, openbmc@lists.ozlabs.org
Message-ID: <b0b878b8-ff90-9e22-2831-44b086c0d8a2@yadro.com>
Subject: Re: license conflicts with OpenSSL
References: <000001d5a682$2b3fabd0$81bf0370$@linux.intel.com>
In-Reply-To: <000001d5a682$2b3fabd0$81bf0370$@linux.intel.com>

--MBM538bstfSc1MQXu2iWmCLBiRTWYh43D
Content-Type: multipart/alternative;
 boundary="------------068BEF1736D54F53244AA4B2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------068BEF1736D54F53244AA4B2
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Young and all!

I checked and I can say that ipmitool needs readline solely for ipmishell=

support. I think that if ipmitool is confgured with --disable-ipmishell, =
then
there will be no license clash with readline as it won't be linked.

The requirement for ncurses looks totally obsolete. Nothing seems to chan=
ge if I
just drop the requirement for tgetent(), which is what requires ncurses. =
The
tgetent() function is never called from anywhere in ipmitool code. I thin=
k I
will just drop the requirement for ncurses from ipmitool soon.

With best regards,
Alexander Amelkin,
Maintainer of ipmitool
https://github.com/ipmitool/ipmitool

29.11.2019 9:56, Yong Li wrote:
>
> Hi All,
>
> =A0
>
> Just found that some packages included in openbmc have license conflict=
 issues
> between OpenSSL and GPL
>
> =A0
>
> Ipmitool package and krb5 package are both linked to openssl and other =
GPL libs.
>
> =A0
>
> Based on the discussion in
> https://lists.debian.org/debian-legal/2004/05/msg00595.html, I think th=
ey are
> conflict licenses.
>
> =A0
>
> Just want to know if we need to do something? Such as add an additional=

> license file?
>
> =A0
>
> =A0
>
> More information:
>
> meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
>
> LICENSE =3D "BSD-3-Clause"
>
> DEPENDS =3D "openssl readline ncurses"
>
> =A0
>
> Readline is GPLv3
>
> =A0
>
> meta-openembedded/meta-oe/recipes-connectivity/krb5/krb5_1.17.bb:
>
> LICENSE =3D "MIT"
>
> DEPENDS =3D "bison-native ncurses util-linux e2fsprogs e2fsprogs-native=
 openssl"
>
> =A0
>
> Util-linux is GPLv2
>
> =A0
>
> =A0
>
> Thanks,
>
> Yong
>

--------------068BEF1736D54F53244AA4B2
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html;
      charset=3Dwindows-1252">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Hi Young and all!</p>
    <p>I checked and I can say that ipmitool needs readline solely for
      ipmishell support. I think that if ipmitool is confgured with
      --disable-ipmishell, then there will be no license clash with
      readline as it won't be linked.<br>
    </p>
    <p>The requirement for ncurses looks totally obsolete. Nothing seems
      to change if I just drop the requirement for tgetent(), which is
      what requires ncurses. The tgetent() function is never called from
      anywhere in ipmitool code. I think I will just drop the
      requirement for ncurses from ipmitool soon.<br>
    </p>
    <pre class=3D"moz-signature" cols=3D"80">With best regards,
Alexander Amelkin,
Maintainer of ipmitool
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/ipmitool/ip=
mitool">https://github.com/ipmitool/ipmitool</a>
</pre>
    <div class=3D"moz-cite-prefix">29.11.2019 9:56, Yong Li wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:000001d5a682$2b3fabd0$81bf0370$@linux.intel.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html;
        charset=3Dwindows-1252">
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
=2EMsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">Just found that some packages included in
          openbmc have license conflict issues between OpenSSL and GPL<o:=
p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">Ipmitool package and krb5 package are both=

          linked to openssl and other GPL libs. <o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">Based on the discussion in <a
            href=3D"https://lists.debian.org/debian-legal/2004/05/msg0059=
5.html"
            moz-do-not-send=3D"true">https://lists.debian.org/debian-lega=
l/2004/05/msg00595.html</a>,
          I think they are conflict licenses.<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">Just want to know if we need to do
          something? Such as add an additional license file?<o:p></o:p></=
p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">More information:<o:p></o:p></p>
        <p class=3D"MsoNormal">meta-openembedded/meta-oe/recipes-kernel/i=
pmitool/ipmitool_1.8.18.bb<o:p></o:p></p>
        <p class=3D"MsoNormal">LICENSE =3D "BSD-3-Clause"<o:p></o:p></p>
        <p class=3D"MsoNormal">DEPENDS =3D "openssl readline ncurses"<o:p=
></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">Readline is GPLv3<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">meta-openembedded/meta-oe/recipes-connecti=
vity/krb5/krb5_1.17.bb:<o:p></o:p></p>
        <p class=3D"MsoNormal">LICENSE =3D "MIT"<o:p></o:p></p>
        <p class=3D"MsoNormal">DEPENDS =3D "bison-native ncurses util-lin=
ux
          e2fsprogs e2fsprogs-native openssl"<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">Util-linux is GPLv2<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
        <p class=3D"MsoNormal">Yong<o:p></o:p></p>
      </div>
    </blockquote>
  </body>
</html>

--------------068BEF1736D54F53244AA4B2--

--MBM538bstfSc1MQXu2iWmCLBiRTWYh43D--

--YNm9d4q0tPCv9pkKk77zfeMWWmQcXY167
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJd4QCjAAoJEOiTWHtbdBeNdisP/3SDZf6HZPGolQlhq16pkaM5
qDdrbCD4+jihY7A+AIYJtMIq7v1KYH5FmM9nTHzsH62guYaQZv2op1Q+KxN2a14V
XwKG4hDUiOloQ4Cv4CBf8psrYlzICAho7Vk7bkCCDJemrsQzbq5RSednaUKxqtb3
FY4Whlhc4osN50JgteWggxu1+t/5fAFWjrrAx+ZWISldLrOPx82SYqSSK0UHiXgz
v2gvKgcqlRH11PIdkO252d4Znwok1w5xfhyh19Hk6SD7BI4gN+xJqMC6STTbUNPB
hGM97H8kccQiONxhUH2GIzF1Y4cUBQzSkg1ujr1006Y91dtb8klRUqLq5hrcjcwG
ZymKEYEvMrDygE6BxSkDqKQzsR22IOOgiqa+Zox2HXC+syGAjoU7NJEzY94XHv/i
FtEwwZLb1lfEwvS5cUDr4iaP6BlxzwL7oBm0FrnClIZywFifa38TYyZmIJOMXtdu
IfSjqqo7CjD3YhICSmGcx3IdAepS00G4aCcJB8pmkpwBuekLLcAlFokx4xpQhIUW
pSX8qFQ80v5+NzeYpDB+XU0J+/i9/Ukn55kzPZn9ItU5NmZlzsVQir2ZrocSPzFT
VTeiBLsJsAeUDpHjGgipf/q4xiN4dDDFO71CUqOEdGJwgQn4cQFg7OQts/2Q3FQp
C+IgpqwDN04pUCTCMJoR
=eSHT
-----END PGP SIGNATURE-----

--YNm9d4q0tPCv9pkKk77zfeMWWmQcXY167--
