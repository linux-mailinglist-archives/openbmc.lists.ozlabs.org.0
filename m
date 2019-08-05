Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC3F8139B
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 09:40:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4628p10T0TzDqgf
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 17:40:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gDWqob/d"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4628mk6JrWzDqnD
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 17:39:50 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id g20so165320756ioc.12
 for <openbmc@lists.ozlabs.org>; Mon, 05 Aug 2019 00:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XBw9xdp8XHRLsy9boBfn5KLugepQZaFffWClyQraoXo=;
 b=gDWqob/dkA3znUyU+rdVvh6mCpDuSH0kj+lKRCNPcwvAnd4clic+lE+gsanfxwj5kE
 nnXxXEsX3RGH81W/Omyq11sJ7e9hLJQwQ8X9xcAT9IuPsvfDVlpc9F8p7osjNsZUZ/BN
 AZUgyb+TJysBY3tNNevEOrP7wkfmSDjk1DmzXZ9ZrIQqGLTVF9nqFWA7fBft8xfB9iao
 gib4AmvB3IZzVHNdI03rSbGhLPDzBLr19lshlIjZ98JjC+DKY4AWIYoCTEzl8Q/3kID0
 Bk5tjFmyITe3qO5oWTPliYWUCTFWPc9zwxfYv6Jkk5VlZsdsWKO6jky325RVHdH+Ysih
 uDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XBw9xdp8XHRLsy9boBfn5KLugepQZaFffWClyQraoXo=;
 b=VtNSNban3EQCh2H5Z50LHstfjm8JNm06/K7LZRzZ/g3Ef4UHErLxsdliEFaLCI2e8M
 /fbT4g44ncZFrutN2I92IKtcXkMwVExfP50mytySKwlyhn9jtV9PUaapYAix6LfyVhuR
 sSSd2O64I0ENmOY1aTBJHp5IqIfOIVrniYK42SPGqP8ua/yBR3IkC16eXSABinV7Vhtx
 h3Dhd3NsDrvd0AOyBXkVmckErXrjOpfxxvdnQiL2/bfwAeVBSIqhZvx322rA7oMdIbc9
 aWkLKzGTLjC3Ls7CZWf4Kue8cDO72KNBFI2ZLqSM1WNU/bb1wtONNzqhwfTwRHgGlWmq
 uStA==
X-Gm-Message-State: APjAAAV9p3/a+yjjUqBO4RO1xra4Fucn+ewlqEZYWK+Uy048UjMX4YZF
 McEmpyN2RFvmn4t645PVandLOpPKiHh2AnIPxV8=
X-Google-Smtp-Source: APXvYqwLH5uhRJ9jakDVCsKSdM3P+SyhXet4AwJPutKoxYLqsgE/Z3FSivZ6+Xjttx9kwOF89qBvP1EStJsfA5QUBhY=
X-Received: by 2002:a5e:8f08:: with SMTP id c8mr52444428iok.52.1564990787844; 
 Mon, 05 Aug 2019 00:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <29CA6B5F-505E-462F-A1DA-9146B97E01EC@hyvedesignsolutions.com>
 <CAARXrtnOwXtOS_y9Wj3RkjhwFG9ReKvjfG7XNaKpEV=H-4cqMg@mail.gmail.com>
In-Reply-To: <CAARXrtnOwXtOS_y9Wj3RkjhwFG9ReKvjfG7XNaKpEV=H-4cqMg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 5 Aug 2019 15:39:36 +0800
Message-ID: <CAARXrtkwZndaH_3QU5z5sOWn21mP60Nm-iy9quQXd07UkKg-Lg@mail.gmail.com>
Subject: Re: Nothing RPROVIDES 'virtual-p9-vcs-workaround' when creating
 romulus-prime machne
To: Brad Chou <bradc@hyvedesignsolutions.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

And below

    meta-romulus/recipes-phosphor/host/p9-host-start.bbappend:RDEPENDS_${PN=
}_remove_romulus
=3D "p9-vcs-workaround"

removes the dependency.

On Mon, Aug 5, 2019 at 3:38 PM Lei YU <mine260309@gmail.com> wrote:
>
> If you grep p9-vcs-workaround you will see below:
>
>     meta-romulus/conf/machine/romulus.conf:PREFERRED_PROVIDER_virtual/p9-=
vcs-workaround
> =3D ''
>
> which defines it as empty.
>
> On Mon, Aug 5, 2019 at 3:07 PM Brad Chou <bradc@hyvedesignsolutions.com> =
wrote:
> >
> > Hi All,
> > I followed the exact steps in Add a New System to OpenBMC.
> > https://github.com/openbmc/docs/blob/master/development/add-new-system.=
md
> >
> > Unfortunately, I got this error as "ERROR: Nothing RPROVIDES 'virtual-p=
9-vcs-workaround' (but /home/bradc/Documents/openbmc/meta-openpower/recipes=
-phosphor/host/p9-vcs-workaround.bb RDEPENDS on or otherwise requires it)=
=E2=80=9D.
> >
> > I need to delete one line in romulus-prine.conf to fix this error.
> > # require conf/machine/include/p9.inc
> >
> > Is anyone have idea why it only happens when create a new machine ?
> > Thanks.
> >
> > The detail error messages are :
> >
> > [bradc@hyve-taipei-fw-lab build]$ bitbake obmc-phosphor-image
> > Loading cache: 100% |##################################################=
###########################################################################=
########################################################| Time: 0:00:00
> > Loaded 3596 entries from dependency cache.
> > Parsing recipes: 100% |################################################=
###########################################################################=
########################################################| Time: 0:00:02
> > Parsing of 2442 .bb files complete (2441 cached, 1 parsed). 3597 target=
s, 351 skipped, 0 masked, 0 errors.
> > Removing 1 recipes from the armv6 sysroot: 100% |######################=
###########################################################################=
########################################################| Time: 0:00:00
> > Removing 1 recipes from the romulus_prime sysroot: 100% |##############=
###########################################################################=
########################################################| Time: 0:00:00
> > NOTE: Resolving any missing task queue dependencies
> > ERROR: Nothing RPROVIDES 'virtual-p9-vcs-workaround' (but /home/bradc/D=
ocuments/openbmc/meta-openpower/recipes-phosphor/host/p9-vcs-workaround.bb =
RDEPENDS on or otherwise requires it)
> > NOTE: Runtime target 'virtual-p9-vcs-workaround' is unbuildable, removi=
ng...
> > Missing or unbuildable dependency chain was: ['virtual-p9-vcs-workaroun=
d']
> > NOTE: Runtime target 'p9-vcs-workaround' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['p9-vcs-workaround', 'vir=
tual-p9-vcs-workaround']
> > NOTE: Runtime target 'virtual-obmc-host-ctl' is unbuildable, removing..=
.
> > Missing or unbuildable dependency chain was: ['virtual-obmc-host-ctl', =
'p9-vcs-workaround', 'virtual-p9-vcs-workaround']
> > ERROR: Required build target 'obmc-phosphor-image' has no buildable pro=
viders.
> > Missing or unbuildable dependency chain was: ['obmc-phosphor-image', 'v=
irtual-obmc-host-ctl', 'p9-vcs-workaround', 'virtual-p9-vcs-workaround']
> >
> > Summary: There were 2 ERROR messages shown, returning a non-zero exit c=
ode.
