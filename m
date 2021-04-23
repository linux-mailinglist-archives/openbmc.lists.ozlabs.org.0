Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BE0369110
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 13:27:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRX7Z5Sskz3002
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 21:27:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=K1z5dxr5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=K1z5dxr5; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRX7K54kFz2yR6
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 21:26:51 +1000 (AEST)
Received: by mail-ot1-x330.google.com with SMTP id
 g4-20020a9d6b040000b029029debbbb3ecso12025287otp.7
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 04:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YhyBANuI4kOWOWOCaKHn5YLhQHN2ilBTuthT8QafvRg=;
 b=K1z5dxr57H6UQFRfpTEZAX4Ti5KwPQHwyESfr5cJiYhIPUEoiP3OtyMwbiDBu5cEFe
 rBIfLZKyHs4wd399pT6qhRtQUcJZxxSovyxIN7i7lHcWlJs9i6SJQ/dc/dJx6MhEzAXQ
 G/ey1oHVhG7LecZcZrWXwSImv8n8vED8I9Ty3lLQj1DRFbsCLtJu9KGx7SvOp1o9voLC
 tU5nOfjgn6GMtoSMTRf9XSaJpp6j/uaGXXnEMwp0T/rwh3lH1C9ffRVulFUJ6zhjlWSL
 KPq+cgFMKxJLd5R+iTa8sfXTvcxtc9hzlXIR4wJ2mBKlRJzBFSu6fD7+hTQF+0NLZdbi
 NhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YhyBANuI4kOWOWOCaKHn5YLhQHN2ilBTuthT8QafvRg=;
 b=DvZ3xyzMkAcEFZWB/YFWQeQLsI+jK14R6nX/UaHgzF/fpnzAuWfyHwtLTksrIN5cnL
 T3JritqRfCaQjESlKewDLrYIg9d7So19LIeWiURsMKIt6KwpuRvjG3MgPHiVsY4vNvhT
 YncDNcu/PLsHwZSR90sls/aCQK/NTdjw9gYgf6vRLHMjR3IEeZhn1Nz5RfkYCfEXRKw2
 Nn2+VxHZM2Uo5TSEsGy/QgZ1Des7J9upRqCTEJ+NrnZKFqmtiS+j3mP0kEflzXZBDcua
 8n3h00ZxCrSyN+wzVMXQ9gIpc+s7Gw70FwqnvrAWpeIcsvtqAzqZSi/i0n+k54scJsDX
 syEg==
X-Gm-Message-State: AOAM532XsTvCw2ffiMRVjGBD9VbnWHjy3FhsfxOB+FTUNuZd14BSvL2O
 msQxiiQ3CGclqsLT3C7rRLb0+ctah0BzcQzNYyRCTQ==
X-Google-Smtp-Source: ABdhPJwLgLOpxduKEgQVNGjqo1yxsShk4fgjCNc7v6aVP/ROnjPsd6vetrmvodhajlDs9XKJHWnNfqp7q0U2eVakD0Y=
X-Received: by 2002:a05:6830:149a:: with SMTP id
 s26mr3063829otq.349.1619177207047; 
 Fri, 23 Apr 2021 04:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <CANFuQ7DizmmqHEU-iTe56pt9mfi+MYaNjNCoXsgSpxYQ92Acyg@mail.gmail.com>
In-Reply-To: <CANFuQ7DizmmqHEU-iTe56pt9mfi+MYaNjNCoXsgSpxYQ92Acyg@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 23 Apr 2021 19:26:36 +0800
Message-ID: <CAGm54UHzrx661Z0hLMj0g9syqsk=32TW9dX6Xm1BCBiuEGmQ4g@mail.gmail.com>
Subject: Re: How to analyze core dump data
To: George Liu <liuxiwei1013@gmail.com>
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

On Fri, Apr 23, 2021 at 3:59 PM George Liu <liuxiwei1013@gmail.com> wrote:
>
> Hey guys:
> I have a question:
>
> When I test and monitor the `bmcweb` daemon, sometimes I encountered a
> `core dump` due to the code error. I want to extract the core dump
> data and analyze it to quickly locate the number of lines of code, but
> I do not know how to analyze core dump data.
>
> I tried to use `gdb` to operate(gdb <binary file> <coredumpfile>), but
> I did not get the desired result. So I want to know if there are other
> ways to analyze core dump data? Or where there are references, please
> let me know, Thank you.
>

Check https://github.com/openbmc/docs/blob/master/cheatsheet.md#gdb

-- 
BRs,
Lei YU
