Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ED224910
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 09:36:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457SJJ09HrzDqM3
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 17:36:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=asmithakarun@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oskcKKYQ"; 
 dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457SHq3MFTzDqKw
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 17:36:19 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 15so1713439wmg.5
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 00:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Pk9AiCUyVhjKnH9F/mD2HWARnBoaFkgiYLrP0wcDdto=;
 b=oskcKKYQzFBgVJHEBwF1HPAJFzMNTlDHo49dE/uJ0z/bBCKC9v2lygSgi7GaDW9pOQ
 KHUJ04wGl69KwsveI1UAQEySZHZuv5Fk/1wXbiqAKEz35x4MRTH4p8GpBBVPQw8/rdba
 sOzQCFIZBMubXpHfo8ZokxMMkMqP6P+Pw5/+k0qsnDDfxj9DftUCeRa9GtIeKv4Jj6p3
 vEVFXzRByS1QhndlvuCxlhR+FB1lJZg86GOX1/QSo+3Jl8BmLC8gRvXj7qUmi85G4U+C
 HUAPpDU3thtyGPMZAeQnNrfvuZi6lFdjIgQa80OPjPvUPyrCz8IXpoBmqFS5DxGaoMr4
 s5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Pk9AiCUyVhjKnH9F/mD2HWARnBoaFkgiYLrP0wcDdto=;
 b=FfnL1sNaEv2cDRiCYze4NBI128IC7G8pqN1QOFTEYpJYawVhgsCA8SxWweD1AFn6r3
 tkNXGsRpgW7cLB7clEv6hYBqra42JV0m2YHVG3jeF9OkY0qwF7QdJ66hPGwyGdA92QRu
 vyx4DdMWFLb2saYf0hgEz4GbABdaQSzkn1K2Yk8wi68Tb68aAe56k02wFdekWqDRxjge
 4enKthGyRCs7m/51968+izoZOpynfQoCBFLxIiMdoUbbT6lvY88HnJkSxeS8EEHc4NEc
 eo+2fipt/eWtcg0YvMs5vi/vlW/ttapsw8uGHUffNHmZxbmWApuj8KBxhhoxsMYwEon1
 OR6g==
X-Gm-Message-State: APjAAAVlLgw7mgoye2GuFs48eHI1/Owdz0rjI/GBbSbwM6Unj6vN9K3p
 nBWtzpICH2djto/S6XJ9mB8YMEA919hg2i5Jzv64QCTVyww=
X-Google-Smtp-Source: APXvYqx2E/6q8uBb2J5Cwn7/33bDkfLb3fUNyJYc6ZOSowyI8tJHrBP+u4DKNjXi6MDMnOMY+lwe6HqPzDvgGcS4M38=
X-Received: by 2002:a1c:7216:: with SMTP id n22mr2110496wmc.111.1558424171410; 
 Tue, 21 May 2019 00:36:11 -0700 (PDT)
MIME-Version: 1.0
From: Asmitha Karunanithi <asmithakarun@gmail.com>
Date: Tue, 21 May 2019 13:05:36 +0530
Message-ID: <CANGK-S5uWkTdA1NJ1d5E5WtawK5Wpv=9GfV0JJ3HWfnNTYYMGw@mail.gmail.com>
Subject: Design: Setting a unique hostname to the BMC machine on first boot
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000257990058960e756"
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

--000000000000257990058960e756
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I have been facing a problem and the details of which is mentioned below.

Problem Description:
In OpenBMC, the hostname discovery is done by the avahi Dbus service at the
startup. In a network where there are multiple OpenBMC machines, avahi keeps
getting the hostname conflict and the service name conflict. Hence, the
problem is to find a solution that resolves these conflicts.

Background and References:
The detailed issue regarding the hostname and service name conflicts is
described in the following links.
https://github.com/openbmc/openbmc/issues/1741.
https://lists.freedesktop.org/archives/avahi/2018-January/002492.html
https://github.com/lathiat/avahi/issues/117

Requirements:
None.

Proposed Design:
To solve this, we are proposing a service which assigns a unique hostname to
the BMC and runs on the very first boot. one of the ways to generate the
unique
hostname is to append the machine UUID to the existing default hostname.

Alternatives Considered:
None.

Impacts:
None.

Testing:
None.

If you have any suggestions, please feel free to let me know.
-- 
Thanks & Regards,
Asmitha Karunanithi

--000000000000257990058960e756
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Hi Team,<div><br></div><div>I have been facing a probl=
em and the details of which is mentioned below.=C2=A0</div><div><br>Problem=
 Description:<br>In OpenBMC, the hostname discovery is done by the avahi Db=
us service at the<br>startup. In a network where there are multiple OpenBMC=
 machines, avahi keeps<br>getting the hostname conflict and the service nam=
e conflict. Hence, the<br>problem is to find a solution that resolves these=
 conflicts.<br><br>Background and References:<br>The detailed issue regardi=
ng the hostname and service name conflicts is<br>described in the following=
 links.<br><a href=3D"https://github.com/openbmc/openbmc/issues/1741">https=
://github.com/openbmc/openbmc/issues/1741</a>.<br><a href=3D"https://lists.=
freedesktop.org/archives/avahi/2018-January/002492.html">https://lists.free=
desktop.org/archives/avahi/2018-January/002492.html</a><br><a href=3D"https=
://github.com/lathiat/avahi/issues/117">https://github.com/lathiat/avahi/is=
sues/117</a><br><br>Requirements:<br>None.<br><br>Proposed Design:<br>To so=
lve this, we are proposing a service which assigns a unique hostname to<br>=
the BMC and runs on the very first boot. one of the ways to generate the un=
ique<br>hostname is to append the machine UUID to the existing default host=
name.<br><br>Alternatives Considered:<br>None.<br><br>Impacts:<br>None.<br>=
<br>Testing:<div>None.<br clear=3D"all"><div><br></div><div>If you have any=
 suggestions, please feel=C2=A0free to=C2=A0let me know.</div>-- <br><div d=
ir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><di=
v dir=3D"ltr"><div><div dir=3D"ltr">Thanks &amp; Regards,<div>Asmitha Karun=
anithi</div></div></div></div></div></div></div></div>

--000000000000257990058960e756--
