Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C7AA4CF3
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:57:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBWy52zzzDqM3
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:57:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=richard.weinberger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hgwNGXBf"; 
 dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H3rr1mg3zDqLh
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 17:43:08 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id t16so14291102wra.6
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 00:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CPfJYNj/vr8qfYHczQg8BMzBP0ihy/vaBIvutGAAoEE=;
 b=hgwNGXBf+8znUmyPRGAVICDDTM5HMTd1h5qTufue0bN99y6UnBPAKKnwv2Ot1E8pmV
 GCvfij2LUhwzNQoYA2IYXMooV/Zq7FANyVrV4WhAAht0o1mzpJxsECBSBXJ+ic1es05W
 Gb3PGti3Ea+phnvitToZhG7znFhlh5VxtggtTP8m3VF6xVnaNJdIJWn4GrIHkbv2hKib
 Qx7qkEnN1P+exNdibWtLbov4I6MvrlddhITvbCtKzrC/T9sDILVMNikhVcA1efFlUVss
 Us5mtg/qXbqNwz6pkfIKa1+HOdhdgaV6IfosAP/pVNzN5TGofy445t0JVm9ix9xuVnAD
 uBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CPfJYNj/vr8qfYHczQg8BMzBP0ihy/vaBIvutGAAoEE=;
 b=TIMRl4HUv7vgiZZoIiMu4RIMmFxKlije2cnsKKF7wdXcxRcgG1eA2olD7SAT9ctIfi
 F2K8t/VbqzPmPps9Y4PPYv+SY7jNQcklHM5tIJ8XjGjNlOwQ6LmD59X/nPIPivSv/PON
 xVAz6ciAe0J2rrfu6LzPFdKxFb0iPAcpO2/bhg8IagkMkyv6rK0ydN3VTy6VV2UEZfH1
 NeW6dqlq3xjAiJLZnfH+hP04FKVAp2Rc3K6uQNYLxkw1SYC+rZHUjyT8RoyzALKs1k2T
 Tzt7fzNIncLcYP12qKtTpgnYl/7c1ZlcHObb6mqIcm5RDEVXS9sbZs+uIOonpNx4gUxV
 LIXg==
X-Gm-Message-State: APjAAAUzL/XUF9YFE07WrApVrEMzryjuL1OB8t9Qp2GdeyvQud98nD/+
 G3G24SqBAMn23DBcVer13JPpL5yRIUr/6MicA80=
X-Google-Smtp-Source: APXvYqzuwIuP3xdhcGEytAtOSYnpp5tmkqm02ts8+Jl2G9gF4Nk4Jfpw8tkX80NV4onSdZ6OoO2W7/fNpWEPJCFV5nU=
X-Received: by 2002:a5d:53c1:: with SMTP id a1mr20770337wrw.185.1566805383875; 
 Mon, 26 Aug 2019 00:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
 <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
 <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
 <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
 <ba3f204a-aa11-4a81-97ab-cf8e7eca7e94@www.fastmail.com>
In-Reply-To: <ba3f204a-aa11-4a81-97ab-cf8e7eca7e94@www.fastmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 26 Aug 2019 09:42:52 +0200
Message-ID: <CAFLxGvx6RDvzXC57DeqyfMkSxCo3-0kr=uJebR0f6VsY0pUpfw@mail.gmail.com>
Subject: Re: kernel BUG at fs/jffs2/gc.c:395!
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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
Cc: Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 26, 2019 at 2:32 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 26 Aug 2019, at 04:53, Richard Weinberger wrote:
> > On Wed, Aug 21, 2019 at 2:06 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > Looks like a lack of robustness to filesystem corruption to me. LWN
> >
> > What exactly makes you think so?
>
> It was a bit of guess from a brief inspection of the stack trace (that was probably
> unhelpful in the overall scheme of things). Sorry for the noise.

No need to worry. :-)
Without inspecting the image it is hard to say what the root cause is.
But I suspect a runtime bug in jffs2.

-- 
Thanks,
//richard
