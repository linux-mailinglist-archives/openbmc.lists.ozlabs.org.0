Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C4B415590
	for <lists+openbmc@lfdr.de>; Thu, 23 Sep 2021 04:50:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFKQc64tQz2ypL
	for <lists+openbmc@lfdr.de>; Thu, 23 Sep 2021 12:50:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qPYRCrH1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=jebr@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=qPYRCrH1; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFKQ91VLXz2yJ8
 for <openbmc@lists.ozlabs.org>; Thu, 23 Sep 2021 12:49:51 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id t10so20423749lfd.8
 for <openbmc@lists.ozlabs.org>; Wed, 22 Sep 2021 19:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uPoswZzwZIeVZwEKB6TldfyFS4V41ejOcTMja4bNb9M=;
 b=qPYRCrH15qijNppwaiuXGFFkNfAIAL9AXd6VmYrzmR1xr4lvn4r1ue0GVA3cgP1lJK
 wP03AOO0rhu/ziOzZG4k0EmpjgoRwMoG0FbOxyEEqtKGERDJxvbcpW2kYQV5VwUVGmNl
 NamcusparrVc36ry15o8+h1JceMCoC/pf6kXOZmf1aq1DAKaLdYgD4dwK1hSD+Cc6jY/
 EY5d5YcBDxI1VoszXOCtCRT/k8hhSS7OrxyYqAYM0OWDSCb1iSXCaG90oFkvWLKpo6Fz
 FyvT3qs/R6tPKgtuuwSPBe20WucUmvCo0hbTESWIYuD2xVYcY0ICBpSrBVcS2w4pwpoc
 0sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uPoswZzwZIeVZwEKB6TldfyFS4V41ejOcTMja4bNb9M=;
 b=cUrFR2Kn860Syc7o6EtKreXgaAdGsXFosNXTJn+zhWgAFuRK99datzRLLp1em4wK5P
 0z4hVEIRST9tijx6INyjm1BrT3MBMREBbna0x6+Q9J/v5qhN3jATbkYPS6YX/WujPgC4
 cBLz3GcGNQYYnuaaw/iuE2UkIffmvozhdXBhqM48MyozIOBP6aZ9Buj/gYQeTF8Tujpx
 6OnX59hfp75gBQkY+UTD7NwgpMOtM81W3EPYmJc5A8PSlh+1UN/7Dv+C2gkX3ydlwFuU
 xUUjr50Ju3W/U4+U9INN2EXpDS04pVvwPMW6b6NvSyEBaUSX+f6tx1VlK0F/nFhuxg6Z
 r8VA==
X-Gm-Message-State: AOAM533ZO/L7x53qaCISYiGUANwLQ9bSbM0IjWDa7m2bKsx6pt0ofGUv
 gdOIjIbaOlj/fvf1YTQq/OCqLnmFCDuAHIj2jVKwZA==
X-Google-Smtp-Source: ABdhPJyG4kDiekuHZyT62dJAtnFTsnObCawIaG9fUP9yFvOKdYr7PAF0vTP1AOKerC65uNxEb+Fe0wnhR0dwJIU8DXI=
X-Received: by 2002:a2e:7f0f:: with SMTP id a15mr2780813ljd.54.1632365382726; 
 Wed, 22 Sep 2021 19:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
 <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
 <CABoTLcRGjXV_QBnAv6J0+cZL9ahjjzLBai2ANJ-YkzYOi_aYJA@mail.gmail.com>
In-Reply-To: <CABoTLcRGjXV_QBnAv6J0+cZL9ahjjzLBai2ANJ-YkzYOi_aYJA@mail.gmail.com>
From: John Broadbent <jebr@google.com>
Date: Wed, 22 Sep 2021 19:49:31 -0700
Message-ID: <CAPw1Ef92SizTkeZtjno12yA0SUUrJEHmENk0YxpxtYszPJ62Ug@mail.gmail.com>
Subject: Re: New test for patches in openbmc/openbmc
To: Oskar Senft <osk@google.com>
Content-Type: multipart/alternative; boundary="000000000000c8bccc05cca0aed0"
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c8bccc05cca0aed0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am concerned this change will encourage both patches in private layers,
and forks of the entire project.

Oskar is right, patches should be temporary fixes, but I have worked
around, and some organizations never clean up their "temporary fixes".
Their engineers move from one fire to the next. I suppose, I would
prefer to see .patch files in openbmc meta layers rather than have the same
.patch file pushed to a private layer, or worse a fork of openbmc.

Where can I get some more context on why .patch files are disallowed from
open bmc meta layers?

I genuinely appreciate all their effort and hard work
the maintainer put in. They have always guided the community in the
right direction, but some more context for this decision might be helpful
for new people, such as myself.

Thank you
John Broadbent

On Wed, Sep 22, 2021 at 4:36 PM Oskar Senft <osk@google.com> wrote:

> Hi Alexander
>
> While I can understand your position, I think there's a bigger picture
> to consider. In my understanding Open Source works by individual /
> independent contributors providing their use cases, knowledge and
> experience by means of designs and source code to the world. Since
> there are many individuals trying to do different things and some
> people (maintainers) being the gatekeepers for what can be submitted,
> it of course often gets to a point where not everyone agrees.
>
> Trust me, I've been there. I had many occasions where I needed a new
> feature or a fix to satisfy project requirements and timelines and was
> not able to upstream it in the given time. I sometimes gave up, often
> found a different, "better" solution and many times worked with the
> community to find a solution that would be accepted upstream.
>
> While I agree that deadlines and requirements do not always allow to
> go the "everything upstream immediately" route, my experience has
> shown me that forks or patches are ultimately costing more than using
> clean upstream code, in particular if a device is to be supported for
> years through new versions of the upstream code.
>
> As an example, we've been using an i2c sensor chip that needs to be
> configured at runtime. Upstream support for that was (still is)
> missing. The patch to do that specifically for us was 1 line -
> literally. However, it's incredibly difficult to discover and
> understand this one line years later. Together with hwmon maintainers
> I've spent the last 2 weeks designing and implementing various
> versions of a generic solution that we hope can be used for other
> hwmon drivers. I understand that I'm in a fortunate position so I can
> spend that time. But I still need to justify to my manager and myself
> why it's worth it, which I believe I can.
>
> In my experience, having patches checked in is just that - a temporary
> patch - not a solution. From Oxford's dictionary: "to patch: treat
> someone's injuries or repair the damage to something, especially
> hastily" (I know there's also a definition of the noun in the realm of
> computing).
>
> So while I agree that not allowing patches is actually making things
> harder for some in the short term, I truly believe that it's going to
> make things better for everyone in the long term.
>
> Oskar.
>
> On Wed, Sep 22, 2021 at 5:03 AM Alexander Amelkin <a.amelkin@yadro.com>
> wrote:
> >
> > Hi Ed!
> >
> > Most patches you listed (at least those for YADRO) are
> > platform specific and no repository will accept them for
> > a general audience.
> >
> > No vendor, I'm confident, is willing to spend endless time
> > persuading maintainers to include vendor-specific or
> > platform-specific patches into their repositories.
> >
> > For instance,
> >
> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-for-=
boot-initiator-mailbox.patch
> > is there because our customers demand this feature and we failed
> > proving to openbmc maintainers that this is a needed feature
> > and not a "security threat" or something. We honestly tried for months.
> >
> > On the other hand,
> >
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-posit=
ion-support.patch
> > is strictly hardware-specific and is not needed as is for other
> > vendors or platforms, and we don't have time to make it a
> > generic solution. If we ever do have that time, we will surely
> > push the developed generic solution to the appropriate
> > repository.
> >
> > What you propose now will force vendors to move farther away
> > from upstream and create their own forks of openbmc where
> > they will not even try to upstream their changes and will just drift
> > farther and farther away.
> >
> > Is that what you really pursue or did I get your idea wrong?
> > So far it looks to me like a destructive decision.
> >
> > WBR, Alexander.
> >
> > 22.09.2021 01:35, Ed Tanous =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > A few new features have been merged into CI that will now disallow
> > > .patch files within most meta layers.  This is due to a significant
> > > number of them popping up in both reviews and in the repo itself,
> > > despite having documented rules to the contrary.  The hope here is to
> > > better codify our rules, and give very quick response to submitters
> > > about the right procedure so we can encourage getting patches in
> > > faster, and keep machines buildable against master.  As the patches
> > > state, meta-phosphor is still allowed to contain patch files as an
> > > escape hatch, if the community decides it's required.
> > >
> > > The patchsets in question are here:
> > > https://gerrit.openbmc-project.xyz/q/repotest
> > >
> > > And add some ability for us to make more of these expectations for
> > > meta layers codified in the future.
> > >
> > > The script itself is here:
> > >
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/scripts/run-=
repotest.sh
> > > and is runnable on any tree prior to submitting to CI.  We currently
> > > have the following patches in meta layers.
> > >
> > >
> meta-amd/meta-ethanolx/recipes-x86/chassis/x86-power-control/0001-Amd-pow=
er-control-modifications-for-EthanolX.patch
> > >
> meta-ampere/meta-common/recipes-devtools/mtd/mtd-utils/0001-flashcp-suppo=
rt-offset-option.patch
> > >
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0001-aspeed-scu-Sw=
itch-PWM-pin-to-GPIO-input-mode.patch
> > >
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0002-aspeed-Disabl=
e-internal-PD-resistors-for-GPIOs.patch
> > >
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspeed-suppor=
t-passing-system-reset-status-to-kernel.patch
> > >
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0004-aspeed-add-gp=
io-support.patch
> > >
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0005-aspeed-Enable=
-SPI-master-mode.patch
> > >
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0006-aspeed-suppor=
t-Mt.Jade-platform-init.patch
> > > meta-aspeed/recipes-bsp/u-boot/files/default-gcc.patch
> > >
> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0001-bytedanc=
e-g220a-Enable-ipmb.patch
> > >
> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0003-misc-asp=
eed-Add-Aspeed-UART-routing-control-driver.patch
> > >
> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0004-ARM-dts-=
aspeed-Add-uart-routing-node.patch
> > >
> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0005-ARM-dts-=
aspeed-Enable-g220a-uart-route.patch
> > >
> meta-bytedance/meta-g220a/recipes-phosphor/ipmi/phosphor-node-manager-pro=
xy/0001-Remove-Total_Power-sensor.patch
> > >
> meta-facebook/meta-bletchley/recipes-bsp/u-boot/u-boot-aspeed-sdk/0001-u-=
boot-ast2600-57600-baudrate-for-bletchley.patch
> > >
> meta-facebook/meta-tiogapass/recipes-bsp/u-boot/u-boot-aspeed/0001-config=
s-ast-common-use-57600-baud-rate-to-match-Tiog.patch
> > >
> meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0001-board=
-aspeed-Add-Mux-for-yosemitev2.patch
> > >
> meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0002-spl-h=
ost-console-handle.patch
> > >
> meta-google/dynamic-layers/nuvoton-layer/recipes-bsp/images/npcm7xx-igps/=
0001-Set-FIU0_DRD_CFG-and-FIU_Clk_divider-for-gbmc-hoth.patch
> > >
> meta-google/recipes-extended/libconfig/files/0001-conf2struct-Use-the-rig=
ht-perl.patch
> > >
> meta-google/recipes-extended/libconfig/files/0001-makefile-Add-missing-LD=
FLAGS.patch
> > >
> meta-google/recipes-phosphor/initrdscripts/obmc-phosphor-initfs/rwfs-clea=
n-dev.patch
> > >
> meta-ingrasys/meta-zaius/recipes-bsp/u-boot/u-boot-aspeed/0001-board-aspe=
ed-Add-reset_phy-for-Zaius.patch
> > >
> meta-nuvoton/recipes-bsp/images/npcm7xx-igps/0001-Adjust-paths-for-use-wi=
th-Bitbake.patch
> > >
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0001-Add-system-reset-sta=
tus-support.patch
> > >
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0002-config-ast-common-se=
t-fieldmode-to-true.patch
> > >
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0003-aspeed-add-gpio-supp=
ort.patch
> > >
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-posit=
ion-support.patch
> > >
> meta-yadro/meta-nicole/recipes-kernel/linux/linux-aspeed/0001-Add-NCSI-ch=
annel-selector.patch
> > >
> meta-yadro/meta-nicole/recipes-phosphor/host/op-proc-control/0001-Stop-an=
d-send-SRESET-for-one-thread-only.patch
> > >
> meta-yadro/recipes-phosphor/dbus/phosphor-dbus-interfaces/0001-Add-boot-i=
nitiator-mailbox-interface.patch
> > >
> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0001-Add-support-for-=
persistent-only-settings.patch
> > >
> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-for-=
boot-initiator-mailbox.patch
> > >
> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0003-Fix-version-pars=
ing-update-AUX-revision-info.patch
> > >
> > > If you are a maintainer of these meta layers, please work to get thes=
e
> > > patches submitted to the correct repositories using their prefered
> > > review (email for linux/u-boot, gerrit for phosphor repos).
> > >
> > > Thanks,
> > >
> > > -Ed
>

--000000000000c8bccc05cca0aed0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
M Oskar Senft &lt;<a href=3D"mailto:osk@google.com">osk@google.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Alexan=
der<br>
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

--000000000000c8bccc05cca0aed0--
