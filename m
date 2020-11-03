Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A442A4C9C
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 18:21:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQc4y31rHzDqM5
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 04:21:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2f;
 helo=mail-vs1-xe2f.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PUnKp+h0; dkim-atps=neutral
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQc4807RYzDqHY
 for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2020 04:20:23 +1100 (AEDT)
Received: by mail-vs1-xe2f.google.com with SMTP id h5so9888084vsp.3
 for <openbmc@lists.ozlabs.org>; Tue, 03 Nov 2020 09:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2kmVfDRdXyNEqEcMZsm57rJeM8KAsiQflBkNHo4MBXk=;
 b=PUnKp+h0kRzcRsl5tmch4QmLxDfppk9R3QZe+s07n5F8w/bme5DwRdVQBJ3i02Ya+2
 I/wMfxu3Cu1sNtTIxy3fQeCIyI4MRJXXXuYN9hlpPFFeWZ3x+fftUMu2Sae0fSwEDj04
 g3v0I0wbtUSMM0mn/zS184WnXl+Kl1AbwxM9x4geRBIa25ZTMzzn8N1Ujy/IgdEzL3Yr
 xp1F+fHSTCM7it91Zh+WNylkBq44aQp8/hqtSxHW7Rp3d/K6Brym5rSn1dofN/K4QPl4
 Ai1dSp0muI6WnkmAi5nOucMiRRneRgts3igZty3sdt3DQz9Q74Y5C3o8FoIc1PT2zmZu
 I0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2kmVfDRdXyNEqEcMZsm57rJeM8KAsiQflBkNHo4MBXk=;
 b=ghJqV9358FrEdhK7Eicx8HAtFbyYvdQ8pwMTuOMp49+Le8VC2VMuaN/xrEycUdK2mM
 Fi4lMmBYCtB44gSh3upKfXSYUulxGJFQJKxOA5/0YZ3e186RpkdLn7xMlJQ2uEZsvhws
 NNiksMBYPI6vwlDjk4mcVUIoNKIOMMspO89iiYCag/sZNHJHRcJcHxsRlMQ6/L9lyY+i
 ujQ6fGaps4QShCfdvTntxYya5B4uulIltDZ1SHWZeBuQ5ym8N4RVSM0wT3Jssfpv2SQk
 q1YhhO3DHSpz8C0kqipTJL/93NbYtI2mDrwffV8A0PrVP/XonyQuLQY0Fe9UE5UTyrzZ
 mZJQ==
X-Gm-Message-State: AOAM533VJrHuDO8bayfFIFgG2Gym4ULeSNgEM6jsAaIQHMFZsIQv7eIn
 MB7Id8+HWWo+qD2YgduJg0bPzdoSKNXqn6MBMcLdy2uw6k9DL0pO
X-Google-Smtp-Source: ABdhPJzc81WtQvRoZKzerClDJGSAUqGd8wlUWunO2hVS8/yc1Ck6oOx3ypq7N15jxiRN3MU7qSRbZjyK5XcHai2djC8=
X-Received: by 2002:a67:a603:: with SMTP id p3mr19958022vse.4.1604424019387;
 Tue, 03 Nov 2020 09:20:19 -0800 (PST)
MIME-Version: 1.0
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Tue, 3 Nov 2020 22:50:07 +0530
Message-ID: <CAM=TmwWinuWjpNr+NeTXTmPv0wUCCzg5BUKhhR=Rp=mfmma_6Q@mail.gmail.com>
Subject: Secure boot/signed images and GPL code
To: openbmc@lists.ozlabs.org, cjengel@us.ibm.com, joel@jms.id.au, 
 joseph-reynolds@charter.net
Content-Type: multipart/alternative; boundary="000000000000beaa0c05b337130d"
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

--000000000000beaa0c05b337130d
Content-Type: text/plain; charset="UTF-8"

Hi,

Does secure boot on the BMC (I think for my question it doesn't matter
where the hardware root of trust is - it could be on the BMC or an external
chip) or signed images deprive users of rights associated with code in
OpenBMC that is GPL licensed? Meaning, GPL allows users to modify and
distribute the GPL components. I'm not a legal expert, but I understand
from the legal team in my company that these rights are not limited to
making modifications to the GPL code and that they also imply being able to
deploy/boot such modified code; and the problem is secure boot/signed
images would prevent the same. It also looks like this isn't specific to
GPLv3, but GPL in general (for eg GPLv2 clause 6).

How are others dealing with this:
- By having an ability to disable secure boot (I see this as optional in
https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/26169/)? What if this
is not an option on a system?
- Other options?
- Do you (or your legal team) view this is only a GPLv3 problem, or not a
problem at all?

Thanks,
Deepak

--000000000000beaa0c05b337130d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Does secure boot on the =
BMC (I think for my question it doesn&#39;t matter where the hardware root =
of trust is - it could be on the BMC or an external chip) or signed images =
deprive users of rights associated with code in OpenBMC that is GPL license=
d? Meaning, GPL allows users to modify and distribute the GPL components. I=
&#39;m not a legal expert, but I understand from the legal team in my compa=
ny that these rights are not limited to making modifications to the GPL cod=
e and that they also imply being able to deploy/boot such modified code; an=
d the problem is secure boot/signed images would prevent the same. It also =
looks like this isn&#39;t specific to GPLv3, but GPL in general (for eg GPL=
v2 clause 6).</div><div><br></div><div>How are others dealing with this:</d=
iv><div>- By having an ability to disable secure boot (I see this as option=
al in <a href=3D"https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/2616=
9/">https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/26169/</a>)? What=
 if this is not an option on a system?</div><div>- Other options?<br></div>=
<div>- Do you (or your legal team) view this is only a GPLv3 problem, or no=
t a problem at all?</div><div><br></div><div>Thanks,</div><div>Deepak<br></=
div></div>

--000000000000beaa0c05b337130d--
