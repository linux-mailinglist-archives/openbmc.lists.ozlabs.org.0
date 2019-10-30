Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B37A3EA29A
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 18:31:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473FrD64zbzDrCW
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 04:31:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nylpSUBw"; 
 dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473FhK006DzF4bR
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 04:25:04 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id 21so2033605pfj.9
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 10:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8DXiuwUg068H9lce6wN0e1BGeKmkrEAiaaZic/brpSA=;
 b=nylpSUBw3KuLBui3l/Ot3MElmafG2A+ZnFiRH87HIDWg8UE4zRKrwqMrR9NYsOVaED
 5/mhVBmQoE9QJTdcNtaCXd9YidvlbusIHZAjwxo2rZtVXirvSHhO2DsxfTQqpJtnXjXO
 1/b33GHk10qlA2puflmOGs/PFLeCZLxsjknrhBVoqrYXVfvUgKZxjikeYTDBOQ1DH+py
 qvCHKIQ6gpdkjA2obj7y3JxPojle8M77OXNHnfIuLw8/9i0YJzvcVGoQ+R4lApXAIEet
 yqfi3crXZv1Zx22gvA2ySkHVhEvyC01Qz1k2lPnsr6IQ2Z7se5A69l9jx0YVXGpRpiGj
 i/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8DXiuwUg068H9lce6wN0e1BGeKmkrEAiaaZic/brpSA=;
 b=qDJeHBDUXX0rUBb9Vxi9yrPCwGgK7ugKxjuv34P3GKk0gILwB2uxGolO2UNedthXO7
 1X7d8Yz0S5zP9HEl2j/cg7xXrlOd2L4QIrg95JDHswX0gEsohBL6vkA7Tg9Ky4x1b1Pn
 SFm8y/tGgb7orEe5O9b2IV8G/I1Y6CknHT3dYYNF43l4b+cyV2je2yJTfTw68d5wMJwQ
 rFHfpFkPYnvpVafbkU0DhrCqShcIA10i70Dz6KCiV9PZ9avd4YGoKQSZcNXcCI8sns3C
 L6Byrs+hIK4gF2KIh6t8QO8a1Q9C9fs9XLjn+JMTb5LSom6rnoRjG3UbvoqFxCgbJjz6
 jXWQ==
X-Gm-Message-State: APjAAAWW0z6mrw4oQmt/yL88rbHJZJMwXi4e8P9iPAiA+Pf0eVMHTwPz
 ePZ5HeT/n0nDADnEisfNUR8obW1HA2c0akw8VJLQNvYy/ww45Q==
X-Google-Smtp-Source: APXvYqzXNi48nJWIo6CZJktVrx3jUxf1iReWdLiREHQX8uFBTFutEcursBgNzjwckP9Kmlixc5AL6NJr26PrpeYUHX0=
X-Received: by 2002:a63:e255:: with SMTP id y21mr510576pgj.353.1572456300033; 
 Wed, 30 Oct 2019 10:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzWsPTty_3imuC2ChNWpEnkfGfpc0jZ_NMoL-sS3LnihQ@mail.gmail.com>
 <11a4d0a2-5306-3fc6-b383-f5a867ef704e@linux.intel.com>
In-Reply-To: <11a4d0a2-5306-3fc6-b383-f5a867ef704e@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 30 Oct 2019 10:24:48 -0700
Message-ID: <CAO=notx72UkAc3hD-JxR15zLuA23uVAG5CO8KZev31-Uo2TLhA@mail.gmail.com>
Subject: Re: huntergate not included in intel-ipmi-oem
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 30, 2019 at 10:23 AM James Feist
<james.feist@linux.intel.com> wrote:
>
> On 10/30/19 10:16 AM, Patrick Venture wrote:
> > James;
> >
> > It looks ilke huntergate has a cmake file in intel-ipmi-oem but it's
> > not actually explicitly included.  Is this an oversight?  Or is it
> > implicitly included?
> >
> > We ran into an issue with non-bitbake dependencies a while back
> > (leading to: https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/24581)
> > and I wondered if this was needed here or if huntergate was just
> > present but not actually downloaded/built.
> >
> > Cmake is not all magic, but maybe this is magic.
>
> Looks like in some of the reformatting it was removed. Hunter was
> originally used to download dependencies, entity-manager still builds
> completely out of tree and uses it to install GTest (although an
> alternative could probably be used as well, hunter was just easy at the
> time). I know a while back Vernon got tired of maintaining all of the
> dependencies, so intel-ipmi-oem no longer builds without the CI docker
> or Yocto. That file can probably just be deleted now.

Cool!  Sending patch upstream momentarily.

>
> -James
>
> >
> > Patrick
> >
