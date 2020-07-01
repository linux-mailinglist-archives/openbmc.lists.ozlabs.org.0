Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0309D2116A3
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 01:27:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xy6q6hpRzDqVH
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 09:26:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=SSe2riey; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xy5b11MnzDqVW
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jul 2020 09:25:55 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id n2so12585636edr.5
 for <openbmc@lists.ozlabs.org>; Wed, 01 Jul 2020 16:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QxXK4a55JoxCdllnwx3R2lz1C+xX4zifXVoLMHSzzcQ=;
 b=SSe2rieyZlv4eqO2K1GuBbOPp1nHkrikKCtN80Y5YjNtKr8MK27ajsIog+UGA90cYt
 IYGGK+mb5GKEsEiKOJJ+GjsGJYNxv743woUoAcGqNb2phUacSBFw3zdhORdh7RYIANco
 +7p8R99GuniI8tnILjCpdSShO8L1pEHqg4UfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QxXK4a55JoxCdllnwx3R2lz1C+xX4zifXVoLMHSzzcQ=;
 b=SKP57qHid1li6p4stOBCeHEy//ikTZWfkLZoU3Lrx9mwIyAratFan+T7utuECENY8E
 bziSmK8RDrfGMbP1a8jifo7B4rhwkYHVELXTXQFa2C5v8PN1omwWEjSHEaZVaySO8VMj
 V2kGFrsXTaWe2DJyxisGiY9Buqd/354Ezt7l8jkC+DIZxqinPZMnavCo0hrL+nv1o+tH
 EBBrfzjSlJL73jA2nLHKvBkQRNjvgyc/YdliPiZxwdJF/ng36mjgCM9aVU78NjpDE6v2
 nGymMjdz2LxH460g91+dFv7xwq05uFSU5CWS906O2XjtkdEkOQqQZP4FQpZ8sGNNEPYU
 z3VQ==
X-Gm-Message-State: AOAM5332dq5VIpHVwRiTYtLGbxkxR7gCeppxQhrJvwtB3QG5tJ3dMc0w
 oV8dL7y4vM0vtsRhIDd5cOc+8BQ+941TeM+2aIO5tKfJk6w=
X-Google-Smtp-Source: ABdhPJzyFX1sBE+HmNcDq5FVvi4B36wnzLQcASZcG/Jz+OZ3p97R2MPuZEwj0jFBeftPOhTgk9c+Fsu7TxXTYucUiI8=
X-Received: by 2002:a50:ee8a:: with SMTP id f10mr12043765edr.383.1593645950616; 
 Wed, 01 Jul 2020 16:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <OSAPR01MB310610C13FA7E0EEF11D5931D26C0@OSAPR01MB3106.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB310610C13FA7E0EEF11D5931D26C0@OSAPR01MB3106.jpnprd01.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Jul 2020 23:25:38 +0000
Message-ID: <CACPK8XdiGfDJ-iKufaHyU=Rg5dD7L8o52LfKywLvQW9_Xk1NVQ@mail.gmail.com>
Subject: Re: Backport isl68137 hwmon Driver
To: Adam Vaughn <adam.vaughn.xh@renesas.com>
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
Cc: Grant Peltier <grant.peltier.jg@renesas.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Shea Petricek <shea.petricek.wz@renesas.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Adam,

On Wed, 1 Jul 2020 at 23:16, Adam Vaughn <adam.vaughn.xh@renesas.com> wrote=
:
>
> Hello, OpenBMC List,
>
>
>
> Renesas recently published a patch to the kernel isl68137 hwmon driver wh=
ich adds support for our current line of digital PWM voltage regulators. Th=
is patch is included in the 5.7 release of the kernel. (See https://git.ker=
nel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=3Dgrep&q=3Disl6=
8137)
>
>
>
> Many of our customers are OpenBMC users so we would like to integrate thi=
s new functionality into your codebase to support their current system deve=
lopments.
>
>
>
> How may we best include our code in the OpenBMC tree?

We have documentation on how to submit patches here:

https://github.com/openbmc/linux/wiki/SubmittingPatches

If you're not familiar with git there will be some work required to
learn how to use the tooling to do what you're after. I'm on IRC in
UTC+9.5 timezone if you would like to ask more questions.

The tldr is you want to cherry pick the patch on the current openbmc
kernel branch (dev-5.4), create a patch file from that, and send it to
the list. The git commands go something like this.

First create a checkout of the openbmc kernel tree, and pull down the
latest commits from Linus' tree:

git clone https://github.com/openbmc/linux && cd linux
git remote add upstream
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
git fetch upstream

Now that we have the commits from Linus' tree, and the openbmc dev-5.4
branch checked out, we can cherry pick the patches onto the openbmc
tree.

git cherry-pick -xs <mysha>
git format-patch -1 --to=3Dopenbmc@lists.ozlabs.org
--subject-prefix=3D"PATCH linux dev-5.4"
git send-email --suppress-cc=3Dbody 0001-my-great-patch

If there are multiple patches, the workflow is as follows. Note that
you will need to stop and edit the cover letter after the
git-format-patch step.

git cherry-pick -xs <mysha1>
git cherry-pick -xs <mysha2>
git cherry-pick -xs <mysha3>
git format-patch HEAD~3..HEAD -o mypatches --cover-letter
--to=3Dopenbmc@lists.ozlabs.org --subject-prefix=3D"PATCH linux dev-5.4"
git send-email --suppress-cc=3Dbody mypatches/*.patch

I'm shenki on IRC if you have any further questions.

Cheers,

Joel


>
>
>
> Regards,
>
>
>
> Adam Vaughn
>
> Staff Product Marketing Manager
>
> Core Power Solutions
>
> Mobility, Infrastructure, and IoT Power Business Division
