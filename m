Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FA57A95CB
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 18:40:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yiklpeqy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs1Nt6TP6z3cLQ
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 02:40:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yiklpeqy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=dhruvaraj@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs1NJ2wxpz2yVh
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 02:40:14 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-503065c4b25so1977233e87.1
        for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 09:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695314410; x=1695919210; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w+5SKB9w7K2sUyHf+BNLvUX3dbi+25SQUulTsqaLbLE=;
        b=YiklpeqygJV1z0OTP86cUvFplDkAHguuK5/lIwh5dyDnVHy/wU0HfuJy0XpEsSzzPc
         tVss5Ud9hPuOjvWQgeoLfqAX5Vbwbq4oeXA3kn4lERGTuZ1+DeA4/RjGfG4rbkh6J8Ty
         dRCCQ4ROOAzvYq8+K9X2y+Io+dGIEGmuIPs5w2QQTgDfk24hj36mS2zqssdcw3uUlB47
         16ueIU6rEHpi8GKfLgRCZxTBcyPVQmt2DFxOl+vKqqw9FCUPZoAMOsQvygzpn44vDWNl
         QLR4iUT6b8qVZCLxU0Qm99LM55519y4L7c/VHMFbGCBfEDAAx/PC7mW/JlsqpQCHDI7B
         vZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695314410; x=1695919210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+5SKB9w7K2sUyHf+BNLvUX3dbi+25SQUulTsqaLbLE=;
        b=Bay+wPHXXD45PPkNUEo3Hhf/gzmNH/EFx5655fPqdcRIfZtFrifh5lN4KWZ8PlFVix
         yjSdUC3rCDsBrrTAt5mrrpoqARYDmzIuEaUrTMR1eMt+NUdbNZHvjDD9JMfffR4CuKzP
         Gnto2i9WT7rglCmfhNgjEIlutJJJW3rf1G87W22yxIw/cfXs4cxyk2h3Mv3HvEGWaL0K
         Z1Y1d2qq0+FeBB8aoojzE/c0xGUK02R/rG12CbkQ+ifSgTOPdAlVhBd71pAVC42dJ2AF
         o/XIjvPytY8oZWQH+4PyY7PNGP5odyCxIGdnYZoIdh5qh9Oavb0i7oKPMkhT4IHuKPaW
         wqiw==
X-Gm-Message-State: AOJu0Yy0tlJllca409MSu6GhozYQjcgUbsh6lLT95tadQYsxI17c/OjW
	0A8z/UT3CJo92XJS4MacB2vChkhamIq4n/fKIW8=
X-Google-Smtp-Source: AGHT+IE3QfkP1YAbRRIy6uFqRy9o/BB8xe3Tly8y0jJXGQlmUmYA0plnlPNKE2pXK/41WcXc35Y4V5XkSeRf4egIpRg=
X-Received: by 2002:ac2:4e8b:0:b0:500:b5db:990c with SMTP id
 o11-20020ac24e8b000000b00500b5db990cmr5603544lfr.57.1695314409925; Thu, 21
 Sep 2023 09:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
 <ZQxjlifIOo96FJj9@heinlein.vulture-banana.ts.net> <CAK7Wosg0ffdvnEfok0EaRQym+EGbi8R+MXf_nVC9yXiEfozjNg@mail.gmail.com>
 <ZQxwMalc2s8yJywp@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZQxwMalc2s8yJywp@heinlein.vulture-banana.ts.net>
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Thu, 21 Sep 2023 22:09:57 +0530
Message-ID: <CAK7Wosh6OkftjtQHFe5OwcwOkpzjcdT7reXnED9zw=uc1VXshA@mail.gmail.com>
Subject: Re: Proposal: Removing redundant EpochTime interface from dump entry
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 21 Sept 2023 at 22:02, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Thu, Sep 21, 2023 at 09:13:44PM +0530, dhruvaraj S wrote:
> > On Thu, 21 Sept 2023 at 21:09, Patrick Williams <patrick@stwcx.xyz> wrote:
> > >
> > > On Thu, Sep 21, 2023 at 08:52:15AM +0530, dhruvaraj S wrote:
> > >
> > > It looks like the potential concern would be with bmcweb.  There appears
> > > to maybe be some common code related to LogServices that expects all
> > > logs to have the Time.EpochTime interface.  Are you going to add
> > > alternative code there to look at the Common.Progress interface instead?
> > > Is this acceptable to the bmcweb side?
> >
> > Common.Progress interface is already implemented in dump entry and
> > bmcweb reads that
> > for the status of the dump, now that needs to be extended to read the
> > CompletedTime also.
>
> Are you planning to do that work or is this a call for assistance?
I can make that change, but sent this note to understand if any more concerns
>
> --
> Patrick Williams



-- 
--------------
Dhruvaraj S
