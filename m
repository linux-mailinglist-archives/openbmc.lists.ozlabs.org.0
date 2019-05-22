Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9860225DF2
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 08:16:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4582TW0VjTzDqMV
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 16:16:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="QN4s2Uup"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4582T35lT2zDqL5
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 16:16:23 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id a132so728994qkb.13
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 23:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b52z/fyJDLJRVAjIR8X0NKmtpWDdBscRV0fXaQcC23s=;
 b=QN4s2Uup5209Qd58JKjgAZ6ddw8cCGgb8Wv9LhW7ZxE5l+RhHWigkzUiwAR6rW096E
 G+sbnEj5KaF35kBCndwIPSqdZstDYdCg5uUwHLUNw3DsT4ISZ2Nvv38KfBEBagzs0GMW
 DntUgMxHbKMJzSYaGmFc/aKQPV/Wf6IUeM+Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b52z/fyJDLJRVAjIR8X0NKmtpWDdBscRV0fXaQcC23s=;
 b=f7z0pgJ4/mbBV1mEMVZBD9J4HxqtX6MTUEFcjiTuxYRGUwJC4GwRfzRW0G11HWb9sI
 F6xzRp4qac8JWwR0gToRNQvGsZ2t2KO2Z/g4Qkw/hXj9nlNzuF10AvEObmgbMDwY+YP8
 gx8NinkEApwtSjGwmIWpHCUJ9+JcEbd0oXatS1qPP8Y63itjChKPI1SSYRf0Yamz3A/g
 0P2SntgFGYWQICWzbjskC3ELB6k9qWkJ7L66UoeEdue4DvxYWb3OYDiob6HCL2RCK0k9
 Kl5Ys3Ijs6iNLd1Ze0i88CQRrNiDPAXoxBF6dMmSYDzfnToK0hC9VM7j/budBTN4ofu/
 oROA==
X-Gm-Message-State: APjAAAXPPmvseiexLQTQaolQbJwTv1rTaoCxkrpH4PACpqehvNzxJ/cr
 Toj0ilWSZfyoHeHcLGMofHXuzl7Z2yC/AQCYj4s=
X-Google-Smtp-Source: APXvYqzfnn8ud6Pj71uettSp2d7XnPchagsJqq1QTMWDBg5zYJu6M+61R5jbvKrx++wVQCxZYNPevajh4gSu6lAzgqI=
X-Received: by 2002:a37:ae03:: with SMTP id x3mr13840025qke.355.1558505780687; 
 Tue, 21 May 2019 23:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190516161148.31062-1-clg@kaod.org>
 <005d7fc6-ce77-4209-b37e-5aaefb066ebf@www.fastmail.com>
 <f1bb8a3f-7e98-7b13-2ccc-1b58262e9bde@kaod.org>
 <10007aac-28a5-47d7-be66-a8f9cd4941b1@www.fastmail.com>
 <CACPK8Xe4b9MvdendfEbN3LAxaaSC0V6V56FzvuFPpPruCXqQXw@mail.gmail.com>
 <3fff6467-4167-3b23-07b0-77329df511a8@kaod.org>
In-Reply-To: <3fff6467-4167-3b23-07b0-77329df511a8@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 May 2019 06:16:09 +0000
Message-ID: <CACPK8Xc62bCPeZsPVoXiRWgTvKMp1tZofzx9s4Z1UASEnrA1iA@mail.gmail.com>
Subject: Re: [PATCH qemu] aspeed: add support for a witherspoon-bmc board with
 128MB flash chip
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 22 May 2019 at 06:14, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 5/22/19 7:37 AM, Joel Stanley wrote:
> > On Mon, 20 May 2019 at 00:56, Andrew Jeffery <andrew@aj.id.au> wrote:
> >>
> >>
> >>
> >> On Fri, 17 May 2019, at 15:56, C=C3=A9dric Le Goater wrote:
> >>> On 5/17/19 1:00 AM, Andrew Jeffery wrote:
> >>>>
> >>>>
> >>>> On Fri, 17 May 2019, at 01:42, C=C3=A9dric Le Goater wrote:
> >>>>> Some Witherspoon boards are shipped with a mt25ql01g flash chip
> >>>>> holding the BMC firmware.
> >>>>>
> >>>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >>>>
> >>>> "witherspoon128-bmc" is not very creative, but I can't blame you for=
 that :D
> >>>
> >>> he.
> >>>
> >>> Should we introduce a machine option to set the model name of the
> >>> FMC flash chip ? I think I tried that in the past but at the block
> >>> level and mainline did not like it. But we could try at the machine
> >>> level.
> >>>
> >>> Anyhow, it's a good way to debug flash issues on real HW.
> >>
> >> Eh. I'm not fussed by a new machine. I wouldn't do anything for the mo=
ment.
> >
> > We could instead add a swift machine with the 128MB NOR. When we get a
> > model for the SD/MMC it would use that too.
>
> OK. That's a good direction.

Adriana, could you take this on?
