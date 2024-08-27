Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9001B960C5C
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2024 15:41:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtTG30qGvz30YS
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2024 23:40:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724766055;
	cv=none; b=L60GDBIc6SL3Ik9sgKm7eo0iiWIw+BMWTh0xSROVCYPW/iv2LeJwvaUUEWoN2Kb3j/NEXKQ9YTQCOHk1fDZzOawosMEMGD/BXKNhxeRN5sjxQe5AkP6YOc33xc02sWWNmiFyarmNJtcz7u8eQpmrx5jzuz3i5TRcI9lew/jbxPwF6VwfWHIVb9E7t3xBWPqIE/SWAXTa+mz5CAogLniSctBzTwAsMk+T5wNr5VOEepc33PcO1Xk1PEM5CIjDIRwm9uA4mBBzBBriT3/tyWfDBc6tPH7rChH8NTfl1bHxn67Yokq3h+KkEGpUVmaGeMjF2gcd1EZps6Utju1HOB7aZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724766055; c=relaxed/relaxed;
	bh=0oT4rJwca55LCuOwg7BLj4XV3NGtXDkBbCRw4hd7QOI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=TZbDZ0fKbfG07HK0RgAgPIl3kooHZyi0y5+mYbUnYza33xhH/EC5q/BlxeztXFEKusEo7fSOKoKaEufm06Okd3O4g0knWfLwNLolkJcmedQ1suu4azcGpJB3oqXKtDaX/g3P1JT+dhgxJ687u5uRNbhEDv0HmvouhI+mGkR40QTUnhwLIZAqBRgFW+rWTBThPpnHYK5E+RYr0oDJfNLYE4clK9Uqk2gmpJwcjlKl2NW68l6QUKwOxfQwXbDMFo66c2xOMtKUaFPFUhxQQQwJpN7fB+wq8znOPZsPoBWTLNFuBBhTeLgjpoPEBObvNTmyTcFWyMPjiiXoKJpIyijrhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KtKqgAFl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KtKqgAFl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtTFz0dWWz2yRG
	for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2024 23:40:53 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-68518bc1407so60413197b3.2
        for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2024 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724766048; x=1725370848; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0oT4rJwca55LCuOwg7BLj4XV3NGtXDkBbCRw4hd7QOI=;
        b=KtKqgAFlKdz0iGPYOUIRoBzGmx6l8YJhbzdiZG98ZxJphbAYW3QaFl8ao+xWNhjzhi
         dz/tEbl9hIqXX4I2EOeeBYgQTdM8GQyUe04du6/O4gDKautvAGHc6a0GsLZf1FB/zEn4
         d+EzJ506YijgmRXRXipsb9ZHxKLMN2nuoSRLB+xMSprXj7SNov4mPdtGpstLjRoy6kqI
         CkO/3TZrM72QMtBUAsPG7usIBAnT/jUA1j3q8FgazuWeYM2I4j2lWFPFLX2S4RcsSHwA
         kflxYYtWDTztsah2oBJ0Xiv4qTfoP0GPhBXDpE1Hg72DaotkP7aRNelLtt4eafaDncxM
         KIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724766048; x=1725370848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0oT4rJwca55LCuOwg7BLj4XV3NGtXDkBbCRw4hd7QOI=;
        b=aDJTfqSoB8Wo43khV4b5HUvlIypKPgrdbhl92Rdj5N2KRWXRsE5syo0vaXeA3TNoex
         A5Z+T+e1RUgl6lZCwwMQ9WRHrfeub/+jtUOh61ZFDmPfV1KTrrGMhrZBi9KKumSLPOoC
         dJm+ruYUar4DgCae1w9QIRXBz3Zag2jT1tcUHoCKTY/c5rLlIE7rQand2SnXXlD5t5sU
         8/VO3UZhDd12rj8Pr1oBG4ZFDo2LHBqrZgybOxTTgiFiAPkyoSu7+dYXs+lH8Uu/rHvn
         suSPhI5eSEYwXi8vghP63cy3S1umelzCeRgkljycousT8NQlTewHLdHmU2PzCU6tEwgU
         P71w==
X-Gm-Message-State: AOJu0YwpridoyQ97DRsgRIoHpxfwQsx6Rc5hFT0GchRqjigrpMWCX3sg
	PdUQzwfVyo8EW0xVspd15hlXUdpsNVdE5852kv7E/hpWw02DeVS9B7bU7VENxf7+66c4ND/Vw3N
	v9rY4gGC8T8+Lr3qgmq9WGj9I9KxCSyHH
X-Google-Smtp-Source: AGHT+IExwy5wudxLHMhRfMy7SGyQafJQtYKNrbEYXfZa3DoWRluCM3oVBXsuW/CNINd//SJY4AB+6E73s6xyzqPHUlo=
X-Received: by 2002:a05:690c:15:b0:615:1ad2:1102 with SMTP id
 00721157ae682-6c625a4c7abmr181785147b3.11.1724766048320; Tue, 27 Aug 2024
 06:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240826071128.3030154-1-tmaimon77@gmail.com> <20240826071128.3030154-4-tmaimon77@gmail.com>
 <0cb34763d4d360403ccac84362eb2f61cc11b0f4.camel@codeconstruct.com.au>
In-Reply-To: <0cb34763d4d360403ccac84362eb2f61cc11b0f4.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 27 Aug 2024 16:40:37 +0300
Message-ID: <CAP6Zq1hZaz_NSMdERsAXvC-aoRoV39P=-xPHvsZb+RHTkcMEuQ@mail.gmail.com>
Subject: Re: [linux dev-6.6 v2 3/3] clk: npcm8xx: add clock controller
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Thanks for your comment, It sure is worth trying, I will send it to
the clock maintainer once you get NPCM8xx clock V3 and confirm it.

it is weird, it looks like the format-patch creates these trailing
whitespace errors, I don't see whitespace in the code, so I needed to
fix it manually in the patch.

What can cause adding trailing whitespace when generating patches?

Thanks,

Tomer

On Tue, 27 Aug 2024 at 05:24, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Mon, 2024-08-26 at 10:11 +0300, Tomer Maimon wrote:
> > Add auxiliary driver to support Nuvoton Arbel BMC NPCM8XX contains an
> > integrated clock controller which generates and supplies clocks to all
> > modules within the BMC.
> >
> > The NPCM8xx clock controller is created using the auxiliary device
> > framework and set up in the npcm reset driver since the NPCM8xx clock is
> > using the same register region.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > Tested-by: Benjamin Fair <benjaminfair@google.com>
>
> Just a note that this patch generates a bunch of checkpatch warnings.
> Is this something you've considered? I ask because it's best to try
> remove all reasons for Stephen not to apply your series...
>
> Andrew
