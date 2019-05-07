Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8531166FB
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 17:39:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44z3g80fB4zDqHv
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 01:39:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c35; helo=mail-yw1-xc35.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HH2Gk7Wz"; 
 dkim-atps=neutral
Received: from mail-yw1-xc35.google.com (mail-yw1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44z3fH6b3TzDq7k
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 01:38:13 +1000 (AEST)
Received: by mail-yw1-xc35.google.com with SMTP id q185so13575642ywe.3
 for <openbmc@lists.ozlabs.org>; Tue, 07 May 2019 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=n3Mg0FMPFYnmgLtITFPPL2ycWm8Udq/aKHgLQUiwHM8=;
 b=HH2Gk7WzBZnDYwhmwX9ACKf30vhJjSXqfqpNw4t7jPHtzDhuqu24UQlocKG1DVUxtj
 P/bTJ4MvS52zp2tILVzGRzj8Zw63meDFfwpX6zbcplF33KHLXr1uT8yqqL3E1fo8s2xw
 oKBTOYYNG3AIZJuZw7Fr4TbaduwQv2cUFlkVxEjlmM7cf2i7Kv2EGicnvN2sacxUBKXb
 esqzKYAljSaoh9OQIqSbhPvcB+XdhVz0m1hBToNbf4NsbZM/7kLMCmYAv7HLTbsh0AC1
 C5+x4yXNIMjWrw2BxgkunI8muCgy0fRwivwRkU1iXHjClAEdB7UPxBNE2aQOURbxgBQH
 9ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=n3Mg0FMPFYnmgLtITFPPL2ycWm8Udq/aKHgLQUiwHM8=;
 b=Nn/4S/jj4hXebW8sSGgI3Rof+ZBwmUIk44ICibTta8cpm4eN3cxGMOx9NXoPEd6OmE
 D2gGWiXf0tNGb1RTrUL++5BjPFn0RG0S88XWwwv2Uap4JNn6c15iBHEjSJ0FslyN246N
 1voSwtB66Th69tfCZH9q3VxtJ+/EgoqZMejxwFOfMdYK1KSx4VlpMC9kueMuky+/oWcl
 enEwyqOoRQudgsIrDbjCRwexpWHoa0Dk4c6u5ZfFqAyUFb+hFQKBwvfJveqzEmIdVK1L
 VLaLdWWMF29DF/P9ABfQLc8xdRyAFgl17ENZi5oJWifqnuAvlOBFZC+xgyKbAi2sBIDv
 NwGg==
X-Gm-Message-State: APjAAAUPX1w9GZjwgamz9UVkDDrjnBBtERa9dSXFuffkUclaFo89hW9J
 C3NJsW+HOwcgnKaKBFHGl59JqacMRlW96rOIoqRaJH4U
X-Google-Smtp-Source: APXvYqxTWs8PqPz3z6Qa7peR61u+GwwQuMECbI9HozboNuWcniEL4yKBqH0KZSFZdQkYNCppiH/xhbniRHloghQAwTQ=
X-Received: by 2002:a25:a324:: with SMTP id d33mr20522447ybi.220.1557243490223; 
 Tue, 07 May 2019 08:38:10 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Tue, 7 May 2019 10:37:52 -0500
Message-ID: <CAMTupoQ90ms4czjWDPuR4K4P0Os6X5hSROGJ3Lt8rOHvEEn70g@mail.gmail.com>
Subject: GUI Workgroup - Tomorrow at 7:30AM CST
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000104a2005884e0119"
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

--000000000000104a2005884e0119
Content-Type: text/plain; charset="UTF-8"

Hello all,

The GUI design workgroup meeting will be happening tomorrow, May 8th, 2019.

Tentative agenda:

   1. Discuss Intel issues and task list (Event log - force boot to BIOS,
   review others listed in the GUI)

   a.    Show system information includes Model/Manufacturer/SerialNumber/BiosId
   b.    Implement disable/enable feature for SOL
   c.    Implement SOL log download in SOL page
   d.    Force boot to bios
   e.    SSL certificate upload

   2. Discuss icon implementation process and discussion of downstream icon
   customization
   3. Review IBM issues and task list (Remote Logging, Boot Options,
   Network Settings)

Please add any other agenda items here:
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group


Best,
GUI Design Team

--000000000000104a2005884e0119
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><span style=3D"back=
ground-color:transparent"><font face=3D"verdana, sans-serif">Hello all,=C2=
=A0</font></span></div><div><span style=3D"background-color:transparent;col=
or:rgb(36,41,46)"><font face=3D"verdana, sans-serif"><br></font></span></di=
v><div><span style=3D"background-color:transparent;color:rgb(36,41,46)"><fo=
nt face=3D"verdana, sans-serif">The GUI design workgroup meeting will be ha=
ppening tomorrow, May 8th, 2019.=C2=A0</font></span></div><div><span style=
=3D"background-color:transparent;color:rgb(36,41,46)"><font face=3D"verdana=
, sans-serif"><br></font></span></div><div><font color=3D"#24292e" face=3D"=
verdana, sans-serif">Tentative agenda:=C2=A0</font></div><div><ol style=3D"=
box-sizing:border-box;margin-bottom:16px;margin-top:0px;padding-left:2em;co=
lor:rgb(36,41,46)"><li style=3D"margin-left:15px;box-sizing:border-box"><fo=
nt face=3D"verdana, sans-serif">Discuss Intel issues and task list (Event l=
og - force boot to BIOS, review others listed in the GUI)=C2=A0</font><pre =
style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&quot;Li=
beration Mono&quot;,Menlo,Courier,monospace;font-size:13.6px;margin-bottom:=
16px;margin-top:0px;background-color:rgb(246,248,250);border-radius:3px;lin=
e-height:1.45;overflow:auto;padding:16px"><code style=3D"box-sizing:border-=
box;font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,C=
ourier,monospace;background:transparent;border-radius:3px;margin:0px;paddin=
g:0px;border:0px;word-break:normal;display:inline;line-height:inherit;overf=
low:visible">a.    Show system information includes Model/Manufacturer/Seri=
alNumber/BiosId
b.    Implement disable/enable feature for SOL
c.    Implement SOL log download in SOL page
d.    Force boot to bios
e.    SSL certificate upload</code></pre></li><li style=3D"margin-left:15px=
;box-sizing:border-box;margin-top:0.25em"><font face=3D"verdana, sans-serif=
">Discuss icon implementation process and discussion of downstream icon cus=
tomization=C2=A0</font></li><li style=3D"margin-left:15px;box-sizing:border=
-box;margin-top:0.25em"><font face=3D"verdana, sans-serif">Review IBM issue=
s and task list (Remote Logging, Boot Options, Network Settings)=C2=A0</fon=
t></li></ol></div><div><font face=3D"verdana, sans-serif">Please add any ot=
her agenda items here:=C2=A0<a href=3D"https://github.com/openbmc/openbmc/w=
iki/GUI-Design-work-group">https://github.com/openbmc/openbmc/wiki/GUI-Desi=
gn-work-group</a></font></div><div><br></div><div><br></div><div><span styl=
e=3D"background-color:transparent;color:rgb(36,41,46)"><font face=3D"verdan=
a, sans-serif">Best,</font></span></div><div><span style=3D"background-colo=
r:transparent;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif"><span=
 class=3D"gmail-m_-6172510825241159069gmail-il">GUI</span>=C2=A0<span class=
=3D"gmail-m_-6172510825241159069gmail-il">Design</span>=C2=A0Team=C2=A0</fo=
nt></span></div></div><div class=3D"gmail-yj6qo"></div><div class=3D"gmail_=
quote gmail-adL"><br class=3D"gmail-Apple-interchange-newline"></div></div>=
</div>

--000000000000104a2005884e0119--
