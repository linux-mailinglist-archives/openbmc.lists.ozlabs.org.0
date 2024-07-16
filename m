Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 158749327F4
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 16:01:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OtKg/I7z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNgj805lkz3fTp
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2024 00:01:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OtKg/I7z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNghL4Xppz3dSv
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2024 00:00:50 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e057c4885b3so5106391276.3
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 07:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721138448; x=1721743248; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PI5GHEyYINby5HPF5bfHhQ8wuX47dSy57rHL8l+PLm0=;
        b=OtKg/I7zIWH2XueSVrCIB4ipeLHBpUuYI0CH+N/dG60mvgy67s4au3AYk2Qf8bJRv0
         dGdYaRfYB8T0Ma0nrv1VzfJcGmaBnZag/qbSRtibAHMz83JBTnmz63F3r2D91DTlW6xr
         V2pcrs0t8kFJM/q4CbvdjNb1yR+kbkRB+i8LsbHGbLlQlNfkIl3UI6zyVbiWz7+fymye
         ctxowa5shj/pZzSzIlFjL6nsffeNJVghraHBX7LMGYIx1AijDXOubWkMkaHdZLJnShAX
         dZyT2TAzbsAdt73jgNgBNNIPeswHn8IlBfuccumhoQUALHaA2e9qEJqwxG/Y2H4tsJ4I
         vLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721138448; x=1721743248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PI5GHEyYINby5HPF5bfHhQ8wuX47dSy57rHL8l+PLm0=;
        b=YCUSGuGX1Kmg8O2J3r5tXi1Yo+UT2qCrG8xByJScCiusjKndvcfu06V7MGoyuFfVto
         r83F3DgoZqiCtvA1anBwTVhwGqHPxZtb5ARQSDzfhfR1RctoJs60yjUuGvxajpwYAtjl
         Lv2t1m+hKAycH/tsnPF8WLWfwodCYnqtEVrOoU835i+8lhdnV5sQftvhJi/NXviRrVSh
         6pj/ih0dGpGq/UslNYyyNLACBRLrzFqeHnw1wRY+WcNzg0UKEAaKtlqLVv6NW4QxzAeS
         GtFussruCboNGIoqg0cOeeevdjT0XODLZF5sR5lgpVxKRxFs6qmLUkLeuapj7D7d559F
         GH1w==
X-Gm-Message-State: AOJu0YyBfTkSXXX20NlsVgUYeGF6oYcI1b1/c1p4gde9Qfysxti1jz6r
	i17pBs+jV1Py6OFm3WpgsKRjJneQrXLPGi0koeeGZ5ACbLJIFJSonLNeMMjd1KiI4oZzTN/PNsj
	pJLqaWrwpPk8gqHiPioQefY0IuCg=
X-Google-Smtp-Source: AGHT+IHpjNXWSH+jNAlJIhLplQVDPtYImWHQ/MyGNOmhYTHMTf70M+0bDcok+5QbYoSj6NexKKTCpk16ABc+KY1DFGs=
X-Received: by 2002:a25:a429:0:b0:e03:5241:f200 with SMTP id
 3f1490d57ef6-e05d58041a6mr2168512276.37.1721138447613; Tue, 16 Jul 2024
 07:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240709105412.1685181-1-tmaimon77@gmail.com> <45deeafc8db89fb1ece04af50395c3cf88866cd1.camel@codeconstruct.com.au>
In-Reply-To: <45deeafc8db89fb1ece04af50395c3cf88866cd1.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jul 2024 17:00:36 +0300
Message-ID: <CAP6Zq1hCiyHaG3y7+-gMLDtTLjmrQPmH+q2FPbL40COu8syjHQ@mail.gmail.com>
Subject: Re: [linux dev-6.6 v1] i2c: npcm7xx: disable I2C interrupt before devm_request_irq
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
Cc: Tyrone Ting <kfting@nuvoton.com>, openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Tue, 16 Jul 2024 at 06:26, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Tue, 2024-07-09 at 13:54 +0300, Tomer Maimon wrote:
> > This patch fix NPCM I2C driver issue that causing a soft lockup issue.
> >
> > Upon investigation, it was found that during an I2C transaction, the BMC
> > machine reboots unexpectedly, leaving the I2C module in an unchanged
> > state. As a result, the I2C interrupt (IRQ) handler continues to be
> > triggered. To address this, NPCM I2C probe function disable the I2C
> > interrupt enable bit in the I2C module before invoking devm_request_irq
> > function.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> What's the state of this patch with respect to upstream? Is this
> something specific to the openbmc/linux dev-6.6 tree, or is there an
> upstream equivalent? If the latter, can you please link to the relevant
> patch?
This patch set hasn't been upstream yet to OpenBMC vanilla and  Its
not specific to openbmc/linux dev-6.6 tree.
We plan to upstream it to Linux version 6.11 (I believe it the next
few weeks), since we need to upgrade the NPCM from dev-6.1 to dev-6.6,
we would appreciate if you could add it now to dev-6.6
>
> Andrew

Thanks,

Tomer
