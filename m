Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C91A764D72F
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 08:19:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXkBj4NXrz2xxn
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 18:19:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qhfEYern;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com; envelope-from=amirradh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qhfEYern;
	dkim-atps=neutral
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWmFf6Rx3z3bP1
	for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 04:48:53 +1100 (AEDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-12c8312131fso13501853fac.4
        for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2022 09:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/c2s+kwZ67cILBslG4h3Dtaa6XPGF2gcJMUOlML64DQ=;
        b=qhfEYernbXZ636QFayCKMyeDsdUQI8TgSJgFmSvsf+wfuWUsXfW9yySOaA/ixrUmwn
         cxgoHkMyzcHhI7cmpQcnCbJmqUXCsGMbqQclJxk9/dEBXoWDVNpEz8tQey169BkmksOK
         hsBHNMl2qLhayrnSGHVYBmseXNii6WLe96ATeNjdhQtBugtMnEmgdOhM9K9HeBsNV/wT
         OL31MQ+vZ2G5BtPm6fvF8wCzLUHw31/MmTQEFkQ0A9Lpz6TeeepasLsH0sRwCqb/TbG6
         Ur+eUU7FKLx1FCbH6Z0IBjTr1/7NM20Ux7bgC9UXaoHH4tq8DQO89yXuLg51ItXEOgnb
         kikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/c2s+kwZ67cILBslG4h3Dtaa6XPGF2gcJMUOlML64DQ=;
        b=gWkDowadmkn/u1J300gS/36kBs0HEJhrlp8tzNFvC20psRHV6gYBA3QfAMJjrF0M+Y
         EBh6xQ8B7YC1mp5WZAzrh4X6UGF6kusu+pIGKMo6R4dvVbRe1z6xTDk2tmn3/3cyM65Q
         Y04uY6jXBzIrNg+7cHAbUrAMz8XUSZ7iuV68gK47Ib1bgAwTsm+yPs7YGuItY1R5YHhu
         C4ntSYOQ5AydGJvzMcZaV3JsMlxJ9/P5L/CssnSYHPyUnVHcnyMGBCzCiJ9RObxcXHB/
         ho9Z5wMLY5sRO7TiM5/v/Bb3PfbTKnsaSNRJcLfjC9YLYq8RTNNjsNUwMEzPLkbaXgxi
         mJ3Q==
X-Gm-Message-State: ANoB5plJI7MHI0WBeHFX57FbSbglKox+myKgguFDV5JGf0D0qVzazIVT
	xEofS7CklQOX6orBUu0gQfVG5TjFOBafBupeMjg=
X-Google-Smtp-Source: AA0mqf6FE7qYdK0tJejiLjOv5E8I8XBcJnLyw4wF7HSEPevim1v+TgaWlCteN04zhhOoL5X6JL6M2xXakkVq5IfbjfU=
X-Received: by 2002:a05:6870:450c:b0:13b:8835:a774 with SMTP id
 e12-20020a056870450c00b0013b8835a774mr284147oao.260.1670953727499; Tue, 13
 Dec 2022 09:48:47 -0800 (PST)
MIME-Version: 1.0
References: <CACFAz8BpHQUROFcpG3+dG3XyUt0+8=zgcwkU4CTk3uuO0Z2c_w@mail.gmail.com>
 <20221204234449.GG18848@packtop> <CACFAz8CO7sm6TXCct35kOH-mWZOAj=UHuRisgw3rSpawRxr9jQ@mail.gmail.com>
 <20221206213941.GH18848@packtop> <CACFAz8CXpJ-HR9RDB4DPCH5y-=kuRgwd3r_p7b7sA5CyQjty=A@mail.gmail.com>
 <CACFAz8AspVJxBnp2k+aC=M3tANYp=QCUeEPZBmAQ7aC2YUb2Rg@mail.gmail.com>
 <CACFAz8DhGibXxPNKOh+WCEEPQtmSQk27Rw0oC-sTt7OpqUcAaw@mail.gmail.com> <20221209065934.GJ18848@packtop>
In-Reply-To: <20221209065934.GJ18848@packtop>
From: Hamid Amirrad <amirradh@gmail.com>
Date: Tue, 13 Dec 2022 12:48:36 -0500
Message-ID: <CACFAz8CcbKf27azakNF86K+wO=ejX2qFuAZZhTboM+Co4m3+sg@mail.gmail.com>
Subject: Re: Changing ethernet port speed
To: Zev Weiss <zweiss@equinix.com>
Content-Type: multipart/alternative; boundary="0000000000005d22f305efb93bcb"
X-Mailman-Approved-At: Thu, 15 Dec 2022 18:08:48 +1100
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

--0000000000005d22f305efb93bcb
Content-Type: text/plain; charset="UTF-8"

Thanks Zev. I think I have it running now.

One last question I have. Is there a way for me to include utilities in the
image (such as ethtool, dpkg, etc) without having to connect the module to
the internet and installing them that way?
Does OpenBMC image come with those utilities?

below is my image details:

root@evb-ast2500:~# cat /etc/os-release
ID=openbmc-phosphor
NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION="None"
VERSION_ID=none
VERSION_CODENAME="${DISTRO_CODENAME}"
PRETTY_NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)
None"
BUILD_ID="20221206174257"
OPENBMC_TARGET_MACHINE="evb-ast2500"
EXTENDED_VERSION="None"

On Fri, Dec 9, 2022 at 1:59 AM Zev Weiss <zweiss@equinix.com> wrote:

> On Thu, Dec 08, 2022 at 06:46:18AM PST, Hamid Amirrad wrote:
> >Hi Zeb,
> >
> >I found a default username/password (root:0penBmc). I can log in to my
> >newly installed image. The only thing that confuses me is that on the qemu
> >simulator, I have the following interface
> >ast#
> >
>
> That looks like a u-boot prompt, which would imply that it didn't boot
> properly.  Do you see any messages in the output before that prompt,
> perhaps something about failing to find or load an image to boot?
>
> >When I type (?), it shows me all the available commands such as (version,
> >setenv, printenv, etc). Also no password is required to login.
> >
> >With the new image that I compiled from the github and installed on my BMC
> >Module, I have the following interface:
> >root@evb-ast2500:~#
> >
> >When I type (?), it doesn't work and I have a whole different available
> >commands (mostly from linux). Also need password to login.
> >
>
> And that looks like a more fully booted bmc.
>
> >Is this expected?
> >
>
> For a normally-running system, yes.  I'm not sure offhand what might be
> causing your apparent boot failure in qemu though.
>
>
> Zev
>

--0000000000005d22f305efb93bcb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Zev. I think I have it running now.<div><br></div><=
div>One last question I have. Is there a way for me to include utilities in=
 the image (such as ethtool, dpkg, etc) without having to connect the modul=
e to the internet and installing them that way?</div><div>Does OpenBMC imag=
e come with those utilities?</div><div><br></div><div>below is my image det=
ails:</div><div><br></div><div><span style=3D"color:rgb(36,36,36);font-fami=
ly:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,system-ui,&quot;Ap=
ple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Web&quot;,s=
ans-serif;font-size:14px;background-color:rgb(232,235,250)">root@evb-ast250=
0:~# cat /etc/os-release</span><br style=3D"box-sizing:border-box;color:rgb=
(36,36,36);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot=
;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;=
Segoe UI Web&quot;,sans-serif;font-size:14px;background-color:rgb(232,235,2=
50)"><span style=3D"color:rgb(36,36,36);font-family:-apple-system,BlinkMacS=
ystemFont,&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quo=
t;Segoe UI Emoji&quot;,&quot;Segoe UI Web&quot;,sans-serif;font-size:14px;b=
ackground-color:rgb(232,235,250)">ID=3Dopenbmc-phosphor</span><br style=3D"=
box-sizing:border-box;color:rgb(36,36,36);font-family:-apple-system,BlinkMa=
cSystemFont,&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&q=
uot;Segoe UI Emoji&quot;,&quot;Segoe UI Web&quot;,sans-serif;font-size:14px=
;background-color:rgb(232,235,250)"><span style=3D"color:rgb(36,36,36);font=
-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,system-ui,&qu=
ot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Web&qu=
ot;,sans-serif;font-size:14px;background-color:rgb(232,235,250)">NAME=3D&qu=
ot;Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)&quot;</span=
><br style=3D"box-sizing:border-box;color:rgb(36,36,36);font-family:-apple-=
system,BlinkMacSystemFont,&quot;Segoe UI&quot;,system-ui,&quot;Apple Color =
Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Web&quot;,sans-serif;=
font-size:14px;background-color:rgb(232,235,250)"><span style=3D"color:rgb(=
36,36,36);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;=
,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;S=
egoe UI Web&quot;,sans-serif;font-size:14px;background-color:rgb(232,235,25=
0)">VERSION=3D&quot;None&quot;</span><br style=3D"box-sizing:border-box;col=
or:rgb(36,36,36);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe U=
I&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,=
&quot;Segoe UI Web&quot;,sans-serif;font-size:14px;background-color:rgb(232=
,235,250)"><span style=3D"color:rgb(36,36,36);font-family:-apple-system,Bli=
nkMacSystemFont,&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot=
;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Web&quot;,sans-serif;font-size:=
14px;background-color:rgb(232,235,250)">VERSION_ID=3Dnone</span><br style=
=3D"box-sizing:border-box;color:rgb(36,36,36);font-family:-apple-system,Bli=
nkMacSystemFont,&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot=
;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Web&quot;,sans-serif;font-size:=
14px;background-color:rgb(232,235,250)"><span style=3D"color:rgb(36,36,36);=
font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,system-ui=
,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI We=
b&quot;,sans-serif;font-size:14px;background-color:rgb(232,235,250)">VERSIO=
N_CODENAME=3D&quot;${DISTRO_CODENAME}&quot;</span><br style=3D"box-sizing:b=
order-box;color:rgb(36,36,36);font-family:-apple-system,BlinkMacSystemFont,=
&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI=
 Emoji&quot;,&quot;Segoe UI Web&quot;,sans-serif;font-size:14px;background-=
color:rgb(232,235,250)"><span style=3D"color:rgb(36,36,36);font-family:-app=
le-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,system-ui,&quot;Apple Col=
or Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Web&quot;,sans-ser=
if;font-size:14px;background-color:rgb(232,235,250)">PRETTY_NAME=3D&quot;Ph=
osphor OpenBMC (Phosphor OpenBMC Project Reference Distro) None&quot;</span=
><br style=3D"box-sizing:border-box;color:rgb(36,36,36);font-family:-apple-=
system,BlinkMacSystemFont,&quot;Segoe UI&quot;,system-ui,&quot;Apple Color =
Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Web&quot;,sans-serif;=
font-size:14px;background-color:rgb(232,235,250)"><span style=3D"color:rgb(=
36,36,36);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;=
,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;S=
egoe UI Web&quot;,sans-serif;font-size:14px;background-color:rgb(232,235,25=
0)">BUILD_ID=3D&quot;20221206174257&quot;</span><br style=3D"box-sizing:bor=
der-box;color:rgb(36,36,36);font-family:-apple-system,BlinkMacSystemFont,&q=
uot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI E=
moji&quot;,&quot;Segoe UI Web&quot;,sans-serif;font-size:14px;background-co=
lor:rgb(232,235,250)"><span style=3D"color:rgb(36,36,36);font-family:-apple=
-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,system-ui,&quot;Apple Color=
 Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Web&quot;,sans-serif=
;font-size:14px;background-color:rgb(232,235,250)">OPENBMC_TARGET_MACHINE=
=3D&quot;evb-ast2500&quot;</span><br style=3D"box-sizing:border-box;color:r=
gb(36,36,36);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&qu=
ot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quo=
t;Segoe UI Web&quot;,sans-serif;font-size:14px;background-color:rgb(232,235=
,250)"><span style=3D"color:rgb(36,36,36);font-family:-apple-system,BlinkMa=
cSystemFont,&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&q=
uot;Segoe UI Emoji&quot;,&quot;Segoe UI Web&quot;,sans-serif;font-size:14px=
;background-color:rgb(232,235,250)">EXTENDED_VERSION=3D&quot;None&quot;</sp=
an><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, Dec 9, 2022 at 1:59 AM Zev Weiss &lt;<a href=3D"mailto=
:zweiss@equinix.com">zweiss@equinix.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Thu, Dec 08, 2022 at 06:46:18AM P=
ST, Hamid Amirrad wrote:<br>
&gt;Hi Zeb,<br>
&gt;<br>
&gt;I found a default username/password (root:0penBmc). I can log in to my<=
br>
&gt;newly installed image. The only thing that confuses me is that on the q=
emu<br>
&gt;simulator, I have the following interface<br>
&gt;ast#<br>
&gt;<br>
<br>
That looks like a u-boot prompt, which would imply that it didn&#39;t boot<=
br>
properly.=C2=A0 Do you see any messages in the output before that prompt,<b=
r>
perhaps something about failing to find or load an image to boot?<br>
<br>
&gt;When I type (?), it shows me all the available commands such as (versio=
n,<br>
&gt;setenv, printenv, etc). Also no password is required to login.<br>
&gt;<br>
&gt;With the new image that I compiled from the github and installed on my =
BMC<br>
&gt;Module, I have the following interface:<br>
&gt;root@evb-ast2500:~#<br>
&gt;<br>
&gt;When I type (?), it doesn&#39;t work and I have a whole different avail=
able<br>
&gt;commands (mostly from linux). Also need password to login.<br>
&gt;<br>
<br>
And that looks like a more fully booted bmc.<br>
<br>
&gt;Is this expected?<br>
&gt;<br>
<br>
For a normally-running system, yes.=C2=A0 I&#39;m not sure offhand what mig=
ht be<br>
causing your apparent boot failure in qemu though.<br>
<br>
<br>
Zev<br>
</blockquote></div>

--0000000000005d22f305efb93bcb--
