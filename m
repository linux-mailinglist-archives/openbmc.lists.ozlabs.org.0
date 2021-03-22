Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFAE345232
	for <lists+openbmc@lfdr.de>; Mon, 22 Mar 2021 23:05:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F47pq08VNz30Fk
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 09:05:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=C3LIZSKx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22d;
 helo=mail-lj1-x22d.google.com; envelope-from=suichen@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=C3LIZSKx; dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F47pb0m77z302r
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 09:05:08 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id f16so23077207ljm.1
 for <openbmc@lists.ozlabs.org>; Mon, 22 Mar 2021 15:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=xfqk6CvS79tJRSdmWzMn5b+E31bO71o3PEnHNY4dQvA=;
 b=C3LIZSKx8OR9dMosuvBCdtMKisQWi9YL71oSQ0k3L69u2uHn8Prh4fHtDnqpN+q5dg
 yi9VQFsA6MFnY+2dcSx8N5UCwFaUzhF8ZKGNWaUsn2xezNxVvlxqCMJ0Zpk2IEDW1Qfm
 aGdY9HA7HGz9jzwmqIV6HjAyTU/WeWx8QurSxgXnjt0+xIkh3vtWsZny+LZq9H9YX/DA
 N1Od/FgJEN8oRMWt7H4qR5/+PtN6HQ/Fi22CYoApTZHysbfL0xIdN3EGXP3WV5XinG9t
 QK3OeJRQoiuoRrW+dJpvuqAJ6EDPXqyYsMQCQ3gIXJkWOrOoJCXPHdKaMI49ifEHDrcl
 spdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=xfqk6CvS79tJRSdmWzMn5b+E31bO71o3PEnHNY4dQvA=;
 b=GRwnTBB4DKAYuLiuWKcCUe2h4OS24/1BG0qZ89ijWaG7p8/BrnisgiQcxVbFCG5m8L
 ghrBRJS14iXx3vIE5FDQSSuf/CES32iwxAXWC5tlFeoM1lbPT0bhJ3pcLu2002PRKfFS
 iYsMunCl6VJ7Eoe1B/9bmudN4AgtXN41Cnjza/okxpWyWmGDCKX4euuPD2vexpoLIgpz
 3Zc5AvFzVRQOjPxnP275x8OQCeARu1ILJmd3avwCFsH0TARBDjfDrPZ5dNqQHejp/eCL
 IobKtnhBsIuwzQmuziBbti5vQPVv58egmnce6QkjVEb55lHnWEhaM4mnlaIMHARwes+/
 iEFA==
X-Gm-Message-State: AOAM530wOUA9DKXSVW7mKU+5hkG7/GpEPoYuFjODAlH5yUDok888f+pR
 Be9BM6o2Ht+TLwB2VirUZlGcktqJmfnYrLUX+q9ps2X5GAEqGw==
X-Google-Smtp-Source: ABdhPJxH9eso8D4JcO6X4qE+t5DpVSmVFe01X6o8VLbHe+caGoQPcZgmYpeEQ1o0/u1SLWiJNOkK1QJLVoG8lOlZsW8=
X-Received: by 2002:a2e:981a:: with SMTP id a26mr986934ljj.204.1616450702483; 
 Mon, 22 Mar 2021 15:05:02 -0700 (PDT)
MIME-Version: 1.0
From: Sui Chen <suichen@google.com>
Date: Mon, 22 Mar 2021 15:05:00 -0700
Message-ID: <CAJOps0ubONA_FCO+n9Gu_OfBBYuY9RhQw-AaELfyLRJjA+e8PQ@mail.gmail.com>
Subject: Thoughts on performance profiling and tools for OpenBMC
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hello OpenBMC Mailing List,

This email is to discuss some thoughts and work in progress regarding
the performance of BMC. We are aware performance has been brought up a
few times in the past, so this document covers and keeps track of some
recent work. The following is written according to the design doc
format, but might still have some way to go before becoming a more
concrete "set of benchmarks for OpenBMC". As such, any feedback is
appreciated. Thanks for reading this!

[ Problem Description ]

Writing benchmarks and studying profiling results is not only good for
learning the basic APIs and constructs, but also sometimes useful for
debugging complicated interactions between multiple moving parts of
the system.

When developers worked on devices with similar specs as BMCs, such as
smartphones from a few years back, they got performance profiling
support from developer tools.

BMCs have many interesting aspects involving kernel drivers, hardware
interfaces, multi-threading, modern programming language features,
open-source development all packed together into very tight hardware
and software constraints and a build workflow that compiles code from
scratch. During debugging, many steps may be needed to recreate the
scene where performance-related problems arise. Having benchmarks in
this scenario makes the process easier.

As BMC becomes more versatile and runs more workloads, performance
issues may become more imminent.

[ Background and References]

1. BMC performance problems are asked and encountered, and they may be
helped by benchmarks and tools. Related posts
   - =E2=80=9CObjectMapper - quantity limitations?=E2=80=9D [1]
   - =E2=80=9Cdbus-broker caused the system OOM issue=E2=80=9D [2]
   - =E2=80=9CIssue about (polling every second) makes Entity Manager get s=
tuck=E2=80=9D [3]
   - =E2=80=9CPerformance implication of Sensor Value PropertiesChanged Eve=
nts=E2=80=9D [4]

2. People have started to find solutions for existing and potential
problems. Examples are:
   - io_uring vs epoll [5]
   - shmapper [6]

3. BMC workloads have their own characteristics, namely, the extensive
use of DBus, and the numerous I/O buses, among many others. Some of
these may not have been captured by existing benchmarks on Linux.
These reasons might justify spending efforts on making a BMC-specific
set of benchmarks.

4. There have been proposals for adding performance testing to the CI
[9]. A baseline, a way to measure performance are needed. This
document tries to partially discuss the measurement question.

[ Requirements ]

The benchmarks and tools should report basic metrics such as latency
and throughput. The performance profiling overhead should not distort
performance results.

The contents of the benchmark can evolve quickly to keep itself
up-to-date with the rest of the BMC ecosystem, which also evolves
quickly. This may be comparable to unit tests that are aimed at
getting code coverage for incremental additions to the code base. This
may also be comparable to hardware manufacturers updating their
drivers with performance tuning parameters for newly released
software.

Benchmarks and results should be easy to learn and use, help newcomers
learn the basics, and aid seasoned developers where needed.


[ Proposed Design ]

1. Continue the previous effort [7] on a sensor-reading performance
benchmark for the BMC. This will naturally lead to investigation into
the lower levels such as I2C and async processing.

2. Try the community=E2=80=99s ideas on performance optimization in benchma=
rks
and measure performance difference. If an optimization generates
performance gain, attempt to land it in OpenBMC code.

3. Distill ideas and observations into performance tools. For example,
enhance or expand the existing DBus visualizer tool [8].

4. Repeat the process in other areas of BMC performance, such as web
request processing.

[ Alternatives Considered ]

Rather than benchmarking real hardware, it might be possible to
directly measure a cycle-accurate full-system timing simulator (such
as GEM5). This approach might be subject to relatively slow simulation
speed compared to running on real hardware. Also, device support may
also affect the feasibility of certain experiments. As such, writing
benchmarks and running them on real hardware might be more feasible in
the short term.

[ References ]

[1] https://lists.ozlabs.org/pipermail/openbmc/2021-February/024978.html
[2] https://lists.ozlabs.org/pipermail/openbmc/2021-February/024895.html
[3] https://lists.ozlabs.org/pipermail/openbmc/2021-February/024914.html
[4] https://lists.ozlabs.org/pipermail/openbmc/2021-February/024889.html
[5] https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DLinux-5.6-IO-ur=
ing-Tests
[6] https://lists.ozlabs.org/pipermail/openbmc/2021-February/024908.html
[7] https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/35387
[8] https://github.com/openbmc/webui-vue/issues/41
[9] https://github.com/ibm-openbmc/dev/issues/73
