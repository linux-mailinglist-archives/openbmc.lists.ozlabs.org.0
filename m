Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD4A7A95E7
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 18:57:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=akcwXdwc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs1mN4ktfz3cHR
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 02:57:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=akcwXdwc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs1ln3D0Hz3c54
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 02:57:08 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3a9b41ffe12so718756b6e.3
        for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 09:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695315425; x=1695920225; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=me3vwVoss2sDXcCzZhU+CqOZchW4ij9Whu+bPwfYn6U=;
        b=akcwXdwccndmRCiOxPIhV+LIu18qzox2PwMbkDLHKkLM82IB+kAcis3YfuVd2gc01i
         TFODZs9vvdrX74UKybyp6fg5L2jil4sgTU60uMGh5o/EL+DC9sQlXyGdXHnORh/3KWgH
         MzKMLrQclQeLVj6I/aEJWD6JaRl2WkQ/LO/6sFs1v31L48kSSqFRFC9OC8EMiCaCXxeq
         MxVVcswGpE3TF3oYO8IaIvsD/s4+9onw2uNCnK4Nf1AMM/uQo36KLGK8P8ox8dGvXNLl
         21KU8UTT9A6ak2sDnGAgVc6f05j3JSm0juVtm6E+8U3z9ej2qiol8UgjBnn5Nq8/ThZ/
         20/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695315425; x=1695920225;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=me3vwVoss2sDXcCzZhU+CqOZchW4ij9Whu+bPwfYn6U=;
        b=p5Tp7V2c7SjMvytboYee26EZwPI5fP0DnFbgR8iHjuV1ixYFCA95uHH2PpIz2tsEug
         P3bNiitxmo6O+jXZ73VMmAqVt5ddvcxIBukdE4ZZrI3TD+51/p8dUI643PCxF/5QTYOm
         OCwXCi5MP4DWP9p1s4swNZsN1ihUa76f9cz7cdU2qHV7cL7406tldr3lDTxa1p/UrDoc
         FrKAJqqnkWJVNq1YyY2WAUTv9xGMMpQp6BoHVt2bPDuyvbnLTcGGfoct08xSygdeaGOa
         xOU2Y0S3WVJwkdF6hmHx7yvP0TASvzP3gH0/e8FepxcgZnoVmxSYr/Yi81ge9EPy362a
         GwMw==
X-Gm-Message-State: AOJu0YxXNTR1ruwHofSVffFepRYwW3YsjGN5vq4ST/3DzNWm2YmQGBWM
	EvZldujtwMbK2PTnLPjNgLVr387IuYk5N6E+NDlrukdi/6M=
X-Google-Smtp-Source: AGHT+IFtfI3CnB0mmisVPTVmKWtKDHP/zgTrZtHg+e1+wH4g9EN4GL7CHZVPWQSvL1RsFhpYI6YSreUTJsolL/Pk3D8=
X-Received: by 2002:a05:6871:6a5:b0:1bb:5bc3:7f23 with SMTP id
 l37-20020a05687106a500b001bb5bc37f23mr6749457oao.46.1695315425531; Thu, 21
 Sep 2023 09:57:05 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 21 Sep 2023 11:56:50 -0500
Message-ID: <CALLMt=pST5nX76byef6S4rsskMRD3xvF5gAVqhr2eRefcRa-qA@mail.gmail.com>
Subject: webui by default in openbmc images
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

Greetings,

I was adding a new system recently and wanted to add the webui into
it. Doing a quick search[1]
showed a lot of people adding it in via a RDEPENDS on some other
unrelated feature.

It felt like something that deserved its own openbmc feature and
should be in our images by default.
The following commit does just that:
  https://gerrit.openbmc.org/c/openbmc/openbmc/+/66675

Please feel free to weigh in on the review if you agree or disagree.

Thanks,
Andrew

[1]: https://grok.openbmc.org/search?full=%22webui-vue%22&defs=&refs=&path=&hist=&type=&xrd=&nn=1&si=path&searchall=true&si=path
