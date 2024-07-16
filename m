Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3D39327FD
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 16:06:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SNaeKksM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNgpr5QMsz3dGt
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2024 00:06:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SNaeKksM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNgns5kycz3fTX
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2024 00:05:37 +1000 (AEST)
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5c651c521f2so2878426eaf.1
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 07:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721138734; x=1721743534; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=edq+RTW1fgtpOLjnEXvJGmBfFksu9I7eJG3ThDjhd6E=;
        b=SNaeKksMzZ1tY78az8w27mOPbmRTl+xeqTY3BaBdji3JIoypCLIOrMOc9ziunKBzbi
         kmJIIB6epqeotOu8hIehGuQkY4natc8wz6u8Tb4DwYi4btEjHlIKW1/IhjAWGzBN7WDt
         zD5ByAum/1mM7V75UCFLTqh+Bxbyz9cpVjjyBxMFlgARCYw04CbiQXSWeorFjGXO6ylS
         tYaftrRX5seiZh8sI12mtmBAoN7J3HQJQ7rKgbK7YgioIgDVarsf+yqoaSls3ZHncMIY
         4OkSE5VBigWq/zIvl6oGl504WbEyeZTATDXw16ZJ6z3gf7FNPv8SkPlcQrH12l8cpHbA
         sNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721138734; x=1721743534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edq+RTW1fgtpOLjnEXvJGmBfFksu9I7eJG3ThDjhd6E=;
        b=cpJ9TrdquBpj+p7qIgnZw+8XArmTA1Ygpaqe2rXmqgW9KbTGi2v09aIskL/uz+gGTh
         rD8PU2ACbQV9UtvGfak6viyZllI7iynJBET7beXkh+YepW0AKSlDAjB3Vcv/1o6548uo
         6iIU9e3BVvu2xroQfMr5oxO7ZKFQdkv/qWcqe8YhhMAB3zbXEeFNgl2voa5lMF/d90hB
         xe+B9cF2kuJAGd1tgInmDom3LyXNsUX9k7fFUaeU+vJgaEcHcqTiqpY+VwbXdqsBD1O+
         Wofoq9eH4IEHTDUAV3jQeNHVqx9tNc7qHmFv/Bd/mjvRujfxH1RQauU1BrbMZdIKuVcc
         1KeA==
X-Gm-Message-State: AOJu0YzYUogIK1a1Db6fENeqM7er2IQZBfdmGACtwbezqhlReJzm2+Iq
	sz735g2MIJ02utVaiO1586GzmB/o8Y1hqLp4aWcScLxRR/6SsxTJF7K0JG+uciI8/Btg1TsEuuF
	KoV+C/GUTZsw1DJU7Zr+1sDamV9Y=
X-Google-Smtp-Source: AGHT+IGGDtry7Y11IrK58VA/FQSrpk0RXeX7TYmyN9QspX1ojgQJK718eACM81dFh5TF3g5TcRDy3wboztEuzKp5bTA=
X-Received: by 2002:a05:6358:60c7:b0:1a6:a69b:b171 with SMTP id
 e5c5f4694b2df-1ac904440b8mr217074755d.15.1721138734565; Tue, 16 Jul 2024
 07:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240709160242.1921541-1-tmaimon77@gmail.com> <f17486d058ef660c65a9911d62605c250cdc0b09.camel@codeconstruct.com.au>
In-Reply-To: <f17486d058ef660c65a9911d62605c250cdc0b09.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jul 2024 17:05:23 +0300
Message-ID: <CAP6Zq1hAMrN_tssFnrAeJDiRtDhSeeFPFN77KGGpAjFCe0aLqg@mail.gmail.com>
Subject: Re: [linux dev-6.6 v1 0/2] spi: npcm-pspi: add full duplex and fix
 word issue
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Tue, 16 Jul 2024 at 06:25, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Tue, 2024-07-09 at 19:02 +0300, Tomer Maimon wrote:
> > This patch set:
> >       1. Add full duplex support - this patch have been upstream to dev-6.1
> >                                                                and removed.
> >       2. Fix transfer bits per word issue.
> >
> > Tomer Maimon (2):
> >   spi: npcm-pspi: add full duplex support
> >   spi: npcm-pspi: Fix transfer bits per word issue
> >
> >  drivers/spi/spi-npcm-pspi.c | 90 ++++++++++++++++---------------------
> >  1 file changed, 38 insertions(+), 52 deletions(-)
> >
>
> What's the state of this series with respect to upstream? Is this
> something specific to the openbmc/linux dev-6.6 tree, or is there an
> upstream equivalent? If the latter, can you please link to the relevant
> series?
This patch set hasn't been upstream yet to OpenBMC vanilla and it is
not specific to openbmc/linux dev-6.6 tree.
We will do our best to upstream this patch in kernel 6.11 (We already
have a lot of patches to handle in the next kernel version :-)).
since we need to upgrade the NPCM from dev-6.1 to dev-6.6, we would
appreciate it if you could add it now to dev-6.6
>
> Andrew

Thanks,

Tomer
