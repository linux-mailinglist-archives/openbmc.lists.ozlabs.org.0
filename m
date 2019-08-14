Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 919BE8DB48
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 19:24:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467xJt0w8PzDqVK
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 03:24:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="c9XzDcTO"; 
 dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467xH061qfzDqvw
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 03:22:35 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id p77so3773669wme.0
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 10:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ucw/Z4r/8OA27SapCQdJ4ijvvjjL0hZBjntWnNbz/1A=;
 b=c9XzDcTORmfwBjKIYhFJgL35nEKJxTD+8TL9Amqwtn1GTI6xzCNanZGZujtKFZ6QCs
 hwpISTxlThuIiEhuGVhmF0OX70a1y6V6owZBFIfztnEEEUJjxlqmSSMNTyCpYUSwkXsJ
 zF9eS5uvr3eLJ7ky5zzBcosl53U4y2AkZfkCud2Uir+4Na0/GeMtvMocquQkyLQj6yC8
 t77jnC0xWE1/Ki+H/z1jmjQGoYOkjrlgFAxLtaX7Mo+jYOy7BSqYjrwPblkZB5Fmqz7l
 HuudBKjcr5rXzF13N6rAMo8YdoE6CEOuL5QfAGA3z7qdWeFP++cA4Xn/1GMD7MY7oEIm
 bolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ucw/Z4r/8OA27SapCQdJ4ijvvjjL0hZBjntWnNbz/1A=;
 b=bdytyyo0YJVHkHOnDjhTtW8pXcCHwefaz+k4xw8UQU2fFOj31pVu2uIbNUoayjekJr
 s5ZKzuJ8Z/tmhjmJZLG7RaX+ayxStRIL0TJ6TDWGTuSp938NuJa0kZ9gRnWEzXVNrDW3
 4Gn8u2dCSnm28X1BXaaD4eMbgJJXvmP7fyCZ5hN0NuObV3LO35lXXaSIiHQtlUF10nFf
 aFlTFeeBdH5LBwnxI2L98vNOZ9uANuQo0eThQmSLjZC05TvdwmQtYcufdvIWnCzflLZY
 svzHg+6GAcaqMa1ZjF9HYBbXrOF35U9vFlTJqpu2dU93skQlcCGuPVuW/yPegIHPMk9t
 sBEQ==
X-Gm-Message-State: APjAAAVRMGPlqIESDmREkPOWFS8pGh4uN3Ef5dUJlQSsD34RhVtZWNdp
 OF0ss7HoG8HKh27djtzn+wgCGLLK0bhm+YOZmZZ4q6uZy0Ntww==
X-Google-Smtp-Source: APXvYqwhZvxJ6Rznvdr7lf37Lpqa3pF732dra7pmlW4d+/dLNe8pRHYZ3SD/et6ME2rPidaK9edfs0RCH2JcirDyox0=
X-Received: by 2002:a1c:ac81:: with SMTP id v123mr188851wme.145.1565803349410; 
 Wed, 14 Aug 2019 10:22:29 -0700 (PDT)
MIME-Version: 1.0
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 14 Aug 2019 10:21:53 -0700
Message-ID: <CADfYTpGPUG8DP6=54sN5wFaucyT6NvL=bu+LHkwaW1diA71fdA@mail.gmail.com>
Subject: Another Reminder: Purchase tickets for OpenBMC Hackathon @ OSFC 9/3-6
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000006e807a05901700c4"
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

--0000000000006e807a05901700c4
Content-Type: text/plain; charset="UTF-8"

Another reminder about OSFC taking place 9/3-6.  There is a dedicated BMC
track as well as many interesting presentations in the main and security
tracks.  You can view the schedule here <https://osfc.io/schedule>.

Please purchase tickets here <https://osfc.io/tickets>.  Presenters receive
complimentary admission.

This will be considered part of the next OpenBMC Hackathon so I hope to see
you there.  It will be a bigger event in the past since we are joining up
with OSFC.

Please let me know if you have any questions.

----------
Nancy

--0000000000006e807a05901700c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Another reminder about OSFC taking place 9/3-6.=C2=A0=
 There is a dedicated BMC track as well as many interesting presentations i=
n the main and security tracks.=C2=A0 You can view the schedule=C2=A0<a hre=
f=3D"https://osfc.io/schedule" target=3D"_blank">here</a>.</div><div><br></=
div><div>Please purchase tickets=C2=A0<a href=3D"https://osfc.io/tickets" t=
arget=3D"_blank">here</a>.=C2=A0 Presenters receive complimentary admission=
.</div><div><br></div><div>This will be considered part of the next OpenBMC=
 Hackathon so I hope to see you there.=C2=A0 It will be a bigger event in t=
he past since we are joining up with OSFC.</div><div><br></div><div>Please =
let me know if you have any questions.</div><br class=3D"gmail-Apple-interc=
hange-newline"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature">----------<br>Nancy</div></div></div>

--0000000000006e807a05901700c4--
