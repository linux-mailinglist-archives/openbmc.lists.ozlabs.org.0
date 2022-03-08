Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 233614D1F29
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 18:32:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCj8F6tlWz3bVW
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 04:32:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ox17BGn6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2c;
 helo=mail-io1-xd2c.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=ox17BGn6; dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCj7r51nlz3bPT
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2022 04:32:22 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id d62so21717000iog.13
 for <openbmc@lists.ozlabs.org>; Tue, 08 Mar 2022 09:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x2/sptv/SqDtLpfPkLVSLlMDFSVFO8LG18t6FGllcd4=;
 b=ox17BGn6P342sJKCqD+L+eEGpOwE1QUFy+HCiJFv5FJe2mY2LhszEdGLIZ5cWuoSoR
 Kb+Do8wV1d4yOrjtDl9hZjA0Aii5hBj4JYy19nieZHqzFjXXMgb42W6UYCYtN+PRSzvy
 rtdLKM4QBVv1H+GMCQ3U/OJ0RuDq94s0bsdT5bGbvTUGr/eG00loQgGj2DU7WyVi+UVd
 LYlpT9CuotcdVIQIiOb5Iavt4sMc6NRBWmBG2ULVuvZZ+SngEGL8e/l8xbGSyi+LBklJ
 RqM4jixM8ZKoubGV2QS7GHtcBfDd2kYmJVav/0YVGkpngjHEQCOrmD+ELotQrrPg/MnQ
 h2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x2/sptv/SqDtLpfPkLVSLlMDFSVFO8LG18t6FGllcd4=;
 b=obRv2evf23ZVVixZb2uhQV4mJxOvrRgBu0hFqcCv2x8bKBpEEb8S6zlLTcvt6DRFgV
 2CO1LSEY5kSc7qu8WjyCqR0efm8AUEJcOCXJr+5SRMLiW3xd4++98H6gENEZCYwUPrCl
 Ooa0USdFUjksx+L+n4muYx3zGpb+1d/jUm/Om3raYqvwqwh21IySIPhq2JUF/jHKjk8Y
 9lCdJp1Vr0S1oTYFPJd71QVqOvYolyU3Z2+NqwgeSryZaF47O2llZU2wkbFIS8N1ss2O
 RX9jL+P1i/mOKpbYkcKd70MGIWyBny8px2PtQtHY3LkIYwUx/vGZV2PZTKU4iid7fJKY
 MBnQ==
X-Gm-Message-State: AOAM531m7mg8cqHgFAjlObtI8cyjVZJLH3cdZclADdmP3HNEQK/0t2Cu
 KtYKuUNkfwtlxiSblMJQXJOsAPu9QuDNRUF2WaxnLQ==
X-Google-Smtp-Source: ABdhPJzEqy8tMwonbGjJb1AeVqtjVuz6kH2SdjCBYO9Y+deiDqtC/rORx8s5JtXPz8AuFmWSKFpWw2nhIqZV4hXwlz4=
X-Received: by 2002:a05:6638:138b:b0:317:8f8f:dc53 with SMTP id
 w11-20020a056638138b00b003178f8fdc53mr16002486jad.291.1646760739831; Tue, 08
 Mar 2022 09:32:19 -0800 (PST)
MIME-Version: 1.0
References: <916794d657af450baccf0122cca5ea73@wistron.com>
 <9f9e145363cd4022ab7e5f72d12d77d1@wistron.com>
 <77316d044b8c415fb07e751662869f30@wistron.com>
In-Reply-To: <77316d044b8c415fb07e751662869f30@wistron.com>
From: Brandon Kim <brandonkim@google.com>
Date: Tue, 8 Mar 2022 09:32:08 -0800
Message-ID: <CALGRKGPTwYa_OK8wzM3PFxO2u8bWH0yT289nDFKFa21MqtPcuQ@mail.gmail.com>
Subject: Re: Openbmc commit question.
To: Bob_King@wistron.com
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
Cc: "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>,
 Jet_JC_Lee@wistron.com, Claire_Ku@wistron.com,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Lulu_Su@wistron.com,
 geissonator@yahoo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

HI Bob,

I believe you have to be part of the respective Github Team under
OpenBMC for the repo.

In this case since it's openbmc, I imagine it's the meta-maintainers group:
https://github.com/orgs/openbmc/teams/meta-maintainers

You'll probably need the maintainers on this list to invite you here
(is my understanding).

Cheers,
Brandon


On Tue, Mar 8, 2022 at 12:46 AM <Bob_King@wistron.com> wrote:
>
> Hi Brad,
>
>
>
> We have a problem that the members in OWNERS list can not +2 and merge.
>
> Could you help for this?
>
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/49786
>
>
>
> Thanks a lot!
>
>
>
> Best Regards,
>
> Bob.
>
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
> This email contains confidential or legally privileged information and is for the sole use of its intended recipient.
> Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
> If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
