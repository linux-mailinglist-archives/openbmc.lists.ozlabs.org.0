Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 334F645CE3B
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 21:41:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HztFZ0V05z305j
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 07:41:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Qw9aKXHn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Qw9aKXHn; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HztFC0VGKz2xCM
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 07:40:44 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id u18so6613952wrg.5
 for <openbmc@lists.ozlabs.org>; Wed, 24 Nov 2021 12:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p1eCYbaqt61sD+py/nrUChmDz8A8iithHXoToVdvKAs=;
 b=Qw9aKXHnj1sjicRpEZAAhqZbDURE5yZiiM+ZQOdiN3tvyIbowpmM/ct1oN2alpk8lr
 bExQ24jwwOurtp9vT7yUSoUSUFmRKqBaIrMLFEnyUR1lADtPeqA78RxQTotrGTAMMj7T
 4McsTbrOLRHVFt01UnRKYg3g7JegUCykgJ7nn/78Pit7KTqCTC6z0BDev2TEIJCRUzKC
 tWditG/w9mwYm0MNqd5RYH0g8fAbWP6oYelOwvULhLHcCK8Q59UijyW2FMfZz8qd4Zx1
 659ZIu4ZPTIfvtElxXxlMJz7y5FiO4YKWRt85PJjvCUFmklLSio3w0fBBBuyhbjtkVne
 qrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p1eCYbaqt61sD+py/nrUChmDz8A8iithHXoToVdvKAs=;
 b=35USbHZFkq/JPa5ZpUqOB/woUawSrTwvw4bnFmOh4aB8x8+Uf/gHY1eAGy45lD2WRk
 g5rPy29xsOfFWT3yIH3YMNDgE/xMqF1jc1iIPBzR5pMABclyRNr90Tvh88ALt3KU3fYL
 EnxjZGiPIuY3KZ9bKb7ECD9veNtrxI2iF3nsoIUpRWS0XNo+798I1kJfIMtp22CTAQyX
 x59ru7EPnjKVCeEVKcmi678WiRmeaALgrfDBbWYYw2fw6n/QusiUttXLzPIXICo0hQTE
 8wCkOww3CUKjUoNux1M1Bf8ijN26EkWCm+Xcxhysw5xSa/hjd8rxyCJQt4kBpZMSppzG
 FW3A==
X-Gm-Message-State: AOAM532m4Mdzts2V3TV87pkc0IZm9Uq8ASzHOJq+mnO1FbCnLg3bKnJi
 wycLme357sejWcEsYEADW8rJAMn2EK5/74+flEcRIg==
X-Google-Smtp-Source: ABdhPJzxnjkoadAPNjzV1mgf99jHViatF4lMUQbcErw1gDFMKBRBNyVfFVbyIiIe/CG6DMm5WHUB/E+AkWqZ7uKLX/A=
X-Received: by 2002:a5d:400e:: with SMTP id n14mr21819873wrp.368.1637786440760; 
 Wed, 24 Nov 2021 12:40:40 -0800 (PST)
MIME-Version: 1.0
References: <CAA7Tbcuhk3tY-XBw2C6xtV9MEsp-Ba2GW8PZpVqj2YQNcrHb6Q@mail.gmail.com>
In-Reply-To: <CAA7Tbcuhk3tY-XBw2C6xtV9MEsp-Ba2GW8PZpVqj2YQNcrHb6Q@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 24 Nov 2021 12:40:29 -0800
Message-ID: <CAH2-KxDNqXZ3uWeeUyP=uE=e6FAvzYKZYJoJLaeG0wGZzXBwzw@mail.gmail.com>
Subject: Re: FRU Device type one byte or Two byte Validation
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, vernon.mauery@linux.intel.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Amithash Prasad <amithash@fb.com>, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 24, 2021 at 1:17 AM Kumar Thangavel
<kumarthangavel.hcl@gmail.com> wrote:
>
> Hi All,
>
>        We would like to validate our NIC FRU device type as 8 bit (one byte) or 16 bit(two byte).
>
>        This device type validation for our FRU is platform specific logic.

Please include more details about what this logic is.  In the
entity-manager design, anything that's truly platform specific needs
to go into the entity-manager configuration, as all other components
are common.

>  This was implemented in the machine layer.

Can you point to it?

>
>        We wanted to interlink this logic with entity-manager code to get the device type.
>
>        Could you please provide the suggestions on get the device type in entity-manager.

Entity-manager provides the exposes records on dbus, for which
reactors can pick them up and use them.

>
>        Please refer below link for existing devicebit validation in entity-manager.
>        https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L430

I'm not quite following what this has to do with your above, given
that this isn't intended to be platform specific.

>
> Thanks,
> Kumar.
