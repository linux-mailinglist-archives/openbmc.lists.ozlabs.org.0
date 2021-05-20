Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DF738BA64
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 01:29:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmQtt4ZzFz304N
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 09:29:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Ms4xIh66;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Ms4xIh66; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmQtb1nF1z2xYZ
 for <openbmc@lists.ozlabs.org>; Fri, 21 May 2021 09:29:26 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 191so19167501ybn.7
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 16:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vqGKwEqiSvuxRmv9HywK1Zz4l8oprkBg3atU4SUWjOE=;
 b=Ms4xIh667ipNmoIMMK8WLfXHawPXfJSVdDnIppoAl8InToPlpR7nPLUAWovtCEhnSV
 ZqDnjppkv6cc8QBjFlx3cvk6xs7WWSwNguAeCSZFMjn+jy3xGOH5B/s+gFCHSDJ1I9a2
 zXFxOSQxjSVxUk0Q4edOhSE7Qb6Xumv4QAjmrFIlRHEHME8mb/IY5/qjx1w3RTIfmKVr
 StqFaYeFtSBG/kg70nOQNeuq4ph/8bZplvzGmrJqcyXsr3TZNrxJeXzNoryGb09p/iwD
 QDvU/Gvdoo3dND3jhGSITPgv8EWnj8gNGVE8Phdigocg21tIWk+yibunvYwGCslDfUKD
 KrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vqGKwEqiSvuxRmv9HywK1Zz4l8oprkBg3atU4SUWjOE=;
 b=OUFAzdu6B6cLk5g1bclstnpDePA9+4qxam39OtyVJn148FyHrWa1tUOON77C2PgYcf
 hLP1m/reIr9kT9gnNPZueBLdj8B+Ljm7iVe3buFUmowk7rAT5CNi6qhILO18BfucGTKx
 Y/NMRP41Lspr2qd47bJ2z25GQVEm0bI474jJmC949SEUtSWqjXDWqizGuli9sYOtaZ8C
 dDtU8F24OU7350Hs1TNE6wnSyA9wa86hLcrTGmTajhFeY6WjwxtKRgSTs/zQW0Mll4Gw
 Ddv7gUBCbz4MbwbenUdybx9b2MQt0q5p9twM6Yk6hXKouPjpEwr11eELBYWHYU6WBZpb
 QfhA==
X-Gm-Message-State: AOAM531Uvt9/RUg4da9aFyYQ2e91LsApOchXigsupGNVQxLBMaRqyu7y
 8osoHZtfA8rN98sxxip123xVug/dHkg1J3OG4QEMnL7cGMYDtw==
X-Google-Smtp-Source: ABdhPJx30Xil73CXp73j7CysRMm2DJUVW1dId7fyxVPwqh004YAvmeErbZYE4IlgsC5r0ht2kBnZF8zi5IivjxO5PXo=
X-Received: by 2002:a25:bad0:: with SMTP id a16mr10947922ybk.441.1621553360217; 
 Thu, 20 May 2021 16:29:20 -0700 (PDT)
MIME-Version: 1.0
From: Nan Zhou <nanzhou@google.com>
Date: Thu, 20 May 2021 16:29:09 -0700
Message-ID: <CAOLfGj5orNO2U3zdO6LuBGY05mXFewofqRiOUXyA=ks74LzMhg@mail.gmail.com>
Subject: Link phosphor-hostlogger and bmcweb
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000000597c505c2cb5045"
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
Cc: Spencer Ku <spencer.ku@quanta.corp-partner.google.com>,
 Litzung Chen <litzung.chen@quanta.corp-partner.google.com>,
 a.amelkin@yadro.com, Ed Tanous <edtanous@google.com>,
 Richard Hanley <rhanley@google.com>, a.senichev@yadro.com,
 a.filippov@yadro.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000597c505c2cb5045
Content-Type: text/plain; charset="UTF-8"

Hi all,

In the previous thread (
https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html), we
(engineers from Google and Quanta) discussed our attempt to share host
serial logs via Redfish, which includes polling logs via LogService and
streaming log bytes via EventService (e.g. SSE). We went with the event log
architecture
<https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md>
and did the implementation.

However, thanks to the maintainers of host-logger, we found the limitation
that we might flood the systemd-journal. Given that serial logs are special
and new data comes more often than almost anything else on the BMC,
flooding systemd-journal will be a fatal problem.

So we are thinking about other directions. The current idea is that we
don't involve DBus at all and BMCWeb reads serial logs from log files
directly.

We still want to reuse the phosphor-hostlogger and do some modification. We
believe it is better to try to reuse existing codes if possible and improve
them rather than creating new things that have similar functionalities (in
our case, it is a daemon that could collect logs and persist them).

We want to do the following modification in phosphor-hostlogger (from the
input and output point of view, just very few things will be changed)

1. One limitation of phosphor-hostlogger is that it will lose data in the
memory (the ring buffer maintained by hostlogger) when BMC gets force
restarted; we propose to remove the ring buffer and write to the log file
as soon as some characters are received. This implicitly removes the needs
of the ring buffer, and the persistence triggering (host reboot, sigterm,
etc) in hostlogger. We believe this keeps the same functionality but saves
hundreds of lines of codes in phosphor-hostlogger.

2. We propose not to compress the latest log file. This saves us the
overhead of doing decompression when BMCWeb just needs to retrieve the most
recent logs. There are still going to be log rotations in the file level.
Files other than the latest log file are still going to be compressed. We
can modify existing codes to achieve this or use the linux logrotate
directly.

Furthermore, we will add host serial logs into BMCWeb, both LogService and
EventService. In LogService, we will teach BMCWeb how to read the latest
log file that is not compressed and the other compressed old logs, and how
to assemble LogEntries out of raw serial logs. We will discuss EventService
in future threads but the very initial idea is to setup inotify on log
files and SSE to stream out new bytes to clients (like what the existing
event logging is doing).

As we said above, for phosphor-hostlogger, the input is still the
obmc-server unix socket, and the output are still persisted log files. But
the functionality will get improved (less data loss), code gets simplified
(no ring buffer and persistence triggering), and it will become easier and
more performant to get BMCWeb hooked up for log streaming via Redfish.

Please let us know what you think. We appreciate any feedback. Thank you
very much!

Sincerely,
Nan

--0000000000000597c505c2cb5045
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>In the previous thread (<=
a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html=
">https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html</a>), w=
e (engineers from Google and Quanta) discussed our attempt to share host se=
rial logs via Redfish, which includes polling logs via LogService and strea=
ming log bytes via EventService (e.g. SSE). We went with the <a href=3D"htt=
ps://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bm=
cweb.md">event log architecture</a> and did the implementation.=C2=A0</div>=
<div><br></div><div>However, thanks to the maintainers of host-logger, we f=
ound the limitation that we might flood the systemd-journal. Given that ser=
ial logs are special and new data comes more often than almost anything els=
e on the BMC, flooding systemd-journal will be a fatal problem.=C2=A0</div>=
<div><br></div><div>So we are thinking about other directions. The current =
idea is that we don&#39;t involve DBus at all and BMCWeb reads serial logs =
from log files directly.=C2=A0=C2=A0</div><div><br></div><div>We still want=
 to reuse the phosphor-hostlogger and do some modification. We believe it i=
s better to try to reuse existing codes if possible and improve them rather=
 than creating new things that have similar functionalities (in our case, i=
t is a daemon that could collect logs and persist them).</div><div><br></di=
v><div>We want to do the following modification in phosphor-hostlogger (fro=
m the input and output point of view, just very few things will be changed)=
</div><div><br></div><div>1. One limitation of phosphor-hostlogger is that =
it will lose data in the memory (the ring buffer maintained by hostlogger) =
when BMC gets force restarted; we propose to remove the ring buffer and wri=
te to the log file as soon as some characters are received. This implicitly=
 removes the needs of the ring buffer, and the persistence triggering (host=
 reboot, sigterm, etc) in hostlogger. We believe this keeps the same functi=
onality but saves hundreds of lines of codes in phosphor-hostlogger.</div><=
div>=C2=A0=C2=A0</div><div>2. We propose not to compress the latest log fil=
e. This saves us the overhead of doing decompression when BMCWeb just needs=
 to retrieve the most recent logs. There are still going to be log rotation=
s in the file level. Files other than the latest log file are still going t=
o be compressed. We can modify existing codes to achieve this or use the li=
nux logrotate directly.</div><div><br></div><div>Furthermore, we will add h=
ost serial logs into BMCWeb, both LogService and EventService. In LogServic=
e, we will teach BMCWeb how to read the latest log file that is not compres=
sed and the other compressed old logs, and how to assemble=C2=A0LogEntries =
out of raw serial logs. We will discuss EventService in future threads but =
the very initial idea is to setup inotify on log files and SSE to stream ou=
t new bytes to clients (like what the existing event logging is doing).</di=
v><div><br></div><div>As we said above, for phosphor-hostlogger, the input =
is still the obmc-server unix socket, and the output are still persisted lo=
g files. But the functionality will get improved (less data loss), code get=
s simplified (no ring buffer and persistence triggering), and it will becom=
e easier and more performant to get BMCWeb hooked up for log streaming via =
Redfish.</div><div><br></div><div>Please let us know what you think. We app=
reciate=C2=A0any feedback. Thank you very much!</div><div><br></div><div>Si=
ncerely,</div><div>Nan</div><div><br></div><div>=C2=A0=C2=A0</div></div>

--0000000000000597c505c2cb5045--
