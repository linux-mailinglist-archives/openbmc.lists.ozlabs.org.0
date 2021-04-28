Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D16536DB1B
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 17:14:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVhxz6nB3z3017
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 01:14:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=DuFETX7X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=DuFETX7X; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVhxl6K1Fz2xfy
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 01:14:33 +1000 (AEST)
Received: by mail-qv1-xf2d.google.com with SMTP id dm16so6083494qvb.3
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+OPNYPBuw/itxwzcekyWjZQXajjsDNOhI+hlAVIMag8=;
 b=DuFETX7XWU220EWCdvfopDHimqLP270qYncE3RC0KdykdMj3VWofIjTsGQ426G3fWa
 DcUDpzIjMmBdeB7nt1qnkCi2T7SomB8O3AH4lea/dAxDOp8UPpkHi77R4Rbb5Jyoum9+
 7takhKwWxuL7I6Zd4Kkq6lT292j898UP1AIoESRDps9ldlwGeYKoU6T+9Iqevy6GvXH4
 g9QTj1efzL0X5WF5S1mCQYGTe0+PBKpVjxEFyn0V0054/rQRly+dnnPkfDb2FOR6iPWF
 L/FVrNnFeMQ4fP04XWWsR/u0R0hGfSC58drU2tZSISXOrTPKMUV+gLd2Ya82vMHnfQOj
 4Lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+OPNYPBuw/itxwzcekyWjZQXajjsDNOhI+hlAVIMag8=;
 b=SYJSVA5am9SR+P6znc5se+PGJmg0j1eGEQMarsfOH8XakF9hbfXFT1TtvNqGcAxv8k
 qMeRFMWzR57fzToFDwZgyB2ona6EbEhY2pEkYZNaunfI/9excI6XiLlq5J8pghhhTPrQ
 /N7RkAJK5KKSahNCNmYVCPmTTqJiIEMijOv7c8a0So/LS9X9vmTiAQXlQLSisk0vSAFR
 uKwXGqpP4u4orIbIZiNvA2QHmPcd5S4ab8hiTjBc8lfjSesf+KZKip5D2F502UjtP6ci
 NpCswJ3lJoqRmmMCccZa8AO4mhKnRVIyV00qs4AXIruye9ngNADashCJA8N/4yDUij8v
 BFBg==
X-Gm-Message-State: AOAM532PAn7zf0quPoB9+9rO9zK8QxmJ+FvZbL27IqDtb69EjR6i6s1U
 P4O+WZuTXO4dbbSoRIT9sBBeFvvxWUthsUUY02geiw==
X-Google-Smtp-Source: ABdhPJwi5qBGGRUOHDN8XlTgfrPr6gD1fGnGPCPY3xtU+H0tvV0z3KVtxtQy/0jz0OsrNqI+euaJe/oZjtM7bb7rpr4=
X-Received: by 2002:ad4:50c7:: with SMTP id e7mr29180602qvq.48.1619622868013; 
 Wed, 28 Apr 2021 08:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notybt0NeU6N2QFmPFv8bOs3fxHrT_+KVGZyuRJeyCGqxcg@mail.gmail.com>
 <20210428010816.oeumsvfwb6kyu5fq@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210428010816.oeumsvfwb6kyu5fq@thinkpad.fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 28 Apr 2021 08:14:16 -0700
Message-ID: <CAO=notzVwRdayCxbZ6b7A3RG873rB=MJSPbu5rqpR9pnJOSSKg@mail.gmail.com>
Subject: Re: phosphor-hwmon-maintainers group
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: Brandon Kim <brandonkim@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 27, 2021 at 6:08 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Mon, Apr 26, 2021 at 12:52:09PM -0700, Patrick Venture wrote:
> >Brad;
> >
> >Matt Spinler and I are in the group phosphor-hwmon-maintainers, but
> >neither of us in the group are maintainers of the group, so I cannot
> >add "brandonkimbk" who is taking over my responsibilities on this
> >repo.  Can you set Matt and myself as Maintainers in the group, and
> >then I'll add Brandon and remove myself.  Or you can.
>
> Hi Patrick, I've added the maintainer role, thanks!

Thanks! - Brandon, I've added you as maintainer, and I've removed
myself.  For reference, this is managed via this group:
https://github.com/orgs/openbmc/teams/phosphor-hwmon-maintainers/members

>
> -brad
