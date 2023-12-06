Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE3C8068EA
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 08:47:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Bpr6hIvF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlTyV3LPLz3d8p
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 18:47:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Bpr6hIvF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlTxw2k7Lz3c1J
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 18:46:59 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a00c200782dso64220366b.1
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 23:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1701848817; x=1702453617; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KFmuRwLK7aErKQMegxLBcG9qWXBLwj0ZkYxUrHHsBFk=;
        b=Bpr6hIvFUaRTsSwfgEeIYxZQ7GYPs8dunD0/uYu3k5Pl1zDJscCyL81notbZQ4OuEm
         fHPUYwpqDitwSRGbxMPEE33r7XjY2YVPjruWESA1D9dKT+p4RRkWmiIWJqFwh76bt2Ih
         HgnV/kRhrifjUqF6XBCgEKU8wAjHXtdfCLaM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701848817; x=1702453617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFmuRwLK7aErKQMegxLBcG9qWXBLwj0ZkYxUrHHsBFk=;
        b=wvLGzEh7hQoLX8bDNDrz0CWqafLzrIxjgFewg24Pw8C1JEEhCBpZu22zRzHuvUWxVh
         /DFuXEwE4qne7rMTdMnMbKPD4aZBZLbaNfcrjXntEtCHRpTIRv8lAySZQ3lYuMrBzhH5
         ED02VscKM/Foh/Op9Q6BMu5EO5mKCGL8XHob+HeGV2T7wyOdK7pMQXU/2KYaZgVJk+ag
         1C+HlRR7n2XSoQB6UR/aCE33Frg7wghgvayYBtlbTKHTNb9U7WbdgUds1xwBfOSZhh3y
         bkJTmjX4PV5H+c3mOQGjDzO30PIQkbn7a2kOT3qHLtPh5Rd3LPc52pnVXt6KdFXbrQj7
         ZjFw==
X-Gm-Message-State: AOJu0Yx6nH5Kflvh/P5YMykPeGm75MAXHjKT+oL9bjYhnp5GOVrmEOl8
	dfRrYLoMcnfVcgJpBAQXPBrKLkoEkUKHH4NJuJI=
X-Google-Smtp-Source: AGHT+IEw75Aepwa6u/Kva+RxSkSys47m6wrD5foe6gyk1w5cVfvP3pCY/4ysIfX7mYr/4tykDqCWZV5Bz3NKt7acYGM=
X-Received: by 2002:a17:906:f817:b0:a19:2f9b:5050 with SMTP id
 kh23-20020a170906f81700b00a192f9b5050mr184886ejb.54.1701848816807; Tue, 05
 Dec 2023 23:46:56 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfgwf58Usn0FSWYigD2HbwNKh4DTLX+HLE36HbMC7D1JQ@mail.gmail.com>
 <CAP6Zq1hNZTeSgRLPb9bDqsU0JCChgaGX2Gth67ru_K_c2tOdJQ@mail.gmail.com>
In-Reply-To: <CAP6Zq1hNZTeSgRLPb9bDqsU0JCChgaGX2Gth67ru_K_c2tOdJQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Dec 2023 18:16:45 +1030
Message-ID: <CACPK8Xd1apLDqmatNgRVqq7UPaACMyvue-52ac2da5TsbJ-Y8A@mail.gmail.com>
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

On Wed, 6 Dec 2023 at 18:13, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Joel,
>
> Thanks for supporting kernel 6.6
>
> Could you add the following NPCM drivers to kernel 6.6.
>    support Nuvoton NPCM Video Capture/Encode Engine
>    Add Nuvoton NPCM SGPIO feature
>    MMC: add NPCM SDHCI driver support
>    hwmon: npcm: add Arbel NPCM8XX support
>    usb: ChipIdea: add Nuvoton NPCM UDC support

If you can send SHAs for the upstream commits, we can cherry pick them.

If they're not upstream, but someone is actively working on them, then
please post the lore links and we can look at them.

Cheers,

Joel
