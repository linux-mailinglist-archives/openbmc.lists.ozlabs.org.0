Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id B8D868D2B90
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2024 05:56:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LpgVpSZm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpwPh6SCjz79CF
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2024 13:50:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LpgVpSZm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpwP63SnSz3gGZ
	for <openbmc@lists.ozlabs.org>; Wed, 29 May 2024 13:49:28 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-6818e31e5baso1355205a12.1
        for <openbmc@lists.ozlabs.org>; Tue, 28 May 2024 20:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1716954566; x=1717559366; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q+L5S8CC9n6adHcHu0c4BF1PWn3OICMtjZgG2wTW58=;
        b=LpgVpSZmq+JB3OJlW8zgeCG+Ff6JNL4SstFK3/E6oG1k/EdIFN5KcjutDUDxtg1Kd9
         FpOS8O5nz1NX/vR4rLQgILKni+i6gh9MiWf45khy4d38cOfZ+N9CpMPv/C6vwMpNwKLI
         LItnosr57hXE54fK8Fm+XcUIX8/7U1YLQT5nw5xcQyRh+K4s4fRsBoJev+HRxD7dLYBl
         dZ6OOVQSFL2Kue1QPOH6nyH7/AeTcDZnpORrhBw+KkkZvVQgYOq7xNyPOvMw4nhcIHr+
         jzbluWzMKZQ4yXNkthSzh/0w5rx/Qpv9mqZq86rY4QUJt3m0uYNFoBPEzdyEgbCoAC/P
         Re6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716954566; x=1717559366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5q+L5S8CC9n6adHcHu0c4BF1PWn3OICMtjZgG2wTW58=;
        b=saXAXYLC61Hu3t4AM+1NzVrjcXVPyRWq6GOq0PH1kawFFeF723KIt9tdlzzbSM0qLq
         h2JmSb0QqYD3GoEvkxCuwd9eFINc9vtbPLzxWogJdAqV3i/jaG/Crfzq9MGqEWn9pehY
         sF+QlPSMh9Ivc02V0VOQrJOKkXM1Yuu+Z9I4kaiJX88pWt60hR+DAm8fl31WOtum61XN
         iWYDUTB389U93pY4gjiSFe+wBuEmzgfD4KsmCnioWFLINoC8bkuTm3lhXmUVdx5XSgdu
         JEyQb0Tlb43gNDphzYmofYSw/TD+eBjXUyawijF8sQiozadrG99ln2NHX7aaBzfzk3bu
         Sx3g==
X-Gm-Message-State: AOJu0YwMk7B1Wqz5V6gOzoSU+k95q6CyRABlFKo05Uwjw0pkHFb0OyIC
	UA0dFl81J7MSFwbEaSsLh9kxfP4I7TM/GIKQ0cxBe+yGr4s7hVL+9D8Hn1ORNjorx+g5YRepS3H
	5L0nw4aQphfyF5MGJY1wyrHlRDJ/p8roy68dSRxlTRT9Z0QM2p6CydSmr
X-Google-Smtp-Source: AGHT+IHjybUpjSQL5+3Q34zy8JJYoPbMjkeb99W3csQ1zhiiDc1kgjUe4gzs9nkYKvUPOmpz1QJu16V8/weBzGq1K5o=
X-Received: by 2002:a17:90a:ec18:b0:2bd:ff03:b277 with SMTP id
 98e67ed59e1d1-2bf5e14f916mr13092952a91.4.1716954566173; Tue, 28 May 2024
 20:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <ZlYU4X1sXIou-C6L@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZlYU4X1sXIou-C6L@heinlein.vulture-banana.ts.net>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 29 May 2024 11:49:15 +0800
Message-ID: <CAGm54UG-KQ2HZosGQRwwjmGq4GUZcbfs5csAj2i4+AfXd8E7yg@mail.gmail.com>
Subject: Re: [External] /var/log as persistent
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2024 at 1:41=E2=80=AFAM Patrick Williams <patrick@stwcx.xyz=
> wrote:
>
> Hello,
>
> It was pointed out that I did not do a good job of broadcasting a change
> I made back in March, so I am sending this out for awareness now.
>
> https://gerrit.openbmc.org/c/openbmc/openbmc/+/69959
>
> A default setting from bitbake (to VOLATILE_LOG_DIR) was causing some
> platforms to not be able to persist `/var/log` and instead it was
> mounted as a temporary directory.  This meant that even if you
> explicitly configured journald to use `/var/log` (instead of the
> `/run/log` it uses by default) you would not get persistent journalling.
> It also meant that applications like `obmc-console` log files were not
> persistent and would be lost in a BMC reboot.
>

1. VOLATILE_LOG_DIR is defaulted to `yes` in poky/meta/conf/bitbake.conf
2. With static layout, the above config makes the `/var/log` a
volatile dir linked to `/var/volatile/log`, where `/var/volatile` is a
tmpfs.

Be noted that it's the default for OpenBMC machines with static flash layou=
ts.
So the journal log and obmc-console were volatile **by default**.
Users should not expect the above logs to be persistent, and if they
do, they could config `VOLATILE_LOG_DIR` to `no`, which is done in
`mtjade` and `mtmitchell` layer.

The change `https://gerrit.openbmc.org/c/openbmc/openbmc/+/69959`
makes `VOLATILE_LOG_DIR` to `yes` by default in `meta-phosphor` layer,
which effectively affects all OpenBMC builds.

> I had asked a few machine owners and most of them either had it set to
> explicitly unset `VOLATILE_LOG_DIR` in their meta-layer or through some
> downstream changes had overwritten it.  So, I made this the default.
>
> I thought this only affected:
>    - machines that explicitly set `Storage=3Dpersistent` in the journald
>      config.
>    - everyone's obmc-console logs.
>
> Based on the report from a downstream user, it seems like there might be
> more effects?  I'm not sure at this point, but advertising it wider.

As above information, OpenBMC users were expecting "volatile" logs
before, and we should keep it default.
So I would suggest we revert the change to keep the consistency about
the default volatile log dir.

And for the reasons why I prefer the volatile log directory:
* In most OpenBMC machine builds we see 32/64/128 SPI flashes are
used, so the `rwfs` is limited and the frequent "writes" to the SPI
flash costs the lifespan.
* To collect the logs, we could either use rsyslog or the host-logger
(which were "already there") to send the logs to remote servers. So
there is no strong requirement to make the logs persistent.

--=20
BRs,
Lei YU
