Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 892DA3A8A12
	for <lists+openbmc@lfdr.de>; Tue, 15 Jun 2021 22:17:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4KP71PDkz30L4
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 06:17:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=MruOia1n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MruOia1n; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4KNl607Sz306F
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 06:17:10 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so379726pjn.1
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jun 2021 13:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GkGQnLmVwW4qA0ssOBwk6WCJvW1pndNBd0scdSFPh0I=;
 b=MruOia1n3SSDfMAy6SgZPc8gOiJ2KYRHg1TFB985qFOtyVkwkkmkCTLTgcrvX6tPYe
 LBQxQBXRaYE+gZTN63vld9MyCL6PNNcyL29jtnYOv1uq6lMc/661M6IPWOwaTX332CU4
 EcdZvHlViiMjujNmoBFX79dUIXWtOhGtgC0y5g5yMKWXYXmOErXjZlIoC0XaXhKS4ys5
 OwjCeVAymTQcae9cU/cXcHtp1HgOh6OUny8v2aXp+wPTLg5kBolbDcmScKUwpayrBOMY
 PyYpY4sQX7rUYW0CHvKXRp1yKTj+VVZI6Zo2pSwj+DnpkcMxN0tLz8bdID+ks2vS3WNo
 8/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GkGQnLmVwW4qA0ssOBwk6WCJvW1pndNBd0scdSFPh0I=;
 b=anqLyOZ7QUHsKP3X1+4jW7WzgTOzmFgCbbWQMmZpWd6y4YGJtBlshKquFAGHibRZay
 8mcZvcd57IBfnVfPMIfaDFnjOTXDhm1XN6w4K8AyK1AWveMBrEU1bENSlHkZ4skmKXME
 GzrpdRe98lud4+KYa5GRhWsXsgG057CnsoTTx6sN4jfwxxxCM33w+8i1SNwhQa1tRb1z
 kUD0rGTUZtfVBojerEahhvCO/0ENiK7NJmTEtQQiIit2pRTqO7pMW+KyV5i7aBEX+NZY
 36eTlPZYOkNTPUvNBf+rPIIuOvV3HBwwEYGZpDBYFymYv1ZbtbVkW6xPP4hE7LxaDSHd
 PKcQ==
X-Gm-Message-State: AOAM531k3QcjeyWJRqxYCGTZjxKjj15rCgaBTuz2cjh2kCBK8i0Ihmd9
 z+Y6hEwrdRAwrIWrsnZresJl6eF6mT8k4JlZHdP0Tg==
X-Google-Smtp-Source: ABdhPJx9P6F6n477bRva9mz30K3tjhbcE6hC9AMxPX01zFv8+yjRUVzQJlRxqjIr9o9+vC0QlqUiP2GEn324NMHYB3Y=
X-Received: by 2002:a17:90a:1941:: with SMTP id
 1mr6812484pjh.217.1623788227394; 
 Tue, 15 Jun 2021 13:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210513193204.816681-1-davidgow@google.com>
 <20210513193204.816681-6-davidgow@google.com>
In-Reply-To: <20210513193204.816681-6-davidgow@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 15 Jun 2021 13:16:56 -0700
Message-ID: <CAFd5g44OdWFTcj5T0e8uPX-HkT3Dm_X3axJV0bza1SE3BvURmg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] mmc: sdhci-of-aspeed: Remove some unnecessary
 casts from KUnit tests
To: David Gow <davidgow@google.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Daniel Latypov <dlatypov@google.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 13, 2021 at 12:36 PM David Gow <davidgow@google.com> wrote:
>
> With KUnit's EXPECT macros no longer typechecking arguments as strictly,
> get rid of a number of now unnecessary casts.
>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
