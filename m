Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C9A33FD2A
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 03:22:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F19m41hgQz3bpw
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 13:22:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=oCqOx0hE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=oCqOx0hE; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F19lr3xmXz3045
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 13:22:28 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so3794784ota.9
 for <openbmc@lists.ozlabs.org>; Wed, 17 Mar 2021 19:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z3xXRhoLynkuumIMFDNKwn4ONsQUJ1/BXYi+HsXabw4=;
 b=oCqOx0hEbR8F7ejNicfZwfdogum3rclR4NeF6B39b78VKbfjlICLhEpoBqP25gEju0
 4lPs0Uo59ki06XB4Gsng3ldiuXG7aQLKjd/uTmzfSoL9s1+4BwdqE2rd8mzUWfLQCpG3
 ARsrWje5vxVyMw2tp1WdgSCL7YH3qm0xd9kmaG/pLLgAyBaMFSNMpsVw02WMrDIejhCL
 kbfOh8QaA7hmfIzOsHwc/GkZm1A9lKiURUPI/5YdhrloDgKrYdc8LVuiVKuMEJWKA7EL
 iKwb9P8Iu3naBupd50TRF3qb708wa1bKSbPbW/b6zMuSUdH2U01HvqNGOsWA/1ijB8IP
 deQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z3xXRhoLynkuumIMFDNKwn4ONsQUJ1/BXYi+HsXabw4=;
 b=KQ+pd0oYj0D7/LdJ9AyPsR2lUX+EofnvUtzuiHMtLmuei83Ba53c8jU8p1y0NZ8S8Q
 YHF/l4sKdijWccUcHFZ64RN2XooFsVlQdSunacXKDWzYGgkJJKJsxcZG3SpzsZxaUt1C
 WHUxfaTiSXNyiPsnTg8u9udDC/aHoemBWcPuuMEUoWNBkl2fR2ib2cH9W8ugEWRKRbCa
 7Urxji9gvlbMxExxvKrprOZapg8MCOz7kXFY9iLUorPuPtefYU2u28nL9TCMAWGmE6jv
 CBWBn2PBhMHlqwrH5HFzWyfquyR6+j9T8ekiV6p8Zt9pyZAJ6gbhKBC5e2qIrR7gUj8Y
 7wlw==
X-Gm-Message-State: AOAM5313KwdLs9vxaXC+PYXmAZ6+4SKH7y+5pQ+Ln1Zvn0CnwQe3P+Un
 Ab9gTyG2+c7sIPnSIm8q3kapFHtSQ3+REWYK05r9RonT46dWag==
X-Google-Smtp-Source: ABdhPJy2cfomvmYQteo7GKC4ga2KOxSRhyY9XYanSxw4jzaHbS33OY54Tu7J0bmUJcou3nNk/tTnsr3xkP3HL6tMoUw=
X-Received: by 2002:a05:6830:1644:: with SMTP id
 h4mr5752677otr.349.1616034142744; 
 Wed, 17 Mar 2021 19:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR04MB3093BF84F15469B9F151FBE7E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB3093BF84F15469B9F151FBE7E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 18 Mar 2021 10:22:11 +0800
Message-ID: <CAGm54UGALYQ2eSvHHSk5MmvMo_4F19Md9L-PAV0sKEYqV+bm2w@mail.gmail.com>
Subject: Re: [External] Gerrit trigger CI from Jenkins
To: Jayashree D <jayashree-d@hcl.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 17, 2021 at 8:11 PM Jayashree D <jayashree-d@hcl.com> wrote:
>
> Classification: Public
>
> Hi Team,
>
>
>
> I am working on Gerrit Trigger Integration from Jenkins.
>
> Is there any steps followed for continuous Integration of gerrit from Jenkins ?
> I am facing issue in connecting Gerrit server from Jenkins.
>
> Could anyone please share your thoughts on this.
>

We use the Gerrit plugin in Jenkins and use the personal credential to
connect to gerrit.openbmc-project.xyz
If you want to use "Ok-To-Test", e.g. trigger a build on the string,
you need to manually add "Ok-To-Test" as Verdict Value, and "Ok To
Test" as Verdict Description in Gerrit plugin's "Verdict Categories"
section.

-- 
BRs,
Lei YU
