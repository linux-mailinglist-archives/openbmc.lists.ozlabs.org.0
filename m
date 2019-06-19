Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2BF4AF08
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 02:31:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45T5V56nkJzDqgP
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 10:31:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c2a; helo=mail-yw1-xc2a.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RFaklw8S"; 
 dkim-atps=neutral
Received: from mail-yw1-xc2a.google.com (mail-yw1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45T5Sq3jt4zDqf5
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 10:30:16 +1000 (AEST)
Received: by mail-yw1-xc2a.google.com with SMTP id m16so7516744ywh.12
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 17:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xgmqISk6hX85dcA6R3F8WFzePI2TD4dwn9u7lH2PzlI=;
 b=RFaklw8SFaFvQvRDNuRqXLsHKFJozxSghMk1uqIJUttsehM9/w6+I7+ZjFIy+srhwb
 J2kzJxjIgj6rrIboFUFhKT5W+VhyFkqDRhzUMPkWImbXaPmj69bCDq1WhNf4gBwC+DRq
 s6+vNETPHrn8TYjPqM3r5MNCZjzULCr2FZJHRut+iEmoyBzQCvlu1T9Hd/+4bm+vvZw5
 NS8vff7njvv/b0RQc+GIkCEIRTssnf+zQDLOD17Po3iN/flkdb9dAMnG3ntiieNiYV4m
 z7MbEOgBhEiJvZk71IN7rUerB4zd+a8SxekOysf4GzBIP+SVLbDaMQGA2qNu+E0Jvkdt
 TATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xgmqISk6hX85dcA6R3F8WFzePI2TD4dwn9u7lH2PzlI=;
 b=I5TmmbZi3KzkpRJH+hv+mHySd6IueEloPqOb6f35BeJC57rDUt06Yb+1nmua4IUpSp
 9LpVlGV2BnMRjacxDhSQzbSseF6nGWkdnRkQT4t+UCfeX8paabItsaD53EWBp8tNXch5
 nOQIiv+ppsAc1fI/8M9tN5qrd6XrdJCqBqnIQszyP/SAkDD/oeluVeIcjsSeiPqkyHOW
 XM1StGM9NgvDivLkfOudh18WB9HADuL2676FuN/ZaUklFqabs+85yPz60DG8m0nfvPT0
 afA4ibpmo1Ht3mLPEb96g90QDP/eWvGbuzy/HmznHXhKoZvVLdq43+cO+wufxRIaJIJH
 zVZw==
X-Gm-Message-State: APjAAAWqTpReO12+3y3UgkyucZ8xzCx02K9XAFLNCbVEH3aZuVAs7XAp
 a5qC9fqpBFKTsxnRg2mKxM/PySVjYpJ97QEgeVSH1g48
X-Google-Smtp-Source: APXvYqzEa6a6t6j7jZ7OP2KLMI26hTH+9NbeRF0uthVeKtf7pR38knTNisqSs0X7UWQBCpwrGZ25oP6H4JhyWzRjLQA=
X-Received: by 2002:a81:a453:: with SMTP id b80mr39941701ywh.485.1560904212508; 
 Tue, 18 Jun 2019 17:30:12 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Tue, 18 Jun 2019 19:30:01 -0500
Message-ID: <CAMTupoT_45Zbh04qoMv4RkKpVSBOh7VRfvrEwan9gf13XDNvhQ@mail.gmail.com>
Subject: GUI workgroup meeting - Wednesday 10:30 AM CST
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000001d757b058ba255b3"
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

--0000000000001d757b058ba255b3
Content-Type: text/plain; charset="UTF-8"

Hello all,

The GUI design workgroup meeting will be happening Wednesday June 19 at
10:30AM CST. As there was no attendees last meeting, this week we have the
same agenda.

Tentative agenda:

   1. Updates on Intel-specific icon changes mentioned last meeting (Intel)
   2. Share research findings and updates on design layout (Intel)
   3. Review gathered user feedback on User Management panel and discuss a
   possible redesign (IBM)
   4. Current System log page design features discussion (IBM)

Please add any other agenda items here:
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

Meeting Link:
https://ibm.webex.com/ibm/j.php?MTID=m49792ce33d5af28f2823638d351732f3

Best,
GUI Design Team

--0000000000001d757b058ba255b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><span style=3D"background-color:transparent"><fo=
nt face=3D"verdana, sans-serif">Hello all,=C2=A0</font></span></div><div><s=
pan style=3D"background-color:transparent;color:rgb(36,41,46)"><font face=
=3D"verdana, sans-serif"><br></font></span></div><div><span style=3D"backgr=
ound-color:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-ser=
if">The=C2=A0<span class=3D"gmail-il">GUI</span>=C2=A0design=C2=A0<span cla=
ss=3D"gmail-il">workgroup</span>=C2=A0meeting will be happening Wednesday J=
une 19 at 10:30AM CST. As there was no attendees last meeting, this week we=
 have the same agenda.=C2=A0</font></span></div><div><span style=3D"backgro=
und-color:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-seri=
f"><br></font></span></div><div><font color=3D"#24292e" face=3D"verdana, sa=
ns-serif">Tentative agenda:=C2=A0</font></div></div><div><ol><li style=3D"m=
argin-left:15px"><font face=3D"verdana, sans-serif">Updates on Intel-specif=
ic icon changes mentioned last meeting (Intel)</font></li><li style=3D"marg=
in-left:15px"><font face=3D"verdana, sans-serif">Share research findings an=
d updates on design layout (Intel)</font></li><li style=3D"margin-left:15px=
"><font face=3D"verdana, sans-serif">Review gathered user feedback on User =
Management panel and discuss a possible redesign (IBM)</font></li><li style=
=3D"margin-left:15px"><font face=3D"verdana, sans-serif">Current System log=
 page design features discussion (IBM)</font></li></ol></div><div><div><fon=
t face=3D"verdana, sans-serif">Please add any other agenda items here:=C2=
=A0<a href=3D"https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group=
" target=3D"_blank">https://github.com/openbmc/openbmc/wiki/<span class=3D"=
gmail-il">GUI</span>-Design-<span class=3D"gmail-il">work</span>-<span clas=
s=3D"gmail-il">group</span></a></font></div><div><br></div><div><font face=
=3D"verdana, sans-serif"><span style=3D"box-sizing:border-box;color:rgb(36,=
41,46)">Meeting Link</span><span style=3D"color:rgb(36,41,46)">:=C2=A0</spa=
n><a href=3D"https://ibm.webex.com/ibm/j.php?MTID=3Dm49792ce33d5af28f282363=
8d351732f3" rel=3D"nofollow" target=3D"_blank" style=3D"color:rgb(3,102,214=
);box-sizing:border-box;text-decoration-line:none">https://ibm.webex.com/ib=
m/j.php?MTID=3Dm49792ce33d5af28f2823638d351732f3</a><br style=3D"box-sizing=
:border-box;color:rgb(36,41,46)"></font></div><div><font face=3D"verdana, s=
ans-serif"><br></font></div><div><span style=3D"background-color:transparen=
t;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif">Best,</font></spa=
n></div><div><span style=3D"background-color:transparent;color:rgb(36,41,46=
)"><font face=3D"verdana, sans-serif"><span class=3D"gmail-m_-2158016735816=
270648gmail-m_-274210038052043966gmail-m_6525215738950614323gmail-m_-617251=
0825241159069gmail-il"><span class=3D"gmail-il">GUI</span></span>=C2=A0<spa=
n class=3D"gmail-m_-2158016735816270648gmail-m_-274210038052043966gmail-m_6=
525215738950614323gmail-m_-6172510825241159069gmail-il">Design</span>=C2=A0=
Team=C2=A0</font></span></div></div></div>

--0000000000001d757b058ba255b3--
