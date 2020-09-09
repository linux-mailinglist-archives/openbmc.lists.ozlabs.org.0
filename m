Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F965262535
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 04:31:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmQxy2W88zDqTR
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 12:31:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=qIuE0vlL; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmQws670ZzDqM3
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 12:30:35 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id b19so1441862lji.11
 for <openbmc@lists.ozlabs.org>; Tue, 08 Sep 2020 19:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U9zsejRczZCUYiLck6nVRHc3mXMvEvwXrbAPvqaphSg=;
 b=qIuE0vlLjNXVRNRuhDuKL9fMkx29MSlDbNe/5eqYaB7JpeQEzFkaOT6JLwN+ybvLNb
 dHn/rS0/oeeQl2hKE+QGFFV8wfXveuBcUym94dqnyRjNArWZw/7cAlAYroTRyziiHAXh
 +2YL3YIYr/3I47Ldk+/VPCERTzzjuP0+1jEwOc/HoEZaFj1M38JBT0Qu7ZbVs0ISXOdu
 YqdnE0rdoa2fHT/yBojdYgBl6Sp+3AnZ5Y1jl5o4NqUDZZtxtemVn/hriIQWZTWDmYfT
 TyECV3nMtkyyBH7plQIQK/kqkTUHmpaowSx4BRyvQx88dyxCM1ejrA3BZUfyPuO3rkbs
 DZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U9zsejRczZCUYiLck6nVRHc3mXMvEvwXrbAPvqaphSg=;
 b=kD0DlgFfXHtbXhAKwh+1MalcUHxu4x8X2CE/tEn04R0cjWWETRTvWqvCllaup+ZMbG
 wnG4zHbWMdwc1gX7wAvNL+RyCILd+1snZCUxvCLOf4UW0MbnohDehlADj2ElMy3f4vmH
 BQzuuXIeZu1YIYJvSdS8kVKyAMOLThXBjPVP9Hdtc7QUc8R33qrbeA6hA2EuSehKEweW
 +MjdpawK+HMF8JuL3tvI88gxxZQ5KUdZ11T2lP6dspJubpahi1kQc0mIfHoV14OKZ+D5
 5n623GCDMFg9qVw4n21oTmZUL66VEm/+pt88KwsW6iWHFwKy0GVpOnyl5ankbWyMThta
 LUGQ==
X-Gm-Message-State: AOAM532XKNKUaf9BkmN3bi337R91RDutw57XJ6SgEaYHEQhmn/401YCq
 oUQzfK6wvPzDpISfuBHLfv3uzlY6Rjp2Wn7EDbAU1A==
X-Google-Smtp-Source: ABdhPJxWh1n4DZIbQFULKIbLdiQegSHlUVjcQZ4B+hO44E3Mtu0xSN5Sck2GlXxJolTpEyhena87vninLTFlldrU890=
X-Received: by 2002:a2e:8114:: with SMTP id d20mr633320ljg.409.1599618627558; 
 Tue, 08 Sep 2020 19:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <a140b8dd494792d0d814cd20e6e4ab4b2714c16c.camel@yadro.com>
 <e1bb6593-63a7-4460-b5cd-f53d0e85384b@linux.intel.com>
In-Reply-To: <e1bb6593-63a7-4460-b5cd-f53d0e85384b@linux.intel.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Wed, 9 Sep 2020 10:30:16 +0800
Message-ID: <CAGm54UH_0-OG15o3Cdy3Au5kbYvDPRDOu=MJpqypX4zthv=eHQ@mail.gmail.com>
Subject: Re: time control on wolfpass BMC
To: James Feist <james.feist@linux.intel.com>
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
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>, openbmc <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 9, 2020 at 1:54 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 9/8/2020 7:47 AM, Ivan Mikhaylov wrote:
> > Hey James, Ed, Is there any way to control RTC/PCH time inside BMC on
> > wolfpass?In intel-bmc rep there is the pch-time-sync service which is doing
> > sync.
> > The service just reads out date via i2c regs and do the sync with system time. I
> > didn't find any other utilities or something which can help with time set from
> > BMC.
>
> We default to NTP and use pch-time-sync as a fallback. NTP is configured
> by systemd-timesyncd https://wiki.archlinux.org/index.php/Systemd-timesyncd.
>

On our system, there is no i2c to pch, so we fetch the time from ME on
BMC boot, and then uses NTP to sync time.

-- 
BRs,
Lei YU
