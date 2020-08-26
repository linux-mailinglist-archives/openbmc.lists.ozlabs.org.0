Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B4A2524D6
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 02:50:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbnMP4sRTzDqZ2
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 10:50:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=NNVF4uEw; dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbnLd2kzczDqXG
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 10:49:26 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id f42so150664otf.13
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 17:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=wGAEiQeXHW+AugNaWOPBAOSiwwrVh84q7+TGxSLWi68=;
 b=NNVF4uEwWh2aWv4HjHHaab34PIOQ8PNMgfqmlOyz542RDYI4SRf757d9/WD3jmGsMA
 4aV6Ogx1WlqYfrr2ri74G2IuLokQ/9NaPXkj1MayfGBESteL1QIAiTZQSHvL0VlY+1iS
 pI6CTQ6Jv4L084srSBKkd2h6QGIqxwh5SYA2XjGev/6WM2rVMCnz54wD/l7bq0VCcJZY
 F/EQeHfs29q94fL51a+tT3QkdxRgZJGIt2+DuZmaziU4mYtRyg8SZuIOGCjpYo96CKD6
 zUeJM/LlAzP5UYbD5rWICE9IzgD47Pnbs5N29Lr5YCyUZw+bzXhBN7cTxYjH8JFt9O0C
 VHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=wGAEiQeXHW+AugNaWOPBAOSiwwrVh84q7+TGxSLWi68=;
 b=N/ZcGqjf/lz1d42uNr1B3tAVMsncuOsvCM0SWtx4/xNV8HI3oVatkgzJckDM7yV2Wl
 Tn27rtPq8iw4XGeF73QpTSOOPUN/PVFlT+LdrDWLpfHnte4aY1qebubY5PyOEcI0sJu0
 tF+dFgaRjn+MUPbdW0zCMtAD9jnfmVhl78y4whMO6ttRsUAEYcPmUjc2RvKgxTQEHKF5
 MmVw7YVWnHNZ4n4Yx2K0t/muWxRtHkAx21DBxib1qBE96T4BXsYAW6qQLTRw9nJVze0z
 s1FVRvz28v7HLCtAFDU/kLKzQ5vLeyIOCQaxXmPXg+/OfqEQBbDqdmtcVeU2y5/rvQwg
 Ko5A==
X-Gm-Message-State: AOAM5330HzBB8BWUm/1O9muW47j7y//8IPujYw2RA9o1ehTjZj1OWXRJ
 pBbR5h9WTRUOIDTCf7eUs1ZH6pAK06FaqCSiKRYxtQ==
X-Google-Smtp-Source: ABdhPJzVapFXCPzwt6qb7/j8HpxFkq93tn/TiT0WNT7HiLHbc0SR4rsD4ekPJLCekjyfM6RR7vCao6hSdRE/AEbk++U=
X-Received: by 2002:a9d:2905:: with SMTP id d5mr5476020otb.274.1598402962841; 
 Tue, 25 Aug 2020 17:49:22 -0700 (PDT)
MIME-Version: 1.0
From: Alex Qiu <xqiu@google.com>
Date: Tue, 25 Aug 2020 17:49:11 -0700
Message-ID: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
Subject: Dealing with a sensor which doesn't have valid reading until host is
 powered up
To: James Feist <james.feist@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000cf4e1f05adbd3083"
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
Cc: Peter Lundgren <peterlundgren@google.com>, Josh Lehan <krellan@google.com>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000cf4e1f05adbd3083
Content-Type: text/plain; charset="UTF-8"

Hi James and OpenBMC community,

We have a sensor for HwmonTempSensor which doesn't have a valid reading
until the host is fully booted. Before it's becoming alive and useful, it's
getting disabled in code (
https://github.com/openbmc/dbus-sensors/blob/master/include/sensor.hpp#L266)
because of errors thrown up by the hwmon driver. Ideally, the thermal
control loop should kick the fan to fail safe mode until no more errors are
observed.

Any suggestions on how we should handle this kind of sensor properly?

Thank you!

- Alex Qiu

--000000000000cf4e1f05adbd3083
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi James and OpenBMC community,</div><div><br></div><=
div>We have a sensor for HwmonTempSensor which doesn&#39;t have a valid rea=
ding until the host is fully booted. Before it&#39;s becoming alive and use=
ful, it&#39;s getting disabled in code (<a href=3D"https://github.com/openb=
mc/dbus-sensors/blob/master/include/sensor.hpp#L266">https://github.com/ope=
nbmc/dbus-sensors/blob/master/include/sensor.hpp#L266</a>) because of error=
s thrown up by the hwmon driver. Ideally, the thermal control loop should k=
ick the fan to fail safe mode until no more=C2=A0errors are observed.</div>=
<div><br></div><div>Any suggestions on how we should handle this kind of se=
nsor properly?<br></div><div><br></div><div>Thank you!</div><br clear=3D"al=
l"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_=
signature"><div dir=3D"ltr">- Alex Qiu</div></div></div></div>

--000000000000cf4e1f05adbd3083--
