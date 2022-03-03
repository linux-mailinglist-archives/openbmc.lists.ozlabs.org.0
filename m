Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 427F04CBE25
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 13:49:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8W562pRMz3c1T
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 23:48:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TUnpu7WL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TUnpu7WL; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8W4g2LpXz3bsc
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 23:48:33 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id e2so4400263qte.12
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 04:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TlJoiS/nwF7TWolI2yLIZqV/64cBek/sdtvX3O8gnwU=;
 b=TUnpu7WLjU0tQQwSJK9oBU77zJbZ8kxUQwgULEofTStglq/4J9iYmAAQ63xWuGyBkF
 sinXZNw//WadLaI0pAYmUNYoD701mqqyHgHzhVVwv7DTK9Z0Cxk1YyMhfFQ+jiR8KkIk
 Dsvko6U4gEvyoX4qzfx3bt+shpotKuqOdfH0AnowvwevgmXLp+h2HOAgBn9A6sc84fsC
 mFBKeTo48bzzpq+rlotxKuMS4bi5cVQ4xcKCKJR1iWsgKaCoJJjE02RpqTUXPEtkNF2C
 p4WOvYvDb7B86Zyfo2D75Z+HQuUn8FyGBzyNce7WUv0AQrCZJttjee3yayRVidoTPuLD
 NNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TlJoiS/nwF7TWolI2yLIZqV/64cBek/sdtvX3O8gnwU=;
 b=GTPM6IbLdapustJesRm7c0E6dcb3blHYY9OvGofDEjCuScnCliqERK+EoDbMZKCXvA
 S/8Kn6QVGtCakuuNNo2lf2/X2rt4XAG+IVoVjhjEAChn07kU5IL0zJL2deWUzDmhYd58
 10hlS45uE/w8sAbuBVEp87XZHPlJFvlXFaLv1dsRwa7QCuWFE8p/L6y2VlbtxZ/l3klo
 NZLqP0ek5J9apjMTgSRvdvtWO1IYObGUSqwmhSmKwWQUg37hunuAyNmHWbgEXRSgWgis
 ucpOywFsMxNzcxI1GIQcgbYvdET2dCCHK2FzUl+dC2IjIisnmuX2mToYTn29QjDLPido
 Arxg==
X-Gm-Message-State: AOAM533oIjJR4sBBKgBDL1PSuJOisXd56NeopspSxg7fUmE060x4iWx2
 CA8hJSgBWcw2CEsbFPqS08/qzSswOvRXGHY45MQ=
X-Google-Smtp-Source: ABdhPJwmy0Lxq3dOOuPailZC57EbGc10MJu5b4Wb9g6YTokZrF5CoH2wT8ZMYziIglwOWdfPszhyNoPKPMzGFVf2phs=
X-Received: by 2002:a05:622a:1985:b0:2de:b88:4673 with SMTP id
 u5-20020a05622a198500b002de0b884673mr27451315qtc.230.1646311711557; Thu, 03
 Mar 2022 04:48:31 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-10-warp5tw@gmail.com>
 <YiCaSSbbszm3qYIQ@smile.fi.intel.com>
In-Reply-To: <YiCaSSbbszm3qYIQ@smile.fi.intel.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Thu, 3 Mar 2022 14:48:20 +0200
Message-ID: <CAHb3i=sStqdSpLKtF_UGmTsOssR_swssTd3pv6c2-z_kiUPTTA@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] i2c: npcm: Handle spurious interrupts
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 yangyicong@hisilicon.com, Linux I2C <linux-i2c@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Tyrone Ting <warp5tw@gmail.com>, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> On Thu, Mar 3, 2022 at 12:37 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Mar 03, 2022 at 04:31:39PM +0800, Tyrone Ting wrote:
> > > From: Tali Perry <tali.perry1@gmail.com>
> > >
> > > In order to better handle spurious interrupts:
> > > 1. Disable incoming interrupts in master only mode.
> > > 2. Clear end of busy (EOB) after every interrupt.
> > > 3. Return correct status during interrupt.
> >
> > This is bad commit message, it doesn't explain "why" you are doing these.
> >
> > ...


BMC users connect a huge tree of i2c devices and muxes.
This tree suffers from spikes, noise and double clocks.
All these may cause spurious interrupts to the BMC.

If the driver gets an IRQ which was not expected and was not handled
by the IRQ handler,
there is nothing left to do but to clear the interrupt and move on.
If the transaction failed, driver has a recovery function.
After that, user may retry to send the message.

Indeed the commit message doesn't explain all this.
We will fix and add to the next patchset.


> >
> > > +     /*
> > > +      * if irq is not one of the above, make sure EOB is disabled and all
> > > +      * status bits are cleared.
> >
> > This does not explain why you hide the spurious interrupt.
> >
> > > +      */
> > > +     if (ret == IRQ_NONE) {
> > > +             npcm_i2c_eob_int(bus, false);
> > > +             npcm_i2c_clear_master_status(bus);
> > > +     }
> > > +
> > > +     return IRQ_HANDLED;
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >

Thanks Andy,

BR,
Tali Perry
