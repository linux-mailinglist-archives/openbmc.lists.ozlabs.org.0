Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C27317429
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 10:46:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zVS90qW4zDqGB
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 18:46:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="WoTOTDc1"; 
 dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zVQz1kFvzDqG9
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 18:44:56 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id j53so3147454qta.9
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 01:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iv5roIwfe+VjsPMeqqivdmrwJQET0A1rrl3GGyn3yaA=;
 b=WoTOTDc159Sl62E6WN4dgrryqy7NuJ20AHr+vxqKDID6mDjPaWJyxVmjr6tjSK69RU
 PmwYP9sXfqQX9D9z60IdfJbuGzCKVEYy9Gvh8YhAOLFzVeu1BcZO9zf9KovHv530JjGR
 OnJyAKgogfM8NkZp4DNkbMqLDU8/UZp6HWXxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iv5roIwfe+VjsPMeqqivdmrwJQET0A1rrl3GGyn3yaA=;
 b=fekCi1aNTDcQAjUnq+2XfYc7ADbE+M+jonqFV2507MWmdxECmaS9xqSV/ZrAXZS8v0
 d9v+NslkDkTKkvMiKmerCXy91JNrgY6x1IUWWBFNNW2d/uyixJlorjYqIh00G3o37UDc
 WINn+WFr3MsUFBQJFqH4O1iPCCx6iJg6bPtR2Fb9bfXZ0O+ElCaJj7d0b4NGSXt/Vqvt
 1HnonIis9osjtUW3YgucLbqYpI1qc3mlYNld3AWenxgHcPPjQ2vwtAnRYqD27agc1/yi
 alYahRCHl6fGfU0XuOMF4lixTlogAmywDruZtTYpHUFF0xRW7Wf9FUj8kvgN1T5s1sGO
 KeDQ==
X-Gm-Message-State: APjAAAUpD7wjrfU3517KS5M/n5rpiUBZwpWOd44EZpuDkF9zYau7MtHz
 aN99gifnQEz62Je3anmtSbvQam5U6az4I8c8Wy4=
X-Google-Smtp-Source: APXvYqxqOH359E9bqXtQDOhm/fya8pe4sLwJ6yANEwrySCS9frUQSdxvtUkqGc26ThB3/nPfbfYR6SgL+pGJbQdT5E8=
X-Received: by 2002:ac8:45da:: with SMTP id e26mr9121757qto.235.1557305093457; 
 Wed, 08 May 2019 01:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=oNUnnPHXnbybAPAvdq9PvxHe4B3GiX0BYw6rdoXgDqw@mail.gmail.com>
In-Reply-To: <CAARXrt=oNUnnPHXnbybAPAvdq9PvxHe4B3GiX0BYw6rdoXgDqw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 May 2019 08:44:41 +0000
Message-ID: <CACPK8XcjuXuqejZ4oabLTE-Nv3+JXZ1Zn3qkeT3P1akpR9yFbA@mail.gmail.com>
Subject: Re: Proposal for removing legacy code update services
To: Lei YU <mine260309@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 3 Apr 2019 at 03:49, Lei YU <mine260309@gmail.com> wrote:
>
> Hi All,
>
> With 3ba97559e, OpenBMC supports PNOR code update by
> org.open_power.Software.Host.Updater.service, with the steps described in
> [host-code-update.md][1]
>
> And before that OpenBMC already supports BMC code update by
> xyz.openbmc_project.Software.BMC.Updater.service as well, with the steps
> described in [ubi-code-update.md][2]
>
> So it's time to remove the legacy services that could be replaced:
> - org.openbmc.control.BmcFlash.service
> - org.openbmc.control.Flash.service
> - org.openbmc.managers.Download.service
>
> What do you think?

To clarify, this only affects the updating of the PNOR/BIOS, and not the BMC?

Cheers,

Joel
