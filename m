Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ECB204FB4
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 12:57:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rjt203kFzDqQ8
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 20:57:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::235;
 helo=mail-lj1-x235.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=d2NVcfaB; dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rjs96m9XzDqPQ
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 20:56:59 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id 9so22877344ljv.5
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 03:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3yMR2fqs6TUj2c7XkK5399m+51NoXO+ld1LsipL2FDc=;
 b=d2NVcfaBfFwqLdOJnWz0iNOxWj7HyK5SFy4pBmwCrp3KOzAA/3WX+A7qAo3O5c3fKO
 xRGHkiq+cCY/hO+taDNiR7aNQnegUWTIVZgK9/ntDlyPNXOhUeWcRr1B8dV3en8PPbrI
 yQRfJZkDR25KjGUP7S2d0cHC+3MpRbDgrw+l84FF+dz7Otsaiif6ydG7Nfh64AnRX62Y
 neFzZTokFqRUVBrQqf5FUSR1fBLwezgGby7ySDtKfoiQ6/BjYgv3/51bjyDHN+ySKFEU
 fHHdOIjNQD8SMsfrx9ub/0KD4+DIP4KcSvpJdkR3U147GKwXQs+tYP7A3P5XnqbfveKK
 kTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3yMR2fqs6TUj2c7XkK5399m+51NoXO+ld1LsipL2FDc=;
 b=FsnGLNToLS3DM34CIGbpFPHNXQ+CvsQACMbKIX+HuNku5jDH1tk14JaANv1B4VPttA
 +4BdLMxFitEQ5MSzrJMmz6hr77QyBBDYDy8k3cEd4v9pRHvnWRHe8Odv4cjjoGAkNwPp
 A3ck892T18Vc1XjEkA2E6f0IHvQhie5UvPfiUfRTCnGokB+9pC0MXVT+dv4L0S7pnv6Q
 /0gMV60BqlUwf8ntMreJzHJbU8Ln9NQoK28lX0IoFqY80Jnk3zbFSkhn24rp1GWnaAAT
 85PnN4/qMF5Gua0eiIOPNLvnR6L/oOIGdwoPlISw8QU3DhalQIs1Xvrm7SpMQ7CJMhPg
 gApw==
X-Gm-Message-State: AOAM532BMo0rofE4nwModgn+aPglM/Xc7+lVxO8SMYFeS1SEJhSFBYIp
 i/L0FC9zxCkeXwt28GclpOE0z1ROQ/pli8+hq6QiEg==
X-Google-Smtp-Source: ABdhPJzxo7FpJ7GD4rZSMMtRn221RIeoyUMEpGg0WphxnVZqtZ/W5+1+SzC/0c65oXU+xzF/Ydi2x7q713CJ2BJtQE8=
X-Received: by 2002:a05:651c:1044:: with SMTP id
 x4mr10262621ljm.409.1592909814864; 
 Tue, 23 Jun 2020 03:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
 <6b23a265-c1dd-4c62-4c31-de4cb1cb74e7@yadro.com>
 <f68a5e8a-2f30-fe64-f285-d06cde6bfb41@linux.vnet.ibm.com>
In-Reply-To: <f68a5e8a-2f30-fe64-f285-d06cde6bfb41@linux.vnet.ibm.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Tue, 23 Jun 2020 18:56:43 +0800
Message-ID: <CAGm54UEx-HfVEJJv8w6UUYsmZmB9E6EG9RYbC-M=yMJW4qD30g@mail.gmail.com>
Subject: Re: Default Gateway for a system v/s Default gateway per Interface
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Alexander Amelkin <a.amelkin@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 5:11 PM Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:
>
> Hi Alexender,
>
> I am not sure how it can be achieved through some compile time option(as
> the existing dbus interface requires changes. Might be version Dbus
> Interfaces which is currently not supported.
>
> Phosphor-networkd uses systemd-networkd as backend which supports
> multiple default gateway as fall back gateway without implementing
> policy based routing(Both gateways are on the main routing table).

What if we do NOT set DefaultGateway (in SystemConfiguration
interface), and set Gateway in each IP interface?
Will it work as interface-specific gateway per interface?

-- 
BRs,
Lei YU
