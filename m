Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 286AB271F52
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 11:54:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw0Bs1mb5zDqbq
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 19:53:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12a;
 helo=mail-il1-x12a.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=iaW+EoOm; dkim-atps=neutral
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw09y50cKzDqV5
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 19:53:10 +1000 (AEST)
Received: by mail-il1-x12a.google.com with SMTP id y9so13086695ilq.2
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 02:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6uPA37nF83TnBb3mh0jcErr8gRITamsS1l4bLPFLQPo=;
 b=iaW+EoOmJPyONAwxbS/FIbmbtqpDKiyKCwV3J0/QWa563FRLnansevE/obNvM40i2m
 f0tlXohVmvsmeIo8l+81eK2VW6mv9Y3M4kJ7guvJgfC0y/XV8XcXtd6BDCsNnnGydHTH
 cKVLKnBJpkOryYSEgjxsjZAyhAv7W1Nfxd8JvSBz38IHzQgZTrqNg2Bic4nOypL0cmqj
 LrjbZm7B49fSNYQHbKD0J+29V6crHVkqBYMizp7ntzpezcEJmmIEGlRoau00HhJjNmD7
 juZMj9b4KjlYb+rdPmyvMpLbIKLTWhUOGc5F9VYFll005bSMs2q6dKTVcXbsPjJRE1Iq
 PYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6uPA37nF83TnBb3mh0jcErr8gRITamsS1l4bLPFLQPo=;
 b=P37Ej+L6+GzZKrwAPG6+dNsnJG4gux0OeVYk5DvkjgE2qIkDQcB+cagwweOxF5tPZF
 bu7pG9VPyrEukSQw6zuAxV4VcBnhpu6fWnQ0vAu4MuEqg4qfuZMuz5kL/c6YtAt7BDDN
 KUf97M46H7uZ9/d6OIvyKTcFGmfyPGdDXEGKEaj3YgxhGS3+W5QnX59k9+WLUHLfedOP
 ysE7tLSNZ83ZxZXE3o0qeOmEXJOmetWVTL60MwLBx8d37QrOIQp9FWFOXGC14+WA9k3V
 TlQcBRssmqM54fiPVe79+bKKIfIAYahyyEjk0oOCNi/Hdc43cZpRYjPXfU8nokVbumNd
 vB8w==
X-Gm-Message-State: AOAM530XialBPtYUqRIHbiQQnE4vB+GVZBe27N6H1aiG3T32NhN1lL87
 2z/ol9sVpWPjFgPTkQAnwJaW9YuF3oNXjl4dPJZ0nI4+qSM9zmJz
X-Google-Smtp-Source: ABdhPJxRSyOm1vkcRUfuPZLTVzA/qhYSGP61vM+NZCBX2xUttaby+YTrzx5MaJwal5UH43BFn45Kp5jSZGGTjPPDtN0=
X-Received: by 2002:a92:405d:: with SMTP id n90mr19511752ila.58.1600681986256; 
 Mon, 21 Sep 2020 02:53:06 -0700 (PDT)
MIME-Version: 1.0
From: Anton Kachalov <rnouse@google.com>
Date: Mon, 21 Sep 2020 11:52:54 +0200
Message-ID: <CADVsX88ZPmZh+txe1Zis4YfJnXQ4_n-40r6p5Y1hy5_KegUeaQ@mail.gmail.com>
Subject: Headsup: Alternative to the filesystem overlay
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000030db1105afcfd1d0"
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

--00000000000030db1105afcfd1d0
Content-Type: text/plain; charset="UTF-8"

There was a topic year ago:

https://lists.ozlabs.org/pipermail/openbmc/2019-August/017611.html

Is anyone currently working in this direction? Any thoughts on possible
approaches?

We're going to revisit this and discuss possible solutions.

One point to mention is: introduce an image feature flag that would enable
rootfs overlay, i.e. for development purposes.

--00000000000030db1105afcfd1d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There was a topic year ago:<div><br></div><div><a href=3D"=
https://lists.ozlabs.org/pipermail/openbmc/2019-August/017611.html" target=
=3D"_blank">https://lists.ozlabs.org/pipermail/openbmc/2019-August/017611.h=
tml</a><br></div><div><br></div><div>Is anyone currently working in this di=
rection? Any thoughts on possible approaches?</div><div><br></div><div>We&#=
39;re going to revisit this and discuss possible solutions.</div><div><br><=
/div><div>One point to mention is: introduce an image feature flag that wou=
ld enable rootfs overlay, i.e. for development purposes.</div></div>

--00000000000030db1105afcfd1d0--
