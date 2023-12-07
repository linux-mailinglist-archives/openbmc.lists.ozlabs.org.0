Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5518807F58
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 04:53:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=H3dIvy+e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sm0jp2Q9Dz3cTF
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 14:53:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=H3dIvy+e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sm0j74rGhz2xH9
	for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2023 14:52:41 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c08af319cso5902995e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 06 Dec 2023 19:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1701921154; x=1702525954; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jtNuG4G1N7BUzatoHpQ83Qgd78J+HNxtDdjdSodMMeo=;
        b=H3dIvy+eA7j51M5bw21+Fay/avecY57z3G+Tu1TrwGv370czzh1iqeE9Oebe3eSEGt
         Co3Cz12CkIZk6xNrw5kRXnrCQYytYoVSkMmTOemXXbS32wBxw84S1HkmloUXi8mMeFzt
         c/lU0EvT0ubpv8jquhIPHe0nkfRBbHc9W8zOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701921154; x=1702525954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtNuG4G1N7BUzatoHpQ83Qgd78J+HNxtDdjdSodMMeo=;
        b=lWp3Llx/xlui/rhcrVG8tDnlmHDKfcWQFKSuBwNoCJ+KvT8mQbcd5tmIUPIek7Qw0q
         fRw/wqOjHu/9lVOPeq50sxWj8szp7HabWStmfZwogRvHKcyX2B79PB0Fa9GjSyI98gue
         6vGcJ3dmaAW6Q470U+P4GlPFWUBQctKKPjcb+kpETXtFcpKsJ5ZFb6ZrG8yxTn97hVML
         13cjeOyeBPNwiVjCzGwzzlJA/KuVq34FQTW5IvTuFMdE5a8daQJL29ADDMcMaK2Spox8
         pEneMJmpC4XBXZ92WZw+v6zhCqaLbL+IY10oU2sRMFx+autY4PVkuNvY2w68uZwKt2oj
         XMCw==
X-Gm-Message-State: AOJu0YyI6l6kFg9xBxlMHzVuImxIr24KKTIYtGutBeLPl0Y2gKnvY1nn
	0s2GuXort0/06adyruvraL6njJwXO86JSMI/rsA=
X-Google-Smtp-Source: AGHT+IHf1auiLHox3Ozqgnewuc0J9Qg0JcMFkebv/RvjiQZFJnesPU+c3AvhqT7JkWaQaqdsvj+c44UQ3Zvwc6YXaYE=
X-Received: by 2002:a05:600c:4d02:b0:40b:5e21:ec44 with SMTP id
 u2-20020a05600c4d0200b0040b5e21ec44mr1074504wmp.118.1701921153779; Wed, 06
 Dec 2023 19:52:33 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfgwf58Usn0FSWYigD2HbwNKh4DTLX+HLE36HbMC7D1JQ@mail.gmail.com>
 <CAP6Zq1hNZTeSgRLPb9bDqsU0JCChgaGX2Gth67ru_K_c2tOdJQ@mail.gmail.com>
 <CACPK8Xd1apLDqmatNgRVqq7UPaACMyvue-52ac2da5TsbJ-Y8A@mail.gmail.com>
 <CAP6Zq1iRD+ij92LpOgTO0oFRB7gnz4udLGJPgY=fOjkD+UpFxA@mail.gmail.com> <CAP6Zq1j0SR4MdU0WfDVETVHu191uFFJ56aayAd5CZ3kY0hdaXw@mail.gmail.com>
In-Reply-To: <CAP6Zq1j0SR4MdU0WfDVETVHu191uFFJ56aayAd5CZ3kY0hdaXw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 7 Dec 2023 14:22:21 +1030
Message-ID: <CACPK8Xe=4aRVNFbW78K+C2JtJhxwtDEJ8zfDYY88gD6THZDCOQ@mail.gmail.com>
Subject: Re: OpenBMC Linux 6.6
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 6 Dec 2023 at 19:38, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Joel
>
> The blow patches are upstream to kernel 6.7, only one patch (hwmon:
> (npcm750-pwm-fan) Add NPCM8xx support) was applied to next Linux
> version, kernel 6.8)

Nice! The npcm8xxx has been making good progress I see.

All of these are merged into the dev-6.6 tree.

Cheers,

Joel
