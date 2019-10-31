Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 406A1EB179
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 14:47:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473mpG0bH4zF3bR
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 00:47:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="s0KnhLhi"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473mmz4086zF5lK
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 00:45:51 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id u22so8548967qtq.13
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 06:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LH6N1bYMTcJtlhKfmFXoNgWi0ZiHIbg03Sa3Y9Lzsos=;
 b=s0KnhLhirQvt1mIP8I0qXtWO3wnY6+lBW1G+axzIRpk/o8W0KYxUxls0SxLgd9F713
 ixOFwxTlQ+0tqT+FuIY2832h27eDr9Lnu5kfqbZbKowdrpjBBFQScAThDsvIHXcFVa4Q
 al0f+ewLij+IMy4XJCVSYhikjB4Cme7RwLs94p5Un9aEKaiSS8jBdOQF7K760BMOlhLL
 f/txxm7Fci2iDkfW5FiTUTDW+q9az1TIrY2Yzl6LAgQewrkaVTdp8Klq6rJNCji3efnh
 NNi2skX/RqiPpyytKH0K2yDIOz7292N/K973wswa/frp15mDY/fnhift3Vj/fhG6+n3a
 cPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LH6N1bYMTcJtlhKfmFXoNgWi0ZiHIbg03Sa3Y9Lzsos=;
 b=ChP0KgHXRy2bSSQrYrIfXJSSXi6a+ZmZAFMiYbmCSLbfy7LAVL7Ciyltxd/T/8g4da
 3H9dp8lq2stztlpLlhPmYI2QAQ5AUMFMVud6E4tH5Nz7bp1RHLbdc/fjU1G2k2/p2ff5
 6fWfNWQ9Xx7WEQY9xiBXUskEsdx+eHK3k0m8JdbNkO/y9C79oG0DHu1kLWmnW8Rr0Oe/
 /n1cmaOFRWDXiGo+FRX6x189glchHEjNSGqmebnOArXX9/sYAE7YIlQVLNu3UJT3DO3C
 T+gElBKeDCpbiS9V656ViAMkkTLrC4aHs9FazwyWsGZm28cGMCWr4+OyXXmqc4kJQwSJ
 k2bQ==
X-Gm-Message-State: APjAAAVQRhan7oILWjMG/BSWMiyj0szZgZW8P531Ze9FMpRHVbJGIFWB
 KjcWn/d8vdKPvbaVr5RtRfmwxOu6+A/WvTjQj14U79OS2Ac=
X-Google-Smtp-Source: APXvYqwHa5U7AqitktyajWo2guR6wlKj2xHHIAABcd8ryrmRf4jMjebG7sje8Rx0YifbbA0TWxMEG6hsQixo0foV+iA=
X-Received: by 2002:ac8:5390:: with SMTP id x16mr4467572qtp.42.1572529546304; 
 Thu, 31 Oct 2019 06:45:46 -0700 (PDT)
MIME-Version: 1.0
From: George Liu <liuxiwei1013@gmail.com>
Date: Thu, 31 Oct 2019 21:45:35 +0800
Message-ID: <CANFuQ7A8xB_xaqMB0fj394Ov9E3RvhOvj7OVVXgqDfA51YDsSg@mail.gmail.com>
Subject: HTTP redirect to HTTPS for web UI
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000001a08205963511cc"
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

--00000000000001a08205963511cc
Content-Type: text/plain; charset="UTF-8"

Hi All:
I'm working on http redirect to https task(
https://github.com/ibm-openbmc/dev/issues/895).
I took a cursory look at the design(
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24173) and did some
testing.

In bmcweb, I find it the current communication logic can only listen to one
communication protocol (http or https). If you listen to both protocols at
the same time, you need to change a lot of code and communication logic.
If we are going to implement this feature in bmcweb, it costs extra effort
and it's likely the implementation is no better than Nginx. so I prefer to
use Nginx.

Please everyone stay here to discuss and leave your comments.

Thanks!

--00000000000001a08205963511cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:simhei,s=
ans-serif">Hi All:<br>	I&#39;m working on http redirect to https task(<a hr=
ef=3D"https://github.com/ibm-openbmc/dev/issues/895">https://github.com/ibm=
-openbmc/dev/issues/895</a>).</div><div class=3D"gmail_default" style=3D"fo=
nt-family:simhei,sans-serif">	I took a cursory look at the design(<a href=
=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24173">https://gerr=
it.openbmc-project.xyz/c/openbmc/docs/+/24173</a>) and did some testing.</d=
iv><div class=3D"gmail_default" style=3D"font-family:simhei,sans-serif"><br=
>	In bmcweb, I find it the current communication logic can only listen to o=
ne communication protocol (http or https). If you listen to both protocols =
at the same time, you need to change a lot of code and communication logic.=
</div><div class=3D"gmail_default" style=3D"font-family:simhei,sans-serif">=
If we are going to implement this feature in bmcweb, it costs extra effort =
and it&#39;s likely the implementation is no better than Nginx. so I prefer=
 to use Nginx.</div><div class=3D"gmail_default" style=3D"font-family:simhe=
i,sans-serif"><br>	Please everyone stay here to discuss and leave your comm=
ents.<br></div><div class=3D"gmail_default" style=3D"font-family:simhei,san=
s-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:simhei=
,sans-serif">Thanks!</div></div>

--00000000000001a08205963511cc--
