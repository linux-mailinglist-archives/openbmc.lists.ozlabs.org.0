Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAC3153C39
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 01:03:15 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CdtS26KrzDqTs
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 11:03:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e32;
 helo=mail-vs1-xe32.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gm6CVsjP; dkim-atps=neutral
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CdsQ2Q41zDqSS
 for <openbmc@lists.ozlabs.org>; Thu,  6 Feb 2020 11:02:17 +1100 (AEDT)
Received: by mail-vs1-xe32.google.com with SMTP id p6so2594811vsj.11
 for <openbmc@lists.ozlabs.org>; Wed, 05 Feb 2020 16:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YNy4lTCGCOpbgK+HpSX4oODLnWYi08bUsAoE+YaU+ho=;
 b=gm6CVsjPBPiLv1lWfsIXTsvJGryXpznXPRS4gk5/Rffa+gOkdfbUYNz1n1cVHYGE+H
 b3PU7l+OtAP7+mIUNNMiV0il0FGrGoe+0dS6XdM4Gwbhghhq2dEVSDHHKEpQYB8dqh/h
 pzbTKTlFdaxEUR5a8M/SyRPs3cOPvS8fweAi2Ij/GQhEWwuXOce+a8aA/nE5gp86udNx
 5iV9XvWVlTuX7qpqIn9ulXEPp0+Kww7i9yE/Ygmz0M2GjRf+U83U5ojHZq74R83bx1MY
 aZZ/6b78FXcWmMT6tb+17vsfBZcvQEWt1AfcwOhTGBY4tqcRT+dnt8+YzZFckoNmM1Yl
 E3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YNy4lTCGCOpbgK+HpSX4oODLnWYi08bUsAoE+YaU+ho=;
 b=a2dHIbIYQZ6QUQnNNlgkQIqjjdKO4oS1DjDyL7xdhCpY39bkQ7G7oQidXQ9Rr8Xu3P
 xo3YJ4TSrybzaIX6tZ7ZIDyoiCKTxxtakLXgxxFOuPsV1ctVw02jIWxtu6DoKBLLvC4F
 Eg1cVZbJEC4gRzhkkCXKAvWhoh0DmJjLgxKWneyTy1MBmIJAL11ZhxGgCvvhqEMiQ1jg
 zWFtHtNoWPL+CQM82023fGEhR303J1jhbLt5QFO1cPl1DwxWUjBfbp/mhSTkztODBQsm
 9IXyH7M1fIkE4zLAdzxVKf+TFvYO6XWY7b0rkjUUjUXjmuqoP6zZmgi0XMP0Fj0nbqEb
 VQoA==
X-Gm-Message-State: APjAAAW8MDiHQiOYgKo3W5uJjQv3LTJfphtllM64RY1YKNG4TA8/3m7k
 B7h4qochCwtpXABDtxlLrpFYiTowoSteCOP7mVC4+Q==
X-Google-Smtp-Source: APXvYqzg3juqRcOscCWd6jJdHBIIOPylcnfJ6t+bzsZf/izVDV0vCeY/01fYddkFk0AcsD05brPixEwRGOHLbzxZWZo=
X-Received: by 2002:a67:bc04:: with SMTP id t4mr159042vsn.139.1580947332542;
 Wed, 05 Feb 2020 16:02:12 -0800 (PST)
MIME-Version: 1.0
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Wed, 5 Feb 2020 18:02:01 -0600
Message-ID: <CAG5OiwhNq55Om4=NU8F7SSebDqMQpKhHuhAC-aFz=QKBLM6Wig@mail.gmail.com>
Subject: Community support - where do want to be in a year?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The new year is well underway, and I have started thinking about more
that could be done to enable a stronger, more open community, and to
have a better developer experience.

I'd like to get your feedback, but please, this is not meant to be a
complaint platform, reply with ideas and solutions, or at least an
open mind for how we can fix it. I want to hear ideas!

I am looking to organize a prioritized list so I (and others?) can
focus on making things happen. I am hopeful that my downstream
responsibilities will be reduced in the coming months and that we can
start making real community progress.

Incomplete list (for priming the idea pump):
1) Existing (donated?) services - Gerrit/Jenkins hosting, email
service - what about hosting? what about disaster recovery/backups?
How can we improve?
2) Automate openbmc.org wordpress content/updates, current events?
meetups? blog planet?
3) Metrics - what would the community like to see?
4) Early development plans disclosure (new features),
charter/policy/culture changes for upstream plans, improving speed to
commit, review commitments?
5) Third-party CI testing/review reporting, supported platforms,
release testing commitments

What are *your* ideas for improving the community?

Kurt Taylor (krtaylor)
