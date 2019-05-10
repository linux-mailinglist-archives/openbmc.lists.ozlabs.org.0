Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D7519616
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 03:11:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450XGy3vBQzDqSC
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 11:11:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="gkxeUvyN"; 
 dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450XG61qQ7zDqRm
 for <openbmc@lists.ozlabs.org>; Fri, 10 May 2019 11:10:51 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id c15so2722286qkl.2
 for <openbmc@lists.ozlabs.org>; Thu, 09 May 2019 18:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qVPvZIY38VuWqkl9QWkfuQm0WFMFiaW2G9HFYZ2bVlU=;
 b=gkxeUvyNzPi9eUcJItOxaLZSz0jfVke6jzC6rUFwv9T+57LHtfmTAHmLPDtBS1v++6
 3iAM40JWcQGaYOrnhlAx17iSaUo0EgviZiW6YRdjEVcWEulkXAEZI+9EvbSiAATksiQw
 SVaDRFGEj84fVweYZLzy2W0dYFDPnmnFOjsKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qVPvZIY38VuWqkl9QWkfuQm0WFMFiaW2G9HFYZ2bVlU=;
 b=oKdYBGgeLCOUSBTvbbHKifTNNmFEdTQlHUfY4ammn6RzsfquL2UPuJXtvbnHrLWav5
 aNRFETkx6LbfUY2XS2IEYOVoNC2Nmzpkohgq+Lt8lXSW6ktwj2CBRsA5Ye9P8iIEZOyk
 GkTWQ7x8kzcaATX7zLX8tgc4Mqk0vpmuwhzLr64gmQml2dFaudWZh4vUE3OvRwDtiZKB
 8Mp2AOAvi2OzoQLX9mUQlTpWIgYpYKKUmQ8jIUFmgAUP1L5jtWGRdbqLjvyegpfH1jFG
 EJlphdtNicaWTY7M+J4C+2zexCBjl5Q1OCJdU3Yx1bIAjk7SnUX0Uh1hr8yS2/VyrTkG
 KMRA==
X-Gm-Message-State: APjAAAWNQ1vTjbvxZmsQGSSjGxvGtsHFrXwe5GAJMS+Gqac5nUQmk2Fl
 kpEBxeIYsIlvHXJIdMYRMn4Z50HOJ+mVNDYIdiE=
X-Google-Smtp-Source: APXvYqz0QgMAoU7y1ELL8FvKOLXRk9upofVEbTPSJ0f2mUyxvbUUpjzazzIxRQ6KS9ynyFQSvr8R4MorGkLotfnoYA4=
X-Received: by 2002:a37:a042:: with SMTP id j63mr6507797qke.25.1557450647924; 
 Thu, 09 May 2019 18:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
In-Reply-To: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 May 2019 01:10:36 +0000
Message-ID: <CACPK8XdV6X6j=A2Qf7RcBnWWoESi6SWMZfcoA2mJPO_JFCdcrQ@mail.gmail.com>
Subject: Re: CI to stop testing meta-* layers not in tested machine
To: Andrew Geissler <geissonator@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>
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

On Thu, 14 Mar 2019 at 13:39, Andrew Geissler <geissonator@gmail.com> wrote:
>
> I took an action item from last weeks Infrastructure Workgroup.
>
> The point was we're wasting CI resources by testing meta-*
> commits that are not actually tested by any of the machines in the
> CI job. We're also falsely marking those commits as Verified because
> if they are not in any of the systems under test, they're not being
> tested at all.
>
> The systems currently run as a part of the meta-* CI jobs are here:
> https://openpower.xyz/view/CI/job/run-meta-ci/

> Are there any advantages to running CI against meta-* layers that
> are not in a machine being built? Are there other machines we can
> add to CI that would cover some of the meta layers above? The
> general criteria for getting a machine added to CI is that it's actively
> being developed and supported. We also need to balance our
> CI compute resources so the overall goal (in my mind) would be
> to pick the machines that cover the most meta layers.

I'd like to have a nuvoton based machine so we have some confidence
that kernel bumps aren't broken.

That would mean adding the evb-nuvoton or gsj machines to CI.

Cheers,

Joel
