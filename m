Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D27D1EC6FC
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 03:57:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cBqr4gFqzDqXm
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 11:57:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f35;
 helo=mail-qv1-xf35.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Grjr6y+2; dkim-atps=neutral
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cBq31MWxzDqWn
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 11:56:46 +1000 (AEST)
Received: by mail-qv1-xf35.google.com with SMTP id e2so362311qvw.7
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2020 18:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RHpZnXxiNyweeOuQdc0VCZtfFRgxLBF64p4rR7jBoi0=;
 b=Grjr6y+2kK+FrJX6PVKxKzb8BmC+xTdV3sX/VuyAawkUsOwxnxEgXc53YTp6IudlmH
 Z1hSyaXV791/TYFXH86jYFL5RnZ0w+BZq2rivVq98n+48cud7KBioVH0QmFQepxbEKe4
 sI8Rv9xN1t1awqP1Hv6Rq+74Q+rfXUOHKa8k8kzLFxnDnikrhTTzZYw2PvhzT9WR6b/p
 ySHMU/ers9iIXlXBLumd6xgNYpo23TeDdXo1Fvnqvdxp7eC+eG47I3VyEfeHViOj9Pvq
 PpYDxIPA3Ef3ptnlFeK/Mhi50W+koBKAXU76fPqTh4aHSbP6D0RVUtGJQtvyeN3iklZE
 J+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RHpZnXxiNyweeOuQdc0VCZtfFRgxLBF64p4rR7jBoi0=;
 b=GeTX4GW6a1G9MmqiGtIN9CNRQMmYSpZJMjOtTR4AwfyXYvqyl1hs10KJ6Y2NbH3vir
 CfwBKAhhhU6tXkb3UPISnHZvhybYV/1AoueULE/uVPLZh+YlzZYkOYfUsyIwDh+FCUQQ
 aflP6tdf+UhWyRQx62sfQ4K7Uli+4XUXjiobLKf6zjhI8JyWkyb49TZNCAHtqVLGZx9I
 NAS2DYln+5wkFIZ+QwOW9T/kmbpKhCFtq2MwdOvgESgiHLT9F7HJoy5BWn0vtQbEsIeb
 oTK5n3ghE34T3l02AMbuVPnhMwtfUHFxByWaEAdWDQGCbVD/ic4RJZvewoBUSTEApPsJ
 Muyg==
X-Gm-Message-State: AOAM532ZWhota3IFLerY0ddnf0wb2TNxvZgMtXTUoeY0nqv/U4PNvzht
 1Ynk0gqhRT9V9iJlKXXPBDZwNgNYf/4GLzE8zz1IbQ==
X-Google-Smtp-Source: ABdhPJy6wA1udmj4lMnWncRP/5x2V918KOoFNk8wMdvVGTDD+rbgzM0YabkkEt4pOFLbMGHsvmtEmM7ym7ar+jNThmg=
X-Received: by 2002:a0c:b593:: with SMTP id g19mr28604903qve.55.1591149402165; 
 Tue, 02 Jun 2020 18:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <bbd0955547ff46728528fd14d52fb04d@SCL-EXCHMB-13.phoenix.com>
 <CAPnigKn3TOKhMTimsigFGmA0axAR9VrrrFhYuRNVFuxnkq1XVQ@mail.gmail.com>
 <81002ab230724519b523f4cff7c49b3d@SCL-EXCHMB-13.phoenix.com>
 <CAO=notxZsnDFbwK2K-ck9d-Udi-Crb+hWpu8NF4iESWkeRwJyw@mail.gmail.com>
 <71a53f7f4b0a4024ae5021d7a380a9da@SCL-EXCHMB-13.phoenix.com>
 <CAO=notxe0wZPEbqTpYpDX+ShSYdAk6EHsnLt-5KC1ybwwjeGhA@mail.gmail.com>
 <CALGRKGOmC5s_S-Jc0NVo_bcB9-6bDcQRWresiT8s_2UssjEqOQ@mail.gmail.com>
In-Reply-To: <CALGRKGOmC5s_S-Jc0NVo_bcB9-6bDcQRWresiT8s_2UssjEqOQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 2 Jun 2020 18:56:31 -0700
Message-ID: <CAO=notxM2b=b7hu+5Fawmq+8sCCaOXyp6NwHKtu2BsgtoVCYiA@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash state recovery
To: Brandon Kim <brandonkim@google.com>
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
Cc: Patrick Voelker <Patrick_Voelker@phoenix.com>,
 "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 2, 2020 at 5:20 PM Brandon Kim <brandonkim@google.com> wrote:
>
> Created https://github.com/openbmc/phosphor-ipmi-flash/issues/7 to track =
this issue.
>
> Thanks,
> Brandon

Thanks. I had some time while working on cleaning up things for a
different build environment, and dropped in an expiration method
(sorry forgot to reply to this email when I did it).

>
> On Tue, May 26, 2020 at 7:26 PM Patrick Venture <venture@google.com> wrot=
e:
>>
>> On Tue, May 26, 2020 at 3:14 PM Patrick Voelker
>> <Patrick_Voelker@phoenix.com> wrote:
>> >
>> >
>> >
>> > > > Internally, it looks like I need to get to abortProcess() but to d=
o that I need
>> > > to close the current session but I don=E2=80=99t have a way to obtai=
n the sessionID
>> > > after the fact.  Also the stale session doesn=E2=80=99t seem to expi=
re (as mentioned
>> > > in the readme.md) and I can=E2=80=99t find the support for that in t=
he code.
>> > >
>> > > https://github.com/openbmc/phosphor-ipmi-
>> > > flash/blob/master/bmc/firmware_handler.cpp#L95
>> > >
>> > > You should be able to just delete any of the blob Id paths, such as
>> > > the active blob path, and that should trigger what you want.
>> >
>> > As coded, that only works to abort when in in the verificationPending =
and updatePending states.  That won't work if it's stuck in the middle of a=
n aborted transfer with a session that's still open.
>>
>> Right - because handlers don't control sessions, those are owned by
>> the blob manager that's routing the commands. - then we'll need a
>> patch to handle expiration, per the email chain - Sorry, I
>> misunderstood the circumstance.
