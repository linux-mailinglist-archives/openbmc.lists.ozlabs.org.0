Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD0B331981
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 22:45:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvX2R1vDjz3cT5
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 08:45:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=q8Wu1Vqx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62d;
 helo=mail-ej1-x62d.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=q8Wu1Vqx; dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvX2C1lqfz30Kl
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 08:45:20 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id mm21so23299261ejb.12
 for <openbmc@lists.ozlabs.org>; Mon, 08 Mar 2021 13:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=5HCHbNkYKz4BW5ylDdCdhDn12qjiPxRqrm6H59fomw4=;
 b=q8Wu1VqxZnQ2lQmCmm/4mskMBO245PY7bNNYaoV/dWhJJ3KD87H+Fd48CYezY+gpcF
 ZFrn2WJUM77yXT0tarxgtCfol0b8rUXQ1ciN+XEcPJl7zLyvTuaW70P9C1rMOGL4VW2y
 X2KXNQkAEVsQuhZpRDSgRhPzT+6yUetSqjMsotQwym9xr+hmw3tAX4twBznKq8DeGYJc
 8YOMeNkV/X6MN7ARvBAt6i79DLyp0dWWJ8SzaQam3o9w+wLzN3eswYaxndeA7uPM6lom
 ssbytYTTeHD7g7d4AZzV0kKE0196s8N8myMt2Tp4ycfyfZ+25lE75p4HUFabddJY2H/Z
 QtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=5HCHbNkYKz4BW5ylDdCdhDn12qjiPxRqrm6H59fomw4=;
 b=MNrYy+wBWTgQlLMffPIwxEukhQHoh5xLlxftdoCfWRix/0cf6LdnnthPIFyr9HL/gg
 Dq1/4++1xZG5gJUvtnv54BqAVWgAiulQ2WiUNNUb+1ABbBt1r8JBFzhBJHXTn/UE/5t0
 2bqblH7muS8mlb78aIjb1Bx2DfrFPglJXn4cQVE6hqz8YhESi8PeS5isej4wI/iny1eU
 LNpkBJ3OBSHjHEaQEP6r2IZTt0lJ3MAcXB5yHOIKIsi/JGlNpDmuXRWrF0pfYrTvZpu+
 NwvUb8yJw6vvnir9mGhfXNjWVxYm06NC9xDqCd9RW+5k8bOSLsPV2PhbrGYuTaQ+98Eq
 ND6g==
X-Gm-Message-State: AOAM531GBPEIkUBM6a8P+yqc5EjC3hWqL9xf4y/JjOBN4QULj5OMc8JV
 NjVkgdVcNkEzAwKcurQG/8cVvXHGsR8vqjdvZV+c9OhA8HJY9g==
X-Google-Smtp-Source: ABdhPJww4b7ec1aA3ym3qVjLnwRPbMjHmUBWuMra3rA9oVmIOi/qKbX9ALsvS2Q8Ag/1P0Mkk4epDUol6SLzTZsiuHM=
X-Received: by 2002:a17:907:98f5:: with SMTP id
 ke21mr17050089ejc.552.1615239911857; 
 Mon, 08 Mar 2021 13:45:11 -0800 (PST)
MIME-Version: 1.0
From: Nan Zhou <nanzhou@google.com>
Date: Mon, 8 Mar 2021 13:45:00 -0800
Message-ID: <CAOLfGj7xOoZw0HFvNNE5-fU0VNxt48CwSi_--y7JR01TWs-xqg@mail.gmail.com>
Subject: Host Serial Console Logs via Redfish
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000002cc52105bd0d596e"
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
 Ofer Yehielli <ofery@google.com>, Ed Tanous <edtanous@google.com>,
 Richard Hanley <rhanley@google.com>, Justin Chen <juschen@google.com>,
 Zhenfei Tai <ztai@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002cc52105bd0d596e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

We are designing and implementing a new logging service in Redfish to
expose host serial console logs. The goal is that clients can talk to bmc
via Redfish and get a real-time console (just like a read-only serial
console). It will improve the debuggability of BMCs.

We divide the work into two phases. Phase 1 is to use the pull model. That
is, clients do periodical pull against the Redfish server. In Phase 2, we
will consider the post model via Redfish Events and subscriptions.

Implementation for Phase 1 is in
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39093. It is
based on obmc-console, phosphor-hostlogger, and bmcweb. The basic idea is
that phosphor-hostlogger collects host serial console logs via obmc-console
and generates tarballs in a rotation manner. These tarballs are then
consumed and exposed by a new node in bmcweb log service.

We found there are some improvements as listed below,

   - Logs are not exposed to Redfish until they reach BUF_MAXSIZE or
   BUF_MAXTIME (defined in https://github.com/openbmc/phosphor-hostlogger),
   but we want to achieve a stream-like console. We could set BUF_MAXSIZE t=
o 1
   or BUF_MAXTIME to a very short interval, but it will amplify the overhea=
d
   of compression and decompression.
   - Persistence isn=E2=80=99t optional. phosphor-hostlogger doesn=E2=80=99=
t expose any IPC
   interface. bmcweb can only talk to phosphor-hostlogger via zip files, wh=
ich
   makes persistence of logs a necessary condition.

We propose the following methods to improve it.

   - Method 1: *D-Bus Signal*; phosphor-hostlogger implements an interface
   which contains a signal. The payload of the signal should contain
   timestamps and log messages.  BmcWeb registers as a listener and once it
   receives a signal, it populates a new LogEntry. BmcWeb should implement =
its
   own configurable ring buffer to store log entries received from D-Bus.
   - Method 2: *File Watcher*; add file watchers in BmcWeb to monitor the
   log files produced by phosphor-hostlogger. This method is similar to met=
hod
   1. But persistence is still a necessary condition.
   - Method 3: *obmc-console + bmcweb*: install the console collection and
   ring buffer parts of phosphor-hostlogger as a library. Use the library
   directly in BmcWeb to collect console logs.
   - Method 4: *phosphor-hostlogger + journal + rsyslog + bmcweb*: this
   architecture is very similar to what the current OpenBMC uses for
   redfish-event
   <https://github.com/openbmc/docs/blob/master/architecture/redfish-loggin=
g-in-bmcweb.md>.
   Add a new schema for log entries. Publish journal logs in
   phosphor-hostlogger. Add file watchers in BmcWeb to monitor the log file=
s
   produced by rsyslog. rsyslog should have log rotation enabled. Persisten=
ce
   is still a necessary condition.

Before we move forward, we would like to see what your preference is. We
are willing to see other suggestions and alternatives as well. Thanks!

Sincerely,
Nan

--0000000000002cc52105bd0d596e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,=C2=A0<div><br></div><div>We are designing and impl=
ementing a new logging service in Redfish to expose host serial console log=
s. The  goal is=C2=A0that clients can talk to bmc via Redfish and get=C2=A0=
a real-time=C2=A0console (just like a read-only serial console). It will im=
prove the debuggability of BMCs.=C2=A0</div><div><br></div><div>We divide=
=C2=A0the work into two phases. Phase 1 is to use the pull model. That is,=
=C2=A0clients do periodical pull against the Redfish server. In Phase 2, we=
 will consider the post model via Redfish Events and subscriptions.</div><d=
iv><br></div><div>Implementation for Phase 1 is in <a href=3D"https://gerri=
t.openbmc-project.xyz/c/openbmc/bmcweb/+/39093">https://gerrit.openbmc-proj=
ect.xyz/c/openbmc/bmcweb/+/39093</a>. It is based=C2=A0on=C2=A0obmc-console=
, phosphor-hostlogger, and bmcweb. The basic idea is that=C2=A0phosphor-hos=
tlogger collects host serial console logs via obmc-console and generates ta=
rballs in a rotation manner. These tarballs are then consumed and exposed b=
y a new node in bmcweb=C2=A0log service.</div><div><br></div><div>We found =
there are some improvements as listed below,</div><div><ul><li>Logs are not=
 exposed to Redfish until they reach BUF_MAXSIZE or BUF_MAXTIME (defined in=
=C2=A0<span id=3D"gmail-docs-internal-guid-f36f23f9-7fff-675e-7cff-f6d80b6d=
3bd2"><a href=3D"https://github.com/openbmc/phosphor-hostlogger" style=3D"t=
ext-decoration-line:none"><span style=3D"font-size:10pt;font-family:Arial;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;text-decoration-line:underline;vertical-align:baseline;white-sp=
ace:pre-wrap">https://github.com/openbmc/phosphor-hostlogger</span></a></sp=
an>), but we want to achieve a stream-like console. We could set BUF_MAXSIZ=
E to 1 or BUF_MAXTIME to a very short interval, but it will amplify the ove=
rhead of compression and decompression.</li><li>Persistence isn=E2=80=99t o=
ptional. phosphor-hostlogger doesn=E2=80=99t expose any IPC interface. bmcw=
eb can only talk to phosphor-hostlogger via zip files, which makes persiste=
nce of logs a necessary condition.</li></ul></div><div>We propose the follo=
wing methods to improve it.<br><ul><li>Method 1: <b>D-Bus Signal</b>; phosp=
hor-hostlogger implements an interface which contains a signal. The payload=
 of the signal should contain timestamps and log messages.=C2=A0 BmcWeb reg=
isters as a listener and once it receives a signal, it populates a new LogE=
ntry. BmcWeb should implement its own configurable ring buffer to store log=
 entries received from D-Bus.</li><li>Method 2: <b>File Watcher</b>; add fi=
le watchers in BmcWeb to monitor the log files produced by phosphor-hostlog=
ger. This method is similar to method 1. But persistence is still a necessa=
ry condition.</li><li>Method 3: <b>obmc-console + bmcweb</b>: install the c=
onsole collection and ring buffer parts of phosphor-hostlogger as a library=
. Use the library directly in BmcWeb to collect console logs.</li><li>Metho=
d 4: <b>phosphor-hostlogger + journal + rsyslog + bmcweb</b>: this architec=
ture is very similar to what the current OpenBMC uses for <a href=3D"https:=
//github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcwe=
b.md">redfish-event</a>. Add a new schema for log entries. Publish journal =
logs in phosphor-hostlogger. Add file watchers in BmcWeb to monitor the log=
 files produced by rsyslog. rsyslog should have log rotation enabled. Persi=
stence is still a necessary condition.</li></ul><div>Before we move forward=
, we would like to see what your preference is. We are willing to see other=
 suggestions and alternatives as well. Thanks!</div><div><br></div><div>Sin=
cerely,</div><div>Nan=C2=A0</div></div></div>

--0000000000002cc52105bd0d596e--
