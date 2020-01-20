Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ADD1460D3
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 03:59:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4836Sp13yyzDqVn
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 13:59:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2e;
 helo=mail-vk1-xa2e.google.com; envelope-from=sdherts@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O5qWFJFu; dkim-atps=neutral
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481dLD64CpzDqKN
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2020 04:04:04 +1100 (AEDT)
Received: by mail-vk1-xa2e.google.com with SMTP id c129so108686vkh.7
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jan 2020 09:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7p31W9cmxSG3Gpctdyd48GA5I7J9qgUq6WWdv3PZ/Uw=;
 b=O5qWFJFu0/K2RTSEctBcfFq8c1Hek3AEhM+QuTf74fP2ZsD2l9I5M0T6PDoIRFhkgY
 k/CG/2JvZwn0+BvdAfX5krXUA4m1PB/Or1nguSAd14GP2xMGrA/5ch0jWNbQdT2rY983
 DnfqNqqIaLPl/q8zd5/yrF29C2Fg9ID/OsFG3IyPlLMt7xLcELSMQqo4DFMOnwKRTuna
 Ltc7H23jv8ySk13DASb238UChM+FA10rJTF7Zhk3zm7WDcUyhZzfFGpFfMsEltSYmmpi
 D1DN5K5AOwx/1epGkpR7jG9zIBtPW6HzGA68AkXDorIX+ilGlukvwHf9BcwIYCrQUggF
 dQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7p31W9cmxSG3Gpctdyd48GA5I7J9qgUq6WWdv3PZ/Uw=;
 b=mPl5Lto9Cbd2V5enQFeZ+rBk/1xCFBej14pJR3r8n46YuYbZsq6mwNSBRmZQ6np/S6
 3HthooNMu/WZBrVSCfNHYgrlJkmQuQDAgvKOAZIyHMRARA5VgUjNubUZTPZ2md7Y43VN
 6M5QtCoLIPkzbILa46kxzELj8yWapVbmM+LwdauE8LUcNxf7CKy6cYkLYjKltS1mtTbL
 glgOslLdxBkYwrG1cslvU6DzBr9pjrzvC2vjfjHcxCd2Byr+w0Z0W4SUa51440aTx4WL
 pVEIJiCCB4h06ErBuBJM+wI9AZI65aAjoqnIKT90aRSq9Nh1UzOX5+rUNPLNl3O52GQl
 JJlw==
X-Gm-Message-State: APjAAAU8AS5/doKEvq0q1fnSWmIDx+yqza64fdlbULZlhM5gL0Sk2G7H
 9W1D4aY0nR+8yDTNdk47Mx1QowwNDG9V4pONs10=
X-Google-Smtp-Source: APXvYqzio5wCu3KLjqirCR15ARjIChDrD7IoAq1pYwQl78Geiy15imguDdKHxRJOInu/t3fxOvYyCEin8VI0Cby2q+Q=
X-Received: by 2002:ac5:c1c7:: with SMTP id g7mr352708vkk.97.1579539840205;
 Mon, 20 Jan 2020 09:04:00 -0800 (PST)
MIME-Version: 1.0
References: <CA+k9xxY2wfrzE=kQOM24wc5pgs+poqNEKyHooQNfxNfZrSsGFA@mail.gmail.com>
 <5937.1579503424@localhost>
In-Reply-To: <5937.1579503424@localhost>
From: Samuel Herts <sdherts@gmail.com>
Date: Mon, 20 Jan 2020 12:03:58 -0500
Message-ID: <CA+k9xxZfreCU8L=G=vUJBODdyjPU_p8+d7_LycNi_ShAZzwMjQ@mail.gmail.com>
Subject: Re: OpenBMC Starting Point
To: Michael Richardson <mcr@sandelman.ca>
Content-Type: multipart/alternative; boundary="00000000000015865e059c9547b9"
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
Cc: openbmc@lists.ozlabs.org, geissonator@yahoo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000015865e059c9547b9
Content-Type: text/plain; charset="UTF-8"

Thank you!
I have a supermicro X9 with ast2400 BMC chip. How would we go about
installing it? openBMC onto it? We currently have a fresh install of Ubuntu
LTS on it, and nothing else.

In terms of the development virtual machine. I keep running into an issue
when trying to wget the sdk.
Specifically, this line: wget
https://openpower.xyz/job/openbmc-build-sdk/distro=ubuntu,target=romulus/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-arm1176jzs-toolchain-nodistro.0.sh
 After running that inside the romulus emulator, it runs out of space and
won't complete the download. Does this mean I need to either increase the
storage for the romulus, or am I simply installing it in the wrong place,
and instead need to wget that into the regular VM?
Apologies for all the questions, I am doing as much research as I can, and
this mailing list seems to be the largest wealth of knowledge I have
available.

--Sam

On Mon, Jan 20, 2020 at 1:57 AM Michael Richardson <mcr@sandelman.ca> wrote:

>
> Samuel Herts <sdherts@gmail.com> wrote:
>     > I am currently working on getting a working OpenBMC test environment
>     > up and running. I am using VirtualBox and the github Development
>     > Environment tutorial. I had a couple questions regarding how to make
>     > our own modules. Would it be possible to upload files to the bmc on
>     > the virtual server?
>
> You can do that.
> The disk is rather small by default.
> If you are using VirtualBox, you may be able to use the vboxfs file system
> to
> mount the host. That might require adding modules to the kernel.
>
>     > And would I be able to make a script which can read text off of that
>     > file inside the bmc chip?
>
>     > I have a physical server which I am not using yet, would I be able to
>     > install openbmc and the scripts and insert the file onto the actual
>     > bmc chip, and eventually read from that file?
>
> Maybe. What server do you have?
>
> --
> ]               Never tell me the odds!                 | ipv6 mesh
> networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT
> architect   [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on
> rails    [
>
>

-- 
Sincerely,
Samuel Herts

--00000000000015865e059c9547b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you!<div>I have a supermicro X9 with ast2400 BMC chi=
p. How would we go about installing it? openBMC onto it? We currently have =
a fresh install of Ubuntu LTS on it, and nothing else.</div><div><br></div>=
<div>In terms of the development virtual machine. I keep running into an is=
sue when trying to wget the sdk.=C2=A0</div><div>Specifically, this line:=
=C2=A0<span style=3D"background-color:initial;font-family:SFMono-Regular,Co=
nsolas,&quot;Liberation Mono&quot;,Menlo,monospace;color:rgb(36,41,46);font=
-size:13.6px">wget <a href=3D"https://openpower.xyz/job/openbmc-build-sdk/d=
istro=3Dubuntu,target=3Dromulus/lastSuccessfulBuild/artifact/deploy/sdk/oec=
ore-x86_64-arm1176jzs-toolchain-nodistro.0.sh">https://openpower.xyz/job/op=
enbmc-build-sdk/distro=3Dubuntu,target=3Dromulus/lastSuccessfulBuild/artifa=
ct/deploy/sdk/oecore-x86_64-arm1176jzs-toolchain-nodistro.0.sh</a></span></=
div>=C2=A0After running that inside the romulus emulator, it runs out of sp=
ace and won&#39;t complete the download. Does this mean I need to either in=
crease the storage for the romulus, or am I simply installing it in the wro=
ng place, and instead need to wget that into the regular VM?<div>Apologies =
for all the questions, I am doing as much research as I can, and this maili=
ng list seems to be the largest wealth of knowledge I have available.</div>=
<div><br></div><div>--Sam</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Jan 20, 2020 at 1:57 AM Michael Rich=
ardson &lt;<a href=3D"mailto:mcr@sandelman.ca">mcr@sandelman.ca</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
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
 class=3D"gmail_signature"><div dir=3D"ltr">Sincerely,=C2=A0<div>Samuel Her=
ts</div></div></div>

--00000000000015865e059c9547b9--
