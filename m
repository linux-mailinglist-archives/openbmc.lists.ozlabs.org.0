Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D31522C05A
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 10:00:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BChSg2CcczDrQG
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 18:00:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MBDrRoFh; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BChQ61CfWzDsgr;
 Fri, 24 Jul 2020 17:57:49 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id x9so4027042plr.2;
 Fri, 24 Jul 2020 00:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xv1zcnsXMWiFNO1yGG77PvS7le6RI8NhBpIqWlz5EF8=;
 b=MBDrRoFhTThMwn4vuJaaJ1dUYtoHvJ9AvJUl0nf0zlaZSI6t6TWtrxf9QZLT16Cjac
 H23NM9EEsXLczUcARcfJgpW3/75JTNWtoVXlH1i8PJQYqMUT0IESJDkn6TJLdVsA1URB
 ZmMzUC35wS3XEC3figGP8sKiEVYd0Pxdb1pSLbN+YB9N14rqtIQaLMc8yI3lP1ATVkC0
 C7F6xEs3MNco4mv0eLNtiF+a5dTIWyog3K+3h57lmwPpu96CBzsjOk0L9KTnAfJmfJg/
 Zdl7/zxuRdCOtE2s5tYxBtXqjB1YznlEDwOmetthQnbq7IjCYMMoxf/PzdJjvpaibbjs
 VPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xv1zcnsXMWiFNO1yGG77PvS7le6RI8NhBpIqWlz5EF8=;
 b=iyt5zoMB2SIsd7Xpu2X0F1rGO8ZkNZ4UZ4evB1eYIX0xAelQm2qqRbxjtPZ7GoU69s
 cbyLvbflcT8sre4dCcvZC4iVMAJAgfiQcaYVqnp9VY3tGblwr4Rry844uSrO3mzCy8aO
 BjjeeA+0pKaa9f32/3WItVeQnJnhE1QMOoShJjho1Q3E+qcvTNq2B4JRnVqlfVm42/me
 lot9MMO3nXfH0S1Jztpsj5yPwgNAa5tj+jcWrpFvs/2JgboKEF9RkxpLCc+RhGkx/8Qj
 o3ZqsA7qvnnH4uucb0z5CXdZ6q2tGQp7lbKulL9x01rxzJXyVQi0M4bX3qB/H84FuWM9
 nRjw==
X-Gm-Message-State: AOAM531oOnrLSWqHm+0mQ5wO3zXcS9kU/I+cJUdWzJaC9XcBo4jrZfEn
 sODyB4xcQdlFPFNrTxVOZjk=
X-Google-Smtp-Source: ABdhPJynechrOQSEPYvcFtvaqlpIS9gq+rCF/yyS8wRTv0ETsMXi1wl44AtzrxCRuDoo1r19Tx0gGA==
X-Received: by 2002:a17:902:6941:: with SMTP id
 k1mr7207545plt.270.1595577467811; 
 Fri, 24 Jul 2020 00:57:47 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id b22sm4784117pju.26.2020.07.24.00.57.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 00:57:47 -0700 (PDT)
Date: Fri, 24 Jul 2020 00:57:40 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 0/3] ARM: dts: aspeed: fixup wedge40 device tree
Message-ID: <20200724075739.GA4327@taoren-ubuntu-R90MNF91>
References: <20200723230539.17860-1-rentao.bupt@gmail.com>
 <CACPK8XdiHLcBBhXjCpTZotVPuRj4bFh0x8TFhSj1TBK2xB0SiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XdiHLcBBhXjCpTZotVPuRj4bFh0x8TFhSj1TBK2xB0SiQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jul 24, 2020 at 05:32:30AM +0000, Joel Stanley wrote:
> On Thu, 23 Jul 2020 at 23:05, <rentao.bupt@gmail.com> wrote:
> >
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > The patch series update several devices' settings in Facebook Wedge40
> > device tree.
> >
> > Patch #1 disables a few i2c controllers as they are not being used at
> > present.
> >
> > Patch #2 enables adc device for voltage monitoring.
> >
> > Patch #3 enables pwm_tacho device for fan control and monitoring.
> >
> > Tao Ren (3):
> >   ARM: dts: aspeed: wedge40: disable a few i2c controllers
> >   ARM: dts: aspeed: wedge40: enable adc device
> >   ARM: dts: aspeed: wedge40: enable pwm_tacho device
> 
> I have merged this series into the aspeed dt-for-5.9 branch.
> 
> Cheers,
> 
> Joel

Thanks a lot Joel. Have a great weekend.


Cheers,

Tao
