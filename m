Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1232738FA
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 04:57:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwQvn6FNvzDqVx
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 12:57:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d33;
 helo=mail-io1-xd33.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=droVQPBK; dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw05d4FKpzDqMp
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 19:49:15 +1000 (AEST)
Received: by mail-io1-xd33.google.com with SMTP id g128so14660969iof.11
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 02:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1Sla7anBPRVIy+MKDct8pMUTnrRqtwlM5W9oeKyzxu8=;
 b=droVQPBKGhB+OLj9+YEyaM+cslNKx4iu3xFTVOaiWVnkPXGS3ubMXuTPj1ItxZ1KyQ
 UGC4LleRZOoBySxkXvL+tuC+14ugemwhVaTaz3DCF/xtQyKNKdDooIXB6W6c4IcgEy8s
 mH9jsrpyRF6PoFdAZgFYL8LvGvrbtf8n71EhpbNGpuO/uJOb1DX2lB+0rSa0h3cysncf
 i1QyInEcj8v8l/yki/lSStZ2G+UnQiNv5LbX9ybyprGvos18kUuKeZnbR3fbRphj5N3Y
 X+reej1gPEL1h0W8xNLs6I092U+coXigwBW61cGXC/ZfOLRqzbHE6jffEuavdJaiMEX7
 hcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1Sla7anBPRVIy+MKDct8pMUTnrRqtwlM5W9oeKyzxu8=;
 b=MTu85wLylP4znVN1aXo0SH/LNG3XQWxJtFBOQF2VT1CsbEpnskSKjYWuBFHeUu9JC0
 GgEYyje2henljCzEM0MAB2GgUA+jxItFeb2gRtzxeVp/tUKALkwJ4iJ/ZGKc+Xmxz8up
 FCqfuGP3d4r0dMToAex44izlvXm2RwS/6wOQSnEYJyJr6S042v55cPwYoUHY85Qo248F
 9Fh9g5aAgVrNqRVWX1ijt+B1knmJArHBwhVZnWOVYHzHmdf457klYw8ZMdONOhOBciog
 BL5Mg56WkSDIOJB2gTr42x+CGG6ooOaNc8hLRUrObPhwAkYEG9X7QZ/PAG0Ylh0qGgxQ
 f7uw==
X-Gm-Message-State: AOAM530738040CCIRA0PM2xKzedz/NqTOI/48yup3K9D1+ynrJ/eVewT
 VnJ2aUwdjELdwaZoXqfMhKvE9LC3jGRD94XS/9MHzI4lj4b2mm9y
X-Google-Smtp-Source: ABdhPJxx1A1qWaVKrXleNOgN1rPIr3zgBC93mK4P3FWlMXu9pq/me15bJuCRlmKEKDxOktNBYoq+K+D0gocS8RaDIf0=
X-Received: by 2002:a6b:8b89:: with SMTP id
 n131mr35391710iod.170.1600681751165; 
 Mon, 21 Sep 2020 02:49:11 -0700 (PDT)
MIME-Version: 1.0
From: Anton Kachalov <gmouse@google.com>
Date: Mon, 21 Sep 2020 11:49:00 +0200
Message-ID: <CADVsX8-wnxytDGqY_RLAxq3cEzAMoK_bJRnuVa5=-YtPth6guA@mail.gmail.com>
Subject: Headsup: Alternative to the filesystem overlay
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000002da80d05afcfc34a"
X-Mailman-Approved-At: Tue, 22 Sep 2020 12:55:30 +1000
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

--0000000000002da80d05afcfc34a
Content-Type: text/plain; charset="UTF-8"

There was a topic year ago:

https://lists.ozlabs.org/pipermail/openbmc/2019-August/017611.html

Is anyone currently working in this direction? Any thoughts on possible
approaches?

We're going to revisit this and discuss possible solutions.

One point to mention is: introduce an image feature flag that would enable
rootfs overlay, i.e. for development purposes.

--0000000000002da80d05afcfc34a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There was a topic year ago:<div><br></div><div><a href=3D"=
https://lists.ozlabs.org/pipermail/openbmc/2019-August/017611.html">https:/=
/lists.ozlabs.org/pipermail/openbmc/2019-August/017611.html</a><br></div><d=
iv><br></div><div>Is anyone currently working in this direction? Any though=
ts on possible approaches?</div><div><br></div><div>We&#39;re going to revi=
sit this and discuss possible solutions.</div><div><br></div><div>One point=
 to mention is: introduce an image feature flag that would enable rootfs ov=
erlay, i.e. for development purposes.</div></div>

--0000000000002da80d05afcfc34a--
