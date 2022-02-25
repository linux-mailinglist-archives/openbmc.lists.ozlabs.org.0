Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DDC4C3A05
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 01:04:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4VQ45hKcz3Wtt
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 11:04:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4JgqPoFg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=zhangjian.3032@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=4JgqPoFg; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4VPf5nT9z2yJw
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 11:04:17 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id y24so6656671lfg.1
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 16:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:mime-version:date:message-id:subject:to;
 bh=FSu06LEl/BNpkuc2vQaiY5tLhjI9t5GTrFOhYeK/PiQ=;
 b=4JgqPoFgD5M/oDRNoPlzmxEKcVBDoAtVqNxyKqaHf0AZ5Tp5Redq9/9CIrKGGvmugN
 1+ysnhbs1qgRKmwaBbH6SJ3fj9rBBLJoe3+YHi92By7sbStaMZX6VJHgnXWx4kN6a2ak
 0eGbH9zlWKA/HcFD6wxQfwHAG+zzIjZG1jjB3hkieE/lytljm4Q8XCWmrSR3Jt1PXV2D
 vEa5L6uRAHBWDo+Qr9VeZr72dMSjMKGkw45MXNymd2Gd2N+PXkhZCegqwtVsClhv85/x
 LJTiu3nk+3tZ6ztkCyTH+Drg51gfqduVgBKO8HCvYM4QaEmQLUNhwsA+B0DK6j7c/Pu0
 iAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
 bh=FSu06LEl/BNpkuc2vQaiY5tLhjI9t5GTrFOhYeK/PiQ=;
 b=O57vy6HMcYsoaSl6Rarkohro3LUANlXAEGAwzBsz+f4elke6QUKpBzvkRjnMAeXZPR
 EnvIuv/AEQGQV6HrAcm9zK7BWSWn4R63RuKxUaScRilDImj+K17ULqoNFpzrHBjssiFu
 mdGP9IoYvhf6lWe05u20rvpArKa9C/N4/ThbJgfVnBxGmI0xmEQhaM4euKXNxhOciWwT
 gwzZ5PEYp8oIfbtkZi+eOGybfNlHSiXBNzPvk3X5+5jFTjyQfRjoMT6LTqx0dMOjSm3u
 4fdLsJGa1y81LHw7/bZMIJ0RuEhO9vltTKCdk8L0Usuurgdq8j+Jai5wquxP0R/+kdKe
 UoUA==
X-Gm-Message-State: AOAM530G5lFcH4ezlxudqcAhfS2e+tsrZzP2a6Ao4VPa6ihNnkgHGv9X
 I3pxEjhYxGURF1KuR2AcRBN/UgASBPhOcYOuNiLP1ev1lzk=
X-Google-Smtp-Source: ABdhPJwvgv6r2RKR4ttnXJHoN+rCsYRp+k8sJINy65HS+UrPQO9Qpa15PlWAmXWxKoGBJoIyAGuPXNJXf+JMBkX535c=
X-Received: by 2002:ac2:5dd7:0:b0:442:c0aa:ddc0 with SMTP id
 x23-20020ac25dd7000000b00442c0aaddc0mr3204213lfq.628.1645747452480; Thu, 24
 Feb 2022 16:04:12 -0800 (PST)
Received: from 349319672217 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Feb 2022 16:04:11 -0800
From: =?UTF-8?B?5byg5YGl?= <zhangjian.3032@bytedance.com>
Mime-Version: 1.0
Date: Thu, 24 Feb 2022 16:04:11 -0800
Message-ID: <CA+J-oUuv2+_xu-7pqTmnRLAgQkzdQ33zn4HMLrBuxgGPZ-xk+w@mail.gmail.com>
Subject: Help
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000004bec3f05d8cc70ae"
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

--0000000000004bec3f05d8cc70ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: openbmc-request@lists.ozlabs.org
Date: 2=E6=9C=8825=E6=97=A5 (=E5=91=A8=E4=BA=94) 05:00
Subject: [External] openbmc Digest, Vol 78, Issue 123
To: <openbmc@lists.ozlabs.org>
Send openbmc mailing list submissions toopenbmc@lists.ozlabs.orgTo
subscribe or unsubscribe via the World Wide Web, visit
https://lists.ozlabs.org/listinfo/openbmcor, via email, send a message with
subject or body 'help' toopenbmc-request@lists.ozlabs.orgYou can reach the
person managing the list atopenbmc-owner@lists.ozlabs.orgWhen replying,
please edit your Subject line so it is more specificthan "Re: Contents of
openbmc digest..."Today's Topics: 1. [u-boot, v2019.04-aspeed-openbmc 1/1]
fix compiling warnings for AST2600 A1 SPL (Jamin Lin) 2. [u-boot,
v2019.04-aspeed-openbmc 0/1] fix compiling warnings for AST2600 A1 SPL
(Jamin Lin) 3. Re: I3C Binding DSP0233 (Matt Johnston) 4. Re: New
u-boot-aspeed-sdk runs slow and cause wdt2 timeout on ast2500 (Joel
Stanley) 5. Re: [u-boot,v2019.04-aspeed-openbmc 1/1] fix compiling warnings
for AST2600 A1 SPL (Joel Stanley) 6. Re: Checking for network online
(Patrick Williams) 7. Re: [PATCH 1/2] pinctrl: aspeed: Enable pass-through
on GPIOE1 and GPIOE3 free (Bills, Jason
M)----------------------------------------------------------------------Mes=
sage:
1Date: Thu, 24 Feb 2022 16:11:21 +0800From: Jamin Lin To: , , Cc: ,
Subject: [u-boot, v2019.04-aspeed-openbmc 1/1] fix compiling warningsfor
AST2600 A1 SPLMessage-ID:
<20220224081121.10389-2-jamin_lin@aspeedtech.com>Content-Type:
text/plainremove duplicated defineSigned-off-by: Jamin Lin ---
include/configs/evb_ast2600a1_spl.h | 7 ------- 1 file changed, 7
deletions(-)diff --git a/include/configs/evb_ast2600a1_spl.h
b/include/configs/evb_ast2600a1_spl.hindex 655896b237..006cc4345b 100644---
a/include/configs/evb_ast2600a1_spl.h+++
b/include/configs/evb_ast2600a1_spl.h@@ -42,13 +42,6 @@ #endif #endif -/*
SPL */-#define CONFIG_SPL_TEXT_BASE0x00000000-#define
CONFIG_SPL_MAX_SIZE0x0000E800-#define CONFIG_SPL_STACK0x10010000-#define
CONFIG_SPL_BSS_START_ADDR0x90000000-#define
CONFIG_SPL_BSS_MAX_SIZE0x00100000- #define CONFIG_SUPPORT_EMMC_BOOT
#endif/* __CONFIG_H */-- 2.17.1------------------------------Message:
2Date: Thu, 24 Feb 2022 16:11:20 +0800From: Jamin Lin To: , , Cc: ,
Subject: [u-boot, v2019.04-aspeed-openbmc 0/1] fix compiling warningsfor
AST2600 A1 SPLMessage-ID:
<20220224081121.10389-1-jamin_lin@aspeedtech.com>Content-Type:
text/plainremove duplicated defineJamin Lin (1): fix compiling warnings for
AST2600 A1 SPL include/configs/evb_ast2600a1_spl.h | 7 ------- 1 file
changed, 7 deletions(-)-- 2.17.1------------------------------Message:
3Date: Thu, 24 Feb 2022 11:06:39 +0800From: Matt Johnston To: Rahul Kapoor
,"openbmc@lists.ozlabs.org" Subject: Re: I3C Binding DSP0233Message-ID:<
73c46f0b8b609edddad0e314ead38c9b9d72517e.camel@codeconstruct.com.au>Content=
-Type:
text/plain; charset=3D"UTF-8"On Wed, 2022-02-23 at 16:45 +0000, Rahul Kapoo=
r
wrote:> Hi,> ?> I would like to understand if OpenBMC project currently
supports MCTP over> I3C>
https://www.dmtf.org/sites/default/files/standards/documents/DSP0233_1.0.0.=
pdf>
? If not, are there plans to support it going forward? We are currently>
using Intel-BMC/libmctp for SMBus binding and plan to transition to in->
kernel MCTP in future.Hi Rahul,I'm not aware of any current work on
MCTP-over-I3C for OpenBMC or in-kernel.It could be added as another
in-kernel MCTP transport alongside the currentI2C net driver.I'm not sure
what the current status is for I3C drivers on BMC hardware.Kernel I3C will
only support Linux as an I3C Controller not Target, thoughthat would suit
many setups.Cheers,Matt------------------------------Message: 4Date: Thu,
24 Feb 2022 03:45:48 +0000From: Joel Stanley To: Lei Yu Cc: ChiaWei Wang ,
Troy Lee, Ryan Chen ,openbmc , tangyiwei.2022@bytedance.comSubject: Re: New
u-boot-aspeed-sdk runs slow and cause wdt2 timeout
onast2500Message-ID:Content-Type: text/plain; charset=3D"UTF-8"On Wed, 23 F=
eb
2022 at 10:02, Lei Yu wrote:>> > > > > Could you share us the boot log with
timestamps?> > > > > It would be nice to know the time elapsed at each
stage.> > > >> > > > Pasted to https://pastebin.com/emseqW6c> > > > It
contains two logs, the first one is good, and the second has the issue.> >>
> Working:> > [2022-02-23 02:47:03] U-Boot 2019.04 (Jan 24 2022 - 10:18:18
+0000)> > [2022-02-23 02:47:06] ## Loading kernel from FIT Image at
20100000 ...> > [2022-02-23 02:47:12] Starting kernel ...> >> > 3 + 6
seconds.> >> > broken:> > [2022-02-23 02:58:07] U-Boot 2019.04 (Feb 15 2022
- 07:22:14 +0000)> > [2022-02-23 02:58:12] ## Loading kernel from FIT Image
at 20100000 ...> > [2022-02-23 02:58:22] Starting kernel ...> >> > 5 + 10
seconds.> >> > Interesting that the pre-hashing part is also slower.> >> >
The old branch was based on v00.04.03. The new branch is based on
v00.04.09.> >> > I wonder if this is the cause:> >> > $ git diff
v00.04.03..v00.04.09 -- configs/evb-ast2500_defconfig> > diff --git
a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig> > index
9fcf55b05ebb..000ed3f90bdd 100644> > --- a/configs/evb-ast2500_defconfig> >
+++ b/configs/evb-ast2500_defconfig> > @@ -1,4 +1,5 @@> > CONFIG_ARM=3Dy> >
+CONFIG_SYS_DCACHE_OFF=3Dy> > CONFIG_ARCH_ASPEED=3Dy> >
CONFIG_SYS_TEXT_BASE=3D0x0> > CONFIG_SYS_MALLOC_F_LEN=3D0x2000> >> > Lei, c=
an
you re-test with CONFIG_SYS_DCACHE_OFF=3Dn ?> >>> Yiwei helped to test with
CONFIG_SYS_DCACHE_OFF=3Dn, and it works fine now.> So it seems we get the
root cause!I'm glad this worked. The bill is in the mail :)I would suggest
this is not the root cause. This is a workaround thatspeeds up booting
enough that you make it to linux, but if your kernelimage got a bit larger
(for example), it would take longer and theissue would show up again.To
properly fix the issue, we need to ensure the watchdog is serviced,as I
mentioned in my previous
email.Cheers,Joel------------------------------Message: 5Date: Thu, 24 Feb
2022 11:43:32 +0000From: Joel Stanley To: Jamin Lin Cc: OpenBMC Maillist ,
Andrew Jeffery, Troy Lee , Steven LeeSubject: Re:
[u-boot,v2019.04-aspeed-openbmc 1/1] fix compilingwarnings for AST2600 A1
SPLMessage-ID:Content-Type: text/plain; charset=3D"UTF-8"On Thu, 24 Feb 202=
2
at 08:11, Jamin Lin wrote:>> remove duplicated define>> Signed-off-by:
Jamin Lin > ---> include/configs/evb_ast2600a1_spl.h | 7 -------> 1 file
changed, 7 deletions(-)>> diff --git a/include/configs/evb_ast2600a1_spl.h
b/include/configs/evb_ast2600a1_spl.h> index 655896b237..006cc4345b 100644>
--- a/include/configs/evb_ast2600a1_spl.h> +++
b/include/configs/evb_ast2600a1_spl.h> @@ -42,13 +42,6 @@> #endif> #endif>>
-/* SPL */> -#define CONFIG_SPL_TEXT_BASE 0x00000000> -#define
CONFIG_SPL_MAX_SIZE 0x0000E800> -#define CONFIG_SPL_STACK 0x10010000>
-#define CONFIG_SPL_BSS_START_ADDR 0x90000000> -#define
CONFIG_SPL_BSS_MAX_SIZE 0x00100000A good cleanup. While we're here, can we
clean up the various ast2600config headers?There is a large diff between
the a0 and the a1 spl header. I know theA0 has a smaller SRAM. Are there
any other differences required?> -> #define CONFIG_SUPPORT_EMMC_BOOT>>
#endif /* __CONFIG_H */> --> 2.17.1>------------------------------Message:
6Date: Thu, 24 Feb 2022 14:09:11 -0600From: Patrick Williams To: Johnathan
Mantey Cc: Jiaqing Zhao , Lei Yu, Jeremy Kerr ,OpenBMC Maillist Subject:
Re: Checking for network onlineMessage-ID: Content-Type: text/plain;
charset=3D"us-ascii"On Wed, Feb 23, 2022 at 12:04:12PM -0800, Johnathan
Mantey wrote:> On 2/23/22 09:44, Jiaqing Zhao wrote:> > On 2022-02-23
21:48, Patrick Williams wrote:> >> On Wed, Feb 23, 2022 at 10:09:19AM
+0800, Jiaqing Zhao wrote:> There may be openbmc powered servers that do
use the distributed logging > provided by rsyslogd. If there are then
globally removing network-online > from the rsyslog service file is
undesirable. I consider the same to be > true of assigning a default
RequiredForOnline=3Dfalse.> > Based on the above, it's my opinion this is a
vendor based decision for > how to configure
rsyslog/systemd-networkd-wait-online.I agree we shouldn't enable this
globally, but that doesn't mean we can't adda simple PKGCONFIG that allows
it to be enabled/disabled as needed. That waywe only have the single
`PKGCONFIG:append` line in vendor layers and vendorsthat have a problem
with it can leave it same as upstream.-- Patrick Williams--------------
next part --------------A non-text attachment was scrubbed...Name:
signature.ascType: application/pgp-signatureSize: 833 bytesDesc: not
availableURL: ------------------------------Message: 7Date: Thu, 24 Feb
2022 14:03:48 -0700From: "Bills, Jason M" To: Joel Stanley , Andrew Jeffery
Cc: "openbmc@lists.ozlabs.org" Subject: Re: [PATCH 1/2] pinctrl: aspeed:
Enable pass-through onGPIOE1 and GPIOE3 freeMessage-ID: <
7d792cb4-9eaf-cbdc-d39c-72217d5ebcf8@linux.intel.com>Content-Type:
text/plain; charset=3DUTF-8; format=3DflowedOn 2/6/2022 11:45 PM, Joel Stan=
ley
wrote:> On Wed, 2 Feb 2022 at 22:49, Andrew Jeffery wrote:>>>>>>>> On Thu,
3 Feb 2022, at 06:29, Bills, Jason M wrote:>>> This change adds a
gpio_disable_free() implementation that checks>>> if the GPIO being freed
is GPIOE1 (33) or GPIOE3 (35) and will>>> re-enable the pass-through
mux.>>>> Okay. So trying to pull back from the implementation for a
moment:>>>> Perhaps we can view pass-through as a property on a pair of
GPIOs, rather than a mux state? I think it would be better if we could, for
instance, annotate this in the devicetree?>>>> If we did that I don't think
we're require this awkward and pin-specific implementation of the free
callback for GPIOs.>>>> If pass-through is enabled it puts constraints on
how the pins are used if they're requested as GPIOs, but we can add those
dynamic checks in the GPIO driver.>>>> Let me think about it some more.>>>>
Thanks for surfacing the patch.> > This is for the kernel, I assume.> >
Jason, you should send the patch to the upstream lists (use>
get_maintainers.pl) for review.Sorry for the delay. I found the right lists
with get_maintainers.pl. Should I send these patches to the upstream lists
as they are, or do they need to be tweaked?Thanks!-Jason> > Cheers,> >
JoelEnd of openbmc Digest, Vol 78, Issue
123****************************************

--0000000000004bec3f05d8cc70ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta></head><body><div style=3D"white-space:pre;white-space:pr=
e-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6"><br></div><div sty=
le=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;margin-bottom:4px=
;line-height:1.6">=20
</div><div style=3D"list-style-position:inside" id=3D"lark-mail-quote-16457=
4745"><div class=3D"adit-html-block ignore-collect adit-html-block--collaps=
ed"><div style=3D"width:100%;height:1px;margin-top:16px;padding-top:16px;bo=
rder-top-width:1px;border-top-style:solid;border-top-color:rgb(222,224,227)=
" id=3D"quote-divider-line"></div><div><div style=3D"color:rgb(143,149,158)=
" class=3D"adit-html-block__attr"><div id=3D"lark-mail-quote-01a1330915ca95=
4cf312cc124989e697"><div style=3D"padding-bottom:8px;word-break:break-word;=
color:#8f959e!important"><div style=3D"color:#8f959e!important"><span style=
=3D"color:#646a73">From: </span> <a style=3D"word-wrap:break-word;white-spa=
ce:pre-wrap;word-break:break-word;text-decoration:none;color:unset" href=3D=
"openbmc-request@lists.ozlabs.org">openbmc-request@lists.ozlabs.org</a></di=
v><div style=3D"color:#8f959e!important"><span style=3D"color:#646a73">Date=
: </span> 2=E6=9C=8825=E6=97=A5 (=E5=91=A8=E4=BA=94) 05:00</div><div style=
=3D"color:#8f959e!important"><span style=3D"color:#646a73">Subject: </span>=
 [External] openbmc Digest, Vol 78, Issue 123</div><div style=3D"color:#8f9=
59e!important"><span style=3D"color:#646a73">To: </span> <span style=3D"whi=
te-space:nowrap">&lt;<a style=3D"word-wrap:break-word;white-space:pre-wrap;=
word-break:break-word;text-decoration:none;color:unset" href=3D"mailto:open=
bmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>&gt;</span></div></div></=
div></div><div style=3D"margin-top:8px"><div style=3D"white-space:pre-wrap"=
><span>Send openbmc mailing list submissions toopenbmc@lists.ozlabs.orgTo s=
ubscribe or unsubscribe via the World Wide Web, visit<a href=3D"https://lis=
ts.ozlabs.org/listinfo/openbmcor" target=3D"_blank">https://lists.ozlabs.or=
g/listinfo/openbmcor</a>, via email, send a message with subject or body &#=
39;help&#39; toopenbmc-request@lists.ozlabs.orgYou can reach the person man=
aging the list atopenbmc-owner@lists.ozlabs.orgWhen replying, please edit y=
our Subject line so it is more specificthan &quot;Re: Contents of openbmc d=
igest...&quot;Today&#39;s Topics:   1. [u-boot, v2019.04-aspeed-openbmc 1/1=
] fix compiling warnings      for AST2600 A1 SPL (Jamin Lin)   2. [u-boot, =
v2019.04-aspeed-openbmc 0/1] fix compiling warnings      for AST2600 A1 SPL=
 (Jamin Lin)   3. Re: I3C Binding DSP0233 (Matt Johnston)   4. Re: New u-bo=
ot-aspeed-sdk runs slow and cause wdt2 timeout on      ast2500 (Joel Stanle=
y)   5. Re: [u-boot,v2019.04-aspeed-openbmc 1/1] fix compiling      warning=
s for AST2600 A1 SPL (Joel Stanley)   6. Re: Checking for network online (P=
atrick Williams)   7. Re: [PATCH 1/2] pinctrl: aspeed: Enable pass-through =
on      GPIOE1 and GPIOE3 free (Bills, Jason M)----------------------------=
------------------------------------------Message: 1Date: Thu, 24 Feb 2022 =
16:11:21 +0800From: Jamin Lin To: , , Cc: , Subject: [u-boot, v2019.04-aspe=
ed-openbmc 1/1] fix compiling warningsfor AST2600 A1 SPLMessage-ID: &lt;<a =
href=3D"mailto:20220224081121.10389-2-jamin_lin@aspeedtech.com" target=3D"_=
blank">20220224081121.10389-2-jamin_lin@aspeedtech.com</a>&gt;Content-Type:=
 text/plainremove duplicated defineSigned-off-by: Jamin Lin --- include/con=
figs/evb_ast2600a1_spl.h | 7 ------- 1 file changed, 7 deletions(-)diff --g=
it a/include/configs/evb_ast2600a1_spl.h b/include/configs/evb_ast2600a1_sp=
l.hindex 655896b237..006cc4345b 100644--- a/include/configs/evb_ast2600a1_s=
pl.h+++ b/include/configs/evb_ast2600a1_spl.h@@ -42,13 +42,6 @@ #endif #end=
if -/* SPL */-#define CONFIG_SPL_TEXT_BASE0x00000000-#define CONFIG_SPL_MAX=
_SIZE0x0000E800-#define CONFIG_SPL_STACK0x10010000-#define CONFIG_SPL_BSS_S=
TART_ADDR0x90000000-#define CONFIG_SPL_BSS_MAX_SIZE0x00100000- #define CONF=
IG_SUPPORT_EMMC_BOOT  #endif/* __CONFIG_H */-- 2.17.1----------------------=
--------Message: 2Date: Thu, 24 Feb 2022 16:11:20 +0800From: Jamin Lin To: =
, , Cc: , Subject: [u-boot, v2019.04-aspeed-openbmc 0/1] fix compiling warn=
ingsfor AST2600 A1 SPLMessage-ID: &lt;<a href=3D"mailto:20220224081121.1038=
9-1-jamin_lin@aspeedtech.com" target=3D"_blank">20220224081121.10389-1-jami=
n_lin@aspeedtech.com</a>&gt;Content-Type: text/plainremove duplicated defin=
eJamin Lin (1):  fix compiling warnings for AST2600 A1 SPL include/configs/=
evb_ast2600a1_spl.h | 7 ------- 1 file changed, 7 deletions(-)-- 2.17.1----=
--------------------------Message: 3Date: Thu, 24 Feb 2022 11:06:39 +0800Fr=
om: Matt Johnston To: Rahul Kapoor ,&quot;<a href=3D"mailto:openbmc@lists.o=
zlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&quot; Subject: Re=
: I3C Binding DSP0233Message-ID:&lt;<a href=3D"mailto:73c46f0b8b609edddad0e=
314ead38c9b9d72517e.camel@codeconstruct.com.au" target=3D"_blank">73c46f0b8=
b609edddad0e314ead38c9b9d72517e.camel@codeconstruct.com.au</a>&gt;Content-T=
ype: text/plain; charset=3D&quot;UTF-8&quot;On Wed, 2022-02-23 at 16:45 +00=
00, Rahul Kapoor wrote:&gt; Hi,&gt; ?&gt; I would like to understand if Ope=
nBMC project currently supports MCTP over&gt; I3C&gt; <a href=3D"https://ww=
w.dmtf.org/sites/default/files/standards/documents/DSP0233_1.0.0.pdf" targe=
t=3D"_blank">https://www.dmtf.org/sites/default/files/standards/documents/D=
SP0233_1.0.0.pdf</a>&gt; ? If not, are there plans to support it going forw=
ard? We are currently&gt; using Intel-BMC/libmctp for SMBus binding and pla=
n to transition to in-&gt; kernel MCTP in future.Hi Rahul,I&#39;m not aware=
 of any current work on MCTP-over-I3C for OpenBMC or in-kernel.It could be =
added as another in-kernel MCTP transport alongside the currentI2C net driv=
er.I&#39;m not sure what the current status is for I3C drivers on BMC hardw=
are.Kernel I3C will only support Linux as an I3C Controller not Target, tho=
ughthat would suit many setups.Cheers,Matt------------------------------Mes=
sage: 4Date: Thu, 24 Feb 2022 03:45:48 +0000From: Joel Stanley To: Lei Yu C=
c: ChiaWei Wang , Troy Lee,  Ryan Chen ,openbmc ,  tangyiwei.2022@bytedance=
.comSubject: Re: New u-boot-aspeed-sdk runs slow and cause wdt2 timeout ona=
st2500Message-ID:Content-Type: text/plain; charset=3D&quot;UTF-8&quot;On We=
d, 23 Feb 2022 at 10:02, Lei Yu  wrote:&gt;&gt; &gt; &gt; &gt; &gt; Could y=
ou share us the boot log with timestamps?&gt; &gt; &gt; &gt; &gt; It would =
be nice to know the time elapsed at each stage.&gt; &gt; &gt; &gt;&gt; &gt;=
 &gt; &gt; Pasted to <a href=3D"https://pastebin.com/emseqW6c" target=3D"_b=
lank">https://pastebin.com/emseqW6c</a>&gt; &gt; &gt; &gt; It contains two =
logs, the first one is good, and the second has the issue.&gt; &gt;&gt; &gt=
; Working:&gt; &gt; [2022-02-23 02:47:03] U-Boot 2019.04 (Jan 24 2022 - 10:=
18:18 +0000)&gt; &gt; [2022-02-23 02:47:06] ## Loading kernel from FIT Imag=
e at 20100000 ...&gt; &gt; [2022-02-23 02:47:12] Starting kernel ...&gt; &g=
t;&gt; &gt; 3 + 6 seconds.&gt; &gt;&gt; &gt; broken:&gt; &gt; [2022-02-23 0=
2:58:07] U-Boot 2019.04 (Feb 15 2022 - 07:22:14 +0000)&gt; &gt; [2022-02-23=
 02:58:12] ## Loading kernel from FIT Image at 20100000 ...&gt; &gt; [2022-=
02-23 02:58:22] Starting kernel ...&gt; &gt;&gt; &gt; 5 + 10 seconds.&gt; &=
gt;&gt; &gt; Interesting that the pre-hashing part is also slower.&gt; &gt;=
&gt; &gt; The old branch was based on v00.04.03. The new branch is based on=
 v00.04.09.&gt; &gt;&gt; &gt; I wonder if this is the cause:&gt; &gt;&gt; &=
gt; $ git diff  v00.04.03..v00.04.09 -- configs/evb-ast2500_defconfig&gt; &=
gt; diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defcon=
fig&gt; &gt; index 9fcf55b05ebb..000ed3f90bdd 100644&gt; &gt; --- a/configs=
/evb-ast2500_defconfig&gt; &gt; +++ b/configs/evb-ast2500_defconfig&gt; &gt=
; @@ -1,4 +1,5 @@&gt; &gt;  CONFIG_ARM=3Dy&gt; &gt; +CONFIG_SYS_DCACHE_OFF=
=3Dy&gt; &gt;  CONFIG_ARCH_ASPEED=3Dy&gt; &gt;  CONFIG_SYS_TEXT_BASE=3D0x0&=
gt; &gt;  CONFIG_SYS_MALLOC_F_LEN=3D0x2000&gt; &gt;&gt; &gt; Lei, can you r=
e-test with CONFIG_SYS_DCACHE_OFF=3Dn ?&gt; &gt;&gt;&gt; Yiwei helped to te=
st with CONFIG_SYS_DCACHE_OFF=3Dn, and it works fine now.&gt; So it seems w=
e get the root cause!I&#39;m glad this worked. The bill is in the mail :)I =
would suggest this is not the root cause. This is a workaround thatspeeds u=
p booting enough that you make it to linux, but if your kernelimage got a b=
it larger (for example), it would take longer and theissue would show up ag=
ain.To properly fix the issue, we need to ensure the watchdog is serviced,a=
s I mentioned in my previous email.Cheers,Joel-----------------------------=
-Message: 5Date: Thu, 24 Feb 2022 11:43:32 +0000From: Joel Stanley To: Jami=
n Lin Cc: OpenBMC Maillist , Andrew Jeffery,  Troy Lee , Steven LeeSubject:=
 Re: [u-boot,v2019.04-aspeed-openbmc 1/1] fix compilingwarnings for AST2600=
 A1 SPLMessage-ID:Content-Type: text/plain; charset=3D&quot;UTF-8&quot;On T=
hu, 24 Feb 2022 at 08:11, Jamin Lin  wrote:&gt;&gt; remove duplicated defin=
e&gt;&gt; Signed-off-by: Jamin Lin &gt; ---&gt;  include/configs/evb_ast260=
0a1_spl.h | 7 -------&gt;  1 file changed, 7 deletions(-)&gt;&gt; diff --gi=
t a/include/configs/evb_ast2600a1_spl.h b/include/configs/evb_ast2600a1_spl=
.h&gt; index 655896b237..006cc4345b 100644&gt; --- a/include/configs/evb_as=
t2600a1_spl.h&gt; +++ b/include/configs/evb_ast2600a1_spl.h&gt; @@ -42,13 +=
42,6 @@&gt;  #endif&gt;  #endif&gt;&gt; -/* SPL */&gt; -#define CONFIG_SPL_=
TEXT_BASE           0x00000000&gt; -#define CONFIG_SPL_MAX_SIZE            =
0x0000E800&gt; -#define CONFIG_SPL_STACK               0x10010000&gt; -#def=
ine CONFIG_SPL_BSS_START_ADDR      0x90000000&gt; -#define CONFIG_SPL_BSS_M=
AX_SIZE                0x00100000A good cleanup. While we&#39;re here, can =
we clean up the various ast2600config headers?There is a large diff between=
 the a0 and the a1 spl header. I know theA0 has a smaller SRAM. Are there a=
ny other differences required?&gt; -&gt;  #define CONFIG_SUPPORT_EMMC_BOOT&=
gt;&gt;  #endif /* __CONFIG_H */&gt; --&gt; 2.17.1&gt;---------------------=
---------Message: 6Date: Thu, 24 Feb 2022 14:09:11 -0600From: Patrick Willi=
ams To: Johnathan Mantey Cc: Jiaqing Zhao , Lei Yu, Jeremy Kerr ,OpenBMC Ma=
illist Subject: Re: Checking for network onlineMessage-ID: Content-Type: te=
xt/plain; charset=3D&quot;us-ascii&quot;On Wed, Feb 23, 2022 at 12:04:12PM =
-0800, Johnathan Mantey wrote:&gt; On 2/23/22 09:44, Jiaqing Zhao wrote:&gt=
; &gt; On 2022-02-23 21:48, Patrick Williams wrote:&gt; &gt;&gt; On Wed, Fe=
b 23, 2022 at 10:09:19AM +0800, Jiaqing Zhao wrote:&gt; There may be openbm=
c powered servers that do use the distributed logging &gt; provided by rsys=
logd. If there are then globally removing network-online &gt; from the rsys=
log service file is undesirable. I consider the same to be &gt; true of ass=
igning a default RequiredForOnline=3Dfalse.&gt; &gt; Based on the above, it=
&#39;s my opinion this is a vendor based decision for &gt; how to configure=
 rsyslog/systemd-networkd-wait-online.I agree we shouldn&#39;t enable this =
globally, but that doesn&#39;t mean we can&#39;t adda simple PKGCONFIG that=
 allows it to be enabled/disabled as needed.  That waywe only have the sing=
le `PKGCONFIG:append` line in vendor layers and vendorsthat have a problem =
with it can leave it same as upstream.-- Patrick Williams-------------- nex=
t part --------------A non-text attachment was scrubbed...Name: signature.a=
scType: application/pgp-signatureSize: 833 bytesDesc: not availableURL: ---=
---------------------------Message: 7Date: Thu, 24 Feb 2022 14:03:48 -0700F=
rom: &quot;Bills, Jason M&quot; To: Joel Stanley , Andrew Jeffery Cc: &quot=
;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@list=
s.ozlabs.org</a>&quot; Subject: Re: [PATCH 1/2] pinctrl: aspeed: Enable pas=
s-through onGPIOE1 and GPIOE3 freeMessage-ID: &lt;<a href=3D"mailto:7d792cb=
4-9eaf-cbdc-d39c-72217d5ebcf8@linux.intel.com" target=3D"_blank">7d792cb4-9=
eaf-cbdc-d39c-72217d5ebcf8@linux.intel.com</a>&gt;Content-Type: text/plain;=
 charset=3DUTF-8; format=3DflowedOn 2/6/2022 11:45 PM, Joel Stanley wrote:&=
gt; On Wed, 2 Feb 2022 at 22:49, Andrew Jeffery  wrote:&gt;&gt;&gt;&gt;&gt;=
&gt;&gt;&gt; On Thu, 3 Feb 2022, at 06:29, Bills, Jason M wrote:&gt;&gt;&gt=
; This change adds a gpio_disable_free() implementation that checks&gt;&gt;=
&gt; if the GPIO being freed is GPIOE1 (33) or GPIOE3 (35) and will&gt;&gt;=
&gt; re-enable the pass-through mux.&gt;&gt;&gt;&gt; Okay. So trying to pul=
l back from the implementation for a moment:&gt;&gt;&gt;&gt; Perhaps we can=
 view pass-through as a property on a pair of GPIOs, rather than a mux stat=
e? I think it would be better if we could, for instance, annotate this in t=
he devicetree?&gt;&gt;&gt;&gt; If we did that I don&#39;t think we&#39;re r=
equire this awkward and pin-specific implementation of the free callback fo=
r GPIOs.&gt;&gt;&gt;&gt; If pass-through is enabled it puts constraints on =
how the pins are used if they&#39;re requested as GPIOs, but we can add tho=
se dynamic checks in the GPIO driver.&gt;&gt;&gt;&gt; Let me think about it=
 some more.&gt;&gt;&gt;&gt; Thanks for surfacing the patch.&gt; &gt; This i=
s for the kernel, I assume.&gt; &gt; Jason, you should send the patch to th=
e upstream lists (use&gt; <a href=3D"get_maintainers.pl)" target=3D"_blank"=
>get_maintainers.pl)</a> for review.Sorry for the delay.  I found the right=
 lists with <a href=3D"get_maintainers.pl." target=3D"_blank">get_maintaine=
rs.pl.</a> Should I send these patches to the upstream lists as they are, o=
r do they need to be tweaked?Thanks!-Jason&gt; &gt; Cheers,&gt; &gt; JoelEn=
d of openbmc Digest, Vol 78, Issue 123*************************************=
***</span></div></div></div></div></div></body></html>

--0000000000004bec3f05d8cc70ae--
