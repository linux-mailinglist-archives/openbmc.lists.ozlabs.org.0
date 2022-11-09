Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D96623660
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 23:15:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6zmt62ZLz3cN0
	for <lists+openbmc@lfdr.de>; Thu, 10 Nov 2022 09:15:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JPY+nPFY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JPY+nPFY;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6zmJ4tmjz309f
	for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2022 09:14:55 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id j15so27950465wrq.3
        for <openbmc@lists.ozlabs.org>; Wed, 09 Nov 2022 14:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Phcsoz12ljqv/qgt73rYPqyOCfVwVIDPYKNxL7DUKc4=;
        b=JPY+nPFY9d+9SO/75RXYSpYoeg0O5FoFQMLVBZbneBn2HZ5ivMbCBlfQXCFH0id2gN
         kDnFRRGSoNu10eu/450hZ5fBad9TSyTYENUNC+Py8Z/Z7IPZKhEPKN9gLVArbhZOPLdB
         GtdWWizpg0NQTdozfYwI0amd8rXihcvUxz9OBtfE0VdvBDIYnhc1ARRZ08ePcjaiX6Ed
         KSJ2ri4LgM12V73j5tlSP9gDJdNbItRo7faBqTR3o7rajn/bTBZ3yIkTMz9PTkMmFL0S
         7H3LZ9yH4xk2qZRsNXZfB1/I4fQ40e52Z6xs5j6QomzBiz1G2thokmZAzpK9FT0++Q2q
         NhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Phcsoz12ljqv/qgt73rYPqyOCfVwVIDPYKNxL7DUKc4=;
        b=UKPXAmuk3ZILRkMkUv8BL0IdIVjIQYTfrlW6DsrB/4nJxgUMbm7kdXPRtJ+EzAI5kL
         0TdprUWGBDGJ7CDVQKKpcEF+jJxES3soxPPQAKAOP3n/JHhUI71gy+cbK1W7wMi12aR6
         BPJ/g5ZPZQ8QDx7Cn7CjzUlOPnJaNHddhAMBq4cqSGyPLqsgp6Ru9do1OBn+1Zs20sji
         WlK8NgUOgOeGKXQYGT4OhKdLF7hdiHNRqxs6LHMb5U8ZRmakW8JwjB5crL1ZEOnMURZO
         zLQgcYQvkNU1aAq1XsBQdQFfbnNBUysB0ERv9vjZJyOLUf4aEf2Q//buBiCGtXR40nuv
         VhNw==
X-Gm-Message-State: ACrzQf1YzQIbaIDKWdYjtzObfS6JauzhtfCyO5XEKJ3yq8hCgQstWopz
	BcHL2ek5EnfDILHIibShX9Co1JPLrPIcXaDdOg8blUTJmh+sYUp1
X-Google-Smtp-Source: AMsMyM5ZtRYG7KtXhfKB9i/aMp/JfRhHdcAsIdWjosogdzTZ/Z4VCueUilJ50zHQylgYLby03qO5IX5nCkiniI7Bkko=
X-Received: by 2002:a5d:64ee:0:b0:236:8f54:f180 with SMTP id
 g14-20020a5d64ee000000b002368f54f180mr38580383wri.559.1668032087643; Wed, 09
 Nov 2022 14:14:47 -0800 (PST)
MIME-Version: 1.0
From: Ed Tanous <edtanous@google.com>
Date: Wed, 9 Nov 2022 14:14:36 -0800
Message-ID: <CAH2-KxD-hmP-Hu=6bgz4L+VH+7HKP9WwX080NVPDmhVxB=xJKw@mail.gmail.com>
Subject: Git commit message checking
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
Cc: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

A review [1] is proposing deploying gitlint widely across the project,
to improve the response time for feedback that is easily caught by CI.
There are a few repos that have already enabled this check for a few
months, and we have worked through a few minor issues, but largely
it's been positive in giving faster response times when a code review
gets pushed that doesn't meet our guidelines.  A few folks have
requested that we roll this out more widely, so I'm signal boosting a
bit to make sure folks are aware of it, and those that have reviewed
the patchset in the past have a chance to weigh in to see if we can
get consensus, before doing something that would significantly impact
folks workflows.

For reference, our commit message expectations are documented here
[2].  The intent is that this isn't changing any existing rules, but
only automating the rules we already have.  The gitlint rules we have
are checked into openbmc-build-scripts [3], but can generally be
tested with openbmc-build-scripts, without any need to run gitlint
directly.

Overall, I'm looking for input on whether this is the right direction,
whether this will help folks, and make sure this won't be an
impediment.  Once this is deployed, we will try to monitor for
false-positives, but please feel free to reply to this thread if you
see any, and we will take the appropriate action.

Thanks,

-Ed

[1] https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/56592
[2] https://github.com/openbmc/docs/blob/fa1cca721c824446929705bac1654ec7ae0973fe/CONTRIBUTING.md#formatting-commit-messages
[3] https://github.com/openbmc/openbmc-build-scripts/blob/master/config/.gitlint
