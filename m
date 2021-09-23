Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 030E14168A3
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 01:58:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFsYp70rnz304n
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 09:58:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AFsqw0U1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=AFsqw0U1; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFsYN39B6z2yWG
 for <openbmc@lists.ozlabs.org>; Fri, 24 Sep 2021 09:57:58 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id t18so22084315wrb.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Sep 2021 16:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kIU9UKZ7tJNBrypqP3rGXz9Q+MXzjQvYDxFDeDuviqY=;
 b=AFsqw0U189wWxsRUTDon508vaLCe1/5HOUvzyJD42lYNyXKBgn5mBxbAA3jIR025kg
 tm986KRNou1QKpdtm4XupBVSEz+EckvNIIvZJcIEq/mfe9DznafKQjmeMYHdBJl1FWcx
 enrUuNZymBATB7TeX8jwG4tK8aQ7qEmyTQ5A58UuS6Balsn4jO4jhYXUV8cpdv4p8CuD
 ZVo57iJ6Xon7crLYqQmc/BRTv1gHs52nMmTDcn21qhHkuEAaiOUfWGkfNirEOD1ZnmY/
 S7KslgVhRPCfE8tm3KRfiyRcR8tRZgYHHdtIKG4ar3QwKrNlhdHmWIedH52iZJ/H+S70
 M5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kIU9UKZ7tJNBrypqP3rGXz9Q+MXzjQvYDxFDeDuviqY=;
 b=0AFMimj7RGAJ4ok79i1acZccZpBmwkerLX2WNKQklJ6CkIfYOTEUoRSkFLjlIjSUJ7
 3+IQX+MlFK3iud5C/0crvtRpWm6vmqLwSS5M/bzGcJ/bYwK+lwWdCmsXdvkUdOeOjqJ+
 IPFXpMDgx+uzy6uc6L7AwkV2cW2E53EM6XOS9oTUjPWtHbR7srFAtKJnC3VLbxhjCj67
 HEF5wgvBDSwEJSquCd/zsaYlaFwS1cizgAM3uhMUCt7CMW33qBOXCSk6G9V/JZOMXPuM
 Hn0thLXkX42YFHIBJGEc/K8W3ZkCe4tIPwJ4q0fT7Vapntq+Ab4T6EKm6hVBNojZV3Xw
 1HDw==
X-Gm-Message-State: AOAM531dGH8BCCUH35j7ZYueTdbuKBDV4ldBt1bw4+LG8QR8JtMegiku
 9PKQAY4BQBxvfRWeU3XlSYHFkX1F7EjUhhpjKqnMHg==
X-Google-Smtp-Source: ABdhPJxgI4dpCXuuw5gk/HTqfpHb7bIk/iFPQXnJsQcSFesRwq4UxtP1rQgdYrWBJxm+isIdvaCLOcYhIMGn71QeTfA=
X-Received: by 2002:a7b:c148:: with SMTP id z8mr8955982wmi.160.1632441473874; 
 Thu, 23 Sep 2021 16:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
 <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
 <CABoTLcRGjXV_QBnAv6J0+cZL9ahjjzLBai2ANJ-YkzYOi_aYJA@mail.gmail.com>
 <CAPw1Ef92SizTkeZtjno12yA0SUUrJEHmENk0YxpxtYszPJ62Ug@mail.gmail.com>
In-Reply-To: <CAPw1Ef92SizTkeZtjno12yA0SUUrJEHmENk0YxpxtYszPJ62Ug@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 23 Sep 2021 16:57:42 -0700
Message-ID: <CAH2-KxCCfujN3k31E77HzAT6pxsWdOeG=n5VjDH2ptM59A6+zA@mail.gmail.com>
Subject: Re: New test for patches in openbmc/openbmc
To: John Broadbent <jebr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 22, 2021 at 7:49 PM John Broadbent <jebr@google.com> wrote:
>
> I am concerned this change will encourage both patches in private layers,=
 and forks of the entire project.
>
> Oskar is right, patches should be temporary fixes, but I have worked arou=
nd, and some organizations never clean up their "temporary fixes". Their en=
gineers move from one fire to the next. I suppose, I would prefer to see .p=
atch files in openbmc meta layers rather than have the same .patch file pus=
hed to a private layer, or worse a fork of openbmc.

This is some of the conflict though, why should OpenBMC have to
maintain other companies' temporary fixes that they didn't find
important enough to clean up and make usable to others?  If the goal
is just to host it, there's a million places to host forks for free
these days.  I like to think getting patches upstreamed implies some
level of quality, some level of acceptance, and most importantly, the
idea that I can go and make any modifications to the code I need to
make to support my own OpenBMC.  Patches generally don't allow for
that.

>
> Where can I get some more context on why .patch files are disallowed from=
 open bmc meta layers?

#1 and #2 here:
https://github.com/openbmc/docs/blob/master/meta-layer-guidelines.md

>
> I genuinely appreciate all their effort and hard work the maintainer put =
in. They have always guided the community in the right direction, but some =
more context for this decision might be helpful for new people, such as mys=
elf.

There's no "decision" being made here, this is just making CI enforce
the things that are already written down.  If we wanted to change the
guidelines, we could, but that would be a different discussion,
ideally in a gerrit docs review proposing the change.  The initial
goal of this CI change was to reduce the turnaround time to getting
new platforms supported on OpenBMC.  The more things like that we can
codify in CI, the faster we can get patches merged to master.  With
that said, I like that it's causing some excellent discussions to
manifest.


Ps, Try to avoid top posting, it's less than desired on this list :)

>
> Thank you
> John Broadbent
>
> On Wed, Sep 22, 2021 at 4:36 PM Oskar Senft <osk@google.com> wrote:
>>
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
>> On Wed, Sep 22, 2021 at 5:03 AM Alexander Amelkin <a.amelkin@yadro.com> =
wrote:
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
>> > meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-f=
or-boot-initiator-mailbox.patch
>> > is there because our customers demand this feature and we failed
>> > proving to openbmc maintainers that this is a needed feature
>> > and not a "security threat" or something. We honestly tried for months=
.
>> >
>> > On the other hand,
>> > meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-po=
sition-support.patch
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
>> > > https://github.com/openbmc/openbmc/blob/master/meta-phosphor/scripts=
/run-repotest.sh
>> > > and is runnable on any tree prior to submitting to CI.  We currently
>> > > have the following patches in meta layers.
>> > >
>> > > meta-amd/meta-ethanolx/recipes-x86/chassis/x86-power-control/0001-Am=
d-power-control-modifications-for-EthanolX.patch
>> > > meta-ampere/meta-common/recipes-devtools/mtd/mtd-utils/0001-flashcp-=
support-offset-option.patch
>> > > meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0001-aspeed-s=
cu-Switch-PWM-pin-to-GPIO-input-mode.patch
>> > > meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0002-aspeed-D=
isable-internal-PD-resistors-for-GPIOs.patch
>> > > meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspeed-s=
upport-passing-system-reset-status-to-kernel.patch
>> > > meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0004-aspeed-a=
dd-gpio-support.patch
>> > > meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0005-aspeed-E=
nable-SPI-master-mode.patch
>> > > meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0006-aspeed-s=
upport-Mt.Jade-platform-init.patch
>> > > meta-aspeed/recipes-bsp/u-boot/files/default-gcc.patch
>> > > meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0001-byt=
edance-g220a-Enable-ipmb.patch
>> > > meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0003-mis=
c-aspeed-Add-Aspeed-UART-routing-control-driver.patch
>> > > meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0004-ARM=
-dts-aspeed-Add-uart-routing-node.patch
>> > > meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0005-ARM=
-dts-aspeed-Enable-g220a-uart-route.patch
>> > > meta-bytedance/meta-g220a/recipes-phosphor/ipmi/phosphor-node-manage=
r-proxy/0001-Remove-Total_Power-sensor.patch
>> > > meta-facebook/meta-bletchley/recipes-bsp/u-boot/u-boot-aspeed-sdk/00=
01-u-boot-ast2600-57600-baudrate-for-bletchley.patch
>> > > meta-facebook/meta-tiogapass/recipes-bsp/u-boot/u-boot-aspeed/0001-c=
onfigs-ast-common-use-57600-baud-rate-to-match-Tiog.patch
>> > > meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0001-=
board-aspeed-Add-Mux-for-yosemitev2.patch
>> > > meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0002-=
spl-host-console-handle.patch
>> > > meta-google/dynamic-layers/nuvoton-layer/recipes-bsp/images/npcm7xx-=
igps/0001-Set-FIU0_DRD_CFG-and-FIU_Clk_divider-for-gbmc-hoth.patch
>> > > meta-google/recipes-extended/libconfig/files/0001-conf2struct-Use-th=
e-right-perl.patch
>> > > meta-google/recipes-extended/libconfig/files/0001-makefile-Add-missi=
ng-LDFLAGS.patch
>> > > meta-google/recipes-phosphor/initrdscripts/obmc-phosphor-initfs/rwfs=
-clean-dev.patch
>> > > meta-ingrasys/meta-zaius/recipes-bsp/u-boot/u-boot-aspeed/0001-board=
-aspeed-Add-reset_phy-for-Zaius.patch
>> > > meta-nuvoton/recipes-bsp/images/npcm7xx-igps/0001-Adjust-paths-for-u=
se-with-Bitbake.patch
>> > > meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0001-Add-system-rese=
t-status-support.patch
>> > > meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0002-config-ast-comm=
on-set-fieldmode-to-true.patch
>> > > meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0003-aspeed-add-gpio=
-support.patch
>> > > meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-=
position-support.patch
>> > > meta-yadro/meta-nicole/recipes-kernel/linux/linux-aspeed/0001-Add-NC=
SI-channel-selector.patch
>> > > meta-yadro/meta-nicole/recipes-phosphor/host/op-proc-control/0001-St=
op-and-send-SRESET-for-one-thread-only.patch
>> > > meta-yadro/recipes-phosphor/dbus/phosphor-dbus-interfaces/0001-Add-b=
oot-initiator-mailbox-interface.patch
>> > > meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0001-Add-support=
-for-persistent-only-settings.patch
>> > > meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support=
-for-boot-initiator-mailbox.patch
>> > > meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0003-Fix-version=
-parsing-update-AUX-revision-info.patch
>> > >
>> > > If you are a maintainer of these meta layers, please work to get the=
se
>> > > patches submitted to the correct repositories using their prefered
>> > > review (email for linux/u-boot, gerrit for phosphor repos).
>> > >
>> > > Thanks,
>> > >
>> > > -Ed
