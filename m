Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1839E6C365
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 01:03:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pt923MVwzDqM4
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 09:03:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JJnbgeHA"; 
 dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pt8Q2vrxzDqLp
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 09:02:46 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id m9so12708672pls.8
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 16:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vpX7qIbNCeavSMo1PvaWR+CrClFm2WodOyHwj94hXWo=;
 b=JJnbgeHA35EJh/SBxNJDySicVbqVPrpHSQaI4JPE+HcxVXB7AFrehZn3yJ6YOGx7lT
 TPWfmyPnSCnIDYf1gxKHT1e/KBjYO1nAcsxkFDrOCUcV+fzOlSVuh+3WxAQ5jPNXeFIz
 jHpCJm1L76NbzF91dCgfeAh+LkVUYOQy0eSNCglG17XTH6CocJ2GysBgqXM+Yrb47oMA
 /SSLfF0I1vfDboAkXGXmEoxaSFc6jNqSU89mhdpTxcxqsbAKPaAxgTFG45atjsQZWQIV
 GyoarCsH5tghtWy6Ny0D9czwzvV9LZalyNd+sgkql2pCBBf6lPP/79WrK0ZCKczKF7d+
 0unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vpX7qIbNCeavSMo1PvaWR+CrClFm2WodOyHwj94hXWo=;
 b=lmeBDCWDlrlFRzkY87N7M6RwBTELuLIz3JErf4XcWo4emeRHoTWnJZYBVNVbYcWfaf
 wxeYpNolvTzVtVOBg1nANF3tdaZ6paDsq+lzyEmTKVPa1hth9aBECM1pEw/I3lf9xfzk
 SDuilwkW3h95QSlMVoZU0BWJEr3rR/EJPPYmIUNUQ+47z5NQM0p6XnnvSBpKADO/bkwq
 OghHj965vRlb7Oq3Agc2yq2tFCpQORXTIAGJGVmJZCQ/WHReSmslJKoSOXorhRjaeYbX
 PJKyAFwuh8ZKWRca8map6y6XIKgDPMqk/0fY8Kv/FU6wS9QeosJfHX0fkD1Hbntm3u5M
 J8dQ==
X-Gm-Message-State: APjAAAVZxzh3zmiLLCZhzJRaL5QJWt9zSL/X09ckaKyfCw0hjRBj6FZS
 10zgOcHjPPFpAAhIR6YeIAGVK2k8/2LDJhA30PFuWw==
X-Google-Smtp-Source: APXvYqyUHQhjHNsKEU3qgCeH0Ltxzbiuvb3DBM1VFnx9uNdEqTQX52v2o8JZ6E07+t9E4vb1+hvk4Vp/YIZiLtR/9z4=
X-Received: by 2002:a17:902:b944:: with SMTP id
 h4mr45234107pls.179.1563404563353; 
 Wed, 17 Jul 2019 16:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxgpy8N5bf4GyqgoTaw6KdRgCUE7jy5Jk-a3-TZDYRpwQ@mail.gmail.com>
 <20190717203722.GA31389@mauery.jf.intel.com>
 <7bff7bf4-6eb0-4327-35af-20f758061c40@intel.com>
In-Reply-To: <7bff7bf4-6eb0-4327-35af-20f758061c40@intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 17 Jul 2019 16:02:32 -0700
Message-ID: <CAO=notzOsYf6-xau+mqaDOpHQQkf_FdFApRc96kWN0MDjbZJtg@mail.gmail.com>
Subject: Re: Super Short OEM IPMI Proposal
To: Ed Tanous <ed.tanous@intel.com>
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

On Wed, Jul 17, 2019 at 2:56 PM Ed Tanous <ed.tanous@intel.com> wrote:
>
> On 7/17/19 1:37 PM, Vernon Mauery wrote:
> > As much as I don't want to tell someone to cut and paste code, I can't
> > really think of a good way to share something like an OEM command that
> > doesn't really have a shared spec.
>
> +1.  Unless we're looking to do an OpenBMC shared OEM spec, which I
> think would be interesting to discuss, I'm not sure how to effectively
> share these kinds of thing especially when the needs of the commands
> change over time.

My thinking was it within the OpenBMC OEM numbering thing.
