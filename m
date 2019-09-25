Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFCDBD8D1
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 09:12:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dTlH6gkbzDqdt
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 17:12:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SyJDyBdu"; 
 dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dTkF3smCzDqdw
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 17:11:17 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id r26so11039268ioh.8
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 00:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DxMkpQe6WGOAdRUR1Bf5HJh1QSMcTUcEb5Up5q4qMmo=;
 b=SyJDyBduWm/5XPz8ZgsBjSS7mTbEYAlnZfQ2yS9yvVQz4sSy85sr/3soqa26uUczER
 IdrCB2iN4g6CxVWWBg/DnYi8QMBig1SyCKsDULI3TzNNHw/qO7pZNt2ulCGOisxjw+LR
 kN7dma0gIUcKj8BClpp2EIHaMFwIPmOfkr45qWgkUd6bWcs8cPv60Y+PvRJhUsgNu4l4
 ctc/Uxvco+YDM0fX/9EcUQVQv5S0HGv7+fWUwEMH6QVIY9EQUTDPNUBnWovE8SA/yDES
 N6PVcKxpUy8aIA8zvCIBm+C8O44jAD7fe3IPqOMZvfe0AouTFCDiu3Jn/qWFksZtxo8U
 NX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DxMkpQe6WGOAdRUR1Bf5HJh1QSMcTUcEb5Up5q4qMmo=;
 b=ZivMsrRRzZqVa4JYN+rbyEKf0SylGwQXGERATMH428nV0JonzSBfHXWwhg3a1IP90h
 wFQztehBYdl7tLEjDmXifT26FD8UF00ZZmmn4EYOeGKuLW1ScdoRw5uIkJSR1tzCzSJR
 sOafCXfWFfvVlHQupHalwTC4Rzr9XgkwxWjtF7nt5ePMlyBg/t0crTGZAXY+ZXG4CfV8
 AaRk8AbHDyvDBkpBlaQKQrWErnFPQswtzUK3l8plQ/E9/g+qC50LLkUVvDhCn/LBACMt
 wpmO1MtPN4++Uj//7v/yBx9i5SFtCzAtYRt2sOjzl/HTYOwhzYTUwzTn/AJOrHDnbaDa
 5YDA==
X-Gm-Message-State: APjAAAXEMTt1lsnYseOUVHAYeuxPj4QQJUkAsV4xO1uuoQta8A3tcfCX
 V3sZYT9sK/eZ1II6zj6FxPYs3H+T6dD3j8jqSCA=
X-Google-Smtp-Source: APXvYqzyuhp59e08fJIdsCX0hfdckORFOGEneWhZf9Y85OjSrjMcYuePA+H1Gq2kUPEu7GnSA38E0zBeDamAEWKJH8c=
X-Received: by 2002:a6b:9308:: with SMTP id v8mr8311598iod.221.1569395475367; 
 Wed, 25 Sep 2019 00:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <gcJgOuxYS4Cxh1DTuyIwbad8Dep30bKCasyE2I4YOJ8K4SZ-nuK9SWjh9Jaural_Eo3mSVWHiCGEk6QZZHUUAe3F9UhsQYTuXumP6_aitGE=@protonmail.com>
In-Reply-To: <gcJgOuxYS4Cxh1DTuyIwbad8Dep30bKCasyE2I4YOJ8K4SZ-nuK9SWjh9Jaural_Eo3mSVWHiCGEk6QZZHUUAe3F9UhsQYTuXumP6_aitGE=@protonmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 25 Sep 2019 15:11:05 +0800
Message-ID: <CAARXrtnQ9_NPY2rXzDq4nFc=rYVcp-UuMs1jC-Od5aZx8eoMvg@mail.gmail.com>
Subject: Re: How can I reset BMC to factory-defaults?
To: rgrs <rgrs@protonmail.com>
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

On Wed, Sep 25, 2019 at 2:52 PM rgrs <rgrs@protonmail.com> wrote:
>
> Hi Everyone,
>
> I think my flash/filesystem is corrupt, I get new certs generated at every reboot of BMC.
> None of the settings are persistent.
>
> Is there a way to restore/recreate the partitions without using SPI programmer?

You could search `factory reset` in openbmc/docs, and you will get it.
https://github.com/openbmc/docs/search?q=factory+reset&unscoped_q=factory+reset
