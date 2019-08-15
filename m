Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B73D08F13E
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 18:51:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468XXF4vQCzDr9S
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 02:51:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NoLET9cv"; 
 dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468XWb10TWzDqLM
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 02:50:32 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id n190so1551264pgn.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W2B777okBFYU0wjrHeS0d72/mDQsG5TZgKHNUdWEDQk=;
 b=NoLET9cv5uf84sO5/4gk0IFPM7JJbbprD+sqJY7Om6uyqZQV6XVc1XThAsgi/ayeoB
 l99dy5xaLBncQ/7CzB57y9dgIlRSXJAlWr1My9327dSZgUiBES8guK5ed1ZavLlXI5c/
 7DUp//OUYhuyr0NA7FabmdyL8PCk+8Rdmo1ib9zraIpoR4N1HLCld3HKtWVs5wbHp5tn
 l1JUOdk9zb+QEbdf4mn91Ez3IyghFkgcLDW+a4qUZJOza614lU/D/S5IvJt0gTy/voNs
 o747l2cEKaZlreHPjzT1fniKRkmY9EUxOg8UbGy9x39AZRM0TBAcUMLG+Ad6b4hCDCfT
 Mj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W2B777okBFYU0wjrHeS0d72/mDQsG5TZgKHNUdWEDQk=;
 b=ShIkbVlJRqpXG/QVA4sJFhjWSRMNh1Xx2pMQeU5XjFFGO2e196K+6seVp0Mv/hFcQM
 2BgaHst2D90FSEbDan7xUTBh98Oqm1UqGDOY39OoR0as7LZ1opTMyK/XMCxzXWdTfaDC
 FCShYIM11vp8NI/G3zk4Q6/XAJD4SS5c2t7UbYmQZJNRsPWLX4san2QtFuIguYtY4i0N
 Z38T7OTR8SSHyAAPJVeNku2fy4Iv8NOa+0ndST2NzVyUOWC417S4JWBkawotHtYypIKx
 4ddgWu67HfknoVbj2b14YjYet8wrpKSbDix0anJGqVO3yl3QsciWHZdii61tcJSFf+jh
 CRnw==
X-Gm-Message-State: APjAAAWRdKXLX8G3nX9bvnA+Mt9kdzl8k57L8MSKvU2vANp9lIb0cxZf
 aoKNL0+5QZNpiNNBrW9GQ1qNsoUkI8Zke39pMPEXXw==
X-Google-Smtp-Source: APXvYqzT1JNhaPmiDCoX6xjAUqqEmKha75iXsSOf3abzGG6rBngzCVOgr4BxQpUQffvsuvw0qAmw03yRnAH/JfwnAKs=
X-Received: by 2002:a63:1f1f:: with SMTP id f31mr4129704pgf.353.1565887828896; 
 Thu, 15 Aug 2019 09:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzZQ4La6sUWYsDqFsbtXV_A4EhdsUA7iTsouxZMsm+bqQ@mail.gmail.com>
 <CAO=notzy6ntzoNV3VB8Qu672nYk6qdu2j4Y2zGfi=zqsGCmmag@mail.gmail.com>
 <19d0d4a3-3696-f6af-12e9-663143c79133@linux.intel.com>
In-Reply-To: <19d0d4a3-3696-f6af-12e9-663143c79133@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 15 Aug 2019 09:50:17 -0700
Message-ID: <CAO=notwugCOwxGW=9aD=yD9FxCKDERBX_QxfGow1Kk+hF96NdQ@mail.gmail.com>
Subject: Re: unexpected configuration output given examples
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 15, 2019 at 9:27 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 8/14/19 6:16 PM, Patrick Venture wrote:
> > On Wed, Aug 14, 2019 at 5:48 PM Patrick Venture <venture@google.com> wrote:
> >>
> >> When hard-coding bus and addresses, I ran into an interesting issue.
> >> Previously, my sensors were dynamically bus'd with hard-coded
> >> addresses, like:
> >>
> >> {
> >>      "Exposes": [
> >>          {
> >>              "Address": "0x1c",
> >>              "Bus": "$bus",
> >>              "Name": "$bus board local",
> >>              "Name1": "$bus board external",
> >>              "Type": "TMP441"
> >>          },
> >> ...
> >> }
> >>
> >> Leads to:
> >> xyz.openbmc_project.Configuration.TMP441 interface -         -                 -
> >> .Address                                 property  t         28
> >>          emits-change
> >> .Bus                                     property  t         20
> >>          emits-change
> >>
> >> Which is great.
> >>
> >> But:
> >> {
> >>      "Exposes": [
> >>          {
> >>             "Address": "0x54",
> >>             "Bus": 15,
> >>             "Name": "$bus i2cool 0",
> >>             "Type": "MAX31725"
> >>          },
> >> ...
> >> }
> >>
> >> Leads to:
> >> xyz.openbmc_project.Configuration.MAX31725 interface -         -               -
> >> .Address                                   property  s         "0x54"
> >>          emits-change
> >> .Bus                                       property  t         15
> >>          emits-change
> >>
> >>
> >> Which crashes the hwmon temp program because it's "getting" a uint64_t
> >> and not a string.
> >
> > I verified that if I use decimal for the address as an int it works.
> > But I'm interested to know why "0x54" doesn't get converted to an int
> > every time?
>
> It's possible some of the changes in review fix this.. I added it as a
> unit test here and it seems to work:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/24463
>
> Unless something else in the code is preventing it from getting to the
> replacement function.

I have a theory this is the issue, that it's not always hitting it,
but I'll pick up your changes and continue testing.

>
> >
> >>
> >> My only caveat worthwhile is that the hwmon instance is already
> >> present because that sensor is in the device-tree.  So I would expect
> >> it to only fail on the export.
> >>
> >> Note, I did also try "Address" as an int and not a string, but that
> >> then failed the json validation.
> >>
> >> Thanks,
> >> Patrick
