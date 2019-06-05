Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAAC35DE3
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 15:26:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JqLJ5knKzDqcS
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 23:26:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Eb8mTaju"; 
 dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JqHy3SjxzDqZC
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 23:23:58 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id c6so2296328wml.0
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jun 2019 06:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B2mkK1itWpR/O/SX2BRe1CZJ6r7T2DObXdVYYp/jCUg=;
 b=Eb8mTajuRVwRCOB+YKjla4C/gby/oL1AbB++iOJyUoanvkwbNUW+zhNmaOkgpWbAvg
 1ilEqltE/x9/CDaOc8ZFtl4OTQ/1K/nv/JPhiBQsM0oBGM1ONBryGKiKDXUoqmKQ7VqB
 mVJdizOQq5lTPK8Ghjk4mbBqgaE8f1V56LfKcHkxOvHdZ2KofDVdu6c9OR+0k+dg5/hV
 V87rwRYq8Gt0qYh5/xCWNN0cBea1yTfCB4XRinko3c+UwzbMvjw/nLal/Wiwo3pNMmxR
 zsV5k5Tx+HDJQc7mLJiWVv6u+kgCuNBLMqbj1tNZVjtCUzlGflt6Rlo06JbCSz31eEe6
 XQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B2mkK1itWpR/O/SX2BRe1CZJ6r7T2DObXdVYYp/jCUg=;
 b=e9w91o0y/UXqdk9okxhuEe9yt/PxfUgeHw1+0zF2hvC9Eu7mzZzXg4XVFRZe/wBOKy
 eoHt1EHyXsS3oCbqYBO0kUxPwPF7WzYkYwxo3cRtjRtfYZTRTd5xhDAJ6PxWjWQPhviJ
 HnPhSzJ9Pl8mxPwiOSRZEwAOb3qPFmKNPwTWXkItbj9Wyyr02B0IXb7FfnEB6sGzcojO
 bUGo5jUTaLdNZSAPkS0yXKanzTnSwhwijh1uD0hvAvRU/sqRtX0Tb+jJajAMO1D8gIlo
 AVlneCUlpnwv4XB/4vZEdQc+Pm5LGV5uSc7kirDnmgw/tN09Q5PpBK3ytqmIk9vL7vSx
 BPYw==
X-Gm-Message-State: APjAAAX5h5EUYbhwsckyR8KTMyAhgCa09T411ODW/axwvY2+55hG726O
 cYJ/zg22E6gnia5AYXcqhn1kScPMiL+9eLjaleM=
X-Google-Smtp-Source: APXvYqwmSiDz1l8y6hM43oWEqfX/pqC4AFm574nQMGO//TQurNwsPfLGO8B3zO0ndHRZ8ACVTO/3KKPzvACC1MRuBZw=
X-Received: by 2002:a7b:c057:: with SMTP id u23mr22890516wmc.29.1559741032481; 
 Wed, 05 Jun 2019 06:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoTagP0=uyg1DsNVZYvFvH23yAAwkxoGpYHoQtowCx2N-A@mail.gmail.com>
In-Reply-To: <CAMTupoTagP0=uyg1DsNVZYvFvH23yAAwkxoGpYHoQtowCx2N-A@mail.gmail.com>
From: Derick <derick.montague@gmail.com>
Date: Wed, 5 Jun 2019 08:23:41 -0500
Message-ID: <CAOUmYFQWQxdqYWnrG8JyBpkrexGjjAByDg91tuj5OeQYub1v5Q@mail.gmail.com>
Subject: Re: GUI Workgroup meeting - this Wednesday 7:30AM CST
To: Jandra A <jandraara@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002ec8d9058a938266"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Wang,
 Kuiying" <kuiying.wang@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002ec8d9058a938266
Content-Type: text/plain; charset="UTF-8"

> The GUI design workgroup meeting will be happening Wednesday June 5 at
7:30AM CST. As there was no attendees last meeting, this week we have the
same agenda.
This weeks meeting also unattended. In order to try and include a larger
group of people for the workgroup, we are changing the time of the work
group to 10:00 AM Central starting the next meeting scheduled for
Wednesday, June 19th. You can find the upcoming agenda, along with the
notes on the workgroup wiki page (
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group)

Thank you, Jandra for sending out the notifications and documenting the
meeting info.

--0000000000002ec8d9058a938266
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>&gt; The GUI design workgroup meeting will be happenin=
g Wednesday June 5 at 7:30AM CST. As there was no attendees last meeting, t=
his week we have the same agenda. <br><div>This weeks meeting also unattend=
ed. In order to try and include a larger group of people for the workgroup,=
 we are changing the time of the work group to 10:00 AM Central starting th=
e next meeting scheduled for Wednesday, June 19th. You can find the upcomin=
g agenda, along with the notes on the workgroup wiki page (<a href=3D"https=
://github.com/openbmc/openbmc/wiki/GUI-Design-work-group" style=3D"font-fam=
ily:Arial,Verdana,sans-serif;font-size:12px">https://github.com/openbmc/ope=
nbmc/wiki/GUI-Design-work-group</a>)</div><div><br></div><div>Thank you, Ja=
ndra for sending out the notifications and documenting the meeting info.</d=
iv></div>

--0000000000002ec8d9058a938266--
