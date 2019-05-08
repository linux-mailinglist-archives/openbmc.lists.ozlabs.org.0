Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 926FB17478
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 11:02:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zVqg0XY2zDqGP
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 19:02:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="U86jsMhx"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zVpT4tlmzDq6Q
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 19:01:51 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id d13so939975qth.5
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 02:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=aJbLHl3vY2wWBfTm2f03mZuzrKme0WFbDUiAuAladiA=;
 b=U86jsMhxiJImVPJkU/qGNblN6XdubpYchhKOzNHD2EsRNZe/0UqAMYi86FiQbmetfq
 SyNGwGdgPj0LlwoaKHGLab44nbCsZ7U36BkDEzGRCDX6k5FCZjiz6Sy6xHKK15Be+x1q
 95CylqFKgTGF0h/SA4ZDicnWQvMravXrC291U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=aJbLHl3vY2wWBfTm2f03mZuzrKme0WFbDUiAuAladiA=;
 b=ViNX2EBqHlPPadDgWQE97q9ugESTmbkShrQ1vIwheze7qk/z0kerSWlazxuvU8r72r
 CIOOi63mUqI12AO+TISmdkVmmu/e8/tAUT+2NTKw90ia20sfbQe0PbnsmjB4EqY1q72M
 sCAxlO43Sbn323QOpnb9jCsQfpiBLumyK4+kMo/kcU9V3Qx0ChnSfkCQWQEpZMku7qIS
 eKW7o8NYNKwDQ1SasyIfRMInOmjggsEeGprswQXGRnB6KF880eo8nVH5loH+JK4Dwpen
 n5jO3mrAfGGkMR6CWiuhzsdRrjBKmTmMAIB8m8IEk+uS2xX3aaLFKm3aOyIjnQrtzhcN
 EiPg==
X-Gm-Message-State: APjAAAUC/Btg+4GdLJguKf68MXqUv+HVaqiyl8gJLetD2ga/iX3QrTck
 HmupL/b3AbsmD6wIsGXGeuHIf0nhePRb7JgC0k//vXAF
X-Google-Smtp-Source: APXvYqwk+9ftyfS5hp/mqyd65e4qbP4DwV0rANARC8g5CGUxxC94J6MX/bYXcJCpBOOGWGktQxRUsmlOpn+wAalAYBs=
X-Received: by 2002:ac8:5352:: with SMTP id d18mr17594254qto.284.1557306108236; 
 Wed, 08 May 2019 02:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9PYRL4Pr2hV=Hz5dvTJzhx-x9WPJL12qZEKuh+DiCWx2RMww@mail.gmail.com>
 <CAHkHK0_FCE=QHF6tdD3DyGNcOMZHkhrkAZmgPwQ0Lr-G0-e9Qg@mail.gmail.com>
In-Reply-To: <CAHkHK0_FCE=QHF6tdD3DyGNcOMZHkhrkAZmgPwQ0Lr-G0-e9Qg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 May 2019 09:01:37 +0000
Message-ID: <CACPK8XftUZPWf_1hVaFu-iw7Hd1CT6oBcUHsAWcX1NVYRyLzQg@mail.gmail.com>
Subject: Intel kernel patches (was Re: Is there Intel node management support?)
To: James Feist <james.feist@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 8 May 2019 at 03:44, qianlihu <wangzhiqiang8906@gmail.com> wrote:
>
> On Wed, May 8, 2019 at 11:22 AM Deng Tyler <tyler.sabdon@gmail.com> wrote:
> >
> > Hi all:
> >     Is there any package support Intel node management in current openbmc or plan to support it?
> According to my understanding, you can refer to these repos:
> [ipmbbridge] (https://github.com/openbmc/ipmbbridge)
> [node-manager] (https://github.com/Intel-BMC/node-manager)
>
> Also need the ipmi related patch here
>
> https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-wolfpass/recipes-kernel/linux/linux-aspeed

Is there a reason the Intel team has not submitted these patches for
inclusion in the kernel tree?

I encourage you to send them to the list for review and merging.

Cheers,

Joel
