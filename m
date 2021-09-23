Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9431D41688B
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 01:39:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFs893lmXz2ywp
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 09:39:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=SjweXO9c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42c;
 helo=mail-wr1-x42c.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=SjweXO9c; dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFs7h48jyz2yMy
 for <openbmc@lists.ozlabs.org>; Fri, 24 Sep 2021 09:39:10 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id w29so21819430wra.8
 for <openbmc@lists.ozlabs.org>; Thu, 23 Sep 2021 16:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rabCoUFQerib6KkDb2egT1aPJoQfTpElzB1jm8yTL8o=;
 b=SjweXO9cKjgY2yTeeXxY1rREMTJ9F+Rf17woqgHA+826XvmcHFBIH5JAELzJPTS7OO
 TyIQYAwp0Q0Js8ZjR4wJSlUDeYiICo32Ax/AIntvC4Hz+kWpg1SnlpRmbHSQ1C0fneko
 lYz3AhiGJS117Y5qLmfIT/IukNmg8yiOyh7/XPCssZic4Y5+qKP8WoDjc6JT1NerT4xk
 kQBQWXaXUtjutxvjf8liyN0NxorAxXDJ9m7gC9r3kg7gmt9E3EmC73jd0I4zrCL/6+Lz
 EVXhZAqXGKCH+uiNChfENKAp3znGMB4YOEynjChFuRGFglYL8/2nZ39ZKokrM2NhypZ8
 jYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rabCoUFQerib6KkDb2egT1aPJoQfTpElzB1jm8yTL8o=;
 b=kYh0MQ9lBJCe6fjwfivfsSowr4LgVrdNOj6YRxE6NCkYaKVw2dheCwuZhKdigFulNZ
 ARHtJuN4dX098s3mk1/xjzeMAB4mKkKCHNq+UtY4MIA/Hy9xwT+kDcjvbBcG5SIsDmBS
 BuM6ZGBOe9+kUaNA3R7XVHLLeWn/TzdVR9xiqdMnsjfqt8oxE7NuLhkKGmoOvTTC7xuJ
 rWn61HeluS/7bOI+zWadh6nZQMCvSxkpYPenFfLwEcjSeyGhHsMcqUxstN7a4xCaCXmN
 hl6i0ntv0UsaY8g+58gLGK1CQdAh1leuU6N/WA8rHzBMPwsUrXHbziX17aO4IzOiHgb/
 QbxA==
X-Gm-Message-State: AOAM531g71M3e9jQnmiglKLgq3egYHbsvkM+BpbdgAiqO6KjuC+hq4UF
 1LF9H+xdOmCp7HtMa3AZ7tRXpECg8LC83/yv89nk1Q==
X-Google-Smtp-Source: ABdhPJxvO0Vzoa7uwASiv6Wda4fVtFhQbteSZPkwHHa6fVXxE/VOFuKiBbIEyDEujryr4PfNzG38KALboAxwktjZt/8=
X-Received: by 2002:a5d:6d8e:: with SMTP id l14mr8071311wrs.26.1632440341928; 
 Thu, 23 Sep 2021 16:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
 <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
In-Reply-To: <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 23 Sep 2021 16:38:50 -0700
Message-ID: <CAH2-KxDT9DTXp99d+eV-zNinLWhw9ihaHVLNQnVsQtB7X2ZkHQ@mail.gmail.com>
Subject: Re: New test for patches in openbmc/openbmc
To: Alexander Amelkin <a.amelkin@yadro.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 22, 2021 at 2:02 AM Alexander Amelkin <a.amelkin@yadro.com> wro=
te:
>
> Hi Ed!
>
> Most patches you listed (at least those for YADRO) are
> platform specific and no repository will accept them for
> a general audience.

Right off the bat, I can see that 5 of the Yardro patches are against
OpenBMC repositories.  If they're necessary, in line with OpenBMCs
goals, and maintainers aren't accepting them, why was this not brought
up sooner?  There are several avenues at your disposal now: discord,
mailing list, Technical oversight forum, Technical steering committee,
in that order, where we can discuss these things and come to a
consensus.  If the answer is "There is no way that you can enable your
platform to work" then raise it up to the next level, but I suspect
that wasn't the case.

The path we're going down would involve every system effectively
forking the internal codebase, which means that now we have N forks of
our own codebase for N systems, and it gets to be unmaintainable in a
hurry if any changes conflict.  As is, a number of our systems that we
"support" don't build on master, which somewhat proves the point that
it's unsustainable.

One minor thing that might prove my point is that I can't see to get
the nicole platform to build.  I'm not sure if that's related to the
patch files or not.
"error: comparison of integer expressions of different signedness:
'const unsigned int' and 'const int' [-Werror=3Dsign-compare]"

>
> No vendor, I'm confident, is willing to spend endless time
> persuading maintainers to include vendor-specific or
> platform-specific patches into their repositories.

Endless, no, but a number of companies have had success in getting
their patches and features upstreamed.  I'd like to hear more about
your experience, maybe with some specific examples (which I can see
below).

>
> For instance,
> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-for-=
boot-initiator-mailbox.patch
> is there because our customers demand this feature and we failed
> proving to openbmc maintainers that this is a needed feature
> and not a "security threat" or something. We honestly tried for months.

I wasn't part of those discussions, so I don't know the full details,
but I do know that we take security seriously.  Making some
assumptions for a second, if there's security consequences, and
security isn't in your list of "must haves" for your platform, maybe
something similar to the bmcweb-insecure-* compiler options that
require directly opting into the security consequences might be
warranted for your systems?  Was any sort of option flag discussed?
Did the maintainers propose an alternative to you?

>
> On the other hand,
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-posit=
ion-support.patch
> is strictly hardware-specific and is not needed as is for other
> vendors or platforms, and we don't have time to make it a
> generic solution. If we ever do have that time, we will surely
> push the developed generic solution to the appropriate
> repository.

The problem with this kind of thing is that it encourages companies to
not reuse these kinds of things, and we end up with duplicated copies
of patches across the meta layers.  There are ABSOLUTELY other systems
that use GPIO for determining node position, so it's really tough to
say that feature is "strictly hardware-specific".

>
> What you propose now will force vendors to move farther away
> from upstream and create their own forks of openbmc where
> they will not even try to upstream their changes and will just drift
> farther and farther away.
>
> Is that what you really pursue or did I get your idea wrong?
> So far it looks to me like a destructive decision.

This is not intended to be a destructive position, but to encourage
reuse of code, and upstreaming in a way that's sustainable and
reusable by others.  If the things we build aren't reusable, then to
some extent, what's the point of upstreaming it?

Keep in mind, the only new thing here is that CI is now enforcing
this.  It's been in the meta layer guidelines for some time, and has
been an unwritten guideline for some time prior to that.  If you
disagree with the policy, that's fine, let's discuss how to best keep
the project moving forward, and while I'm open to patch files being
necessary in some cases, IMO per-machine patch files don't get us the
maintainability we need in the long run.


>
> WBR, Alexander.
>
> 22.09.2021 01:35, Ed Tanous =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > A few new features have been merged into CI that will now disallow
> > .patch files within most meta layers.  This is due to a significant
> > number of them popping up in both reviews and in the repo itself,
> > despite having documented rules to the contrary.  The hope here is to
> > better codify our rules, and give very quick response to submitters
> > about the right procedure so we can encourage getting patches in
> > faster, and keep machines buildable against master.  As the patches
> > state, meta-phosphor is still allowed to contain patch files as an
> > escape hatch, if the community decides it's required.
> >
> > The patchsets in question are here:
> > https://gerrit.openbmc-project.xyz/q/repotest
> >
> > And add some ability for us to make more of these expectations for
> > meta layers codified in the future.
> >
> > The script itself is here:
> > https://github.com/openbmc/openbmc/blob/master/meta-phosphor/scripts/ru=
n-repotest.sh
> > and is runnable on any tree prior to submitting to CI.  We currently
> > have the following patches in meta layers.
> >
> > meta-amd/meta-ethanolx/recipes-x86/chassis/x86-power-control/0001-Amd-p=
ower-control-modifications-for-EthanolX.patch
> > meta-ampere/meta-common/recipes-devtools/mtd/mtd-utils/0001-flashcp-sup=
port-offset-option.patch
> > meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0001-aspeed-scu-=
Switch-PWM-pin-to-GPIO-input-mode.patch
> > meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0002-aspeed-Disa=
ble-internal-PD-resistors-for-GPIOs.patch
> > meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspeed-supp=
ort-passing-system-reset-status-to-kernel.patch
> > meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0004-aspeed-add-=
gpio-support.patch
> > meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0005-aspeed-Enab=
le-SPI-master-mode.patch
> > meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0006-aspeed-supp=
ort-Mt.Jade-platform-init.patch
> > meta-aspeed/recipes-bsp/u-boot/files/default-gcc.patch
> > meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0001-byteda=
nce-g220a-Enable-ipmb.patch
> > meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0003-misc-a=
speed-Add-Aspeed-UART-routing-control-driver.patch
> > meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0004-ARM-dt=
s-aspeed-Add-uart-routing-node.patch
> > meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0005-ARM-dt=
s-aspeed-Enable-g220a-uart-route.patch
> > meta-bytedance/meta-g220a/recipes-phosphor/ipmi/phosphor-node-manager-p=
roxy/0001-Remove-Total_Power-sensor.patch
> > meta-facebook/meta-bletchley/recipes-bsp/u-boot/u-boot-aspeed-sdk/0001-=
u-boot-ast2600-57600-baudrate-for-bletchley.patch
> > meta-facebook/meta-tiogapass/recipes-bsp/u-boot/u-boot-aspeed/0001-conf=
igs-ast-common-use-57600-baud-rate-to-match-Tiog.patch
> > meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0001-boa=
rd-aspeed-Add-Mux-for-yosemitev2.patch
> > meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0002-spl=
-host-console-handle.patch
> > meta-google/dynamic-layers/nuvoton-layer/recipes-bsp/images/npcm7xx-igp=
s/0001-Set-FIU0_DRD_CFG-and-FIU_Clk_divider-for-gbmc-hoth.patch
> > meta-google/recipes-extended/libconfig/files/0001-conf2struct-Use-the-r=
ight-perl.patch
> > meta-google/recipes-extended/libconfig/files/0001-makefile-Add-missing-=
LDFLAGS.patch
> > meta-google/recipes-phosphor/initrdscripts/obmc-phosphor-initfs/rwfs-cl=
ean-dev.patch
> > meta-ingrasys/meta-zaius/recipes-bsp/u-boot/u-boot-aspeed/0001-board-as=
peed-Add-reset_phy-for-Zaius.patch
> > meta-nuvoton/recipes-bsp/images/npcm7xx-igps/0001-Adjust-paths-for-use-=
with-Bitbake.patch
> > meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0001-Add-system-reset-s=
tatus-support.patch
> > meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0002-config-ast-common-=
set-fieldmode-to-true.patch
> > meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0003-aspeed-add-gpio-su=
pport.patch
> > meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-pos=
ition-support.patch
> > meta-yadro/meta-nicole/recipes-kernel/linux/linux-aspeed/0001-Add-NCSI-=
channel-selector.patch
> > meta-yadro/meta-nicole/recipes-phosphor/host/op-proc-control/0001-Stop-=
and-send-SRESET-for-one-thread-only.patch
> > meta-yadro/recipes-phosphor/dbus/phosphor-dbus-interfaces/0001-Add-boot=
-initiator-mailbox-interface.patch
> > meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0001-Add-support-fo=
r-persistent-only-settings.patch
> > meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-fo=
r-boot-initiator-mailbox.patch
> > meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0003-Fix-version-pa=
rsing-update-AUX-revision-info.patch
> >
> > If you are a maintainer of these meta layers, please work to get these
> > patches submitted to the correct repositories using their prefered
> > review (email for linux/u-boot, gerrit for phosphor repos).
> >
> > Thanks,
> >
> > -Ed
