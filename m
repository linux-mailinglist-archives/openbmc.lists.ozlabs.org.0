Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FEB3EAFE1
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 08:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmCpB3Kw8z30Ng
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 16:10:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=AB5REYf0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AB5REYf0; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmCnq6vYDz30B4
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 16:09:51 +1000 (AEST)
Received: by mail-qv1-xf43.google.com with SMTP id db14so4647989qvb.10
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 23:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fFQFoQ/FWFQ+YtYA3T8/QYmEvBfr4LHrj3JCNYiESJk=;
 b=AB5REYf0iVq/rdpAzyRhspBhYTqHV9KgSsKVQQ8JnLQ0J/8MC6OknNQzEeU8SW7ZCX
 ngfe46d2gU7iOeslQ7kdLFfRFpqTNyKDWvRUoeWpUp5rGFvFnem9OlY4rJjVOuWCoxoM
 lr9QXzaeepXwzAD8oD5VhzLkAwK/yotYIP3BoXXcTjRWk2Ye4rXdZPTxzemaYqWZqM09
 dvEK0AUV/5cvdic/K1+N4eiE3i+WK042bFY7P8uMf3oSbTa0mSJ7Xji3L4N479H9lVRH
 XADy5izh5U6o5xd5xZH1syl9709VneQv598sMoPPd3mOHXAJyaCImgU9ph0cYzw+vGLg
 Qzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fFQFoQ/FWFQ+YtYA3T8/QYmEvBfr4LHrj3JCNYiESJk=;
 b=eDh27Lh+Ekm85ZddFw9TLEdS4COqRGpaYMqDCcmIfY3veSyJPJNBVz4teV1SI44MLm
 oCB16FyUT4EOjecBur71B0wYJrhTxhAqDZn+zEUURT7+X/U10fVTeED6b7unZuDUmeKx
 6hT9xFGHC/HmQ4xYqfWUQYjEazr8EpM0lT1kgTSeRH0sP3phdfm7nKHu7Na9jGU7ixc2
 ljCPRZjeT/HMNVGxaYLyoLOLGOMTxyYlnuUbvdot8fmFDWoKKZUKWhOJZYw+/SML8NRk
 A09X+6bsEnyXnReEZeCo29/aQOHq1lxKiD+PT54KsDRiy2NBO6Ol4xTxz0cNRdKflu7h
 RAMA==
X-Gm-Message-State: AOAM530FlgSmIC0HjP37UsdJajX8R7uOs8GmvfIxE/mSInVz+HtUTY+H
 QvPcyXOebsA1CT504YGdDeCAzaMkT7ZVfm+4aRQ=
X-Google-Smtp-Source: ABdhPJwnifi0M0TG3wLDk2Jei1Ag3YQkYT8X2Jn/W2W1u4kRrRI+wi87id7e3Wo7KQGwRY26MQp1lZYpuOLrJTPiT8c=
X-Received: by 2002:a0c:be85:: with SMTP id n5mr1108859qvi.59.1628834988526;
 Thu, 12 Aug 2021 23:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <OFA5154048.C3010138-ON00258730.00127D40-1628824917257@ibm.com>
In-Reply-To: <OFA5154048.C3010138-ON00258730.00127D40-1628824917257@ibm.com>
From: George Liu <liuxiwei1013@gmail.com>
Date: Fri, 13 Aug 2021 14:09:37 +0800
Message-ID: <CANFuQ7D+ihCTnQHuyzatLsu8RBa8gLe0iDed18EAM_sy3aPNYQ@mail.gmail.com>
Subject: Re: Request new repo for Audit function
To: Milton Miller II <miltonm@us.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 13, 2021 at 11:22 AM Milton Miller II <miltonm@us.ibm.com> wrote:
>
>
> Reply below
>
> -------- Original Message --------
> From: George Liu
> Date: Thu, August 12, 2021 7:52 PM -0500
>
>
> Hi Brad:
>
> We have a requirement to implement an Audit function, I found that
> there is a design doc[1], but there is no code to implement it.
>
> Could you create a new repo for Audit function?
> eg: phosphor-audit
>
> [1]: https://github.com/openbmc/docs/blob/master/designs/phosphor-audit.md
>
> thx - George Liu
>
> -------- End of Original Message --------
>
> Hi George.
>
>
> Please update the design with consideration for inclusive naming[2] before submitting code for it, as it uses depreciated terminology in it's external control interface.
>
> I see this design was merged almost 2 years ago before this policy was in place but as you said it hasn't been exposed by the community yet so we won't need to maintain compatibility with prior implementations.

Thanks for your advice.
I will read and update this design doc ASAP :)

>
>
> [2] https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-naming
>
> Thanks,
> Milton
>
>
