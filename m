Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F390D8D794
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 18:03:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467vWy6psWzDqt3
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 02:03:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VTgp5eDh"; 
 dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467vWF2JtyzDqWr
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 02:03:03 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id b16so9662093ybq.0
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=SA+Hs98f99aFDSg0Z7wqi1qkvDA81iAajEyI1uc/mqg=;
 b=VTgp5eDhSz7GZ4KXRFYpuUD22WEqRAh06QqvC+As+Mk6mjxKnfXOeQ70H9ERhjASuN
 /cFhAUKFVrNXEADLIPwj18WcEGnviaxIGFD0fuu/pzu44ipZC8s7SOtfX+cd7fEvNxnU
 mvwyMeR5/0+/o7tYUSq3XE4g9YDRmhZrsET5PRjlgy6FBXWAaa29lG8UQmMXycNE3XR7
 jckEPPaAKUx0pM3L3JLrguM9ALLU6SfxsaXpH0qb8gBPeascq7TgwBwMrXt2TkgvWauq
 bc6n6Zk9VQxlrjx4TBbtayUGbS3rlTAFI98Hw9chNa7J5IIJ3BsR4NJVjZt499yykHs8
 Nlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=SA+Hs98f99aFDSg0Z7wqi1qkvDA81iAajEyI1uc/mqg=;
 b=lEvnOZGAVmW2aysWOoGk+hBRV4A0vK6sXez130TXVBPrYnuyGRlzyJEBbGR5+tJGFV
 wpF3P6VTd7idhExfZv0TH5VOGckHveRmxSKJ4EgPku4QxcT9/tg/eJsZ9hZ4tTVFtUyn
 RM7W40xweLUlz8dTpSTJVsJfOqSVfDgcitnr74riIovwG1OeCjtNZnNE+E1Vv7Wh2MYg
 7aTRHoiF2dmortYMrOe/2xOwScVIPOAJUquNSzGbG5Wt2P/TjeksBafZnQmywyKulAyo
 GmTS4w0n8kKYZIKV9uL2yFZizlj8Y9ZuLeDK00Rm1VxQMR1xe6kiUyHusOYrETfPNH2J
 BgBA==
X-Gm-Message-State: APjAAAVs/nUGaSWIymV1aBE9FD5wQevTny7hstjNgNZIq8SmW5JKEtL8
 92HGwTSa1EVlhWTFHXCFCpDv6eMFt4lF5D9l+aY=
X-Google-Smtp-Source: APXvYqw5mAcA5IIp/pIF/XXjkm1j0mbF1wDKxF85Bdu77VDTItMFSeVwKyyexGR/5gBR+LfZggkMNEw8eSP3936pi+s=
X-Received: by 2002:a25:6302:: with SMTP id x2mr329525ybb.6.1565798579596;
 Wed, 14 Aug 2019 09:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoTsqEzGO8kfp030vquT4kHZDjdkCYFG9YFx_hFSqWAz8A@mail.gmail.com>
 <81abf87d-ec47-32c2-65dc-a32d8d18665b@preossec.com>
In-Reply-To: <81abf87d-ec47-32c2-65dc-a32d8d18665b@preossec.com>
From: Jandra A <jandraara@gmail.com>
Date: Wed, 14 Aug 2019 11:02:48 -0500
Message-ID: <CAMTupoT12__Eg573wRaY8eieVGO6nx+O70rJZ7716C65RGNeyg@mail.gmail.com>
Subject: GUI Workgroup - notes
To: Lee Fisher <lee@preossec.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000002072b5059015e451"
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

--0000000000002072b5059015e451
Content-Type: text/plain; charset="UTF-8"

Hello,

Here are the notes from today's GUI workgroup. The next meeting is
scheduled for 10:00 AM CST on Wednesday August 28.

Lee, are Scoot, Jagan, Zelia, Thiago, David, Marieely, and Z the people
from Intel you asked to join? If so, we were not able to talk with them.
Please let them know they are welcome to add items to the agenda; we would
love to see what they are working on.

URL: https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group#73119

Attendees:
- Yoshie Muranaka (IBM)
- Jandra Aranguren (IBM)
- Ryan Arnell (IBM)
- Mira Murali (IBM)
- Dixsie Wolmers (IBM)
- Rahul Maheshwari (IBM)
- Scoot (?)
- Jagan Sukumar (?)
- Zelia Cholland (?)
- Thiago (?)
- David (?)
- Marieely (?)
- Z (?)

Notes:

   - Reviewed Login - expired password
      - No need to ask for current password again
      - Is the copy the appropriate message? Not clear if this is only for
      the first login or for all expired password scenarios
   - Reviewed Firmware
      - Not clear 'Reboot host and bmc' button becomes disabled because the
      settings have not been saved.
      - Verified with FED that Activating and Rebooting toast messages are
      doable.
      - Consider adding a visual queue to clearly indicate the next boot
      image has been changed after activation without reboot.
   - Reviewed Power Operations
      - Is there a scenario in which a customer might only have AIX, only
      Linux, or only IBMi?
      - Make 'Default partition environment' dropdown the same width as the
      others for easy eye scan
      - Left and top margins on server settings sections
   - Local User Management (Progress Status - FED)
      - Decided to move root to first row
      - Discussed the order of checkbox


Regards,
Jandra A


On Tue, Aug 13, 2019 at 5:03 PM Lee Fisher <lee@preossec.com> wrote:

> I've pinged a few Intel people re: this, we'll see if it helps.... :-)
>
> On 8/13/19 2:32 PM, Jandra A wrote:
> > Hello all,
> >
> > The GUI design workgroup will be meeting this Wednesday July 31 at
> 10:00AM
> > CST.
> >
> > Tentative agenda:
> >
> >    1. Server Power Operations
> >    2. Firmware update
> >    3. Local User Management review (TBD)
> >    4. Changes to the navigation structure (TBD)
> >    5. CPU / GPU Throttling (TBD)
> >    6. Event Logs (TBD)
> >    7. IF THERE IS INTEL REPRESENTATION - Updates on Intel-specific icon
> >    changes mentioned last meeting (Intel)
> >    8. IF THERE IS INTEL REPRESENTATION - Share research findings and
> >    updates on design layout (Intel)
> >
> > Please add any other agenda items here:
> > https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
> >
> > As a note, attendance has been solely IBM community members. We would
> love
> > to have others join.
> >
> > Meeting Link:
> > https://ibm.webex.com/ibm/j.php?MTID=m49792ce33d5af28f2823638d351732f3
> >
> > Best,
> > GUI Design Team
> >
>

--0000000000002072b5059015e451
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><font color=3D"#24292e" face=3D"verd=
ana, sans-serif">Hello,</font></div><div><font color=3D"#24292e" face=3D"ve=
rdana, sans-serif"><br></font></div><div><font color=3D"#24292e" face=3D"ve=
rdana, sans-serif">Here are the notes from today&#39;s GUI workgroup. The n=
ext meeting is scheduled for 10:00 AM CST on Wednesday August 28.=C2=A0</fo=
nt></div><div><font color=3D"#24292e" face=3D"verdana, sans-serif"><br></fo=
nt></div><div><font color=3D"#24292e" face=3D"verdana, sans-serif">Lee, are=
 Scoot, Jagan, Zelia, Thiago, David, Marieely, and Z the people from Intel =
you asked to join? If so, we were not able to talk with them. Please let th=
em know they are welcome to add items to the agenda; we would love to see w=
hat they are working on.</font></div><div><font color=3D"#24292e" face=3D"v=
erdana, sans-serif"><br></font></div><div><font face=3D"verdana, sans-serif=
">URL:=C2=A0<a href=3D"https://github.com/openbmc/openbmc/wiki/GUI-Design-w=
ork-group#73119" rel=3D"noreferrer" target=3D"_blank">https://github.com/op=
enbmc/openbmc/wiki/<span class=3D"gmail-il">GUI</span>-Design-work-group#73=
119</a><br></font></div><div><font face=3D"verdana, sans-serif"><br></font>=
</div><div><font face=3D"verdana, sans-serif">Attendees:=C2=A0</font></div>=
<div><font face=3D"verdana, sans-serif">- Yoshie Muranaka (IBM)<br>- Jandra=
 Aranguren (IBM)<br>- Ryan Arnell (IBM)<br>- Mira Murali (IBM)<br>- Dixsie =
Wolmers (IBM)<br>- Rahul Maheshwari (IBM)<br></font></div><div><font face=
=3D"verdana, sans-serif">- Scoot (?)</font></div><div><font face=3D"verdana=
, sans-serif">- Jagan Sukumar (?)</font></div><div><font face=3D"verdana, s=
ans-serif">- Zelia Cholland (?)</font></div><div><font face=3D"verdana, san=
s-serif">- Thiago (?)</font></div><div><font face=3D"verdana, sans-serif">-=
 David (?)</font></div><div><font face=3D"verdana, sans-serif">- Marieely (=
?)</font></div><div><font face=3D"verdana, sans-serif">- Z (?)=C2=A0</font>=
</div><div><font face=3D"verdana, sans-serif"><br></font></div><div><font f=
ace=3D"verdana, sans-serif">Notes:</font></div><ul style=3D"box-sizing:bord=
er-box;margin-bottom:16px;margin-top:0px;padding-left:2em;color:rgb(36,41,4=
6)"><li style=3D"box-sizing:border-box"><font face=3D"verdana, sans-serif">=
Reviewed Login - expired password</font><ul style=3D"box-sizing:border-box;=
margin-bottom:0px;margin-top:0px;padding-left:2em"><li style=3D"box-sizing:=
border-box"><font face=3D"verdana, sans-serif">No need to ask for current p=
assword again</font></li><li style=3D"box-sizing:border-box;margin-top:0.25=
em"><font face=3D"verdana, sans-serif">Is the copy the appropriate message?=
 Not clear if this is only for the first login or for all expired password =
scenarios</font></li></ul></li><li style=3D"box-sizing:border-box;margin-to=
p:0.25em"><font face=3D"verdana, sans-serif">Reviewed Firmware</font><ul st=
yle=3D"box-sizing:border-box;margin-bottom:0px;margin-top:0px;padding-left:=
2em"><li style=3D"box-sizing:border-box"><font face=3D"verdana, sans-serif"=
>Not clear &#39;Reboot host and bmc&#39; button becomes disabled because th=
e settings have not been saved.</font></li><li style=3D"box-sizing:border-b=
ox;margin-top:0.25em"><font face=3D"verdana, sans-serif">Verified with FED =
that Activating and Rebooting toast messages are doable.</font></li><li sty=
le=3D"box-sizing:border-box;margin-top:0.25em"><font face=3D"verdana, sans-=
serif">Consider adding a visual queue to clearly indicate the next boot ima=
ge has been changed after activation without reboot.</font></li></ul></li><=
li style=3D"box-sizing:border-box;margin-top:0.25em"><font face=3D"verdana,=
 sans-serif">Reviewed Power Operations</font><ul style=3D"box-sizing:border=
-box;margin-bottom:0px;margin-top:0px;padding-left:2em"><li style=3D"box-si=
zing:border-box"><font face=3D"verdana, sans-serif">Is there a scenario in =
which a customer might only have AIX, only Linux, or only IBMi?</font></li>=
<li style=3D"box-sizing:border-box;margin-top:0.25em"><font face=3D"verdana=
, sans-serif">Make &#39;Default partition environment&#39; dropdown the sam=
e width as the others for easy eye scan</font></li><li style=3D"box-sizing:=
border-box;margin-top:0.25em"><font face=3D"verdana, sans-serif">Left and t=
op margins on server settings sections</font></li></ul></li><li style=3D"bo=
x-sizing:border-box;margin-top:0.25em"><font face=3D"verdana, sans-serif" s=
tyle=3D"">Local User Management (Progress Status - FED)</font></li><ul styl=
e=3D"box-sizing:border-box;margin-bottom:0px;margin-top:0px;padding-left:2e=
m"><li style=3D"box-sizing:border-box"><font face=3D"verdana, sans-serif">D=
ecided to move root to first row</font></li><li style=3D"box-sizing:border-=
box;margin-top:0.25em"><font face=3D"verdana, sans-serif" style=3D"">Discus=
sed the order of checkbox</font></li></ul></ul><div><font color=3D"#24292e"=
 face=3D"verdana, sans-serif"><br></font></div><div><font color=3D"#24292e"=
 face=3D"verdana, sans-serif">Regards,</font></div><div><font color=3D"#242=
92e" face=3D"verdana, sans-serif">Jandra A</font></div><div><font color=3D"=
#24292e" face=3D"verdana, sans-serif"><br></font></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 13, 2019=
 at 5:03 PM Lee Fisher &lt;<a href=3D"mailto:lee@preossec.com">lee@preossec=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">I&#39;ve pinged a few Intel people re: this, we&#39;ll see if it helps.=
... :-)<br>
<br>
On 8/13/19 2:32 PM, Jandra A wrote:<br>
&gt; Hello all,<br>
&gt;<br>
&gt; The GUI design workgroup will be meeting this Wednesday July 31 at 10:=
00AM<br>
&gt; CST.<br>
&gt;<br>
&gt; Tentative agenda:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 1. Server Power Operations<br>
&gt;=C2=A0 =C2=A0 2. Firmware update<br>
&gt;=C2=A0 =C2=A0 3. Local User Management review (TBD)<br>
&gt;=C2=A0 =C2=A0 4. Changes to the navigation structure (TBD)<br>
&gt;=C2=A0 =C2=A0 5. CPU / GPU Throttling (TBD)<br>
&gt;=C2=A0 =C2=A0 6. Event Logs (TBD)<br>
&gt;=C2=A0 =C2=A0 7. IF THERE IS INTEL REPRESENTATION - Updates on Intel-sp=
ecific icon<br>
&gt;=C2=A0 =C2=A0 changes mentioned last meeting (Intel)<br>
&gt;=C2=A0 =C2=A0 8. IF THERE IS INTEL REPRESENTATION - Share research find=
ings and<br>
&gt;=C2=A0 =C2=A0 updates on design layout (Intel)<br>
&gt;<br>
&gt; Please add any other agenda items here:<br>
&gt; <a href=3D"https://github.com/openbmc/openbmc/wiki/GUI-Design-work-gro=
up" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc=
/wiki/GUI-Design-work-group</a><br>
&gt;<br>
&gt; As a note, attendance has been solely IBM community members. We would =
love<br>
&gt; to have others join.<br>
&gt;<br>
&gt; Meeting Link:<br>
&gt; <a href=3D"https://ibm.webex.com/ibm/j.php?MTID=3Dm49792ce33d5af28f282=
3638d351732f3" rel=3D"noreferrer" target=3D"_blank">https://ibm.webex.com/i=
bm/j.php?MTID=3Dm49792ce33d5af28f2823638d351732f3</a><br>
&gt;<br>
&gt; Best,<br>
&gt; GUI Design Team<br>
&gt;<br>
</blockquote></div></div>

--0000000000002072b5059015e451--
