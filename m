Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C88C61500A6
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2020 04:08:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 489t7G5833zDqTW
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2020 14:08:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a42;
 helo=mail-vk1-xa42.google.com; envelope-from=sdherts@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DHdT5I9g; dkim-atps=neutral
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488P4P4JxbzDqgF
 for <openbmc@lists.ozlabs.org>; Sat,  1 Feb 2020 04:15:32 +1100 (AEDT)
Received: by mail-vk1-xa42.google.com with SMTP id o200so2284342vke.4
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 09:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JOYt7BU50XFZK0svVKJZ2QEVnzp2xNW8B1ibFDX5RiA=;
 b=DHdT5I9gsyJ7XPmcEdT1sgPISa7fWRaao9e2FO83Kokpie/MxwsJIbbdRwwh8vRjKj
 4Tt4DqNxCTJ8aJQSRE3rR6OQH43LKB4O5FuLcTh1cHph2UKMR5WONfzLFUAYl4+aaw++
 czGP1vtphEXuhMd4gLpsEn+q4bLamfmG+Qz22R5Mohc8bWDu5oRtY5aCDlU2HcAK4Zc1
 ySpOI9U9IweXwKumHwBDtuVGdAoPU0lOfWCCSUmCtJou5ltabPyj+AoC+yhblw7lvu4F
 zFdx6sqAAUNo0SLHzZW6r0D1xX+0uJOBLigrQ99BcummoRRR+bTRkcQzcDrtiHTJpWRG
 wmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JOYt7BU50XFZK0svVKJZ2QEVnzp2xNW8B1ibFDX5RiA=;
 b=McFBSESm6SkkrU1O1/j1YcwgKcgncrNH35cwnbNmz8wyl3EE/Se7kIGI/Eua1d8KW1
 EqmCBvpFxKCMRfmEOKXRGDhXeVpuxjcLmwX5CGYWMs4lgwdyhVhDGzZSI+iQj6GA0+nd
 FLjDr+YV25sj1yPh9zkwnluftyv0zwE4X5M4zqC6WWkj4qB0vJgfpAkI1aMSzNuuvlxz
 +rAGb7ICI6Wb9liW2DoqZJVGGHVc3BVQIkLlfttwBAKwCMjVY2ZV9GL+uSng+SyDFqo6
 76XEq2MO4bYqaILVX5CuV/cdo1Cp1hPrke0fcu5n1ABwH8/KvEJ3GTYitCBb2yZkOS8w
 61Kg==
X-Gm-Message-State: APjAAAU+yDWAbzp8fUdWFfHWix/ZEe/1layWab06jAncpGkNdCnZehLF
 C4+xC5IgGTEkf4Q81oFS7Hc5AMr4JTo62ejFRcM=
X-Google-Smtp-Source: APXvYqxrdcpKXdzIKElGXNMMLFN/zMpKqkuL4noKkrgCnRYPocRPjT91ysM74jbsy43BBS6Pp+nPwpKTbxL/BvzbCdQ=
X-Received: by 2002:a1f:db81:: with SMTP id s123mr6936580vkg.45.1580490928891; 
 Fri, 31 Jan 2020 09:15:28 -0800 (PST)
MIME-Version: 1.0
References: <CA+k9xxY2wfrzE=kQOM24wc5pgs+poqNEKyHooQNfxNfZrSsGFA@mail.gmail.com>
 <5937.1579503424@localhost>
 <CA+k9xxZfreCU8L=G=vUJBODdyjPU_p8+d7_LycNi_ShAZzwMjQ@mail.gmail.com>
 <37BC22AA-C168-4A36-98D8-DD31E78BDE03@gmail.com>
In-Reply-To: <37BC22AA-C168-4A36-98D8-DD31E78BDE03@gmail.com>
From: Samuel Herts <sdherts@gmail.com>
Date: Fri, 31 Jan 2020 12:15:19 -0500
Message-ID: <CA+k9xxZXUjn=n1SCnHb28_iTN3cEG0yv_QB+Qh7DgcUNdXD4LA@mail.gmail.com>
Subject: Re: OpenBMC Starting Point
To: Andrew Geissler <geissonator@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000632a24059d72b818"
X-Mailman-Approved-At: Mon, 03 Feb 2020 14:04:31 +1100
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

--000000000000632a24059d72b818
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We got the Hello World to work perfectly, thank you for the assistance! How
would we now go about doing the exact same thing, but hardware implemented?
By that, I mean actually running the phosphor state manager modified module
on the physical BMC chip? How do we install the OpenBMC sdk? Also, is there
a method to read from the computer's BIOS chip from this modified state
manager?



On Tue, Jan 21, 2020 at 11:52 AM Andrew Geissler <geissonator@gmail.com>
wrote:

>
>
> On Jan 20, 2020, at 11:03 AM, Samuel Herts <sdherts@gmail.com> wrote:
>
> Thank you!
> I have a supermicro X9 with ast2400 BMC chip. How would we go about
> installing it? openBMC onto it? We currently have a fresh install of Ubun=
tu
> LTS on it, and nothing else.
>
>
> The only AST2400 config I=E2=80=99m familiar with is our Palmetto.
> You could start with that machine and tweak it for yours.
>
> https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-palmetto/con=
f/machine/palmetto.conf
>
>
> In terms of the development virtual machine. I keep running into an issue
> when trying to wget the sdk.
> Specifically, this line: wget
> https://openpower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,target=3Dromu=
lus/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-arm1176jzs-toolch=
ain-nodistro.0.sh
>  After running that inside the romulus emulator, it runs out of space and
> won't complete the download. Does this mean I need to either increase the
> storage for the romulus, or am I simply installing it in the wrong place,
> and instead need to wget that into the regular VM?
>
>
> The SDK is not meant to be downloaded to the actual OpenBMC
> system. I=E2=80=99t meant to be downloaded to your development system.
> You can then use it to build OpenBMC software that you then copy
> over to your OpenBMC and run.
>
> Apologies for all the questions, I am doing as much research as I can, an=
d
> this mailing list seems to be the largest wealth of knowledge I have
> available.
>
> --Sam
>
> On Mon, Jan 20, 2020 at 1:57 AM Michael Richardson <mcr@sandelman.ca>
> wrote:
>
>>
>> Samuel Herts <sdherts@gmail.com> wrote:
>>     > I am currently working on getting a working OpenBMC test environme=
nt
>>     > up and running. I am using VirtualBox and the github Development
>>     > Environment tutorial. I had a couple questions regarding how to ma=
ke
>>     > our own modules. Would it be possible to upload files to the bmc o=
n
>>     > the virtual server?
>>
>> You can do that.
>> The disk is rather small by default.
>> If you are using VirtualBox, you may be able to use the vboxfs file
>> system to
>> mount the host. That might require adding modules to the kernel.
>>
>>     > And would I be able to make a script which can read text off of th=
at
>>     > file inside the bmc chip?
>>
>>     > I have a physical server which I am not using yet, would I be able
>> to
>>     > install openbmc and the scripts and insert the file onto the actua=
l
>>     > bmc chip, and eventually read from that file?
>>
>> Maybe. What server do you have?
>>
>> --
>> ]               Never tell me the odds!                 | ipv6 mesh
>> networks [
>> ]   Michael Richardson, Sandelman Software Works        |    IoT
>> architect   [
>> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on
>> rails    [
>>
>>
>
> --
> Sincerely,
> Samuel Herts
>
>
>

--=20
Sincerely,
Samuel Herts

--000000000000632a24059d72b818
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">We got the Hello World to work perfectly,=
 thank you for the assistance! How would we now go about doing the exact sa=
me thing, but hardware implemented? By that, I mean actually running the ph=
osphor state manager modified module on the physical BMC chip? How do we in=
stall the OpenBMC sdk? Also, is there a method to read from the computer&#3=
9;s BIOS chip from this modified state manager?</div><div dir=3D"ltr"><br><=
/div><div class=3D"gmail-yj6qo gmail-ajU" style=3D"outline:none;padding:10p=
x 0px;width:22px;margin:2px 0px 0px"><br class=3D"gmail-Apple-interchange-n=
ewline"></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jan 21, 2020 at 11:52 AM Andrew Geissler &lt;<a hre=
f=3D"mailto:geissonator@gmail.com">geissonator@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div style=3D"overf=
low-wrap: break-word;"><br><div><br><blockquote type=3D"cite"><div>On Jan 2=
0, 2020, at 11:03 AM, Samuel Herts &lt;<a href=3D"mailto:sdherts@gmail.com"=
 target=3D"_blank">sdherts@gmail.com</a>&gt; wrote:</div><br><div><div dir=
=3D"ltr">Thank you!<div>I have a supermicro X9 with ast2400 BMC chip. How w=
ould we go about installing it? openBMC onto it? We currently have a fresh =
install of Ubuntu LTS on it, and nothing else.</div></div></div></blockquot=
e><div><br></div><div><div style=3D"color:rgb(0,0,0)">The only AST2400 conf=
ig I=E2=80=99m familiar with is our Palmetto.</div><div style=3D"color:rgb(=
0,0,0)">You could start with that machine and tweak it for yours.</div><div=
 style=3D"color:rgb(0,0,0)"><a href=3D"https://github.com/openbmc/openbmc/b=
lob/master/meta-ibm/meta-palmetto/conf/machine/palmetto.conf" target=3D"_bl=
ank">https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-palmetto/=
conf/machine/palmetto.conf</a></div></div><div><br></div><br><blockquote ty=
pe=3D"cite"><div><div dir=3D"ltr"><div>In terms of the development virtual =
machine. I keep running into an issue when trying to wget the sdk.=C2=A0</d=
iv><div>Specifically, this line:=C2=A0<span style=3D"background-color:initi=
al;font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,mo=
nospace;color:rgb(36,41,46);font-size:13.6px">wget <a href=3D"https://openp=
ower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,target=3Dromulus/lastSuccess=
fulBuild/artifact/deploy/sdk/oecore-x86_64-arm1176jzs-toolchain-nodistro.0.=
sh" target=3D"_blank">https://openpower.xyz/job/openbmc-build-sdk/distro=3D=
ubuntu,target=3Dromulus/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_=
64-arm1176jzs-toolchain-nodistro.0.sh</a></span></div>=C2=A0After running t=
hat inside the romulus emulator, it runs out of space and won&#39;t complet=
e the download. Does this mean I need to either increase the storage for th=
e romulus, or am I simply installing it in the wrong place, and instead nee=
d to wget that into the regular VM?</div></div></blockquote><div><br></div>=
<div><div style=3D"color:rgb(0,0,0)">The SDK is not meant to be downloaded =
to the actual OpenBMC</div><div style=3D"color:rgb(0,0,0)">system. I=E2=80=
=99t meant to be downloaded to your development system.</div><div style=3D"=
color:rgb(0,0,0)">You can then use it to build OpenBMC software that you th=
en copy</div><div style=3D"color:rgb(0,0,0)">over to your OpenBMC and run.<=
/div></div><br><blockquote type=3D"cite"><div><div dir=3D"ltr"><div>Apologi=
es for all the questions, I am doing as much research as I can, and this ma=
iling list seems to be the largest wealth of knowledge I have available.</d=
iv><div><br></div><div>--Sam</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 20, 2020 at 1:57 AM Michael R=
ichardson &lt;<a href=3D"mailto:mcr@sandelman.ca" target=3D"_blank">mcr@san=
delman.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
Samuel Herts &lt;<a href=3D"mailto:sdherts@gmail.com" target=3D"_blank">sdh=
erts@gmail.com</a>&gt; wrote:<br>
=C2=A0 =C2=A0 &gt; I am currently working on getting a working OpenBMC test=
 environment<br>
=C2=A0 =C2=A0 &gt; up and running. I am using VirtualBox and the github Dev=
elopment<br>
=C2=A0 =C2=A0 &gt; Environment tutorial. I had a couple questions regarding=
 how to make<br>
=C2=A0 =C2=A0 &gt; our own modules. Would it be possible to upload files to=
 the bmc on<br>
=C2=A0 =C2=A0 &gt; the virtual server?<br>
<br>
You can do that.<br>
The disk is rather small by default.<br>
If you are using VirtualBox, you may be able to use the vboxfs file system =
to<br>
mount the host. That might require adding modules to the kernel.<br>
<br>
=C2=A0 =C2=A0 &gt; And would I be able to make a script which can read text=
 off of that<br>
=C2=A0 =C2=A0 &gt; file inside the bmc chip?<br>
<br>
=C2=A0 =C2=A0 &gt; I have a physical server which I am not using yet, would=
 I be able to<br>
=C2=A0 =C2=A0 &gt; install openbmc and the scripts and insert the file onto=
 the actual<br>
=C2=A0 =C2=A0 &gt; bmc chip, and eventually read from that file?<br>
<br>
Maybe. What server do you have?<br>
<br>
--<br>
]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Never tell me the o=
dds!=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ipv6 me=
sh networks [<br>
]=C2=A0 =C2=A0Michael Richardson, Sandelman Software Works=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 IoT architect=C2=A0 =C2=A0[<br>
]=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:mcr@sandelman.ca" target=3D"_blank">=
mcr@sandelman.ca</a>=C2=A0 <a href=3D"http://www.sandelman.ca/" rel=3D"nore=
ferrer" target=3D"_blank">http://www.sandelman.ca/</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0ruby on rails=C2=A0 =C2=A0 [<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Sincerely,=C2=A0<div>Samuel Herts</div></div></div>
</div></blockquote></div><br></div></blockquote></div><br clear=3D"all"><di=
v><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Sincerely,=C2=A0<div>Samuel Herts</div></div></div>

--000000000000632a24059d72b818--
