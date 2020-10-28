Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3854F29CDD5
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 05:30:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLbGn3lcszDqNp
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 15:30:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AWk2tSUb; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLbFH5ZZkzDqNs
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 15:29:23 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id m9so2734535qth.7
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 21:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZfPWE7faUqLcGTG6SU4g9kITznfqE6uphsD64EkHlO8=;
 b=AWk2tSUbrhz9AcWONIeuX85lqJ9DHLGLA/ooe9nIRXk5SErAfHjNPV2bm8WozryNif
 Z3L72GIqG/lO4GbofNUbnYL2Yb0xrFre/WbkbIZ3fTgWP/dPHAyInQwPQeG7BvoHFSPY
 QHS81HPc08WAKbmG/gC/AEiDNXs/pGf4V0HAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZfPWE7faUqLcGTG6SU4g9kITznfqE6uphsD64EkHlO8=;
 b=KHR+/CgUV+XB0LSr2D86qeqKt5VB5acjR6ZtC7o+vNZx3WzVaULG4HBNxLykOrZaoe
 xxS/f3E4DP5SECbGYRolMLsYsL3w1TMrdGRYJSasUOTI8vTZsYaIjGHdcTABJnViHIC5
 gYkk4PUfLSABMeU6ul2KPqABgqI+lBfoqBo2iQQw698KLrQK4gJqTj9/WFXZR0VoOP3e
 AX2LRqEjJNxTuUoi05DH43KBHUQEwCVuwjNdFUg3ZhpwHOtrMqdiLPFwlyoYmL+kk9Yh
 s6KV3pNjyNbG9v2V0DqvGIlXGeZfjCJ8q1uUUPkUWp532tnwdEBYvZggcdCjuhvgBrOX
 +5Gg==
X-Gm-Message-State: AOAM532DzJ4ZbdHYBxXxr/oPhu9z/W1hXHp3i/VN502cCaZuXhxMmsYr
 U366PpE/4J37zNs22e4EfBb/4U3Gd/MyCNjZ67g=
X-Google-Smtp-Source: ABdhPJx0YVubZ5CsM1jvKpaphyr1vpKKSgd8mTjidgQOA6+FDEFMZGkIz2RCij+9koUmjCVfxTD0SUoz+ytxo8visDg=
X-Received: by 2002:aed:3325:: with SMTP id u34mr5626312qtd.263.1603859361455; 
 Tue, 27 Oct 2020 21:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200928202753.58351-1-eajames@linux.ibm.com>
 <20200928202753.58351-4-eajames@linux.ibm.com>
 <CACPK8XcfK-KbuQOpL--jpzMuTaWrXNVHj-Z=fkSUaBFFPK81mg@mail.gmail.com>
 <348a64cf-91a2-8852-d2c4-3f4a37d5569b@linux.ibm.com>
In-Reply-To: <348a64cf-91a2-8852-d2c4-3f4a37d5569b@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2020 04:29:09 +0000
Message-ID: <CACPK8Xe4ThBz_b-Bs_VkChU0kofO+f7nAJXoZOfdnvFw2geBpw@mail.gmail.com>
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 3/3] configs: Add AST2600
 SPL eMMC configuration
To: Eddie James <eajames@linux.ibm.com>
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

On Mon, 12 Oct 2020 at 13:36, Eddie James <eajames@linux.ibm.com> wrote:
>
>
> On 10/8/20 10:44 PM, Joel Stanley wrote:
> > On Mon, 28 Sep 2020 at 20:28, Eddie James <eajames@linux.ibm.com> wrote:
> >
> >> diff --git a/include/configs/aspeed-common.h b/include/configs/aspeed-common.h
> >> index 4c83035d3c..876958735b 100755
> >> --- a/include/configs/aspeed-common.h
> >> +++ b/include/configs/aspeed-common.h
> >> @@ -41,6 +41,12 @@
> >>   #define CONFIG_SYS_BOOTMAPSZ           (256 * 1024 * 1024)
> >>   #define CONFIG_SYS_MALLOC_LEN          (32 << 20)
> >>
> >> +#ifdef CONFIG_ENV_IS_IN_MMC
> >> +#define CONFIG_SYS_MMC_ENV_DEV         0
> >> +#define CONFIG_SYS_MMC_ENV_PART                0
> >> +#define CONFIG_ENV_OFFSET_REDUND       0x15000
> > 84KB? How was this chosen?
>
>
> The env is at 0x5000 in the user partition, and is sized at 0x10000. The
> redundant follows it immediately...

Can you put that and the information from your other email in the
commit message.
