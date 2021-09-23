Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA374163F0
	for <lists+openbmc@lfdr.de>; Thu, 23 Sep 2021 19:10:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFhWc0vjqz2ywM
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 03:10:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=itRZ5XsR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d30;
 helo=mail-io1-xd30.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=itRZ5XsR; dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFhW71Y9yz2yn5
 for <openbmc@lists.ozlabs.org>; Fri, 24 Sep 2021 03:10:25 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id p80so8962293iod.10
 for <openbmc@lists.ozlabs.org>; Thu, 23 Sep 2021 10:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+RR/ODuPEB5cqo/ooKx53FTWUSzqXUMnjdJWbC6/30w=;
 b=itRZ5XsRCYZcCf/8/xsN7cV+sNLz+okFTyZw4JLjgxjVf/7caOQ1bvM9oR7iVJ2S29
 lM6IEPcB/4f60+Od9qotPEby69eLtIgG9VW3YjutrVmapNALzE9Y81zi+RH7L0EwdlVY
 Gr5TL0kp5zE+9iLb95X8KQ+SfTSqciKLETHGfz3OqmVWU796bR0xVGJJjfLTpzmR2E7p
 OHf5Uwr48jd+IR1WFK6hE97YGhl6skr52s0oqcbU0WpeqPLT5OF5aaTxRhkMqPAMcdbI
 CAReSvM2EWGyQfmv6AEZICA8wsO134tuz/K3LofVE0N8aSJLNEVEnt/tSvSyGGystrCu
 ywtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+RR/ODuPEB5cqo/ooKx53FTWUSzqXUMnjdJWbC6/30w=;
 b=qYyOQmcyxduttcN4fjToO0AWSf3RzdJ3+Aysfl0hMArLmfuqVhMXyB+tCleBSplTt/
 EvRkp3oWpCWZkUPWrqyiZOEzCLWrJ9BNlYJGA/uy7EN8D+3pEwG8ivv/ktsDebYCFpvC
 JC90MWF9slPaskpumHALBapEcBPOrIAZpZMW7fWoU0184kjLV9Ac+XpIgk64FXJfFweh
 Xzm1TeuyNvV/6J6yMRwXGWQgctNsnL/T6kyG380OTRESnjbrO/pIaBfdZr6OEIz6crXi
 wSIcIC5pWE/BH1Vsdx0k7EWKpa5YnG+cs09TpHZOllwFt+iDCH6hrP05gIri2XtmkLV7
 ivHw==
X-Gm-Message-State: AOAM531pVUdDw/KaEuozGYQvIUu4M7EMT6IYlIX0jqA3pVpxK1xiNcfe
 6odmGLx+VOzEjZuHArmWAXd6lwpXM25HACkzr5quXg==
X-Google-Smtp-Source: ABdhPJwEm3BdPQcOqBavK+2aQrIrLXu1XJvDpaopA+gObvSVcw27FluLK1IjU5EYe3LIhAQm5LHOeiXIqUgQDTQnDfA=
X-Received: by 2002:a05:6602:340a:: with SMTP id
 n10mr4806100ioz.188.1632417018677; 
 Thu, 23 Sep 2021 10:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
 <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
 <CABoTLcRGjXV_QBnAv6J0+cZL9ahjjzLBai2ANJ-YkzYOi_aYJA@mail.gmail.com>
 <CAPw1Ef92SizTkeZtjno12yA0SUUrJEHmENk0YxpxtYszPJ62Ug@mail.gmail.com>
In-Reply-To: <CAPw1Ef92SizTkeZtjno12yA0SUUrJEHmENk0YxpxtYszPJ62Ug@mail.gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Thu, 23 Sep 2021 10:09:40 -0700
Message-ID: <CADKL2t7aP5QG9WdH0OZ6CtxSrN-qAA5kb-Dip9=N3Pv-iZyQdQ@mail.gmail.com>
Subject: Re: New test for patches in openbmc/openbmc
To: John Broadbent <jebr@google.com>
Content-Type: multipart/alternative; boundary="00000000000086905605ccacb4d3"
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
Cc: Ed Tanous <edtanous@google.com>, Alexander Amelkin <a.amelkin@yadro.com>,
 Oskar Senft <osk@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000086905605ccacb4d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This policy isn't new, just this automatic enforcement. It was reviewed in
February: https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/40294

There's also a detailed explanation of the rationale for each guideline in
that document.

I'd like to point out that some of the patches listed in the original email
are against non-OpenBMC projects, which is allowed in some situations by my
understanding of the guidelines.

On Wed, 22 Sept 2021 at 19:50, John Broadbent <jebr@google.com> wrote:

> I am concerned this change will encourage both patches in private layers,
> and forks of the entire project.
>
> Oskar is right, patches should be temporary fixes, but I have worked
> around, and some organizations never clean up their "temporary fixes".
> Their engineers move from one fire to the next. I suppose, I would
> prefer to see .patch files in openbmc meta layers rather than have the sa=
me
> .patch file pushed to a private layer, or worse a fork of openbmc.
>
> Where can I get some more context on why .patch files are disallowed from
> open bmc meta layers?
>
> I genuinely appreciate all their effort and hard work
> the maintainer put in. They have always guided the community in the
> right direction, but some more context for this decision might be helpful
> for new people, such as myself.
>
> Thank you
> John Broadbent
>
> On Wed, Sep 22, 2021 at 4:36 PM Oskar Senft <osk@google.com> wrote:
>
>> Hi Alexander
>>
>> While I can understand your position, I think there's a bigger picture
>> to consider. In my understanding Open Source works by individual /
>> independent contributors providing their use cases, knowledge and
>> experience by means of designs and source code to the world. Since
>> there are many individuals trying to do different things and some
>> people (maintainers) being the gatekeepers for what can be submitted,
>> it of course often gets to a point where not everyone agrees.
>>
>> Trust me, I've been there. I had many occasions where I needed a new
>> feature or a fix to satisfy project requirements and timelines and was
>> not able to upstream it in the given time. I sometimes gave up, often
>> found a different, "better" solution and many times worked with the
>> community to find a solution that would be accepted upstream.
>>
>> While I agree that deadlines and requirements do not always allow to
>> go the "everything upstream immediately" route, my experience has
>> shown me that forks or patches are ultimately costing more than using
>> clean upstream code, in particular if a device is to be supported for
>> years through new versions of the upstream code.
>>
>> As an example, we've been using an i2c sensor chip that needs to be
>> configured at runtime. Upstream support for that was (still is)
>> missing. The patch to do that specifically for us was 1 line -
>> literally. However, it's incredibly difficult to discover and
>> understand this one line years later. Together with hwmon maintainers
>> I've spent the last 2 weeks designing and implementing various
>> versions of a generic solution that we hope can be used for other
>> hwmon drivers. I understand that I'm in a fortunate position so I can
>> spend that time. But I still need to justify to my manager and myself
>> why it's worth it, which I believe I can.
>>
>> In my experience, having patches checked in is just that - a temporary
>> patch - not a solution. From Oxford's dictionary: "to patch: treat
>> someone's injuries or repair the damage to something, especially
>> hastily" (I know there's also a definition of the noun in the realm of
>> computing).
>>
>> So while I agree that not allowing patches is actually making things
>> harder for some in the short term, I truly believe that it's going to
>> make things better for everyone in the long term.
>>
>> Oskar.
>>
>> On Wed, Sep 22, 2021 at 5:03 AM Alexander Amelkin <a.amelkin@yadro.com>
>> wrote:
>> >
>> > Hi Ed!
>> >
>> > Most patches you listed (at least those for YADRO) are
>> > platform specific and no repository will accept them for
>> > a general audience.
>> >
>> > No vendor, I'm confident, is willing to spend endless time
>> > persuading maintainers to include vendor-specific or
>> > platform-specific patches into their repositories.
>> >
>> > For instance,
>> >
>> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-for=
-boot-initiator-mailbox.patch
>> > is there because our customers demand this feature and we failed
>> > proving to openbmc maintainers that this is a needed feature
>> > and not a "security threat" or something. We honestly tried for months=
.
>> >
>> > On the other hand,
>> >
>> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-posi=
tion-support.patch
>> > is strictly hardware-specific and is not needed as is for other
>> > vendors or platforms, and we don't have time to make it a
>> > generic solution. If we ever do have that time, we will surely
>> > push the developed generic solution to the appropriate
>> > repository.
>> >
>> > What you propose now will force vendors to move farther away
>> > from upstream and create their own forks of openbmc where
>> > they will not even try to upstream their changes and will just drift
>> > farther and farther away.
>> >
>> > Is that what you really pursue or did I get your idea wrong?
>> > So far it looks to me like a destructive decision.
>> >
>> > WBR, Alexander.
>> >
>> > 22.09.2021 01:35, Ed Tanous =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> > > A few new features have been merged into CI that will now disallow
>> > > .patch files within most meta layers.  This is due to a significant
>> > > number of them popping up in both reviews and in the repo itself,
>> > > despite having documented rules to the contrary.  The hope here is t=
o
>> > > better codify our rules, and give very quick response to submitters
>> > > about the right procedure so we can encourage getting patches in
>> > > faster, and keep machines buildable against master.  As the patches
>> > > state, meta-phosphor is still allowed to contain patch files as an
>> > > escape hatch, if the community decides it's required.
>> > >
>> > > The patchsets in question are here:
>> > > https://gerrit.openbmc-project.xyz/q/repotest
>> > >
>> > > And add some ability for us to make more of these expectations for
>> > > meta layers codified in the future.
>> > >
>> > > The script itself is here:
>> > >
>> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/scripts/run=
-repotest.sh
>> > > and is runnable on any tree prior to submitting to CI.  We currently
>> > > have the following patches in meta layers.
>> > >
>> > >
>> meta-amd/meta-ethanolx/recipes-x86/chassis/x86-power-control/0001-Amd-po=
wer-control-modifications-for-EthanolX.patch
>> > >
>> meta-ampere/meta-common/recipes-devtools/mtd/mtd-utils/0001-flashcp-supp=
ort-offset-option.patch
>> > >
>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0001-aspeed-scu-S=
witch-PWM-pin-to-GPIO-input-mode.patch
>> > >
>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0002-aspeed-Disab=
le-internal-PD-resistors-for-GPIOs.patch
>> > >
>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspeed-suppo=
rt-passing-system-reset-status-to-kernel.patch
>> > >
>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0004-aspeed-add-g=
pio-support.patch
>> > >
>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0005-aspeed-Enabl=
e-SPI-master-mode.patch
>> > >
>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0006-aspeed-suppo=
rt-Mt.Jade-platform-init.patch
>> > > meta-aspeed/recipes-bsp/u-boot/files/default-gcc.patch
>> > >
>> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0001-bytedan=
ce-g220a-Enable-ipmb.patch
>> > >
>> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0003-misc-as=
peed-Add-Aspeed-UART-routing-control-driver.patch
>> > >
>> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0004-ARM-dts=
-aspeed-Add-uart-routing-node.patch
>> > >
>> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0005-ARM-dts=
-aspeed-Enable-g220a-uart-route.patch
>> > >
>> meta-bytedance/meta-g220a/recipes-phosphor/ipmi/phosphor-node-manager-pr=
oxy/0001-Remove-Total_Power-sensor.patch
>> > >
>> meta-facebook/meta-bletchley/recipes-bsp/u-boot/u-boot-aspeed-sdk/0001-u=
-boot-ast2600-57600-baudrate-for-bletchley.patch
>> > >
>> meta-facebook/meta-tiogapass/recipes-bsp/u-boot/u-boot-aspeed/0001-confi=
gs-ast-common-use-57600-baud-rate-to-match-Tiog.patch
>> > >
>> meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0001-boar=
d-aspeed-Add-Mux-for-yosemitev2.patch
>> > >
>> meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0002-spl-=
host-console-handle.patch
>> > >
>> meta-google/dynamic-layers/nuvoton-layer/recipes-bsp/images/npcm7xx-igps=
/0001-Set-FIU0_DRD_CFG-and-FIU_Clk_divider-for-gbmc-hoth.patch
>> > >
>> meta-google/recipes-extended/libconfig/files/0001-conf2struct-Use-the-ri=
ght-perl.patch
>> > >
>> meta-google/recipes-extended/libconfig/files/0001-makefile-Add-missing-L=
DFLAGS.patch
>> > >
>> meta-google/recipes-phosphor/initrdscripts/obmc-phosphor-initfs/rwfs-cle=
an-dev.patch
>> > >
>> meta-ingrasys/meta-zaius/recipes-bsp/u-boot/u-boot-aspeed/0001-board-asp=
eed-Add-reset_phy-for-Zaius.patch
>> > >
>> meta-nuvoton/recipes-bsp/images/npcm7xx-igps/0001-Adjust-paths-for-use-w=
ith-Bitbake.patch
>> > >
>> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0001-Add-system-reset-st=
atus-support.patch
>> > >
>> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0002-config-ast-common-s=
et-fieldmode-to-true.patch
>> > >
>> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0003-aspeed-add-gpio-sup=
port.patch
>> > >
>> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-posi=
tion-support.patch
>> > >
>> meta-yadro/meta-nicole/recipes-kernel/linux/linux-aspeed/0001-Add-NCSI-c=
hannel-selector.patch
>> > >
>> meta-yadro/meta-nicole/recipes-phosphor/host/op-proc-control/0001-Stop-a=
nd-send-SRESET-for-one-thread-only.patch
>> > >
>> meta-yadro/recipes-phosphor/dbus/phosphor-dbus-interfaces/0001-Add-boot-=
initiator-mailbox-interface.patch
>> > >
>> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0001-Add-support-for=
-persistent-only-settings.patch
>> > >
>> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-for=
-boot-initiator-mailbox.patch
>> > >
>> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0003-Fix-version-par=
sing-update-AUX-revision-info.patch
>> > >
>> > > If you are a maintainer of these meta layers, please work to get the=
se
>> > > patches submitted to the correct repositories using their prefered
>> > > review (email for linux/u-boot, gerrit for phosphor repos).
>> > >
>> > > Thanks,
>> > >
>> > > -Ed
>>
>

--00000000000086905605ccacb4d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This policy isn&#39;t new, just this automatic enforcement=
. It was reviewed in February:=C2=A0<a href=3D"https://gerrit.openbmc-proje=
ct.xyz/c/openbmc/docs/+/40294">https://gerrit.openbmc-project.xyz/c/openbmc=
/docs/+/40294</a><div><br></div><div>There&#39;s also a detailed explanatio=
n of the rationale for each guideline in that document.</div><div><br></div=
><div>I&#39;d like to point out that some of the patches listed in the orig=
inal email are against non-OpenBMC projects, which is allowed in some situa=
tions by my understanding of the guidelines.</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 22 Sept 2021 at 1=
9:50, John Broadbent &lt;<a href=3D"mailto:jebr@google.com">jebr@google.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div>I am concerned this change will encourage both patche=
s=C2=A0in private layers, and forks of the entire project.</div><div><br></=
div><div>Oskar is right, patches should be temporary=C2=A0fixes, but I have=
 worked around, and some organizations=C2=A0never clean up their &quot;temp=
orary fixes&quot;. Their engineers move from one fire to the next. I suppos=
e, I would prefer=C2=A0to see .patch files in openbmc meta layers rather th=
an have the same .patch file pushed to a private layer, or worse a fork of =
openbmc.</div><div><br></div><div>Where can I get some more=C2=A0context on=
 why .patch files are disallowed from open bmc meta layers?</div><div><br><=
/div><div>I genuinely appreciate=C2=A0all their effort and hard=C2=A0work t=
he=C2=A0maintainer=C2=A0put=C2=A0in. They have always guided the community=
=C2=A0in the right=C2=A0direction, but some more context for this decision =
might be helpful for new people, such as myself.=C2=A0</div><div><br></div>=
<div>Thank you</div><div>John Broadbent</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 22, 2021 at 4:36 P=
M Oskar Senft &lt;<a href=3D"mailto:osk@google.com" target=3D"_blank">osk@g=
oogle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Alexander<br>
<br>
While I can understand your position, I think there&#39;s a bigger picture<=
br>
to consider. In my understanding Open Source works by individual /<br>
independent contributors providing their use cases, knowledge and<br>
experience by means of designs and source code to the world. Since<br>
there are many individuals trying to do different things and some<br>
people (maintainers) being the gatekeepers for what can be submitted,<br>
it of course often gets to a point where not everyone agrees.<br>
<br>
Trust me, I&#39;ve been there. I had many occasions where I needed a new<br=
>
feature or a fix to satisfy project requirements and timelines and was<br>
not able to upstream it in the given time. I sometimes gave up, often<br>
found a different, &quot;better&quot; solution and many times worked with t=
he<br>
community to find a solution that would be accepted upstream.<br>
<br>
While I agree that deadlines and requirements do not always allow to<br>
go the &quot;everything upstream immediately&quot; route, my experience has=
<br>
shown me that forks or patches are ultimately costing more than using<br>
clean upstream code, in particular if a device is to be supported for<br>
years through new versions of the upstream code.<br>
<br>
As an example, we&#39;ve been using an i2c sensor chip that needs to be<br>
configured at runtime. Upstream support for that was (still is)<br>
missing. The patch to do that specifically for us was 1 line -<br>
literally. However, it&#39;s incredibly difficult to discover and<br>
understand this one line years later. Together with hwmon maintainers<br>
I&#39;ve spent the last 2 weeks designing and implementing various<br>
versions of a generic solution that we hope can be used for other<br>
hwmon drivers. I understand that I&#39;m in a fortunate position so I can<b=
r>
spend that time. But I still need to justify to my manager and myself<br>
why it&#39;s worth it, which I believe I can.<br>
<br>
In my experience, having patches checked in is just that - a temporary<br>
patch - not a solution. From Oxford&#39;s dictionary: &quot;to patch: treat=
<br>
someone&#39;s injuries or repair the damage to something, especially<br>
hastily&quot; (I know there&#39;s also a definition of the noun in the real=
m of<br>
computing).<br>
<br>
So while I agree that not allowing patches is actually making things<br>
harder for some in the short term, I truly believe that it&#39;s going to<b=
r>
make things better for everyone in the long term.<br>
<br>
Oskar.<br>
<br>
On Wed, Sep 22, 2021 at 5:03 AM Alexander Amelkin &lt;<a href=3D"mailto:a.a=
melkin@yadro.com" target=3D"_blank">a.amelkin@yadro.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Ed!<br>
&gt;<br>
&gt; Most patches you listed (at least those for YADRO) are<br>
&gt; platform specific and no repository will accept them for<br>
&gt; a general audience.<br>
&gt;<br>
&gt; No vendor, I&#39;m confident, is willing to spend endless time<br>
&gt; persuading maintainers to include vendor-specific or<br>
&gt; platform-specific patches into their repositories.<br>
&gt;<br>
&gt; For instance,<br>
&gt; meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-f=
or-boot-initiator-mailbox.patch<br>
&gt; is there because our customers demand this feature and we failed<br>
&gt; proving to openbmc maintainers that this is a needed feature<br>
&gt; and not a &quot;security threat&quot; or something. We honestly tried =
for months.<br>
&gt;<br>
&gt; On the other hand,<br>
&gt; meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-po=
sition-support.patch<br>
&gt; is strictly hardware-specific and is not needed as is for other<br>
&gt; vendors or platforms, and we don&#39;t have time to make it a<br>
&gt; generic solution. If we ever do have that time, we will surely<br>
&gt; push the developed generic solution to the appropriate<br>
&gt; repository.<br>
&gt;<br>
&gt; What you propose now will force vendors to move farther away<br>
&gt; from upstream and create their own forks of openbmc where<br>
&gt; they will not even try to upstream their changes and will just drift<b=
r>
&gt; farther and farther away.<br>
&gt;<br>
&gt; Is that what you really pursue or did I get your idea wrong?<br>
&gt; So far it looks to me like a destructive decision.<br>
&gt;<br>
&gt; WBR, Alexander.<br>
&gt;<br>
&gt; 22.09.2021 01:35, Ed Tanous =D0=BF=D0=B8=D1=88=D0=B5=D1=82:<br>
&gt; &gt; A few new features have been merged into CI that will now disallo=
w<br>
&gt; &gt; .patch files within most meta layers.=C2=A0 This is due to a sign=
ificant<br>
&gt; &gt; number of them popping up in both reviews and in the repo itself,=
<br>
&gt; &gt; despite having documented rules to the contrary.=C2=A0 The hope h=
ere is to<br>
&gt; &gt; better codify our rules, and give very quick response to submitte=
rs<br>
&gt; &gt; about the right procedure so we can encourage getting patches in<=
br>
&gt; &gt; faster, and keep machines buildable against master.=C2=A0 As the =
patches<br>
&gt; &gt; state, meta-phosphor is still allowed to contain patch files as a=
n<br>
&gt; &gt; escape hatch, if the community decides it&#39;s required.<br>
&gt; &gt;<br>
&gt; &gt; The patchsets in question are here:<br>
&gt; &gt; <a href=3D"https://gerrit.openbmc-project.xyz/q/repotest" rel=3D"=
noreferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz/q/repotest=
</a><br>
&gt; &gt;<br>
&gt; &gt; And add some ability for us to make more of these expectations fo=
r<br>
&gt; &gt; meta layers codified in the future.<br>
&gt; &gt;<br>
&gt; &gt; The script itself is here:<br>
&gt; &gt; <a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-ph=
osphor/scripts/run-repotest.sh" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/openbmc/openbmc/blob/master/meta-phosphor/scripts/run-repotest=
.sh</a><br>
&gt; &gt; and is runnable on any tree prior to submitting to CI.=C2=A0 We c=
urrently<br>
&gt; &gt; have the following patches in meta layers.<br>
&gt; &gt;<br>
&gt; &gt; meta-amd/meta-ethanolx/recipes-x86/chassis/x86-power-control/0001=
-Amd-power-control-modifications-for-EthanolX.patch<br>
&gt; &gt; meta-ampere/meta-common/recipes-devtools/mtd/mtd-utils/0001-flash=
cp-support-offset-option.patch<br>
&gt; &gt; meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0001-aspee=
d-scu-Switch-PWM-pin-to-GPIO-input-mode.patch<br>
&gt; &gt; meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0002-aspee=
d-Disable-internal-PD-resistors-for-GPIOs.patch<br>
&gt; &gt; meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspee=
d-support-passing-system-reset-status-to-kernel.patch<br>
&gt; &gt; meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0004-aspee=
d-add-gpio-support.patch<br>
&gt; &gt; meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0005-aspee=
d-Enable-SPI-master-mode.patch<br>
&gt; &gt; meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0006-aspee=
d-support-Mt.Jade-platform-init.patch<br>
&gt; &gt; meta-aspeed/recipes-bsp/u-boot/files/default-gcc.patch<br>
&gt; &gt; meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0001-=
bytedance-g220a-Enable-ipmb.patch<br>
&gt; &gt; meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0003-=
misc-aspeed-Add-Aspeed-UART-routing-control-driver.patch<br>
&gt; &gt; meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0004-=
ARM-dts-aspeed-Add-uart-routing-node.patch<br>
&gt; &gt; meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0005-=
ARM-dts-aspeed-Enable-g220a-uart-route.patch<br>
&gt; &gt; meta-bytedance/meta-g220a/recipes-phosphor/ipmi/phosphor-node-man=
ager-proxy/0001-Remove-Total_Power-sensor.patch<br>
&gt; &gt; meta-facebook/meta-bletchley/recipes-bsp/u-boot/u-boot-aspeed-sdk=
/0001-u-boot-ast2600-57600-baudrate-for-bletchley.patch<br>
&gt; &gt; meta-facebook/meta-tiogapass/recipes-bsp/u-boot/u-boot-aspeed/000=
1-configs-ast-common-use-57600-baud-rate-to-match-Tiog.patch<br>
&gt; &gt; meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/00=
01-board-aspeed-Add-Mux-for-yosemitev2.patch<br>
&gt; &gt; meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/00=
02-spl-host-console-handle.patch<br>
&gt; &gt; meta-google/dynamic-layers/nuvoton-layer/recipes-bsp/images/npcm7=
xx-igps/0001-Set-FIU0_DRD_CFG-and-FIU_Clk_divider-for-gbmc-hoth.patch<br>
&gt; &gt; meta-google/recipes-extended/libconfig/files/0001-conf2struct-Use=
-the-right-perl.patch<br>
&gt; &gt; meta-google/recipes-extended/libconfig/files/0001-makefile-Add-mi=
ssing-LDFLAGS.patch<br>
&gt; &gt; meta-google/recipes-phosphor/initrdscripts/obmc-phosphor-initfs/r=
wfs-clean-dev.patch<br>
&gt; &gt; meta-ingrasys/meta-zaius/recipes-bsp/u-boot/u-boot-aspeed/0001-bo=
ard-aspeed-Add-reset_phy-for-Zaius.patch<br>
&gt; &gt; meta-nuvoton/recipes-bsp/images/npcm7xx-igps/0001-Adjust-paths-fo=
r-use-with-Bitbake.patch<br>
&gt; &gt; meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0001-Add-system-r=
eset-status-support.patch<br>
&gt; &gt; meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0002-config-ast-c=
ommon-set-fieldmode-to-true.patch<br>
&gt; &gt; meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0003-aspeed-add-g=
pio-support.patch<br>
&gt; &gt; meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-b=
mc-position-support.patch<br>
&gt; &gt; meta-yadro/meta-nicole/recipes-kernel/linux/linux-aspeed/0001-Add=
-NCSI-channel-selector.patch<br>
&gt; &gt; meta-yadro/meta-nicole/recipes-phosphor/host/op-proc-control/0001=
-Stop-and-send-SRESET-for-one-thread-only.patch<br>
&gt; &gt; meta-yadro/recipes-phosphor/dbus/phosphor-dbus-interfaces/0001-Ad=
d-boot-initiator-mailbox-interface.patch<br>
&gt; &gt; meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0001-Add-supp=
ort-for-persistent-only-settings.patch<br>
&gt; &gt; meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-supp=
ort-for-boot-initiator-mailbox.patch<br>
&gt; &gt; meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0003-Fix-vers=
ion-parsing-update-AUX-revision-info.patch<br>
&gt; &gt;<br>
&gt; &gt; If you are a maintainer of these meta layers, please work to get =
these<br>
&gt; &gt; patches submitted to the correct repositories using their prefere=
d<br>
&gt; &gt; review (email for linux/u-boot, gerrit for phosphor repos).<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt;<br>
&gt; &gt; -Ed<br>
</blockquote></div>
</blockquote></div>

--00000000000086905605ccacb4d3--
