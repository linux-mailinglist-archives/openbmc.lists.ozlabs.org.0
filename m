Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44B600FE
	for <lists+openbmc@lfdr.de>; Fri,  5 Jul 2019 08:22:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45g4Wd40v9zDqNw
	for <lists+openbmc@lfdr.de>; Fri,  5 Jul 2019 16:22:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q7ZZQJOq"; 
 dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45g4Vp6ryLzDqWN
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jul 2019 16:21:38 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id k20so16856642ios.10
 for <openbmc@lists.ozlabs.org>; Thu, 04 Jul 2019 23:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4hjp6fxPBwu+6/VEBQPjKri38PdsRJfErR5thA7k/do=;
 b=Q7ZZQJOq8okOxqeJWZAMbmW8ytv7LxPzBonFKMp7tFCiYMy/+mHHEO0DdpdFAyoFNW
 CeH+Nhtai+ljz3bbwcZJuX6QyMaPl8KVPS+/dprRvwEiPJ1A4l5Ww++7y3bTgPY5zH3T
 bfPmrJCu3/dWuEVTAtlN7zNlNRKlRRQVTNOd84bog2iee4K7TrCFriP6+dSQf8VEmhqz
 VADRontpZXowqT3loR2MPFitQOOoVx6DqCwI1PymP2aCQx3NI/jPE24uN2aJx9hgfkZ8
 7aTF6v/zQNRQuBznxhlIaCs6rMn6n5OgUoumvxptYZ3hFmNdNw9q7ff98xKoLCiRCyGR
 r/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4hjp6fxPBwu+6/VEBQPjKri38PdsRJfErR5thA7k/do=;
 b=DmEDbM54HQPC5O9vCWxiaaoTM/o5QHpDENxMcAZXSqBL4JIUZ488obnzdrev7qlldB
 gufTbgx5QxCFGbtfFY2q58TdJ90GtcibRO06ZpeoYKvxG9NHNbdOSPrSwDnP46uYAQKg
 EMM4O9wcr8T457XmTROIbfpgUEHxrRo8CEKtsQm+ybexKBDuQSWZ3oAMyzeufhMd+pfL
 bJyQJX06FC3d/JFPowGq+Dluam3IP65bFzaVc4k1NAd/e876RzPXEjQEEgIGzGMbX4ZA
 jeA7CQoXdKpJUjVIXx2aZvTV8nij4JGF6NtyPtXwNx7ZIUxs8NQognzOP42NNO01FAzo
 q5tQ==
X-Gm-Message-State: APjAAAVBg/+uKon8Rpe5y+MGdL7KpuofrjLI/jDesDDPqbrfyyd7JAlc
 Of7pgAhMnCYZKxu3761v6JbdIk37yBHNtTSMDPLLvRw97V0=
X-Google-Smtp-Source: APXvYqyeAWKnU+qeZpQXZoJ1zBYaDe/epMoR/nhsOWEeJLBCC1ehXIndWzNJ48BboIN1jxHfxd2jmih3RAdpwB0uTD0=
X-Received: by 2002:a6b:e615:: with SMTP id g21mr2316779ioh.178.1562307695657; 
 Thu, 04 Jul 2019 23:21:35 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Fri, 5 Jul 2019 14:21:25 +0800
Message-ID: <CAARXrtkHr_=8xMXynKxMsUm036mGPDnS4ORHoM1uGMRhvi8ZKg@mail.gmail.com>
Subject: Call for disabling libgcrypt libjitterentropy of rng-tool
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This email is to call for disabling libgcrypt and libjitterentropy of rngd.

The jitter entropy of rngd has two problems:
1. It has a bug to consume all CPU in idle:
   https://github.com/openbmc/openbmc/issues/3574
2. During the start of rngd, the code in thread_entropy_task() consumes a lot
   of CPU, until it read 16535 bytes from jent_read_entropy().

The bug in 1 could be fixed, and the issue in 2 is mitigated by lower niceness
of rngd [1].

However, why not just disable jitter entropy?

Pros:
1. There will be no more high CPU consumption by rngd;
2. The hwrng (hardware random number generator) is the default entropy source
   of rngd, and it is enough.
3. The performance of /dev/random is a bit better than with jitter entropy
   (tested by rngtest, see below details)

Cons:
1. There is only one entropy source from hwrng, the quality of the random
   number may be questionable if one does not trust the hwrng.

What do you think?


TL;DR

Here are the details about the performance.
1. With the above bug 1 fixed, and after jitter entropy is filled (otherwise
the high CPU usage impacts the performance):

rngtest: starting FIPS tests...
rngtest: bits received from input: 200032
rngtest: FIPS 140-2 successes: 10
rngtest: FIPS 140-2 failures: 0
rngtest: FIPS 140-2(2001-10-10) Monobit: 0
rngtest: FIPS 140-2(2001-10-10) Poker: 0
rngtest: FIPS 140-2(2001-10-10) Runs: 0
rngtest: FIPS 140-2(2001-10-10) Long run: 0
rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
rngtest: input channel speed: (min=46.411; avg=63.397; max=101.982)Kibits/s
rngtest: FIPS tests speed: (min=24.359; avg=26.624; max=27.804)Mibits/s
rngtest: Program run time: 3101853 microseconds

The `avg` speed is about 60~64 Kibits/s.

2. Built with libjitterentropy disabled:

rngtest: starting FIPS tests...
rngtest: bits received from input: 200032
rngtest: FIPS 140-2 successes: 10
rngtest: FIPS 140-2 failures: 0
rngtest: FIPS 140-2(2001-10-10) Monobit: 0
rngtest: FIPS 140-2(2001-10-10) Poker: 0
rngtest: FIPS 140-2(2001-10-10) Runs: 0
rngtest: FIPS 140-2(2001-10-10) Long run: 0
rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
rngtest: input channel speed: (min=55.128; avg=72.556; max=90.751)Kibits/s
rngtest: FIPS tests speed: (min=24.236; avg=26.762; max=27.723)Mibits/s
rngtest: Program run time: 2713602 microseconds

The `avg` speed is about 69~73 Kibits/s.

[1]: https://github.com/openbmc/openbmc/commit/1987be716cba85cdc1f210ceddc957a87b03be27
