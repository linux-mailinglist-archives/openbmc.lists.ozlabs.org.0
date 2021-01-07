Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A283D2EC7D6
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 02:50:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DB8Mb6mjLzDqlg
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 12:50:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FZPPXfXW; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DB8LV6fy5zDqkT
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2021 12:49:47 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id p5so5708059oif.7
 for <openbmc@lists.ozlabs.org>; Wed, 06 Jan 2021 17:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LVVK0C/AZwxOxGRMMNnxodiNPe7hsSevTclK5cimTqQ=;
 b=FZPPXfXWmhICfwmX5mC+wN3OLyS0XZE0XWE1PlTfBzes/fz+ZxOke1fiC0KG8lhCPr
 J1hDul8AZDWlsJRw7aMB+v099uq1MGvGJlkh3VMNkNCopTH7ktsYccdSb95tB2mQlINv
 4RI4PBl8uk0t/UujKklPVcNgtuy59sKLXJFZ8JSzLf19ilqE30yaYljTDOlnqZezMuwI
 NM73/sFocv4Xxo4FiYAA0WeF5NoCTzPO1rCKyIIK2WyIz7Xx3L32WYpvsIsCjLAdQQN9
 BsZicfu/bRe7tKsVRIPqcgj1j7J5Gz890TPz4sSjm1Y9VQJBugkQFYnf80tfz0Zebjlr
 QhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LVVK0C/AZwxOxGRMMNnxodiNPe7hsSevTclK5cimTqQ=;
 b=GnzKPkSLsL+Rbyr7cwQytwxogxtaCmz3enj9nexaoLJ309dGJKNDbnNIFeFL9JCXRJ
 4RfUzYntfbsmiY6L2azNYeyVllYZ1VYP0mo3cQby1uKMg8AJh3UTh22bE4XmmEyHckB4
 inwHDKx8W8BLVV6R/QiP27LE4mvhso0UzH5/hjaGOcUemPiVkmLdQMiOK9HPjEfINlU7
 4TRs9bK5NxauORHqAqetakMDs0iYIdOhwAX8NcJEK6UQ52zZLWzH7Rhw2dBWnWQ5E/zB
 ty68itx/N/yw7yO3u4XvWVbwtyDHc+R8EbNOk3ZqH+qILL6IbblY32sVaARrPTX2bx89
 OAGQ==
X-Gm-Message-State: AOAM533MyZx91FvutxshBIWSPhXhZqDq5puqz5IwV2ysx2iQ8Pys1+OJ
 lTgFE8ZwGk03HIqdPgyAiqQklrJE6utAxPH2MNqHaPU98+AC2w==
X-Google-Smtp-Source: ABdhPJyaF/EELsvPdDnAjV82vCo5hDR9cjcSCn+kEXlus/+AFP0HRW8i9O4Wsy2YJCxA3B77QBdjzbavlIiQGdreCss=
X-Received: by 2002:aca:1a09:: with SMTP id a9mr5010844oia.12.1609984183328;
 Wed, 06 Jan 2021 17:49:43 -0800 (PST)
MIME-Version: 1.0
From: Brandon Kim <brandonkim@google.com>
Date: Wed, 6 Jan 2021 17:49:32 -0800
Message-ID: <CALGRKGM0A9DHYuHrKrCLS8U0+YnbMCgVHWEXjbMW7Juhq+r=Zg@mail.gmail.com>
Subject: Upstreaming downstream Google BMC repositories
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000057c3e405b845a765"
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

--00000000000057c3e405b845a765
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

We're exploring ways of upstreaming some of the downstream repositories
from Google to openbmc/* .

Half, if not most of the downstream repositories are C++ daemons that are
specific to Google so we didn't want to create a bunch of new
openbmc/<repo> that no one would use.

An idea that Ed gave me was having something like openbmc/google-misc
repository for all these repositories and if there are any that seem useful
to others, we can break it out into a different, separate repository in
openbmc/* layer.

Please let me know if this seems like a good idea and I'm open to other
suggestions!

Thanks,
Brandon

--00000000000057c3e405b845a765
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>We&#39;re exploring ways o=
f upstreaming some of the downstream repositories from Google to openbmc/* =
.</div><div><br></div><div>Half, if not most of the downstream repositories=
 are C++ daemons that are specific to Google so we didn&#39;t want to creat=
e a bunch of new openbmc/&lt;repo&gt; that no one would use.</div><div><br>=
</div><div>An idea that Ed gave me was having something like openbmc/google=
-misc repository for all these repositories and if there are any that seem =
useful to others, we can break it out into a different, separate repository=
 in openbmc/* layer.</div><div><br>Please let me know if this seems like a =
good idea and I&#39;m open to other suggestions!</div><div><br></div><div>T=
hanks,</div><div>Brandon</div></div>

--00000000000057c3e405b845a765--
