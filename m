Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 649FD1BB1D1
	for <lists+openbmc@lfdr.de>; Tue, 28 Apr 2020 01:04:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B0jN5cFmzDqkC
	for <lists+openbmc@lfdr.de>; Tue, 28 Apr 2020 09:04:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=UBDWdc4s; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B0hZ4QJDzDqMC
 for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2020 09:04:13 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id g14so29313911otg.10
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 16:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=aG7M0ISHVAwVgwt95VY/j0TBWSofIhZswkeq7AOw3fw=;
 b=UBDWdc4scCO8Nkz+XpjRKMdWLVpl0Lfw0uCxq4kFaw0UWx76VO7sEGVKOmtFaZFdnk
 c8XD2jdPpa8rvyAAaH2KngKMIkqTF4CwBTyLnpKROH6zca5F31T4GOD2aU4/WM40P9T/
 sSAo+0wrcMRqScCvG5+nZnN2G8Pe7h8DU6HdnGJYbr6OFKMNc6mHwP1rvI4yFyqzXCeu
 pjmVcGt9wMmUUYhjJsBiI/seEFGmTmsuwXcur+9riyTzQBrbRaFG4gGyhHF30pSc/Xxe
 QmCWd1HNrGf3eQ8ifTvHJJQSdb1OyJ2CqnCYhDlvwq6BkeXPiPu5wj2K1NLaNEh4eAYv
 iatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aG7M0ISHVAwVgwt95VY/j0TBWSofIhZswkeq7AOw3fw=;
 b=QHnnF7omWCprjt7bcacSXnfFQuNmtA2FIQcbOiCWYY6lzzQDCDE8wsn9JWvSsYmeZv
 Rg7YtHDkwUSMGcEUHLjgSDnEP1iZDiDO14Yn1q1RKi5h8y21UrhnvvLD9pKgefmXsPWf
 XT12Ozvh1YmcL7tLcCOaxyIkbSIgG2Ez62gYhPTAMGZGXC89TV6ggXc8rxkRacG8z93/
 tCwRcpJ6T38gO7mh7f4FwM+8qtmCvrloSya2w3JfiQyGy9Z8WtssyXC8DTSSd0ZlcUGE
 01GOC1mdiRLUvXereyHvbKKPjAiaJOQzwG9HoTdLEua4ERcANJeWVIH4XkWLEOZis10i
 yiWg==
X-Gm-Message-State: AGi0PuZKCTf4GJteIbH85JPwzpxXHu7KSPI2kPZZEL+VzXGDsCgjSCgQ
 mcE3OaG07ONARvQ8r5U/AFrzUW0NLbgwcLVbDH/30OcTask=
X-Google-Smtp-Source: APiQypJpdINLLd7FLFE/eWNwTkLb5DTrTQouGoBhSIr2tmQbP9auAGy85I7GcuGCjgD+M6nObY9iHgRXXSFey1qtMyo=
X-Received: by 2002:aca:72ca:: with SMTP id p193mr889753oic.66.1588028650193; 
 Mon, 27 Apr 2020 16:04:10 -0700 (PDT)
MIME-Version: 1.0
From: Zhenfei Tai <ztai@google.com>
Date: Mon, 27 Apr 2020 16:03:59 -0700
Message-ID: <CAMXw96O6LpiR5CsmY4e_m2K-HNm_uHdRvRavf5iBSs1RqHYE6g@mail.gmail.com>
Subject: Error with QEMU
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000096f88805a44dbb24"
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

--00000000000096f88805a44dbb24
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm trying to test a bmc image using QEMU but got this error at startup
before it's supposed to boot.

qemu-system-arm: Aspeed iBT has no chardev backend

Has someone seen similar errors before? I found some bug reports in github
but no resolution was found.

Thanks,
Zhenfei

--00000000000096f88805a44dbb24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m trying to test a bmc image =
using QEMU but got this error at startup before=C2=A0it&#39;s supposed to b=
oot.</div><div><br></div><div><font color=3D"#b45f06">qemu-system-arm: Aspe=
ed iBT has no chardev backend</font><br></div><div><font color=3D"#b45f06">=
<br></font></div><div><font color=3D"#000000">Has someone seen similar erro=
rs before? I found some bug reports=C2=A0in github but no resolution was=C2=
=A0found.</font></div><div><font color=3D"#000000"><br></font></div><div><f=
ont color=3D"#000000">Thanks,</font></div><div><font color=3D"#000000">Zhen=
fei</font></div></div>

--00000000000096f88805a44dbb24--
