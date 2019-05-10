Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D5619827
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 07:47:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450fNm2vKgzDqRm
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 15:47:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="TwLuC2oG"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450fN15Y9fzDqQb
 for <openbmc@lists.ozlabs.org>; Fri, 10 May 2019 15:46:25 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id k189so2991495qkc.0
 for <openbmc@lists.ozlabs.org>; Thu, 09 May 2019 22:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IXfMMIH4+fcnp40p0/cLZSddm34ebmCWNfDdW2++0hQ=;
 b=TwLuC2oGVFCzKj18J+OQbHysZX0v1hrJRRXH8+3V1MsPY7titIq2dK7hb4CkyV1KIX
 uATUm1z25xmq7MoTdRdMVny9DfSdONqL4KhGN2gov7TykOLDy5sU3kTV4J8GNxpc0jOD
 1fmMZ8gMMqDbWsu8pUOgyiQ/Df/Pc1oBfYeWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IXfMMIH4+fcnp40p0/cLZSddm34ebmCWNfDdW2++0hQ=;
 b=KNIDNeJrEwZimxxmVVvl971/d3uNLtHoL+aBf7rs1axUubE/mczF0SW4SbIYmKlMV/
 who7gaV/KTZhIx0BOGep8gjOZ+jngi80Zqtu3wT5TLeylx3vk9grwrLoCqo1egnVw/v6
 AV2Ab2chzmNdSkmXFWiQoFIFLkfE0l1gJ/yeX9G1xAtWgbISQxT/fbnivkaqPfW5wgfF
 2Sr+a2uDvYmsoA5DaxM5oiPGPgj+qsNzx+dAQYN7/bPPLFgpd+Htk1G4T+0cq9qMUCdK
 KV+t/f6nWZtrbhB+lrDRQF6pBqjXQLEDuKr8aUNi/QOF0YOsu0AHVUGRWcrDPFNDFscE
 jL2w==
X-Gm-Message-State: APjAAAWNtUu3JGwKOzLMg24vjaC54JbR2smJpZKd1WSDNHe+bihyM6Uc
 lwdbiH+M5qq8ZMd/EMSfRJn0F/r7/Wo6ciQTknc=
X-Google-Smtp-Source: APXvYqw4Ch2tXZMa+k5CIPCi+SOcw17dQJB+arOcBVrFH+jVXEl0qS1YDXEwAzP985Jpy2WJN6Z+fs54aZliFo+SZao=
X-Received: by 2002:a05:620a:166e:: with SMTP id
 d14mr6948159qko.11.1557467181554; 
 Thu, 09 May 2019 22:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XeSFx7LUKch3Vy+OVKaV=3P4UVWOXBkUF0WO3iKx47NVw@mail.gmail.com>
 <9a1adf03-ee54-0674-54bc-d5c37a9ae516@linux.intel.com>
In-Reply-To: <9a1adf03-ee54-0674-54bc-d5c37a9ae516@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 May 2019 05:46:09 +0000
Message-ID: <CACPK8XfQVySsmzUGLenPA5cM2AdCfgTzf1hO2cbqg1_D62tK8w@mail.gmail.com>
Subject: Re: Moving kernel to 5.1
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tomer Maimon <tomer.maimon@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 8 May 2019 at 21:45, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> On 5/8/2019 1:29 AM, Joel Stanley wrote:
> > Hello OpenBMC developers,
> >
> > Linux 5.1 was tagged a few days ago. I've rebased the openbmc tree on
> > this release and pushed a dev-5.1 branch to github.
> >
> > Please take a look at the bump commit, give it a spin on your
> > hardware, and +1 if it looks good to you:
> >
> >   https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/21212
>
> Intel platforms booted well. Thanks a lot!

Thanks to Jae, Tao and Patrick for the testing. George also tested
Witherspoon and reported all good.

We've now merged the bump for the aspeed kernel into master.

Nuvoton will be merged once someone with hardware reports in.

Cheers,

Joel
