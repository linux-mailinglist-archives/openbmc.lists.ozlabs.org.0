Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB1228E6AA
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 20:49:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBLzc23pxzDqtt
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 05:49:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12e;
 helo=mail-il1-x12e.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=E8KC7//z; dkim-atps=neutral
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBLym3XzhzDqqD
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 05:48:12 +1100 (AEDT)
Received: by mail-il1-x12e.google.com with SMTP id t18so416816ilo.12
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 11:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ps85Um3i3Fh+yqtZILoznKHDJ+fe/n9PyKAqHmeyBo0=;
 b=E8KC7//zTnEdFLTJzcnnQOZrXTaNJHh9UDuQu+Up7cwZPO9bDaORYj4sUBM/Ntw84z
 OQhKZ/9vLcY/gEDEU7vjf0WCrJrTdYmvVawC0lOt4n8+yJDvGeFvmmSbftGj+K14OQ4S
 WXfy5hlAlYVRT7x5OXGYTW0/xv7zvUiP6CquACWH/ncqApRvwFHKYeRNP2LmjEN/Y/Hz
 A1H3yVFCB6GYVqzar+N7yZ0pgIqSUcjUeg6ucCKnJS31VXa0qpjmEllAlGk+IrsijS9e
 8tzmEPOrB6D8yTpifvexXRQpl3skqNlPo+DVSLl3saxZ5JyUxkfEmRgiDY6Y5YnvJsuR
 /69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ps85Um3i3Fh+yqtZILoznKHDJ+fe/n9PyKAqHmeyBo0=;
 b=XPxUutXhmvLmG5khy2MhqjRNlYSvaWRu7n8cwy7bk6effK4+kdVvSpdG5H8FcFlQNH
 6dbm+zNRuT9hx8nvD24+j7hD7ByxL9/UnQc3La4jmtffAeG4DX1fEWM0U+U9l3pS4kug
 jU5fEx7saDFgSBqscANnZ0nChG2NZvKdqJR9DdAJ6ZzV7LotunSc7F2JOUeYMPvjgU/b
 EKRLoqYliJOqtiAYrJiXn1HRvw3AmtDsLGjZlT6vUHItJXhvndMsy7xsiZ4NbxBJfpVo
 tNIbTcdS384x5LyjDPiEhlD/ZYnXMVDxMoH015DN0e3m5McS2Q/RZSigyuw/3vYoVSme
 6Rtw==
X-Gm-Message-State: AOAM531gdYUX15f+c5j8u4cwSrg7Hr5A8QhcLBLzIzMMePcpgbKee4r0
 NbKuBHhlmz5SPhAzTBUqmARwUXj8DjiDRVJHHR5ozxJNwz0Ggw==
X-Google-Smtp-Source: ABdhPJyYWqUTNd7cD5KZ3gaDGxYL/PAyfcNmtVzck7/p2fpFSZO6R+FbRDLSSvxJYiGVYcAlLX5vzO6jX3vAVNYdh/k=
X-Received: by 2002:a05:6e02:6c6:: with SMTP id p6mr444964ils.91.1602701288482; 
 Wed, 14 Oct 2020 11:48:08 -0700 (PDT)
MIME-Version: 1.0
From: Anton Kachalov <rnouse@google.com>
Date: Wed, 14 Oct 2020 20:47:57 +0200
Message-ID: <CADVsX8_eYXAtGMgoe9LEKRtaf0ufdn0BJA+Fn8J9xpAKnTDStQ@mail.gmail.com>
Subject: /etc/migration.d
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000fb929105b1a5f8a8"
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

--000000000000fb929105b1a5f8a8
Content-Type: text/plain; charset="UTF-8"

With moving from root-only environment to unprivileged users' space, we
need to ensure a smooth transition. To achieve that we need a mechanism for
one-shot per-package scripts that would take care of migration. That's not
only about groups & owners, but a general approach. It's similar to
firstboot, but has a different purpose.

I'm going to prototype a robust / naive solution to start a service before
everything else in the system with a condition (non-empty /etc/migration.d)
and iterate through all files. Each script has to run at list with "set -e"
to bail out on failures. If the script succeeded -- it will be removed.

The tricky part is: what if the script fails? Keep it, ignore the failure
and proceed with others and then boot the system? Or proceed other scripts
as well and then enter some "failure state"?

--000000000000fb929105b1a5f8a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">With moving from root-only environment to unprivileged use=
rs&#39; space, we need to ensure a smooth=C2=A0transition. To achieve that =
we need a mechanism for one-shot per-package scripts that would take care o=
f migration. That&#39;s not only about groups &amp; owners, but a general a=
pproach. It&#39;s similar to firstboot, but has a different purpose.<div><b=
r></div><div>I&#39;m going to prototype a robust / naive solution to start =
a service before everything else in the system with a condition (non-empty =
/etc/migration.d) and iterate through all files. Each script has to run at =
list with &quot;set -e&quot; to bail out on failures. If the script succeed=
ed -- it will be removed.</div><div><br></div><div>The tricky part is: what=
 if the script fails? Keep it, ignore the failure and proceed with others a=
nd then boot the system? Or proceed other scripts as well and then enter so=
me &quot;failure state&quot;?</div></div>

--000000000000fb929105b1a5f8a8--
