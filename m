Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BCC24A9CC
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 01:07:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BX3MT0xmBzDqyJ
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 09:07:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=1Y8WMhyC; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BX3Ld3GQyzDqBx
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 09:06:32 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id y134so115744yby.2
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 16:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mcU6Bk6XOepwx3ER57nPd5hiX7fVQjC25Qipp1pyUc8=;
 b=1Y8WMhyCksHKOfWfZ/3eLBpVCarVtvWCDuPSWJdinWHEAWVxqgdXzzJ8T001+drvJV
 ahztVZc1MuNi0Hv41klniZH4foYCqwZfbUwrBtAsODQ+YBthIfIYvRYCx01o+NOOjNpf
 60l6MyyHlmExltFqVRpdoN+bCg27AD5ZY4IiYGg4UXSrinqKC0c5lhOvUl6/0apZYDSN
 zdR7r6AhhaYD4L28smhJjFI1v2QvbVnRhIFhWtzD03ezEgtzxmnH3+cQkBbO4zanMpQc
 XNU9wGUPx+qG5c4Vcu95lAsXvQ58QJ/rhQrHk//uWYW2IHZfBregOe257vFcLLRp83Ul
 m4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mcU6Bk6XOepwx3ER57nPd5hiX7fVQjC25Qipp1pyUc8=;
 b=oN1Z8NiVBLiC13wxvdaNVXYnneC1g0UOqB+QriSn0yPwyoec3jDSvBnldwRQSqzVjF
 v7D0EODwJNCyfOz0LfXUX/pIoi6bUJTvc9/IsTWfrBm6U8yldcZZTKIvY9hzQjWgRxEL
 vEe0iHgq18DgGs2IdYs2VQXwyxIOWwtjehgSarb8xnn0CsueFlQP5M5Vi5nRLxukd1xZ
 bfFI3wB3k3l8n+cbjqtXN7BcwsqJWljf9ofDdRqIkwLZZuihMePPP+x/1l3uqnMHKMFX
 QORcagZOFInNqK7jAtiKTPrqrX+ewTJ/2cbyed0A4ymSxc+xLeLLZsn3S4cxqlqUSAFL
 nZgA==
X-Gm-Message-State: AOAM5332XKIh68gYt8He8RO22qGvGTpxrMCWxxURHGdp0xuNWDNvJbVQ
 8cgtxRvgFTF+OFYeiQJj/1SgIGmh7PvDsslw/cQBqA==
X-Google-Smtp-Source: ABdhPJwohfIERwt9LPXBtQ2b//iasGQXZ88hKN5fkeSafSbrWHMxkXiWnQfGOOovJK99I3hjSYo65cg3ReKgfdsAuK4=
X-Received: by 2002:a25:14c4:: with SMTP id 187mr1041406ybu.449.1597878388043; 
 Wed, 19 Aug 2020 16:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <OF638D78EB.A08769F2-ON002585C9.004C1612-002585C9.004C7B07@notes.na.collabserv.com>
 <6fd33e23-9845-ed74-7784-75a3a1439f1f@linux.ibm.com>
In-Reply-To: <6fd33e23-9845-ed74-7784-75a3a1439f1f@linux.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 19 Aug 2020 16:06:15 -0700
Message-ID: <CACWQX80KUxiRXtZv2Cd6UZ=0jTDKdg35JQFOfUAeFsss0kcg7Q@mail.gmail.com>
Subject: Re: GUI Design Workgroup - BMCWeb login change
To: Joseph Reynolds <jrey@linux.ibm.com>
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

On Wed, Aug 19, 2020 at 3:43 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> What is the best way to resolve the issues?  Email?  Video conference?
> IRC chat?  Or continue with the gerrit review?

Gerrit or the mailing list, that way it's documented for the next time
it gets brought up, and we can point to the discussion later.
