Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C400E3F9423
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 07:49:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gwph14Tk7z2yPc
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 15:49:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NlNKNb+4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=NlNKNb+4; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwpgT6GbYz2xWr;
 Fri, 27 Aug 2021 15:49:07 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id x5so4505719qtq.13;
 Thu, 26 Aug 2021 22:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MSsI/7qJw1DvArF1vTWLSwP6sgJus0lYgVXPHZzbWNw=;
 b=NlNKNb+4bv2FUlOgawKpK9Syn6Uunn5dhrsmVyo9BrxycCda079nn2w9aRBTasSyZz
 BedTU3R22l6Jv10f+tSvk6aATiBtFM9PR4H5ir6SE8e8SWVfMLhhsg26/Hfx5PH4fef+
 Lpl8XUy0u49lRz4H884vkokOXXNiWTxMQrx28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MSsI/7qJw1DvArF1vTWLSwP6sgJus0lYgVXPHZzbWNw=;
 b=AGh3L7hJkRgewqiXPjiLQ4JxcMBIL5vzBEBKH2sxEKY/8QKTPBYaygPWQAz1SiTG1R
 lceC5BcVBOQ0qFjT+JAiFmE8L0rwLqctQtoHVzrGI4u+FwKwKrblpIywxNSa+GRPLZj3
 tWe4WYEsVnQ2LiPlVAa2g+lm4reMyHX1J2RAYQqRU5kpyISqQH8xvnUUfVeiTa006dTX
 H6P2zBvfVzNODYOhYDx2uhU4mpV8kTB0Mwa1WYYiqnRLxLRmc2uwTn4cmgmIwsXGnb0g
 kXsLOjxIlqTHNY09FlAGmi+Gl83zOb4QOZSJriutRW78YM+r6A/p45KPg6lbnTb6FRMj
 tutg==
X-Gm-Message-State: AOAM5308CGvj7kC5wwulp42NsCXr5caMsQExPz8RBXfBrlkwGwYfYAOS
 W1MFxBtcm5UiLirdMwdBvHpdBkGavsfB1O0QxMI=
X-Google-Smtp-Source: ABdhPJwx0VRG+mEdKimqU3fnKkuUHiC7yML4WfO0SFrgcfCEd2XorGNmSgGMqMdj87H5pAQvxCgvZCfzwVWhrfJffuw=
X-Received: by 2002:ac8:4b64:: with SMTP id g4mr6983536qts.263.1630043343101; 
 Thu, 26 Aug 2021 22:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210826061623.6352-4-chiawei_wang@aspeedtech.com>
 <202108270732.OvBQ4K3D-lkp@intel.com>
 <HK0PR06MB377927BDCA9CC79B598251B291C89@HK0PR06MB3779.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB377927BDCA9CC79B598251B291C89@HK0PR06MB3779.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 27 Aug 2021 05:48:50 +0000
Message-ID: <CACPK8Xf1g2fp5X3ELBUyjzP6Fmvt1XWLU_UgCKdZaDVjdyKryQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] soc: aspeed: Add eSPI driver
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 kernel test robot <lkp@intel.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 27 Aug 2021 at 03:52, ChiaWei Wang <chiawei_wang@aspeedtech.com> wrote:
>
> Aspeed 5th and 6th generation SoCs are based on the ARM 32-bits architecture.
> Should we follow the report to make the driver 64-bits compatible?
> Or revise the driver to use more specific data types?

Yes, in general it's expected your driver will compile cleanly for
64-bit architectures. This helps with testing and static analysis,
where CI builds all the drivers for x86.

Cheers,

Joel
