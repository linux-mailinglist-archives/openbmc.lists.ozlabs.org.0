Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82C4D23D
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 17:36:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45V5Wg07HDzDrFF
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 01:36:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XIFmarZb"; 
 dkim-atps=neutral
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45V5Vz4vygzDrFF
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 01:35:31 +1000 (AEST)
Received: by mail-io1-xd2b.google.com with SMTP id k20so277043ios.10
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 08:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=BgMr0a9B8iUcCfj2YJhQTY4K+J6XKk58bbju7zTNL1s=;
 b=XIFmarZbVgvrqtAxk0Ct5oPqrCL2HwtSufESghsw7ZWLuCcJXmNMnpEy0uAAKIsPW0
 Wq8ZDWpW1PMUrwcdN27ngHMHNEQHFzfHiqVt94PholrfGFvuMA9m0PeddrWnExtRG68c
 DG78C3kGvYxNoMPQvaHCp5+ms7KxO0vL6vHvPrhZ//wwMfXKrC1BhOAz7MOJLUya/sas
 09Z2WzQxgLRixk1F705pUtNY0RG5mp5SNCLdk9iTUGdwLxJLuUzmISdwf6oomokOo59M
 JjxYXhm6cJNp8ovIP5vIl4pJlGi8y0g+WgGKsupE59QZoLa4Z1/SSAzpL8K8Mxe5uq0L
 nsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BgMr0a9B8iUcCfj2YJhQTY4K+J6XKk58bbju7zTNL1s=;
 b=n6Ee5O6C9Bhh2dnCYdfZdNMfXvrLT25r+ZE1WiwqMW2CPTjfTMKcmbw8bxW7Iohxl7
 hwU7zuc4Ku+miAoJF4CeKSRB5rE5Djyv8MBAknA5xbFhpTPVScWGIJ1056GPkc+JWA+6
 7BlgFZS7Hf3sc06mqGx6mfji5lB648MOedsPqMhPUeIlDy36V1rt60w+wsMwgNmyAPo5
 MfftL15fFiHI3RpLUweuuOTVucneWtag5eCFRaMq42fxYMseXPmw/lV4bcDevnxVVuLA
 KJ3UoHsW0QyC6k5qUL8OElckqCv7WSgStfP1o+HVcAFejHGHhTRqE3+3iEZqj5xFHe70
 6Yvg==
X-Gm-Message-State: APjAAAUI9tmgvqyvNDpe+kgyNZtlVp6AUkgtZL72fMVlalsOYJryPF3J
 oZWZMmEximGn1IeV6QsSBRcPeWPwcHIviOV/0Hfo0b6kSXGlEw==
X-Google-Smtp-Source: APXvYqwdFjf0bQZkQRh9YVgMEHmH0C/SSf31jLhw1gHO1aH7uv0L5kjWdZj77G2fyy4G7zDRTkMxS/wi9axQIAIN06g=
X-Received: by 2002:a02:a493:: with SMTP id d19mr8485622jam.22.1561044926917; 
 Thu, 20 Jun 2019 08:35:26 -0700 (PDT)
MIME-Version: 1.0
From: Nancy Yuen <yuenn@google.com>
Date: Thu, 20 Jun 2019 08:34:50 -0700
Message-ID: <CADfYTpEGPt5Bo+X689iaaFm5zWsx4CZrtj9yuNiedw5X5Orejw@mail.gmail.com>
Subject: OpenBMC Hackathon will be at OSFC Sept 2019
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000594ffb058bc318bd"
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

--000000000000594ffb058bc318bd
Content-Type: text/plain; charset="UTF-8"

OpenBMC will hold a Hackathon as part of the Open Source Firmware Conference
<https://osfc.io/> (OSFC) in September.  OpenBMC will have it's own track
there.  Several other firmware projects will also represented.
Registration is required and there is a limit on the number of spots added
with this track. Please register <https://osfc.io/tickets> early.

There is an attendee scholarship for students or people who work on any of
the Open Source firmware projects on their own time, not part of their day
job.

*Location*
Presentations Sept 3-4 @ Google in Sunnyvale
Google Building MP1
1155 Borregas Ave
Sunnyvale, CA, 94089
USA

Hacking Sept 5-6 @ Facebook in
Facebook Building MPK60
150 Independence Dr
Menlo Park, CA, 94025
USA

*Presentations*
There is a deadline for submitting a presentation <https://osfc.io/speakers>
is *June 30th*.  OpenBMC has its own track but will also include other BMC
related talks.  Presenters receive complimentary admission.  (When you see
paper below, they really mean presentation).  The audience at the OpenBMC
track may include people from the other projects.

*Please mark talks for the OpenBMC track with OpenBMC in the title.*

Day 1&2 Submissions:
Submissions may be in abstract, outline, or slide deck form. Submissions
must be in English.

These presentations will take place @ Google.  OSFC wants these to be set
in the schedule and announced ahead of time.

Day 3&4 Lightning Talk Submission:
These are meant for shorter "talks". Some lightning talks can be added
later.  Short abstract submission only. Please mark your submission by
adding "lightning talk" to the title.

These days are meant for hacking and more ad-hoc discussions so the plan is
to leave room for those.

----------
Nancy

--000000000000594ffb058bc318bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">OpenBMC will hold a Hackathon as part of =
the <a href=3D"https://osfc.io/">Open Source Firmware Conference</a> (OSFC)=
 in September.=C2=A0 OpenBMC will have it&#39;s own track there.=C2=A0 Seve=
ral other firmware projects will also represented.=C2=A0 Registration is re=
quired and there is a limit on the number of spots added with this track. P=
lease <a href=3D"https://osfc.io/tickets">register</a> early.</div><div><br=
>There is an attendee scholarship for students or people who work on any of=
 the Open Source firmware projects on their own time, not part of their day=
 job.</div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"auto"><b=
>Location</b></div><div dir=3D"auto">Presentations Sept 3-4 @ Google in Sun=
nyvale</div><div dir=3D"auto">Google Building MP1<br>1155 Borregas Ave <br>=
Sunnyvale, CA, 94089 <br>USA<br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Hacking Sept 5-6=C2=A0@ Facebook in=C2=A0</div><div dir=3D"auto">=
Facebook Building MPK60<br>150 Independence Dr <br>Menlo Park, CA, 94025 <b=
r>USA</div></div><div dir=3D"ltr"><br></div><div><b>Presentations</b></div>=
<div dir=3D"ltr">There is a deadline for <a href=3D"https://osfc.io/speaker=
s">submitting a presentation</a> is <b>June 30th</b>.=C2=A0 OpenBMC has its=
 own track but will also include other BMC related talks.=C2=A0 Presenters =
receive complimentary admission.=C2=A0 (When you see paper below, they real=
ly mean presentation).=C2=A0 The audience at the OpenBMC track may include =
people from the other projects.</div><div dir=3D"ltr"><br></div><div><b>Ple=
ase mark talks for the OpenBMC track with OpenBMC in the title.</b></div><d=
iv dir=3D"ltr"><br></div><div>Day 1&amp;2 Submissions:</div><div>Submission=
s may be in abstract, outline, or slide deck form. Submissions must be in E=
nglish.=C2=A0</div><div><br>These presentations will take place=C2=A0@ Goog=
le.=C2=A0 OSFC wants these to be set in the schedule and announced ahead of=
 time.=C2=A0 <br><br>Day 3&amp;4 Lightning Talk Submission:<br>These are me=
ant for shorter &quot;talks&quot;. Some lightning talks can be added later.=
=C2=A0=C2=A0Short abstract submission only. Please mark your submission by =
adding &quot;lightning talk&quot; to the title. </div><div><br></div><div>T=
hese days are meant for hacking and more ad-hoc discussions so the plan is =
to leave room for those.<br></div><div dir=3D"ltr"><div dir=3D"auto"><br></=
div></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature">----------<br>Nancy</div></div></div>

--000000000000594ffb058bc318bd--
