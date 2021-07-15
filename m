Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8829B3CAC8C
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 21:35:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQl3G34QVz3bk1
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 05:35:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=x+X7r/05;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=x+X7r/05; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQl2W6sW4z3btT
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jul 2021 05:35:14 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 o3-20020a17090a6783b0290173ce472b8aso7211433pjj.2
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jul 2021 12:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tWQzYFArmX7BK0KtHhu7qCMLH8EpJJltCicUZnmhozs=;
 b=x+X7r/05mLeYMY5IOOQXqOPlH4+7oeO79bZ5YPDJ++PHDQKt0r4FcvE/lkq15akq7B
 Ce5RF/y77x9dJasWX7jMdKXiDyCRNfCPc0xcdgmMO0nH9GJ8PcKjDkDCNNwh88V3I8q+
 DVd8W4UyeBtFOTbd2yOFKy6XhIXfiUb4cjWvUYZNsBW6xRsYQlKKhDyHMQ8HR13L0zF5
 yJn4825mzOpNHdMV2eZ72kAoCCdIieowUKQvUmzKFsCD1CehD3TdyOBZuq4PFKBRFYvE
 J7XyrEX7xMecHu4TmiRqBc6ToIEqTL1RABDWAcgFcJqtXWCwwkUwT8cTATLu+1RfuxFH
 zOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tWQzYFArmX7BK0KtHhu7qCMLH8EpJJltCicUZnmhozs=;
 b=hiv4RA+zSBWHHJI6Tg6Y88GULuMZHMLxXpWn81H0FN0SzlwZsmsDt9MW+hg4Omz1xD
 x8A6tPtw4/MbMoPcyq7qIfamRZCuR96admRYs9Vk8/SWCnL8kGwM/AQ42NWOLdmUjveb
 J+1i1DBpB9CA5sIZQIwoOxyOWA24zRLdm+JWnfhluKhJkDcC79pYavZU3LNvqtLRXtzv
 65oaWnv0yBhQFiDX8+8EgUKFl2A7ZkCbgdmaUtdifWuizO+xeM7eppgGHuKT58F57goX
 zHY9w1UBjXMfYZsfDkd72S+q8sjgZeI5dCWkbEFWG0mnTFQtYTSbDmXFCyp5ija5ySfp
 24Lw==
X-Gm-Message-State: AOAM53224q0CDAUT/9dpmw2FPwm8VceiyNX727Nr6RRrp8b7xFLwsYKO
 0JEIueW43B2Cd/gyXL9Fw3T5IaXWLgjU76WLFxU3UQ==
X-Google-Smtp-Source: ABdhPJwxNVyUFsXl8r6NxD+c6uWM8R2fmbcCrxfwX4wABHvVgCgyv6hXJdQx4qtT/3WKROCvcTTm94Gam5hqhrB02Do=
X-Received: by 2002:a17:90a:8407:: with SMTP id
 j7mr11756922pjn.13.1626377708767; 
 Thu, 15 Jul 2021 12:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <3b9cfe5f728c40c473a22070029c8790b452daf4.camel@intel.com>
 <fe9a5191e401b38325aaff11365b5970034d26cc.camel@intel.com>
In-Reply-To: <fe9a5191e401b38325aaff11365b5970034d26cc.camel@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 15 Jul 2021 12:34:58 -0700
Message-ID: <CAPcyv4h-PrBhPU7FcuKwk++o5unKY03H85M-inpDGvmDh-ybGQ@mail.gmail.com>
Subject: Re: [PATCH 00/14] Introduce PECI subsystem
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 15, 2021 at 10:33 AM Winiarska, Iwona
<iwona.winiarska@intel.com> wrote:
>
> On Wed, 2021-07-14 at 16:51 +0000, Williams, Dan J wrote:
> > On Tue, 2021-07-13 at 00:04 +0200, Iwona Winiarska wrote:
> > > Note: All changes to arch/x86 are contained within patches 01-02.
> >
> > Hi Iwona,
> >
> > One meta question first, who is this submission "To:"? Is there an
> > existing upstream maintainer path for OpenBMC changes? Are you
> > expecting contributions to this subsystem from others? While Greg
> > sometimes ends up as default maintainer for new stuff, I wonder if
> > someone from the OpenBMC commnuity should step up to fill this role?
> >
>
> The intention was to direct it to Greg, but I guess I didn't express
> that through the mail headers.

Usually something like a "Hey Greg, please consider applying..." in
the cover letter lets people know who the upstream path is for the
series.

> I am expecting contributions - for example there is at least one other
> major BMC vendor which also ships PECI controllers.

You're expecting to take patches from them and you'll forward them to
Greg, or they'll go to Greg directly?

>
> From my perspective, the pieces that make up a BMC are pretty loosely
> connected (at least from the kernel perspective - scattered all over
> the kernel tree), so I don't see how that would work in practice.

No worries, Greg continues to scale more than other mere mortals for
these kinds of things. I was more asking because it was not clear from
these patches, nor MAINTAINERS, and it's healthy for Linux to grow new
patch wranglers from time to time.
