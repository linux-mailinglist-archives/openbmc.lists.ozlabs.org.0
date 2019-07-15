Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F0369B67
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 21:30:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nYXj51KKzDqSS
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 05:30:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YFH7dV8w"; 
 dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nYWz12VfzDqSK
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 05:30:05 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 187so6424590ybw.4
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 12:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=S7zKNOUF4iacqCA2wlgFB82QDoPq3oftLsLJViSjGTc=;
 b=YFH7dV8wuOw0hW3JbO2YBR3w+o3q4DGPPAP5kS+bFJ0ggruUn7mir/JXzDKooCDKVq
 fdZN4483dLU7+IH3WY+zmYMtJLbJJwsAf/sEAjF8W1/tNK30xmogvqPzBaa2/IYhTG1p
 Blfimt9YScjt6zX8p8VCAPvLS1OsiYw9oi+KNUucrEvrp+Z6QG7u+fwd/C3S+8UX1aQc
 5wgfhAzi7SvCa5Ii1eC1Evz2FLVmf9WuJ8g9FhfF2Mn7UdyMAzUhmNsjUrpLObJl2h/k
 XqMJJHzdCQPJ4Xj9JkSIrkXquOqCSyhu7v5xBOY9cVlmqXswQUvPiEIh/NjUEjUW1I30
 Z0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=S7zKNOUF4iacqCA2wlgFB82QDoPq3oftLsLJViSjGTc=;
 b=iuYxAk+x3y65SijWiFU4tq017TZtD6dt8oEAunoUGiZ6yrmDM5FYH0PemPdLV0UH2L
 t9l+FwA24ud5f/SR7afcXs7D/rk8xNBOwgxXelNyrer/3hgjb7VG6TG1rpNMUhDVk2QQ
 hGy2IpwoivJqSs2JA8a3QzZg2IqDrpY31zkTL8bA2uYf3Q4Vjz9gp3M0dnUa2Bd7e03l
 32sbDMdaO4y3l8hASRuHGFmIcJgXWO8GIs/gQFyAtny4KJt6oMN/OyBU43jmJRIf4vW8
 EsKyxQuiHijc/4ibYR+M8+Op9OXndo4jMahf3952JDKCNde6Mc80BAiFArgcJhqR3AeB
 lyVQ==
X-Gm-Message-State: APjAAAXr3aJCEFwEReMq78tdJceVD8ICtvxil8Z9F/NuL6B8sJk+w+8c
 IesV1pu3x8jb8DVQbAE56+6evYQ6I/mmD5SBXNxPJCpm
X-Google-Smtp-Source: APXvYqzxTBCnjuTtU/11ucU9vEmKg5WLqnZd0jc/Vu4TIXQGuA4MblE1CqjiBQFo7n8aKsPU1IDom912KTjvutT/nzc=
X-Received: by 2002:a05:6902:508:: with SMTP id
 x8mr18554680ybs.406.1563219001309; 
 Mon, 15 Jul 2019 12:30:01 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Mon, 15 Jul 2019 14:29:50 -0500
Message-ID: <CAMTupoTxeyggc6JBU5EavaHsMj9gQkHaOKy9A5+LLEEwAwjf8A@mail.gmail.com>
Subject: GUI workgroup - this Wednesday Jul 17 at 10AM CST
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Wang,
 Kuiying" <kuiying.wang@intel.com>
Content-Type: multipart/alternative; boundary="000000000000477c45058dbd4972"
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

--000000000000477c45058dbd4972
Content-Type: text/plain; charset="UTF-8"

Hello all,

The GUI design workgroup will be meeting this Wednesday July 17 at 10:00AM
CST.

Tentative agenda:

   1. Review progress on Boot Options front-end development (IBM)
   2. Share initial designs for Firmware (IBM)
   3. Discuss final changes made to Event Logs (IBM)
   4. Discuss final changes for Local User Management panel (IBM)
   5. TENTATIVE - Review progress on IPV4 Network Settings front-end
   development (IBM)
   6. IF THERE IS INTEL REPRESENTATION - Updates on Intel-specific icon
   changes mentioned last meeting (Intel)
   7. IF THERE IS INTEL REPRESENTATION - Share research findings and
   updates on design layout (Intel)

Please add any other agenda items here:
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

As a note, attendance has been solely IBM community members. We would love
to have others join. We are hoping that changing the time from 7:00 AM
Central
to 10:00 AM Central will make that possible for people invested in the
GUI to attend.

Meeting Link:
https://ibm.webex.com/ibm/j.php?MTID=m49792ce33d5af28f2823638d351732f3

Best,
GUI Design Team

--000000000000477c45058dbd4972
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><span style=3D"background-color:transparent"><fo=
nt face=3D"verdana, sans-serif">Hello all,=C2=A0</font></span></div><div><s=
pan style=3D"background-color:transparent;color:rgb(36,41,46)"><font face=
=3D"verdana, sans-serif"><br></font></span></div><div><span style=3D"backgr=
ound-color:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-ser=
if">The=C2=A0<span class=3D"gmail-m_-4492976450962714341gmail-m_-1492632449=
708843752gmail-il">GUI</span>=C2=A0design=C2=A0<span class=3D"gmail-m_-4492=
976450962714341gmail-m_-1492632449708843752gmail-il">workgroup</span>=C2=A0=
will be meeting this Wednesday July 17 at 10:00AM CST.=C2=A0</font></span><=
/div><div><span style=3D"background-color:transparent;color:rgb(36,41,46)">=
<font face=3D"verdana, sans-serif"><br></font></span></div><div><font color=
=3D"#24292e" face=3D"verdana, sans-serif">Tentative agenda:=C2=A0</font></d=
iv></div><div><ol><li style=3D"margin-left:15px"><font face=3D"verdana, san=
s-serif">Review progress on Boot Options front-end development (IBM)</font>=
</li><li style=3D"margin-left:15px"><font face=3D"verdana, sans-serif">Shar=
e initial designs for Firmware (IBM)=C2=A0</font></li><li style=3D"margin-l=
eft:15px"><font face=3D"verdana, sans-serif">Discuss final changes made to =
Event Logs (IBM)</font></li><li style=3D"margin-left:15px"><font face=3D"ve=
rdana, sans-serif">Discuss final changes for Local User Management panel (I=
BM)</font></li><li style=3D"margin-left:15px"><font face=3D"verdana, sans-s=
erif">TENTATIVE - Review progress on IPV4 Network Settings front-end develo=
pment (IBM)=C2=A0</font></li><li style=3D"margin-left:15px"><font face=3D"v=
erdana, sans-serif">IF THERE IS INTEL REPRESENTATION - Updates on Intel-spe=
cific icon changes mentioned last meeting (Intel)</font></li><li style=3D"m=
argin-left:15px"><font face=3D"verdana, sans-serif">IF THERE IS INTEL REPRE=
SENTATION -=C2=A0Share research findings and updates on design layout (Inte=
l)</font></li></ol></div><div><div><font face=3D"verdana, sans-serif">Pleas=
e add any other agenda items here:=C2=A0<a href=3D"https://github.com/openb=
mc/openbmc/wiki/GUI-Design-work-group" target=3D"_blank">https://github.com=
/openbmc/openbmc/wiki/<span class=3D"gmail-m_-4492976450962714341gmail-m_-1=
492632449708843752gmail-il">GUI</span>-Design-<span class=3D"gmail-m_-44929=
76450962714341gmail-m_-1492632449708843752gmail-il">work</span>-<span class=
=3D"gmail-m_-4492976450962714341gmail-m_-1492632449708843752gmail-il">group=
</span></a></font></div><div><font face=3D"verdana, sans-serif"><br></font>=
</div><div><font face=3D"verdana, sans-serif">As a note, attendance has bee=
n solely IBM community members. We would love<br>to have others join. We ar=
e hoping that changing the time from 7:00 AM Central<br>to 10:00 AM Central=
 will make that possible for people invested in the<br>GUI to attend.<br></=
font></div><div><font face=3D"verdana, sans-serif"><br></font></div><div><f=
ont face=3D"verdana, sans-serif"><span style=3D"box-sizing:border-box;color=
:rgb(36,41,46)">Meeting Link</span><span style=3D"color:rgb(36,41,46)">:=C2=
=A0</span><a href=3D"https://ibm.webex.com/ibm/j.php?MTID=3Dm49792ce33d5af2=
8f2823638d351732f3" rel=3D"nofollow" target=3D"_blank" style=3D"color:rgb(3=
,102,214);box-sizing:border-box;text-decoration-line:none">https://ibm.webe=
x.com/ibm/j.php?MTID=3Dm49792ce33d5af28f2823638d351732f3</a><br style=3D"bo=
x-sizing:border-box;color:rgb(36,41,46)"></font></div><div><font face=3D"ve=
rdana, sans-serif"><br></font></div><div><span style=3D"background-color:tr=
ansparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif">Best,</fo=
nt></span></div><div><span style=3D"background-color:transparent;color:rgb(=
36,41,46)"><font face=3D"verdana, sans-serif"><span class=3D"gmail-m_-44929=
76450962714341gmail-m_-1492632449708843752gmail-m_-2158016735816270648gmail=
-m_-274210038052043966gmail-m_6525215738950614323gmail-m_-61725108252411590=
69gmail-il"><span class=3D"gmail-m_-4492976450962714341gmail-m_-14926324497=
08843752gmail-il">GUI</span></span>=C2=A0<span class=3D"gmail-m_-4492976450=
962714341gmail-m_-1492632449708843752gmail-m_-2158016735816270648gmail-m_-2=
74210038052043966gmail-m_6525215738950614323gmail-m_-6172510825241159069gma=
il-il">Design</span>=C2=A0Team=C2=A0</font></span></div></div></div>

--000000000000477c45058dbd4972--
