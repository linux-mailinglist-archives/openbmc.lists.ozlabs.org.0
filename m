Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F16D943BB38
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 21:50:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf2V95yBwz2yb5
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 06:50:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aIXPeDIq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d32;
 helo=mail-io1-xd32.google.com; envelope-from=johnwedig@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=aIXPeDIq; dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf2Tr0WPRz2xXV
 for <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 06:49:49 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id f9so725228ioo.11
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 12:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=XvJSCaZLj7xqgB2r7+NfGDppqH5yifH72a0gzqs8KWQ=;
 b=aIXPeDIqE6eIboY4+o0Ng1+CXWL90PR9lUBNjhGR81Ej7RrOxYUNvH2gOssN3E5ejT
 QJTY/1kxwqlwB5S/ez/epT0rOgOqIPSKyeUdb8viOJotOpRFv5D+Ho//HtnMyI4I3W9o
 XaF77dVvtVYIZo/ucnM29TqSzMl2ArGoMLhKCLhasgq7mljONJnM8LNj5/QBCxRkwPb9
 2UAnWDnPSXGkiZvjT8v5Lx4fidgxxFXdxGaJ6gQKZAzjiP/G/XSbMFd8Z7DZAFQLLZsL
 apownnb6iyKiuDUiW5QdFTweoMUr9gGwT+2oWrL/jFQIW2gLGRIc9P1XB28LtVpOoLs5
 NL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=XvJSCaZLj7xqgB2r7+NfGDppqH5yifH72a0gzqs8KWQ=;
 b=oep4DBfc/fP2QQpp5q5WDigUaGa9MAEhLxx5msdzJde0/Vo7YlEMBwSfNvASxv7Efj
 nq+vxre4rGMh/jde+OJJKXwctFVhwDRlhO8ki3lcavUDP/TqzTLwAdB7Dv5uQpeh5ndn
 dUBMEUQvwVfgJv08IhNSI10oqx716uUAoRsNvlHKOK1wzINYXygZCIIq/1PL+LedRVox
 chbHKfl8+zwe2W7E/M4cSSAa+EkEjKuOMYQQHoo06lalD8oPGC3pYFe0ETGyjii6Dvv3
 xXLQp13VhEwdodI7rAS49igdK2uoGX4WXeVzo9pQqk4IEzmFd/2Q7QYEAyNs3nagluiZ
 Eg3g==
X-Gm-Message-State: AOAM533SaF1qBud9eerCrJMoQVClKRY1D+BvkXVwAH5eSA6qqAbKMqNV
 MI5J0U0VHZs2Ct7U+/K7zsU1/8MSSlsTFqgqJhtN5Q==
X-Google-Smtp-Source: ABdhPJyYaVOzhxS7H9bJlo+qudFvfSE7jqTXWm9P1PdeOkq4D79jinazjEdZAGjm821/gIKkrsvwISHQFva+tarvfBk=
X-Received: by 2002:a05:6638:25c5:: with SMTP id
 u5mr9431957jat.149.1635277782456; 
 Tue, 26 Oct 2021 12:49:42 -0700 (PDT)
MIME-Version: 1.0
From: John Wedig <johnwedig@google.com>
Date: Tue, 26 Oct 2021 12:49:26 -0700
Message-ID: <CACejXs+LALZsTbVazgLjOP-K2d89sgTT0jVLpTKiFECfZdcYjQ@mail.gmail.com>
Subject: eStoraged repo
To: bradleyb@fuzziesquirrel.com, patrick@stwcx.xyz
Content-Type: multipart/alternative; boundary="00000000000055a5f505cf46c706"
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
Cc: John Broadbent <jebr@google.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000055a5f505cf46c706
Content-Type: text/plain; charset="UTF-8"

Hi Brad and Patrick,

Now that the eStoraged
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46573> design doc is
reviewed and merged, can you create a new repo for this? Or what's the
next step?

By the way, thank you to everyone who helped review the doc.

Thank you,
John

--00000000000055a5f505cf46c706
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Brad and Patrick,<div><br></div><div>Now that the=C2=A0=
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46573" targe=
t=3D"_blank">eStoraged</a>=C2=A0design doc is reviewed and merged, can you =
create a new repo for this? Or what&#39;s the next=C2=A0step?</div><div><br=
></div><div>By=C2=A0the way, thank you to everyone who helped review the=C2=
=A0doc.</div><div><br></div><div>Thank you,</div><div>John</div></div>

--00000000000055a5f505cf46c706--
