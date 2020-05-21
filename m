Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 315631DC4D2
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 03:37:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SC194NK7zDqk8
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 11:37:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=suichen@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=D9QGJS6s; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SC0T4pnwzDqPN
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 11:37:06 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id l15so5889009lje.9
 for <openbmc@lists.ozlabs.org>; Wed, 20 May 2020 18:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=oVxTdDE7v3cmi2dE4rP9W1HIBDUxIgZPOnz8OwIVxQI=;
 b=D9QGJS6siQKxGRRA+qy8+tbZdeI4vi66VUwaqwFDt0JfFxqLoAYIdrE1E4PyewUCtn
 bsWnIgBomswqyTryRkmelwFYAAN9dj+a2IZs3vD4EuuvlEhW8zV7rWBVg7Y7bOAZgdHG
 0RIAZpEAUbh2zt135i1vPPJ8v/I5p9upaG5ybh0gibHhsvt2AB5bk2V9VIZcvYOZYiER
 ceKMLwq7eliw15CsrhwXptKpP6vsomeZYihOFcFVfpqAbXYsm8FPHsPD2TdLsIcOKoDy
 M3vAGpbH/SPe2Wl0HcB695boHoubnhriQx1hsyCKtJN0SbWqMhLmp52ErcarMbS2OyGF
 HQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oVxTdDE7v3cmi2dE4rP9W1HIBDUxIgZPOnz8OwIVxQI=;
 b=nQKYKcLAi14pHqzeeJK8dOyu57kUH1AyfisqTbpZIBesI0ZJJf3NuzeVOeEZpZRLxV
 VSQEDkr6cZ82vLJDgDTLbUadbSQ9A9txhpqsJfvd2AJU/yBukH/6JdvbXy4HGwpzD3la
 hZEbbgrEIVkbOzkPFwSvbsa1MAgxFt6E/jMDOQS+ZuwWQMP4mseivaOd58JkA0FDJZDi
 imz59C3KnxQ/sCSG9u1oYGs0jwfMO61nscRpcO9CHFsb2ZGXnarDMiJP6dW3HyNBpu9K
 Y7kbMJz5sZjxd1BNxsnXzCJ4tnAJZI+Wd/ssGqrAZHU6tktWQ8j0rGDeKk0Zsf9ShC0h
 e4jg==
X-Gm-Message-State: AOAM531HSGKTzQmG8PpBZVGQ63YKjBRD419B9yVGO10+X4MshchZ/LyF
 JbUOorZF43x+7sLG9+Kc0hxZaIVKcQn3nn0FCJ5sBeEcxEU=
X-Google-Smtp-Source: ABdhPJxPKS9ej5avnypAuMPwWl2zCu8rYzv3M1kuwNzxthv8ae8b/+LYpXwSXAaVQpsP8JtphknRa93xPppb2ckBaHI=
X-Received: by 2002:a05:651c:112e:: with SMTP id
 e14mr1755397ljo.350.1590025019495; 
 Wed, 20 May 2020 18:36:59 -0700 (PDT)
MIME-Version: 1.0
From: Sui Chen <suichen@google.com>
Date: Wed, 20 May 2020 18:36:47 -0700
Message-ID: <CAJOps0vP=0sa0R+gNFdrDy9y=e8Qq+LnZX6E2ssJ=5YaWigaeA@mail.gmail.com>
Subject: Implementing BMC Health Monitoring
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000079184705a61e8cf7"
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

--00000000000079184705a61e8cf7
Content-Type: text/plain; charset="UTF-8"

Hello OpenBMC Mailing List,

It is great to see the proposal on BMC health monitoring! We have similar
efforts in health monitoring in progress, started doing some
implementation, and would like to share some thoughts with the Mailing List
to help get BMC health monitoring started:

(1) What metrics have we considered now?

We have considered the following metrics on the BMC:
  - Memory usage
  - Number of open file descriptors
  - Free storage space in the read-write file system
  - List of processes
  - CPU time for a few top processes

  Some of these are inspired by various profilers, and some others are
expected to be relevant to the typical workloads running on the BMC.

(2) Overall, it appears the design space for health monitoring has the
following dimensions:

a) A method to do the collection, which might be:
  - Running a program like "df" to get free disk space
  - Traversing some folder to compute some statistics
  - Monitor some bus for some time and generate some result
  - or something else

  The collection process might vary from metric to metric, and can take
some time to complete on the BMC, and therefore, the results need to be
staged somewhere and made accessible when it's completed, so the requestor
won't have to busy-wait.

b) A way to stage monitoring data on the BMC, which might be:
  - Files or databases in DRAM or some persistent store.
  - DBus objects, as described in Vijay's document; this is similar to how
sensors work.
  - IPMI Blobs (this is what we have implemented right now)
  - or something else

c) A way to transfer monitoring data out of the BMC, which might be:
  - scp
  - RedFish
  - IPMI (this is what we're using right now)
  - or something else

d) Format of staged data:
  - Raw bytes
  - Protocol buffers
  - JSON objects
  - or something else
  - The data may be compressed to save transfer time

e) A way to consume the health monitoring data:
  - The BMC might do some pre-processing, like windowed average.
  - The BMC may perform certain corrective measures when metrics appear
abnormal.
  - The host may perform certain corrective measures when metrics appear
abnormal.
  - BMC health data might be plugged into some already existing monitoring
framework overseeing a large number of machines, collecting historical
data, and projecting future trends, etc.

f) A way to configure the health monitoring system:
  - Configuration for which metrics are collected
  - Configuration for the choice of staging in b), way of transfer in c),
and frequency of collection in e)
  - Some configurations may be build-time and some may be run-time
     - I guess we can draw some inspirations from phosphor-ipmi-blobs

(3) The requirements and performance/storage impacts on the BMC:

a) The collection should not be too taxing on the processing/storage
resources on the BMC

b) The data transfer process should not be too taxing on the link between
the host and BMC
  - For the metrics we have and the IPMI connection we're using so far, it
took around 10 ~ 100ms for the host to collect a metric. The time is
dominated by IPMI transfer time. The time is considered acceptable if a
metric is collected at a reasonably long interval, say, every 30 minutes.


We hope the above contents help complement the existing design proposal,
and would like to help actually start implementing (and deploying) health
monitoring for the BMC.
The question is: we're working on our implementation and we're wondering
what would be a good time for us to send it for review? Do we need to
support both what we have now and what is being proposed?

Thanks!
Sui

--00000000000079184705a61e8cf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello OpenBMC Mailing List,<br><br>It is great to see the =
proposal on BMC health monitoring! We have similar efforts in health monito=
ring in progress, started doing some implementation, and would like to shar=
e some thoughts with the Mailing List to help get BMC health monitoring sta=
rted:<br><br>(1) What metrics have we considered now?<br><br>We have consid=
ered the following metrics on the BMC:<br>=C2=A0 - Memory usage<br>=C2=A0 -=
 Number of open file descriptors<br>=C2=A0 - Free storage space in the read=
-write file system<br>=C2=A0 - List of processes<br>=C2=A0 - CPU time for a=
 few top processes<br>=C2=A0 <br>=C2=A0 Some of these are inspired by vario=
us profilers, and some others are expected to be relevant to the typical wo=
rkloads running on the BMC.<br><br>(2) Overall, it appears the design space=
 for health monitoring has the following dimensions:<br><br>a) A method to =
do the collection, which might be:<br>=C2=A0 - Running a program like &quot=
;df&quot; to get free disk space<br>=C2=A0 - Traversing some folder to comp=
ute some statistics<br>=C2=A0 - Monitor some bus for some time and generate=
 some result<div>=C2=A0 - or something else<br><div>=C2=A0 <br>=C2=A0 The c=
ollection process might vary from metric to metric, and can take some time =
to complete on the BMC, and therefore, the results need=C2=A0to be staged s=
omewhere and made accessible when it&#39;s completed, so the requestor won&=
#39;t have to busy-wait.<br><br>b) A way to stage monitoring data on the BM=
C, which might be:<br>=C2=A0 - Files or databases in DRAM or some persisten=
t store.<br>=C2=A0 - DBus objects, as described in Vijay&#39;s document; th=
is is similar to how sensors work.<br>=C2=A0 - IPMI Blobs (this is what we =
have implemented right now)<div>=C2=A0 - or something else<br>=C2=A0 <br>c)=
 A way to transfer monitoring data out of the BMC, which might be:<br>=C2=
=A0 - scp<br>=C2=A0 - RedFish<br>=C2=A0 - IPMI (this is what we&#39;re usin=
g right now)<div>=C2=A0 - or something else<br>=C2=A0 <br>d) Format of stag=
ed data:<br>=C2=A0 - Raw bytes<br>=C2=A0 - Protocol buffers<br>=C2=A0 - JSO=
N objects<br>=C2=A0 - or something else<br>=C2=A0 - The data may be compres=
sed to save transfer time<br>=C2=A0<br>e) A way to consume the health monit=
oring data:<br>=C2=A0 - The BMC might do some pre-processing, like windowed=
 average.<br>=C2=A0 - The BMC may perform certain corrective measures when =
metrics appear abnormal.<br>=C2=A0 - The host may perform certain correctiv=
e measures when metrics appear abnormal.<br>=C2=A0 - BMC health data might =
be plugged into some already existing monitoring framework overseeing a lar=
ge number of machines, collecting historical data, and projecting future tr=
ends, etc.<br><br>f) A way to configure the health monitoring system:<br>=
=C2=A0 - Configuration for which metrics are collected<br>=C2=A0 - Configur=
ation for the choice of staging in b), way of transfer in c), and frequency=
 of collection in e)<br>=C2=A0 - Some configurations may be build-time and =
some may be run-time<br>=C2=A0 =C2=A0 =C2=A0- I guess we can draw some insp=
irations from phosphor-ipmi-blobs<br><br>(3) The requirements and performan=
ce/storage impacts on the BMC:<br><br>a) The collection should not be too t=
axing on the processing/storage resources on the BMC<br><br>b) The data tra=
nsfer process should not be too taxing on the link between the host and BMC=
<br>=C2=A0 - For the metrics we have and the IPMI connection we&#39;re usin=
g so far, it took around 10 ~ 100ms for the host to collect a metric. The t=
ime is dominated by IPMI transfer time. The time is considered acceptable i=
f a metric is collected at a reasonably long interval, say, every 30 minute=
s.<br>=C2=A0 <br><br>We hope the above contents help complement the existin=
g design proposal, and would like to help actually start implementing (and =
deploying) health monitoring for the BMC.<br>The question is: we&#39;re wor=
king on our implementation and we&#39;re wondering what would be a good tim=
e for us to send it for review? Do we need to support both what we have now=
 and what is being proposed?<br><br>Thanks!<br>Sui<br></div></div></div></d=
iv></div>

--00000000000079184705a61e8cf7--
