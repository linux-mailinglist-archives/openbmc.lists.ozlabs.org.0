Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 768262279FD
	for <lists+openbmc@lfdr.de>; Tue, 21 Jul 2020 09:58:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9rZ66l25zDqfv
	for <lists+openbmc@lfdr.de>; Tue, 21 Jul 2020 17:58:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a;
 helo=mail-yb1-xb2a.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=wT4sSw07; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9rYM12Q2zDqFZ
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jul 2020 17:57:40 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id l19so9645875ybl.1
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jul 2020 00:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uccRADRg+fK6iy3mXZfEtqe7SitftGThPP9ivoNxT0g=;
 b=wT4sSw07CJra6YphDviLuzWXf65mDLMAQuq7uBIDf0+k6BRgjnSBh4ZTWKJeh0G23v
 2hDPObGfaY7k97VjekEjHPRI1kLK/PZqHnmGGX+IVtp6Dpmkuh9fezInhOZSFxoez2fZ
 ZTtOJoWWD5085DUwj6NiXk6OZQDvAu49EmQv4p7auC9Ok5dLbzssjVc1KyBV+qrHLzfW
 FMAJ5wEW8tTaGsOHkVt8JM4Tj5HCShPdtBvrXdj9FbJtzWeN+omoasfBPBv+Jht/yEZL
 rW2X5GFeFLy+fttStAbyPa8yCPlWPD8KYu4R3ZiFtYZ8AUQUOv2U4rXcPpOSdkRLD6YN
 Tz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uccRADRg+fK6iy3mXZfEtqe7SitftGThPP9ivoNxT0g=;
 b=pHfTTZDzhfkrjbuS10mcs/5elixBun2XxKfC5tmPcu4bSrbhtnr3qh35bK7hz/2CQE
 J1wOsq8vp1DTGdIxm9+9+sXKhJyLKRAG5IuKyT65PgE7ZTwO31g24WD2wl0UiDb6lL4b
 6KiJs2fp1DKselpfwHj/12tsNkqrom70dqa62qRDnhGZird37CmNt78S9Cvt8r8ORdso
 9KT4zFnn/bLWWrATrlSAQGWtHkaVqtlRWL5J0Wa50AR+s9hT7LImdxN6ouc1uS6z/UyE
 D1k5w0qgMz1O0sHrBK94NVAjvwagmW/dCfzBapg07zfSCpBWYzyh9I6NdMj7asi5U2rI
 8ghA==
X-Gm-Message-State: AOAM532la9KA58SQbxhsGnRo22Ic/qfEPmbp48eQTQTQqK4+R5UgWxVj
 pb0XE8WIW0hC/wnWb3F8zlBs8+896oduazQzx7W9Xp2zYTXejw==
X-Google-Smtp-Source: ABdhPJzk3ioIeYq8k31ubESU4zitTXFyA3DWJr/cO/hlmSurGW5VhpRJwLyWhYrPnqIIp7wJKsz1Uo+XHoIU/4EOVYw=
X-Received: by 2002:a5b:d52:: with SMTP id f18mr37504586ybr.423.1595318256503; 
 Tue, 21 Jul 2020 00:57:36 -0700 (PDT)
MIME-Version: 1.0
From: Nancy Yuen <yuenn@google.com>
Date: Tue, 21 Jul 2020 00:57:00 -0700
Message-ID: <CADfYTpGaahSo5oJ5n-Y2TZ=NoF0uh=BcPHkxuDqY4zuek7qrjQ@mail.gmail.com>
Subject: What do you want in a package manager?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000fc0af605aaeef947"
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

--000000000000fc0af605aaeef947
Content-Type: text/plain; charset="UTF-8"

I'm looking into package management for BMCs in our fleet.  I'm wondering
who else is interested in this, does it make sense for OpenBMC.  What kind
of features are important?  What kind of package format (rpm, deb,
something else)?

We have a distributed system dictating versions of software (BIOS, OS,
userspace packages, other firmware) which should be on a particular machine
(based a machine's characteristics like type, owner, etc). So our use case
has the BMC take a list of packages to be installed, natively installing
the packages on the BMC. Packages must be signed and verified
during installation.  There is also the concept of deviation checking.  If
the files for a package or some parts of the file system deviates from
what's expected, it triggers some kind of repair flow.

----------
Nancy

--000000000000fc0af605aaeef947
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m looking into package=C2=A0management for BMCs in o=
ur fleet.=C2=A0 I&#39;m wondering who else is interested in this,=C2=A0does=
=C2=A0it make sense for OpenBMC.=C2=A0 What kind of features are important?=
=C2=A0 What kind of package format (rpm, deb, something else)?<div><br></di=
v><div>We have a distributed system dictating versions of software (BIOS, O=
S, userspace packages, other firmware) which should be on a particular mach=
ine (based a machine&#39;s characteristics like type,=C2=A0owner, etc). So =
our use case has the BMC take a list of packages to be installed, natively =
installing the packages on the BMC. Packages must be signed and verified du=
ring=C2=A0installation.=C2=A0 There is also the concept of deviation checki=
ng.=C2=A0 If the files for a package or some parts of the file system devia=
tes from what&#39;s expected, it triggers some kind of repair flow.</div><d=
iv><br clear=3D"all"><div><div dir=3D"ltr" data-smartmail=3D"gmail_signatur=
e">----------<br>Nancy</div></div></div></div>

--000000000000fc0af605aaeef947--
