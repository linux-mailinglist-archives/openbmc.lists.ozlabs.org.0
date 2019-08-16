Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF03A4CD5
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:35:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MB2G359DzDqS9
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:35:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dropbox.com
 (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=shobe@dropbox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=dropbox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dropbox.com header.i=@dropbox.com header.b="oASf52ph"; 
 dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468pzs52sfzDr0m
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 13:42:29 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id y8so186874wrn.10
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 20:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dropbox.com; s=corp;
 h=mime-version:from:date:message-id:subject:to;
 bh=Xs6dG3DhgGisUrJy13+7eYanjcelANiFXhPUs15UPxU=;
 b=oASf52pho8GUwmqcvWhPl8FPI/NlkQkr1rhzb9omxrq0i96IBH5cWdX23cnzgEbmEa
 nyoMCGjoF38U/RrZoFVT9/tEUgmtLGJeOzmCsAhSg9kcPwLXVx1jnBaWFLjZuz6S58r6
 bi25J0OBx6uA6jK75y0n+vk84n9kkRJ44h0C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Xs6dG3DhgGisUrJy13+7eYanjcelANiFXhPUs15UPxU=;
 b=mVkCMTzbE6Vtl0f3VtJMeIypdjM3uBSEECcEeNyLizzZsMHQLuf4P0aXJ6Dsssz2Or
 f7m+KnchprhBW92FYY+yOMf7YtBtwHKOkzFlrHXKwyCmZrRphufJolO3317VL9NkT317
 IrJgbSExgxtSZEmZacHfvlGZluyb0C28NJDvoCm3L6W5KKhIGLZoMsByjJP+XS8ffOiO
 0Z0GlnoiSBnDP13jjDE69yMyUKJgdCnf0w8NLXgJMZl0x14AAx1xvTRscm+uVfktjBuy
 eFFOaVlmspw1Hl6kuWiTXTzYAT9kHoHmXaIiKRxNaAxhB5QFLY4cqlS8dzWkaVeJ+xx3
 3zYQ==
X-Gm-Message-State: APjAAAW1AH5i0Q5DGiS8N+Uk8qI1WcxUsJ+Q9ruJhZZ/qPuH7437JLwD
 8Fovp0N49RIrw44FNcMn+5QtPLlDXtPXjkvhr1w0
X-Google-Smtp-Source: APXvYqxtlD2ZTTgxCc+2fpxXP3nwGVnsd667umtYDoh075F4GRlVBioKzAt9afq2PBkoANcY0zLg8GTz1Yth0iag66c=
X-Received: by 2002:a5d:6606:: with SMTP id n6mr8466540wru.346.1565926942345; 
 Thu, 15 Aug 2019 20:42:22 -0700 (PDT)
MIME-Version: 1.0
From: Eric Shobe <shobe@dropbox.com>
Date: Thu, 15 Aug 2019 20:42:10 -0700
Message-ID: <CALo0W=u_Cznj5dtzh0Cc5u9M80WZDMRQ4R0zhbTsRkCT5XAMgA@mail.gmail.com>
Subject: The RunBMC Specification has been published!
To: Jared Mednick <jaredm@dropbox.com>
Content-Type: multipart/alternative; boundary="00000000000024a83b059033c778"
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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

--00000000000024a83b059033c778
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Esteemed colleagues,

We are most pleased to announce that RunBMC,an open Hardware Standard that
defines the interface between the Baseboard Management Controller(BMC)
subsystem and OCP hardware platform - such as network or compute
motherboards, has been officially accepted to the Open Compute Project.  Li=
nk
to the RunBMC 1.4.1 Specification.
<https://www.opencompute.org/documents/ocp-runbmc-daughterboard-card-design=
-specification-v1-4-1-pdf>

We owe credit and thanks to our collaborators at Quanta, Nuvoton, Hyve,
Intel, Aspeed, Facebook, Google, Salesforce, and Microsoft.  I think we can
confidently say that the collaborative spirit meant to be fostered by OCP
is alive and well.

Our next steps are to draft and complete a User=E2=80=99s Guide for the Bri=
ng-Up
Vehicle and work with our partners to submit their designs for
daughter-cards based on the AST2500 and Poleg.  We look forward to seeing
the progress of this effort realized through these contributions.

Thanks!

--00000000000024a83b059033c778
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span class=3D"gmail-m_2563781303913535005gmail-autho=
r-d-1gg9uz65z1iz85zgdz68zmqkz84zo2qoxvz75zfxfz86zgwm2hpwz80zz85z1le4iz70zz6=
6zz87z3z76zmz69z3z85zz69zr">Esteemed=C2=A0</span><span class=3D"gmail-m_256=
3781303913535005gmail-thread-140947146019351338598583 gmail-m_2563781303913=
535005gmail-attrcomment gmail-m_2563781303913535005gmail-attrcommentfirst g=
mail-m_2563781303913535005gmail-thread-140947146019351338598583-first gmail=
-m_2563781303913535005gmail-author-d-1gg9uz65z1iz85zgdz68zmqkz84zo2qoxvz75z=
fxfz86zgwm2hpwz80zz85z1le4iz70zz66zz87z3z76zmz69z3z85zz69zr"><span class=3D=
"gmail-m_2563781303913535005gmail-comment-extra-inner-span">colleagues</spa=
n></span><span class=3D"gmail-m_2563781303913535005gmail-author-d-1gg9uz65z=
1iz85zgdz68zmqkz84zo2qoxvz75zfxfz86zgwm2hpwz80zz85z1le4iz70zz66zz87z3z76zmz=
69z3z85zz69zr">,</span></div><div><span class=3D"gmail-m_256378130391353500=
5gmail-author-d-1gg9uz65z1iz85zgdz68zmqkz84zo2qoxvz75zfxfz86zgwm2hpwz80zz85=
z1le4iz70zz66zz87z3z76zmz69z3z85zz69zr"><br></span></div><div></div><div><s=
pan class=3D"gmail-m_2563781303913535005gmail-author-d-1gg9uz65z1iz85zgdz68=
zmqkz84zo2qoxvz75zfxfz86zgwm2hpwz80zz85z1le4iz70zz66zz87z3z76zmz69z3z85zz69=
zr">We are most pleased to announce that RunBMC,an open Hardware Standard t=
hat defines the interface between the Baseboard Management Controller(BMC) =
subsystem and OCP hardware platform - such as network or compute motherboar=
ds, has been officially accepted to the Open Compute Project. =C2=A0</span>=
<span class=3D"gmail-m_2563781303913535005gmail-attrlink gmail-m_2563781303=
913535005gmail-url gmail-m_2563781303913535005gmail-author-d-1gg9uz65z1iz85=
zgdz68zmqkz84zo2qoxvz75zfxfz86zgwm2hpwz80zz85z1le4iz70zz66zz87z3z76zmz69z3z=
85zz69zr"><a class=3D"gmail-m_2563781303913535005gmail-attrlink" href=3D"ht=
tps://www.opencompute.org/documents/ocp-runbmc-daughterboard-card-design-sp=
ecification-v1-4-1-pdf" rel=3D"noreferrer nofollow noopener" target=3D"_bla=
nk">Link to the RunBMC 1.4.1 Specification.</a></span></div><div><br></div>=
<div></div><div><span class=3D"gmail-m_2563781303913535005gmail-author-d-1g=
g9uz65z1iz85zgdz68zmqkz84zo2qoxvz75zfxfz86zgwm2hpwz80zz85z1le4iz70zz66zz87z=
3z76zmz69z3z85zz69zr">We owe credit and thanks to our collaborators at Quan=
ta, Nuvoton, Hyve, Intel, Aspeed, Facebook, Google, Salesforce, and Microso=
ft.=C2=A0 I think we can confidently say that the collaborative spirit mean=
t to be fostered by OCP is alive and well.</span></div><div><span class=3D"=
gmail-m_2563781303913535005gmail-author-d-1gg9uz65z1iz85zgdz68zmqkz84zo2qox=
vz75zfxfz86zgwm2hpwz80zz85z1le4iz70zz66zz87z3z76zmz69z3z85zz69zr"><br></spa=
n></div><div></div><div><span class=3D"gmail-m_2563781303913535005gmail-aut=
hor-d-1gg9uz65z1iz85zgdz68zmqkz84zo2qoxvz75zfxfz86zgwm2hpwz80zz85z1le4iz70z=
z66zz87z3z76zmz69z3z85zz69zr">Our next steps are to draft and complete a Us=
er=E2=80=99s Guide for the Bring-Up Vehicle and work with our partners to s=
ubmit their designs for daughter-cards based on the AST2500 and Poleg.=C2=
=A0 We look forward to seeing the progress of this effort realized through =
these contributions.</span></div><div><span class=3D"gmail-m_25637813039135=
35005gmail-author-d-1gg9uz65z1iz85zgdz68zmqkz84zo2qoxvz75zfxfz86zgwm2hpwz80=
zz85z1le4iz70zz66zz87z3z76zmz69z3z85zz69zr"><br></span></div><div></div><di=
v><span class=3D"gmail-m_2563781303913535005gmail-author-d-1gg9uz65z1iz85zg=
dz68zmqkz84zo2qoxvz75zfxfz86zgwm2hpwz80zz85z1le4iz70zz66zz87z3z76zmz69z3z85=
zz69zr">Thanks!</span></div></div>

--00000000000024a83b059033c778--
