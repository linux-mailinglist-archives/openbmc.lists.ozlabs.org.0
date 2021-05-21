Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E19038BB34
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 03:04:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmSzr4cLzz306s
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 11:04:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QPKFh7XF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QPKFh7XF; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmSzY4Zj0z2xYY;
 Fri, 21 May 2021 11:03:53 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id 124so5915876qkh.10;
 Thu, 20 May 2021 18:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ftgW/ZD8hun6+efsEtYDnA9Z/1i+HqiNXuFWOiDlQFo=;
 b=QPKFh7XF+JNfRZNGyb2vQYDAF3gVeLGE3CxuxR50/IxP9jDGhwd6wrNZ2S5UI9MLZc
 6bcHkedpFoUp2IJ8MYtf/hN0W2LGsDJVOqEAJbxOOwkaHwvRyMlkXZchrvJhjn/7mFrg
 A6lIdiAz7aNseKSQyxyGK9ReNFcWd9Wzh3wZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ftgW/ZD8hun6+efsEtYDnA9Z/1i+HqiNXuFWOiDlQFo=;
 b=H5S4fiYqqaSzpNGUAHeTj4VEO/CXrxMRIF/GD2kkwzv6MnG0ZFaiC1wTYvMglEipKc
 bE0SdQ5Ey1mkIwvz+vHbiYLE/0DdxtE2FVjGJ+q8HoDF6qnEQXfSObLmlrGVmH4+1/dr
 uL4bWzRpIH+rhy8LJQyhHmGCBc0/yAV/r6wz6UlnrbEo4t+Q13USa+IVMULh03sY/yf7
 3Fid9VHudakMtgk8r9xSJ33aVavoVBidtdP7iiadTDALwee/5/WHMuHR6NLSIJYdtGJb
 +PAOpJPnsJWFgUdkA6vIdq3Dq42XBlRhPo4tut+3Q8O/0YNw7LbjOsfZk5scWZwsbZ2G
 tZ0A==
X-Gm-Message-State: AOAM530D3nb8P5XRHnGwVNEkIns6yy2wyXr7SB5wDOUin9iRh7Vckd2f
 Wa/oscnuhZurlC94psFBoTi7OUuy1rYosYq7TGQ=
X-Google-Smtp-Source: ABdhPJyaSVhXFsyvFeOh0RKA2a79cq/wrF4SvXOaYGZXtEvafHPjqPwFM7IFU8bTSbbb0lHxfL58adnE2J7TQcDbKe0=
X-Received: by 2002:a05:620a:704:: with SMTP id 4mr7844434qkc.66.1621559030068; 
 Thu, 20 May 2021 18:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210520101346.16772-1-steven_lee@aspeedtech.com>
 <20210520101346.16772-3-steven_lee@aspeedtech.com>
In-Reply-To: <20210520101346.16772-3-steven_lee@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 May 2021 01:03:38 +0000
Message-ID: <CACPK8Xfw8UH-4-oVqcFFMQmfrLqDbdYuACT9Rij62SBLU0+56Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] ARM: dts: aspeed: ast2600evb: Add phase correction
 for emmc controller.
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 "open list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 20 May 2021 at 10:16, Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> Set MMC timing-phase register by adding the phase correction binding in the
> device tree.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

As the aspeed maintainer:

Reviewed-by: Joel Stanley <joel@jms.id.au>

I don't mind if this gets applied directly by the mmc maintainers (I
do not anticpiate any conflicts).

Cheers,

Joel
