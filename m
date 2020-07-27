Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC1122E3FF
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 04:31:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFP1b0pBVzF0Ws
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 12:30:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=m43sswRt; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFP0h5D9NzDq94
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 12:30:12 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id n2so10979778edr.5
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jul 2020 19:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=87lFPiRdc1I5OR0tklredV0qOpF8Qwum2uHuvotWa28=;
 b=m43sswRtLPnG839jHEUpqYNJ+V67r4alpRRRD9Qw+2wTVE8TAQ7T8MrqUtw7sk+XZG
 5VzxdeVH3TJhQhQbleHU2aY30RfA/hnDItvujtdX2m2TaN72kk/5uTaGLBLTTkreQYa7
 EyYXSRxsj06kMpkqOM1Vpe/sFWO0nVmkl71mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=87lFPiRdc1I5OR0tklredV0qOpF8Qwum2uHuvotWa28=;
 b=aD8cSsu71UBPEekEDGpgtDXC8RMNyOS3pf+Bp5V+laFUNcf76ofXCxYJZLsgTobLuv
 sGFscvXEkyremZOrK1KWhbZGLS/a/ymCMdN+XK6QuoBKIj+f5TKGaW2jHJPWnWiGbC3B
 ozB6GB1leIsNfMqoRQjmYqjCP2Wk4JqttC52hOWgY32BHqfmvkJWxB61xp7LwN+HzRaW
 0sqWkLE/jGEgbLUkJTyFjyGYgsWh64YiQDg3Yqj0te0FlLZ6eh+/G4AT+/dZtkHpVFjA
 N/D7WcJUZcEDMqrepU09Qj1Id4ZAeZfmpJ7mpXiNlIuPAZRE1qYdxJJiOP+vPOFJXfXC
 29/A==
X-Gm-Message-State: AOAM530ywAtNGu4X6n4PrDMFx7KxoGvsiKZndYofpy5XCKXr5W6antrW
 1hS7dypZWOI1BOAylb5A/fh4cNxStlQeQnLwKVE=
X-Google-Smtp-Source: ABdhPJyfTpC6G6Ezt8MNvi6KP+tnkfJMuh4Q7mIj6w/8eBUhbgBe51KqQa0TeRf3n6aJQEzQzkQUHSeBgytjGpJt84E=
X-Received: by 2002:aa7:d304:: with SMTP id p4mr496332edq.267.1595817008038;
 Sun, 26 Jul 2020 19:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200616135724.24514-1-eajames@linux.ibm.com>
 <20200616135724.24514-3-eajames@linux.ibm.com>
 <CACPK8Xd==01QYwGsqyophmaSFHpDqH=NVc8oEZhXfjJo9GU71Q@mail.gmail.com>
 <592efd7f5f45e2831dda06e1bac5a501ae33ce10.camel@fuzziesquirrel.com>
In-Reply-To: <592efd7f5f45e2831dda06e1bac5a501ae33ce10.camel@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Jul 2020 02:29:55 +0000
Message-ID: <CACPK8XcWCEUAKLhinO687Eo3NYddaWyjUw-b5c=PvFj+LoJYLw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4 2/2] ARM: dts: Aspeed: Tacoma: Enable EHCI
 controller
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 30 Jun 2020 at 12:58, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Tue, 2020-06-30 at 03:02 +0000, Joel Stanley wrote:
> > On Tue, 16 Jun 2020 at 13:57, Eddie James <eajames@linux.ibm.com>
> > wrote:
> > > Enable the second EHCI controller on the AST2600. Also add a line-
> > > name
> > > for the GPIO that controls power to the USB port.
> >
> > What's the idea behind the power control?
> >
> > Is there any reason not to add a hog, so power is always applied?
>
> There is a desire to allow the port to be disabled, for those that are
> worried about rogue USB sticks.

Ok. Do we have userspace that enables the power?

I propose we hog them on for now, so we can test the USB function.
When someone has time to implement the enable/disable function we can
remove the hog.

Cheers,

Joel
