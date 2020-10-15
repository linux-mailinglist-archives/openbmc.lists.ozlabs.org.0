Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAE228EA8B
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 03:56:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBXTH4ZRGzDqWP
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 12:56:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=bFJ2UyVL; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBXSc2vD1zDqTT
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 12:56:15 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id n61so1502415ota.10
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 18:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HDwYcFHZ1d/moG4p6bsX7Tkrfy+nk8AQk3zcFSzC6Cc=;
 b=bFJ2UyVLFLnZEsVrqSvG8WbRSR7ypZPS5UdhG/MraujDxH+Lt9voimHYW2ZsEC9Dvl
 XfgG5hudyt1j5i3yuFrjNw7AHCyrg+LmFjP2GE9nYeAP+b9pypogNUgau6PEZiAsheUI
 vjm1xKNL2u2+XQzOtDYQ98Sr31AeGPGNfOxxCtbe8r1TlCPSixOUouZ+HFbrpxU3H2bF
 cK0vs91M+Qda9g7p4BPBuxGC3LFrUdd8dIs4cEhSvQ9airGMTpC3X1qQ9Tj+v7O5zDj2
 UNFY7lLdFKBiXqHcTC+d5kVGDJOtPHZQcQ2Qjznr1O7/wNkJA9QgkNIkB3LW9IBPV76B
 Xycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HDwYcFHZ1d/moG4p6bsX7Tkrfy+nk8AQk3zcFSzC6Cc=;
 b=AWVA9XRdKHWXQTKHJiX9ZoIzqt+G1M7EEUm4qZVoAROp2HvrluPi5Ntsft4IoaHh1m
 RElRdkw3PI2Rz05CVkOHN2MbRLiCXM0ByU9LiTNGEZLztqI3bB+dSgoPwp8aqZz1aB4E
 nngtGpfarhjf+LbrX1yyknkEy3RZvKdnScWE1GDe1CC3A7LCCtGs4hNFrLcI8jYcW41c
 fBKJD2v8UPTniVsyKT1QnUT+6xeB/TyC5TPs9F3zMkqBX34HqxXeDH5XwQlpvJWYGeVw
 1S1otd2tdlOgqdfX98HkOCbKgffWSUDyOfBF6DFHMcRE0CRJjORbIQXyO7fROA5YcjrS
 metg==
X-Gm-Message-State: AOAM533zYC2+oOGZnnijGlrHvFonJ/CKXwbYKhh9jFF0LW7w7f+wS+Bo
 tC4mTj88iKqX5jWgAN/qw2MGn2Ay6+QDU4jO7P7bQQ==
X-Google-Smtp-Source: ABdhPJx4dtdA30vj2uwsp36sYgWoVJQfXaEgVoKK4NC+pAb8IgK+kno+TgwPNYUiH2+KgPCV6c7rzZO7XitjJCHXtc4=
X-Received: by 2002:a05:6830:1bce:: with SMTP id
 v14mr1033915ota.361.1602726972158; 
 Wed, 14 Oct 2020 18:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <65961456-D5F6-41CC-AD10-93E716386953@nvidia.com>
In-Reply-To: <65961456-D5F6-41CC-AD10-93E716386953@nvidia.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 15 Oct 2020 09:56:01 +0800
Message-ID: <CAGm54UFhaViOLjWuGQXW3catJ62Y1gx5pA89VDZ06TtshXFbvA@mail.gmail.com>
Subject: Re: Kernel panic when net booting OpenBMC
To: Nirenjan Krishnan <nkrishnan@nvidia.com>
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

On Thu, Oct 15, 2020 at 7:43 AM Nirenjan Krishnan <nkrishnan@nvidia.com> wrote:
> Could you please suggest how I could go about debugging this? I've followed all the netboot suggestions from these threads on this mailing list:\
> - https://lists.ozlabs.org/pipermail/openbmc/2018-June/012054.html
> - https://lists.ozlabs.org/pipermail/openbmc/2015-October/000010.html
>

Probably you could follow this one
https://lists.ozlabs.org/pipermail/openbmc/2017-December/010264.html,
which successfully boots the BMC from TFTP + NFS rootfs.

-- 
BRs,
Lei YU
