Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A925064D70A
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 08:13:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXk30457Kz2yyZ
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 18:13:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fkbez53J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com; envelope-from=amirradh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fkbez53J;
	dkim-atps=neutral
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NS7B0034Kz3bby
	for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2022 06:48:05 +1100 (AEDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-12c8312131fso22590023fac.4
        for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2022 11:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LiQuf/tGkMeSk6EdgYC07z9Tmp+oQ70PM3oB5NBV2uk=;
        b=Fkbez53JOTciMyOm8TLbRYv4rUDVYkSRwkLjLvh9fT3tCAP2Gobr98ksJtflMKnDQy
         bTaA3d/29Q4twImBVYmJdABCqWI6aYeECSxVxL5NeVwHgCUTI3KUvnY+71E9VPXAETFE
         LAUjx8j+Tv0zlv/ehNGl8NiydYNHLxl/YO1ChNXkLivAIVIQGJ9psyvj1wV3R0OqRfD3
         X2TotgI7SRE11GbL0OWBKENS8p9D39IJ+NnZgebtAawRKKjQRiLs4dFvgg9lqubbFFO4
         T4W/V5xIc2xKUXDujGLHxoqD6kpmgvhwJZnBYCsFZ8mtCU4LwQkF//KPBMom7DS8sbrD
         /DpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiQuf/tGkMeSk6EdgYC07z9Tmp+oQ70PM3oB5NBV2uk=;
        b=vTT6akCT/Oi7BE12C/xt9TiSwG5iV1vIiIXgRImRfA8uBf8aBMsALsG2AxaH2Vx5lv
         DmdnG5q1RaOSeuYPC19cekCVcDFdwEGf3L+TBg2u8S83GlxuFYRWPG0unZ1Km+p9yOwo
         Ql0pD0omSAtnKCtghil9iIxX6nNj5k1wDtku9afGweXgRFVNfAM8+l55uvZxS+ddbjAn
         imUqKAGLly9LFSFx7k4OlD5GApMn7AaMf6gxJ9t/7098XL4yDIAI2CeAoqrMt6hg/dl2
         G7FJGoq6chD+YtcWRtIykH8KVxz/VMvTzljwYj/PwQKKLHNsmJcnhqhyrDfudzC9Sfga
         3CLw==
X-Gm-Message-State: ANoB5pk1UrEYoniK1g5K5Ajz7UGIxKpuxxI/w/LkWPFjtBuL2fRtA8lZ
	97iUWnaMeZUfaOQpppjoUMdCb46absfHRtH84bI=
X-Google-Smtp-Source: AA0mqf7iz3ojy9NFzDpfqMkA/clmk28iLTwnnFWr5puA/1WWLMeiIG0iQa0HcV5n2NF1XhWd89zTGIr9aqeFRhwaQ8Y=
X-Received: by 2002:a05:6870:bd49:b0:13b:8835:a774 with SMTP id
 og9-20020a056870bd4900b0013b8835a774mr40341677oab.260.1670442479014; Wed, 07
 Dec 2022 11:47:59 -0800 (PST)
MIME-Version: 1.0
References: <CACFAz8BpHQUROFcpG3+dG3XyUt0+8=zgcwkU4CTk3uuO0Z2c_w@mail.gmail.com>
 <20221204234449.GG18848@packtop> <CACFAz8CO7sm6TXCct35kOH-mWZOAj=UHuRisgw3rSpawRxr9jQ@mail.gmail.com>
 <20221206213941.GH18848@packtop> <CACFAz8CXpJ-HR9RDB4DPCH5y-=kuRgwd3r_p7b7sA5CyQjty=A@mail.gmail.com>
In-Reply-To: <CACFAz8CXpJ-HR9RDB4DPCH5y-=kuRgwd3r_p7b7sA5CyQjty=A@mail.gmail.com>
From: Hamid Amirrad <amirradh@gmail.com>
Date: Wed, 7 Dec 2022 14:47:47 -0500
Message-ID: <CACFAz8AspVJxBnp2k+aC=M3tANYp=QCUeEPZBmAQ7aC2YUb2Rg@mail.gmail.com>
Subject: Re: Changing ethernet port speed
To: Zev Weiss <zweiss@equinix.com>
Content-Type: multipart/alternative; boundary="00000000000094566005ef423267"
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

--00000000000094566005ef423267
Content-Type: text/plain; charset="UTF-8"

Hi Zev,

I might have installed it correctly this time (still have to confirm).
However, I get the following, cant find any details about username
password. where can I find it?
evb-ast2500 login:

Thanks,
Hamid

On Wed, Dec 7, 2022 at 12:53 PM Hamid Amirrad <amirradh@gmail.com> wrote:

> Hi Zev,
>
> I am checking out the code from: https://github.com/openbmc/openbmc
> Revision I am building from is 15231.
>
> sockflash.sh output is below for upgrading:
>
> ./socflash.sh image-bmc image-bmc
> ASPEED SOC Flash Utility v.1.22.08
> Warning:
> SoCflash utility is only for engineers to update the firmware in lab,
> it is not a commercialized software product,
> ASPEED has not done compatibility/reliability stress test for SoCflash.
> Please do not use this utility for any mass production purpose.
> Press y to continue if you are agree ....
> y
> Find ASPEED Device 1a03:2000 on 7:0.0
> MMIO Virtual Address: abb9000
> Relocate IO Base: b000
> Found ASPEED Device 1a03:2500 rev. 41
> Static Memory Controller Information:
> CS0 Flash Type is SPI
> CS1 Flash Type is SPI
> CS2 Flash Type is SPI
> CS3 Flash Type is NOR
> CS4 Flash Type is NOR
> Boot CS is 0
> Option Information:
> CS: 0
> Flash Type: SPI
> [Warning] Don't AC OFF or Reboot System During BMC Firmware Update!!
> Find Flash Chip #1: 64MB SPI Flash
> Backup Flash Chip O.K.
> Update Flash Chip #1 O.K.
> Update Flash Chip O.K.
>
> On Tue, Dec 6, 2022 at 4:39 PM Zev Weiss <zweiss@equinix.com> wrote:
>
>> On Tue, Dec 06, 2022 at 11:27:47AM PST, Hamid Amirrad wrote:
>> >Hi,
>> >
>> >I see that the u-boot has been recently upgraded to 2019.04.
>> >I created the image as follows:
>> >1. Checked out the code
>> >2. . setup evb-ast2500
>> >3. time bitbake obmc-phosphor-image
>> >
>> >Then I copied the created image (bmc-image)
>> >from
>> /trunk/build/evb-ast2500/tmp/deploy/images/evb-ast2500/obmc-phosphor-image-evb-ast2500-20221122160306.static.mtd.all.tar
>> >to my LC having BMC module. I used ./socflash.sh to upgrade the BMC image
>> >to one just created. After upgrade is done, I still see the old u-boot
>> >version (below). Is this something else I need to do for the u-boot to be
>> >at revision 2019?
>> >
>> >ast# version
>> >
>> >U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)
>> >arm-openbmc-linux-gnueabi-gcc (GCC) 11.2.0
>> >GNU ld (GNU Binutils) 2.37.20210721
>> >
>> >I am using BMC simulator on another server and on that the u-boot
>> revision
>> >is fine (below). Not sure why u-boot is not at 2019 when I compile the
>> code
>> >directly.
>> >ast# version
>> >U-Boot 2019.04 (Nov 10 2022 - 00:12:58 +0000)
>> >
>> >arm-openbmc-linux-gnueabi-gcc (GCC) 12.2.0
>> >GNU ld (GNU Binutils) 2.39.0.20220819
>> >
>> >Any help would be greatly appreciated.
>> >
>> >Thanks,
>> >Hamid
>> >
>>
>> What OpenBMC commit are you building from?  It looks like evb-ast2500
>> got updated to the newer u-boot branch in February:
>>
>> https://github.com/openbmc/openbmc/commit/7d75b9b68370374db00e9c99b5406ebb6b18512f
>>
>> If the same image is showing the expected u-boot version in a simulator
>> (qemu?), then it sounds like maybe your installation procedure isn't
>> doing what you intended it to.  I don't know what the 'socflash.sh' you
>> referred to above is; if you can boot into a reasonably healthy OpenBMC
>> environment, I'd suggest using the normal firmware-update mechanism.  If
>> the existing firmware is something else or isn't working enough to boot
>> normally you might need to resort to a hardware flash programmer or
>> something (or if you can get your u-boot networking working at all, even
>> at a slow speed, you could TFTP in an OpenBMC kernel/initrd, boot into
>> that, and use flashcp to write the full OpenBMC image).
>>
>>
>> Zev
>>
>

--00000000000094566005ef423267
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Zev,<div><br></div><div>I might have installed it =
correctly this time (still have to confirm). However, I get the following, =
cant find any details about username password. where can I find it?</div><d=
iv>evb-ast2500 login:<br></div><div><br></div><div>Thanks,</div><div>Hamid<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Dec 7, 2022 at 12:53 PM Hamid Amirrad &lt;<a href=3D"mailto:am=
irradh@gmail.com">amirradh@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Zev,<div><br></div>=
<div>I am checking out the code from:=C2=A0<a href=3D"https://github.com/op=
enbmc/openbmc" target=3D"_blank">https://github.com/openbmc/openbmc</a></di=
v><div>Revision I am building=C2=A0from is=C2=A015231.</div><div><br></div>=
<div>sockflash.sh output is below for upgrading:</div><div><br></div><div>.=
/socflash.sh image-bmc image-bmc<br>ASPEED SOC Flash Utility v.1.22.08<br>W=
arning:<br>SoCflash utility is only for engineers to update the firmware in=
 lab,<br>it is not a commercialized software product,<br>ASPEED has not don=
e compatibility/reliability stress test for SoCflash.<br>Please do not use =
this utility for any mass production purpose.<br>Press y to continue if you=
 are agree ....<br>y<br>Find ASPEED Device 1a03:2000 on 7:0.0<br>MMIO Virtu=
al Address: abb9000<br>Relocate IO Base: b000<br>Found ASPEED Device 1a03:2=
500 rev. 41<br>Static Memory Controller Information:<br>CS0 Flash Type is S=
PI<br>CS1 Flash Type is SPI<br>CS2 Flash Type is SPI<br>CS3 Flash Type is N=
OR<br>CS4 Flash Type is NOR<br>Boot CS is 0<br>Option Information:<br>CS: 0=
<br>Flash Type: SPI<br>[Warning] Don&#39;t AC OFF or Reboot System During B=
MC Firmware Update!!<br>Find Flash Chip #1: 64MB SPI Flash<br>Backup Flash =
Chip O.K.<br>Update Flash Chip #1 O.K.<br>Update Flash Chip O.K.<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, Dec 6, 2022 at 4:39 PM Zev Weiss &lt;<a href=3D"mailto:zweiss@equini=
x.com" target=3D"_blank">zweiss@equinix.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Tue, Dec 06, 2022 at 11:27:47=
AM PST, Hamid Amirrad wrote:<br>
&gt;Hi,<br>
&gt;<br>
&gt;I see that the u-boot has been recently upgraded to 2019.04.<br>
&gt;I created the image as follows:<br>
&gt;1. Checked out the code<br>
&gt;2. . setup evb-ast2500<br>
&gt;3. time bitbake obmc-phosphor-image<br>
&gt;<br>
&gt;Then I copied the created image (bmc-image)<br>
&gt;from /trunk/build/evb-ast2500/tmp/deploy/images/evb-ast2500/obmc-phosph=
or-image-evb-ast2500-20221122160306.static.mtd.all.tar<br>
&gt;to my LC having BMC module. I used ./socflash.sh to upgrade the BMC ima=
ge<br>
&gt;to one just created. After upgrade is done, I still see the old u-boot<=
br>
&gt;version (below). Is this something else I need to do for the u-boot to =
be<br>
&gt;at revision 2019?<br>
&gt;<br>
&gt;ast# version<br>
&gt;<br>
&gt;U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)<br>
&gt;arm-openbmc-linux-gnueabi-gcc (GCC) 11.2.0<br>
&gt;GNU ld (GNU Binutils) 2.37.20210721<br>
&gt;<br>
&gt;I am using BMC simulator on another server and on that the u-boot revis=
ion<br>
&gt;is fine (below). Not sure why u-boot is not at 2019 when I compile the =
code<br>
&gt;directly.<br>
&gt;ast# version<br>
&gt;U-Boot 2019.04 (Nov 10 2022 - 00:12:58 +0000)<br>
&gt;<br>
&gt;arm-openbmc-linux-gnueabi-gcc (GCC) 12.2.0<br>
&gt;GNU ld (GNU Binutils) 2.39.0.20220819<br>
&gt;<br>
&gt;Any help would be greatly appreciated.<br>
&gt;<br>
&gt;Thanks,<br>
&gt;Hamid<br>
&gt;<br>
<br>
What OpenBMC commit are you building from?=C2=A0 It looks like evb-ast2500<=
br>
got updated to the newer u-boot branch in February:<br>
<a href=3D"https://github.com/openbmc/openbmc/commit/7d75b9b68370374db00e9c=
99b5406ebb6b18512f" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/openbmc/openbmc/commit/7d75b9b68370374db00e9c99b5406ebb6b18512f</a><br>
<br>
If the same image is showing the expected u-boot version in a simulator<br>
(qemu?), then it sounds like maybe your installation procedure isn&#39;t<br=
>
doing what you intended it to.=C2=A0 I don&#39;t know what the &#39;socflas=
h.sh&#39; you<br>
referred to above is; if you can boot into a reasonably healthy OpenBMC<br>
environment, I&#39;d suggest using the normal firmware-update mechanism.=C2=
=A0 If<br>
the existing firmware is something else or isn&#39;t working enough to boot=
<br>
normally you might need to resort to a hardware flash programmer or<br>
something (or if you can get your u-boot networking working at all, even<br=
>
at a slow speed, you could TFTP in an OpenBMC kernel/initrd, boot into<br>
that, and use flashcp to write the full OpenBMC image).<br>
<br>
<br>
Zev<br>
</blockquote></div>
</blockquote></div>

--00000000000094566005ef423267--
