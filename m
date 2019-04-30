Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B3FFF2
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 20:51:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44trGv51tTzDqT4
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 04:51:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c33; helo=mail-yw1-xc33.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GtGjgtAS"; 
 dkim-atps=neutral
Received: from mail-yw1-xc33.google.com (mail-yw1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44trG22BjRzDqRK
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 04:51:05 +1000 (AEST)
Received: by mail-yw1-xc33.google.com with SMTP id w196so6682341ywd.10
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 11:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=cW2K722kBQ5ZsNYnzK+z4nNTxc5UNmaDfhtTUbMs3ds=;
 b=GtGjgtASs1/1oNe3wJpaeWVB4DOx8kydEaUDJKbSTOTd2Y9t1nn5zuxNOk7ujUrKdz
 8Bn68IIzVQ/HBbk1gH0PG09kfnDZUQwyr2bjItjn6jyiVUJQv+kiMm5rNE+8glsMjgqK
 fkTk9ox0UY4NlscG2JHqcVR+xUEIpGUZIxxFaYJSXS7xyiMLs8y1StACTPKpeaTahmAF
 ntkAtzmku21DQEptC9fzLf7KZh0u70wWm5nzJY+fSAAJVD2yXhQIAD+BQI+9xWx49kWF
 W/UAxXYGzjb0uVbB954yUt0xOe/uPEo18FwuxQfQgHj3O4ZuFlwj1NwG2WiBtqV4Y3ej
 d4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=cW2K722kBQ5ZsNYnzK+z4nNTxc5UNmaDfhtTUbMs3ds=;
 b=frkgC5dfB5hPI9vo/0/892Rs1HBIHhLT2OJDm3pw3SXt+8W56bY/EVaZwFbljehblx
 agJCTFvzVK6AzZbUVCUq9kg/ZeBcPkK5E8NsdqxJ8xCkG/pQ0nSU3huOIvDAW/JHnxpv
 2owiFkRGgBDaF4IH4jQfPrKNTsEz6Avtqk/SrPPwZkzOa2cdzWjWw0bTNxqe/qshDCnq
 3CJsibEfP8/OKw5plN7sxxu/R5d80d4bpOUaUDCKaDiv85zQCFWuqdL7H+WaohIl7n/G
 WSvDlO+djW2InvO8DMrxBhWDFykQ+fWZwgGXNhH/SNb2Mvn+YcZKIuUGcPZno8J5nemk
 uLTQ==
X-Gm-Message-State: APjAAAV/OXV4Ii0ryLDhsHoo54ycnGcJxKk64M7WRn0CMt+KRrHV/yqT
 hH1yiJM169zrEl15Pmu84MDBsYv4BW+5J9BWn7elyQ==
X-Google-Smtp-Source: APXvYqyYJJVDGnUpMvwADWcGE/77OJXdFZfScxPG4o7Rw5RT6DT8GbGDFb5GXBb708+NavOWqDO4KHaIrt+t8dk3+kA=
X-Received: by 2002:a0d:f604:: with SMTP id g4mr36914604ywf.411.1556650261469; 
 Tue, 30 Apr 2019 11:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoQw2r=6DZ1FDh6iSeJF7SgQT0Uy20qFk22_bH_s5dJ98w@mail.gmail.com>
In-Reply-To: <CAMTupoQw2r=6DZ1FDh6iSeJF7SgQT0Uy20qFk22_bH_s5dJ98w@mail.gmail.com>
From: Jandra A <jandraara@gmail.com>
Date: Tue, 30 Apr 2019 13:50:50 -0500
Message-ID: <CAMTupoQRzXL3VZ3R2TJx+_4UoNid5SK8Mofi-YHO8CXiijNULQ@mail.gmail.com>
Subject: GUI Workgroup Rescheduled
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000dfdc740587c3e1db"
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

--000000000000dfdc740587c3e1db
Content-Type: text/plain; charset="UTF-8"

Hello all,

The GUI design workgroup meeting has been rescheduled to the second and
fourth Wednesday of each month. Therefore, tomorrow's meeting (May 1st) has
been rescheduled to May 8th, 2019.

Tentative agenda:

   1. Discuss Intel issues and task list
   2. Discuss icon implementation process and discussion of downstream icon
   customization


Best,
GUI Design Team

--000000000000dfdc740587c3e1db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div><span style=3D"background-color=
:transparent"><font face=3D"verdana, sans-serif">Hello all,=C2=A0</font></s=
pan></div><div><span style=3D"background-color:transparent;color:rgb(36,41,=
46)"><font face=3D"verdana, sans-serif"><br></font></span></div><div><span =
style=3D"background-color:transparent;color:rgb(36,41,46)"><font face=3D"ve=
rdana, sans-serif">The GUI design workgroup meeting has been rescheduled to=
 the second and fourth Wednesday of each month. Therefore, tomorrow&#39;s m=
eeting (May 1st) has been rescheduled to May 8th, 2019.=C2=A0</font></span>=
</div><div><span style=3D"background-color:transparent;color:rgb(36,41,46)"=
><font face=3D"verdana, sans-serif"><br></font></span></div><div><font colo=
r=3D"#24292e" face=3D"verdana, sans-serif">Tentative agenda:=C2=A0</font></=
div><div><ol style=3D"box-sizing:border-box;margin-bottom:16px;margin-top:0=
px;padding-left:2em;color:rgb(36,41,46)"><li style=3D"box-sizing:border-box=
"><font face=3D"verdana, sans-serif">Discuss Intel issues and task list</fo=
nt></li><li style=3D"box-sizing:border-box;margin-top:0.25em"><font face=3D=
"verdana, sans-serif">Discuss icon implementation process and discussion of=
 downstream icon customization</font></li></ol></div><div><font face=3D"ver=
dana, sans-serif"><br></font></div><div><span style=3D"background-color:tra=
nsparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif">Best,</fon=
t></span></div><div><span style=3D"background-color:transparent;color:rgb(3=
6,41,46)"><font face=3D"verdana, sans-serif"><span class=3D"gmail-il" style=
=3D"">GUI</span>=C2=A0<span class=3D"gmail-il" style=3D"">Design</span>=C2=
=A0Team=C2=A0</font></span></div></div></div><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
</blockquote></div></div>

--000000000000dfdc740587c3e1db--
