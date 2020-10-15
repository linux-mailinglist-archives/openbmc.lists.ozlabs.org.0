Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3EB28ECF3
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 08:12:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBf870D0BzDqT5
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 17:12:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=XZiIJira; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBf6h1d6GzDqSZ
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 17:11:06 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id w141so1941001oia.2
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 23:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SH6ouaCyOVHvBmu2xuCzBcEFHzlrmmomYa0iTCw0MNA=;
 b=XZiIJira2l8xSptJAAcNF3ekxLoZLuNDWFC/8zMwIZVjFQXibECtebu7wXx1Krxbj2
 JF7itGfEZLalHLgGVm/wCUl7EvuqEDet9QExOEKnBl93eXSMwLEOVJAmw/UcHhNTRdQr
 DXgh4wduqkHf2KsbvbFeIzeasGRK7ZU0zFT+v5jyeHVr8lsxThKnZduj2IJPj1kKj2pB
 nHrQLnihTNO5RNE+pqUuiOFglIeWx6icePqLMFLEFQzlATybHimOxSOoHkWE6kiUPtL8
 sWK5gZW2pViBH0z1TUqp/qe/nuZrlzF8htd6ybxyRkCOgeKVCRLW9bWTdc+pKn+38MvN
 nrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SH6ouaCyOVHvBmu2xuCzBcEFHzlrmmomYa0iTCw0MNA=;
 b=CHUEjoAULfDR4ZP0g9quoUU9o3aLvEF4Ag9gzXdUUm2KqZyWivk0AeVzRTJQFS5r5t
 jEdkAjBitw6+o9aW4b80KaLA4frgCVuVJzdaofcaD+LwvkhmAd90F7OrUBZLia+Hacu6
 zN7MP0tx/4ATTc8y5FcoicBgjWmIjOWJBuaRzd1as0sDgSbdFtOwlNJ3PEaSyZBCGn3K
 thGQm7/7OJuTinM2iQB4IqgMZs2icC1mz0nDUlT+Q6tRWp3WW9l4HIQpXZiTfjGQL8A0
 JAV7uyY1WlCIKqAI0z2ZuepyPMOmvcTEdWsVrH6nQ8arv6UVEZjUl/2iNH27BQ/U9I2f
 t8GQ==
X-Gm-Message-State: AOAM5331GqRM9ufs65oDkekoUnrLm3MFLf7TpnWAknNlA+oIiSy0q0z9
 GwbSbDyvr6GSuqXaUrltB0orXzcTbExRV8YA2Ts4kA==
X-Google-Smtp-Source: ABdhPJxoTekNHfqt2ZTewi5DaPZJDOJOvLeLW69m0+AJ7OzMqKjsKIwqeaAhNzVksswA6+Y33Wwm8S5Q4ILr4vZuILI=
X-Received: by 2002:aca:db42:: with SMTP id s63mr1111871oig.4.1602742262270;
 Wed, 14 Oct 2020 23:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <65961456-D5F6-41CC-AD10-93E716386953@nvidia.com>
 <CAGm54UFhaViOLjWuGQXW3catJ62Y1gx5pA89VDZ06TtshXFbvA@mail.gmail.com>
 <3A6CDD61-FC1C-4698-BD88-856C4B677DF8@nvidia.com>
In-Reply-To: <3A6CDD61-FC1C-4698-BD88-856C4B677DF8@nvidia.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 15 Oct 2020 14:10:51 +0800
Message-ID: <CAGm54UG5SOv36pSz4sxe4Ubtx0zbX0wLr_J+7i6rFsQYGcd0cQ@mail.gmail.com>
Subject: Re: Kernel panic when net booting OpenBMC
To: Nirenjan Krishnan <nkrishnan@nvidia.com>
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

On Thu, Oct 15, 2020 at 1:35 PM Nirenjan Krishnan <nkrishnan@nvidia.com> wrote:
>
> I tried that too, same error. I also tried adding `debug-init-sh enable-initrd-debug-sh` to bootargs to try and debug this further, but it panics before it gets to the debug shell.
>

I would suggest checking:
1. If the kernel config really enables the NFS related configs, e.g.
CONFIG_NFS_FS, CONFIG_ROOT_NFS, etc.
2. If the NFS server is working correctly.
