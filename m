Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E301E17480
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 11:04:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zVs01N89zDqGM
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 19:04:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="lpH/e5yG"; 
 dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zVrG2XxGzDq7h
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 19:03:26 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id j6so22319543qtq.1
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 02:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0yDzCUaWWkp3tn5Kbw2JfsF37HIDGVfnLmIKnLBDNBE=;
 b=lpH/e5yGDMCJ9GliCFTdiefrE6PbFRidKf+R7lpDMTDhBvbK2z24oj1yXixM2H8fh6
 0XJKz80Z6D1x0e3OHMo0RUCTwFF/UqvbhqYApDfajqpWpjIOCWHSJrs4gpA+gM7s31Uo
 rP3czIxspMz3Aw8DpFT8ssAV74o+olGDXHEnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0yDzCUaWWkp3tn5Kbw2JfsF37HIDGVfnLmIKnLBDNBE=;
 b=AfwFTlJzaqUZjWF1DihvmfuINwZUKEE1CRv/Z/Glip410WlcAx4YuGIFI7bBfG2X5r
 19sElTBrSg63YBZIuTeyo2rzg9cX2kYlzWGNCGfk4iUL7ZxeUh7Xz73L0xoofZ+1iGU9
 yGZL1H+4aCTdPGESTq80NaCjPCEf/JRHNOhQX4+TNbGR0VIUAWa1yoaYKziXTpAwYgoG
 G10QDjlObCI94PUdqZyO4HSv5ucI/RxxutXbSGh+56CSly1Eu36Cv9dHwLDTMdGhycHd
 cPX/HwdytXZAOAjo4nTv4onMT0t1ltsttxtuueBm0yaR1pvHS/JGf7WD3SVCYDVqzpH0
 /M8Q==
X-Gm-Message-State: APjAAAVgtGmM3iNQeqLggRB7LCkSAu0PiFtE2LnMwKbwAvpuTVQKvhZb
 B956brh5BJwg6GhoovSEOxCValaqlGqRcPcD2DNEFhH3QeA=
X-Google-Smtp-Source: APXvYqyHTflu4Db/IeB9IYjjjAqWEjufwn4UCHRvrSNWny4KaosFJNOhsPOTgRMm0G4URshDpuoseXi4ahVsLRH40VM=
X-Received: by 2002:ac8:2d48:: with SMTP id o8mr30592099qta.136.1557306202565; 
 Wed, 08 May 2019 02:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=oNUnnPHXnbybAPAvdq9PvxHe4B3GiX0BYw6rdoXgDqw@mail.gmail.com>
 <CACPK8XcjuXuqejZ4oabLTE-Nv3+JXZ1Zn3qkeT3P1akpR9yFbA@mail.gmail.com>
 <CAARXrtk_AOkHQU09YO1rAzo7A4BbMw0gts+5r3jLK7upyJGXXw@mail.gmail.com>
 <CACPK8Xdcxss9XFEuMoL7Av=P8-ZSuUUY=LmpzT3b_0g=Ls=VNQ@mail.gmail.com>
 <CAARXrtm1wqok-KZCK0r=1cWGx9rVX_EPfftMh3DVZOPLYhEDtQ@mail.gmail.com>
In-Reply-To: <CAARXrtm1wqok-KZCK0r=1cWGx9rVX_EPfftMh3DVZOPLYhEDtQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 May 2019 09:03:11 +0000
Message-ID: <CACPK8Xd_wX6ayHFWmDC5hpZLTC=FTbz+BZD78Ug=0JPfDaut_Q@mail.gmail.com>
Subject: Re: Proposal for removing legacy code update services
To: Lei YU <mine260309@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 8 May 2019 at 08:58, Lei YU <mine260309@gmail.com> wrote:
>
> > Does it affect the on-device update method of putting images in
> > /run/initramfs and rebooting?
>
> No, it doesn't.
> You could still update code by putting images in /run/initramfs and reboot.

Great! I checked op-test, and it is already using the
/xyz/openbmc_project/software API.

+1 from me.

Cheers,

Joel
