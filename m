Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2178A36CE
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 14:29:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Kf1f2L81zDqdd
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 22:29:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="A/NqXPOW"; 
 dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Kf0p5YyrzDr44
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 22:28:56 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id v12so5161814oic.12
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kdQD/uzCtp+Z02/KxcDgfOgKfmVdhe+a6n2EfpvEM7g=;
 b=A/NqXPOW5YVzn1mTgtIGGwJs0s21mA71FBsRk81yKTPYWoyPwLonq9gE6Qilt8L8rg
 B70z9j4kDl/DzuZydXJCXNdAwfLgUZBl3LestC1/aZ56BixobllpA+pumowfHU2ycH5+
 cE2EdxzdRM4GXjbKotg/ExAUkB8iRNNY40d9MGN8IFH0gMspoFTI4idlXiwCy+4nHgX1
 9gR2RhS4iPKM3G4qoXc3+7L3Pu4er436tO/Uhhsn7j4ZVM24v7cFOVpo9iOdDMZueAI9
 AmamHJ/6k1yOFQtOOnCgsiVTIG5LtMPgX/BWEixdLlm90NA5CZyjhmLK5mSjX8rJG738
 RPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kdQD/uzCtp+Z02/KxcDgfOgKfmVdhe+a6n2EfpvEM7g=;
 b=m8egku/JTWS5ejQgzn8UndFrQ3ZmTUjk8KHcRkJonEZ+tg/2xAeLwZU2k7KUAPMCBU
 znfR/wq5wTHBXQNl3b8v+fZlEGSeLey0xK01/ga6XgircTTRc/SGU0YW7Z1GxSqCpY1J
 gCWtDjqmpdZsd1Wm5PyDV1JK0a+utB2R2Y5oFRntm+20XyUgu+VPU2FVDhxcTB4dpHcu
 4PiT+peYkoKSTtHnjaxG2FumljG1FcVi6s0xqttKcNaWnbFMourRfgyBC4606/pFYQ5O
 qWPwJi3IQBQTH/bTurfwYNbNUR1BHfhm/yiXKl0tcG5vfZeME5Ovb7H37NRJvYE9uE6Z
 4TMw==
X-Gm-Message-State: APjAAAWOzc+BiapshYlXNbbUD8fks25kPl00Ijtvf/ge5rxUFbshvHX1
 zY2b4kT13Iz70+714LtFiyi/J+hl/EFVaPfjsbCwoJQy
X-Google-Smtp-Source: APXvYqwbAZM2GMrvA/Ry92FDK304G+z+41hZw9eORCGYT+wbwgpNvWyvJzMIP2p5AaRpPn4e41EOR1JrSV0gc1ror0k=
X-Received: by 2002:aca:cfce:: with SMTP id f197mr9426828oig.122.1567168132955; 
 Fri, 30 Aug 2019 05:28:52 -0700 (PDT)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Fri, 30 Aug 2019 17:57:03 +0530
Message-ID: <CAE33tLEzV8+n+cFVtnr0vYynsqn42+5APTtojHqWGb8A5GyG2g@mail.gmail.com>
Subject: Cannot connect to console server in s2600wf
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000de420a059154c39f"
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

--000000000000de420a059154c39f
Content-Type: text/plain; charset="UTF-8"

Hi all,

I am using OpenBMC Linux with s2600wf configuration.

When I tried to execute 0bmc-console-client the following error came.

root@s2600wf:~# obmc-console-client

obmc-console-client: Can't connect to console server: Connection refused

in *ps* command output also obmc-console-server not found.


Thanks,

Akash

--000000000000de420a059154c39f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>I am using OpenBMC L=
inux with s2600wf configuration.</div><div><br></div><div>When I tried to e=
xecute 0bmc-console-client the following error came.</div><div><br></div><d=
iv>root@s2600wf:~# obmc-console-client =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>obmc-console-client: Can&=
#39;t connect to console server: Connection refused</div><div><br></div><di=
v>in <i>ps</i> command output also obmc-console-server not found.</div><div=
><br></div><div><br></div><div>Thanks,</div><div><br></div><div>Akash<br></=
div></div>

--000000000000de420a059154c39f--
