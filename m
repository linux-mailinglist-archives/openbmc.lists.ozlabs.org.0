Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2275BC9564
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 02:10:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kD1D5Hx4zDqW5
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 10:10:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="KKfjuOIA"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kD0d1PmZzDqC0
 for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2019 10:10:08 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id q203so606144qke.1
 for <openbmc@lists.ozlabs.org>; Wed, 02 Oct 2019 17:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wa+c/hXxwS+jqDAivgo8iHbkNxCIIllfKQ4qiyL9MEs=;
 b=KKfjuOIAd7I+ca7TXiQApchrH0XtYYiN3WhJmYXmJS4MHsTXO0R3TB0DFKEXRYpDqj
 uaeFUt9osmm2I1YHbJmmLuWa11Ok1locibWK/hFxXR9V92uJtrVSbYCfJOLEeJBMaWj0
 4LR5HcL32A7HPIG7fpl98fM1X9lUk3rVWD7D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wa+c/hXxwS+jqDAivgo8iHbkNxCIIllfKQ4qiyL9MEs=;
 b=RDzxXxMCrx/gYjug0FV0cpAAEURpv9Xf/ADv+Tw7gFQzCiHQ9biZW1ASeRPd/kPdbX
 8RwOB4x3c2FeCi2TwJ5Z7CcAV38H81UAFYrAtGQBHf9kmEw9b3kK/K+yecZ9mEdWS/NO
 aRiPaLI/uJz4KPfXNfW9OIMJDyQQ6LXdNuAwl/MkiumNcj/wd6SvR9a+E+IFEMf09zYQ
 Bbgk1h+RUKICn+MAwrFOHlZwxVawcFmfZwOhf4BsTMROBxlYl1R9wR+s0QsNl4xYuq9+
 kx9UPBXwAcHc6q5PFU5O4XTkjq4HUl3OFubOjKP5viiuL/GSvKi68i0c3+WtFe5/kD94
 mYnA==
X-Gm-Message-State: APjAAAVlb1C8dfMjcrkCKlCq0XfyQ67sTB0QfGxEtISWZemN35kqbf/F
 EaWqxnvSulYZFPQtWlG+Jr7DEi99O5NreHvuDXI=
X-Google-Smtp-Source: APXvYqzLGZeiFpEpmsHF8p5XDMs5gJlFY65GWpboMtn1O4GcdKmZe/y0vQxOHXzDwdKGAfUHKVOrfguaf3DsKxycVB8=
X-Received: by 2002:a37:a44f:: with SMTP id n76mr1667811qke.414.1570061404755; 
 Wed, 02 Oct 2019 17:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191002102328.5196-1-joel@jms.id.au>
 <20191002102328.5196-5-joel@jms.id.au>
 <71992bb4-445f-45b9-aa0a-5eaf0dc71cbe@www.fastmail.com>
In-Reply-To: <71992bb4-445f-45b9-aa0a-5eaf0dc71cbe@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Oct 2019 00:09:53 +0000
Message-ID: <CACPK8XdzgOHVwwPmrecmGqyG5P2vMwLrdHK3zTYq32VfnAzhSA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 4/4] ARM: dts: tacoma: Enable LPC Firmware
 region
To: Andrew Jeffery <andrew@aj.id.au>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 3 Oct 2019 at 00:06, Andrew Jeffery <andrew@aj.id.au> wrote:
> > +             flash_memory: region@98000000 {
> > +                     no-map;
> > +                     reg = <0x98000000 0x2000000>; /* 32M */
>
> Should put this at 0xba000000 if we're going to use 32M, or if you want to
> use 64M like Rainier then 0xb8000000.
>
> 0x98000000 isn't wrong but it fragments the address space more than
> necessary.

Good point. I'll move it to 0xba000000.

Thanks for the review.
