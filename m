Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA4A3EAC11
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 22:47:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlzKR10ZSz30LB
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 06:47:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=PaPC/bqB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=PaPC/bqB; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlzK10CNhz2yXb
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 06:47:30 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id g30so15844965lfv.4
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 13:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j7Uhfu36t0cY0qFdzZ34DGGXhJi7ZJeNrgfEkTZl0RU=;
 b=PaPC/bqB7P5n0Z0kAqVRhXskon3PluZmLXIpkmofeEynDLiD3Gneix9xDhmUS5ifR7
 z6MiKOS1YSVx68b7t/TiFlVTWt4mIW7FJb5jGtB3qXLwSZgFwVvqZaxdFqYngpH0P764
 9yKNeiJZYjkVF399aZf6gj1tlQOC8CFEclGC/WbxdFsmYfGQ7WxYkcyQ75vHc8SXm9Sj
 aAkh5GXxCMht+VMh0SNZM5LGN++r13aWro6c4WPFM/whdGM5xqYBlN4Ra0nBXX5ijMh+
 8M+0kQcD7nwRRK4o6rljIABCoCoR1En2SgBlXhPH0d81A8MEV8vj9JXp5ULi9gdB0B28
 s1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j7Uhfu36t0cY0qFdzZ34DGGXhJi7ZJeNrgfEkTZl0RU=;
 b=RbX1Cw2/g2Wi9C53XeY3sCyxXq0jYxUArYYgYOvnxFHeCXBKBurETmmhTfLFDpnpLQ
 Jv5U7vTDeXjKBhC5UTSgUD0Vu9eBBLhtjQVYRSDB5x10bsSvMOJINgvO7PezEkAt0sIs
 3/DqnMt8I1BBuDKw+i7IwkEd6xnJJOB/CTc8mv8tl75ufUSqybOVLdDReyZ5FE9Zzl1R
 r2KeXfBQdBW2bZ3/Nis2VO7jxJBi64mUitzNybFo/jEGhzb2sTWcyxh6Vo7l+EUeEzsk
 OwwE7JfbyCQFb/EX9rI7LlWsDIB7rzikKaBNGK5ozLIH7Qv1yWTf0lKjNKTzLtNxFmQt
 EOZA==
X-Gm-Message-State: AOAM532o1NOmJWSBf6LxpQAI/wHPcFFMnu1lio+X+whuGjDyXbuA16QJ
 ZXuhpUHp0Qx9rEF1hzRvG1Z4jRHXtC2fdzs0HElZBg==
X-Google-Smtp-Source: ABdhPJxyU+bruKvKb0BA1DL5ESE57d31GNAGUl5yAce64cG/v39ZcBdsz3TQb+7Vx5Wpcd/NKOH48uCu59h/bw0aNSw=
X-Received: by 2002:ac2:4573:: with SMTP id k19mr3756869lfm.459.1628801243809; 
 Thu, 12 Aug 2021 13:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAKJqRLVQYxzFEUOe=jF93dVvR86JJWk_uO9KnVLriJ+jDdkDVA@mail.gmail.com>
 <YRU2f8s4T+fBGrE9@heinlein>
In-Reply-To: <YRU2f8s4T+fBGrE9@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 12 Aug 2021 13:47:13 -0700
Message-ID: <CACWQX81Aj_2rV+mvum+BpoTXKbbKiJEHAbF_OV6fwcG4e=nT=Q@mail.gmail.com>
Subject: Re: Turning off the D-Bus REST API by default
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: Ali Ahmed <ama213000@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 12, 2021 at 7:56 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Thu, Aug 12, 2021 at 09:10:01AM -0500, Ali Ahmed wrote:
> > I know there was some previous discussion on this.
> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344 is making
> > the default setting for D-BUS REST API disabled. The D-Bus REST allows
> > authenticated users access to privileged information that may be above
> > their permission level.
> >
> > After this commit to use phosphor-webui or D-Bus REST, you will need
> > to set -Drest=enabled in your bbappend. Note: webui-vue uses Redfish
> > and will not be impacted. Let me know if you have any concerns.
> >
> > -Ali Ahmed
>
> The following machines/meta-layers seem to still be relying on phosphor-webui.
> Is anyone signed up to either switch these to webui-vue or do the bbappend?
>
> ```
> meta-hpe/meta-common/recipes-phosphor/packagegroups/packagegroup-hpe-apps.bb:        phosphor-webui \
> meta-hpe/meta-common/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend:                           phosphor-webui \
> meta-ibm/meta-palmetto/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend:RDEPENDS:${PN}-inventory:append:palmetto = " openpower-occ-control phosphor-webui"
> meta-ibm/meta-romulus/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend:RDEPENDS:${PN}-extras:append:romulus = " phosphor-webui phosphor-image-signing"
> meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend:RDEPENDS:${PN}-extras:append:ibm-ac-server = " ${POWER_SERVICE_PACKAGES_AC_SERVER} witherspoon-power-supply-sync phosphor-webui"
> meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend:RDEPENDS:${PN}-extras:append:mihawk = " phosphor-webui phosphor-image-signing wistron-ipmi-oem ${POWER_SERVICE_PACKAGES_AC_SERVER}"
> meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend:RDEPENDS:${PN}-extras:remove:witherspoon-tacoma = "obmc-ikvm liberation-fonts uart-render-controller phosphor-webui"
> meta-inspur/meta-on5263m5/recipes-inspur/packagegroups/packagegroup-inspur-apps.bb:        phosphor-webui \
> meta-intel-openbmc/meta-common/recipes-intel/packagegroups/packagegroup-intel-apps.bb:        phosphor-webui \
> meta-lenovo/meta-common/recipes-lenovo/packagegroups/packagegroup-lenovo-apps.bb:        phosphor-webui \
> meta-quanta/meta-olympus-nuvoton/recipes-olympus-nuvoton/packagegroups/packagegroup-olympus-nuvoton-apps.bb:        phosphor-webui \
> meta-supermicro/meta-common/recipes-supermicro/packagegroups/packagegroup-supermicro-apps.bb:        phosphor-webui \
> ```
>

I suspect we should put together a patch to leave rest-dbus this
enabled for the above systems at the same time we change the default.
With that said, based on Patricks other email, a lot of them are
slated to be obsoleted anyway, so maybe the problem will solve itself?

I wonder if there's some clever yocto way we could just turn
phosphor-webui into a distro feature, and flip the bmcweb flag on
automatically?

> Romulus and Palmetto at least are ones we utilize in CI.
>
> Is whatever hardware testing we do on Witherspoon now moved over to the Redfish
> APIs?  Everything in openbmc-test-automation.
>
> --
> Patrick Williams
