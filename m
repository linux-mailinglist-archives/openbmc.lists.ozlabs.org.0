Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D25CD494FE2
	for <lists+openbmc@lfdr.de>; Thu, 20 Jan 2022 15:13:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfkyX51cGz3bW9
	for <lists+openbmc@lfdr.de>; Fri, 21 Jan 2022 01:13:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfkyC0K7Lz30LY
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jan 2022 01:13:25 +1100 (AEDT)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id PHI00008;
 Thu, 20 Jan 2022 22:13:08 +0800
Received: from jtjnmail201604.home.langchao.com (10.100.2.4) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 22:13:07 +0800
Received: from jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322])
 by jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322%5])
 with mapi id 15.01.2308.020; Thu, 20 Jan 2022 22:13:07 +0800
From: =?utf-8?B?WGlhb2NoYW8gTWEgKOmprOWwj+i2hSk=?= <maxiaochao@inspur.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, "Zhao, Jiaqing"
 <jiaqing.zhao@intel.com>, "Mantey, JohnathanX" <johnathanx.mantey@intel.com>, 
 "mine260309@gmail.com" <mine260309@gmail.com>
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IFVwZGF0ZSAob3IgZ2VuZXJhdGUpIC9ldGMvaXBt?=
 =?utf-8?Q?i=5Fpass_file?=
Thread-Topic: =?utf-8?B?562U5aSNOiBVcGRhdGUgKG9yIGdlbmVyYXRlKSAvZXRjL2lwbWlfcGFzcyBm?=
 =?utf-8?Q?ile?=
Thread-Index: AdgCrg4my0csNWtVRYG20ese5zhM7v//rp8A//903oCAATapgIAABAiAgBNw1YCAARXw3A==
Date: Thu, 20 Jan 2022 14:13:06 +0000
Message-ID: <42e2189b1bcb4d0b95ec7db076f9d622@inspur.com>
References: <eca69d17d017d16cf92e7c84f1c422ad@sslemail.net>,
 <46eb0109-568f-163f-5212-7d7102bc6369@linux.ibm.com>
In-Reply-To: <46eb0109-568f-163f-5212-7d7102bc6369@linux.ibm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.192.64]
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=SHA1; boundary="----=_NextPart_000_0053_01D80E4A.E5D06C00"
MIME-Version: 1.0
tUid: 2022120221308c343ed9ef5faf74c7165149ff91fd4a6
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

------=_NextPart_000_0053_01D80E4A.E5D06C00
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0054_01D80E4A.E5D06C00"


------=_NextPart_001_0054_01D80E4A.E5D06C00
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thank you for your reply.

I have tried this method and got the result I want, thank you very much!

=20

Maxiaochao

  _____ =20

=E5=8F=91=E4=BB=B6=E4=BA=BA: Joseph Reynolds <jrey@linux.ibm.com>
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2022=E5=B9=B41=E6=9C=8819=E6=97=A5 =
10:02
=E6=94=B6=E4=BB=B6=E4=BA=BA: Zhao, Jiaqing; Mantey, JohnathanX; Xiaochao =
Ma (=E9=A9=AC=E5=B0=8F=E8=B6=85); mine260309@gmail.com
=E6=8A=84=E9=80=81: openbmc@lists.ozlabs.org
=E4=B8=BB=E9=A2=98: Re: =E7=AD=94=E5=A4=8D: Update (or generate) =
/etc/ipmi_pass file

=20

On 1/6/22 11:09 AM, Zhao, Jiaqing wrote:
> Even you set minlen=3D0 in /etc/pam.d/common-password, the password=20
> length will still be checked by pam-cracklib. Pam-cracklib will call=20
> FascistCheck() function of cracklib, and inside cracklib, it will call =

> FascistLookUser(), which also checkes ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> ZjQcmQRYFpfptBannerEnd
>
> Even you set minlen=3D0 in /etc/pam.d/common-password, the password=20
> length will still be checked by pam-cracklib. Pam-cracklib will call=20
> FascistCheck() function of cracklib, and inside cracklib, it will call =

> FascistLookUser(), which also checkes the password length and there is =

> no way to bypass it unless you modify cracklib code. The minimum=20
> length forced by cracklib is 6.
>
> =
https://github.com/cracklib/cracklib/blob/c66d74fc38e1632726da8230714bf62=
f6128e212/src/lib/fascist.c#L721
>
> FascistLookUser() also contain other implicit conditions your password =

> must met. Please also be careful about them.
>
> Of course, you can comment out the pam_cracklib.so to bypass all these =

> checks.
>

If your /etc/pam.d/common-password file look like this=20
(meta-phosphor/recipes-extended/pam/libpam/pam.d/common-password):=20
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-exte=
nded/pam/libpam/pam.d/common-password
then you should be able to comment out the pam_cracklib.so and=20
pam_ipmicheck.so and pam_pwhistory.so lines
but then you have to remove the "use_authtok" parameter from the=20
pam_unix.so line (or whichever is your first module).

Be sure to:
- keep the pam_unix.so line (it writes the password into /etc/shadow =
file).
- keep the pam_ipmisave.so line (it writes the password to the=20
etc/ipmi_pass file)
- keep the deny and permit lines as they are.

Good luck,
- Joseph

> *From:* openbmc=20
> <openbmc-bounces+jiaqing.zhao=3Dintel.com@lists.ozlabs.org> *On Behalf =

> Of *Johnathan Mantey
> *Sent:* Friday, January 7, 2022 00:55
> *To:* Xiaochao Ma (=E9=A9=AC=E5=B0=8F=E8=B6=85) =
<maxiaochao@inspur.com>; mine260309@gmail.com
> *Cc:* openbmc@lists.ozlabs.org
> *Subject:* Re: =E7=AD=94=E5=A4=8D: Update (or generate) /etc/ipmi_pass =
file
>
> The OBMC PAM requires the password to be 8 characters in length, and=20
> probably requires a numeral as well.
> I realize you want to get to a 5 character password.
> I recommend you try adding a user with a password that works with the=20
> existing rules to see if your automated creation method works. After=20
> that you can try creating shorter passwords.
>
> On 1/5/22 23:02, Xiaochao Ma (=E9=A9=AC=E5=B0=8F=E8=B6=85) wrote:
>
>     Sorry I didn't explain some of the methods I tried  : (
>
>     1. I tried the method you mentioned, but failed.
>
>     The length of the password I want to set is 5 digits.
>
>     I modified the complexity setting via /etc/pam.d/common-password, =
but still cannot set a 5-digit password. (The setting for reducing the =
length requirement failed to take effect)
>
>     2. I also tried to temporarily remove pam_cracklib.so in =
/etc/pam.d/common-pasword so that it does not perform complexity =
detection. Failed very directly......
>
>     -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
>
>     =E5=8F=91=E4=BB=B6=E4=BA=BA: Lei YU [mailto:mine260309@gmail.com  =
<mailto:mine260309@gmail.com>]
>
>     =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: =
2022=E5=B9=B41=E6=9C=886=E6=97=A5  14:41
>
>     =E6=94=B6=E4=BB=B6=E4=BA=BA: Xiaochao Ma =
(=E9=A9=AC=E5=B0=8F=E8=B6=85)<maxiaochao@inspur.com>  =
<mailto:maxiaochao@inspur.com>
>
>     =E6=8A=84=E9=80=81:openbmc@lists.ozlabs.org
>
>     =E4=B8=BB=E9=A2=98: Re: Update (or generate) /etc/ipmi_pass file
>
>     On Thu, Jan 6, 2022 at 11:39 AM Xiaochao Ma =
(=E9=A9=AC=E5=B0=8F=E8=B6=85)<maxiaochao@inspur.com>  =
<mailto:maxiaochao@inspur.com>  wrote:
>
>         Hello everyone
>
>         I now want to add a default user to my own machine (I modified
>
>         obmc-phosphor-image.bbappend, use the useradd=E2=80=A6 ),
>
>         but the new default user cannot use Ipmi. It is because the =
ipmi_pass file is not updated.
>
>            I couldn't find a method/tool to generate ipmi_pass file. =
So how can I generate a new ipmi_pass file?
>
>     What I do is to use qemu or a real BMC, adjust the ipmi =
username/passwords, and then copy the ipmi_pass out.
>
> --=20
> Johnathan Mantey
> Senior Software Engineer
> *azad technology partners*
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com
>


------=_NextPart_001_0054_01D80E4A.E5D06C00
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><!--[if =
!mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
	{font-family:"\@=E5=AE=8B=E4=BD=93";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:=E5=AE=8B=E4=BD=93;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:1.0pt;
	border:none;
	padding:0cm;
	font-size:12.0pt;
	font-family:=E5=AE=8B=E4=BD=93;}
span.EmailStyle18
	{mso-style-type:personal-compose;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DZH-CN link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
lang=3DEN-US>thank you for your reply.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>I have tried this method and got =
the result I want, thank you very much!<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>Maxiaochao<o:p></o:p></span></p><div class=3DMsoNormal =
align=3Dcenter style=3D'text-align:center'><span lang=3DEN-US><hr =
size=3D2 width=3D"98%" align=3Dcenter></span></div><div =
id=3D"x_divRplyFwdMsg"><p class=3DMsoNormal><b><span =
style=3D'font-size:11.0pt;color:black'>=E5=8F=91=E4=BB=B6=E4=BA=BA</span>=
</b><b><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'>:=
</span></b><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'> =
Joseph Reynolds &lt;jrey@linux.ibm.com&gt;<br></span><b><span =
style=3D'font-size:11.0pt;color:black'>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4=
</span></b><b><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'>:=
</span></b><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'> =
2022</span><span =
style=3D'font-size:11.0pt;color:black'>=E5=B9=B4</span><span =
lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'>1=
</span><span =
style=3D'font-size:11.0pt;color:black'>=E6=9C=88</span><span =
lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'>1=
9</span><span =
style=3D'font-size:11.0pt;color:black'>=E6=97=A5</span><span =
lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'> =
10:02<br></span><b><span =
style=3D'font-size:11.0pt;color:black'>=E6=94=B6=E4=BB=B6=E4=BA=BA</span>=
</b><b><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'>:=
</span></b><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'> =
Zhao, Jiaqing; Mantey, JohnathanX; Xiaochao Ma (</span><span =
style=3D'font-size:11.0pt;color:black'>=E9=A9=AC=E5=B0=8F=E8=B6=85</span>=
<span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'>)=
; mine260309@gmail.com<br></span><b><span =
style=3D'font-size:11.0pt;color:black'>=E6=8A=84=E9=80=81</span></b><b><s=
pan lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'>:=
</span></b><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'> =
openbmc@lists.ozlabs.org<br></span><b><span =
style=3D'font-size:11.0pt;color:black'>=E4=B8=BB=E9=A2=98</span></b><b><s=
pan lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'>:=
</span></b><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'> =
Re: </span><span =
style=3D'font-size:11.0pt;color:black'>=E7=AD=94=E5=A4=8D</span><span =
lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:black'>:=
 Update (or generate) /etc/ipmi_pass file</span><span =
lang=3DEN-US><o:p></o:p></span></p><div><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;<o:p></o:p></span></p></div></div><div><p =
class=3DMsoNormal style=3D'margin-bottom:12.0pt'><span lang=3DEN-US =
style=3D'font-size:10.0pt'>On 1/6/22 11:09 AM, Zhao, Jiaqing =
wrote:<br>&gt; Even you set minlen=3D0 in /etc/pam.d/common-password, =
the password <br>&gt; length will still be checked by pam-cracklib. =
Pam-cracklib will call <br>&gt; FascistCheck() function of cracklib, and =
inside cracklib, it will call <br>&gt; FascistLookUser(), which also =
checkes ZjQcmQRYFpfptBannerStart<br>&gt; This Message Is From an =
External Sender<br>&gt; This message came from outside your =
organization.<br>&gt; ZjQcmQRYFpfptBannerEnd<br>&gt;<br>&gt; Even you =
set minlen=3D0 in /etc/pam.d/common-password, the password <br>&gt; =
length will still be checked by pam-cracklib. Pam-cracklib will call =
<br>&gt; FascistCheck() function of cracklib, and inside cracklib, it =
will call <br>&gt; FascistLookUser(), which also checkes the password =
length and there is <br>&gt; no way to bypass it unless you modify =
cracklib code. The minimum <br>&gt; length forced by cracklib is =
6.<br>&gt;<br>&gt; <a =
href=3D"https://github.com/cracklib/cracklib/blob/c66d74fc38e1632726da823=
0714bf62f6128e212/src/lib/fascist.c#L721">https://github.com/cracklib/cra=
cklib/blob/c66d74fc38e1632726da8230714bf62f6128e212/src/lib/fascist.c#L72=
1</a><br>&gt;<br>&gt; FascistLookUser() also contain other implicit =
conditions your password <br>&gt; must met. Please also be careful about =
them.<br>&gt;<br>&gt; Of course, you can comment out the pam_cracklib.so =
to bypass all these <br>&gt; checks.<br>&gt;<br><br>If your =
/etc/pam.d/common-password file look like this =
<br>(meta-phosphor/recipes-extended/pam/libpam/pam.d/common-password): =
<br><a =
href=3D"https://github.com/openbmc/openbmc/blob/master/meta-phosphor/reci=
pes-extended/pam/libpam/pam.d/common-password">https://github.com/openbmc=
/openbmc/blob/master/meta-phosphor/recipes-extended/pam/libpam/pam.d/comm=
on-password</a><br>then you should be able to comment out the =
pam_cracklib.so and <br>pam_ipmicheck.so and pam_pwhistory.so =
lines<br>but then you have to remove the &quot;use_authtok&quot; =
parameter from the <br>pam_unix.so line (or whichever is your first =
module).<br><br>Be sure to:<br>- keep the pam_unix.so line (it writes =
the password into /etc/shadow file).<br>- keep the pam_ipmisave.so line =
(it writes the password to the <br>etc/ipmi_pass file)<br>- keep the =
deny and permit lines as they are.<br><br>Good luck,<br>- =
Joseph<br><br>&gt; *From:* openbmc <br>&gt; =
&lt;openbmc-bounces+jiaqing.zhao=3Dintel.com@lists.ozlabs.org&gt; *On =
Behalf <br>&gt; Of *Johnathan Mantey<br>&gt; *Sent:* Friday, January 7, =
2022 00:55<br>&gt; *To:* Xiaochao Ma (</span><span =
style=3D'font-size:10.0pt'>=E9=A9=AC=E5=B0=8F=E8=B6=85<span =
lang=3DEN-US>) &lt;maxiaochao@inspur.com&gt;; =
mine260309@gmail.com<br>&gt; *Cc:* openbmc@lists.ozlabs.org<br>&gt; =
*Subject:* Re: </span>=E7=AD=94=E5=A4=8D<span lang=3DEN-US>: Update (or =
generate) /etc/ipmi_pass file<br>&gt;<br>&gt; The OBMC PAM requires the =
password to be 8 characters in length, and <br>&gt; probably requires a =
numeral as well.<br>&gt; I realize you want to get to a 5 character =
password.<br>&gt; I recommend you try adding a user with a password that =
works with the <br>&gt; existing rules to see if your automated creation =
method works. After <br>&gt; that you can try creating shorter =
passwords.<br>&gt;<br>&gt; On 1/5/22 23:02, Xiaochao Ma =
(</span>=E9=A9=AC=E5=B0=8F=E8=B6=85<span lang=3DEN-US>) =
wrote:<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; Sorry I didn't explain =
some of the methods I tried&nbsp; : =
(<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; 1. I tried the method you =
mentioned, but failed.<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; The =
length of the password I want to set is 5 =
digits.<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; I modified the =
complexity setting via /etc/pam.d/common-password, but still cannot set =
a 5-digit password. (The setting for reducing the length requirement =
failed to take effect)<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; 2. I also =
tried to temporarily remove pam_cracklib.so in /etc/pam.d/common-pasword =
so that it does not perform complexity detection. Failed very =
directly......<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; =
-----</span>=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6<span =
lang=3DEN-US>-----<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>=E5=8F=91=E4=BB=B6=E4=BA=BA<span lang=3DEN-US>: Lei YU =
[mailto:mine260309@gmail.com&nbsp; &lt;<a =
href=3D"mailto:mine260309@gmail.com">mailto:mine260309@gmail.com</a>&gt;]=
<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4<span lang=3DEN-US>: =
2022</span>=E5=B9=B4<span lang=3DEN-US>1</span>=E6=9C=88<span =
lang=3DEN-US>6</span>=E6=97=A5<span lang=3DEN-US>&nbsp; =
14:41<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>=E6=94=B6=E4=BB=B6=E4=BA=BA<span lang=3DEN-US>: Xiaochao Ma =
(</span>=E9=A9=AC=E5=B0=8F=E8=B6=85<span =
lang=3DEN-US>)&lt;maxiaochao@inspur.com&gt;&nbsp; &lt;<a =
href=3D"mailto:maxiaochao@inspur.com">mailto:maxiaochao@inspur.com</a>&gt=
;<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; </span>=E6=8A=84=E9=80=81<span =
lang=3DEN-US>:openbmc@lists.ozlabs.org<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&=
nbsp; </span>=E4=B8=BB=E9=A2=98<span lang=3DEN-US>: Re: Update (or =
generate) /etc/ipmi_pass file<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; On =
Thu, Jan 6, 2022 at 11:39 AM Xiaochao Ma =
(</span>=E9=A9=AC=E5=B0=8F=E8=B6=85<span =
lang=3DEN-US>)&lt;maxiaochao@inspur.com&gt;&nbsp; &lt;<a =
href=3D"mailto:maxiaochao@inspur.com">mailto:maxiaochao@inspur.com</a>&gt=
;&nbsp; =
wrote:<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Hello =
everyone<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
I now want to add a default user to my own machine (I =
modified<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
obmc-phosphor-image.bbappend, use the useradd=E2=80=A6 =
),<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; but =
the new default user cannot use Ipmi. It is because the ipmi_pass file =
is not =
updated.<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp; I couldn't find a method/tool to generate ipmi_pass file. =
So how can I generate a new ipmi_pass =
file?<br>&gt;<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp; What I do is to use qemu =
or a real BMC, adjust the ipmi username/passwords, and then copy the =
ipmi_pass out.<br>&gt;<br>&gt; -- <br>&gt; Johnathan Mantey<br>&gt; =
Senior Software Engineer<br>&gt; *azad technology partners*<br>&gt; =
Contributing to Technology Innovation since 1992<br>&gt; Phone: (503) =
712-6764<br>&gt; Email: =
johnathanx.mantey@intel.com<br>&gt;<o:p></o:p></span></span></p></div></d=
iv></body></html>
------=_NextPart_001_0054_01D80E4A.E5D06C00--

------=_NextPart_000_0053_01D80E4A.E5D06C00
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
CSqGSIb3DQEJBTEPFw0yMjAxMjAxNDEzMDVaMCMGCSqGSIb3DQEJBDEWBBTeZ1GFt5Lpki0m9HRW
Qnsk2cWTpzB/BgkrBgEEAYI3EAQxcjBwMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJ
k/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1D
QQITfgAAWncuphIKGbI09AAAAABadzCBgQYLKoZIhvcNAQkQAgsxcqBwMFkxEzARBgoJkiaJk/Is
ZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUx
EjAQBgNVBAMTCUlOU1BVUi1DQQITfgAAWncuphIKGbI09AAAAABadzCBkwYJKoZIhvcNAQkPMYGF
MIGCMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4G
CCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMwCwYJYIZI
AWUDBAICMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBp/T4aXs2S32fublur8MOnHo8U
LziHQ4ocORuKQXSV1shTHYhl4LazGcsZRhLJvCGZYKi1rJf6O1ax1rZkb3eNv53sJ7DXLqP7Ee73
WonJ9L+WNzECCEfBouqqfsYMRrmvFPW84oJZiH9o5lY+ZmxGUWcT2s/+xcTsSfP/w8FLbngHltrQ
Gs1C29VJUGiUH9CsZGlBcd9nHHLTN5RlOwiZnxW43gB/e61usRxPvQ5xX0b0tTmb28KTBnGIO/dk
edoDAcqcpoIQXB/DA3jMayun/nV0v+DJhLdOgnbgBuc6H0FDl5nudOvobFD5pWNc+glTPrdwO2mP
IzMxyoMv/3DsAAAAAAAA

------=_NextPart_000_0053_01D80E4A.E5D06C00--
