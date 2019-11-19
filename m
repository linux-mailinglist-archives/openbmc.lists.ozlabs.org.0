Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D04102946
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 17:23:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HWNX4BYCzDqc3
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 03:23:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.b="tSL+iMm4"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HWMm2SsGzDqc4
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 03:23:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1574180589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/hNSK+x3zTmuOt5mlsuk3rPNREIxP9NYfrQN5doXarg=;
 b=tSL+iMm4jAD/G5zSEbw9Q4wXdju8kvheqY+l2CzYK8Q8QMxNytAlwK0f12zIHcVl0C6e0e
 XzYygZ+aHp/JS9VIf5VEc3mKNTSsbuC/immeodqnDPkWxlDVjJw5SBAwcEGfTauziPhUYQ
 WRDZzMOTjN8wQTe5KI+WlQQofEUBc4Q=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-L2sb4jXrM0qK0T7rKUya6A-1; Tue, 19 Nov 2019 11:23:06 -0500
X-MC-Unique: L2sb4jXrM0qK0T7rKUya6A-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 19 Nov 2019 08:22:50 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Tue, 19 Nov 2019 08:22:50 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Alexander Amelkin <a.amelkin@yadro.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: How to build for s2600wf ? Does it work at all?
Thread-Topic: How to build for s2600wf ? Does it work at all?
Thread-Index: AdWe9Xh7jnkNw5BpStSm7/OMp5+E2AAAAtUA
Date: Tue, 19 Nov 2019 16:22:50 +0000
Message-ID: <4844180beece41d08af0206779f6286d@SCL-EXCHMB-13.phoenix.com>
References: <29e500ed-2f4c-5e44-02fc-80b44e1c6623@yadro.com>
In-Reply-To: <29e500ed-2f4c-5e44-02fc-80b44e1c6623@yadro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.174]
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256; boundary="=-=pExhdzCNzcGOUX=-="
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
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

--=-=pExhdzCNzcGOUX=-=
Content-Type: multipart/alternative;
	boundary="=-=8Y/KTmVCAgioly=-="


--=-=8Y/KTmVCAgioly=-=
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

https://github.com/Intel-BMC/openbmc#how-to-build-for-wolf-pass

=C2=A0

=C2=A0

From: openbmc [mailto:openbmc-bounces+bruce_mitchell=3Dphoenix.com@lists.oz=
labs.org] On Behalf Of Alexander Amelkin
Sent: Tuesday, November 19, 2019 08:07
To: openbmc@lists.ozlabs.org
Subject: How to build for s2600wf ? Does it work at all?

=C2=A0

Hi all!=20

We can't get OpenBMC to work with s2600wf.=20

We tried openbmc/openbmc/master branch and got errors log from booted OpenB=
MC=20
(attached) regarding unavailability of power control, and also a netdev wat=
chdog=20
timeout and a kernel crash.=20

We tried Intel-BMC/master branch and got build errors, failed to build.=20

We tried Intel-BMC/clean_builds branch and ended up with an almost clean bo=
ot=20
log, but no 'obmcutil' and no apparent way to start the host. The netdev=20
watchdog also crashed.=20

Is there any instruction on how to properly build OpenBMC for s2600wf? Is i=
t=20
actually supported at all?=20

Thank you.=20

--=20
With best regards,=20
Alexander Amelkin=20

=C2=A0

--=-=8Y/KTmVCAgioly=-=
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><meta name=3DGenerator content=3D"Microso=
ft Word 14 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue vli=
nk=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span style=3D'f=
ont-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'><a href=
=3D"https://github.com/Intel-BMC/openbmc#how-to-build-for-wolf-pass">https:=
//github.com/Intel-BMC/openbmc#how-to-build-for-wolf-pass</a><o:p></o:p></s=
pan></p><p class=3DMsoNormal><span style=3D'font-size:11.0pt;font-family:"C=
alibri","sans-serif";color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3D=
MsoNormal><a name=3D"_MailEndCompose"><span style=3D'font-size:11.0pt;font-=
family:"Calibri","sans-serif";color:#1F497D'><o:p>&nbsp;</o:p></span></a></=
p><div style=3D'border:none;border-left:solid blue 1.5pt;padding:0in 0in 0i=
n 4.0pt'><div><div style=3D'border:none;border-top:solid #B5C4DF 1.0pt;padd=
ing:3.0pt 0in 0in 0in'><p class=3DMsoNormal><b><span style=3D'font-size:10.=
0pt;font-family:"Tahoma","sans-serif"'>From:</span></b><span style=3D'font-=
size:10.0pt;font-family:"Tahoma","sans-serif"'> openbmc [mailto:openbmc-bou=
nces+bruce_mitchell=3Dphoenix.com@lists.ozlabs.org] <b>On Behalf Of </b>Ale=
xander Amelkin<br><b>Sent:</b> Tuesday, November 19, 2019 08:07<br><b>To:</=
b> openbmc@lists.ozlabs.org<br><b>Subject:</b> How to build for s2600wf ? D=
oes it work at all?<o:p></o:p></span></p></div></div><p class=3DMsoNormal><=
o:p>&nbsp;</o:p></p><p><span style=3D'font-family:"Calibri","sans-serif"'>H=
i all!</span> <o:p></o:p></p><p><span style=3D'font-family:"Calibri","sans-=
serif"'>We can't get OpenBMC to work with s2600wf.</span> <o:p></o:p></p><p=
><span style=3D'font-family:"Calibri","sans-serif"'>We tried openbmc/openbm=
c/master branch and got errors log from booted OpenBMC</span> <br><span sty=
le=3D'font-family:"Calibri","sans-serif"'>(attached) regarding unavailabili=
ty of power control, and also a netdev watchdog</span> <br><span style=3D'f=
ont-family:"Calibri","sans-serif"'>timeout and a kernel crash.</span> <o:p>=
</o:p></p><p><span style=3D'font-family:"Calibri","sans-serif"'>We tried In=
tel-BMC/master branch and got build errors, failed to build.</span> <o:p></=
o:p></p><p><span style=3D'font-family:"Calibri","sans-serif"'>We tried Inte=
l-BMC/clean_builds branch and ended up with an almost clean boot</span> <br=
><span style=3D'font-family:"Calibri","sans-serif"'>log, but no 'obmcutil' =
and no apparent way to start the host. The netdev</span> <br><span style=3D=
'font-family:"Calibri","sans-serif"'>watchdog also crashed.</span> <o:p></o=
:p></p><p><span style=3D'font-family:"Calibri","sans-serif"'>Is there any i=
nstruction on how to properly build OpenBMC for s2600wf? Is it</span> <br><=
span style=3D'font-family:"Calibri","sans-serif"'>actually supported at all=
?</span> <o:p></o:p></p><p><span style=3D'font-family:"Calibri","sans-serif=
"'>Thank you.</span> <o:p></o:p></p><p><span style=3D'font-family:"Calibri"=
,"sans-serif"'>-- </span><br><span style=3D'font-family:"Calibri","sans-ser=
if"'>With best regards,</span> <br><span style=3D'font-family:"Calibri","sa=
ns-serif"'>Alexander Amelkin</span> <o:p></o:p></p><p class=3DMsoNormal sty=
le=3D'margin-bottom:12.0pt'><o:p>&nbsp;</o:p></p></div></div></body></html>

--=-=8Y/KTmVCAgioly=-=--

--=-=pExhdzCNzcGOUX=-=
Content-Type: application/pgp-signature;
	name="openpgp-digital-signature.asc"
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeipEzDpjviTrkbaRTqhMzxKZc3MFAl3UFtQACgkQTqhMzxKZ
c3PcCxAAkrrEZVnWdq0AdJ300qoTpG4KfC6Je900FtGtaa4kgYDK9vjdSFMizEgR
Q1BDIT6oSaqveWh643L+Q0pVrZaD6q5ss17C1H+hKoORo9H3AmbDFmGX16jRtHm/
mlzOIV/hUhQkd08Y7Cp7+xyeP0ahMJo7VOsJZtJGgpBjRiC2hplTyVaiwUuCoChD
Y0ZNJyi7EXqCdOzdp8XTUNymt9Fks4X3Dzq+KFt2MO0yF94lPAGNtU0aA1afVdwI
0JQkHUjOPRAEm1n7v9OfihGq9I+2+N3jA27XUA4+zj/w/X3/gF7VTZfcXemEMxvi
c5MrXx6Rb+5z2xPLM75lnVAITnYJqVfAyVsx4LdDVJaobUzyHSC2N2z8t8ctclgZ
o+gAMHlx9gILM7ECUQrMsp6GCwLwcRM0SjT15NEr3PgGDV6Mj0gxlvQseUIVZR+c
1fMRd2IeFV2Oy9e1r2Jr/P1Wr5zYA+7hhvqlJnw3dz8bH4cROiQgwijRxsPLRPmU
RchzbsIIXxMG9oEYhAdsiiE+Xw1gA4ctVYuMRUPquF+n1M51+PQJNpMDLMvPj3qQ
bK/OrsoZu4fOytSsKFl9c5Nmhoj1XRjgHJ6ypoNCSrviNF0HcpwfH2OvRa7hFf8X
C7u0yPEi2Ei3IjHfJfEnvu4Er2D9Ka4mXYTsDWTZ0WW1kAB457o=
=zJ/r
-----END PGP SIGNATURE-----


--=-=pExhdzCNzcGOUX=-=--

