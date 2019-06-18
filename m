Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE74AA41
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 20:50:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SxwG1M3ZzDqjc
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 04:50:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LL55m9Bf"; 
 dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Sxvk5YK4zDqVy
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 04:49:38 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id v104so6473837ybi.12
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 11:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=OWa0hQWH63vTxUIrhTsJTNFsbF9XZ7QrY4JM3jzB/3Q=;
 b=LL55m9BfufGF0XGOtO22a/++/xGlzjDAhI9QYcy7QOSZ/9XiBTdfkBoneUecVF4tN/
 sJPn8Om8ei0il2b33UPygTi4FStkL9RKOEWghdr4l8eNxJsuXkfLwyAMuG4Xiiqbd5Z5
 8y6FdrqZATkcls011Ahp88ToFxIXlgO7pfrk1Vj5mRm6TQ6rzA8IbY9kvr5f9zUxeZ7q
 DNVtohW2gBNYiPuCfFEnMcP3u8KkyCkKD2emE6uDSz7LVcb9PF0v4VD6n5cdeuyPE9DI
 Zk0NNi5BXuud600yiEh2wI4FSau6FKczKqFFDHQtIJEV+MyGTY5y8TYYr960QmyBb3Wj
 do0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=OWa0hQWH63vTxUIrhTsJTNFsbF9XZ7QrY4JM3jzB/3Q=;
 b=Rr/u66w81mYiWh8Jm3WomhcHFc5Ypyp0ndUptlJqmHNhBm0YlTIGuqd4nWwRg7MmwY
 XU1VTrVuOcdaWhNdkEx6OZHFhI2lWFZP0ZAaQTXGcvIPWw33Rc7tPSTxeEJ2C38mIVdq
 hfIVAx0eKNpwk7HHXAb0JjsBojNHWrmgwmn5cTtW8zT5AQTckagJMLIZfFkujpkNtljh
 lwzFBOlTtx1IfgiuylwbnHDAWkZIBii8+FM4acoxTnRcuvpqG2oOnOie+IVYPfass+aN
 ybSzXGqIY8iWt1r1WVigMquy6xLJpZaUnjjc95TxCNLx/TgV0vCQoINByRJQWT8YaSRC
 QBRg==
X-Gm-Message-State: APjAAAXyOf4l3a9x1YH1cKUYk1R66eiOfJ2LhsPw/wTr+60uuyxxZX8m
 RKY8oZiR+RP6MLxQZZqNmy+GejDhkDkiJTePHeilpwL7
X-Google-Smtp-Source: APXvYqy7tvP5i4ZiicpmTVW3z18gOW00H5jZ8nxZ10UnLwvzWOZ2ZyWL7BQMNFixoYvyVFFwIJSUDadaHcxUA0jtDHc=
X-Received: by 2002:a25:dc0d:: with SMTP id y13mr13869807ybe.6.1560883774069; 
 Tue, 18 Jun 2019 11:49:34 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Tue, 18 Jun 2019 13:49:23 -0500
Message-ID: <CAMTupoQ1P_DfcU6WJx2-uutNZs7zxF0F8encrQhoaH+2FT8mBA@mail.gmail.com>
Subject: Local user management
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000e3a107058b9d9289"
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

--000000000000e3a107058b9d9289
Content-Type: text/plain; charset="UTF-8"

Hello all,

There have been some usability concerns from users on the current 'Local
user management' design, and we would like to propose a design to address
these issues:

   - The 'User account properties' section is too prominent, taking away
   from 'User account information'.


   - Adding a user account is not always visible and is too similar to the
   'edit' mode.


   - It is not clear what the difference is between 'Locked' and 'Enabled'
   or what the purpose of surfacing locked users is if it is temporary and
   limited to the amount of time set by a sys admin.


Our proposal is a work in progress on which we are getting user feedback
and invite you to provide yours too.
Redesign proposal:
https://ibm.invisionapp.com/share/4XNZ0JAMJ7B#/319147576_6-4-1_Regular

From this design we have the following questions:

   - Where do the password requirements come from (imposed by the BMC or
   their company's security team)? Should they be set in the GUI (at one point
   there were fields for the max  and min lengths)?
   - Do we have the ability to include a "custom" role type for local
   users, in addition to the four existing roles (Admin, Operator, Callback,
   and User)?
   - When is the current password required to change a password?



Regards,
Jandra Aranguren

--000000000000e3a107058b9d9289
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"verdana, sans-serif">Hello all,</font><div><=
font face=3D"verdana, sans-serif"><br></font></div><div><font face=3D"verda=
na, sans-serif">There have been some usability concerns from users on the c=
urrent &#39;Local user management&#39; design, and we would like to propose=
 a design to address these issues:=C2=A0</font></div><div><ul><li><font fac=
e=3D"verdana, sans-serif">The &#39;User account properties&#39; section is =
too prominent, taking away from &#39;User account information&#39;.=C2=A0</=
font></li></ul><ul><li><font face=3D"verdana, sans-serif">Adding a user acc=
ount is not always visible and is too similar to the &#39;edit&#39; mode.=
=C2=A0</font></li></ul><ul><li><font face=3D"verdana, sans-serif">It is not=
 clear what the difference is between &#39;Locked&#39; and &#39;Enabled&#39=
; or what the purpose of surfacing locked users is if it is temporary and l=
imited to the amount of time set by a sys admin.</font></li></ul></div><div=
><font face=3D"verdana, sans-serif"><br></font></div><div><font face=3D"ver=
dana, sans-serif">Our proposal is a work in progress on which we are gettin=
g user feedback and invite you to provide yours too.=C2=A0</font></div><div=
><font face=3D"verdana, sans-serif">Redesign proposal:=C2=A0<a href=3D"http=
s://ibm.invisionapp.com/share/4XNZ0JAMJ7B#/319147576_6-4-1_Regular">https:/=
/ibm.invisionapp.com/share/4XNZ0JAMJ7B#/319147576_6-4-1_Regular</a></font><=
/div><div><font face=3D"verdana, sans-serif"><br></font></div><div><font fa=
ce=3D"verdana, sans-serif">From this design we have the following questions=
:</font></div><div><ul><li class=3D"gmail-list-bullet1"><span class=3D"gmai=
l-author-6922131016 gmail-font-size-small" style=3D""><font face=3D"verdana=
, sans-serif">Where do the password requirements come from (imposed by the =
BMC or their company&#39;s security team)? Should they be set in the GUI (a=
t one point there were fields for the max=C2=A0 and min lengths)?=C2=A0</fo=
nt></span></li><li class=3D"gmail-list-bullet1"><span class=3D"gmail-author=
-6922131016 gmail-font-size-small" style=3D""><font face=3D"verdana, sans-s=
erif">Do we have the ability to include a &quot;custom&quot; role type for =
local users, in addition to the four existing roles (Admin, Operator, Callb=
ack, and User)?=C2=A0</font></span></li><li class=3D"gmail-list-bullet1"><s=
pan class=3D"gmail-author-6922131016 gmail-font-size-small" style=3D""><fon=
t face=3D"verdana, sans-serif">When is the current password required to cha=
nge a password?=C2=A0</font></span></li></ul><div><font face=3D"verdana, sa=
ns-serif"><br></font></div></div><div><font face=3D"verdana, sans-serif"><b=
r></font></div><div><font face=3D"verdana, sans-serif">Regards,</font></div=
><div><font face=3D"verdana, sans-serif">Jandra Aranguren</font></div></div=
>

--000000000000e3a107058b9d9289--
