Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E19E65205B2
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 22:11:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxskf5VsMz3cFP
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 06:11:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QYmEXp/X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::336;
 helo=mail-wm1-x336.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=QYmEXp/X; dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxsk21nMGz3bqK
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 06:10:50 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so195857wmn.1
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 13:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=emf7WA3+RrnvmBeTcXtGLseEQRpCBrBgnRTGTmaZQ6A=;
 b=QYmEXp/XCzR1BrmAJThTvatAenBWCFay4e3Q8c+mlVJS8jt328pJvb7aepvEIbCxb8
 uKL5ynZltI1GCPlmk+rpGoQdk1MDLeaCEfjdiA+t2WlM5JCkOQIl0mfEWy+xV2w+E+zT
 FybTN9LVqDuaE86XPpMz0FehckFTi+UYdfKxa701YD8wQjbR6uBquWBHzBd9uKm+DZxW
 ZWjRcnsuvQwO1T0L8id2dioz1UY7BwIrps4XqtQPWsqJor8puNKErjMzWRCvHgtwkZGU
 waFF4H4nXodxaJ1ix+WzFEYU1IlpdgcMIAxUlTxzIeOKRKKo9CHorrOxghzelD7nAybP
 Pv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=emf7WA3+RrnvmBeTcXtGLseEQRpCBrBgnRTGTmaZQ6A=;
 b=wcJohe2OuqaIjjd4ozibO+2SkYTvM5uOc/+0OT+1LvNQfWjR2r8X/oYGAgroFBrYS2
 EGTZYclILDCmTMmyX6c9SSTTQkH8lVSuBQeLPIThjONcZrnxqhXvDCjP+SQu0PwO9+gX
 nxH4YI9DxKzQgsTe+FsSs0ix5kVV1Jb93ZJv6tApwVgSA86HzmQTIJ1fnbseZ+IrgTyt
 txw+T6qYAMzTrc1yRvvfdysghIdIP4Kq/JS2yfuyGLYxMgqh7bQ6C9CP7KNJuhKDFJyQ
 axC9ftRDHJRjEjfY9MUfex64c1mMvqyHcWR9rxj0oO8ELMRcoAEu/xA7W7K1qwZbL7Br
 ty6A==
X-Gm-Message-State: AOAM5312Shx0CRXDfc/JqyunFwrCDHhFNZlK3RZ8L5o1ShAe6x38k495
 v2408ZgOVo+D6rEKpArkMsJ+TF2pUyCiLXoANjrgdg9bdOXFaw==
X-Google-Smtp-Source: ABdhPJy91Fq2/Udt63GgW6ejSbNml9nP/J5ZQQHJTknJRkg3YbCU851pYvDoR6G8v+auycL6tyx1smQmClNZz7sryvA=
X-Received: by 2002:a05:600c:1151:b0:394:6816:d4f2 with SMTP id
 z17-20020a05600c115100b003946816d4f2mr23555182wmz.195.1652127046802; Mon, 09
 May 2022 13:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <16ba58d6-d06b-1c92-340b-e94119a47708@linux.intel.com>
 <YnBcJ6GPKIBpqYWN@heinlein.stwcx.org.github.beta.tailscale.net>
 <cfed9171-10fa-d8a7-e1e5-74cef23bc299@linux.intel.com>
 <YnEZ3irWISTwEikW@heinlein.stwcx.org.github.beta.tailscale.net>
 <3ae639dc-720b-49ba-ad07-879a009db144@www.fastmail.com>
In-Reply-To: <3ae639dc-720b-49ba-ad07-879a009db144@www.fastmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 9 May 2022 13:10:35 -0700
Message-ID: <CAH2-KxDatD00=kf4Psq2s6kQRF4YSp0wDsyBsv22-bijJYceBw@mail.gmail.com>
Subject: Re: Running OpenBMC Daemons/Applications as non root using D-Bus
 Session/User Bus.
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org, Nirav Shah <nirav.j2.shah@linux.intel.com>,
 nirav.j2.shah@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 3, 2022 at 4:47 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Tue, 3 May 2022, at 21:32, Patrick Williams wrote:
> > I think you'll find it hard to enumerate because our architecture is
> > purposefully very flat.  I know the codebase fairly well and have thought
> > about it for a bit and can only come up with one: kcsbridge (or btbridge).
>
> IMO both kcsbridged and btbridged should be deleted and the
> functionality folded into phosphor-host-ipmid. The split that we have
> there is not useful or efficient.

+1

>
> In terms of what Patrick spoke about, that means even fewer examples.
>
> Andrew
