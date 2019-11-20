Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A1A104398
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 19:44:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JBSH0BSbzDqsN
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 05:44:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2d;
 helo=mail-yw1-xc2d.google.com; envelope-from=jandraara@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eSXF06WI"; 
 dkim-atps=neutral
Received: from mail-yw1-xc2d.google.com (mail-yw1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JBRP2BN2zDqs1
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 05:43:42 +1100 (AEDT)
Received: by mail-yw1-xc2d.google.com with SMTP id v84so338499ywc.4
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 10:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=79ittukzTW75qQ275yFBqA84KOvah/VZddkuB+f95u4=;
 b=eSXF06WIZNmjYRo8EBdLW+NrZidMMiSiP2+Sjh4jTkZ4g0+L7+eAZWMkGSJqwET97y
 nYDTKQ1S+0XJQTyfU2SdLgL0eZprTpXLZa6K+4BvDqgU6Zuyz2NGgBM2r3lvC9V7aaih
 zp2IM7TO6mmBpjunQeonIY6G5cyXzZHHaLf19yueGIUo7fCMhgDEDqgeRZs6PLcpRcRl
 JzXp9y7GK3N/aNNrL+QFvt8A8G9thFvrCm5I23VvjU0gKA40gl2jDDFseaDaugUWSoea
 3XMFCwcTpc5GQgkDxTn6+lHzmjHr4U4+vI5Aid5VrM/GMc9ck6gGrN86AJZIpK6vqK1W
 dzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=79ittukzTW75qQ275yFBqA84KOvah/VZddkuB+f95u4=;
 b=OirWZtxdghp9BW92v2nuUInDLJbCE4PlwEJ+BkDVWr1gz/BNeu6beae8CbLlUuDq1L
 jTxHVsSGjwZn6eYQWYaiFNzH24CD0l8VeCOMcOE8CnZTmn8AD/kqXKNczAZp9qHOLmH6
 8s7nprOuiAjeBrfeKv5bMtyIRWbXnim+jjVWSxb2mLXw8dYmeAKKNmVg6ihgMhkohThu
 iPi7EUzM2NyvKbFpIIfRgD5tvSurSVMSNnaosINIyWeAFg24YeK/Ni8wyfF6eHz4FYTh
 ljjoYA5eO0JRsqoBacLs3ZcN9nozVTgQfzf9pt79rKyONYhjDn7b8dU3NqCsUxUQ11OA
 tcqA==
X-Gm-Message-State: APjAAAUsGM0RrzOJgwr3B4haJUQPJbPEtbXpvt7ceVyaJqVrt/H/nH8w
 r89VoOPYCVOyTc34PmM5Ah82BHha/sbTeVY2VDg=
X-Google-Smtp-Source: APXvYqymieB/iSm8DGm+Hfh5Cn463+WFh/fj6cJVtM4hOgUl1DOed4q5tEb49y9hCEoEp9V9uw+zNDFxvNCAH6nZtG4=
X-Received: by 2002:a0d:e607:: with SMTP id p7mr2740399ywe.103.1574275419239; 
 Wed, 20 Nov 2019 10:43:39 -0800 (PST)
MIME-Version: 1.0
References: <OFACB662CD.2442A2C1-ON002584B8.004AA114-002584B8.004ACB90@notes.na.collabserv.com>
In-Reply-To: <OFACB662CD.2442A2C1-ON002584B8.004AA114-002584B8.004ACB90@notes.na.collabserv.com>
From: Jandra A <jandraara@gmail.com>
Date: Wed, 20 Nov 2019 12:43:28 -0600
Message-ID: <CAMTupoSvRSMPTGWXwzpN-Xs3S2H5_y8Va8BO6GzwiX8+qCWyfQ@mail.gmail.com>
Subject: Notes - Re: GUI Design Workgroup - Today - Wednesday 11/20
To: Derick Montague <Derick.Montague@ibm.com>
Content-Type: multipart/alternative; boundary="0000000000002479030597cb8ffd"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002479030597cb8ffd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Notes from today's GUI workgroup below:


> - Discuss use of Carbon Design System for icons and components
>
- Intel suggests React Bootstrap; likes Carbon system alerts better. IBM
would propose looking at Vue Bootstrap since we are trying to move the
framework to that. Prefers not to use Carbon because it does not match with
the same modern aesthetic that Intel is looking for. Carbon has very small
text and believes bigger is more modern. Also, Carbon uses square vs
rounded corners and believes, round is more friendly
- Discussed which elements of Carbon could be resolved through styling so
that all contributors can achieve their definition of modernity. Colors and
sizes can be themed.
- Examples of modernity provided by Intel: Salesforce, Salesfusion, Google
Analytics
- Another design system Intel looked at is Salesforce lightning design
system
- Agreed achieving consensus on a style library is the immediate next step
and the discussion will be continued on the mailing list with each party
providing alternatives they would be willing to accept.



> - Discuss framework update from AngularJS to Vue
>
The community has not responded to emails regarding the change. IBM has
started building out a prototype using Carbon components. We need to decide
on a style guide before going down this path too far.



> - Discuss primary navigation changes and collaborative work between Intel
> and IBM
>

- Intel pushed a commit yesterday with an updated navigation. This keeps
the existing background color until we can create theming and resolve color
downstream.
- Discussed active, hover, and focused states. Determined focus and hover
states should be the same. The active state needs a color update to meet
accessibility and so that it stands out more at a glance.
- Agreed the commit does not need to add carets to the navigation pattern
since it is an existing problem with the UI. However, it should be
addressed in the future to give users an affordance of hidden text.
- Intel to make changes and send a screenshot to the email list:
1. Add vertical space above =E2=80=98Overview=E2=80=99.
2. Determine a color for the active state.



Next steps (after agreeing on a Design Library)
- Want to discuss header next. Brief discussion occurred in the meeting
regarding the styling of 'Health' and 'Power'. For IBM, these elements
don't look clickable, which reflects a greater need for a consistent
button/link styling that would be applied in this instance. Intel believes
it is not vital that 'Health' and 'Power' are obviously clickable because
it is a shortcut and expects users to use the main navigation to access
these pages.
- Decided on breaking down the commits into 3. First commit the navigation,
then full height, then the header.


https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

--0000000000002479030597cb8ffd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>Hello,=C2=A0</div><div><br=
></div><div>Notes from today&#39;s GUI workgroup below:=C2=A0</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
 style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot;Lucida Grande&q=
uot;,sans-serif;font-size:10pt"><div dir=3D"ltr"><div>- Discuss use of Carb=
on Design System for icons and components</div></div></div></blockquote><di=
v>- Intel suggests React Bootstrap; likes Carbon system alerts better. IBM =
would propose looking at Vue Bootstrap since we are trying to move the fram=
ework to that. Prefers not to use Carbon because it does not match with the=
 same modern aesthetic that Intel is looking for. Carbon has very small tex=
t and believes bigger is more modern. Also, Carbon uses square vs rounded c=
orners and believes, round is more friendly<br>- Discussed which elements o=
f Carbon could be resolved through styling so that all contributors can ach=
ieve their definition of modernity. Colors and sizes can be themed.<br>- Ex=
amples of modernity provided by Intel: Salesforce, Salesfusion, Google Anal=
ytics<br>- Another design system Intel looked at is Salesforce lightning de=
sign system<br>- Agreed achieving consensus on a style library is the immed=
iate next step and the discussion will be continued on the mailing list wit=
h each party providing alternatives they would be willing to accept.<br></d=
iv><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr" style=3D"font-family:&quot;Lucida Sans Unicode&=
quot;,&quot;Lucida Grande&quot;,sans-serif;font-size:10pt"><div dir=3D"ltr"=
>
<div>- Discuss framework update from AngularJS to Vue</div></div></div></bl=
ockquote><div>The community has not responded to emails regarding the chang=
e. IBM has started building out a prototype using Carbon components. We nee=
d to decide on a style guide before going down this path too far.<br></div>=
<div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr" style=3D"font-family:&quot;Lucida Sans Unicode&quot=
;,&quot;Lucida Grande&quot;,sans-serif;font-size:10pt"><div dir=3D"ltr">
<div>- Discuss primary navigation changes and collaborative=C2=A0work betwe=
en Intel and IBM</div></div></div></blockquote><div><br></div><div>- Intel =
pushed a commit yesterday with an updated navigation. This keeps the existi=
ng background color until we can create theming and resolve color downstrea=
m.<br>- Discussed active, hover, and focused states. Determined focus and h=
over states should be the same. The active state needs a color update to me=
et accessibility and so that it stands out more at a glance.<br>- Agreed th=
e commit does not need to add carets to the navigation pattern since it is =
an existing problem with the UI. However, it should be addressed in the fut=
ure to give users an affordance of hidden text.<br>- Intel to make changes =
and send a screenshot to the email list:<br>1. Add vertical space above =E2=
=80=98Overview=E2=80=99.<br>2. Determine a color for the active state.<br><=
/div><div><br></div><div><br></div><div><br>Next steps (after agreeing on a=
 Design Library)=C2=A0<br>- Want to discuss header next. Brief discussion o=
ccurred in the meeting regarding the styling of &#39;Health&#39; and &#39;P=
ower&#39;. For IBM, these elements don&#39;t look clickable, which reflects=
 a greater need for a consistent button/link styling that would be applied =
in this instance. Intel believes it is not vital that &#39;Health&#39; and =
&#39;Power&#39; are obviously clickable because it is a shortcut and expect=
s users to use the main navigation to access these pages.<br>- Decided on b=
reaking down the commits into 3. First commit the navigation, then full hei=
ght, then the header.<br></div><div><br></div><div><br></div><div><a href=
=3D"https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group">https://=
github.com/openbmc/openbmc/wiki/GUI-Design-work-group</a><br></div><div><br=
></div><div><br></div><div>=C2=A0</div></div></div>

--0000000000002479030597cb8ffd--
