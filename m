Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 509F314438
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 07:03:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44y9c14w7DzDqKX
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 15:03:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vg9O1mWY"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44y9b85WHnzDqJ8
 for <openbmc@lists.ozlabs.org>; Mon,  6 May 2019 15:02:27 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id k8so9876037lja.8
 for <openbmc@lists.ozlabs.org>; Sun, 05 May 2019 22:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9QiB0xPtsxCNbnotWeUHMxF6FejUQE2kVT0Y8Qx/j5E=;
 b=vg9O1mWY44kWuMAy+Gvqti2Fym1etSp6SGekbsVnE4awNPSkCevWLNUC56D5eb7zas
 YKmODd8gIxi+QtGrphoy0FfSis3gINell2NsgKd8p89PXCjtb2CAHhFxyR8KVTV0aG4+
 DgEb3XFvJeFh0MpC6MfsOsYV/lkdUBXKo0JEf9irQCZZMa1SLtFvkl/NbWXXg+3u6n10
 OqQSdYPTRA+brlb8x7Gt07KU1jpAObQInnaKcdrBi2dHnKy6o+DbJlFyO0DGtwIGL3x7
 A1W+GPyrj+s2OqqR0DyI9HJBLlnMUx6EdP2eZ4YYGZzTot+zMuS1HUNODCCVaI7TK47f
 zseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9QiB0xPtsxCNbnotWeUHMxF6FejUQE2kVT0Y8Qx/j5E=;
 b=KELWzTad5lfzMlVCFxMhn7eK7YFK/9ZXWwuH8sKg8OM8GrtCLStiy0IgJI6HDxnzQx
 X0nhF8xlVwiXXhm/d+2+jUlrc9egXmTO5biQIEHXWz33ZgerHGgKKei8JDo/MA7l1hsL
 5iwx4VmkEJ8munXUp9Q5UpeDifP2BhFkrSavSWA3fNjPXjxR+SkN/d8yEac246FS4KpN
 nQoLc46GT6lQZ5gsAuvq4mgX1eEQDswTz1f+tI1u2Udg+qBTpc3KUqPqJJq7f2ACY9Wo
 YgQC8HBzB8EGZJRzIADRgGDZ+oPId4lUDRdvYYsN7GrXJKyJz01LANlCujTbcd4SmrKT
 2keQ==
X-Gm-Message-State: APjAAAXqbmrcxeXO9fznC++/eSYdzjUazzSxK/rZuE1eS69Wzfc9DO7W
 Q2bnbCIM/G5Dn3SondlFqhhWMZx1YjEKKVAzMEQFFA==
X-Google-Smtp-Source: APXvYqzyURGshUqOnIJhnv8OW6nrAbGxsm4NiT30Nxdqz9M6sdYE1U/bd2mb14qwUYy9FBmT4lgG7ghn/UXRfAywkaA=
X-Received: by 2002:a2e:8787:: with SMTP id n7mr12356671lji.31.1557118939530; 
 Sun, 05 May 2019 22:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyajN+Sft6MNBku81Kiovagfo7B_Pzm4bqf1NsLtAOX7A@mail.gmail.com>
 <8b3e70c9-f182-44cd-997e-5d07b26d76a3@www.fastmail.com>
In-Reply-To: <8b3e70c9-f182-44cd-997e-5d07b26d76a3@www.fastmail.com>
From: William Kennington <wak@google.com>
Date: Sun, 5 May 2019 22:02:07 -0700
Message-ID: <CAPnigKm6=LS5Pvf5_KUhc9yDJNJUXFfKSgpwdRvjVmOKSHcrtg@mail.gmail.com>
Subject: Re: pci util cpp library
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Worth noting that lspci just uses the libpci library provided by
pciutils. I would try and use that before parsing lspci.
https://github.com/pciutils/pciutils/blob/master/example.c

On Sun, May 5, 2019 at 8:32 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Sat, 4 May 2019, at 02:28, Patrick Venture wrote:
> > Does anyone have a favorite CPP library for talking to PCI?  I don't
> > think parsing lspci output is as clean.
>
> This feels a lot like the X-Y problem:
>
> https://mywiki.wooledge.org/XyProblem
>
> What are you actually trying to do?
>
> Maybe poking at sysfs directly might help?
>
> Andrew
>
> >
> > Patrick
> >
