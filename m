Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B82390BE4
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 00:03:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqSkg5rfLz2ywx
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 08:03:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=S+Ns+lOH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22d;
 helo=mail-lj1-x22d.google.com; envelope-from=jebr@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=S+Ns+lOH; dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqSkM0NGPz2xvQ
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 08:02:49 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id e11so40125211ljn.13
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 15:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=h5AqLyEfVPuQ7GC2SKSYcQN9pvxWWKzNxcfchCDfTcU=;
 b=S+Ns+lOHYyoddWMpz94E5UrPR4kd1MoUfPOGd0eWDxRQ08TGHn5AlVdDe4lTt0vToR
 j1OcMFsy84jkaDv7JbpmBMcD0Mmnl7p0udzc9JxpwAzadEsAEJitDK4PCPDTGTfC3ZdQ
 zyWx28qTQ0BcRP5svazcBWEh1+XgfZh8Rw8RpzdIiz6ab/ro2hvh7gb2srEcZ0aAH0ca
 flBs0iNvasbysfehbieeiLfy4PiZX1lebswGBNStQDNs5zaS0JLASG+S5hXUycSOf/Kp
 N8uUoU+JyQR9NEZl09V9xHNkaRfSqNLkJl1KniWPvI50zHdoqpVZ5S5/5ZDZBHYoAYJD
 BAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=h5AqLyEfVPuQ7GC2SKSYcQN9pvxWWKzNxcfchCDfTcU=;
 b=msfvbQ7Hctx/mq7FOXZhpOZmSoKM0YvovGpik1ELJEJkACSJMlyOOXDRiTTpI4XKFn
 cZRihw8F1Egl/hS8IxjEIMEOLR1PKV+kvWVYcHtiTSFAEYrp2pXLDEgkF4XUb4X02N9v
 uRZMZsiHMqZOdp0nqh3a3tjvULDUAjc6LdVs8eS2h8t3g2PWR7pN4TNx/MalruTrjRU9
 pw66ov/JStgNpLaETmTigLk4Kqzhv/Xw2iMSbykQXjwK/swzYpOvOwbjLvWQ/ViIPwl4
 FbUkfrJOjdYVFFjOdnThCJ5w0RzOgxLswH/vt/FXjRuJcKBBRGtQ9iEoJYFRCoKimV8y
 xlWw==
X-Gm-Message-State: AOAM530oTehjfeT1ARvTqRgrGzxSP/MYroAAZJ7RyhsaJz29NvzKW5B/
 NYgNqtMKIErxZB41YonUe9euCT+4xn9lKj+xsFwwBMxlH06cvg==
X-Google-Smtp-Source: ABdhPJzSLtFDKqzE8bgJo/15VP4bITzBIq+fCegRiiyHqe76McZNxZlAT7FrsoMZI2/tPz9Vaqc3YYjq8Pg4Karrl8k=
X-Received: by 2002:a2e:9102:: with SMTP id m2mr22574575ljg.29.1621980164599; 
 Tue, 25 May 2021 15:02:44 -0700 (PDT)
MIME-Version: 1.0
From: John Broadbent <jebr@google.com>
Date: Tue, 25 May 2021 17:02:33 -0500
Message-ID: <CAPw1Ef8KUEAQGxJ39uP-D5yWVCtwRBH4P9FPDzjXrMGkBzsWxA@mail.gmail.com>
Subject: bmcweb change will effect all redfish nodes
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000008b8d2505c32eafa9"
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

--0000000000008b8d2505c32eafa9
Content-Type: text/plain; charset="UTF-8"

There is a large change in bmcweb that we plan to submit soon.
It will resolve the issue 181 <https://github.com/openbmc/bmcweb/issues/181> by
removing the node class. Before Ed,Gunnar, and I push this change, we want
to make sure there are no outstanding concerns.

https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/42083

Let us know if there are any concerns or questions.

Thank you
John Broadbent

--0000000000008b8d2505c32eafa9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is a large change in bmcweb that we plan to submit s=
oon.<br><div>It will resolve the <a href=3D"https://github.com/openbmc/bmcw=
eb/issues/181">issue 181</a>=C2=A0by removing the node class. Before Ed,Gun=
nar, and I push this change, we want to make sure there are no outstanding=
=C2=A0concerns.</div><div><br></div><div><a href=3D"https://gerrit.openbmc-=
project.xyz/c/openbmc/bmcweb/+/42083">https://gerrit.openbmc-project.xyz/c/=
openbmc/bmcweb/+/42083</a><br></div><div><br></div><div>Let us know if ther=
e are any concerns or questions.=C2=A0</div><div><br></div><div>Thank you</=
div><div>John Broadbent</div></div>

--0000000000008b8d2505c32eafa9--
