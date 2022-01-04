Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 510B84847E5
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 19:32:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT1Sb0qNwz2yp9
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 05:32:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iPE7TgIa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::435;
 helo=mail-wr1-x435.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=iPE7TgIa; dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT1SC3KwSz2x9P
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 05:32:25 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id v7so77842350wrv.12
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jan 2022 10:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MaDw5LkqkIABc0iToPQSPR5BynqqirotYv13VAhvdJE=;
 b=iPE7TgIaRt+8pkr6Fwfh252aon+KQJUfkPaigeaPHinxAjYa3b/z9F1VsBOm5gJy/B
 3p+/oPnHqu1jJYYbx4Fq/RmmKdNm0xdSZxrVH/LvmIOJQoBCfGKdvGoqLrGGxrLsh1pw
 6oKBzm9q1c9LVXvw1pSa0GHKOobMjXoYKnMnFUVIX0o4rFulurn/ON79ItidJhWfOJOs
 VTfc1hja1IvmESXLIGanKhNJVJHHZtWFfuak1nDrfWZuAh636w/o361c6gzvliqyE+Na
 esV5UYXXYBlPp/iB0NmeBBiFipq51l18Fidi2xaCMs9oJTB0RRQXJ+IcWzmiiM+w7kOQ
 gneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MaDw5LkqkIABc0iToPQSPR5BynqqirotYv13VAhvdJE=;
 b=S4t05Kcso2wwN5aI9f9doziaSAol1SCrBCmJoBGN2FAsCvQmQIAbu/h3AwT9bklyfh
 ALEpUZGXoLCrmd0lOjbfmYOVL/nIvJoVPFQQJMDaxLNyQYSCBI0peZrDsEGxvV7mkOHW
 Eec7DbF6Zg9dDQcZBejLEE5k8EbfcmpQR5lw0+W2kJH4b0pFRzYMrDlIWsbeXh0+GCQe
 BPYt+O4YlJLnjzza/zoQZojlE3v/tmg3Pj63WYTDDDBbG9/BklcxMout/WaKjGPKyh43
 GzHlJqBNLayk2hW8BbW9Umeop6g0zZFmDfK/Vpbab8aEkth9TFLJXhRX39vfqwuWyUEZ
 9hFg==
X-Gm-Message-State: AOAM532ygKhICAMxB9r33iK3uWFFeDyUdpgpVV2mN6LKr+2cLx5hRkMc
 TE8VW5VEqaM2I5rlI8cQH4qSHkxZ1jPx9XDgBJ4eMA==
X-Google-Smtp-Source: ABdhPJyKDbQGqrKS2mjrokqrl97nd2da63j//4YOxTC/97fOTHb4alzFyY7ybfUg42G69g7/FBfBHHmOifpdBuKL0L4=
X-Received: by 2002:a5d:6da3:: with SMTP id u3mr41072310wrs.712.1641321137732; 
 Tue, 04 Jan 2022 10:32:17 -0800 (PST)
MIME-Version: 1.0
References: <Yc25imp2cCDpyXNt@heinlein>
In-Reply-To: <Yc25imp2cCDpyXNt@heinlein>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 4 Jan 2022 10:32:06 -0800
Message-ID: <CAH2-KxAYsF5WQGbJDZAXyMhjm-9MZ77PX6pAEwOk7pSScUCayw@mail.gmail.com>
Subject: Re: meta-phosphor: enable `allow-root-login`?
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 30, 2021 at 5:52 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> Hello,
>
> Looking for opinions, especially from security minded individuals...
>
> In many of our `local.conf.sample` files we enable "debug-tweaks" but for
> production builds this is probably not a good idea.  I had it turned off on a
> production build and ran into a case where we could not log in as root on SSH.
> We debugged this down to missing the 'priv-admin' group for root, which is
> typically enabled in `phosphor-rootfs-postcommands.bbclass` when either
> "debug-tweaks" or "allow-root-login" is enabled.
>
> I am currently enabling this IMAGE_FEATURE in meta-facebook to avoid having this
> happen again.  Is there any reason why we wouldn't want to enable it by default
> in meta-phosphor?  There isn't really full support for non-root users in the
> base systems anyhow, so is there anyone that wouldn't want "allow-root-login"
> enabled by default?

Doesn't this directly violate the principle of least privilege?  I
wouldn't expect root to be usable to outside users, given that it
gives significantly more permissions than any outside user should have
access to.  My understanding was that priv-admin was supposed to be
the privilege level for "all permissions for things that an external
user should be able to do".  Is that not working for your use case?
It'd be interesting to understand what permissions priv-admin is
missing.  I don't really think giving out root to external users is a
good idea in general.

>
> I'm fine leaving this in meta-facebook, but I'm trying to prevent someone else
> from having the same issue for what seems like a default case presently.
>
> 1. https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/phosphor-rootfs-postcommands.bbclass#L10
>
> --
> Patrick Williams
