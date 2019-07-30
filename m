Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FF07B10D
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 20:00:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ykqK5yzKzDqXG
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 04:00:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gar0y/Jd"; 
 dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ykpf13f2zDqS3
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 03:59:37 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id j199so23504772ybg.5
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 10:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vl/uBG2ACzEZxfBmG2Lsj8iM9b1Pgy/Lhv0Bkba34n8=;
 b=Gar0y/JdBNu/YGj4nNOoeRSyqpxTALa9CPIDRLXGUd1bcfN0Z3X8bMUZ0DKERmsDBo
 hRjqfMeviqo4wasmc/na4/8YRdmdX8hJopsC6NLyhOOHb9og4/4ox+qTo39eMeAeLBm4
 R9NrOARDKL/T51ZTqXwCjGIL/Kv8/77So/DYwgzF/GnPbNDLiGm5bsscS/7xLgZ+F+s/
 kuGENYBMhLrM4nNaQGJ06U3jGS9RVLeCNovfH0Sa8V5RXZM/qJpBoUIeu9dzCs9lO0f2
 qOIq3MNGn/+8zngJpOApCkz+O2BMyRBqO440Er6MBUcjz4BLjS6Qv05WBH/vzG90Yrz+
 8JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vl/uBG2ACzEZxfBmG2Lsj8iM9b1Pgy/Lhv0Bkba34n8=;
 b=stqSLdjQHZiW1WF/mK2GiZ3HCiXNA3VOSnj//qOdW9Wxkz0nwl9xYz0xKGJtA+LJ5k
 UGJPU3nb7y6DtFBaDOOqidHrckBb42fRFShSMTAr++Z98zo2uvlfzCsX/AKTOE8vNwhc
 goK33fNeKA3kRVXx9czjDNlybbb2Gls580AoDARDrc/OI4c59+PM6Ad4RiwQdtybsr9+
 l1cZ/sDnLsK8TpxOF8oMp1dYj4OsdLoWw8dD495iLkpfkgveLqhjgdifgTFsuUf4NKev
 RDUWXxuwl4YAOipfy9NgXGfT3Y9GprElH6fPG6lhDDYNSfaqdni5u44JL2C7wKXSq27a
 /Hvw==
X-Gm-Message-State: APjAAAV4qAh6nnP1c57vhOkSLXfZAc6I9SWf7q7PEVwwUOq3Y0I1wHaL
 30uVWNYhlcH3GqJ+t7AWdKQOzzlo8Fd7MoxAFfjsi+7s
X-Google-Smtp-Source: APXvYqxQM9hKoow6/WP5dHsy0OOaeVMFrbhssEMLkIC6E+1ooSCbgkfUNTZMkC/5MXrsK+m5FlX6rB7ohhtbmfwiO/A=
X-Received: by 2002:a25:678b:: with SMTP id
 b133mr69948553ybc.157.1564509573901; 
 Tue, 30 Jul 2019 10:59:33 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Tue, 30 Jul 2019 12:59:23 -0500
Message-ID: <CAMTupoQti03V7MJmDQgpJP3coVeUbdXRxoPSYzfoow0j_YsMdA@mail.gmail.com>
Subject: GUI workgroup - this Wednesday Jul 31 at 10AM CST
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Wang,
 Kuiying" <kuiying.wang@intel.com>
Content-Type: multipart/alternative; boundary="000000000000667494058ee9c508"
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

--000000000000667494058ee9c508
Content-Type: text/plain; charset="UTF-8"

Hello all,

The GUI design workgroup will be meeting this Wednesday July 31 at 10:00AM
CST.

Tentative agenda:

   1. Review Firmware code update designs
   2. Review Local User Management development
   3. Review Server Power Operations designs
   4. Share CPU/GPU Throttling designs
   5. Review Event Logs designs
   6. Proposals to the navigation structure
   7. IF THERE IS INTEL REPRESENTATION - Updates on Intel-specific icon
   changes mentioned last meeting (Intel)
   8. IF THERE IS INTEL REPRESENTATION - Share research findings and
   updates on design layout (Intel)

Please add any other agenda items here:
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

As a note, attendance has been solely IBM community members. We would love
to have others join.

Meeting Link:
https://ibm.webex.com/ibm/j.php?MTID=m49792ce33d5af28f2823638d351732f3

Best,
GUI Design Team

--000000000000667494058ee9c508
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><span style=3D"background-color:transparent=
"><font face=3D"verdana, sans-serif">Hello all,=C2=A0</font></span></div><d=
iv><span style=3D"background-color:transparent;color:rgb(36,41,46)"><font f=
ace=3D"verdana, sans-serif"><br></font></span></div><div><span style=3D"bac=
kground-color:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-=
serif">The=C2=A0<span class=3D"gmail-m_-5804247812878174296gmail-m_-4492976=
450962714341gmail-m_-1492632449708843752gmail-il">GUI</span>=C2=A0design=C2=
=A0<span class=3D"gmail-m_-5804247812878174296gmail-m_-4492976450962714341g=
mail-m_-1492632449708843752gmail-il">workgroup</span>=C2=A0will be meeting =
this Wednesday July 31 at 10:00AM CST.=C2=A0</font></span></div><div><span =
style=3D"background-color:transparent;color:rgb(36,41,46)"><font face=3D"ve=
rdana, sans-serif"><br></font></span></div><div><font color=3D"#24292e" fac=
e=3D"verdana, sans-serif">Tentative agenda:=C2=A0</font></div></div><div><o=
l><li style=3D"margin-left:15px"><font face=3D"verdana, sans-serif">Review =
Firmware code update designs</font></li><li style=3D"margin-left:15px"><fon=
t face=3D"verdana, sans-serif">Review Local User Management development</fo=
nt></li><li style=3D"margin-left:15px"><font face=3D"verdana, sans-serif">R=
eview Server Power Operations designs</font></li><li style=3D"margin-left:1=
5px"><font face=3D"verdana, sans-serif">Share CPU/GPU Throttling designs</f=
ont></li><li style=3D"margin-left:15px"><font face=3D"verdana, sans-serif">=
Review Event Logs designs</font></li><li style=3D"margin-left:15px"><font f=
ace=3D"verdana, sans-serif">Proposals to the navigation structure</font></l=
i><li style=3D"margin-left:15px"><font face=3D"verdana, sans-serif">IF THER=
E IS INTEL REPRESENTATION - Updates on Intel-specific icon changes mentione=
d last meeting (Intel)</font></li><li style=3D"margin-left:15px"><font face=
=3D"verdana, sans-serif">IF THERE IS INTEL REPRESENTATION -=C2=A0Share rese=
arch findings and updates on design layout (Intel)</font></li></ol></div><d=
iv><div><font face=3D"verdana, sans-serif">Please add any other agenda item=
s here:=C2=A0<a href=3D"https://github.com/openbmc/openbmc/wiki/GUI-Design-=
work-group" target=3D"_blank">https://github.com/openbmc/openbmc/wiki/<span=
 class=3D"gmail-m_-5804247812878174296gmail-m_-4492976450962714341gmail-m_-=
1492632449708843752gmail-il">GUI</span>-Design-<span class=3D"gmail-m_-5804=
247812878174296gmail-m_-4492976450962714341gmail-m_-1492632449708843752gmai=
l-il">work</span>-<span class=3D"gmail-m_-5804247812878174296gmail-m_-44929=
76450962714341gmail-m_-1492632449708843752gmail-il">group</span></a></font>=
</div><div><font face=3D"verdana, sans-serif"><br></font></div><div><font f=
ace=3D"verdana, sans-serif">As a note, attendance has been solely IBM commu=
nity members. We would love<br>to have others join.<br></font></div><div><f=
ont face=3D"verdana, sans-serif"><br></font></div><div><font face=3D"verdan=
a, sans-serif"><span style=3D"box-sizing:border-box;color:rgb(36,41,46)">Me=
eting Link</span><span style=3D"color:rgb(36,41,46)">:=C2=A0</span><a href=
=3D"https://ibm.webex.com/ibm/j.php?MTID=3Dm49792ce33d5af28f2823638d351732f=
3" rel=3D"nofollow" target=3D"_blank" style=3D"color:rgb(3,102,214);box-siz=
ing:border-box;text-decoration-line:none">https://ibm.webex.com/ibm/j.php?M=
TID=3Dm49792ce33d5af28f2823638d351732f3</a><br style=3D"box-sizing:border-b=
ox;color:rgb(36,41,46)"></font></div><div><font face=3D"verdana, sans-serif=
"><br></font></div><div><span style=3D"background-color:transparent;color:r=
gb(36,41,46)"><font face=3D"verdana, sans-serif">Best,</font></span></div><=
div><span style=3D"background-color:transparent;color:rgb(36,41,46)"><font =
face=3D"verdana, sans-serif"><span class=3D"gmail-m_-5804247812878174296gma=
il-m_-4492976450962714341gmail-m_-1492632449708843752gmail-m_-2158016735816=
270648gmail-m_-274210038052043966gmail-m_6525215738950614323gmail-m_-617251=
0825241159069gmail-il"><span class=3D"gmail-m_-5804247812878174296gmail-m_-=
4492976450962714341gmail-m_-1492632449708843752gmail-il">GUI</span></span>=
=C2=A0<span class=3D"gmail-m_-5804247812878174296gmail-m_-44929764509627143=
41gmail-m_-1492632449708843752gmail-m_-2158016735816270648gmail-m_-27421003=
8052043966gmail-m_6525215738950614323gmail-m_-6172510825241159069gmail-il">=
Design</span>=C2=A0Team=C2=A0</font></span></div></div></div></div>

--000000000000667494058ee9c508--
