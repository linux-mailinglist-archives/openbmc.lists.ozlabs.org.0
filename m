Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1943296589
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 21:52:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHJ1H6w65zDqpC
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 06:52:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=cFT22gKQ; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHJ0W63t2zDqp7
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 06:51:52 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id a12so2632633ybg.9
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 12:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JAsHgTeXuJbVQ+nupM9ugJOEHnYxNQSVhUdJPjiCmCk=;
 b=cFT22gKQrg0l7uBymRrZKZOPf+Vph/RdPlfWdQRQEFVCmD9J5VLoA2OVdPklyMb6uS
 h4L0QDvmV4FtGPukjXoQxxdXmEpzV2/GBA+5ERvu9/jfzrz9pAm0Fz59DFCAQxDUUKCh
 qdqyS84GfrLfY89QYRoPgPVKKmFpq0iclDf4Lxl34fq+WokoOiwQw60ZrH6rmeog+Wmn
 BfujrP/ihVT3aU7u5dezg9jJ6qCVDEx1hWNYT2CLW7HYEMa30T+JXfrWEytAfXmgsLnD
 DLxIx4zJhSpHRGAwYQPFPoAabHHRsPWDRUroABBjLdv+A/IN8Cvx8ek853AARQTYFuBP
 HLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JAsHgTeXuJbVQ+nupM9ugJOEHnYxNQSVhUdJPjiCmCk=;
 b=euGtskuunPriUCakJQwFjCwaIGaQWhzKb2B6y1Gc8u/JNXIXu++WrlZkTT2HTVmudr
 l0/39sOjT4TzOsFu/En6w/y0mPyTZeZSEmRv3kYvIyLB9i5xn72QNOwpzAxlv8F0SVXA
 WruUTfTue7+dLGNXNnRgsFMl3Wuuo21uLHwURqPXP0j1bGnMJBAd0ego0ZKmivB46Qff
 NbPfVUf7pTX2fMLPEWM94TSkq4crxgKcZeZoOSqoiziKHvUYfuReNmExaMve2WV7wcev
 0mECQi/mD/YUb1W3JI41nUId3Yo3eD3YitDNx3uAYx8KlA11krYwp1EG2LmN+8zuIbec
 6xeA==
X-Gm-Message-State: AOAM533HWZGY9oTcBnQywVbQMLM6ZzAAS2EPdbiTuY2COWC1pBVRHUPb
 yl4bOFAZFK+X/NrWX0utyjoBttEg6cs96K+zoAysyA==
X-Google-Smtp-Source: ABdhPJyuvnopr81RAMRB9/Jyo0QUy6yVL4uRIP3ZnEAQUTjj0TQaOLSJxKdX2SUBJ2tbdM9/+bYf2joKI6XUJRTpFhQ=
X-Received: by 2002:a25:c094:: with SMTP id c142mr5195378ybf.170.1603396306701; 
 Thu, 22 Oct 2020 12:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <CADVsX8_eYXAtGMgoe9LEKRtaf0ufdn0BJA+Fn8J9xpAKnTDStQ@mail.gmail.com>
 <20201016202542.GB3614@heinlein>
 <CADVsX8_Z1GHkw0Z8-2jFGrFVVkMnMkK_rVdLJy8TQ=RiK13-dQ@mail.gmail.com>
 <CADVsX89sYGv6fKdDNTX7ER7hhSwJSidmQP9wWEqExs-K0CT7eg@mail.gmail.com>
 <CADVsX8_M4qcgYoVq1AC5WgMO598mWT6gfeyqrzScQQrt==uwoA@mail.gmail.com>
In-Reply-To: <CADVsX8_M4qcgYoVq1AC5WgMO598mWT6gfeyqrzScQQrt==uwoA@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 22 Oct 2020 12:51:35 -0700
Message-ID: <CACWQX82gk1BAyPfXgXh_9bWu4nbaGh5MA1xHAgdaFRT+nzy9bw@mail.gmail.com>
Subject: Re: /etc/migration.d
To: Anton Kachalov <rnouse@google.com>
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

On Thu, Oct 22, 2020 at 9:21 AM Anton Kachalov <rnouse@google.com> wrote:
>
> Hello,
>
> any objections about distro feature flag to cover root Vs. non-root configs & code?

My only concern is whether or not it's needed.  If a particular daemon
runs and functions as non-root, is there a reason why anyone would opt
out of that?  Presumably as an intermediate step we could make it a
distro flag, but in the long term, ideally, that could just be the
default, right?

Are there use cases where certain builds need daemons to run as root?
