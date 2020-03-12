Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A641826F8
	for <lists+openbmc@lfdr.de>; Thu, 12 Mar 2020 03:12:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dC5k5RLRzDqN6
	for <lists+openbmc@lfdr.de>; Thu, 12 Mar 2020 13:12:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KHuAcRDs; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dC5232M0zDqKT
 for <openbmc@lists.ozlabs.org>; Thu, 12 Mar 2020 13:12:05 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id 19so4567131ljj.7
 for <openbmc@lists.ozlabs.org>; Wed, 11 Mar 2020 19:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0krW6nJZRe2uhimfMWWzYEnL64dCYTo5Eqt51ou4ZRA=;
 b=KHuAcRDsO3Pf/FSM/P2bN91U+0/9o8U8oB0Bj9sLwchHKDm/5Y1hEa0t9mqx+FgPLQ
 TajLjwJFuW1iDjzd9lzvJnky3HRyvEGSMilg5voLRkKxpmcWMDbJCG5e4eYOhrI8bLdT
 r7GM5AdKhYiZjhfi2sJAxjUm6BWB1ZUGBcw5DaeVaMJ2Euz966KTFQOvJr/7uaRZH1ag
 YU/CtloKQ0ogQ9BoLm/zkUWuaS5FeG7IR8U+v2nEsdbE54GGvISmNRhcknkOdQ+XloEy
 97M5Xb0XWIPWLw1bITJUFsT5ZuGIMDS6qW76DPPurD/J/MjJkKvaGo9/IlRJTe0d/bnD
 ONGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0krW6nJZRe2uhimfMWWzYEnL64dCYTo5Eqt51ou4ZRA=;
 b=pl6d4gw1Zl/mNhmdozNBdB3nov4H+b5d2Vq9wHKCcSgiHWAVpIFQQfToqd5WC//qlc
 vasaS7/nvgtCI5W+1Qu1Z13CFYo2Cec3ctM0jic1MYpfCLeTdWxKSW73pgJKSy7lM5bA
 zEhY5nMA22rsuESN/VidUIXhC8dxZQD/TCrU6VKEOaEF3yhR9DPmaAoOxNQWWQ+vWXsm
 YANaDhrVC2NMMGMGZOlqo1bHp5AsPqzOSHTlgHPqt61Lju7C6Q0js3wkQHpFmQu6PXdS
 aNoFPor1h3bSTgDDUQX7aG2A3wsU5X20TwT1GKFpn6Viy4TynO9WVL8PJEVhA2dt9j45
 fpvg==
X-Gm-Message-State: ANhLgQ3uvRILu0WT6fkWn+1+D5rzX63uYpcA9Gi1qHzdUMtqnZIeOk4J
 8Nyuq8fgLXEpuV08QrHqkhqJOk/VhOL/YOYraEs=
X-Google-Smtp-Source: ADFU+vvnXLWliR3oJmo+SdVAeNeSsukdslo9AbssqXqpSFayDeyS55x63zifdZn77wnxVNaY5L9yJLAH27cFkv2tkKU=
X-Received: by 2002:a2e:730b:: with SMTP id o11mr3617914ljc.228.1583979120677; 
 Wed, 11 Mar 2020 19:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <OF332527D2.5730A8E1-ON00258528.00318A0D-00258528.0035ED8F@notes.na.collabserv.com>
 <20200311185439.GA4044@patrickw3-mbp.dhcp.thefacebook.com>
In-Reply-To: <20200311185439.GA4044@patrickw3-mbp.dhcp.thefacebook.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 12 Mar 2020 10:11:49 +0800
Message-ID: <CAARXrtmK-=VxFNf-FwW45OH9ed8N30oYmEAJZ57B8Ac5+e8pgw@mail.gmail.com>
Subject: Re: Uploading authority certificate with expiry date beyond 2038
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
Cc: Devender Rao <devenrao@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 12, 2020 at 2:56 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Mar 11, 2020 at 09:49:02AM +0000, Devender Rao wrote:
> > As time_t data structure is defined as int32 it can hold up to a maximum value
> There is significant upstream work going on to transition time_t to a 64
> bit integer even on 32 bit machines (x86-64 and ARM64 already have a 64
> bit time_t).
>
> Kernel changes are already in as of 5.1 to support a userspace with
> 64-bit time_t but the kernel itself uses 32-bit internally.  There is a
> merge that is heading into 5.6 to change the kernel (but I don't think
> we need this):
>
> https://lore.kernel.org/lkml/CAK8P3a2iZyA1VSFqvcEc9o59F76GgzLBiOAmEuHKD81FErPLDQ@mail.gmail.com/
>
> That pull request mentions userspace changes coming in glibc-2.32 that
> will use the 64-bit time_t syscalls and transition userspace over to
> 64-bit everywhere.  glibc-2.32 is scheduled for August 2020.
>
> > Probable solutions
> > 1) Do nothing as the chances of uploading a certificate with expiry date > 18
> > chances never happen
> > 2) Return error to the caller if the expirty date is greater than 2038.
>
> With this in mind I'd go with #2 in the short term until we get the
> upstream changes.

Agreed, a fair certificate should not have such an expiry date.

>
> These coming changes should cause us to think through any cases where we
> might be relying on a 32-bit time_t, especially in serialization.  I
> have a little concern that we're going to end up breaking some upgrade
> paths when we are using binary formats (like some code using Cereal
> might be).  How do we want to audit and fix that now?
>

There is an interesting article in LWN talking about how Debian will
handle the 2038 case:
https://lwn.net/Articles/812767/
