Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A29ED1924EE
	for <lists+openbmc@lfdr.de>; Wed, 25 Mar 2020 11:02:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nNw505f4zDqnB
	for <lists+openbmc@lfdr.de>; Wed, 25 Mar 2020 21:02:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12c;
 helo=mail-il1-x12c.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=pRNRoNyu; dkim-atps=neutral
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nNtz6KkfzDqf9
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 21:01:38 +1100 (AEDT)
Received: by mail-il1-x12c.google.com with SMTP id m7so1271903ilg.5
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 03:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=neDZd8Ho9ndDB4NW+kpfLaUMD/FoBcuoDx22D9JbgZ4=;
 b=pRNRoNyu4XFNp9q4hU6urtDn4TGYj80Uk1tFQKOzaKR2TJXGpts687BCg9jVLkKr0M
 xcjqanWbqDB6boOXZSeAPojBRqxKYDRk5cm2CVk49jrnsbL4KZpkQkvK3KMK0OJ/Ek2+
 uNDMXQoda19BZY4u/70YGiK9Tp6r0YyuWcxQXAWH/iQMpRVn5us+8RXr2TIyMPEJQy8L
 pCBjkUIoxzoTZVxPNaPJJmdwZthE0xiWqZ+7heDgJ+088ErdW4IH4POMTXkuagxWeSPn
 E3Hvfhv9mvi5Jbl5zRTxjvZGmrbRJIcEi2YewO419qY6px+0ZRE7MZb3HRTiBO4PTKjO
 hZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=neDZd8Ho9ndDB4NW+kpfLaUMD/FoBcuoDx22D9JbgZ4=;
 b=bqNx0w0mXjBDXdDumKnjLBvqn+/Q5IeCmPXkg7HuHopAMCXKbnx3e4pf+VRUDRVmKw
 bIw+93TOAttgi86lkwRrvIyrcRv+irK6Gt2vsLFe/iKsndxC/DgB1YwN46+kQXkdTjyr
 euRnJDkyRNSbu/UalME8IblcTJRrj0O0/uK19FYcS2bVfrd6ZS/4M3KvRhqBYUyedXNp
 baIWa/JClb2e3yL9PQRkzQ4DYAz1X48lBOXVmog0lQdAJEJk06l8S53NnyMXxrL+pBhZ
 KvpgYEUp4pwmo80ydr8vZOuPXj4mts8Bnl/Sr6VMIC3c+kbqYWBIZTpc7BNJVzzvntmV
 8hDg==
X-Gm-Message-State: ANhLgQ1PMTvOE79LcrhCNWdCnpLaXs5UP7i1H1zsdb1D79NNPe04gnDH
 7jsrG5U8gmUBUlvHRZXz7gFpUzAligifOOKjq+5bcQhOmdE=
X-Google-Smtp-Source: ADFU+vvrQNQ+F/QlEEwzV64N/oY7ePaJUJLEwYoYvLgf7iryPxeyGSYGtvnfH77q2h6QKVOpz60DhORRiW9n9RqzSyY=
X-Received: by 2002:a92:bbc4:: with SMTP id x65mr2784101ilk.82.1585130495216; 
 Wed, 25 Mar 2020 03:01:35 -0700 (PDT)
MIME-Version: 1.0
From: Anton Kachalov <rnouse@google.com>
Date: Wed, 25 Mar 2020 11:01:23 +0100
Message-ID: <CADVsX88r_Jf6+_UXSXOs44n4TVV8kssZ7UxPXJqoJp3AeFNWig@mail.gmail.com>
Subject: SELinux or AppArmor integration status & plans
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000018779105a1aaf485"
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

--00000000000018779105a1aaf485
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm referring to the wishlist:


https://github.com/openbmc/openbmc/wiki/Security-working-group#security-feature-wish-list

that mentions about using the SELinux feature.

What is the current status and plans to integrate either SELinux or
AppArmor?
I'm especially interested in the hardening D-Bus (it can do both: AppArmor
& SELinux).

Thanks!

--00000000000018779105a1aaf485
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I&#39;m referring to =
the wishlist:</div><div><br></div>=C2=A0 =C2=A0<a href=3D"https://github.co=
m/openbmc/openbmc/wiki/Security-working-group#security-feature-wish-list">h=
ttps://github.com/openbmc/openbmc/wiki/Security-working-group#security-feat=
ure-wish-list</a><br><div><br></div><div>that mentions about using the SELi=
nux feature.</div><div><br></div><div>What is the current status and plans =
to integrate either SELinux or AppArmor?</div><div>I&#39;m especially inter=
ested in the hardening D-Bus (it can do both: AppArmor &amp; SELinux).</div=
><div><br></div><div>Thanks!</div></div>

--00000000000018779105a1aaf485--
