Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C7B14D0EA
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 20:04:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487CZb6xG7zDq6N
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 06:04:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=emilyshaffer@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BGrOlDb6; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487CXF04lyzDqTY
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 06:02:03 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id h23so378289qkh.0
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 11:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u4FUZ9fwq9hRKxCzoGIxCD7AY/r15tvOHhKtNRcBUYs=;
 b=BGrOlDb6ZVXV49PyyRjLJ9B5CT2pdSqcvwImClwDrqzY4z2/UtpOoJpNVxG4Bbj6c8
 DoH0l9yNvZbiYUttFarN14hPIUqaybboK8kY2Al2y0wsQsgHomavU4Maq0pkBZh/lvB1
 fqHxfev0I1iKhBCaAjzlNPhWynDSBkUZhBMHEQjP0LRm+FOiQ57T79srS0TRvx9YTgpt
 VsvGIh3bZZa6VGKFVaX056IEUQBqcIVP0x7ZXcwQmSx60iedBdraiBOM6KyqdXyQp3h7
 z2KqF3c2Ttdimbhah3Kb8LK9iChtgZukM9COCUVO8UkTOKjVHgBsqxzEoneyCObUmes0
 AcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u4FUZ9fwq9hRKxCzoGIxCD7AY/r15tvOHhKtNRcBUYs=;
 b=OaGHRc4gxx/W9lVAUrbm7Vl7GnLYDvabGHaJwO649mwdNkqe7340oRz3xYaRD3VmFZ
 83/SGV++iwNZ3yAjG2/Khd360G72EtCuxi7D0uu8a8wIlHcVc2GUUnTqTYS06TvPRwa2
 pkDxS3z3nnpXGwZhRlyPqBFxdiSqO/E2YWX4DSnzaxfHgmMx18YzEPRQlVBLGH5iO9la
 jSczrm7W3k/tIKl43h4nmjASl76uWQfRMSlPkvRl3FKOPIWbgVhpAkfzNJcUeXgMjVUj
 tU47/+OraIgLZ56CCk6OQZWd7ulPDbZ4+c/r3fmwqSPWE9MTH/pXbD6Q7JPO/hefQZiP
 MbkQ==
X-Gm-Message-State: APjAAAWaSeEidByUJt45SO0wqv7ooZjSdTlAor01fBke7DNhUvN2tHL6
 PjmwRbpmUWJOuQdzYuhvfqj5jU3MXDGlvqN+AkHa0w==
X-Google-Smtp-Source: APXvYqzvCCw/5QcHQHJUZdjST1tDhZfy/m/aKPzW2PLIIfFQlDlmPWteJxLUeMl6Lyy2Ut7djy5Besb2bRFuz+0uVFw=
X-Received: by 2002:a37:7cc7:: with SMTP id x190mr1270449qkc.10.1580324518887; 
 Wed, 29 Jan 2020 11:01:58 -0800 (PST)
MIME-Version: 1.0
References: <23247186-abaa-4f7d-88fb-38f871c745e8@www.fastmail.com>
In-Reply-To: <23247186-abaa-4f7d-88fb-38f871c745e8@www.fastmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 29 Jan 2020 11:01:47 -0800
Message-ID: <CAJoAoZkC6qb35i7GUXMdG3ZKvCDkeX6KAQoumFpjRpVZFsahpg@mail.gmail.com>
Subject: Re: Test email - ignore
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000947fc5059d4bf972"
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

--000000000000947fc5059d4bf972
Content-Type: text/plain; charset="UTF-8"

I had pretty high latency between sending and my mail showing up on the
archive earlier this week. I wonder if some queue is overfull somewhere.

On Wed, Jan 29, 2020, 10:31 AM Patrick Williams <patrick@stwcx.xyz> wrote:

> I seem to be having trouble getting mails to the mailing list.  Sorry for
> the noise.
>

--000000000000947fc5059d4bf972
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I had pretty high latency between sending and my mail sho=
wing up on the archive earlier this week. I wonder if some queue is overful=
l somewhere.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Jan 29, 2020, 10:31 AM Patrick Williams &lt;<a href=3D"=
mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><u></u><div><div>I seem to be having trouble gettin=
g mails to the mailing list.=C2=A0 Sorry for the noise.</div></div></blockq=
uote></div>

--000000000000947fc5059d4bf972--
