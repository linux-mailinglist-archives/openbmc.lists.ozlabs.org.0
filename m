Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BD2419954
	for <lists+openbmc@lfdr.de>; Mon, 27 Sep 2021 18:39:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJ7ds3xJRz2yP3
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 02:39:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kgJSVs5H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=kgJSVs5H; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJ7dS2S3Jz2xYL
 for <openbmc@lists.ozlabs.org>; Tue, 28 Sep 2021 02:39:22 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id x20so8360178wrg.10
 for <openbmc@lists.ozlabs.org>; Mon, 27 Sep 2021 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3MgogY73e8X03RaafvQ+jZHmSx5mEx9ix9JkFvpGO8M=;
 b=kgJSVs5H1d9d6bXYp+7tG5+pXg3EMOD08tDCYnRPECD4GyG8j8RjiXxrGL0cvehDiN
 dW+GxO0U4Tv5mvsGvqoUO/6Ues4NZSMWrE6ZpJuHUsLUA90PNWjf90NpvBBgsJtlKp0N
 6IZMkGGpgbbKC252xr3VlcgN8UQJFtEMkFKrpokroJlkvsPafcQDSoHBeUuJiq5X2B8z
 eF+fS3SRbO+YCGbyu05q0R+Qiy5zKjBUX02JBL+WnGPMUSKtOIm008dOgVHMlRlgpBWp
 oaP3lwT+FF0hR/uY8Tq0NwuEVaKdl1W//3xnNZJ0MMO6tMNBLT1ZL/naOBnce0gw3mLv
 iqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3MgogY73e8X03RaafvQ+jZHmSx5mEx9ix9JkFvpGO8M=;
 b=E+y8eTt+QKIm/OYKaSKkYMKCzrsYn1o0QhfNrzeqBH7/zSnP0m865PF0kdQbrPTubM
 Vuw00zwEVr0sZ7GrW+9eKEwPxBOP+6wJGTFR7TXjpinKhRKugmbjkV/9m+ppN9u+eUKA
 rPA08juRF6gAQnH31NLyQrat6p1keV8Zk/j8meqACXft874Ta7AJK2ir66iMSyxR6PKX
 M96R/P66zNQqTNu6eFg8u5dwTqrS2qD0IdX+rjId0JxVER86shEnHomuZ0IDpYnfkbUp
 IEAXuYZTltqgMPnVR35YCS4hwyd06pnVtjdyVzP6tygx4ZNAh6Ha4QsPYpGoKpUT1n+J
 g7kg==
X-Gm-Message-State: AOAM5321ltw6jQmWVe9nc3D0UKHYNquiQA3W8dgSeJaSssDprqARUexe
 Pj1ICIS7ny1lt/jGh0HowGF58mGI8mj1R79DVM6liPSYEakW+8ox
X-Google-Smtp-Source: ABdhPJweSt3+dCz4/+/D0NFKYnqaIr+nBMc5w9+b8BouxRK1Ghzx6UIv5l7eKhBZJtsnRMXHB5QmKAhAtXgTBnXy/3Q=
X-Received: by 2002:adf:bc4f:: with SMTP id a15mr549323wrh.105.1632760757875; 
 Mon, 27 Sep 2021 09:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
 <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
 <CAH2-KxDT9DTXp99d+eV-zNinLWhw9ihaHVLNQnVsQtB7X2ZkHQ@mail.gmail.com>
 <a40d7b9c-8fb1-bf5c-1c31-3b426c0f0fa2@amperemail.onmicrosoft.com>
In-Reply-To: <a40d7b9c-8fb1-bf5c-1c31-3b426c0f0fa2@amperemail.onmicrosoft.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 27 Sep 2021 09:39:06 -0700
Message-ID: <CAH2-KxBPt-7wQQags7F28n_YfH=xp2Th9M5+i-0jbZT=Sm1YFQ@mail.gmail.com>
Subject: Re: New test for patches in openbmc/openbmc
To: Thang Nguyen <thang@amperemail.onmicrosoft.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 24, 2021 at 3:29 AM Thang Nguyen
<thang@amperemail.onmicrosoft.com> wrote:
>
> Hi Ed,
> I have 2 questions on this topics:
> 1. I have a patch
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspeed-suppor=
t-passing-system-reset-status-to-kernel.patch
> which ported from Intel code. It is to add BMC reset cause to boot
> command line (/proc/cmdline) in which I can check for chassis power
> policy which skip when BMC reboots (does not change CPU status). As the
> patch is from Intel, what is the procedure to make it reviewed and
> applied to u-boot?

I don't have great experience in u-boot patches, or our OpenBMC
procedures there.  If nobody replies you directly here, I'd start a
discussion in the kernel-and-uboot track on discord and see what they
say to do next.

>
> 2. After completing patch removal from meta- folder, can we still add
> patch into meta- folder in the local repo?

As always, you are free to do whatever you like locally, although I
would recommend against creating a large number of patches, and treat
it as a temporary measure at worst.

> In the development, we might
> have some fixes which add patches to make features work, before pushing
> to gerrit for review. However, the local repos might be out-of-sync to
> upstream codes for some months so we need to manage them locally in a
> period of time. They will be removed in the next code rebase.

Assuming your follow through on upstreaming, that sounds like a
reasonable development model.

>
>
> Best Regards,
> Thang Q. Nguyen
>
> On 24/09/2021 06:38, Ed Tanous wrote:
> > On Wed, Sep 22, 2021 at 2:02 AM Alexander Amelkin <a.amelkin@yadro.com>=
 wrote:
> >>
> >> Hi Ed!
> >>
> >> Most patches you listed (at least those for YADRO) are
> >> platform specific and no repository will accept them for
> >> a general audience.
> >
> > Right off the bat, I can see that 5 of the Yardro patches are against
> > OpenBMC repositories.  If they're necessary, in line with OpenBMCs
> > goals, and maintainers aren't accepting them, why was this not brought
> > up sooner?  There are several avenues at your disposal now: discord,
> > mailing list, Technical oversight forum, Technical steering committee,
> > in that order, where we can discuss these things and come to a
> > consensus.  If the answer is "There is no way that you can enable your
> > platform to work" then raise it up to the next level, but I suspect
> > that wasn't the case.
> >
> > The path we're going down would involve every system effectively
> > forking the internal codebase, which means that now we have N forks of
> > our own codebase for N systems, and it gets to be unmaintainable in a
> > hurry if any changes conflict.  As is, a number of our systems that we
> > "support" don't build on master, which somewhat proves the point that
> > it's unsustainable.
> >
> > One minor thing that might prove my point is that I can't see to get
> > the nicole platform to build.  I'm not sure if that's related to the
> > patch files or not.
> > "error: comparison of integer expressions of different signedness:
> > 'const unsigned int' and 'const int' [-Werror=3Dsign-compare]"
> >
> >>
> >> No vendor, I'm confident, is willing to spend endless time
> >> persuading maintainers to include vendor-specific or
> >> platform-specific patches into their repositories.
> >
> > Endless, no, but a number of companies have had success in getting
> > their patches and features upstreamed.  I'd like to hear more about
> > your experience, maybe with some specific examples (which I can see
> > below).
> >
> >>
> >> For instance,
> >> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-f=
or-boot-initiator-mailbox.patch
> >> is there because our customers demand this feature and we failed
> >> proving to openbmc maintainers that this is a needed feature
> >> and not a "security threat" or something. We honestly tried for months=
.
> >
> > I wasn't part of those discussions, so I don't know the full details,
> > but I do know that we take security seriously.  Making some
> > assumptions for a second, if there's security consequences, and
> > security isn't in your list of "must haves" for your platform, maybe
> > something similar to the bmcweb-insecure-* compiler options that
> > require directly opting into the security consequences might be
> > warranted for your systems?  Was any sort of option flag discussed?
> > Did the maintainers propose an alternative to you?
> >
> >>
> >> On the other hand,
> >> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-po=
sition-support.patch
> >> is strictly hardware-specific and is not needed as is for other
> >> vendors or platforms, and we don't have time to make it a
> >> generic solution. If we ever do have that time, we will surely
> >> push the developed generic solution to the appropriate
> >> repository.
> >
> > The problem with this kind of thing is that it encourages companies to
> > not reuse these kinds of things, and we end up with duplicated copies
> > of patches across the meta layers.  There are ABSOLUTELY other systems
> > that use GPIO for determining node position, so it's really tough to
> > say that feature is "strictly hardware-specific".
> >
> >>
> >> What you propose now will force vendors to move farther away
> >> from upstream and create their own forks of openbmc where
> >> they will not even try to upstream their changes and will just drift
> >> farther and farther away.
> >>
> >> Is that what you really pursue or did I get your idea wrong?
> >> So far it looks to me like a destructive decision.
> >
> > This is not intended to be a destructive position, but to encourage
> > reuse of code, and upstreaming in a way that's sustainable and
> > reusable by others.  If the things we build aren't reusable, then to
> > some extent, what's the point of upstreaming it?
> >
> > Keep in mind, the only new thing here is that CI is now enforcing
> > this.  It's been in the meta layer guidelines for some time, and has
> > been an unwritten guideline for some time prior to that.  If you
> > disagree with the policy, that's fine, let's discuss how to best keep
> > the project moving forward, and while I'm open to patch files being
> > necessary in some cases, IMO per-machine patch files don't get us the
> > maintainability we need in the long run.
> >
> >
> >>
> >> WBR, Alexander.
> >>
> >> 22.09.2021 01:35, Ed Tanous =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> A few new features have been merged into CI that will now disallow
> >>> .patch files within most meta layers.  This is due to a significant
> >>> number of them popping up in both reviews and in the repo itself,
> >>> despite having documented rules to the contrary.  The hope here is to
> >>> better codify our rules, and give very quick response to submitters
> >>> about the right procedure so we can encourage getting patches in
> >>> faster, and keep machines buildable against master.  As the patches
> >>> state, meta-phosphor is still allowed to contain patch files as an
> >>> escape hatch, if the community decides it's required.
> >>>
> >>> The patchsets in question are here:
> >>> https://gerrit.openbmc-project.xyz/q/repotest
> >>>
> >>> And add some ability for us to make more of these expectations for
> >>> meta layers codified in the future.
> >>>
> >>> The script itself is here:
> >>> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/scripts/=
run-repotest.sh
> >>> and is runnable on any tree prior to submitting to CI.  We currently
> >>> have the following patches in meta layers.
> >>>
> >>> meta-amd/meta-ethanolx/recipes-x86/chassis/x86-power-control/0001-Amd=
-power-control-modifications-for-EthanolX.patch
> >>> meta-ampere/meta-common/recipes-devtools/mtd/mtd-utils/0001-flashcp-s=
upport-offset-option.patch
> >>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0001-aspeed-sc=
u-Switch-PWM-pin-to-GPIO-input-mode.patch
> >>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0002-aspeed-Di=
sable-internal-PD-resistors-for-GPIOs.patch
> >>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspeed-su=
pport-passing-system-reset-status-to-kernel.patch
> >>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0004-aspeed-ad=
d-gpio-support.patch
> >>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0005-aspeed-En=
able-SPI-master-mode.patch
> >>> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0006-aspeed-su=
pport-Mt.Jade-platform-init.patch
> >>> meta-aspeed/recipes-bsp/u-boot/files/default-gcc.patch
> >>> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0001-byte=
dance-g220a-Enable-ipmb.patch
> >>> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0003-misc=
-aspeed-Add-Aspeed-UART-routing-control-driver.patch
> >>> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0004-ARM-=
dts-aspeed-Add-uart-routing-node.patch
> >>> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0005-ARM-=
dts-aspeed-Enable-g220a-uart-route.patch
> >>> meta-bytedance/meta-g220a/recipes-phosphor/ipmi/phosphor-node-manager=
-proxy/0001-Remove-Total_Power-sensor.patch
> >>> meta-facebook/meta-bletchley/recipes-bsp/u-boot/u-boot-aspeed-sdk/000=
1-u-boot-ast2600-57600-baudrate-for-bletchley.patch
> >>> meta-facebook/meta-tiogapass/recipes-bsp/u-boot/u-boot-aspeed/0001-co=
nfigs-ast-common-use-57600-baud-rate-to-match-Tiog.patch
> >>> meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0001-b=
oard-aspeed-Add-Mux-for-yosemitev2.patch
> >>> meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0002-s=
pl-host-console-handle.patch
> >>> meta-google/dynamic-layers/nuvoton-layer/recipes-bsp/images/npcm7xx-i=
gps/0001-Set-FIU0_DRD_CFG-and-FIU_Clk_divider-for-gbmc-hoth.patch
> >>> meta-google/recipes-extended/libconfig/files/0001-conf2struct-Use-the=
-right-perl.patch
> >>> meta-google/recipes-extended/libconfig/files/0001-makefile-Add-missin=
g-LDFLAGS.patch
> >>> meta-google/recipes-phosphor/initrdscripts/obmc-phosphor-initfs/rwfs-=
clean-dev.patch
> >>> meta-ingrasys/meta-zaius/recipes-bsp/u-boot/u-boot-aspeed/0001-board-=
aspeed-Add-reset_phy-for-Zaius.patch
> >>> meta-nuvoton/recipes-bsp/images/npcm7xx-igps/0001-Adjust-paths-for-us=
e-with-Bitbake.patch
> >>> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0001-Add-system-reset=
-status-support.patch
> >>> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0002-config-ast-commo=
n-set-fieldmode-to-true.patch
> >>> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0003-aspeed-add-gpio-=
support.patch
> >>> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-p=
osition-support.patch
> >>> meta-yadro/meta-nicole/recipes-kernel/linux/linux-aspeed/0001-Add-NCS=
I-channel-selector.patch
> >>> meta-yadro/meta-nicole/recipes-phosphor/host/op-proc-control/0001-Sto=
p-and-send-SRESET-for-one-thread-only.patch
> >>> meta-yadro/recipes-phosphor/dbus/phosphor-dbus-interfaces/0001-Add-bo=
ot-initiator-mailbox-interface.patch
> >>> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0001-Add-support-=
for-persistent-only-settings.patch
> >>> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-=
for-boot-initiator-mailbox.patch
> >>> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0003-Fix-version-=
parsing-update-AUX-revision-info.patch
> >>>
> >>> If you are a maintainer of these meta layers, please work to get thes=
e
> >>> patches submitted to the correct repositories using their prefered
> >>> review (email for linux/u-boot, gerrit for phosphor repos).
> >>>
> >>> Thanks,
> >>>
> >>> -Ed
