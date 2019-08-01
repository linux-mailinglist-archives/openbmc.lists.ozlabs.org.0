Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB87E465
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 22:43:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4602LL6JNnzDqrM
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 06:43:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WVLQNgMT"; 
 dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4602Kf5JCBzDqkG
 for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2019 06:42:29 +1000 (AEST)
Received: by mail-io1-xd2e.google.com with SMTP id f4so147405334ioh.6
 for <openbmc@lists.ozlabs.org>; Thu, 01 Aug 2019 13:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JdJS2tUbBSbOCQ901LLYOuv/ZlK0wi4UeMRtZN24vjA=;
 b=WVLQNgMT+hgxzDjPKI/f20tPjfmBBuj4acYCL0n2+KzDSEXMpy5WC0Js0IFVqcyNET
 nfpCWUS/tjaFD/GQumXICSmlKnCpeYRNFzUczggeRPQjDewOVZhJKiR6MGLer8DMY/iw
 qIOcL9WCLTvVKSvNHC0sUtR+cwZ+eCVmQ2OPOJkW2aZwwyCj8UghTeJ2KyTyNdHh0G7e
 wiTcYiODj3KrIU0g2Orl0WK8BWbgOJokMSHbVNs2kiW5bETHbM3MgSZJfuJ/1qQ6QirR
 lhSSygtgXCkMGp5wGTGVwbg05hcIfGQBYQtqNS6NqsM+gLXxvTWJF4Cfn32MpeGmRp0a
 tP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JdJS2tUbBSbOCQ901LLYOuv/ZlK0wi4UeMRtZN24vjA=;
 b=rUOBoYCxd6X5ViMAGiWgbuuRC3SpPSxX7v4YUB5ZTdnLh+QAfh/Vlq+CJlOpfBxYJZ
 Mk7VTs0Br+ONSyDkfByu4XyUATcMIvCoANPbMyN7aA3vxQ16vMFbz2i+WONJGFnj786P
 LZCiB0fg/IIs4OQSHRO9kJEjzUWkzIz/w1moCuygkk7CoVzMrJ4LnrtaYFymWsLZn8DC
 pam9JEYcFDquerc5zrSOyEfR5xYH1fnowP2jVaaDR24Sl3pVqP02NbVsf9l6Un/5KWkq
 8IDYRbxVN3obzNDsLUsWBAw1EPfAhS+ynLMfWQq3EJpWgcApcvuY6lkJbrk2b42uxCxh
 Q27g==
X-Gm-Message-State: APjAAAUEJX1rbrwD/iupVj70Yv1Be5/uS6OUj6L2l9vaQ7x4MOwwnC9g
 O0yvobT0jFi6p0n3VCnAHc+l+UtvfuBp+BjH/9vGyUgCuLg=
X-Google-Smtp-Source: APXvYqxXz9qcVr9fAnSG8o1XME0vTJa9SwTUPAK/rJvKDgk9cYwCtRzf5vo8If0p9tWz+HYOsim3ZR+IwQKhUYXBaTI=
X-Received: by 2002:a02:b78a:: with SMTP id f10mr138996292jam.5.1564692142623; 
 Thu, 01 Aug 2019 13:42:22 -0700 (PDT)
MIME-Version: 1.0
From: Nancy Yuen <yuenn@google.com>
Date: Thu, 1 Aug 2019 13:41:45 -0700
Message-ID: <CADfYTpEhpDUKs7K6s33aDmYO=dTsUDKWoWv8d0Nj8LfgdU1u5w@mail.gmail.com>
Subject: Reminder: Purchase tickets for OpenBMC Hackathon @ OSFC 9/3-6
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000058a2ef058f14471a"
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

--00000000000058a2ef058f14471a
Content-Type: text/plain; charset="UTF-8"

Just a friendly reminder about OSFC taking place 9/3-6.  There is a
dedicated BMC track as well as many interesting presentations in the main
and security tracks.  You can view the schedule here
<https://osfc.io/schedule>.

Please purchase tickets here <https://osfc.io/tickets>.  Presenters receive
complimentary admission.

This will be considered part of the next OpenBMC Hackathon so I hope to see
you there.  It will be a bigger event in the past since we are joining up
with OSFC.

Please let me know if you have any questions.

----------
Nancy

--00000000000058a2ef058f14471a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just a friendly reminder about OSFC taking place 9/3-=
6.=C2=A0 There is a dedicated BMC track as well as many interesting present=
ations in the main and security tracks.=C2=A0 You can view the schedule <a =
href=3D"https://osfc.io/schedule">here</a>.</div><div><br></div><div>Please=
 purchase tickets <a href=3D"https://osfc.io/tickets">here</a>.=C2=A0 Prese=
nters receive complimentary admission.</div><div><br></div><div>This will b=
e considered part of the next OpenBMC Hackathon so I hope to see you there.=
=C2=A0 It will be a bigger event in the past since we are joining up with O=
SFC.</div><div><br></div><div>Please let me know if you have any questions.=
</div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature">----------<br>Nancy</div></div></div>

--00000000000058a2ef058f14471a--
