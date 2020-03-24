Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9131E1918B5
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 19:14:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mztN1wvCzDqW9
	for <lists+openbmc@lfdr.de>; Wed, 25 Mar 2020 05:14:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34;
 helo=mail-yb1-xb34.google.com; envelope-from=james.mihm@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ALDaLIjT; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mzqm4qH9zDqfB
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 05:12:33 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id o70so8098922ybg.10
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 11:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=R+KGpqWxIFRGsZN8yNsMjKo7VphOn7Wl6FXKKDG5uSI=;
 b=ALDaLIjTVg9RcDZxqy964n53p5VaBxuZy6e7FK6Y1n981K+vMTdaa1xTmHZyjevQY0
 a/4AncN2+U25K9F0h26GeddPFyopKc0/plfw29Gk3jswruY4o6JVxUhQHkv1xacgRrPs
 tyelBJ1ZdewzHPFk1w5pFymQyG2+1gP44dXf8R6XlGmL0OhMOWYMEwxe7xS9M2XBY9oQ
 w61D761qBn5L47p3zH/iZrnPgr12znQ3VcoQ+ZQJ/g3gSyr+V9IU1k5YkaSKyCRhUieK
 5H9nPxv7/3mMmIPE2xpbwTuY8WJRTupB0CaNCC34VtMPROTrmZQbX6gJjZ7FYOhN42GS
 g+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=R+KGpqWxIFRGsZN8yNsMjKo7VphOn7Wl6FXKKDG5uSI=;
 b=lbh3xVshxSwIYdn5FjvV0sXiNFJUe9qypRflPrQ7r13eOaTg4utmFk6Kuhva62/Fx4
 S355DK0E1NP9acH1/1QbIkWqTorH58Tisl9grXPQLkFeJuJYZvkevaIym2s9emS1hYh/
 Kf2FigSscka5enO+CyDJIm40lOqzsCsNP3haVJWG+UADSu+m6hxUlCWhtiB1bisUJPx2
 54TSbwOGaq658B42Hfs2MMgOYoWZKAtf5/mWplG2aQksw54meZJKgwwjkiRBbzAvGcZE
 EAmtHzCj2avJsbiFnWkxmOEJz4ClLn0OdJ73VRmqzs6RWw3iF23rNt9CGQO9OvSTlhQo
 sRXg==
X-Gm-Message-State: ANhLgQ2g6ZjaNYV9gt0sJfSIO4Vub8ZKCmI6oHCPXD8lU6NfrI3C+d6C
 UpSMkbWS6esrwWaKeAuEEe/sxDG6gcIUfynRljBEUg==
X-Google-Smtp-Source: ADFU+vtQvypI23Wlu9iBIU6Qb9NfG4+98162+sA3EZeji1wWuwChDgZbPJJnGW0bgL0dQQFNWayWsUVMm8D9Pq2WLgk=
X-Received: by 2002:a5b:74c:: with SMTP id s12mr13052029ybq.516.1585073549280; 
 Tue, 24 Mar 2020 11:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <8117ef0c5f9a4c599ebe1d53aae209b3@SCL-EXCHMB-13.phoenix.com>
 <CADy_Pt3xOgPXungY+nwpYjFVcvCqMek_gHLeFWXOUoSjLom3RQ@mail.gmail.com>
In-Reply-To: <CADy_Pt3xOgPXungY+nwpYjFVcvCqMek_gHLeFWXOUoSjLom3RQ@mail.gmail.com>
From: James Mihm <james.mihm@gmail.com>
Date: Tue, 24 Mar 2020 11:11:52 -0700
Message-ID: <CADy_Pt2mZ8E4EgY0y3wRSLh080cBBmoERgJvR7Lk8Rj4ep39-w@mail.gmail.com>
Subject: Fwd: Which repo is more stable, feature complete, most functionality?
 https://github.com/openbmc/openbmc or
 https://github.com/Intel-BMC/openbmc
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000d90c4d05a19db11b"
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

--000000000000d90c4d05a19db11b
Content-Type: text/plain; charset="UTF-8"

I meant to include the mailing list on my response.

James.

---------- Forwarded message ---------
From: James Mihm <james.mihm@gmail.com>
Date: Mon, Mar 9, 2020 at 7:11 PM
Subject: Re: Which repo is more stable, feature complete, most
functionality? https://github.com/openbmc/openbmc or
https://github.com/Intel-BMC/openbmc
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>


Bruce,

The Intel-BMC/openbmc repo is where we (i.e., Intel) pushes our
internal fork externally while in the process of upstreaming. The intent
for this repo is for it to be functional on an Intel development platform
(e.g., Wolfpass) at all times while upstreaming changes to the
openbmc/openbmc repo. The long term goal is for Intel to be pushing all
development upstream to the openbmc/openbmc repo, and using the Intel-BMC
repository for sharing future capabilities that are not yet publically
announced. Where our goal is to push our internal development fork to the
Intel-BMC/openbmc repo every two weeks.

Two exceptions for upstreaming are the webui and linux kernel patches.
Upstreaming the linux kernel patches is challenging and some of the patches
may never make it upstream. With the migration of the webui to vue.js
there's not much point in upstreaming the Intel fork of phosphor-webui.

My answer to your question is to use the openbmc/openbmc repository, but
not for controlling your car brakes.

James.



On Thu, Jan 16, 2020 at 4:27 PM Bruce Mitchell <Bruce_Mitchell@phoenix.com>
wrote:

> Which repo is more stable, feature complete, most functionality?
> https://github.com/openbmc/openbmc or https://github.com/Intel-BMC/openbmc
>
> While the WebUI for https://github.com/Intel-BMC/openbmc may look better,
> presently its functionality for BMC operation seems intermittent compared
> to the functionality of https://github.com/openbmc/openbmc.
> I am referring to basic things such as displaying the BMC's Firmware
> Version, the lack of displaying any NIC for Network Settings, the "hang"
> for Health Hardware Status.
>
> This is not a request about ahead or behind; I am asking about stable,
> feature complete, most functionality.
>
> Using a metaphor here; if you had to select today one of the 2 for
> controlling your car's breaks which would it be?
>
> Thank you.
>
>

--000000000000d90c4d05a19db11b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I meant to include the mailing list on my response.</=
div><div><br></div><div>James.</div><br><div class=3D"gmail_quote"><div cla=
ss=3D"gmail_attr" dir=3D"ltr">---------- Forwarded message ---------<br>Fro=
m: <strong class=3D"gmail_sendername" dir=3D"auto">James Mihm</strong> <spa=
n dir=3D"auto">&lt;<a href=3D"mailto:james.mihm@gmail.com">james.mihm@gmail=
.com</a>&gt;</span><br>Date: Mon, Mar 9, 2020 at 7:11 PM<br>Subject: Re: Wh=
ich repo is more stable, feature complete, most functionality? <a href=3D"h=
ttps://github.com/openbmc/openbmc">https://github.com/openbmc/openbmc</a> o=
r <a href=3D"https://github.com/Intel-BMC/openbmc">https://github.com/Intel=
-BMC/openbmc</a><br>To: Bruce Mitchell &lt;<a href=3D"mailto:Bruce_Mitchell=
@phoenix.com">Bruce_Mitchell@phoenix.com</a>&gt;<br></div><br><br><div dir=
=3D"ltr">Bruce,<div><br></div><div>The Intel-BMC/openbmc repo is where we (=
i.e., Intel) pushes our internal=C2=A0fork externally while in the process =
of upstreaming. The intent for this repo is for it to be functional on an I=
ntel development platform (e.g., Wolfpass) at all times while upstreaming c=
hanges to the openbmc/openbmc repo. The long term goal is for Intel to be p=
ushing all development=C2=A0upstream to the openbmc/openbmc repo, and using=
 the Intel-BMC repository for sharing future capabilities that are not yet =
publically announced. Where our goal is to push our internal development fo=
rk to the Intel-BMC/openbmc repo every two weeks.=C2=A0</div><div><br></div=
><div>Two exceptions for upstreaming are the webui and linux kernel patches=
. Upstreaming the linux kernel patches is challenging and some of the patch=
es may never make=C2=A0it upstream. With the migration of the webui to vue.=
js there&#39;s not much point in upstreaming the Intel fork of phosphor-web=
ui.=C2=A0</div><div><br></div><div>My answer to your question is to use the=
 openbmc/openbmc repository, but not for controlling your car brakes.</div>=
<div><br></div><div>James.=C2=A0=C2=A0</div><div><br></div><div><br></div><=
/div><br><div class=3D"gmail_quote"><div class=3D"gmail_attr" dir=3D"ltr">O=
n Thu, Jan 16, 2020 at 4:27 PM Bruce Mitchell &lt;<a href=3D"mailto:Bruce_M=
itchell@phoenix.com" target=3D"_blank">Bruce_Mitchell@phoenix.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Which repo=
 is more stable, feature complete, most functionality?=C2=A0 <a href=3D"htt=
ps://github.com/openbmc/openbmc" target=3D"_blank" rel=3D"noreferrer">https=
://github.com/openbmc/openbmc</a> or <a href=3D"https://github.com/Intel-BM=
C/openbmc" target=3D"_blank" rel=3D"noreferrer">https://github.com/Intel-BM=
C/openbmc</a><br>
<br>
While the WebUI for <a href=3D"https://github.com/Intel-BMC/openbmc" target=
=3D"_blank" rel=3D"noreferrer">https://github.com/Intel-BMC/openbmc</a> may=
 look better,<br>
presently its functionality for BMC operation seems intermittent compared t=
o the functionality of <a href=3D"https://github.com/openbmc/openbmc" targe=
t=3D"_blank" rel=3D"noreferrer">https://github.com/openbmc/openbmc</a>.<br>
I am referring to basic things such as displaying the BMC&#39;s Firmware Ve=
rsion, the lack of displaying any NIC for Network Settings, the &quot;hang&=
quot; for Health Hardware Status.=C2=A0 <br>
<br>
This is not a request about ahead or behind; I am asking about stable, feat=
ure complete, most functionality.<br>
<br>
Using a metaphor here; if you had to select today one of the 2 for controll=
ing your car&#39;s breaks which would it be?<br>
<br>
Thank you.<br>
<br>
</blockquote></div>
</div></div>

--000000000000d90c4d05a19db11b--
