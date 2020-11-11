Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6705C2AEFEC
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 12:47:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWNHy4x79zDqKJ
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 22:47:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=srisathish23@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=t146+LaU; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWNCz2nCvzDqmY
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 22:43:36 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id ie6so578530pjb.0
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 03:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7an51huVFAhl4n7UVfTCgCb5pVb631qOsiqtzX6ejfM=;
 b=t146+LaUXedDvOarV3fGSSw55l+A/jAlqvRYutpLS0G94CGzEESisqQ8LgK1KgyFn0
 csTbyIk2MjtLdg1VFzOW0IiikCXMCfFsE5TDckSgNqrpr+/n8PfVHfgtq0aPk99QlwLc
 Rrr7GZ1991WIGGwINemqrTVyq8zMzG2RFgtEyV84DfN1qrJJuduBfaSKhx0qBnVAC6hz
 UeDTTEEpOzQh41mnbdScuHlgscN/mZwqj4LJzIXe/S6vCcAbENk2NOVbG2tlEPVyojpk
 9ho8oagWQgcbc7DPHKoxU1EmOotdWBZKTgYwDmY3FEB9MNe22Xc+SA2xK3MaIH+6KqiV
 eSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7an51huVFAhl4n7UVfTCgCb5pVb631qOsiqtzX6ejfM=;
 b=VvX6TEG/Q9XLJiONFs4KalCspBi75h5sixdlzDPkyjn3HUeiIDnQ9TmIQ4ceGnBzJ2
 wA3+BrxeE2JTMeYVLlpJvahFlsUuY1dTkAsJauME+/bVm4MwzIm3MneLOCnlMRohhMyL
 9MVbKPXfaTblCmqqQCISCwF+0w3szUM/qveAwx1QfIFDADNowu0Ao3zPSddna6JjNk7a
 pV2pKfntb955irDMPY3Zvaal5BL6Ux8PBQAlaWBE32K/5dmbhSarReaa6c3xDFi3K5S9
 nHx8/aLceMqqizYJ+ynv2hr0rr+6ZDjQ5OpTUBbQLdDqTJWr59S8YZn4Jh9lrLywF7cR
 RFMw==
X-Gm-Message-State: AOAM532meUybB4P6buE0Ie8Wc3Sx4F9UyqObJUiZEkkUCfPwqPF3yr3p
 nG2Jjx0jLE7WovHVyniGAOhDtsooiyPrGkE8vUBpURya
X-Google-Smtp-Source: ABdhPJy7iaY41ad+Mp8yBJhNv90zHgv+vUIxhH9xHoRq/0HwqowjMdCLiPlX/yEhqN69d80iFrNqvisY7jTPaIp/rns=
X-Received: by 2002:a17:902:c410:b029:d6:ad08:baa0 with SMTP id
 k16-20020a170902c410b02900d6ad08baa0mr21845842plk.78.1605095012724; Wed, 11
 Nov 2020 03:43:32 -0800 (PST)
MIME-Version: 1.0
References: <PS2PR04MB376626759A0B805833E82782F0E80@PS2PR04MB3766.apcprd04.prod.outlook.com>
In-Reply-To: <PS2PR04MB376626759A0B805833E82782F0E80@PS2PR04MB3766.apcprd04.prod.outlook.com>
From: SATHISH <srisathish23@gmail.com>
Date: Wed, 11 Nov 2020 17:13:20 +0530
Message-ID: <CAFy7wvqH=3TphMDFb0AyNc4xtK=DvC3pDiQDZuvB=mbr3X39Pg@mail.gmail.com>
Subject: Reg:- SDR sensor read
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000001072e205b3d34ec3"
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
Cc: thangavel.k@hcl.com, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001072e205b3d34ec3
Content-Type: text/plain; charset="UTF-8"

Classification: *Internal*

Hi Team,

I am working to include the sensors from the FRU (HOST), The fru
communication is through ipmb.

I tried by adding all the sensor address and limits details in the JSON
file and get the sensor details under IPMBSensor using entity manager.

It looks more static and now i wanted it to be added dynamically using SDR
commands.

The following are the SDR commands supported by FRU and using this we can
dynamically get the sensor list and include the sensors.

*Command*

*NetFn*

*CMD*

Get SDR Repository Info

Storage

20h

Reserve SDR Repository

Storage

21h

Get SDR

Storage

23h


Is there an implementation already exists to handle SDRs for ipmbbased FRUs?

Please let me know your thoughts/inputs



Thanks,

Sathish S.


::DISCLAIMER::
------------------------------
The contents of this e-mail and any attachment(s) are confidential and
intended for the named recipient(s) only. E-mail transmission is not
guaranteed to be secure or error-free as information could be intercepted,
corrupted, lost, destroyed, arrive late or incomplete, or may contain
viruses in transmission. The e mail and its contents (with or without
referred errors) shall therefore not attach any liability on the originator
or HCL or its affiliates. Views or opinions, if any, presented in this
email are solely those of the author and may not necessarily reflect the
views or opinions of HCL or its affiliates. Any form of reproduction,
dissemination, copying, disclosure, modification, distribution and / or
publication of this message without the prior written consent of authorized
representative of HCL is strictly prohibited. If you have received this
email in error please delete it and notify the sender immediately. Before
opening any email and/or attachments, please check them for viruses and
other defects.
------------------------------

--0000000000001072e205b3d34ec3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" =
class=3D"gmail_attr">Classification: <b><span style=3D"color:#08298a">Inter=
nal</span></b><br></div><div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F=
72"><div class=3D"m_2895823999935856263WordSection1">
<p class=3D"MsoNormal">Hi Team,</p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif">I am working to include=
 the sensors from the FRU (HOST), The fru communication is through ipmb.</s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif">I tried by adding all t=
he sensor address and limits details in the JSON file and=C2=A0</span><span=
 style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;font-size:10.5pt">get=
 the sensor details under IPMBSensor using entity manager.</span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif">It looks more static an=
d now i wanted it to be added dynamically using SDR commands.</span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif">The following are the S=
DR commands supported by FRU and using this we can dynamically get the sens=
or list and include the sensors.</span><span style=3D"font-family:&quot;Seg=
oe UI&quot;,sans-serif;font-size:10.5pt;text-indent:0.5in">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0</span></p>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"0" style=
=3D"width:214.0pt;border-collapse:collapse">
<tbody>
<tr style=3D"height:15.0pt">
<td width=3D"192" nowrap valign=3D"bottom" style=3D"width:143.75pt;border:s=
olid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:15.0pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><spa=
n style=3D"color:black">Command<u></u><u></u></span></b></p>
</td>
<td width=3D"60" nowrap valign=3D"bottom" style=3D"width:22.25pt;border:sol=
id windowtext 1.0pt;border-left:none;padding:0in 5.4pt 0in 5.4pt;height:15.=
0pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><spa=
n style=3D"color:black">NetFn<u></u><u></u></span></b></p>
</td>
<td width=3D"64" nowrap valign=3D"bottom" style=3D"width:48.0pt;border:soli=
d windowtext 1.0pt;border-left:none;padding:0in 5.4pt 0in 5.4pt;height:15.0=
pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><spa=
n style=3D"color:black">CMD<u></u><u></u></span></b></p>
</td>
</tr>
<tr style=3D"height:15.0pt">
<td width=3D"192" nowrap valign=3D"bottom" style=3D"width:143.75pt;border:s=
olid windowtext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:15=
.0pt">
<p class=3D"MsoNormal"><span style=3D"color:black">Get SDR Repository Info<=
u></u><u></u></span></p>
</td>
<td width=3D"60" nowrap valign=3D"bottom" style=3D"width:22.25pt;border-top=
:none;border-left:none;border-bottom:solid windowtext 1.0pt;border-right:so=
lid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:15.0pt">
<p class=3D"MsoNormal"><span style=3D"color:black">Storage<u></u><u></u></s=
pan></p>
</td>
<td width=3D"64" nowrap valign=3D"bottom" style=3D"width:48.0pt;border-top:=
none;border-left:none;border-bottom:solid windowtext 1.0pt;border-right:sol=
id windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:15.0pt">
<p class=3D"MsoNormal"><span style=3D"color:black">20h<u></u><u></u></span>=
</p>
</td>
</tr>
<tr style=3D"height:15.0pt">
<td width=3D"192" nowrap valign=3D"bottom" style=3D"width:143.75pt;border:s=
olid windowtext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:15=
.0pt">
<p class=3D"MsoNormal"><span style=3D"color:black">Reserve SDR Repository<u=
></u><u></u></span></p>
</td>
<td width=3D"60" nowrap valign=3D"bottom" style=3D"width:22.25pt;border-top=
:none;border-left:none;border-bottom:solid windowtext 1.0pt;border-right:so=
lid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:15.0pt">
<p class=3D"MsoNormal"><span style=3D"color:black">Storage<u></u><u></u></s=
pan></p>
</td>
<td width=3D"64" nowrap valign=3D"bottom" style=3D"width:48.0pt;border-top:=
none;border-left:none;border-bottom:solid windowtext 1.0pt;border-right:sol=
id windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:15.0pt">
<p class=3D"MsoNormal"><span style=3D"color:black">21h<u></u><u></u></span>=
</p>
</td>
</tr>
<tr style=3D"height:15.0pt">
<td width=3D"192" nowrap valign=3D"bottom" style=3D"width:143.75pt;border:s=
olid windowtext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:15=
.0pt">
<p class=3D"MsoNormal"><span style=3D"color:black">Get SDR<u></u><u></u></s=
pan></p>
</td>
<td width=3D"60" nowrap valign=3D"bottom" style=3D"width:22.25pt;border-top=
:none;border-left:none;border-bottom:solid windowtext 1.0pt;border-right:so=
lid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:15.0pt">
<p class=3D"MsoNormal"><span style=3D"color:black">Storage<u></u><u></u></s=
pan></p>
</td>
<td width=3D"64" nowrap valign=3D"bottom" style=3D"width:48.0pt;border-top:=
none;border-left:none;border-bottom:solid windowtext 1.0pt;border-right:sol=
id windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:15.0pt">
<p class=3D"MsoNormal"><span style=3D"color:black">23h<u></u><u></u></span>=
</p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif"><br>Is there an impleme=
ntation already exists to handle SDRs for ipmbbased FRUs?<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif">Please let me know your=
 thoughts/inputs<u></u><u></u></span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Sathish S.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<font face=3D"Arial" color=3D"Gray" size=3D"1">::DISCLAIMER::<br>
<hr>
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or
 incomplete, or may contain viruses in transmission. The e mail and its con=
tents (with or without referred errors) shall therefore not attach any liab=
ility on the originator or HCL or its affiliates. Views or opinions, if any=
, presented in this email are solely
 those of the author and may not necessarily reflect the views or opinions =
of HCL or its affiliates. Any form of reproduction, dissemination, copying,=
 disclosure, modification, distribution and / or publication of this messag=
e without the prior written consent
 of authorized representative of HCL is strictly prohibited. If you have re=
ceived this email in error please delete it and notify the sender immediate=
ly. Before opening any email and/or attachments, please check them for viru=
ses and other defects.<br>
<hr>
</font>
</div>

</div></div>

--0000000000001072e205b3d34ec3--
