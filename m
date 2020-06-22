Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0141120335D
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 11:32:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49r42G1lldzDqXt
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 19:32:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::136;
 helo=mail-il1-x136.google.com; envelope-from=maruthi.inukonda@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UlueNXAt; dkim-atps=neutral
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49r40j6F7mzDqX3
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2020 19:31:14 +1000 (AEST)
Received: by mail-il1-x136.google.com with SMTP id t8so15235037ilm.7
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2020 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NPJgIl7BfRrGouZsZAL6jLQUmr+WVxXfdJizDBn4kG8=;
 b=UlueNXAt8Y6U98ZH/lSEQOfWDtMgeMPCBvP+E26OYa73IG+3jqXIzJztZHoR37v9H+
 R50INg/b7Ktq5ozWdBUVxWnOfeenENzOEL4dnMjZgbsMmYIdD1Z3LG0RILLiqTons4PG
 2cr3gSmEyRIN7KOxUbBQDhTlhvpvgBy5+55Voxu94WyEmLj1K9PjwrVwG776lw+j9ABC
 HRVeHCV4TMtRwCuCnng33o9ziNxVNbOlCH0jBFZgQdT4rn5rt6jwKMbGNRQGn2ia7sHm
 0VRZKtpo+07T/fZ6vH6NjJdeH128w1aogm0/839+WoEGkeB0BXXipkzPWWdzOTMzQ4tV
 lYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NPJgIl7BfRrGouZsZAL6jLQUmr+WVxXfdJizDBn4kG8=;
 b=eFQhfqc+uvPdZ6FFli1lclIdTzLKbBtzsLaZ0KghpjxonX9lx5Aj6fSHwaHbuxVVTX
 s/dFTY4UjRJtwPUJkaglycCSykkAhk6a5Lz5dmaMGJ/YmC2W4juaxNGoLwi2chgL/r8K
 suFzgOi2wZaoL4tb0LA5P/KyyOD2b6r2JVgiNZtr18kI3yH/O3liWWufeTM0wCUz1CmT
 FlxoqgZxi3ZU8a6RY+S2ozGMReZTAb7s17AuW1VNz2IcJro/qanX0wTzRlNeEV094PUO
 GM0sYdRBjpIyVJEsgcJf0jvMsOAYxtdf3n0Uy5fC8Qv/0VisMhKCLcDlOEzWHKFwOaIC
 Oi6g==
X-Gm-Message-State: AOAM530gc7UMp3PB2olVTSPbctSBJztY0h9EmxyEQHSJ1ov7+dXtY39w
 WX24yRsHuU/h28lGyXRGhO2b5R/7/eLLbnGb78HHFRZ1yVI=
X-Google-Smtp-Source: ABdhPJxwa6+DwxvLz9V75KFxdm+T+iD0NuXtJIEkDItL7Ll4qxcq36WbqwBL2MdHWucCBPMr6UrSdZIdx9qFIUgekZ8=
X-Received: by 2002:a92:b00f:: with SMTP id x15mr15099620ilh.27.1592818270413; 
 Mon, 22 Jun 2020 02:31:10 -0700 (PDT)
MIME-Version: 1.0
From: Maruthi Inukonda <maruthi.inukonda@gmail.com>
Date: Mon, 22 Jun 2020 15:00:59 +0530
Message-ID: <CA+chFt3FKpVPWiWX_sGk8jsYZKwvc-W+hH60br1O0QW=gd=sZg@mail.gmail.com>
Subject: Regarding 19" server recommendations with OpenBMC support
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000003326fd05a8a8e794"
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

--0000000000003326fd05a8a8e794
Content-Type: text/plain; charset="UTF-8"

hello Team,

I am Maruthi, doing applied-research in bare-metal cloud and built a
bare-metal cloud with many servers (having proprietary BMC) from 10
different OEMs in our campus all with open-source. I see many pain points
of deploying/operating a bare-metal with opaque BMC firmware. I found
OpenBMC is the way to go for bare-metal clouds for more visibility and
agility. In parallel to my research, I would like to contribute to OpenBMC
upstream.

We want to procure production grade 19" rack servers that support OpenBMC.
Looking for both amd64/x8_64 and OpenPower based servers. We are looking
for a server whose motherboard has replaceable SPI flash. Any
recommendations please?

We procured portwell neptune dev kit for basic testing of small code
changes. But looking for production servers as well.

thanks,
Maruthi.
IIT Hyderabad, India
-- 
profile: http://www.linkedin.com/in/maruthisi

--0000000000003326fd05a8a8e794
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hello Team,</div><div><br></div><div>I am Maruthi, do=
ing applied-research in bare-metal cloud and built a bare-metal cloud with =
many servers (having  proprietary BMC) from 10 different OEMs in our campus=
 all with open-source. I see many pain points of deploying/operating a bare=
-metal with opaque BMC firmware. I found OpenBMC is the way to go for bare-=
metal clouds for more visibility and agility. In parallel to my research, I=
 would like to contribute to OpenBMC upstream.<br></div><div><br></div><div=
> We want to procure production grade 19&quot; rack servers that support Op=
enBMC. Looking for both amd64/x8_64 and OpenPower based servers. We are loo=
king for a server whose motherboard has replaceable SPI flash. Any recommen=
dations please?<br></div><div><br></div><div>We procured portwell neptune d=
ev kit for basic testing of small code changes. But looking for production =
servers as well.<br></div><div><br></div><div>thanks,</div><div>Maruthi.</d=
iv><div>IIT Hyderabad, India<br>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">profile: <a href=
=3D"http://www.linkedin.com/in/maruthisi" target=3D"_blank">http://www.link=
edin.com/in/maruthisi</a></div></div></div></div>

--0000000000003326fd05a8a8e794--
