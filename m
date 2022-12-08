Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE6964D726
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 08:16:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXk7N6rwWz3bN7
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 18:16:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qanur/0T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=amirradh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qanur/0T;
	dkim-atps=neutral
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NScRf0bmkz3bZm
	for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2022 01:46:36 +1100 (AEDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1445ca00781so2076076fac.1
        for <openbmc@lists.ozlabs.org>; Thu, 08 Dec 2022 06:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eF8s8Q8nN1DYK7h0uAUSzWYBcrLBTknHwrcAQ0lBB48=;
        b=Qanur/0T3PO3JRMycDaG9if3HxZzV+TkM33KDetryqITTMweKBYVNe3OZTmd+R0hVh
         ifgCScghXSQ6VDGnPS++oXZ/WHc14k9w8cUx+An+41JFhTSbwlh4NLTLMbhnyZcGGoCu
         wc6hgEXTpfQrEIKHiA5EGRYVzUQFOR6TgIaGLh/xGSy3RYbnaUOOPWo8MT/DE4OPjhuv
         lqZOOS1JEqYxM7XBfr3hFegO4pDFQT5rpWM0MvrueQw9vdQdLrAFkykQq4lH1KejkE/2
         FHL5FrN4UNJCNeclBhK2jGdwiRYsQkIVo5cD+OAiSw/8wfJxGFExYRJmjkVSkAdmi8G9
         owug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eF8s8Q8nN1DYK7h0uAUSzWYBcrLBTknHwrcAQ0lBB48=;
        b=q0xtxTWgKbrDx6dgXpmmyVvmULm7rUu7BWgMhjEn9DKTBdQaiuBG/LCjSvRule7RfE
         IqQnWWkYuBEDi/4EYW2MjMwHcRHitT6RFeDQqYnGd9hA7ltKodBBP17z6GPhAg24PhLw
         H9Peb8mIr5rlqeBv/0W2jUMjG37t7ysKP9CE6tIW+XK3oAzI+rpZyK7+CYCJLx2++Mh8
         UH/e6gsFvFCO5rtzaGByZKsnQTKxE5pskWYHQBoYpJten8FpNqw4J78FumdIAEnTk1lU
         93bx8WTOqbKNDsNbvjuqfJDJxm9dksDQL5tnd74AXKFueeLsTb7e0QU5NyZiRx1quU2J
         G50Q==
X-Gm-Message-State: ANoB5plmI881qHjxEaVIvuXwfeXewTw4qvRGDP/CaAeIUgla89Ktv3AF
	HFJkKUth3jyR6F8EwXn4KVsFvIJZUSNTrSGjCuQ=
X-Google-Smtp-Source: AA0mqf78R/A6Jt/+ZMWPnY2u6X/YV6ayCYVKKejmOQafi9S+CSGNyXfeIFZh5dacmNKhuChEDtCzW5PYQvIUtodqZRA=
X-Received: by 2002:a05:6870:bd49:b0:13b:8835:a774 with SMTP id
 og9-20020a056870bd4900b0013b8835a774mr41250427oab.260.1670510792174; Thu, 08
 Dec 2022 06:46:32 -0800 (PST)
MIME-Version: 1.0
References: <CACFAz8BpHQUROFcpG3+dG3XyUt0+8=zgcwkU4CTk3uuO0Z2c_w@mail.gmail.com>
 <20221204234449.GG18848@packtop> <CACFAz8CO7sm6TXCct35kOH-mWZOAj=UHuRisgw3rSpawRxr9jQ@mail.gmail.com>
 <20221206213941.GH18848@packtop> <CACFAz8CXpJ-HR9RDB4DPCH5y-=kuRgwd3r_p7b7sA5CyQjty=A@mail.gmail.com>
 <CACFAz8AspVJxBnp2k+aC=M3tANYp=QCUeEPZBmAQ7aC2YUb2Rg@mail.gmail.com>
In-Reply-To: <CACFAz8AspVJxBnp2k+aC=M3tANYp=QCUeEPZBmAQ7aC2YUb2Rg@mail.gmail.com>
From: Hamid Amirrad <amirradh@gmail.com>
Date: Thu, 8 Dec 2022 09:46:18 -0500
Message-ID: <CACFAz8DhGibXxPNKOh+WCEEPQtmSQk27Rw0oC-sTt7OpqUcAaw@mail.gmail.com>
Subject: Re: Changing ethernet port speed
To: Zev Weiss <zweiss@equinix.com>
Content-Type: multipart/alternative; boundary="0000000000005c6f8605ef521a40"
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

--0000000000005c6f8605ef521a40
Content-Type: text/plain; charset="UTF-8"

Hi Zeb,

I found a default username/password (root:0penBmc). I can log in to my
newly installed image. The only thing that confuses me is that on the qemu
simulator, I have the following interface
ast#

When I type (?), it shows me all the available commands such as (version,
setenv, printenv, etc). Also no password is required to login.

With the new image that I compiled from the github and installed on my BMC
Module, I have the following interface:
root@evb-ast2500:~#

When I type (?), it doesn't work and I have a whole different available
commands (mostly from linux). Also need password to login.

Is this expected?

Thanks alot,
Hamid

On Wed, Dec 7, 2022 at 2:47 PM Hamid Amirrad <amirradh@gmail.com> wrote:

> Hi Zev,
>
> I might have installed it correctly this time (still have to confirm).
> However, I get the following, cant find any details about username
> password. where can I find it?
> evb-ast2500 login:
>
> Thanks,
> Hamid
>
> On Wed, Dec 7, 2022 at 12:53 PM Hamid Amirrad <amirradh@gmail.com> wrote:
>
>> Hi Zev,
>>
>> I am checking out the code from: https://github.com/openbmc/openbmc
>> Revision I am building from is 15231.
>>
>> sockflash.sh output is below for upgrading:
>>
>> ./socflash.sh image-bmc image-bmc
>> ASPEED SOC Flash Utility v.1.22.08
>> Warning:
>> SoCflash utility is only for engineers to update the firmware in lab,
>> it is not a commercialized software product,
>> ASPEED has not done compatibility/reliability stress test for SoCflash.
>> Please do not use this utility for any mass production purpose.
>> Press y to continue if you are agree ....
>> y
>> Find ASPEED Device 1a03:2000 on 7:0.0
>> MMIO Virtual Address: abb9000
>> Relocate IO Base: b000
>> Found ASPEED Device 1a03:2500 rev. 41
>> Static Memory Controller Information:
>> CS0 Flash Type is SPI
>> CS1 Flash Type is SPI
>> CS2 Flash Type is SPI
>> CS3 Flash Type is NOR
>> CS4 Flash Type is NOR
>> Boot CS is 0
>> Option Information:
>> CS: 0
>> Flash Type: SPI
>> [Warning] Don't AC OFF or Reboot System During BMC Firmware Update!!
>> Find Flash Chip #1: 64MB SPI Flash
>> Backup Flash Chip O.K.
>> Update Flash Chip #1 O.K.
>> Update Flash Chip O.K.
>>
>> On Tue, Dec 6, 2022 at 4:39 PM Zev Weiss <zweiss@equinix.com> wrote:
>>
>>> On Tue, Dec 06, 2022 at 11:27:47AM PST, Hamid Amirrad wrote:
>>> >Hi,
>>> >
>>> >I see that the u-boot has been recently upgraded to 2019.04.
>>> >I created the image as follows:
>>> >1. Checked out the code
>>> >2. . setup evb-ast2500
>>> >3. time bitbake obmc-phosphor-image
>>> >
>>> >Then I copied the created image (bmc-image)
>>> >from
>>> /trunk/build/evb-ast2500/tmp/deploy/images/evb-ast2500/obmc-phosphor-image-evb-ast2500-20221122160306.static.mtd.all.tar
>>> >to my LC having BMC module. I used ./socflash.sh to upgrade the BMC
>>> image
>>> >to one just created. After upgrade is done, I still see the old u-boot
>>> >version (below). Is this something else I need to do for the u-boot to
>>> be
>>> >at revision 2019?
>>> >
>>> >ast# version
>>> >
>>> >U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)
>>> >arm-openbmc-linux-gnueabi-gcc (GCC) 11.2.0
>>> >GNU ld (GNU Binutils) 2.37.20210721
>>> >
>>> >I am using BMC simulator on another server and on that the u-boot
>>> revision
>>> >is fine (below). Not sure why u-boot is not at 2019 when I compile the
>>> code
>>> >directly.
>>> >ast# version
>>> >U-Boot 2019.04 (Nov 10 2022 - 00:12:58 +0000)
>>> >
>>> >arm-openbmc-linux-gnueabi-gcc (GCC) 12.2.0
>>> >GNU ld (GNU Binutils) 2.39.0.20220819
>>> >
>>> >Any help would be greatly appreciated.
>>> >
>>> >Thanks,
>>> >Hamid
>>> >
>>>
>>> What OpenBMC commit are you building from?  It looks like evb-ast2500
>>> got updated to the newer u-boot branch in February:
>>>
>>> https://github.com/openbmc/openbmc/commit/7d75b9b68370374db00e9c99b5406ebb6b18512f
>>>
>>> If the same image is showing the expected u-boot version in a simulator
>>> (qemu?), then it sounds like maybe your installation procedure isn't
>>> doing what you intended it to.  I don't know what the 'socflash.sh' you
>>> referred to above is; if you can boot into a reasonably healthy OpenBMC
>>> environment, I'd suggest using the normal firmware-update mechanism.  If
>>> the existing firmware is something else or isn't working enough to boot
>>> normally you might need to resort to a hardware flash programmer or
>>> something (or if you can get your u-boot networking working at all, even
>>> at a slow speed, you could TFTP in an OpenBMC kernel/initrd, boot into
>>> that, and use flashcp to write the full OpenBMC image).
>>>
>>>
>>> Zev
>>>
>>

--0000000000005c6f8605ef521a40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Zeb,<div><br></div><div>I found a default username/pass=
word (root:0penBmc). I can log in to my newly installed image. The only thi=
ng that confuses me is that on the qemu simulator, I have the following int=
erface</div><div>ast#=C2=A0=C2=A0<br></div><div><br></div><div>When I type =
(?), it shows me all the available commands such as (version, setenv, print=
env, etc). Also no password is required to login.</div><div><br></div><div>=
With the new image that I compiled from the github and installed on my BMC =
Module, I have the following interface:</div><div>root@evb-ast2500:~#<br></=
div><div><br></div><div>When I type (?), it doesn&#39;t work and I have a w=
hole different available commands (mostly from linux). Also need password t=
o login.</div><div><br></div><div>Is this expected?</div><div><br></div><di=
v>Thanks alot,</div><div>Hamid</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 7, 2022 at 2:47 PM Hamid Am=
irrad &lt;<a href=3D"mailto:amirradh@gmail.com">amirradh@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">Hi=C2=A0Zev,<div><br></div><div>I might have installed it correctl=
y this time (still have to confirm). However, I get the following, cant fin=
d any details about username password. where can I find it?</div><div>evb-a=
st2500 login:<br></div><div><br></div><div>Thanks,</div><div>Hamid</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Dec 7, 2022 at 12:53 PM Hamid Amirrad &lt;<a href=3D"mailto:amirradh@g=
mail.com" target=3D"_blank">amirradh@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Zev,<div>=
<br></div><div>I am checking out the code from:=C2=A0<a href=3D"https://git=
hub.com/openbmc/openbmc" target=3D"_blank">https://github.com/openbmc/openb=
mc</a></div><div>Revision I am building=C2=A0from is=C2=A015231.</div><div>=
<br></div><div>sockflash.sh output is below for upgrading:</div><div><br></=
div><div>./socflash.sh image-bmc image-bmc<br>ASPEED SOC Flash Utility v.1.=
22.08<br>Warning:<br>SoCflash utility is only for engineers to update the f=
irmware in lab,<br>it is not a commercialized software product,<br>ASPEED h=
as not done compatibility/reliability stress test for SoCflash.<br>Please d=
o not use this utility for any mass production purpose.<br>Press y to conti=
nue if you are agree ....<br>y<br>Find ASPEED Device 1a03:2000 on 7:0.0<br>=
MMIO Virtual Address: abb9000<br>Relocate IO Base: b000<br>Found ASPEED Dev=
ice 1a03:2500 rev. 41<br>Static Memory Controller Information:<br>CS0 Flash=
 Type is SPI<br>CS1 Flash Type is SPI<br>CS2 Flash Type is SPI<br>CS3 Flash=
 Type is NOR<br>CS4 Flash Type is NOR<br>Boot CS is 0<br>Option Information=
:<br>CS: 0<br>Flash Type: SPI<br>[Warning] Don&#39;t AC OFF or Reboot Syste=
m During BMC Firmware Update!!<br>Find Flash Chip #1: 64MB SPI Flash<br>Bac=
kup Flash Chip O.K.<br>Update Flash Chip #1 O.K.<br>Update Flash Chip O.K.<=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, Dec 6, 2022 at 4:39 PM Zev Weiss &lt;<a href=3D"mailto:zwe=
iss@equinix.com" target=3D"_blank">zweiss@equinix.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Dec 06, 2022 a=
t 11:27:47AM PST, Hamid Amirrad wrote:<br>
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
</blockquote></div>

--0000000000005c6f8605ef521a40--
