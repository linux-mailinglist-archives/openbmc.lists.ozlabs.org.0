Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 397251E359F
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 04:26:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Wvpm2P8wzDqMy
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 12:26:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=dpZqKgHP; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WvnY6LJpzDqMb
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 12:25:37 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id n141so10579909qke.2
 for <openbmc@lists.ozlabs.org>; Tue, 26 May 2020 19:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uLe150k96kFsWbaYpY0rx1dU2QnIc8IZAEIUxTclCnw=;
 b=dpZqKgHPyPWt0QDyQhFHp9cwxHdJIWgWqMD9tvxd9ngH+QXxCRM8smQ+KU4cWXytBf
 Pi1Xn0moYzcyhu6MmyZGa/grCdQitrtvwxXsn7qNt3Naf8Male1pJgpmWVkh+e1Mq8C9
 /J4vpQBoJN9HQ+5T23tgg/lwTgHWDOwi3wR+xxEE67hgiyRWFp95BWkVfmC2nP0d6AWW
 ggN0d/rlfHUgJfadMLlOIsmOorUMPKewQhfDE9GvKFqIo5LAThTX+sJHqCIZ9lEH7B9v
 Eiuu3Q0ZClaZPZTL9YVL6FnWmV7XFOCJRsFN7embzczZIvwENqSjsjO7A/stLv0wOgws
 6mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uLe150k96kFsWbaYpY0rx1dU2QnIc8IZAEIUxTclCnw=;
 b=D0n3a6rgBKjqr3yANlCT2Wz77pUKNhsShMAIOJJcDuEmdmsOOxBijmJKyoicXQPbGq
 X4SAOlm7IgAS1ecTVDwuglScqhXJTR8a38SbZtNdjFXHgCxJ0boIdAU/PvPyTrH8qI2i
 m+y5vV/T6Bv13nk2LQ67vRIuTbaq2NzKAwbiYEjnPcMhHOMqOtu7M6IN2Tqkccf0+r2t
 q338qhz6fa4D6uDowse+tDxTvV7bvsp7rBqdDfphBQYNDGqpIHAvJ4qfk5i/ABG2UMKo
 rK3d0SsUbc5iyQcya01lnjSPey2yB5myVgnIzJA2wQMHzueXg2P+M37joG4ZjrcXhYia
 mgMA==
X-Gm-Message-State: AOAM533m9CCzNDZ2OVVlJQdf86ajFQttLJUfnO0eCaH3ySko0Uj0+7dr
 xazcYKZd14u8WPTt3c2/UEWdP01ENnlGiZmyYDYknA==
X-Google-Smtp-Source: ABdhPJzWdvkYdink/moDHvVn24pd95/dBAsXgiZoUwBnyWvzfGCujbGUQKnm7l1KlVGUET21GjyVJah/WEiP0ZvFwsM=
X-Received: by 2002:a37:b107:: with SMTP id a7mr1820832qkf.133.1590546333611; 
 Tue, 26 May 2020 19:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <bbd0955547ff46728528fd14d52fb04d@SCL-EXCHMB-13.phoenix.com>
 <CAPnigKn3TOKhMTimsigFGmA0axAR9VrrrFhYuRNVFuxnkq1XVQ@mail.gmail.com>
 <81002ab230724519b523f4cff7c49b3d@SCL-EXCHMB-13.phoenix.com>
 <CAO=notxZsnDFbwK2K-ck9d-Udi-Crb+hWpu8NF4iESWkeRwJyw@mail.gmail.com>
 <71a53f7f4b0a4024ae5021d7a380a9da@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <71a53f7f4b0a4024ae5021d7a380a9da@SCL-EXCHMB-13.phoenix.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 26 May 2020 19:25:22 -0700
Message-ID: <CAO=notxe0wZPEbqTpYpDX+ShSYdAk6EHsnLt-5KC1ybwwjeGhA@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash state recovery
To: Patrick Voelker <Patrick_Voelker@phoenix.com>
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
Cc: "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 26, 2020 at 3:14 PM Patrick Voelker
<Patrick_Voelker@phoenix.com> wrote:
>
>
>
> > > Internally, it looks like I need to get to abortProcess() but to do t=
hat I need
> > to close the current session but I don=E2=80=99t have a way to obtain t=
he sessionID
> > after the fact.  Also the stale session doesn=E2=80=99t seem to expire =
(as mentioned
> > in the readme.md) and I can=E2=80=99t find the support for that in the =
code.
> >
> > https://github.com/openbmc/phosphor-ipmi-
> > flash/blob/master/bmc/firmware_handler.cpp#L95
> >
> > You should be able to just delete any of the blob Id paths, such as
> > the active blob path, and that should trigger what you want.
>
> As coded, that only works to abort when in in the verificationPending and=
 updatePending states.  That won't work if it's stuck in the middle of an a=
borted transfer with a session that's still open.

Right - because handlers don't control sessions, those are owned by
the blob manager that's routing the commands. - then we'll need a
patch to handle expiration, per the email chain - Sorry, I
misunderstood the circumstance.
