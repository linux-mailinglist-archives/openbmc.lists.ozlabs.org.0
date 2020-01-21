Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C669E144287
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 17:53:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482F385q7gzDqXM
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 03:53:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332;
 helo=mail-ot1-x332.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OblYZK8C; dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482F2T2VT2zDqVR
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 03:52:32 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id r9so3493292otp.13
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2020 08:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=RZ0ZHxIojWJmyH0FB2pGj0VRbz6rzpGKz+Z/NJtl4v4=;
 b=OblYZK8CWKla7clAR+DbWljULuZFCpnhzKm64zee8Fff2sTFdzc7NHbgHFjJ4N+AZY
 +/fIb6VPfoypy78Gnuvwl+hoQaO5T3C/LujZACA6Imf/Oo2gI+i7wqSn/xHbTMvHHk/o
 x5iEp5rBbjxGbEM9pG28xUxvrg0ryF2bUsXhcaR6LHNbHmFqsihL8mXpsuf8Qd0hL095
 ruiFCo7sDMpzrfCcJdiWhtzWuVs0CYbIl2fGRJpM2xgfre6rKqJZNrEoBCi2KjMV4vju
 +7qXm72SQdTtRdXihbqxCAgYfaDa/IgeovsMggJ5ix18bJKtTorqXzNIpM26oKRJq+Wi
 nqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=RZ0ZHxIojWJmyH0FB2pGj0VRbz6rzpGKz+Z/NJtl4v4=;
 b=qCgyiE5BVwgfr9SRNllmou+f5TI5vUOPsZeY2vZWRu5tiR9GalOaeXSaCKngwy95wD
 iulNfpQ2MivZdUXSwSgJtqMoxgCUA+cWOW3QJeig25VHqgRf5YQx0TdgZ1syRp0WNAbx
 im0OWKoG2ZQkf2WQJn0C2qtyp1BnADj4tLYZefmR8cdnzLSFaT/zGYs7LCB+LeoRBcPO
 /n9K+MOktGQFsCZouNCtdXOcK1oi0YiVVE9Bv4NuhY0AnZJc2rzH79xNbXTuAVrHjW1Q
 D3A+I+XpJcy1NMI1KeA322aLleYk535Aizt3naTIdgjXr6pxDa9eS2wC3nfQ10zI1VTl
 A/uA==
X-Gm-Message-State: APjAAAUXn5SeV/QY7AF/yD7O954eexpbRIjLYmSNlSSo4b3rhG3222Ck
 p86ZAJNsQvjJu3eceE3E7vw=
X-Google-Smtp-Source: APXvYqyIlHJqqMZr6wcXArglVDnkyu5+ltBr0mepd60Ixh0RTIgQca3+urEGuIdV0l9ZadvcJJPRCQ==
X-Received: by 2002:a9d:5885:: with SMTP id x5mr4107033otg.132.1579625547793; 
 Tue, 21 Jan 2020 08:52:27 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:90e3:4fd7:23b7:3941])
 by smtp.gmail.com with ESMTPSA id y6sm13622749oti.44.2020.01.21.08.52.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jan 2020 08:52:27 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Message-Id: <37BC22AA-C168-4A36-98D8-DD31E78BDE03@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_50BECC3C-9F75-489A-A984-027BFE26EBF6"
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: OpenBMC Starting Point
Date: Tue, 21 Jan 2020 10:52:26 -0600
In-Reply-To: <CA+k9xxZfreCU8L=G=vUJBODdyjPU_p8+d7_LycNi_ShAZzwMjQ@mail.gmail.com>
To: Samuel Herts <sdherts@gmail.com>
References: <CA+k9xxY2wfrzE=kQOM24wc5pgs+poqNEKyHooQNfxNfZrSsGFA@mail.gmail.com>
 <5937.1579503424@localhost>
 <CA+k9xxZfreCU8L=G=vUJBODdyjPU_p8+d7_LycNi_ShAZzwMjQ@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
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


--Apple-Mail=_50BECC3C-9F75-489A-A984-027BFE26EBF6
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


--Apple-Mail=_50BECC3C-9F75-489A-A984-027BFE26EBF6
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
else.</div></div></div></blockquote><div><br class=3D""></div><div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">The =
only AST2400 config I=E2=80=99m familiar with is our Palmetto.</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">You =
could start with that machine and tweak it for yours.</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><a =
href=3D"https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-palme=
tto/conf/machine/palmetto.conf" =
class=3D"">https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-pa=
lmetto/conf/machine/palmetto.conf</a></div></div><div><br =
class=3D""></div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D"">In terms of the =
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
class=3D""></div><div><div style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D"">The SDK is not meant to be downloaded to the =
actual OpenBMC</div><div style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D"">system. I=E2=80=99t meant to be downloaded to =
your development system.</div><div style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">You can then use it to build OpenBMC =
software that you then copy</div><div style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">over to your OpenBMC and =
run.</div></div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
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

--Apple-Mail=_50BECC3C-9F75-489A-A984-027BFE26EBF6--
