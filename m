Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0D1A3068A
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2025 09:59:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ysb3C6fX4z3cVV
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2025 19:59:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739264341;
	cv=none; b=FIRK+UZdWIhYw5qjBW8BiOKlxVIeT2KsGAQ7nuIi+rIIhWXWJzvn/Lnx257KHIU3U/j6YqnRkB5t9gUvfpJgn6ixKhBVGm/HZ5+HdaMlw/1UZjpFzXXzLaaYRVourJaXYTRENWnKmCC4BHRDftOh4gX/tkQecAG+PK376dUJJVoj6diwCD7+M39/egqNt38RMIbPjLHpSUMm+Q+WM4sdquE/ZbPQSUAahu0YdYUgnPx7wfjSvPMCGPw1qIB0poLltLop2qUPWxXmT14G4Aa2eT2z5jiMpeeeInocnsA9iCht1e1i4QNE/7pt/ZrCV/3AJWL144nSDD7tqxLLOaL3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739264341; c=relaxed/relaxed;
	bh=NRNM6ALp9uB5i4ULvJwsKMdXk2IVyOjiOH9F45b7R2c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=f6R/IRTraeK9HMBCDb4fnyIKMJ0SYNVnYzD4bSzTpzphFyXDgXakEMcHb/8iHUfuoQ4j8w9x75VjRW36jl1xDHnC9URbSoibMPBCaQqjUAK+lNS37huAXzpoQ4HJqV3bdIWKN+eHkeJJc9Ufue1sPJ/0HUt3rg40H0q1bYyXUmWoENPZG5+7wIiPwuPlsHpQlRfArPV+N7UeEdK4gSuJ7uWPIplpg1VnzLPb/ewPjLeXj1t1Fxp0A/5N7uCeuOPVJn9aHiTelbuWTi5SVvwhE9Dw7IpbeJJFGVFf3E7Wyl0iUQsjGgc+Mpui5tDnSrrDSCD8WdBBorYmREccYcP57w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fV6f+pze; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fV6f+pze;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ysb373r5qz2yGm
	for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2025 19:58:57 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5de4d4adac9so7308722a12.3
        for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2025 00:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739264334; x=1739869134; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NRNM6ALp9uB5i4ULvJwsKMdXk2IVyOjiOH9F45b7R2c=;
        b=fV6f+pzesPTVy7CfAprsXu5JUUPXt3qNe5DiL6Ju5DF07Ri8a3Nr/2ANc/eavem+2y
         p/l8Xm/pj0DT8gYaL+vs7fUYGyodd8SuwLFg9+QgAiGg5hgcC6HYkEv1f4oicKLUXqYb
         1oM9xNxIzlespVeqXUCzt3VeTr9Bv8LjT7mwOlLyfvPcZ0GwqQn16qJDlOVoSXrEadep
         Rvo1sGnsU0lUN2yCo2AP7pSWb7gQucyTV/TB77TxIeAT7HiXBpyC41qh/Vu1gmvlof/4
         87bHpE3fgTnGcTaLVIs0+n0bwi23ViUE73jr6fSXc5Iz0jfL+K0I6XeaJJPoiSQPxXZz
         U5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739264334; x=1739869134;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRNM6ALp9uB5i4ULvJwsKMdXk2IVyOjiOH9F45b7R2c=;
        b=sukMb1etKBYxgkaUiv8TdmX3GBAhqHTSxHabDKBq5n9kBjTDmp4t4fjfQV/egCLD6g
         fLzrX6gGFT9KyXcNkke3xQZjD6CyPE55Zux1wfviNk6H5tuv3FfzuxYDwdH5Osgt/rwZ
         NCcCvOXlRRSVavgobcCgfxpSmYie5He7Hfz5PTItFDvSa+hwAj4BzGO2NnZW+LB4pvdV
         3mrtnxRfN7MsQlA+rmnf/a8OYXTTwqpdOe8MfWhw/47AVMCJj+H4p14fEJLbmXe+eG4/
         PHdb4/FY8gOqF5D1BtvCWGYzjHzhZdgW5nsDE/G0UJwooLoxzOb1cCX9o1J11Lk/9Tll
         yv4g==
X-Gm-Message-State: AOJu0YxA+3oJf7SbY9cFr9pSXlIyqMYAu/gVaRjn3vU1WTjNbW0ifJOv
	MDqOo7FbNBbHt3fDpQmrAj8ufAbP7XkicC6HYQjchXnQpETCyJWgnvJen+Dt8pr346dUPqi5k+g
	5cH1ntdoj38EqisKzwb3T3U6aG61wilWCoWo46Zx2HOlc+cFydyRNJkDD
X-Gm-Gg: ASbGncs1HFT71KkJqh9tsPr7S7KDKaTpfAkPLtLDLG3oRTnij2Z3NLfucqYmbwCFdhI
	fh1oNiaAcjJzeRaZQ3GR7O/e9o9E5G8fhT9CVL9W4czsPrhGSQmWYf73t1bYk/l8XOmA5/HXT
X-Google-Smtp-Source: AGHT+IHH9PIRr7Y6gAen6dkB4aoa/bpvhEDZlFinCnkazXGnbXNCwEaQJOM0zS54mOft18clOUKVUlrYYSnH+FxiS2I=
X-Received: by 2002:a05:6402:360d:b0:5de:5864:6628 with SMTP id
 4fb4d7f45d1cf-5de586466d5mr12204660a12.26.1739264333473; Tue, 11 Feb 2025
 00:58:53 -0800 (PST)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 11 Feb 2025 16:58:40 +0800
X-Gm-Features: AWEUYZmxV1QkvZvg2j1oUev7q4__mVxPjx_QIqwtljIfptYbFdwYSB4JazKKR7M
Message-ID: <CAGm54UHxNhSkzC84hS7fh_s-DpdOuii0g2O=GU4Z1aPQ6YMgKw@mail.gmail.com>
Subject: About meson clang-tidy issue on some repos
To: openbmc <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

This email describes a repo-ci issue on some repos related to
clang-tidy and requests for comments to fix this issue.
An example of such an issue is
https://jenkins.openbmc.org/job/ci-repository/100565/console

# Background

1. At first, openbmc-build-scripts uses `run-clang-tidy` to run and
fix the clang-tidy issues. This works ok.
   `run-clang-tidy` will parse the `compile_commands.json` and
**only** run clang-tidy on the specific files to be built.
2. Later, build-scripts changes it to run `ninja clang-tidy` [1]
    This effectively changes the files to run clang-tidy, that in
meson, it will use `git ls-files` and a suffix filter to filter all
the c/c++ like files to run clang-tidy.
    The benefit of this change is that it will run header files as
well, and potentially find more issues.
    However, it does not call "fix" and thus does not automatically
fix the issues found by clang-tidy.
3. Then meson introduces `clang-tidy-fix`, that does call
`run-clang-tidy -fix` internally, and thus it could "fix" the code.
build-scrtips is changed to call `clang-tidy-fix. [2]
    At this point, it introduces a side-effect that `run-clang-tidy`
will filter the files from the `compile_commands.json`, and the hpp
files will be filtered out.
4. Now with meson 1.7.0, it changes the internal `clang-tidy-fix`
behaviors, and it will check all the c/c++ like files again, with
`-fix` support.

# The issue

With the current meson calling "clang-tidy-fix", it introduces another
issue in that it runs **all** the c/c++ like files of the repo, even
if it's not configured to be compiled.

For example, `phosphor-debug-collector` has the
`openpower-dumps-extension` feature disabled by default, and its
`dump-extensions.cpp` includes `openpower_dumps_config.h` that is
generated when the feature is enabled. By default, it's missing, and
it gets a clang-tidy failure on checking this file.

# How to fix

I would like to ask how to fix such issues from OpenBMC's perspective.

Several potential options to discuss:
1. To fix meson's clang-tidy to run only files from `compile_commands.json`.
    Drawback: this way, it will not run clang-tidy on hpp files anymore.
2. Change back build-scripts to call `run-clang-tidy`. This is
effectively the same as option 1.
3. Keep current behavior, and avoid any repo that has a similar case
as `phosphor-debug-collector`.
(https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/78065
does fix this from the repo)

[1]: https://github.com/openbmc/openbmc-build-scripts/commit/1eb1994bbcceb70d575458dc7a968c0f26b5b6e7
[2]: https://github.com/openbmc/openbmc-build-scripts/commit/ac9c9c7


--
BRs,
Lei YU
