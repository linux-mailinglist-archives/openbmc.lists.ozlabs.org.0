Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C6C593DE
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 07:57:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZmHn3JgTzDqtl
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 15:57:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="acRmVmPj"; 
 dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zm9J3YwJzDqKD
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 15:51:31 +1000 (AEST)
Received: by mail-io1-xd31.google.com with SMTP id w25so10003002ioc.8
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2019 22:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=fGval6BRS8MgficOwXaTXp99GErEFUR/ZZ/ispEDo8k=;
 b=acRmVmPjCh4gC6XVR1pBgQySheRZVaGj8kgQ5lDMI74LjLzGOw6XeLsHR+OgfaOF6s
 RFlJMndE32wLbe0LhWJgOsvWB7o0b5uJVv5BroSk6FxdI/9amO1gzuKOHfPf9TM/FF1/
 s9HorqzTce9XwY7fnDIFzOYXqlYS8lpstqlohVyFhpF1hDbsF5+bBx4ibh5qekwhtJUV
 Fx20wN+9ocefNMmqxA7K+dAx5R9B5zZqd6wqLkU15aw2LOz0G2RWKnLcBhk9xXn5fawW
 LLaTz0ThxbRSqUMKndyJ9cHJ6+TWBkmpfitchPXrI8PmgPWzbi2MTTM+IotkhRG5fmaC
 shmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=fGval6BRS8MgficOwXaTXp99GErEFUR/ZZ/ispEDo8k=;
 b=Mj+aqMi4ceEOR/tJyM3j2p0nD+hP1iuYsubM6Gb1Lq73OsHMg6xChulQ62oP7U7Q21
 hB8I10bcT1mdPK7HC1gF72qFH/414LDJYw1a3zBHmehJZ/IVHLg0YxTcPJT+yDvV300K
 ylvo/Lwx80h877dmE1hG28qOqgZcRNQvi7r3HsWr9lpxqTVbBVEhVycCyuA7t7MyopmV
 Lj+6SM5Eu/fj/xXlfNcFlF3m8EccpjPushLUL7GB5awOzq9Y5IIt9m+1f3Vc/Ak5DnZP
 pOoEzjOU04lY6eYHWTH0txo434oWEyDlR1R/QkVUcT5hz6e+CMhnHuwHDnzNiXT/WzPT
 02jw==
X-Gm-Message-State: APjAAAW88pl9iMqgAAETt12kFDDtYBKswQYX8mFp/StPHgSGMAtaTfXO
 CHCQhkMmrR4YPwmTVdBVQf8kBwvkxhAX4uxe7vr3vy1ZqDCxow==
X-Google-Smtp-Source: APXvYqzR25Cgh2rknxttQxLv/sUvaiFupT72X+utAXod2Fnx35hb0l9oIVIitU3NT0pNKDSb346GjDeLTi5i7QYyuxQ=
X-Received: by 2002:a5e:8b43:: with SMTP id z3mr2132936iom.287.1561701088192; 
 Thu, 27 Jun 2019 22:51:28 -0700 (PDT)
MIME-Version: 1.0
From: Kun Yi <kunyi@google.com>
Date: Thu, 27 Jun 2019 22:51:03 -0700
Message-ID: <CAGMNF6Xdkf8Obp8iLVajt21ZT81RAuGksper_u-w9Fvt_OrCZA@mail.gmail.com>
Subject: Integrate collectd with OpenBMC
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000009be72c058c5bdef8"
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
Cc: Gabriel Matute <gmatute@google.com>, Neeraj Ladkani <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009be72c058c5bdef8
Content-Type: text/plain; charset="UTF-8"

Hello there,

In the context of reporting BMC performance metrics, my intern Gabriel
(cc'ed here) and I have started looking at integrating collectd as a
metrics collection tool on OpenBMC. We have got it running, which is
trivial, but the next question is how to report the data.

We have thought about it and thinks implementing a D-Bus interface to be
the most flexible approach. At first, we could implement a snapshot
(instantaneos read) interface. It would then be fairly straightforward to
add them as Redfish/IPMI sensors.

There are two ways to do this:
1. Implement as a collectd "D-Bus" plugin [1]. Collectd supports writing
custom plugins which are C files calling the internal plugin APIs. Could
probably use sdbus to implement.

+ could potentially be upstreamed to collectd
- the code probably will live in a downstream fork first, and if it doesn't
end up upstream, maintaining could become an issue since collectd plugin
API is not guaranteed stable
- C

2. Implement as an interposer daemon that translates between one of the
formats that collectd supports (unix socket, plaintext, RRDTool..) to D-Bus

+ project could be purely OpenBMC
+ can use sdbusplus
- another daemon

Any advice on this? Currently we are leaning towards the first approach,
but do you agree the D-Bus plugin is general enough to be of interest to
the upstream collectd community?

I can definitely reach out to the collectd group but just want to ask here
first :)

[1] Collectd plugins:
https://collectd.org/wiki/index.php/Plugin_architecture
-- 
Regards,
Kun

--0000000000009be72c058c5bdef8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello there,<br clear=3D"all"><div><br></div><div>In the c=
ontext of reporting BMC performance metrics, my intern Gabriel (cc&#39;ed h=
ere) and I have started looking at integrating collectd as a metrics collec=
tion tool on OpenBMC. We have got it running, which is trivial, but the nex=
t question is how to report the data.</div><div><br></div><div>We have thou=
ght about it and thinks implementing a D-Bus interface to be the most flexi=
ble approach. At first, we could implement a snapshot (instantaneos read) i=
nterface. It would then be fairly straightforward to add them as Redfish/IP=
MI sensors.</div><div><br></div><div>There are two ways to do this:</div><d=
iv>1. Implement as a collectd &quot;D-Bus&quot; plugin [1]. Collectd suppor=
ts writing custom plugins which are C files calling the internal plugin API=
s. Could probably use sdbus to implement.</div><div><br></div><div>+ could =
potentially be upstreamed to collectd</div><div>- the code probably will li=
ve in a downstream fork first, and if it doesn&#39;t end up upstream, maint=
aining could become an issue since collectd plugin API is not guaranteed st=
able</div><div>- C</div><div><br></div><div>2. Implement as an interposer d=
aemon that translates between one of the formats that collectd supports (un=
ix socket, plaintext, RRDTool..) to D-Bus</div><div><br></div><div>+ projec=
t could be purely OpenBMC<br></div><div>+ can use sdbusplus</div><div>- ano=
ther daemon</div><div><br></div><div>Any advice on this? Currently we are l=
eaning towards the first approach, but do you agree the D-Bus plugin is gen=
eral enough to be of interest to the upstream collectd community?</div><div=
><br></div><div>I can definitely reach out to the collectd group but just w=
ant to ask here first :)</div><div><br></div><div>[1] Collectd plugins:=C2=
=A0<a href=3D"https://collectd.org/wiki/index.php/Plugin_architecture">http=
s://collectd.org/wiki/index.php/Plugin_architecture</a></div>-- <br><div di=
r=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div=
 dir=3D"ltr">Regards,<div>Kun</div></div></div></div>

--0000000000009be72c058c5bdef8--
