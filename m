Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB5B3485D8
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 01:28:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5Qty01Ywz3bcq
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 11:28:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=b2jUpoCB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=b2jUpoCB; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5Qtk1jtdz30BX
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 11:28:13 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id d12so339958oiw.12
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 17:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=8pTl7fgAuNugxIIc6yggX/V2ut90p2oe8L6Brp/jYgs=;
 b=b2jUpoCBEmydvn4zxnBzu3TELKEd/wZymyu4twqPRjlze3ipjI8V286YfKhCNSVl7Y
 Q3b76yFgL5F7ZTPtDCAiy4hdunU3XBYvn6kxrZwDum6VZ+epQ5FZQgiRu5KcTiDjRSgA
 ecsSxxjUK0n1wStDxv0XnorYOywnQouXNazl+LFQC2RSrp+FZbdhYhUr3rvrLQ5aZe3W
 x0dIwhNC2mEk4gCvAJwZS94sKLvV9bDkK6eZv8WcNt6Ch7fM7DIYnl3SjiFGD3UzMAtk
 apfTEpLReZecEdxHoxc2ZgwYUhn6mse0NTxXGtBmsn1gWuDUPDVloO9XT/sn45GRHQkq
 Et7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=8pTl7fgAuNugxIIc6yggX/V2ut90p2oe8L6Brp/jYgs=;
 b=NKx8vnGTWIdD2ENqw++LOo+pCVXqRmYZp/zjONsd24Ekdu0YKYYBH8WLNxyC5KRFTJ
 lzgkGmOfGpSnI1VneZTFaMP2x/eJ7LnS1yMygk6Et1xYu0uaeHbroSaebVA+kiQtkeJW
 wccP5hvezRU/GwpMS/RdGTB8jGpB2ss1lsjt6u2Ch0G7HdmU2OqCmNyeYQ+RhplxWx6w
 i5uGD7k2Q9qUlPQ2UaahiZIxhY6+pMVdxXC2c0c7RV3x6UTqsheUp/6/ESFXO7lSWCke
 oWfLekz2HDEKVbqDry5OMoVflbME95vEiBzUn5M/QPEcxW9C9KUzAJHzDCY5Sp/xF1kz
 0/Fw==
X-Gm-Message-State: AOAM5337G3EQRguPevN2r0r+fpfoobPjoyFJ2rTbxpVtJqKzlc/FM3+/
 oC2GKqhpO175o797Sk5qGRqfw1L/rX10oQ==
X-Google-Smtp-Source: ABdhPJwhz/miUiHHPfWYAZSzDMk/G+fpQVDK36oP4JMZugsjLwXMxOTIwbVh2Q1fNfBQummimWQesw==
X-Received: by 2002:a05:6808:bd6:: with SMTP id
 o22mr4168128oik.129.1616632089271; 
 Wed, 24 Mar 2021 17:28:09 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:71ba:472a:3360:7d4d])
 by smtp.gmail.com with ESMTPSA id j10sm935242oos.27.2021.03.24.17.28.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 17:28:08 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Thoughts on performance profiling and tools for OpenBMC
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CAJOps0ubONA_FCO+n9Gu_OfBBYuY9RhQw-AaELfyLRJjA+e8PQ@mail.gmail.com>
Date: Wed, 24 Mar 2021 19:28:07 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <3A131195-2BD0-4336-9B76-738DA4F513CC@gmail.com>
References: <CAJOps0ubONA_FCO+n9Gu_OfBBYuY9RhQw-AaELfyLRJjA+e8PQ@mail.gmail.com>
To: Sui Chen <suichen@google.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Mar 22, 2021, at 5:05 PM, Sui Chen <suichen@google.com> wrote:
>=20
<snip>
>=20
> [ Proposed Design ]
>=20
> 1. Continue the previous effort [7] on a sensor-reading performance
> benchmark for the BMC. This will naturally lead to investigation into
> the lower levels such as I2C and async processing.
>=20
> 2. Try the community=E2=80=99s ideas on performance optimization in =
benchmarks
> and measure performance difference. If an optimization generates
> performance gain, attempt to land it in OpenBMC code.
>=20
> 3. Distill ideas and observations into performance tools. For example,
> enhance or expand the existing DBus visualizer tool [8].
>=20
> 4. Repeat the process in other areas of BMC performance, such as web
> request processing.

I had to workaround a lot of performance issues in our first AST2500=20
based systems. A lot of the issues were early in the boot of the BMC
when systemd was starting up all of the different services in parallel
and things like mapper were introspecting all new D-Bus objects=20
showing up on the bus.

Moving from python to c++ applications helped a lot. Changing=20
application nice levels was not helpful (too many d-bus commands
between apps so if one had a higher priority like mapper it would
timeout waiting for lower priority apps).

AndrewJ and I tried to track some of the issues and tools out on
this wiki:
https://github.com/openbmc/openbmc/wiki/Performance-Profiling-in-OpenBMC

We=E2=80=99ve gotten a bit of a reprieve with our move to the AST2600 =
but
it=E2=80=99s only a matter of time :)

I=E2=80=99m always a fan on trying to improve existing tools vs. rolling =
our
own but recognize that=E2=80=99s not always an option.

I=E2=80=99m all for anything and everything we can do in this area! =
Thanks
for taking the initiative Sui. =20

Andrew=
