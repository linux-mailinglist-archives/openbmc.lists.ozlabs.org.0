Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAFC3A0874
	for <lists+openbmc@lfdr.de>; Wed,  9 Jun 2021 02:37:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G07Vn6xYQz3091
	for <lists+openbmc@lfdr.de>; Wed,  9 Jun 2021 10:37:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WqS7kMZ+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=dixsiew@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WqS7kMZ+; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G07VY4wSPz2yWx
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jun 2021 10:37:40 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id v22so33693856lfa.3
 for <openbmc@lists.ozlabs.org>; Tue, 08 Jun 2021 17:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4LKgYk7vI3dVrhVPdaJOm041LypQfocg4Y0PPccq/aM=;
 b=WqS7kMZ+6ke9mgwBcyV1++D8hwr6eWXFWoyKJ0YY8WdaV7EAFffgrNAeWmI8nKtv+w
 qobjAXlxxGgGKhQQnwBCmOOx1gycvOlu9oA38kOXQYgoUyrljpyCFgbDUcVEAeOpp3Je
 Lb+rKZw5jWay+kyQsAUjFKTSr94rnwzxBP+dtJXfRVtZkCfsu1e16mYQcuJ1zW8UPl7g
 yoLue8QkADMTrTZEop2YeNMJkVdBXatgsUS7wPDCoFul1b7yHXQH1c7N0C3TMF1yjyd7
 WN9GZUe3s3JBPF64QDCNhyJSkzobCy8VDFh2PCdbekj18AmsHJDAm9EAn+M02/gqeXPh
 kTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4LKgYk7vI3dVrhVPdaJOm041LypQfocg4Y0PPccq/aM=;
 b=UzznQks5W8I5QmY05LyaWRYDvKwavkc+g3E1FP//F2NaNctxANFW+MXeZfknhbjV1q
 NvF1b/9WmvY+z1rWrJ4B0gHNTNn/s7ITJcl3AxYiXv9El06SWivCCH4dy9yX7wmWbWzm
 I7R5f5MpDy+2zaWbKcQijtaLHaOFmYNmAqtEbfWdcOijJspYPsJRG4ZSCB2p9rsCm+6u
 5AMyvT1g8E/I8ruKWS1oGjyRyWNLxNW3K6KJwh7CZqYA+ftkNkSu2QbFVJwNh3S7OJti
 PvyAjY40JYqPIXciwsjZi+YIqDjFU+PFdHyLAotD07oK26IWPimpsPBZfhQqqk5fptxR
 gbPw==
X-Gm-Message-State: AOAM532Ksh78TXOD8dKIROIDO5ucnlkHD7WOMRgqKVIMCmHCTiGHwAyU
 NxLE+M0f0S6Se3fqUSbMQYdkCo2k5fA8ja2OWzspfRqjk3N+zw==
X-Google-Smtp-Source: ABdhPJwpJlzPz3tCJ5/mtkd4xntyl6tqrZmbBhdLqMvTvfX/TIUmJiEA037eCujJBcIrM9wR+ADvKIDs5Ya3Tr26jYs=
X-Received: by 2002:ac2:515d:: with SMTP id q29mr17405417lfd.535.1623199052677; 
 Tue, 08 Jun 2021 17:37:32 -0700 (PDT)
MIME-Version: 1.0
From: Dixsie At Work <dixsiew@gmail.com>
Date: Tue, 8 Jun 2021 19:37:21 -0500
Message-ID: <CAE+bT3EQ+MNxrVVeqxujWsP7W7QDckBm0u5L1ej2Z4Gr3hg_=A@mail.gmail.com>
Subject: UI Design Work Group - Wednesday, June 9 at 10:00 AM CST
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000ef45ec05c44a7a9c"
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

--000000000000ef45ec05c44a7a9c
Content-Type: text/plain; charset="UTF-8"

Hello,

At tomorrow's work group, we are planning to review:

- Network settings redesign progress
- Login screen design update proposal
- KVM connection bug
- Gerrit working agreement discussion

If your organization is interested in these topics, please join us!
Feel free to add a topic you would like to discuss in the work group wiki
agenda.

Meeting information and agenda can be found here:
- https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group


Thank you,

Dixsie Wolmers
Front End Developer

--000000000000ef45ec05c44a7a9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,
<div><br>
At tomorrow&#39;s work group, we are planning to review:</div>

<div>=C2=A0</div>

<div>- Network settings redesign progress</div>

<div>- Login screen design update proposal</div>

<div>- KVM connection bug</div>

<div>- Gerrit working agreement discussion</div>

<div><br>
If your organization is interested in these topics, please join us!</div>

<div>Feel free to add a topic you would like to discuss in the work group w=
iki agenda.</div>

<div><br>
Meeting information and agenda can be found here:<br>
- <a href=3D"https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group"=
 rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/openbmc/wiki=
/GUI-Design-work-group</a><br>
<br>
<br>
Thank you,<br>
<br>
Dixsie Wolmers<br>
Front End Developer<br></div></div>

--000000000000ef45ec05c44a7a9c--
