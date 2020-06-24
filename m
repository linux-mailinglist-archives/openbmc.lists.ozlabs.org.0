Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB6C2079BC
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 18:58:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sTqR2fcfzDqjx
	for <lists+openbmc@lfdr.de>; Thu, 25 Jun 2020 02:58:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Gk5N4G1s; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sTpP6gwszDqNn
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 02:57:17 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id n24so314546otr.13
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jun 2020 09:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PJ1FfoJeqgT9eYFAfXGUy2L4XQbyaoDuF4+viJwx+wk=;
 b=Gk5N4G1sZ9uqsPEFnuJXvwOyN5o6kw4bFYPJL7gVEISv8maBD3daczvJF0fpw4AWOM
 eGzfcikAuV0P41ylcTCvZg7BjYwmRP27ep3KwOdMcjFPZtET4juQxsCHcC2Myf1xtfBM
 vx3tyj3CtsQcFUurik1RUHuRN/3sU8N+uZSVWJYIjTZIlznle2hsCieXXIOlWSrXccSr
 UddualdEqU+d0X8Mhau1mImDc/eTfp2QvtBGlbhA7LyBccxagOnr44ZeJzkoodG6z38w
 CCrqyA/MjFnmfAcu00Am7T4gtYp7hEEGlyvHjqm8B/VoNTxQYQlbKGK8ZzwHjaRAmkdJ
 9+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PJ1FfoJeqgT9eYFAfXGUy2L4XQbyaoDuF4+viJwx+wk=;
 b=R3eUa+4QkSvfhWx3NXxzHGLjttQjmoeFQxpCOTEdn1VzdhIs3GO5gQ4a88f+kWlt2Z
 bYUvKuBTsae3DAmbvdJOj4jA/M1Cun0UqNflil4eGyw3Riu99qn6cWRf9OLGHIUZ3Nux
 PojbfLyuRfb4Kb3zCqC+nSyf1uVX/5wUNGWcRXi+Cwao8vajt3MEGYI7F3iCkzhVMhOF
 118V4iWh7mozpaWaVm7n6liT5eyTfFRFhyqaiLGjDUapq7rllxKhrqBybJ8hERw/pHvV
 gFs558lBXnsfLObz+rbHEh1Sfv8WhAckyOfVP/y+GCc/BznttyTsksRDfhk1MNAvnBIj
 tS1g==
X-Gm-Message-State: AOAM532Nougeh1Z98EJJelkilZ0fwyPCXhDTWt9c8zP2w2k4QYcucW3s
 JYcxIvH043Im2J+PkG8qhdAaw5va/ous9sL+2tggWg==
X-Google-Smtp-Source: ABdhPJy8eX1oxP8Dg4vBSbYrkEEJl5nKYHCCCPt10zJUGqInyQPAYo8lonybbefWrD1pWiq0h7Tq5ih9FBg4Jqh/6vY=
X-Received: by 2002:a9d:88a:: with SMTP id 10mr23124663otf.274.1593017833784; 
 Wed, 24 Jun 2020 09:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xJJn16M2p-wu7-cMsWK3+CEqMTccCg7uhWo1=MMbdxXpw@mail.gmail.com>
 <CACWQX80gd=eAb6PScrvD74S+6ownFEG9rw8ZfCfmrJSMuk7Cug@mail.gmail.com>
 <CAA_a9xJFQiYVoAkPOg_g+DDA+jX9N6VA-mOWusC1YuzYeEennw@mail.gmail.com>
 <20200624012011.GA3922@heinlein>
In-Reply-To: <20200624012011.GA3922@heinlein>
From: Alex Qiu <xqiu@google.com>
Date: Wed, 24 Jun 2020 09:57:02 -0700
Message-ID: <CAA_a9xJwwjmJOBWENiF8Y5gOckCDr=0FVtmn-D5owG3LOWKuaA@mail.gmail.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 Difficulties and Issue Examples
To: Patrick Williams <patrick@stwcx.xyz>
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
 Kais Belgaied <belgaied@google.com>, Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Ofer Yehielli <ofery@google.com>, Josh Lehan <krellan@google.com>,
 Richard Hanley <rhanley@google.com>, Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Patrick,

Thanks for the information! I'm taking a look at it...

- Alex Qiu

On Tue, Jun 23, 2020 at 6:20 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> Hi Alex,
>
> On Tue, Jun 23, 2020 at 04:47:36PM -0700, Alex Qiu wrote:
> > For example, some of our FRU has way too many temperature sensors from
> > hardware design, but we only need the maximum temperature among these
> > sensors on one FRU to feed to the PID control loop or health
> > reporting. It would be great to aggregate the sensors according to
> > individual FRUs. You can see this sensor aggregation feature as a
> > simple example in my demo:
> > https://github.com/alex310110/bmc-proto-20q2/blob/master/downstream/card_example_g.py#L69
> >
> > We also encounter voltage regulator devices requiring current reading
> > corrections according to their own properties (duty cycle and
> > temperature). This correction is not preferred to perform within
> > kernel drivers, and we are suggested to deal with them in user space.
> > See "Read Output Current" in
> > https://www.maximintegrated.com/en/design/technical-documents/app-notes/6/6042.html
> > Example in demo:
> > https://github.com/alex310110/bmc-proto-20q2/blob/master/device_xam2734.py
> >
>
> We've been discussing a very similar feature to what you're describing
> here at Facebook.  There is a very rough design document at:
>
>     https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32345
>
> We need to have both aggregation sensors (the first) and corrections
> (the second).  The design document here allows both.
>
> On correction, my understanding is that we have some sensors that need
> an adjustment depending on a *different* sensor value.  For instance, a
> voltage regulator might have some error based on the ambient
> temperature.
>
> --
> Patrick Williams
