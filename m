Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E23514047
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 03:36:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqFSf2kKyz3bft
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 11:36:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=hc4MzDyp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=hc4MzDyp; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqFSG6bKbz2yHt
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2022 11:35:57 +1000 (AEST)
Received: by mail-qt1-x830.google.com with SMTP id o11so4765388qtp.13
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 18:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ilw3aGv9Sgk1Mrf42CfMBYio0brON0wfqjs2FvsTn5A=;
 b=hc4MzDypJLz0fQuTeRPHPO0wVmSfZFP2kv4Nb4g77/gbVk38gQaUTUSTYDJBiNqcOq
 XAF6s8MjQZK7GMG2tApOYlMz2XiHaGT6WSdaVMxy8a8NlzdFMufvC5bmFaeVH5o8VugB
 7a3Lj1YkckAVXcZKvgHR27HLApC631nuW9wyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ilw3aGv9Sgk1Mrf42CfMBYio0brON0wfqjs2FvsTn5A=;
 b=A4Tc5L7s1g0OGeCm2oEGn7MlxNZYpTZkNv3Eotp4YG2rhi0+lzysJ+99vHquddGEHD
 NpDvDMyMP8ZLm4pKt4fabwCS2uYEurmtEof/6v9TgiTVuNU8o2NzbN8RExiddjO2n5F8
 H31o4w+qaQkgmvWXUBlMENJAx1rIj53t3qtGTt375GZ9MUXlexHEnIcqMJ3k5aWCne8b
 k7337AJpvbGVFih3lbMV8K7beMhon9xET1PEWuHKAJIeZH8ygH7yDi61xkZ0hb8Q1QKO
 TVcrEa+EeuTArwaRTV6fKS1WfnbohG7PakWQMHSNR/34EZWhD+Q8IOCN4P2a+rlcqlNJ
 JF1w==
X-Gm-Message-State: AOAM530WOz1934pzSgNOTnkE8WhxsdYuML7caYtBH9t/wcGBKMsIPwP7
 /FR9uW1107AFy2/5M3yii/p2BqQFKfDoGfxLJmk=
X-Google-Smtp-Source: ABdhPJxEHKDPELY9+OtUNhNNa2CM1I9/hqDSmeDbIFwxGnpwoqaIQ9gDWUojvja9Nn0exFx3iPezziPP2uNOOx+HTws=
X-Received: by 2002:a05:622a:58f:b0:2f2:58:578a with SMTP id
 c15-20020a05622a058f00b002f20058578amr25197132qtb.180.1651196153533; Thu, 28
 Apr 2022 18:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220428082858.545176-1-joel@jms.id.au> <Yms5JzcVMKDYpR5H@lunn.ch>
In-Reply-To: <Yms5JzcVMKDYpR5H@lunn.ch>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 29 Apr 2022 01:35:43 +0000
Message-ID: <CACPK8Xeq8MLmRmYW=qo7+FDRG_bwaSTMQtrHhPCwGJ8-ZeFp=A@mail.gmail.com>
Subject: Re: [PATCH net] net: ftgmac100: Disable hardware checksum on AST2600
To: Andrew Lunn <andrew@lunn.ch>
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
Cc: David Wilder <dwilder@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, David Wilder <wilder@us.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 29 Apr 2022 at 01:02, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Fixes: 39bfab8844a0 ("net: ftgmac100: Add support for DT phy-handle property")
> > Reported-by: David Wilder <wilder@us.ibm.com>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> > Net maintainers, if no one has a counter proposal I would like this
> > merged as a fix. Please give Dylan from Aspeed a chance to reply before
> > applying the patch.
>
> What has phy-handle got to do with this? You might want to add an
> explanation why you picked that as a Fixes: commit, if it is in fact
> correct.

If you have a look at that commit, you can see that was where ast2600
support was added to the driver.
