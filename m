Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E52AB2A5B1D
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 01:43:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQnvQ351LzDqcn
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 11:43:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=mLXmUJ64; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQntg19wJzDqY2
 for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2020 11:42:48 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id r7so17344284qkf.3
 for <openbmc@lists.ozlabs.org>; Tue, 03 Nov 2020 16:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gOUMZlfy1XTyF2tvyjARqdV7viDcNZyQn6hPv9OYozU=;
 b=mLXmUJ64sLni9qtGlQsXc+ywoUhDoTFzZKIjk+Etf75kwrlAvr1JFgXeKDghLy6iXK
 zY2DPXP1Z/vr0c+LEuxsXxfkRu2KPQ1I3QUMZSFV6yETuVxpWIbOGwg0VR9ZTEXBjXL7
 AKCzl3aY3oOOQZzq/g2dO+0KkdCaEntsDloOAWfLGAjzVu8dt8TuojG2rz+cm4BHcvql
 jtkWQW/PRJyT0MrVQI8uHYJrVk0AQB3zfHott8pVckDAEv+JKrC2LP4rE+zUfL0306bJ
 23bXtOkNX9i+2tE/Rj5LnbYh/7Et3gCJybCLenKc0RZAKF8CIuUeHsZkuFWoIuhX6gCk
 Bslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gOUMZlfy1XTyF2tvyjARqdV7viDcNZyQn6hPv9OYozU=;
 b=q7DOhC0Yw7jdVwRZS0xRguo7ClttirOtwFV4BdbdISiF6C/64qpnWRhM+5o9+DOmMj
 yoo3utFbs1nGOvvYMquJmsxsoGML0DSwh+ckr8DMnN7PwvvmjK6hsUMwzjo3zXsNvfH6
 pwYXMDPYICImiUkpESmGCSwVqwW0OmbQ88OLWOjHL/KnqLo+dnZXRUK1Lpej8TLHWryT
 l0ZYfGIBdA96/a2p360THIjpUjwJND+5ArIh3KTBS6zaTjborURcKZVmzxyyKhgK7eP1
 Gp9SgLWBX86DBBrJm/OhgjPoJ4RxutKDDo7NCtYrw0w7+Z2Hvjq0Iw7XsrsdaBXASJd7
 eWLg==
X-Gm-Message-State: AOAM531sKWWrI5cqsZjNzhQgV4Asuh69xXBckhNHYBBCFhQXGLYJXGXY
 kvsFWw49+PiNL7xwxdNKSOOt5TYQha0Rf0IIN4ZqLQ==
X-Google-Smtp-Source: ABdhPJzx18c0VL6i5za6c1eG+rbGlzxnd1JmquhRqGys0v9cs50C/fvkloqgKzH+deYM/g3XTWret4zRJR9Cy9VsWHI=
X-Received: by 2002:a37:7685:: with SMTP id
 r127mr22146524qkc.261.1604450563847; 
 Tue, 03 Nov 2020 16:42:43 -0800 (PST)
MIME-Version: 1.0
References: <CAD_3qNncYz=iWjZ_3xxPuzeW_1vXCjTENAyC77A2KWa29B6KDw@mail.gmail.com>
In-Reply-To: <CAD_3qNncYz=iWjZ_3xxPuzeW_1vXCjTENAyC77A2KWa29B6KDw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 3 Nov 2020 16:42:32 -0800
Message-ID: <CAO=notx5cwo6Y9x_gvg0=cHBv7cnaPqowrOBRA-_ahfRAfy5hw@mail.gmail.com>
Subject: Re: BMC Mock Sensors
To: Junho Park <pjunho@google.com>
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

On Tue, Nov 3, 2020 at 11:27 AM Junho Park <pjunho@google.com> wrote:
>
> Hi all,
>
> We're currently working on a project to mock out sensor values and error cases at the kernel level - we would appreciate if you could take a quick look through the proposal and let us know your thoughts on the project.
>
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/37870/1
>
> Any feedback and input would be appreciated - thank you!

It's true that using Qemu then only works on BMCs with Qemu support,
but there is already some Aspeed Qemu support and Nuvoton Qemu support
has already started to land --

Patrick
