Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F478BDF8
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 18:07:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467HfZ6s4PzDqkZ
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 02:07:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bFzQgh62"; 
 dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467Hf36lQRzDq9C
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 02:06:51 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id p3so1186963pgb.9
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 09:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pIKD8t6UFPO4kG2BDo873p+eVtyeJ6gID7Rs8IBPNfA=;
 b=bFzQgh62UN8yrmLLEmtkAqY2RjMXp8H6PMWDRMuqlXfIgqDt4s3WT7hDS35YQxrgyB
 OkBlGxsOPAgs74vMcd33KYNlh0CovpCdtSOisf19ZS0QcvyiO5SOpIQnI3T0R0XLn3WW
 Uf5NOj6xcrp4oTfY1KjxK3bWb6Qp6wKMA01IC6WW1HQdW2F/N7WIflL7QkP40fzQ4Uy7
 PhhXqM0mWd0LKsRSGyl9xSHaYjLferhEu7nIjpLONQXfC1DSryrVVBxLMXwRgp0xXZ2o
 /aJ+D0OmLTnz8RQVDa8xePolKZrsRqAMG4eE6tbJ61a7bTEui5cuLBPDy77bAyioZwFM
 LQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pIKD8t6UFPO4kG2BDo873p+eVtyeJ6gID7Rs8IBPNfA=;
 b=LOEWax3YehnPkNvRIL0YXpfVrnQ1z04poQgBE9KIY9fOuys9s3gGjnnPNOOVQ1FJ55
 s9puWaKVU5hxYC4FLW9etMFGS1Fwmw0tA3iOM3QbxvveEG/S9aGciGlr2kQ2jk46aeiF
 36ShWn1vvlK8S2jJ5f3Yd+hX13M3sIxuT5wI1I51EefHNhnocyinYK1FXr9uMhAiZ0dz
 mzprnl5RWRfe4RCNqoB82DUyDDUnQhLdpV+ofVI1BMdm+G3sPerZW+XE27AlreQDEj/C
 Wuo4Z4hW5hNbwlIdu90MiSN45MU6bNataDiYYGLoEvRdnaHZGXSy9vOJqHQYYk1L5Z0g
 MTSw==
X-Gm-Message-State: APjAAAXGGfvcdbeVkkME0G2mUDQR3pTV1NO8u7qbKE7dYVveb6xN5JCW
 UI4Bxr9NZZXu3uI2FIZbPKQe+burP7VhmxexCZDB33uhqfM=
X-Google-Smtp-Source: APXvYqzqwulHHvqGxmQJ52pf0aygoQkckhHQL82RbyFOh6Z2/xjdUj9q/9xrzSjGEWvbb9aKGmgzuTt5sNgMJ41TjU4=
X-Received: by 2002:a17:90a:224e:: with SMTP id
 c72mr2961220pje.9.1565712408238; 
 Tue, 13 Aug 2019 09:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=noty9ksKUrPEvtgJGCmW0P01MBPGV72chtABF=vTyBCyuhg@mail.gmail.com>
 <d1536050-9b41-b84d-451e-ff75cd144811@linux.intel.com>
In-Reply-To: <d1536050-9b41-b84d-451e-ff75cd144811@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 13 Aug 2019 09:06:37 -0700
Message-ID: <CAO=notzZj8Eu=r2aVxKwYjRRkBu58=gc6rnhnJiWE8+4Xy=kmg@mail.gmail.com>
Subject: Re: FruDevice - next device name matching
To: James Feist <james.feist@linux.intel.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 13, 2019 at 9:05 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 8/13/19 9:03 AM, Patrick Venture wrote:
> > I wanted to verify this was the expected behavior:
> >
> >        |-/xyz/openbmc_project/FruDevice/Card
> >        |-/xyz/openbmc_project/FruDevice/Card_0
> >        |-/xyz/openbmc_project/FruDevice/Card_01
> >        |-/xyz/openbmc_project/FruDevice/Card_012
> >        |-/xyz/openbmc_project/FruDevice/Card_0123
> >
> > It's fine if that is, albeit in the case where we have 11 cards,
> > that's going to be problematic.  My theory is, it's meant to increment
> > the last number part of the name.  This can be done by a regex parsing
> > of the name string and then pulling out the number, incrementing and
> > tracking the highest number hit.
> >
> > https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L869
> >
> > If that's what it should be doing, then I can submit a patch after
> > some testing, I just wanted to verify.
>
> The path name just needs to be different, that patch would be great imo.

Yeah, the code as it stands works fine for this.  The names are unique
and I'm able to properly identify them, etc.

>
> Thanks
>
> James
>
> >
> > Patrick
> >
