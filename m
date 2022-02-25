Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 461374C3D5C
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 05:41:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4cXp3mMQz3bVW
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 15:40:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JTnjIR//;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=JTnjIR//; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4cXN5nsmz3bPK
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 15:40:34 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id s15so1491496qtk.10
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 20:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CCjKRxZAXW/MBZvYzM6o7wd7m4G4J31IhDmj/wpgx2s=;
 b=JTnjIR//aOF5zvS+qYrBkZfysl7lDsfvuQNdT16dYXok54o4N0QOsynx6wAzbjxMZT
 x3f1ddkRGnWuULrRsECJwfa6rpDWAjljAFkxZzFsKNK/i1/lzXYqrIaF8f45EXkBJxDa
 LLSkdGUy5//PvlZq/SdFV5eY6vk3Ex9fbIjGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CCjKRxZAXW/MBZvYzM6o7wd7m4G4J31IhDmj/wpgx2s=;
 b=b4whWkgqegOSbEIVYgk6dTMPOcMvr8iiohAtAuB+CTaMsmlJbF/X8q0UnJXGqnC0YJ
 oEgKlMKshkW36XFRaN7HEI90+IxZQ3AKPlgQPjoRX3YxRERow4pGhAQP2rQWfvj4jiEb
 h7esK44kyK5LW7YTO108Q67968SQXhg2X9+5zGzl/oZWwIwUx+iDZy73gD3Eq0Tk6T/i
 Ey4MRmJKnx8fUbtaUlwbCk7FDmVXlEGb/CGE7w68U2IEa3/XEA3O+P9gTDONelsxErVz
 dZGDa2HTM1SKmoTQ/4u2/tNkCFRZu2Z1dKaZgPdaJfyhYOupZ737OfsUeo6kse2q/HC9
 jIdQ==
X-Gm-Message-State: AOAM530W3lsAWpbVVmdoANKB9tJ3Y0UHvPftRcI8qawHzjsyK81T/4Ou
 5H/zAwls+9kCROM4cIVcijsw3TkKxgLNZNZKLyw=
X-Google-Smtp-Source: ABdhPJwQOuBC2gisTH5IJTa9g5T/OOBT9pa8H5p/gtD3hAZwEoFbKw4ztsqAGzWnApeuYi60ohaB87+1SBccZSdbVwo=
X-Received: by 2002:a05:622a:1b8d:b0:2c6:59a9:360e with SMTP id
 bp13-20020a05622a1b8d00b002c659a9360emr5365137qtb.678.1645764031799; Thu, 24
 Feb 2022 20:40:31 -0800 (PST)
MIME-Version: 1.0
References: <9C969ACE-F369-4A24-995B-5797426DDFDD@gmail.com>
 <CAD2FfiHBHrc2WSSgsQUWqobYwTv+8wrEaQ39Nyr0F6Ed59TiMg@mail.gmail.com>
In-Reply-To: <CAD2FfiHBHrc2WSSgsQUWqobYwTv+8wrEaQ39Nyr0F6Ed59TiMg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Feb 2022 04:40:20 +0000
Message-ID: <CACPK8XfJ60B5aJchrzSDV5xDZuqYqLU0wRJ_+iq3um17Zeztow@mail.gmail.com>
Subject: Re: validating secure boot settings
To: Richard Hughes <hughsient@gmail.com>, Arnd Bergmann <arnd@arndb.de>
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
Cc: openBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Richard,

Long time listener, first time caller. I appreciate all the work you
do with fwupd.

On Mon, 21 Feb 2022 at 19:49, Richard Hughes <hughsient@gmail.com> wrote:
>
> On Mon, 21 Feb 2022 at 18:23, Andrew Geissler <geissonator@gmail.com> wrote:
> > So, anyone else interested in something like this? If so, any votes on where
> > a good place for this logic to reside would be?
>
> This seems like the kind of thing that we'd be interested in for the
> HSI specification[1], although I appreciate that's only tangentially
> OpenBMC related.

You might be interested in this patch set which Andrew's mentioned:

 https://lore.kernel.org/all/20220204072234.304543-1-joel@jms.id.au/

The idea is to have a set of sysfs files that say "this machine has
secure boot enabled", and other interesting bits about firmware boot
state.

You might already have that on EFI systems, but this would be
consistent regardless of the firmware used. Reading through your HSI
spec, we could also hook up the "read only SPI descriptor" file. I
called that opt_write_protect in an earlier version of my patches.

I have been chatting with Arnd about how to get it merged, and have
some ideas that I'll send out in a v4.

One thing we want to get right before merging is coming up with names
that are meaningful outside of a single firmware (eg EFI) or SoC
vendor (Like the ASPEED names I started with). I welcome your input.

Cheers,

Joel
