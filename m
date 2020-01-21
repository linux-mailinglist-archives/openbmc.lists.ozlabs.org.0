Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45A1460D5
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 04:01:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4836V64xJNzDqW4
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 14:01:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=98.137.68.83;
 helo=sonic306-20.consmr.mail.gq1.yahoo.com;
 envelope-from=geissonator@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=OEMqhw51; dkim-atps=neutral
Received: from sonic306-20.consmr.mail.gq1.yahoo.com
 (sonic306-20.consmr.mail.gq1.yahoo.com [98.137.68.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482C1l4NrHzDqSv
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 02:21:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1579620099; bh=paZHIlT259YoZ2WI4QyKab4FxrkhMNWF9HOnGvyd7DM=;
 h=From:Subject:Date:In-Reply-To:Cc:To:References:From:Subject;
 b=OEMqhw51dhdpTssK25QL1ZJI6G9D+y5YFX85HWdDM4ryvyZYFsVqZPHxxH36IXIGnXl2OC4Dz2eA5GVNMBrDgw7fZd8AjSYUwD12Npb4FoCHNBtDqgEt4SDdjKQKW2GlRYtEt6oHmDz/pFBTMW15KytMLFnExgmeTPMIP0rsdwyR9D5VdnaQ0u9yB9LaY4O+2JkF0K9lU0a1ErWxM4f//Qu86TLYQLDUTG3tt9qbpwmZ5Fp+2SKvR2tpaGy+U+mf5DKblwsMrnukTBQj582dNtsNEH1hCeKusVbcAmw5aGGakYWNLff26vmoc2e3AL1cj2+6VerOnNfR9ClLxinQDw==
X-YMail-OSG: VCNJAV0VM1kmYap4.IDd9TGSu9DD0GvyskxfRUsaau1Kd.zbRMP95DVJEHyCB3e
 8c8wt8tG7FR1w4wNTFIbT6MRwIGbO2afg1SS0r1288Jz1zbpDJBvDbuLy.j_a7ygUreiwNSyEFqN
 IfHP7cQMK_5e8fJHfSLvEHlPKG1mVP1kROZ5WJGMYXikDG3wiT_e18xu4pZJtm55FFMgPLCASKNe
 34OMwaepG1Xkl6VyLGaMDN5be0Kv65LKBKUcyZL5TPmYqKybwOtUt4VGSf52JpokR9hyUgl_1.nH
 g3A01D3G3eqCyddZDizrBivDsGIsa5oLPkTNAZobLAwFmOC_.9.FVC1skxEbbvIDnUrlgZqBlmJf
 Hl9A9cYp6w11AvLn11nwl18e5EdYYD04ZZ5PrbdgSM1ZrP6_43jiKZg6bEv9oDSB7csSIu2FfeWw
 jrRch_UYiLyVKaFG0zdA4zovbt4k3IKPNsfL.whc43dImi6PaCB074hStmc8eAqUVYmvP0V4M0RI
 5v1HyOm0uIxAjzS08DsV8kKe_Ik1NKENioe4OTVEh8Ro7DruGiKgg0Cplt0q7Xit5DXCUcx8hX0t
 0VJwBsjk9CapW4SZUtBgO7y36DLoWZhNsX6z5m5c_QLeNwgi1oGonHuKk57_eCJPGOsoUrLu6bpH
 bfRtqLnhULUvlqmt_2cvGRgagbHmtv3fviadm9idGmxWJU47yH6mQwiE0kwoRu1.kv4jibXE83_g
 BXWTEAzkbJYmwU8F2Zie31FyJskvAhFEPDESRtGliq4b9A4C7j3Yf4x6hFRDCmjaz2EkSYQmegog
 ydnRMIAah8dR_dk6mdfbQWYp9ZfwRrVKHL7LZuKXpLNQN2L3lPI2_LZmzyY_H6XRKaXp.dpx3SdP
 nVEAp47fEwFbpLK9SB5y8_GtZwG59mmOi1CXnRpNdjn5CqqSM7SuT3AvgqJCcG0GHImKXuJ10Pyn
 35lbFiXv5BVGumgGoJhYhYQN1i5QTQqD3Mzc3XYHutL8J19f2JamMnA_UZlCOCwSjMyFrUB8IwoQ
 VXpPUegc1nFm6NC6hKcwr9t8ub9li2NvZ8J4WrhzaXeWlal51cfo6weIv1vbLFw34KM9ZAnn3fYZ
 K_KpB_KAyvC3vKwYf2Fms_C1jLe8dU2o2BeIKDhkKpxr.lW4uIIbgaMjzmpszYmlrqBvNt4WCTTA
 6Mv7zcMBFONMokBAcgBzDVhVktH6oy3fVokq0V2Gt_m2u9U8tN0YuvPKWQ3.N9AyHV5VvzUGo0Ir
 LJjNtRf155kIwb5UgvDEzBmQLvXspplfp5frXzyhbs39IgaVXcD3LJ7O5Z4tjUXYZimi.byGfiRK
 hAt2_fmsfyzNXGbPOxUeXF6bt73Cgp3xaVKqPpz8AjDWWjNd.lhqO_viu.n4mK0etosuaS6rC7IF
 BmLO6PY_Ih.3fg1yDK.GjthwPfWLCIKV_BQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Tue, 21 Jan 2020 15:21:39 +0000
Received: by smtp431.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 1f7f87fb1a1779901c51f237063b3f11; 
 Tue, 21 Jan 2020 15:21:36 +0000 (UTC)
From: Andrew Geissler <geissonator@yahoo.com>
Message-Id: <AD952EE4-D86D-4D83-AB15-9F975D0157C1@yahoo.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_531E43A5-F6D3-4B1C-8D30-8604A4964841"
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: OpenBMC Starting Point
Date: Tue, 21 Jan 2020 09:21:35 -0600
In-Reply-To: <CA+k9xxZfreCU8L=G=vUJBODdyjPU_p8+d7_LycNi_ShAZzwMjQ@mail.gmail.com>
To: Samuel Herts <sdherts@gmail.com>
References: <CA+k9xxY2wfrzE=kQOM24wc5pgs+poqNEKyHooQNfxNfZrSsGFA@mail.gmail.com>
 <5937.1579503424@localhost>
 <CA+k9xxZfreCU8L=G=vUJBODdyjPU_p8+d7_LycNi_ShAZzwMjQ@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-Mailman-Approved-At: Thu, 23 Jan 2020 13:59:18 +1100
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
Cc: openbmc@lists.ozlabs.org, Michael Richardson <mcr@sandelman.ca>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_531E43A5-F6D3-4B1C-8D30-8604A4964841
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jan 20, 2020, at 11:03 AM, Samuel Herts <sdherts@gmail.com> wrote:
>=20
> Thank you!
> I have a supermicro X9 with ast2400 BMC chip. How would we go about =
installing it? openBMC onto it? We currently have a fresh install of =
Ubuntu LTS on it, and nothing else.

The only AST2400 config I=E2=80=99m familiar with is our Palmetto.
You could start with that machine and tweak it for yours.
=
https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-palmetto/conf=
/machine/palmetto.conf =
<https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-palmetto/con=
f/machine/palmetto.conf>
>=20
> In terms of the development virtual machine. I keep running into an =
issue when trying to wget the sdk.=20
> Specifically, this line: wget =
https://openpower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,target=3Dromul=
us/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-arm1176jzs-toolch=
ain-nodistro.0.sh =
<https://openpower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,target=3Dromu=
lus/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-arm1176jzs-toolc=
hain-nodistro.0.sh> After running that inside the romulus emulator, it =
runs out of space and won't complete the download. Does this mean I need =
to either increase the storage for the romulus, or am I simply =
installing it in the wrong place, and instead need to wget that into the =
regular VM?

The SDK is not meant to be downloaded to the actual OpenBMC
system. I=E2=80=99t meant to be downloaded to your development system.
You can then use it to build OpenBMC software that you then copy
over to your OpenBMC and run.

> Apologies for all the questions, I am doing as much research as I can, =
and this mailing list seems to be the largest wealth of knowledge I have =
available.
>=20
> --Sam
>=20
> On Mon, Jan 20, 2020 at 1:57 AM Michael Richardson <mcr@sandelman.ca =
<mailto:mcr@sandelman.ca>> wrote:
>=20
> Samuel Herts <sdherts@gmail.com <mailto:sdherts@gmail.com>> wrote:
>     > I am currently working on getting a working OpenBMC test =
environment
>     > up and running. I am using VirtualBox and the github Development
>     > Environment tutorial. I had a couple questions regarding how to =
make
>     > our own modules. Would it be possible to upload files to the bmc =
on
>     > the virtual server?
>=20
> You can do that.
> The disk is rather small by default.
> If you are using VirtualBox, you may be able to use the vboxfs file =
system to
> mount the host. That might require adding modules to the kernel.
>=20
>     > And would I be able to make a script which can read text off of =
that
>     > file inside the bmc chip?
>=20
>     > I have a physical server which I am not using yet, would I be =
able to
>     > install openbmc and the scripts and insert the file onto the =
actual
>     > bmc chip, and eventually read from that file?
>=20
> Maybe. What server do you have?
>=20
> --
> ]               Never tell me the odds!                 | ipv6 mesh =
networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT =
architect   [
> ]     mcr@sandelman.ca <mailto:mcr@sandelman.ca>  =
http://www.sandelman.ca/ <http://www.sandelman.ca/>        |   ruby on =
rails    [
>=20
>=20
>=20
> --=20
> Sincerely,=20
> Samuel Herts


--Apple-Mail=_531E43A5-F6D3-4B1C-8D30-8604A4964841
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jan 20, 2020, at 11:03 AM, Samuel Herts &lt;<a =
href=3D"mailto:sdherts@gmail.com" class=3D"">sdherts@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
dir=3D"ltr" class=3D"">Thank you!<div class=3D"">I have a supermicro X9 =
with ast2400 BMC chip. How would we go about installing it? openBMC onto =
it? We currently have a fresh install of Ubuntu LTS on it, and nothing =
else.</div></div></div></blockquote><div><br class=3D""></div><div>The =
only AST2400 config I=E2=80=99m familiar with is our =
Palmetto.</div><div>You could start with that machine and tweak it for =
yours.</div><div><a =
href=3D"https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-palme=
tto/conf/machine/palmetto.conf" =
class=3D"">https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-pa=
lmetto/conf/machine/palmetto.conf</a></div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D""><br class=3D""></div><div class=3D"">In terms of the =
development virtual machine. I keep running into an issue when trying to =
wget the sdk.&nbsp;</div><div class=3D"">Specifically, this =
line:&nbsp;<span =
style=3D"background-color:initial;font-family:SFMono-Regular,Consolas,&quo=
t;Liberation =
Mono&quot;,Menlo,monospace;color:rgb(36,41,46);font-size:13.6px" =
class=3D"">wget <a =
href=3D"https://openpower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,target=
=3Dromulus/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-arm1176jz=
s-toolchain-nodistro.0.sh" =
class=3D"">https://openpower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,tar=
get=3Dromulus/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-arm117=
6jzs-toolchain-nodistro.0.sh</a></span></div>&nbsp;After running that =
inside the romulus emulator, it runs out of space and won't complete the =
download. Does this mean I need to either increase the storage for the =
romulus, or am I simply installing it in the wrong place, and instead =
need to wget that into the regular VM?</div></div></blockquote><div><br =
class=3D""></div><div>The SDK is not meant to be downloaded to the =
actual OpenBMC</div><div>system. I=E2=80=99t meant to be downloaded to =
your development system.</div><div>You can then use it to build OpenBMC =
software that you then copy</div><div>over to your OpenBMC and =
run.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D"">Apologies for all =
the questions, I am doing as much research as I can, and this mailing =
list seems to be the largest wealth of knowledge I have =
available.</div><div class=3D""><br class=3D""></div><div =
class=3D"">--Sam</div></div><br class=3D""><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 20, 2020 at 1:57 AM =
Michael Richardson &lt;<a href=3D"mailto:mcr@sandelman.ca" =
class=3D"">mcr@sandelman.ca</a>&gt; wrote:<br class=3D""></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br class=3D"">
Samuel Herts &lt;<a href=3D"mailto:sdherts@gmail.com" target=3D"_blank" =
class=3D"">sdherts@gmail.com</a>&gt; wrote:<br class=3D"">
&nbsp; &nbsp; &gt; I am currently working on getting a working OpenBMC =
test environment<br class=3D"">
&nbsp; &nbsp; &gt; up and running. I am using VirtualBox and the github =
Development<br class=3D"">
&nbsp; &nbsp; &gt; Environment tutorial. I had a couple questions =
regarding how to make<br class=3D"">
&nbsp; &nbsp; &gt; our own modules. Would it be possible to upload files =
to the bmc on<br class=3D"">
&nbsp; &nbsp; &gt; the virtual server?<br class=3D"">
<br class=3D"">
You can do that.<br class=3D"">
The disk is rather small by default.<br class=3D"">
If you are using VirtualBox, you may be able to use the vboxfs file =
system to<br class=3D"">
mount the host. That might require adding modules to the kernel.<br =
class=3D"">
<br class=3D"">
&nbsp; &nbsp; &gt; And would I be able to make a script which can read =
text off of that<br class=3D"">
&nbsp; &nbsp; &gt; file inside the bmc chip?<br class=3D"">
<br class=3D"">
&nbsp; &nbsp; &gt; I have a physical server which I am not using yet, =
would I be able to<br class=3D"">
&nbsp; &nbsp; &gt; install openbmc and the scripts and insert the file =
onto the actual<br class=3D"">
&nbsp; &nbsp; &gt; bmc chip, and eventually read from that file?<br =
class=3D"">
<br class=3D"">
Maybe. What server do you have?<br class=3D"">
<br class=3D"">
--<br class=3D"">
]&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Never tell me =
the odds!&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| =
ipv6 mesh networks [<br class=3D"">
]&nbsp; &nbsp;Michael Richardson, Sandelman Software Works&nbsp; &nbsp; =
&nbsp; &nbsp; |&nbsp; &nbsp; IoT architect&nbsp; &nbsp;[<br class=3D"">
]&nbsp; &nbsp; &nbsp;<a href=3D"mailto:mcr@sandelman.ca" target=3D"_blank"=
 class=3D"">mcr@sandelman.ca</a>&nbsp; <a =
href=3D"http://www.sandelman.ca/" rel=3D"noreferrer" target=3D"_blank" =
class=3D"">http://www.sandelman.ca/</a>&nbsp; &nbsp; &nbsp; &nbsp; =
|&nbsp; &nbsp;ruby on rails&nbsp; &nbsp; [<br class=3D"">
<br class=3D"">
</blockquote></div><br clear=3D"all" class=3D""><div class=3D""><br =
class=3D""></div>-- <br class=3D""><div dir=3D"ltr" =
class=3D"gmail_signature"><div dir=3D"ltr" class=3D"">Sincerely,&nbsp;<div=
 class=3D"">Samuel Herts</div></div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_531E43A5-F6D3-4B1C-8D30-8604A4964841--
