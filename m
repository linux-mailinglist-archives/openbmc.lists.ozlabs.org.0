Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B18B512309
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 21:45:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpTk33MN9z3bdZ
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 05:45:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fCaVbSxe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d33;
 helo=mail-io1-xd33.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=fCaVbSxe; dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpTjd68f4z3bXD
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 05:44:52 +1000 (AEST)
Received: by mail-io1-xd33.google.com with SMTP id m6so206815iob.4
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 12:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7K1IxQSsZaQnvpxVZ7ih4kv2fhwg76CpVr8Gpp5faHg=;
 b=fCaVbSxebrWAnlBVlulsPn619yKEPuEPW0VSDmqQP/67p3ABUOgAQRM8YraKvktjGn
 eYfUi6lRlG30z1HQIXjsrWFDjc8TsJbLICBmTbwpEjQLw4ZIVmebgRYreDLiNZcq30zY
 nqe8a1zLMoG+5x41HKN0B/J/DURxcMsRjNEo0+pzkxB7FFKwyNYK/SENxka8iatZI7F6
 lrQDHjCYS3JS+033ZKHH83jxeIVtqOSwpApmamfJUnQMnPqjVbFzo58kWAidYUBJkayj
 0vNU9mVTfYsGPrETA5VbuJ1XdSFPd+itVNzBw3e+MExYlQaZoyTX61mujzQLr67ilscm
 l6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7K1IxQSsZaQnvpxVZ7ih4kv2fhwg76CpVr8Gpp5faHg=;
 b=bUTqHkyF+YxS47Av1zH3XcvfIOHTbABq5X9/btlLcmuCkefTThYbUTNx090Ez49YEj
 8Cm98PMaj6qewnsSAo7nwHA5AKWvV6arD1FoqZ3NcRWR7QD7cynz5SW7pWEOfTt9W2uJ
 avSkkWEar5TBkisn7BR2Fp450AGbPsOYyq6/OzRgMl9AREXXg1XA0pVpsX22RJKv1A/o
 /T59pQLKBlKl9jkqlueCEWXaf0l9gfQMUGJwhD9yKo5RbNvISaROGMUH7mfZCe8boVb7
 4Qme5foUETVRciyKVJOOYwNt6Wuelp0WTI00+Rt6WXMiq7KviYEV+UtWAEfLHWTHnXlQ
 sKfw==
X-Gm-Message-State: AOAM531h8O5zKo/+fv77NK6JSxpQ9r/+lStPVWtmSQBs7btQKdIMIU7R
 obaaFbdl6o90Y/Szzigx8HgbOjQhkvOoxQcsVLNiog==
X-Google-Smtp-Source: ABdhPJzucdc5/wnsFkLCQNwk3BHop154yQX41PgXtHik7CQKwL38pF8Ewh5CqYEptoq6uHcOiFZflWrscLLwaO7d5K8=
X-Received: by 2002:a05:6602:2d91:b0:648:cff2:b2c0 with SMTP id
 k17-20020a0566022d9100b00648cff2b2c0mr12333168iow.45.1651088687592; Wed, 27
 Apr 2022 12:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <CALGRKGMgs4m=h6udakL_hcUugrPFyvTt+RefBjyVinE9ReGXyQ@mail.gmail.com>
 <CALGRKGMPDZXh8kZSifJ+XLKbi96LRHcYyJ=Jt9KGHPMmPWk+OQ@mail.gmail.com>
 <YmmSyjbeOtEOQuaK@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <YmmSyjbeOtEOQuaK@heinlein.stwcx.org.github.beta.tailscale.net>
From: Brandon Kim <brandonkim@google.com>
Date: Wed, 27 Apr 2022 12:44:36 -0700
Message-ID: <CALGRKGPOv9XJcUr9jBgjXLyUr8SPWro8RQ8_=m6tmy5sf4O4Zw@mail.gmail.com>
Subject: Re: Request to create 2 new repositories for
 "bios-bmc-smm-error-logger"
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>,
 Ed Tanous <edtanous@google.com>, Kasun Athukorala <kasunath@google.com>,
 Willy Tu <wltu@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for the response Patrick. I've created
https://github.com/openbmc/technical-oversight-forum/issues/14

Cheers,
Brandon

On Wed, Apr 27, 2022 at 12:00 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Apr 27, 2022 at 11:03:29AM -0700, Brandon Kim wrote:
> > Let me know if the community would prefer I create a
> > GitHub Issue in the TOF repo
> > (https://github.com/openbmc/technical-oversight-forum/issues) instead.
>
> Yes, please do this.  One of the primary responsibilities of the TOF is
> to approve new repositories now.  Creating an issue will get it onto the
> agenda.
>
> --
> Patrick Williams
