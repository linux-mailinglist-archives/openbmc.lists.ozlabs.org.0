Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 877354EB07F
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 17:29:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSYQh3Jhrz2ybB
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 02:29:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=VsmZ0Got;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=VsmZ0Got; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSYQF2nZqz2x9g
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2022 02:29:23 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id u103so32144553ybi.9
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2022 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=15srLQ18bIJIdjh+SMeM5uCZjZfbhOpPjkSMzirLV5A=;
 b=VsmZ0Gotk8vwVziC8TDU2FRBcHc5mnnIuSNF4UvuThbzdZa3Hdciv1PDuAkTzkoYhF
 KowWnP3NcJOWabp7jpCRhR/SYp4rPWMGafOqbOVUhH+B0SnEeR4xIW3el4+WC56gTaoF
 qWlXUadQKmI2rxreVvdZJNtVxCAQvWU9jTqMYcXLU/s3ZQZgUGgQEwaCFDRekQ7ziUPl
 HwuG6xhAFvQSo9SMDYRVM5HD1eAQzusjO9lD0gSvBC1AC2saJBZ5OjjkEuIRdP5xXYW+
 qV/2nRSxsnKCoPTe2AIRy9GO87xk912VJrHKSFScpJQQfoWj73jhNN29/412fJ6je7WC
 Unuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=15srLQ18bIJIdjh+SMeM5uCZjZfbhOpPjkSMzirLV5A=;
 b=zXjr34E+6lCAZ9iR4zQWARaeolJhINpAwnseLYA/78KT+K+tP4nhxJcNV+qs4SmSj7
 HudTJ8k7XbqDCfWiOidB6KCNPnFLGCazc4h2SutlfFiGjZyws14PR5wgRgN2/MslB46J
 gLOvuGUKi1jtzJeoKrqkvNfvjGmd+OZt6vAX2qLp21H+D4YI78XOLsYcJ9dKADXqeb9V
 dh+cd7XG08yiU4yGAuflb8amBRPr+cI2GAuljjB7sWd2KBkUJe8Rh2oywR9wh5Dq35Px
 OdnWnLOnaEfrUC1We1mT0zcwBi6k96M0dpDlKFsbVkas3KiCGs2A0y32xekeyeBazf+l
 HLuQ==
X-Gm-Message-State: AOAM532UcaanhBFhGfdfbLvQ2UZqZJcWFwIxr41dQmJSJqRrKWiRNUfm
 92yyOA+jpgVF6eMexAEU9XkrJ/GQTemhp3rlbLBndg==
X-Google-Smtp-Source: ABdhPJynrx7TmHjkpIeOm030yVpxi4UpuhNmClfzfTFrFeQ6vWTaQwyqBXyyF7x29b3JdO/wcAuoVaz8rvCwUyc39Ok=
X-Received: by 2002:a05:6902:1502:b0:637:7536:65cf with SMTP id
 q2-20020a056902150200b00637753665cfmr27478039ybu.91.1648567759228; Tue, 29
 Mar 2022 08:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <4bc2b30d-b335-4457-9601-9c7226d6c656@www.fastmail.com>
In-Reply-To: <4bc2b30d-b335-4457-9601-9c7226d6c656@www.fastmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 29 Mar 2022 08:29:08 -0700
Message-ID: <CACWQX82FJw=wfpjfT9_T+bnvW85SJTca=yr7gOrSaY7Z7ShyAA@mail.gmail.com>
Subject: Re: Defining the behaviour of code formatting in openbmc-build-scripts
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
Cc: openbmc@lists.ozlabs.org, Matt Spinler <mspinler@linux.ibm.com>,
 jiaqing.zhao@intel.com, Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 28, 2022 at 7:08 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> Review of https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/52406
> sparked some discussion about what we actually want from the code-formatting
> support in openbmc-build-scripts going forward.
>
> ## General statements
>
> Enforcing code formatting in CI is effective in that it ensures style from
> multiple contributors is consistent with minimal maintainer intervention.
> Sometimes the automated formatting might be questionable, but the judgement is
> that on the whole the consistency is a better trade-off than occasional
> enforced untidiness. There are also escape hatches to disable formatting in
> extreme circumstances. Automated code formatting is desirable.
>
> clang-format is at the heart of OpenBMC's code formatting support as the bulk
> of the OpenBMC codebase is written in C++.
>
> ## The problem
>
> "Like all Vogon ships, it looked as if it had been not so much designed, as
> congealed." - Douglas Adams, The Salmon of Doubt

Don't panic.

>
>
> Code formatting support in openbmc-build-scripts has evolved over time and
> no-one has ever written down what we actually want. The lack of concrete
> requirements has lead to an counter-intuitive and convoluted implementation
> that has ended in some repositories (e.g. entity-manager) not having their code
> formatted as expected.
>
> There are 4 possible behaviours that openbmc-build-scripts could take against
> an application repository:
>
> 1. All code formatting is disabled: No further action

Long term, is there a use case for this?  I realize it's required
temporarily while we make all the repos consistent, but it seems like
it should ideally be a temporary situation for portions of the
codebase, and something that eventually we can just enforce globally
in the project.

>
> 2. No custom code formatting: Just do whatever the default actions are as
>    implemented in openbmc-build-scripts
>
> 3. Some custom code formatting: Actions to run in addition to the default
>    actions implemented in openbmc-build-scripts
>
> 4. Only custom code formatting: Actions to run in-place of the default actions
>    implemented in openbmc-build-scripts (which must not be run)
>
> Currently openbmc-build-scripts only implements 1, 2 and 4, while
> entity-manager had assumed 3 was supported.
>
> ## Background (AKA why don't we have support for 3?)
>
> Code formatting support in openbmc-build-scripts began with an implementation
> of 1. However, along the way we introduced the phosphor-mboxd repository which
> due to some unfortunate history has a mixed C and C++ codebase. The C code is
> written in kernel style, while it was desired that the C++ be written in
> OpenBMC style.
>
> At the time the problem arose, clang-format had two issues:
>
> a. It treats C and C++ as the same language, and so maintaining a code
>    formatting split across those language boundaries requires two separate
>    clang-format configuration files

Is the core of the issue here that we have different formatting rules
for C than C++?  clang-format is entirely whitespace changes, so could
we solve this simply by just reformatting all the C code to the common
project style, and we wouldn't need this anymore?  It seems like
regardless of C vs C++ we should be consistent.

>
> b. clang-format's -style=file historically required that the style file in
>    question be called ".clang-format"
>
> These two constraints together required that phosphor-mboxd ship two separate
> configuration files, and to explicitly symlink them as .clang-format before
> invoking the clang-format command. As such it was easier to reason about code
> formatting if the support in openbmc-build-scripts transferred the entire
> formatting responsibility to repository-specific format-code script rather than
> attempting to do anything of its own accord.
>
> Hence, we support 1, 2 and 4, but not (yet) 3.
>
> ## Analysis
>
> The current behaviour of openbmc-build-scripts is as follows, from
> scripts/unit-test.py:
>
> 1. Check that code formatting was requested. If not, no further code-formatting
>    action is taken
>
> 2. Check for `format-code` and `format-code.sh` in the root of the target
>    repository and add them to the formatter list
>
> 3. If no custom scripts were found in 1, add the default format-code.sh
>    implementation[1] to the formatter list 4. Execute the scripts in the
>    formatter list
>
> [1] https://github.com/openbmc/openbmc-build-scripts/blob/0ea75ec9efb7ffacb88f63e38fa7823fe8b124a7/scripts/format-code.sh
>
> This algorithm is implemented here:
>
> https://github.com/openbmc/openbmc-build-scripts/blob/0ea75ec9efb7ffacb88f63e38fa7823fe8b124a7/scripts/unit-test.py#L1215-L1226
>
> Confusingly, inside the default format-code.sh implementation there's also an
> invocation of the custom format-code.sh script if it exists, but the default
> format-code.sh implementation won't be executed if the custom format-code.sh
> file exists (due to the implementation of scripts/unit-test.py). So this code
> is dead:
>
> https://github.com/openbmc/openbmc-build-scripts/blob/ac5915f07d3b796f224c85477763ca7fe893dcc2/scripts/format-code.sh#L136-L141
>
> The a consequence of all this is that the entity-manager codebase isn't being
> formatted with clang-format because it ships a custom format-code script that
> doesn't invoke it.
>
> ## Proposal
>
> I don't really have one. Does anyone have thoughts on how we differentiate
> between cases 3 and 4? Use different file names? Invoke the script and ask it
> what it expects?
>
> Interested in your thoughts.
>
> Andrew
