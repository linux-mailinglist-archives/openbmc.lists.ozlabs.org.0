Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59244597ED8
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 08:58:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7bMd1LVwz2xn8
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 16:58:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nfd35ucG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nfd35ucG;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7bMG1p5bz2xHD
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 16:58:33 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id z16so609498wrh.12
        for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 23:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=oXf+6vPTXJABBP626XozAFFhpcLraRccWMfglXMXTIs=;
        b=nfd35ucGIfyF6AkCsKiP5qtg+XIKiZsP2vPZwakDrUhtDFzhdsHpzvkvyQQCrRmnid
         AO97j6V5dqwN8mtz7URKfFXlv0fw8jVvp3S89JqNi6D1WUuBoMsdoj27NcqdUmZcY+Hm
         sMI77E8O0M8BRxHjQIbx6QO+ZuY0KTMgmPNLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=oXf+6vPTXJABBP626XozAFFhpcLraRccWMfglXMXTIs=;
        b=LoYyn3eBT2zpbwZJAhqa41enjh8AYnhdQaRNWJjSmzH9WKe/uBLU9678NZWx4q/qIm
         ZoKMcjq9IX5Rk+C7I1rCQZWlxTEY5ZUlQFDSyDlXkpe2p4YIYYpIOt8imNzV0y/9A5WL
         uhyt198MbsbLxqqQ79SkkPxQmTO3ia1W8xUl1Ef6QlEtFhCTmFIm16e21pV10IYJcdzO
         qvXAJPulyMyYCYY1JXHArBdKkiUfA8m7c7BAGIuU/8X00cTv1cHzVjfHDuyZPx1vz0A6
         WgqEnsNsCi7hp1jaThhBpNX7SDubMuSLJNr8p8T9KdvtMepsKMBm/QteK8WdEpe0iXgc
         G1DQ==
X-Gm-Message-State: ACgBeo0LG2Ii1phwFuSWc7JF03bh4dOM53XZeSYEIripZxCVRGM0AVCL
	hheUr37syLegyHfkzlIb9SLw4V7+RMOvELlHdC8rEX8d
X-Google-Smtp-Source: AA6agR61mhgmZxvhiTW+T0YMs5dMaJ9aX+ANGtl2LldDiK8oKSBhz3Q9P6hTwX1bI3YpwjywMb5X153S88d9YxNLcuQ=
X-Received: by 2002:a05:6000:1ac8:b0:220:6af3:935d with SMTP id
 i8-20020a0560001ac800b002206af3935dmr726331wry.549.1660805909284; Wed, 17 Aug
 2022 23:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220818050356.1459349-1-potin.lai.pt@gmail.com>
In-Reply-To: <20220818050356.1459349-1-potin.lai.pt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 18 Aug 2022 06:58:16 +0000
Message-ID: <CACPK8Xd6ttcCHDRJR9mAw_G+w2Y1USLoqre=rofQ1i8MZ6gYpQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15 0/2] Update Facebook Bletchley BMC devicetree
To: Potin Lai <potin.lai.pt@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, potin.lai@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 18 Aug 2022 at 05:42, Potin Lai <potin.lai.pt@gmail.com> wrote:
>
> Hi Joel,
>
> Could you help review this patch series and backport to 5.15? Thank you.
> LORE LINK: https://lore.kernel.org/all/20220810004338.329832-1-potin.lai.pt@gmail.com/

I'd like to move us to a new kernel base soon. I have a 5.19 tree I've
been testing. However I've been out a bit recently, so the backlog has
built up and I haven't found time to move us up yet.

I've merged these to dev-5.15.

>
> This patch series add modifications as below
> 1. add a IPMB node for USB debug card communication.
> 2. remove hdc1080 node due to incompatible 2nd source (si7021).
>
> Potin Lai (2):
>   ARM: dts: aspeed: bletchley: add USB debug card IPMB node
>   ARM: dts: aspeed: bletchley: remove hdc1080 node
>
>  arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> --
> 2.31.1
>
