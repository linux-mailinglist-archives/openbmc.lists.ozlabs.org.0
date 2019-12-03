Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0469010FF48
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 14:52:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S3Mc4sgvzDqXB
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 00:52:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="J+3Aavm1"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S37b5M4jzDqV7
 for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2019 00:42:19 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5216943E0C
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1575380532; x=
 1577194933; bh=cMjWiIMIZoPeKiL4W23pQDCVoSnfqhVkGUvpt6JRdwo=; b=J
 +3Aavm1d7wb+i5qHLGQEbUU7RilgvroaxwIUYbnHg+ng12AN1ozjVg3i90DnuU5g
 eDZDvzccky/IekNRWFA727TQRlgc9kSP8mi3D0goDEbHVUamxiv+ahBqafkGVyj5
 zPye9p6HIr8taS4Wt37AfeZhBm04tdnP/xelp9yGEE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPjayneofrA2 for <openbmc@lists.ozlabs.org>;
 Tue,  3 Dec 2019 16:42:12 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CF3C943B4E
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 16:42:12 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 3 Dec
 2019 16:42:12 +0300
Subject: Re: IPMI Show DIMM SPD Feature
To: <openbmc@lists.ozlabs.org>
References: <75aac0e9cbd54214971ae9bed0e817ca@lenovo.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <4b86f9d2-3b22-5cde-8efe-14c6a4380f2a@yadro.com>
Date: Tue, 3 Dec 2019 16:42:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <75aac0e9cbd54214971ae9bed0e817ca@lenovo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TxN49b6JAdlZtXrwjgE62322tojUPPzxI"
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

--TxN49b6JAdlZtXrwjgE62322tojUPPzxI
Content-Type: multipart/mixed; boundary="9eQm8rmUVJyOES0Mc1Mi5PrhlDTzFyWlk";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <4b86f9d2-3b22-5cde-8efe-14c6a4380f2a@yadro.com>
Subject: Re: IPMI Show DIMM SPD Feature
References: <75aac0e9cbd54214971ae9bed0e817ca@lenovo.com>
In-Reply-To: <75aac0e9cbd54214971ae9bed0e817ca@lenovo.com>

--9eQm8rmUVJyOES0Mc1Mi5PrhlDTzFyWlk
Content-Type: multipart/alternative;
 boundary="------------CB001C00B753A8788D1871C3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------CB001C00B753A8788D1871C3
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

02.12.2019 14:49, Yonghui YH21 Liu wrote:
>
> Hi all,
>
> =A0=A0=A0=A0=A0=A0 Could you help double confirm whether BMC can show D=
IMM SPD information
> by IPMI interface in current openBMC design?
>
> =A0=A0=A0=A0=A0=A0 If yes, could you help provide some guidance on impl=
ementing the feature.
>
If you're referring to product info like part number, vendor, etc., then =
yes,
OpenBMC can show it.

Your host system must be sending SPD info into BMC as IPMI FRU. OpenPOWER=

Firmware does that. Can't say for other types of hosts.

You must have a proper configuration for phosphor-ipmi-fru. Take a look a=
t how
this is done for YADRO VESNIN:

https://github.com/openbmc/openbmc/blob/master/meta-yadro/meta-vesnin/rec=
ipes-phosphor/ipmi/phosphor-ipmi-fru_%25.bbappend

https://github.com/openbmc/openbmc/blob/master/meta-yadro/meta-vesnin/rec=
ipes-phosphor/configuration/vesnin-yaml-config.bb

https://github.com/openbmc/openbmc/blob/master/meta-yadro/meta-vesnin/rec=
ipes-phosphor/configuration/vesnin-yaml-config/vesnin-ipmi-fru.yaml

The first number there is the FRU ID used by the host in IPMI Write FRU D=
ata
command:

>=A0 22:
> =A0 =A0 =A0 =A0=A0 /system/chassis/motherboard/dimm8:

With best regards,
Alexander Amelkin



--------------CB001C00B753A8788D1871C3
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html;
      charset=3Dwindows-1252">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    02.12.2019 14:49, Yonghui YH21 Liu wrote:<br>
    <blockquote type=3D"cite"
      cite=3D"mid:75aac0e9cbd54214971ae9bed0e817ca@lenovo.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html;
        charset=3Dwindows-1252">
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:\7B49\7EBF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@\7B49\7EBF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:\7B49\7EBF;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:\7B49\7EBF;
	color:windowtext;}
=2EMsoChpDefault
	{mso-style-type:export-only;
	font-family:\7B49\7EBF;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></s=
pan></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=A0=A0=A0=A0=A0=A0 Co=
uld you help
            double confirm whether BMC can show DIMM SPD information by
            IPMI interface in current openBMC design?
            <o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US">=A0=A0=A0=A0=A0=A0 If=
 yes, could you
            help provide some guidance on implementing the feature.</span=
></p>
      </div>
    </blockquote>
    <p>If you're referring to product info like part number, vendor,
      etc., then yes, OpenBMC can show it.</p>
    <p>Your host system must be sending SPD info into BMC as IPMI FRU.
      OpenPOWER Firmware does that. Can't say for other types of hosts.</=
p>
    <p>You must have a proper configuration for phosphor-ipmi-fru. Take
      a look at how this is done for YADRO VESNIN:</p>
    <p><a
href=3D"https://github.com/openbmc/openbmc/blob/master/meta-yadro/meta-ve=
snin/recipes-phosphor/ipmi/phosphor-ipmi-fru_%25.bbappend">https://github=
=2Ecom/openbmc/openbmc/blob/master/meta-yadro/meta-vesnin/recipes-phospho=
r/ipmi/phosphor-ipmi-fru_%25.bbappend</a></p>
    <p><a
href=3D"https://github.com/openbmc/openbmc/blob/master/meta-yadro/meta-ve=
snin/recipes-phosphor/configuration/vesnin-yaml-config.bb">https://github=
=2Ecom/openbmc/openbmc/blob/master/meta-yadro/meta-vesnin/recipes-phospho=
r/configuration/vesnin-yaml-config.bb</a></p>
    <p><a
href=3D"https://github.com/openbmc/openbmc/blob/master/meta-yadro/meta-ve=
snin/recipes-phosphor/configuration/vesnin-yaml-config/vesnin-ipmi-fru.ya=
ml">https://github.com/openbmc/openbmc/blob/master/meta-yadro/meta-vesnin=
/recipes-phosphor/configuration/vesnin-yaml-config/vesnin-ipmi-fru.yaml</=
a></p>
    <p>The first number there is the FRU ID used by the host in IPMI
      Write FRU Data command:</p>
    <p>&gt;=A0 22:<br>
      &gt; =A0 =A0 =A0 =A0=A0 /system/chassis/motherboard/dimm8:</p>
    <p>With best regards,<br>
      Alexander Amelkin</p>
    <br>
  </body>
</html>

--------------CB001C00B753A8788D1871C3--

--9eQm8rmUVJyOES0Mc1Mi5PrhlDTzFyWlk--

--TxN49b6JAdlZtXrwjgE62322tojUPPzxI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJd5mY0AAoJEOiTWHtbdBeNhvkQAJoQqS5+frovAHkMX3maS0GX
HbDkSc6fbCYQzY2y1vKjaiyOq8snoXodHZPBA2hVLVJdtiQSiZN5VBTD7zTZYunb
IjKvaItrNfIH2NnTywt7X0Zl5FHaXSLkciiWAlRs+RBb7ILTSvDpg3ddubvNWV1O
papMZqS2RikN22ZJpJlS6pnVNmtn5jmZ5xjiGzTpEPuRkRr4uyDkcfE6V05ZdYVT
Ou86e6qSr4CjKU9n6GCGAyz5esObya4bpCJQVTsMDLDTxhEvKGS7G76M9rj5H9Lc
Y3KOTbA8KVPKvAutRH0JjQLukRhTNBKa7KgIVx03U2MXzN83XGgD50RE+uTtquUK
/ASbaC9js4CtYNllthp/C1bTO7IcCrhzBF5RnouNex8TJqMOSVgLCWoUQA8luX8Q
Mn7kLF0r5mXVKK9Y36urxe8gkYJZLKUzIzvEiY1Zt7jB9/WWdiknVjcf97KDd2p6
ipAzNFnKm31fz2Bu6vUiLPUmQlJKdvGUWIKqXAFFLEDBHrst8WBe60DJVKivi4H8
hFTjM33f8kRsejBYt7EVWayc4dq0ze93ZF9fp26yP5SxVjsTply7TXxcOtV/6nQo
QeGuEJynmzYjkruOA7kVPnzPA/oqGAoNLy/u7pCJn2f+NH/iMTSzoAwp+qBMAu69
vuEJaWz0xZjtnW1kwjmv
=2eU/
-----END PGP SIGNATURE-----

--TxN49b6JAdlZtXrwjgE62322tojUPPzxI--
