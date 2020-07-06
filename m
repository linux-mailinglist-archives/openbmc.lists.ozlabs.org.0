Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C793B216134
	for <lists+openbmc@lfdr.de>; Tue,  7 Jul 2020 00:01:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0zzn1yXLzDqfc
	for <lists+openbmc@lfdr.de>; Tue,  7 Jul 2020 08:01:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BVTMfN5T; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0zyx2k0TzDqc2
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jul 2020 08:00:40 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id r22so36346653qke.13
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2020 15:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=oPQnZv9ixC8t6ZOm7Ces8MOpvEgx45nP99uetIcrr1E=;
 b=BVTMfN5Tn7DK3DHGN3hifFSARYw28PY+kw5u7ovYpaF95f26qEAX0jSZX5X4x/g0WJ
 juOgU9XLc4ZQmi2C6bvkbC8QNT9y5oXCtoGGWvt+XfQLxfUrGcJ/Ei0olwCQ3UnnLe5a
 qSlepxSguM9XDp/iKSmUcJuJO01X81DiA4aeMP0DKHJrToySq8rvLZayQ+iA5+CH6LOw
 lNeUWKLAOrZF6r0BPW755rW4Fxbta61YDiBAG7ruiMviOV2eXXIL+j4HaNaqQ9K8Pdwr
 sVdTKAMbO1N2oWX0P9tV9VBNcMw6cFzqTJ5M1KpA9QZEAZSJ+CdzQF0btIaIi6gw2BYy
 J/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=oPQnZv9ixC8t6ZOm7Ces8MOpvEgx45nP99uetIcrr1E=;
 b=Jvo8J6ylty2TXFu9rtEFYegeINS+FfXOsqAJDNGxVKv3LaRQ+ekJ/6QqmDdFMnWW2Z
 luzql1zt60wuWV73KCKlj+8D8H8ivSOSjV+V+gRhzjm50C+nOfygFg7E/V0/00AUIQSK
 0uct3byYpqLAkKkYczZiIhIZ/jBE8xRPI36Br3swFwpM8eH7fZ/+IJmb25FwbQcARVf6
 DJLEbdGgbAQoSyMv7cfX+Iwax0xXsTADNKQCN2yo2VYk2IQNi+wFW9U79OIkAL4ZkFAF
 AxQoMbyTlKBT9uBRLfBB8ViWP6iunFKYIsB89wWRo+mvRYDNmfBbLxRk6tXTRTPK7i/j
 /pIA==
X-Gm-Message-State: AOAM531X2zy7FYb0lmTQRfcLmiFyuyyxGP53GZ6/UaFOh9zA4PBJV/FR
 Fxzkgm2RTnhGYhTVjqAMSqZz4UEYLEg=
X-Google-Smtp-Source: ABdhPJx3qxR68kV9mzklPiV/xZqUH08njiRrXLT1MR7vs12Cf4JuvNViJGFmXVMRZkruk06YBbMlfw==
X-Received: by 2002:a05:620a:1301:: with SMTP id
 o1mr50864166qkj.223.1594072837695; 
 Mon, 06 Jul 2020 15:00:37 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:3d62:4f68:17be:d26d])
 by smtp.gmail.com with ESMTPSA id b7sm18358702qkl.18.2020.07.06.15.00.36
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jul 2020 15:00:37 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: OpenBMC Debug Wiki
Message-Id: <D2975C77-7BD6-4643-BEBA-28564EC91841@gmail.com>
Date: Mon, 6 Jul 2020 17:00:36 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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

I=E2=80=99ve had it on my TODO list for a while to generate a document =
of some sort
to assist people with debugging OpenBMC systems.

I created the following:
https://github.com/openbmc/openbmc/wiki/Debugging-OpenBMC

Any updates or reviews appreciated (feel free to update directly if you =
like).

Andrew=
