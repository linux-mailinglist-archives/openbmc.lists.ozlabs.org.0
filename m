Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB06CDBB72
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 04:18:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vV7m1jZ8zDr3D
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 13:18:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pgbEkOWY"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vV6k5v83zDqf6
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 13:17:34 +1100 (AEDT)
Received: by mail-io1-xd43.google.com with SMTP id q1so5627853ion.1
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 19:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oU0GllwG3SIiTsqTgnkEz4TNvEcePEV5Rglgs38fU+A=;
 b=pgbEkOWYh5O95O6QAot94+HMFAhr+YS7tQccAWx3KYCvCKxq32mXWbygoXg/ryuFhE
 AmqSVLQNMXKv84NXnBGmz1MqJJhD/S2aVHnEzXaJx/rwyQgEK6CSlUHvpkTJa+tkLnkT
 xZLaxtXYewojRWZ20fGIR6k+hv4EzUsnProKRpJVfyw6zOm7OVPs9rY2Ac4Ra99HNjLH
 LdzMXigzdQrmiWIbjOe5Xun30J3l/mUYeHZtaH42ImTHWLMIrXImTwgPe6wsxAqfgzE6
 Y/Uzd2gjk2vKENWIV5Np4e1OtMwWra3oxmG+MfAVszKLvXkEkSmsSHE7UjztBQUmg1i9
 sg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oU0GllwG3SIiTsqTgnkEz4TNvEcePEV5Rglgs38fU+A=;
 b=FZEDvceqkFlZYPwLVuAtmrEYIrPp2ac531/PC/B9HaED5rGlFMIJZjboqrMxTz8FMH
 XGlMZM4sBlM6KKq+aWjx1Ro2qJ5ZR2N99SIZw1HE8NKpaS1iPTe3S3B9BjSx+O868m7m
 9jSl/aiYx2Hnh9+EWQ17yITbroj+gFbQH+Mygz7iRVeAUDvHgekb6JARg91Nvy5iA5Uh
 nRSGHO03QBi8nQaYPrPWkZpVIiEHZv1crU9F+Bt6o2VZfyI2tdGzVdn0bHxypOEeBGiA
 xZO2HBOo8q0BwPn0IMj7j2WOImcELa2x4b8/gRznCufCGTKtaQ9oCu2hYLEV9zbCPmHV
 BEYA==
X-Gm-Message-State: APjAAAVpdCzrKrdjrMJa/DYxMPtmKBSUgimxfcycDnFqr+77+NXy36Yl
 lCyB3xOVltnzins0ngQe1n53wjkZJDgaupTEND4=
X-Google-Smtp-Source: APXvYqxY/cCyfI/aWfHLNmpL3pVdLgogJrNiR8ZRfgPdepQZsBu1d1LgHu22DAbEsq3cG4NHINj9TDXy2r6cVLZWahY=
X-Received: by 2002:a05:6638:60f:: with SMTP id
 g15mr6888465jar.21.1571365051181; 
 Thu, 17 Oct 2019 19:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <CANPkJS9muk9j6whELvOzsqx6-fko8LgpZCmx=aCwqf7Y4g1xWQ@mail.gmail.com>
In-Reply-To: <CANPkJS9muk9j6whELvOzsqx6-fko8LgpZCmx=aCwqf7Y4g1xWQ@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 18 Oct 2019 10:17:20 +0800
Message-ID: <CAARXrtkGAe4AxjqAjMzy6wR8US57akfnQvePVLO=gtJr39K6cQ@mail.gmail.com>
Subject: Re: Question about Gerrit push certificate indication
To: Josh Lehan <krellan@google.com>, Andrew Geissler <geissonator@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 17, 2019 at 2:17 AM Josh Lehan <krellan@google.com> wrote:
>
> Hi there! I have a question about Gerrit for OpenBMC.
>
> In Gerrit, when I look at a change that I'm the owner of, under the "Owner" line of the left sidebar, there's now an orange question mark circle. The mouseover text reads "This patch set was created without a push certificate".

I have the same question.
I am no gerrit expert, but it looks like it's related to we are not
using signed push.

I tried to sign my commit and push to gerrit with --signed, but it says:

 fatal: the receiving end does not support --signed push

So it looks like the OpenBMC gerrit does not enable signed push:
https://gerrit-review.googlesource.com/Documentation/config-gerrit.html#receive.enableSignedPush

@Andrew Geissler Maybe let's enable this option so we could sign and
push a commit?
