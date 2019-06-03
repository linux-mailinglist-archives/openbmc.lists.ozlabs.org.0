Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9AD32B46
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 11:01:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HTYv72lxzDqQc
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 19:01:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="kn2rEYOz"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HTYS2CV5zDqLD
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2019 19:00:59 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id z24so1294646qtj.10
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 02:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ncbQK/oOmm3YJcGAsokEphUZCWM1KYTsgMUHGfKx3CY=;
 b=kn2rEYOzhs1e08HaOORvN2GcSY8ywiVGSeNLw1nNKBhuUlxBArJv3QuWCRucSCr/Oo
 vP8bThOwE7uvJJLezRqBhOrM3hsQQbIKNTZZ8B10ctPLdMLn6z3osv/Y76UtCcXX4wR6
 opRMQT5KwT9hsOotppG0JzxxSmMF/oaOAZCKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ncbQK/oOmm3YJcGAsokEphUZCWM1KYTsgMUHGfKx3CY=;
 b=SsCymkRQe+lY4Nn40lORe1RXs8T4fIuDKkakcq5kMlzGnBq5+AMMKo1UVIcDEj7wfj
 mOWDY7j+sm1sEGS6fpt4OBf32+TmbfoTh8h4dDYmqtLQXRlMiPJBysTnxHNSs3YaHZdI
 tZAuzWgMuIs1TSiRz6l0KukI7UZD2dwH0yEVZah39Vsm4tZCkZV5mK/mBE2/YyP4WSZH
 9MN+LloXnMHan4T7+NVxTSKIU1JDQGfqxKnYD46finuQ3WaLsQfDvgAGPUQUwvD+J2Im
 4MAGR4mWUF/MbduIAsrBAyO4sl9eiwEQBfj+hs4ASLJlR3EHIIEZJ0O6lYVbG3H0s6zy
 aiRw==
X-Gm-Message-State: APjAAAWpL//wQbQl37YOvKd1O+8YUcSZplohK7C3RYtJZSdBFs2s8ab1
 qNbP1Mw9anaXyHfvulkACBwqFdDft08MIYvShbGRdgRU
X-Google-Smtp-Source: APXvYqwcvKc+EFk411QLSRRf3xzetFtMjGtbqWh8UI3V6obldeYHLarTqRc9UIElUaboH+mriENfmckRQykqe/03iN4=
X-Received: by 2002:ac8:5518:: with SMTP id j24mr21447483qtq.255.1559552455222; 
 Mon, 03 Jun 2019 02:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <1559156179-60850-1-git-send-email-anoo@linux.ibm.com>
 <43d1d93d-44a6-4aed-4918-aa87ad38e2b7@kaod.org>
In-Reply-To: <43d1d93d-44a6-4aed-4918-aa87ad38e2b7@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Jun 2019 09:00:42 +0000
Message-ID: <CACPK8XfGv3XaGyauL2CLYMns4umAqTxX1xN4Y87uY3Kx-hZW=A@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] aspeed/flash: Add
 MX66L1G45G chip
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 3 Jun 2019 at 05:59, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 29/05/2019 20:56, Adriana Kobylak wrote:
> > From: Adriana Kobylak <anoo@us.ibm.com>
> >
> > The MX66L1G45G is a 128MB SPI NOR flash chip to be used in
> > Swift machines which are AST2500 systems.
>
> It looks correct to me.
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks.

Merged into v2016.07-aspeed-openbmc.
