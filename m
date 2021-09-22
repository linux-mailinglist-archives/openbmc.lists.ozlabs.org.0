Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C574153F9
	for <lists+openbmc@lfdr.de>; Thu, 23 Sep 2021 01:36:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFF6W2TfHz2ypP
	for <lists+openbmc@lfdr.de>; Thu, 23 Sep 2021 09:36:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=l4+0/HAU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::134;
 helo=mail-lf1-x134.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=l4+0/HAU; dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFF662JJqz2yPc
 for <openbmc@lists.ozlabs.org>; Thu, 23 Sep 2021 09:35:39 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id i4so18705481lfv.4
 for <openbmc@lists.ozlabs.org>; Wed, 22 Sep 2021 16:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rixsYlvlugfN8qtBIEzNU6o0U91ks3DJwFiiH6pM/hA=;
 b=l4+0/HAUeBJuIilDdniMmTUt/wS0ZLOWZ/eeOx45ELCEDAyT3HwigG67W2QT5NwZj8
 mbg+Iwh1uGFUpKTmfnkB1D3M1qt2ne8BPgczonB3kGkeN43CjyUx2PaiTGCu3KzNa44B
 SYCshjcR6qu+PyUnrkoFqExgrqBfbGygEgv4dPFOPHReonNFq/3J9o9karld/Gwos3RY
 eUDNgyNbtYOu7WxoREjIkaeSiG8+BCSidgKWQNVZwWDHEib6j4C4EtIHBDVtXgo50NBm
 HWz1DWCprGIJ0SPv9fMTnSQeN3mAsdvYwvEhhQYtcWalCM5yPYkit8Tf7ZLm+ny1vDbn
 LZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rixsYlvlugfN8qtBIEzNU6o0U91ks3DJwFiiH6pM/hA=;
 b=wIE44EQSFZ5OUNcWXcAENx2yYG4prU/rRbZbYjT7bcLmtcbN7Bx3lPtlee/LIPgNYV
 UAJP9vwE2QYyyeimBekH54nok0TZLfCY6myuziHdMajWI85MiY2mmNS1LrcahoJm3f10
 3qk4dpxx5d9135UDOk3Kfd9Yk1eFhbRG2+4W4Xiwp+vZinvQ4UvRVd2XH6pN/FIB2Zw+
 T5O295s6Ew73d346KuNqaQbIbuFQKnHpKCkuD/cEmeQOVgMUAvBxBJcq4E/vS90HPHMW
 x2hZjuO29h1aI37zO+rCOsL7eqoeqHAgjBQa7b9V/2QOVs3x/Em0l5csQRI8vK0TRfdQ
 xGtQ==
X-Gm-Message-State: AOAM532m1CAQvF535J/ES/cE+KaNPZKAnu/5S8II5xoHAx/9gcBOt6QU
 9vcNrsqIzlCQBQRW00uy3nfAwheOY1Gq3/RXZvbuVQ==
X-Google-Smtp-Source: ABdhPJweJVgsoUd1VCz1iPGVAbta0xNoqu10preE7CS5h0igQ08YNQrDZ3RKmfEm7ek5obbhtE1gQdZE/1VLhs0krnU=
X-Received: by 2002:a05:6512:3e1e:: with SMTP id
 i30mr1415500lfv.273.1632353731578; 
 Wed, 22 Sep 2021 16:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
 <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
In-Reply-To: <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 22 Sep 2021 19:35:15 -0400
Message-ID: <CABoTLcRGjXV_QBnAv6J0+cZL9ahjjzLBai2ANJ-YkzYOi_aYJA@mail.gmail.com>
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
Cc: Ed Tanous <edtanous@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Alexander

While I can understand your position, I think there's a bigger picture
to consider. In my understanding Open Source works by individual /
independent contributors providing their use cases, knowledge and
experience by means of designs and source code to the world. Since
there are many individuals trying to do different things and some
people (maintainers) being the gatekeepers for what can be submitted,
it of course often gets to a point where not everyone agrees.

Trust me, I've been there. I had many occasions where I needed a new
feature or a fix to satisfy project requirements and timelines and was
not able to upstream it in the given time. I sometimes gave up, often
found a different, "better" solution and many times worked with the
community to find a solution that would be accepted upstream.

While I agree that deadlines and requirements do not always allow to
go the "everything upstream immediately" route, my experience has
shown me that forks or patches are ultimately costing more than using
clean upstream code, in particular if a device is to be supported for
years through new versions of the upstream code.

As an example, we've been using an i2c sensor chip that needs to be
configured at runtime. Upstream support for that was (still is)
missing. The patch to do that specifically for us was 1 line -
literally. However, it's incredibly difficult to discover and
understand this one line years later. Together with hwmon maintainers
I've spent the last 2 weeks designing and implementing various
versions of a generic solution that we hope can be used for other
hwmon drivers. I understand that I'm in a fortunate position so I can
spend that time. But I still need to justify to my manager and myself
why it's worth it, which I believe I can.

In my experience, having patches checked in is just that - a temporary
patch - not a solution. From Oxford's dictionary: "to patch: treat
someone's injuries or repair the damage to something, especially
hastily" (I know there's also a definition of the noun in the realm of
computing).

So while I agree that not allowing patches is actually making things
harder for some in the short term, I truly believe that it's going to
make things better for everyone in the long term.

Oskar.

On Wed, Sep 22, 2021 at 5:03 AM Alexander Amelkin <a.amelkin@yadro.com> wro=
te:
>
> Hi Ed!
>
> Most patches you listed (at least those for YADRO) are
> platform specific and no repository will accept them for
> a general audience.
>
> No vendor, I'm confident, is willing to spend endless time
> persuading maintainers to include vendor-specific or
> platform-specific patches into their repositories.
>
> For instance,
> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-for-=
boot-initiator-mailbox.patch
> is there because our customers demand this feature and we failed
> proving to openbmc maintainers that this is a needed feature
> and not a "security threat" or something. We honestly tried for months.
>
> On the other hand,
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-posit=
ion-support.patch
> is strictly hardware-specific and is not needed as is for other
> vendors or platforms, and we don't have time to make it a
> generic solution. If we ever do have that time, we will surely
> push the developed generic solution to the appropriate
> repository.
>
> What you propose now will force vendors to move farther away
> from upstream and create their own forks of openbmc where
> they will not even try to upstream their changes and will just drift
> farther and farther away.
>
> Is that what you really pursue or did I get your idea wrong?
> So far it looks to me like a destructive decision.
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
