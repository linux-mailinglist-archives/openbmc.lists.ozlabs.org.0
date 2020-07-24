Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E88522BD8D
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 07:35:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCdFW5F0zzDrSG
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 15:35:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Di956j2a; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCdBj5kL6zDrgK;
 Fri, 24 Jul 2020 15:32:45 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id o18so8677890eje.7;
 Thu, 23 Jul 2020 22:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lxeF3MdXzIoVsbazhbqXkh5Gq8fRGjKClAu6VjOvpaQ=;
 b=Di956j2aZtrmMHcejr07uX82Ow70coVnOGXPMEEuPUjfwmVcAT2UMOPHutzGowc6ee
 PrcgaF2BmKXQcGyY3GplupS/zOgati5XyXj7L+kKf0sWU3xvRDx/o3eysq3xLNtd5B8d
 UIkRU1OgFsWoBWSJR53ArBd94RfbELr182ysY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lxeF3MdXzIoVsbazhbqXkh5Gq8fRGjKClAu6VjOvpaQ=;
 b=rad1CoHcGYQ+DOKiwIasf4nyTlBThHQbSvhRAI5zShzETDt/DUsS94d7d/fhtOFcHp
 0Fz0PHNtrUEcsOAMOzgsNKpev+VeK2GRsH+EuHoY4gPb3XKNB4JR3tWy9O6Iwv5+aiQN
 41iK16nqNtolvsUEQCB/kAk9XOTBmk4lufbW1d1kayvbk8Q5Q8kZmLjXm5Hy4wETTeSO
 lco7BSct9bvtYY3dQViOzbBHJHcPgidxXsVXbiIXjdO1pt2aIJ4y6/oJXvaynx32+6+Y
 MLYrXeMkf81kfXI+U5yWrW/TRKM+lILDsIge/Lvs1uQ3wdIlVxb5I6SrcXRbBbDiTFl3
 SuEA==
X-Gm-Message-State: AOAM530sqy5Gy7A/IBDYdqbHxN4jOdLKAkH1kbsDi94NUw/iQMSxquqT
 rpAmmlNxtyXGFXpIv5cSh58VxWJ3Vb5H84UpZ38=
X-Google-Smtp-Source: ABdhPJyvBQHzeEYsM37+wecHEG0VWauRr3W7csro+jM1re12/9nqf22Nc6d1EFG2E/ReH5XyqMDpOAvaHjCnOFMBhaA=
X-Received: by 2002:a17:906:c187:: with SMTP id
 g7mr8032732ejz.108.1595568762913; 
 Thu, 23 Jul 2020 22:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200723230539.17860-1-rentao.bupt@gmail.com>
In-Reply-To: <20200723230539.17860-1-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jul 2020 05:32:30 +0000
Message-ID: <CACPK8XdiHLcBBhXjCpTZotVPuRj4bFh0x8TFhSj1TBK2xB0SiQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ARM: dts: aspeed: fixup wedge40 device tree
To: Tao Ren <rentao.bupt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 23 Jul 2020 at 23:05, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> The patch series update several devices' settings in Facebook Wedge40
> device tree.
>
> Patch #1 disables a few i2c controllers as they are not being used at
> present.
>
> Patch #2 enables adc device for voltage monitoring.
>
> Patch #3 enables pwm_tacho device for fan control and monitoring.
>
> Tao Ren (3):
>   ARM: dts: aspeed: wedge40: disable a few i2c controllers
>   ARM: dts: aspeed: wedge40: enable adc device
>   ARM: dts: aspeed: wedge40: enable pwm_tacho device

I have merged this series into the aspeed dt-for-5.9 branch.

Cheers,

Joel

>
>  .../boot/dts/aspeed-bmc-facebook-wedge40.dts  | 42 +++++++++++++++----
>  1 file changed, 34 insertions(+), 8 deletions(-)
>
> --
> 2.17.1
>
