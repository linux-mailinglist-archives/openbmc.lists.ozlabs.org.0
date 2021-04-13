Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B718535E82F
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 23:24:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKdsY4XC3z3bTk
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 07:24:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=qwu/z3wT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=qwu/z3wT; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKdsL4F5bz3030
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 07:24:20 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id lt13so303414pjb.1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 14:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wrolm9Uka0WdrJmXFojnSsyQPM9UJRCVltTGkkPQseY=;
 b=qwu/z3wTrpp5MMaWa7l3cQz4itDaaPHW3JyggVWUDu3sP+rMVEPc7SnPa4fTdHWXWk
 US2+KYZ4o7q6l9qGxwduHbyi5n0IeuW62U3Suibh8TnTfgI0IZOCKOb9aLASA7+pEW42
 ggG9UjpBKBRfvFNiusX16PXpetzhMCieq36otySqrUqD+GMZ/kZDZuDSLhtyi9NRA3xF
 L1zea2cz+qTwKpPP6B/UmmalWKtvDjg5VOLuMzhJrRpIhlXV/3gIYO6Tkf5eHNOh6T5o
 zMcmKvlsqba+0XKpDOephk9dxALnyh2Lf0h0AxtruUZOc6HscSq5KEQj8eDCNlh4mFyU
 iwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wrolm9Uka0WdrJmXFojnSsyQPM9UJRCVltTGkkPQseY=;
 b=UESv1CrZCAfu6C8cqWbQeWnHDAjrDSHzcdcb1WMgfOUXmBsFy+TJM32xc1drXKrx2B
 SHpBRafTqiM6pNuxI7yBbWSmYZKXdJPKkbvNj7qTm/Bp0Pt2VaxfpW7OfiGaODUOm+Cb
 fsU7Vb5ZTDv+XuHJZl85rBwmmlluVOuQja0rrt2wz4o7Fl749486JwVnuKsdwq4AyvSo
 qQUKv7xjpW46w5AQZQvx7+W+HYDGGPi6/VUsmZxWkYfHr8MTUCvGxLoeYFBt1bBDqhmi
 src8TPoKY1b79y0FYv+3VbVlYRYxYlDlantMVSLWjPCCUKdH8zun4JAy2IBXXIPBtkMO
 DIEg==
X-Gm-Message-State: AOAM532Im97xGZ8R++BCxmAnUKsVGqy7zUZ88rz6FLrGgINb+E61233L
 Dw7tcEqfB10QAKdgXJtvJDCRrFiXcO2M2iH03IWT+w==
X-Google-Smtp-Source: ABdhPJxORhjMtdH97VTzoYhToT5Sfmca+N6V6zwa7pA3FPVL1L6OGFpc6sJYDeZN7H6NBHUzbo9M08UkzVohS29TCfc=
X-Received: by 2002:a17:90a:ff02:: with SMTP id
 ce2mr2072837pjb.217.1618349055195; 
 Tue, 13 Apr 2021 14:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
 <20210224191720.7724-4-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20210224191720.7724-4-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 13 Apr 2021 14:24:04 -0700
Message-ID: <CAFd5g452cbyy0Cu=z952X_WMNUoh5TtHvUpDQpA4-APodxZnpQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] i2c: aspeed: add buffer mode transfer support
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Tao Ren <taoren@fb.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 24, 2021 at 11:04 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> This driver uses byte mode that makes lots of interrupt calls
> which isn't good for performance and it makes the driver very
> timing sensitive. To improve performance of the driver, this commit
> adds buffer mode transfer support which uses I2C SRAM buffer
> instead of using a single byte buffer.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Tested-by: Tao Ren <taoren@fb.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
