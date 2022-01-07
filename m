Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3535548710D
	for <lists+openbmc@lfdr.de>; Fri,  7 Jan 2022 04:09:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVSqK0F37z3bV2
	for <lists+openbmc@lfdr.de>; Fri,  7 Jan 2022 14:09:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inspur.com (client-ip=210.51.26.145;
 helo=unicom145.biz-email.net; envelope-from=maxiaochao@inspur.com;
 receiver=<UNKNOWN>)
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVSpw0vCHz30DX
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jan 2022 14:08:13 +1100 (AEDT)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id BUP00001;
 Fri, 07 Jan 2022 11:08:01 +0800
Received: from jtjnmail201604.home.langchao.com (10.100.2.4) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 11:08:00 +0800
Received: from jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322])
 by jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322%5])
 with mapi id 15.01.2308.020; Fri, 7 Jan 2022 11:08:00 +0800
From: =?utf-8?B?WGlhb2NoYW8gTWEgKOmprOWwj+i2hSk=?= <maxiaochao@inspur.com>
To: "jiaqing.zhao@intel.com" <jiaqing.zhao@intel.com>,
 "johnathanx.mantey@intel.com" <johnathanx.mantey@intel.com>,
 "mine260309@gmail.com" <mine260309@gmail.com>
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IFVwZGF0ZSAob3IgZ2VuZXJhdGUpIC9ldGMvaXBt?=
 =?utf-8?Q?i=5Fpass_file?=
Thread-Topic: =?utf-8?B?562U5aSNOiBVcGRhdGUgKG9yIGdlbmVyYXRlKSAvZXRjL2lwbWlfcGFzcyBm?=
 =?utf-8?Q?ile?=
Thread-Index: AdgCrg4my0csNWtVRYG20ese5zhM7v//rp8A//903oCAATapgIAABAiA//7S5NA=
Date: Fri, 7 Jan 2022 03:08:00 +0000
Message-ID: <2b5d4a380665459986b54167f05c368b@inspur.com>
References: <3e6afebf819c4784a4dbacacccb74214@inspur.com>
 <CAARXrtmN1Fu8tWsqVotOwz_xdZkPLdaRPoS831mqRTO4FP6HHg@mail.gmail.com>
 <dbe4f24d42c24b9cbe8992fb982f02ec@inspur.com>
 <3eb8983b-5023-660f-9993-3699880aa61d@intel.com>
 <CO1PR11MB4785FBED8A7E760D14A878CC8E4C9@CO1PR11MB4785.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB4785FBED8A7E760D14A878CC8E4C9@CO1PR11MB4785.namprd11.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.192.64]
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=SHA1; boundary="----=_NextPart_000_0080_01D803B6.D4C76C40"
MIME-Version: 1.0
tUid: 2022107110801aae5e6e6479cd50f6f0df89d39758efa
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_NextPart_000_0080_01D803B6.D4C76C40
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0081_01D803B6.D4C76C40"


------=_NextPart_001_0081_01D803B6.D4C76C40
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your explanation about cracklib!

=20

What should I do to "comment out" correctly?

(I just started to learn =E2=80=98pam=E2=80=99 recently, I may not have =
enough in-depth understanding)

=20

I once tried to add a =E2=80=98#=E2=80=99 to the line containing =
=E2=80=98pam_cracklib.so=E2=80=99 in /etc/common-password.

=20

But when other modules execute pam_get_authtok(), an error will occur...

But I can't go into it...can't find its source code...

=20

=E5=8F=91=E4=BB=B6=E4=BA=BA: Zhao, Jiaqing =
[mailto:jiaqing.zhao@intel.com]=20
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2022=E5=B9=B41=E6=9C=887=E6=97=A5 =
1:10
=E6=94=B6=E4=BB=B6=E4=BA=BA: Mantey, JohnathanX =
<johnathanx.mantey@intel.com>; Xiaochao Ma (=E9=A9=AC=E5=B0=8F=E8=B6=85) =
<maxiaochao@inspur.com>; mine260309@gmail.com
=E6=8A=84=E9=80=81: openbmc@lists.ozlabs.org
=E4=B8=BB=E9=A2=98: RE: =E7=AD=94=E5=A4=8D: Update (or generate) =
/etc/ipmi_pass file

=20

Even you set minlen=3D0 in /etc/pam.d/common-password, the password =
length will still be checked by pam-cracklib. Pam-cracklib will call =
FascistCheck() function of cracklib, and inside cracklib, it will call =
FascistLookUser(), which also checkes the password length and there is =
no way to bypass it unless you modify cracklib code. The minimum length =
forced by cracklib is 6.

=20

https://github.com/cracklib/cracklib/blob/c66d74fc38e1632726da8230714bf62=
f6128e212/src/lib/fascist.c#L721

=20

FascistLookUser() also contain other implicit conditions your password =
must met. Please also be careful about them.

=20

Of course, you can comment out the pam_cracklib.so to bypass all these =
checks.

=20

From: openbmc <openbmc-bounces+jiaqing.zhao=3Dintel.com@lists.ozlabs.org =
<mailto:openbmc-bounces+jiaqing.zhao=3Dintel.com@lists.ozlabs.org> > On =
Behalf Of Johnathan Mantey
Sent: Friday, January 7, 2022 00:55
To: Xiaochao Ma (=E9=A9=AC=E5=B0=8F=E8=B6=85) <maxiaochao@inspur.com =
<mailto:maxiaochao@inspur.com> >; mine260309@gmail.com =
<mailto:mine260309@gmail.com>=20
Cc: openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>=20
Subject: Re: =E7=AD=94=E5=A4=8D: Update (or generate) /etc/ipmi_pass =
file

=20

The OBMC PAM requires the password to be 8 characters in length, and =
probably requires a numeral as well.
I realize you want to get to a 5 character password.
I recommend you try adding a user with a password that works with the =
existing rules to see if your automated creation method works. After =
that you can try creating shorter passwords.

On 1/5/22 23:02, Xiaochao Ma (=E9=A9=AC=E5=B0=8F=E8=B6=85) wrote:

Sorry I didn't explain some of the methods I tried  : (
=20
1. I tried the method you mentioned, but failed.
The length of the password I want to set is 5 digits.
I modified the complexity setting via /etc/pam.d/common-password, but =
still cannot set a 5-digit password. (The setting for reducing the =
length requirement failed to take effect)
=20
2. I also tried to temporarily remove pam_cracklib.so in =
/etc/pam.d/common-pasword so that it does not perform complexity =
detection. Failed very directly......
=20
-----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA: Lei YU [mailto:mine260309@gmail.com]=20
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2022=E5=B9=B41=E6=9C=886=E6=97=A5 =
14:41
=E6=94=B6=E4=BB=B6=E4=BA=BA: Xiaochao Ma (=E9=A9=AC=E5=B0=8F=E8=B6=85)  =
<mailto:maxiaochao@inspur.com> <maxiaochao@inspur.com>
=E6=8A=84=E9=80=81: openbmc@lists.ozlabs.org =
<mailto:openbmc@lists.ozlabs.org>=20
=E4=B8=BB=E9=A2=98: Re: Update (or generate) /etc/ipmi_pass file
=20
On Thu, Jan 6, 2022 at 11:39 AM Xiaochao Ma =
(=E9=A9=AC=E5=B0=8F=E8=B6=85)  <mailto:maxiaochao@inspur.com> =
<maxiaochao@inspur.com> wrote:

=20
Hello everyone
=20
=20
=20
I now want to add a default user to my own machine (I modified=20
obmc-phosphor-image.bbappend, use the useradd=E2=80=A6 ),
=20
but the new default user cannot use Ipmi. It is because the ipmi_pass =
file is not updated.
=20
  I couldn't find a method/tool to generate ipmi_pass file. So how can I =
generate a new ipmi_pass file?
=20

=20
What I do is to use qemu or a real BMC, adjust the ipmi =
username/passwords, and then copy the ipmi_pass out.

=20

--=20
Johnathan Mantey
Senior Software Engineer
azad technology partners
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>=20


------=_NextPart_001_0081_01D803B6.D4C76C40
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:=E5=AE=8B=E4=BD=93;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:=E7=AD=89=E7=BA=BF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"\@=E7=AD=89=E7=BA=BF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=E5=AE=8B=E4=BD=93";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"Century Gothic";
	panose-1:2 11 5 2 2 2 2 2 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML =E9=A2=84=E8=AE=BE=E6=A0=BC=E5=BC=8F Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLChar
	{mso-style-name:"HTML =E9=A2=84=E8=AE=BE=E6=A0=BC=E5=BC=8F Char";
	mso-style-priority:99;
	mso-style-link:"HTML =E9=A2=84=E8=AE=BE=E6=A0=BC=E5=BC=8F";
	font-family:"Courier New";}
p.HTMLPreformatted, li.HTMLPreformatted, div.HTMLPreformatted
	{mso-style-name:"HTML Preformatted";
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}
span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DZH-CN link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:10.5pt;color:#1F497D'>Thank you for your =
explanation about cracklib!<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;color:#1F497D'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;color:#1F497D'>What should I do to =
&quot;comment out&quot; correctly?<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;color:#1F497D'>(I just started to learn =
=E2=80=98pam=E2=80=99 recently, I may not have enough in-depth =
understanding)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.5pt;color:#1F497D'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;color:#1F497D'>I once tried to add a =
=E2=80=98#=E2=80=99 to the line containing =
=E2=80=98pam_cracklib.so=E2=80=99 in =
/etc/common-password.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.5pt;color:#1F497D'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;color:#1F497D'>But when other modules execute =
pam_get_authtok(), an error will occur...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;color:#1F497D'>But I can't go into it...can't =
find its source code...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.5pt;color:#1F497D'><o:p>&nbsp;</o:p></span></p><div=
><div style=3D'border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt =
0cm 0cm 0cm'><p class=3DMsoNormal><b><span =
style=3D'font-family:"=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91",sans-serif'>=E5=
=8F=91=E4=BB=B6=E4=BA=BA<span lang=3DEN-US>:</span></span></b><span =
lang=3DEN-US =
style=3D'font-family:"=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91",sans-serif'> =
Zhao, Jiaqing [mailto:jiaqing.zhao@intel.com] <br></span><b><span =
style=3D'font-family:"=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91",sans-serif'>=E5=
=8F=91=E9=80=81=E6=97=B6=E9=97=B4<span =
lang=3DEN-US>:</span></span></b><span lang=3DEN-US =
style=3D'font-family:"=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91",sans-serif'> =
2022</span><span =
style=3D'font-family:"=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91",sans-serif'>=E5=
=B9=B4<span lang=3DEN-US>1</span>=E6=9C=88<span =
lang=3DEN-US>7</span>=E6=97=A5<span lang=3DEN-US> =
1:10<br></span><b>=E6=94=B6=E4=BB=B6=E4=BA=BA<span =
lang=3DEN-US>:</span></b><span lang=3DEN-US> Mantey, JohnathanX =
&lt;johnathanx.mantey@intel.com&gt;; Xiaochao Ma =
(</span>=E9=A9=AC=E5=B0=8F=E8=B6=85<span lang=3DEN-US>) =
&lt;maxiaochao@inspur.com&gt;; =
mine260309@gmail.com<br></span><b>=E6=8A=84=E9=80=81<span =
lang=3DEN-US>:</span></b><span lang=3DEN-US> =
openbmc@lists.ozlabs.org<br></span><b>=E4=B8=BB=E9=A2=98<span =
lang=3DEN-US>:</span></b><span lang=3DEN-US> RE: =
</span>=E7=AD=94=E5=A4=8D<span lang=3DEN-US>: Update (or generate) =
/etc/ipmi_pass file<o:p></o:p></span></span></p></div></div><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Even you set minlen=3D0 in =
/etc/pam.d/common-password, the password length will still be checked by =
pam-cracklib. Pam-cracklib will call FascistCheck() function of =
cracklib, and inside cracklib, it will call FascistLookUser(), which =
also checkes the password length and there is no way to bypass it unless =
you modify cracklib code. The minimum length forced by cracklib is =
6.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><a =
href=3D"https://github.com/cracklib/cracklib/blob/c66d74fc38e1632726da823=
0714bf62f6128e212/src/lib/fascist.c#L721">https://github.com/cracklib/cra=
cklib/blob/c66d74fc38e1632726da8230714bf62f6128e212/src/lib/fascist.c#L72=
1</a><o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>FascistLookUser() also contain other implicit conditions =
your password must met. Please also be careful about =
them.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Of course, you can comment out the pam_cracklib.so to =
bypass all these checks.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><div><div =
style=3D'border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm'><p class=3DMsoNormal><b><span =
lang=3DEN-US>From:</span></b><span lang=3DEN-US> openbmc &lt;<a =
href=3D"mailto:openbmc-bounces+jiaqing.zhao=3Dintel.com@lists.ozlabs.org"=
>openbmc-bounces+jiaqing.zhao=3Dintel.com@lists.ozlabs.org</a>&gt; <b>On =
Behalf Of </b>Johnathan Mantey<br><b>Sent:</b> Friday, January 7, 2022 =
00:55<br><b>To:</b> Xiaochao Ma (</span><span =
style=3D'font-family:"=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91",sans-serif'>=E9=
=A9=AC=E5=B0=8F=E8=B6=85</span><span lang=3DEN-US>) &lt;<a =
href=3D"mailto:maxiaochao@inspur.com">maxiaochao@inspur.com</a>&gt;; <a =
href=3D"mailto:mine260309@gmail.com">mine260309@gmail.com</a><br><b>Cc:</=
b> <a =
href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>=
<b>Subject:</b> Re: </span><span =
style=3D'font-family:"=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91",sans-serif'>=E7=
=AD=94=E5=A4=8D</span><span lang=3DEN-US>: Update (or generate) =
/etc/ipmi_pass file<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal style=3D'margin-bottom:12.0pt'><span lang=3DEN-US>The =
OBMC PAM requires the password to be 8 characters in length, and =
probably requires a numeral as well.<br>I realize you want to get to a 5 =
character password.<br>I recommend you try adding a user with a password =
that works with the existing rules to see if your automated creation =
method works. After that you can try creating shorter =
passwords.<o:p></o:p></span></p><div><p class=3DMsoNormal><span =
lang=3DEN-US>On 1/5/22 23:02, Xiaochao Ma (</span><span =
style=3D'font-family:"=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91",sans-serif'>=E9=
=A9=AC=E5=B0=8F=E8=B6=85</span><span lang=3DEN-US>) =
wrote:<o:p></o:p></span></p></div><blockquote =
style=3D'margin-top:5.0pt;margin-bottom:5.0pt'><pre><span =
lang=3DEN-US>Sorry I didn't explain some of the methods I tried&nbsp; : =
(<o:p></o:p></span></pre><pre><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></pre><pre><span lang=3DEN-US>1. I =
tried the method you mentioned, but =
failed.<o:p></o:p></span></pre><pre><span lang=3DEN-US>The length of the =
password I want to set is 5 digits.<o:p></o:p></span></pre><pre><span =
lang=3DEN-US>I modified the complexity setting via =
/etc/pam.d/common-password, but still cannot set a 5-digit password. =
(The setting for reducing the length requirement failed to take =
effect)<o:p></o:p></span></pre><pre><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></pre><pre><span lang=3DEN-US>2. I =
also tried to temporarily remove pam_cracklib.so in =
/etc/pam.d/common-pasword so that it does not perform complexity =
detection. Failed very directly......<o:p></o:p></span></pre><pre><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></pre><pre><span =
lang=3DEN-US>-----</span><span =
style=3D'font-family:=E7=AD=89=E7=BA=BF'>=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=
=B6</span><span lang=3DEN-US>-----<o:p></o:p></span></pre><pre><span =
style=3D'font-family:=E7=AD=89=E7=BA=BF'>=E5=8F=91=E4=BB=B6=E4=BA=BA</spa=
n><span lang=3DEN-US>: Lei YU [<a =
href=3D"mailto:mine260309@gmail.com">mailto:mine260309@gmail.com</a>] =
<o:p></o:p></span></pre><pre><span =
style=3D'font-family:=E7=AD=89=E7=BA=BF'>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=
=B4</span><span lang=3DEN-US>: 2022</span><span =
style=3D'font-family:=E7=AD=89=E7=BA=BF'>=E5=B9=B4</span><span =
lang=3DEN-US>1</span><span =
style=3D'font-family:=E7=AD=89=E7=BA=BF'>=E6=9C=88</span><span =
lang=3DEN-US>6</span><span =
style=3D'font-family:=E7=AD=89=E7=BA=BF'>=E6=97=A5</span><span =
lang=3DEN-US> 14:41<o:p></o:p></span></pre><pre><span =
style=3D'font-family:=E7=AD=89=E7=BA=BF'>=E6=94=B6=E4=BB=B6=E4=BA=BA</spa=
n><span lang=3DEN-US>: Xiaochao Ma (</span><span =
style=3D'font-family:=E7=AD=89=E7=BA=BF'>=E9=A9=AC=E5=B0=8F=E8=B6=85</spa=
n><span lang=3DEN-US>) <a =
href=3D"mailto:maxiaochao@inspur.com">&lt;maxiaochao@inspur.com&gt;</a><o=
:p></o:p></span></pre><pre><span =
style=3D'font-family:=E7=AD=89=E7=BA=BF'>=E6=8A=84=E9=80=81</span><span =
lang=3DEN-US>: <a =
href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><o:p=
></o:p></span></pre><pre><span =
style=3D'font-family:=E7=AD=89=E7=BA=BF'>=E4=B8=BB=E9=A2=98</span><span =
lang=3DEN-US>: Re: Update (or generate) /etc/ipmi_pass =
file<o:p></o:p></span></pre><pre><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></pre><pre><span lang=3DEN-US>On =
Thu, Jan 6, 2022 at 11:39 AM Xiaochao Ma (</span><span =
style=3D'font-family:=E7=AD=89=E7=BA=BF'>=E9=A9=AC=E5=B0=8F=E8=B6=85</spa=
n><span lang=3DEN-US>) <a =
href=3D"mailto:maxiaochao@inspur.com">&lt;maxiaochao@inspur.com&gt;</a> =
wrote:<o:p></o:p></span></pre><blockquote =
style=3D'margin-top:5.0pt;margin-bottom:5.0pt'><pre><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></pre><pre><span lang=3DEN-US>Hello =
everyone<o:p></o:p></span></pre><pre><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></pre><pre><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></pre><pre><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></pre><pre><span lang=3DEN-US>I now =
want to add a default user to my own machine (I modified =
<o:p></o:p></span></pre><pre><span =
lang=3DEN-US>obmc-phosphor-image.bbappend, use the useradd=E2=80=A6 =
),<o:p></o:p></span></pre><pre><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></pre><pre><span lang=3DEN-US>but =
the new default user cannot use Ipmi. It is because the ipmi_pass file =
is not updated.<o:p></o:p></span></pre><pre><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></pre><pre><span =
lang=3DEN-US>&nbsp; I couldn't find a method/tool to generate ipmi_pass =
file. So how can I generate a new ipmi_pass =
file?<o:p></o:p></span></pre><pre><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></pre></blockquote><pre><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></pre><pre><span lang=3DEN-US>What =
I do is to use qemu or a real BMC, adjust the ipmi username/passwords, =
and then copy the ipmi_pass out.<o:p></o:p></span></pre></blockquote><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><div><p =
class=3DMsoNormal style=3D'margin-bottom:12.0pt'><span lang=3DEN-US>-- =
<br></span><span lang=3DEN-US style=3D'font-family:"Century =
Gothic",sans-serif;color:#1F497D'>Johnathan Mantey<br></span><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"Century =
Gothic",sans-serif;color:#1F497D'>Senior Software Engineer</span><span =
lang=3DEN-US style=3D'font-family:"Century =
Gothic",sans-serif;color:#1F497D'><br></span><b><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic",sans-serif;color:#555555'>azad technology =
partners</span></b><span lang=3DEN-US =
style=3D'font-size:12.0pt;font-family:"Century =
Gothic",sans-serif;color:#555555'><br></span><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"Century =
Gothic",sans-serif;color:#1F497D'>Contributing to Technology Innovation =
since 1992</span><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"Century =
Gothic",sans-serif;color:#555555'><br></span><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"Century =
Gothic",sans-serif;color:#1F497D'>Phone: (503) 712-6764<br>Email: <a =
href=3D"mailto:johnathanx.mantey@intel.com">johnathanx.mantey@intel.com</=
a></span><span =
lang=3DEN-US><o:p></o:p></span></p></div></div></body></html>
------=_NextPart_001_0081_01D803B6.D4C76C40--

------=_NextPart_000_0080_01D803B6.D4C76C40
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
KoZIhvcNAwQCAgCAMAcGBSsOAwIHMAoGCCqGSIb3DQMHMB0GA1UdDgQWBBSQmhIT5stHwDWAnskw
M0mlgnF98zAfBgNVHSMEGDAWgBReWQOmtExYYJFO9h61pTmmMsE1ajCB0QYDVR0fBIHJMIHGMIHD
oIHAoIG9hoG6bGRhcDovLy9DTj1JTlNQVVItQ0EsQ049SlRDQTIwMTIsQ049Q0RQLENOPVB1Ymxp
YyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9aG9tZSxE
Qz1sYW5nY2hhbyxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENs
YXNzPWNSTERpc3RyaWJ1dGlvblBvaW50MIHEBggrBgEFBQcBAQSBtzCBtDCBsQYIKwYBBQUHMAKG
gaRsZGFwOi8vL0NOPUlOU1BVUi1DQSxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMs
Q049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1ob21lLERDPWxhbmdjaGFvLERDPWNvbT9j
QUNlcnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTBHBgNV
HREEQDA+oCUGCisGAQQBgjcUAgOgFwwVbWF4aWFvY2hhb0BpbnNwdXIuY29tgRVtYXhpYW9jaGFv
QGluc3B1ci5jb20wDQYJKoZIhvcNAQELBQADggEBAGsWSCGucuJ7y3TgHBxlOjx4SQI21uq4CL6G
qb2ZIkFEyh5txT3tPEtqyq9R1ZQpMzoLviuMOhiBoeiQ9y1qee/K/ymINc5Nybv7X7lo2/tu7RVT
MWrkWgwx+i4uzTcA0S0hJOPZI9ZRCguzdHdRRR/yf4sgzPfApi/gbQIMB+1LqaNDpE9XrGW+JEIo
gxY5CGbOJcCgNYFrWm1RZQ0J55hJCi6gcPot2gTHP4XdTmn7OQEv5IVPGoiiqKD7ypIJHoC3wT3W
16jEnpKztq3AkCrtjTQLky9wGYCIKDKnMVXiGIdWsXYxPXk1/qqTqkSODudN2NfYhIPnwmNwlD1i
cdkxggOTMIIDjwIBATBwMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghs
YW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1DQQITfgAAWncu
phIKGbI09AAAAABadzAJBgUrDgMCGgUAoIIB+DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yMjAxMDcwMzA3NTlaMCMGCSqGSIb3DQEJBDEWBBShlpSMGUO16M/Wk5/m
DefcBPTHBjB/BgkrBgEEAYI3EAQxcjBwMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJ
k/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1D
QQITfgAAWncuphIKGbI09AAAAABadzCBgQYLKoZIhvcNAQkQAgsxcqBwMFkxEzARBgoJkiaJk/Is
ZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUx
EjAQBgNVBAMTCUlOU1BVUi1DQQITfgAAWncuphIKGbI09AAAAABadzCBkwYJKoZIhvcNAQkPMYGF
MIGCMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4G
CCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMwCwYJYIZI
AWUDBAICMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBoh6mwXuzmtuILXQkIpLt/ixk5
RkR9GqbYzUyIhaEoEewimmbIWM5kBD3om8PKMC6Q9i1fQHOcCGdx+/JT8A38QGOl0a7apdGfE7ic
pZiHT8iV6Mso1DwIfYxSinj2ZfYQHq9kCm6UPEElPguHjKBNrJRyHfz8DouYvalDf6X9aPs4goKg
7DoapBw5oVtkZoVdYjsIIrQnbA13njjuMbN3lqcO6oGP8uREZDgqqY/3ED17fqhfG4AJK+IYp62c
x5k85UHmww//5d4U+lGHspn6el+geQCP2xPCP/zGl2gE7Mi2BYF4AstZWlrpmG99W/PhqgDU2W1J
yfAzIRb6uLsFAAAAAAAA

------=_NextPart_000_0080_01D803B6.D4C76C40--
