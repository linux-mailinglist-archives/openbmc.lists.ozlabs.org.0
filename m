Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C82607ACF
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 17:35:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mv7nk58JCz3dt1
	for <lists+openbmc@lfdr.de>; Sat, 22 Oct 2022 02:35:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=glKJRZP1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=wltu@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=glKJRZP1;
	dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mv7n75Drwz3c7L
	for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2022 02:34:34 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id o22so2225188qkl.8
        for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2022 08:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ESvH8Dh4eAjlT7zbpnLtsk3ZsvfeUS2gS+2WpzVopyQ=;
        b=glKJRZP1R/cQXEmxAcbfTFsYZKFLhHreGeW9DufmvehNKDoKdUeRk+FucaXSIIbnL3
         s+7lzv6mEH2oKi77PqU2mEND455rC4yrz6Hx7PH9B8KRLwNrdt43/mUzMuVSZH1b7edA
         04BVcP5WqEC69wSuaIV+TmlKLHnqmXLXr0G7m3MSHV6rt+K+hsA8qWOiG4uDtlbSr9jS
         Uu+uynvCzZOEXLdpd+KZWzJcYukJ2t8y0bkZhmTZzbilmTtyeRofdzEgfdvksMKakz/x
         m52fACvDcQwxZlL0XUX9asBWLFs7PczSlPFSBUIchstDIT8ueVHP3IjRQl6mc7tCX7Fw
         xk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESvH8Dh4eAjlT7zbpnLtsk3ZsvfeUS2gS+2WpzVopyQ=;
        b=38smk95tVR4HGn6M9qMffBlJwFN2Qu4OajZH/nCsdXQpmvUPKAvTcOjKtW3tlmXZyS
         e5r4nOlP81fXufZDCs64KaYO6WNtMqAXe/r8L6kmiTgYQZHubL11B3gXHPbu2XRQMUSF
         9yC/ZZFa8icEdsJkblAypx95D67Wtn07gOoE3T64hkcvGPxQsuS5SCOuLw5LcPy+Weze
         3xdzZYK/gvqHsKt1ndk6N+VRpgH7t+8dC12v54cGgST1M1UxIhNE7YAghkKJTYqTe5qo
         gOP2381LMnfTv2+e7kljju4AJLx1OmvvK3iaBrP6joF94/9pGCx6HoWhthvG+RrdjXto
         JvaQ==
X-Gm-Message-State: ACrzQf2Fo7PxZkp06nv7QR0Z/ghsxnua8o3OM92towZ6H4azxWWJ78Ek
	ah4DQkmOnwhlhzvlvbToQxkDQGgaV5pALvBpAE73AuSACHI=
X-Google-Smtp-Source: AMsMyM7lObDG8BLLMFfSy9+iE1CnRLV4uBKeeaFEP/ORA4bAPc9XdfJ5uVkasoANisv8IdiacmJWN4gEmIjfesvM6sQ=
X-Received: by 2002:a05:620a:f04:b0:6cf:c030:a1c2 with SMTP id
 v4-20020a05620a0f0400b006cfc030a1c2mr14295541qkl.312.1666366468990; Fri, 21
 Oct 2022 08:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221021150706.hkytptw3iwqbb4le@cheese>
In-Reply-To: <20221021150706.hkytptw3iwqbb4le@cheese>
From: Willy Tu <wltu@google.com>
Date: Fri, 21 Oct 2022 08:34:17 -0700
Message-ID: <CAHwn2Xn9rJAtswZ1N7+SJsdNFTmL857OO3f6dnwRBjGqG4nGEA@mail.gmail.com>
Subject: Re: New mapper interface proposal
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for setting this up, Brad.

Hopefully the new change is somewhat useful for people's use cases.

Best,
Willy Tu

On Fri, Oct 21, 2022 at 8:07 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Hi all
>
> There is a new mapper interface being proposed here:
> https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/57821.
> Given where the mapper sits in OpenBMC it seemed good to highlight this
> addition.  Please have a look if you are able.  Thanks to Willy for the
> patches.
>
> -brad
