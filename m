Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E847E3F8144
	for <lists+openbmc@lfdr.de>; Thu, 26 Aug 2021 05:48:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gw8215Lhfz2yQ3
	for <lists+openbmc@lfdr.de>; Thu, 26 Aug 2021 13:47:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=g+2jIsui;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=g+2jIsui; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gw81c72wYz2xrt
 for <openbmc@lists.ozlabs.org>; Thu, 26 Aug 2021 13:47:30 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id t4so1893124qkb.9
 for <openbmc@lists.ozlabs.org>; Wed, 25 Aug 2021 20:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yPT/mZcPX82ieNWuNHuD8GBDndFHTlJwy2QIecW8pM8=;
 b=g+2jIsui8Ff6EZx9KB7PSQrrcveYt2awc6FWhYVWuEmL9nrMK5RIRLWCc1sA6odwUR
 KSCtYYSS6evTMQ0S2+r25c4sm+Fm2b2Ugj68wFQyfj/GHkXq8jqLH4Bhznj9QPpIijyC
 LRDpQ/MuX33o2LbibYWT+Bsc98ndUjjDwcSbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yPT/mZcPX82ieNWuNHuD8GBDndFHTlJwy2QIecW8pM8=;
 b=PSO9oWwNsi7OGVKhwGPZPWs7Tkn/18F3RTxoh+0/LgIwNhgE9XTNDmOzqyfUu3tYQ9
 g5ss79Svk3W6E449IYWTbq93LsA2Y7nfKKRn2JzpsxHeijAzahT4XiQDOQNXc8lTMPyq
 DDjMbaRM7LUzZGj6hnDfxZjOqE+3VNkYy/b1No9ai+w7YlHCjMYgcJ31fk05ZlJ1MgXG
 9HaiM/akWtGDhkOONUzpcqsU6LldB5xBe+Gx7546+l1fRnNYdQF8fNxHxO+8BZtem7wS
 d7EhIk2zHTOUgDT3+ANCK1kweB/W4UxsgTRgNmNHMOklpOwbNqLLsPofMmlV5rxfSiB5
 HiJw==
X-Gm-Message-State: AOAM531e1SLGK2e6tdWf3l6ChFGxpM14mEj+2Wq1DFiduscvfJ3MVqQN
 UTy38EL2UASpuT9NV5llP7atdnWk45QWyY16EI4=
X-Google-Smtp-Source: ABdhPJyakvOO6BgPz+H1UoiNEd4FLr2FB1vNJt3huWiqt0rSswoEfL3yMdUatVEfdtGBETdxphonvfyyTx1GVx9gox0=
X-Received: by 2002:a37:6197:: with SMTP id v145mr1779950qkb.487.1629949647489; 
 Wed, 25 Aug 2021 20:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <aab1dd3f9c034bc3a1eef34306149833@inventec.com>
 <CACPK8Xf7iYijTAfcDUOH3bs-gGdM9Yton4isuuLc2w-mosapig@mail.gmail.com>
 <89f94a107b4f48328f865c5d40a15a23@inventec.com>
In-Reply-To: <89f94a107b4f48328f865c5d40a15a23@inventec.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Aug 2021 03:47:15 +0000
Message-ID: <CACPK8XfvpZB-88+4ZHt1THmGc1c93prOv_eZmN5DwtXLcCVFog@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Adding Inventec Transformers BMC
To: =?UTF-8?B?TGluLlRvbW15U0Mg5p6X5LiW5qy9IFRBTw==?= <Lin.TommySC@inventec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>,
 =?UTF-8?B?S3VvLk1hcmNlbCDpg63lo6vlvrcgSVNW?= <kuo.marcel@inventec.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 26 Aug 2021 at 02:18, Lin.TommySC =E6=9E=97=E4=B8=96=E6=AC=BD TAO
<Lin.TommySC@inventec.com> wrote:
>
> Hi Joel,
>
> Sorry for my typo. I mean it seems that git-send-email command supports o=
nly SMTP. And our mail server supports only POP and IMAP. So do you accept =
that I resend my mail with inline diff patch?

The problem with pasting the patch into your email client is it often
modifies the whitespace, causing the patch to be corrupt. You can try
though.

A common workaround is to use a different address for your open source
work, such as a gmail.com account.

Cheers,

Joel
