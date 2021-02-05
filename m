Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1819B3111CD
	for <lists+openbmc@lfdr.de>; Fri,  5 Feb 2021 21:03:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXRDy3c9RzDqQ4
	for <lists+openbmc@lfdr.de>; Sat,  6 Feb 2021 07:03:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=EB+pFQzX; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXRDB0yXWzDqDc
 for <openbmc@lists.ozlabs.org>; Sat,  6 Feb 2021 07:02:47 +1100 (AEDT)
Received: by mail-yb1-xb2f.google.com with SMTP id r2so7891786ybk.11
 for <openbmc@lists.ozlabs.org>; Fri, 05 Feb 2021 12:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=33fZd1i2hgazK56qQm0BSZhIu7uQOCiDuXQFYUVoNzk=;
 b=EB+pFQzXNmGYMgYPidBJWSp6zCc+9KUkvZNXIVia8pvZrfMw0y6PvKRSPPapIHahmr
 jf6Nbea60MQtf8MfRD4qv2GSKEbFIlYNxesUoWi9Gjgv5zvXtyfPDfqv2KIEDOEQ4aof
 iBkScuSKc6qMMpo0cS5MLx5M2rF7McJCy8bYw+aRfxmAqn9QxfDmwa/gSOGakLG/QYiW
 eqMKW+hX+sETQyjGmO0jihEPjlF+ZwjMGr85A9kQE9+FyEs06oqSXA7+VSA9exY+3/Hj
 oj5lPCQK0x3e3p23vBb//nU9M2q1WZyiuJdWzgWE41MGV5y8hAkpuHpYND+UkOE2eNPV
 zaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=33fZd1i2hgazK56qQm0BSZhIu7uQOCiDuXQFYUVoNzk=;
 b=RI57e5AmSC88co1CMvJgHHDtjNfUxhMF7GpoLRzOj77jJUk3pap+SCHlIRCG33Sdvl
 0pPOsNnJxR6lXIp2mWiLe/2HVdAkTbPmkTtBpcOXQHB4xHCinpHzFSbS5oyo7IjWJeQ3
 mxSfihcjhI15ckWHEwDfUj6hSyBoq0Lpdip5Ssie/IMN3y9CRGwpvZ+B4phNlhSJ0+LH
 5sVHPc38IaYqboxwZ9KtS53oEocPgzb2vXS1TaiuP5jvxKw/uRFMg59sX638llnbolZ+
 54MP0Ndv4VPL87UJI8lwPjnNDJNQ1lJ2ltDgl8Klaho//ddoap6/tWcyCoSpFGPuZK9/
 2wmQ==
X-Gm-Message-State: AOAM530SCooRPo1KnZdJOxRJiRPlQLEq/tOHmq3IVx5Xawi+Jn3LOGtB
 Z2bpbb2hFUnI2AB4Bqmzv8IU6BR5av3+Sh46sUknDcp1GAuNgqsh
X-Google-Smtp-Source: ABdhPJwNFLBiA99MGLeFoI7n6NKa72Eom5d8701NiMpkNJAfuqdSkD0+vSh1E616uTI3IhIJycLo3GRb6X1tF0BcYuk=
X-Received: by 2002:a25:d0c4:: with SMTP id h187mr7937302ybg.209.1612555361895; 
 Fri, 05 Feb 2021 12:02:41 -0800 (PST)
MIME-Version: 1.0
From: Ed Tanous <ed@tanous.net>
Date: Fri, 5 Feb 2021 12:02:31 -0800
Message-ID: <CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6GqrvkJo59Kqg@mail.gmail.com>
Subject: Making the "new repo" requests go faster
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

An issue I've seen in the past with adding new repositories, is there:
1. Isn't a clear place to push code reviews for something "new".
2. The project quality/CI/formatting rules aren't really enforced
until after you request a repo, then push code to it.
3. Setting up a new daemon with CI/build is non-trivial, and has sharp edges.
4. "state of the art" build constantly changes (make -> autotools ->
cmake -> meson, clang-format, clang-tidy, shellcheck, cppcheck,
service file location, ect).

In an effort to fix these issues and more, I'd like to propose
creating a new repository for a "new daemon" template.  The hope would
be that we can centralize a single set of "current state of the art"
guidelines in such a way that they're usable more than just checking
them into documentation.  Initially, template repo would contain:

1. A meson file, that compiles a "hello world" dbus application that
requests a name.
2. All the relevant .clang-tidy, .clang-format, and cppcheck files
required to ensure that CI is testing as much as we can.
3. Unit tests
4. Pre-integrated repo CI.

The end goal of this would be that when new code is created, whomever
was looking for a new repository could push a gerrit review to this
"template repo" and the CI could ensure that it met the automated
quality requirements long before any maintainer actually reviewed it.
This would likely reduce the time it takes to propose "I want to add a
new repo" and make a procedure for doing it a lot more concrete than
sending an email to the mailing list.

As part of this, I'd also want to deprecate and remove the .clang-tidy
and .clang-format that are present in the docs repo, and supersede
them with the files in the new repo, such that any changes to the CI
infrastructure could be proposed on the template repo first.

FWIW, I take no credit for the above idea, I 100% stole it from James
Feist, who thought through the broad strokes of this a while back when
we were talking about how to move new initiatives along faster without
burdening maintainers.

I'd love feedback.  Do others think this worth doing?

-Ed
