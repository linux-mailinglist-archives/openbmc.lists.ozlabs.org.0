Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E60CB7E7D52
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 16:15:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KcM3RhCk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRj7H66Mlz3dLG
	for <lists+openbmc@lfdr.de>; Sat, 11 Nov 2023 02:15:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KcM3RhCk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRj6g5X6Mz3cSp
	for <openbmc@lists.ozlabs.org>; Sat, 11 Nov 2023 02:14:49 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6cd0963c61cso1172380a34.0
        for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2023 07:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699629284; x=1700234084; darn=lists.ozlabs.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1lkiXLpbcz632ZKqQU8l1R7530mAr3TfOzugf0ZwX4=;
        b=KcM3RhCkQ9sTVynx2YXX5jEOrLB357qrpuRInAj7DZ3n7ZK4R7psIAAAACh6O4WlKP
         2fhLkwNhKbGdmm/AX4xG6eGpXO/FAXNM5Nsxg3iFF0knzUyIn58CAEC4DQBhgamidN8b
         7QpD4Q/L7tIz2B+KfBe3TiSwyxA7mnLXFVkWbGY4VKO7peBo46XIIqaLoJYbBHklo8YL
         YuvY8aJQc+MUYtAq53b9sw2m+OLZjPjAedWLObf8ROX2USqh+XdbK0i/kUqMgShI8xzL
         gOrlpUOLUaN2s6Ilp1mn+jA0XKNFFTzR4LvLAmp00tcNL8VmD0X/RHXwStjRRLf8n5re
         6mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699629284; x=1700234084;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1lkiXLpbcz632ZKqQU8l1R7530mAr3TfOzugf0ZwX4=;
        b=iE4DLd+GQ2Ac7NRloe9kvKJYQKkoly2vwHz25WcEbbn9QnBc8EjrWPFOrgjzVeaY01
         sfnAIvD1dt/2Bb8r4zWjRe+Vj1ntGL8MIWwOe6FgtIMwRt4LRNAY51vJhGlzLUsYoVU/
         9hHMSzn507y4Orrrc02JJYjNd9tY0nJbQyGhWYDOsTGg18QKk5wkypUcsEOazWUjpDpm
         wnMAjACKuryTiiAbSu+EDuxrUh0a8dVJpYkPBiXnLzSonpJqXEndJcNDrFymgsGW1Wg/
         /95fEQMQLjED2AcXIe1Hf7pWkLdePBGJmmGD6FqZIExCSSo8OBhkRu/xauhrRxoA3VNW
         KpRw==
X-Gm-Message-State: AOJu0YxYHkaPDAl3YLbtoPtOiUruyBIkGqMkUoWdyIaLwZswUiNYzLvq
	leacrrXkuyxWC4niW1y+bdPMb6OZnCYvOA==
X-Google-Smtp-Source: AGHT+IH45mvmHiTHU3QR+tvqDgMYtWaRbaE3viJ13Q9GtYdjYBgffmc9S+U9DBGjtRBIoAhQoJiZpw==
X-Received: by 2002:a05:6870:f151:b0:1ea:125f:cffa with SMTP id l17-20020a056870f15100b001ea125fcffamr8732177oac.34.1699629283849;
        Fri, 10 Nov 2023 07:14:43 -0800 (PST)
Received: from smtpclient.apple ([2806:2f0:96c0:f980:59ed:59f9:d54d:5be3])
        by smtp.gmail.com with ESMTPSA id ea52-20020a056870073400b001d4c5e4c2c5sm1175073oab.25.2023.11.10.07.14.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Nov 2023 07:14:43 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Message-Id: <EBD61126-29BE-43CD-BABD-3B66B136393F@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_AF99D8AC-A18C-42BF-95DC-3F984E46CAD6"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: Quantas CCLA Schedule A update 2023-11-08
Date: Fri, 10 Nov 2023 09:14:32 -0600
In-Reply-To: <PSBPR04MB3941258592D6A0926435CB49F1A8A@PSBPR04MB3941.apcprd04.prod.outlook.com>
To: =?utf-8?B?IkxpdHp1bmcgQ2hlbiAo6Zmz5Yip55CuKSI=?= <Litzung.Chen@quantatw.com>
References: <TY2PR04MB3952B507D338A69F62D05C16F1809@TY2PR04MB3952.apcprd04.prod.outlook.com>
 <TY2PR04MB39521A0024591D9C23B23B98F11EA@TY2PR04MB3952.apcprd04.prod.outlook.com>
 <PSBPR04MB3941258592D6A0926435CB49F1A8A@PSBPR04MB3941.apcprd04.prod.outlook.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, =?utf-8?B?IkNvc21vIENob3UgKOWRqOalt+WfuSki?= <Cosmo.Chou@quantatw.com>, =?utf-8?B?IkplcnJ5IExpbiAo5p6X5aiB5a6PKSI=?= <Jerry.Lin@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_AF99D8AC-A18C-42BF-95DC-3F984E46CAD6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Thanks for keeping your CLA up to date. It has been updated in the =
openbmc CLA google drive.

Please take it as an opportunity to add or remove people from the =
approved CI group up at
=
https://gerrit.openbmc.org/admin/groups/5d22bf462b81a6e5a095186146374c7367=
2d2f52,members

Thanks,
Andrew

> On Nov 7, 2023, at 9:14=E2=80=AFPM, Litzung Chen (=E9=99=B3=E5=88=A9=E7=90=
=AE) <Litzung.Chen@quantatw.com> wrote:
>=20
> Hi team,
> =20
> Please find the attached file for updated Schedule A of CCLA from =
Quanta.
> =20
> Thank you.
> =20
> Best Regards,
> Litzung
> Research Division - Software Technologist
> Cloud Computing Business Unit
> Quanta Computer Inc.
> <Quanta_Schedule_A_Update_2023-11-08.pdf>


--Apple-Mail=_AF99D8AC-A18C-42BF-95DC-3F984E46CAD6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">Thanks for =
keeping your CLA up to date. It has been updated in the openbmc CLA =
google drive.<div><br></div><div>Please take it as an opportunity to add =
or remove people from the approved CI group up at</div><div><a =
href=3D"https://gerrit.openbmc.org/admin/groups/5d22bf462b81a6e5a095186146=
374c73672d2f52,members">https://gerrit.openbmc.org/admin/groups/5d22bf462b=
81a6e5a095186146374c73672d2f52,members</a><div><br></div><div>Thanks,</div=
>Andrew<br id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote =
type=3D"cite"><div>On Nov 7, 2023, at 9:14=E2=80=AFPM, Litzung Chen =
(=E9=99=B3=E5=88=A9=E7=90=AE) &lt;Litzung.Chen@quantatw.com&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div><meta =
charset=3D"UTF-8"><div class=3D"WordSection1" style=3D"page: =
WordSection1; caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><div style=3D"margin: 0cm; font-size: 12pt; font-family: Calibri, =
sans-serif; text-align: justify;"><span lang=3D"EN-US" style=3D"font-size:=
 10pt; font-family: Verdana, sans-serif; color: blue;">Hi</span><span =
lang=3D"EN-US" style=3D"font-size: 10pt; font-family: Verdana, =
sans-serif; color: rgb(0, 51, 204);"><span =
class=3D"Apple-converted-space">&nbsp;</span>team</span><span =
lang=3D"EN-US" style=3D"font-size: 10pt; font-family: Verdana, =
sans-serif; color: blue;">,<o:p></o:p></span></div><div style=3D"margin: =
0cm; font-size: 12pt; font-family: Calibri, sans-serif; text-align: =
justify;"><span lang=3D"EN-US" style=3D"font-size: 10pt; font-family: =
Verdana, sans-serif; color: blue;"><o:p>&nbsp;</o:p></span></div><div =
style=3D"margin: 0cm; font-size: 12pt; font-family: Calibri, sans-serif; =
text-align: justify;"><span lang=3D"EN-US" style=3D"font-size: 10pt; =
font-family: Verdana, sans-serif; color: rgb(0, 51, 204);">Please find =
the attached file for updated Schedule A of CCLA from =
Quanta.<o:p></o:p></span></div><div style=3D"margin: 0cm; font-size: =
12pt; font-family: Calibri, sans-serif; text-align: justify;"><span =
lang=3D"EN-US" style=3D"font-size: 10pt; font-family: Verdana, =
sans-serif; color: rgb(0, 51, 204);"><o:p>&nbsp;</o:p></span></div><div =
style=3D"margin: 0cm; font-size: 12pt; font-family: Calibri, sans-serif; =
text-align: justify;"><span lang=3D"EN-US" style=3D"font-size: 10pt; =
font-family: Verdana, sans-serif; color: rgb(0, 51, 204);">T</span><span =
lang=3D"EN-US" style=3D"font-size: 10pt; font-family: Verdana, =
sans-serif; color: blue;">hank</span><span lang=3D"EN-US" =
style=3D"font-size: 10pt; font-family: Verdana, sans-serif; color: =
rgb(0, 51, 204);"><span =
class=3D"Apple-converted-space">&nbsp;</span>you</span><span =
lang=3D"EN-US" style=3D"font-size: 10pt; font-family: Verdana, =
sans-serif; color: blue;">.</span><span lang=3D"EN-US" style=3D"font-size:=
 10pt; font-family: Verdana, sans-serif; color: rgb(0, 51, =
204);"><o:p></o:p></span></div><div style=3D"margin: 0cm; font-size: =
12pt; font-family: Calibri, sans-serif; text-align: justify;"><span =
lang=3D"EN-US" style=3D"font-size: 10pt; font-family: Verdana, =
sans-serif; color: rgb(0, 51, =
204);"><o:p>&nbsp;</o:p></span></div><div><div style=3D"margin: 0cm; =
font-size: 12pt; font-family: Calibri, sans-serif; text-align: =
justify;"><span lang=3D"EN-US" style=3D"font-size: 10pt; font-family: =
Verdana, sans-serif; color: blue;">Best</span><span lang=3D"EN-US" =
style=3D"font-size: 10pt; font-family: Verdana, sans-serif;"><span =
class=3D"Apple-converted-space">&nbsp;</span></span><span lang=3D"EN-US" =
style=3D"font-size: 10pt; font-family: Verdana, sans-serif; color: =
blue;">Regards,</span><span lang=3D"EN-US" style=3D"font-size: 10pt; =
font-family: Tahoma, sans-serif; color: rgb(0, 51, =
204);"><o:p></o:p></span></div><div style=3D"margin: 0cm; font-size: =
12pt; font-family: Calibri, sans-serif; text-align: justify;"><span =
lang=3D"EN-US" style=3D"font-size: 10pt; font-family: Verdana, =
sans-serif; color: blue;">Litzung</span><span lang=3D"EN-US" =
style=3D"font-size: 10pt; font-family: Tahoma, sans-serif; color: rgb(0, =
51, 204);"><o:p></o:p></span></div><div style=3D"margin: 0cm; font-size: =
12pt; font-family: Calibri, sans-serif; text-align: justify;"><span =
lang=3D"EN-US" style=3D"font-size: 10pt; font-family: Verdana, =
sans-serif; color: silver;">Research Division - Software =
Technologist</span><span lang=3D"EN-US" style=3D"font-size: 10pt; =
font-family: Tahoma, sans-serif; color: rgb(0, 51, =
204);"><o:p></o:p></span></div><div style=3D"margin: 0cm; font-size: =
12pt; font-family: Calibri, sans-serif; text-align: justify;"><span =
lang=3D"EN-US" style=3D"font-size: 10pt; font-family: Verdana, =
sans-serif; color: silver;">Cloud Computing Business Unit</span><span =
lang=3D"EN-US" style=3D"font-size: 10pt; font-family: Tahoma, =
sans-serif; color: rgb(0, 51, 204);"><o:p></o:p></span></div></div><div =
style=3D"margin: 0cm; font-size: 12pt; font-family: Calibri, =
sans-serif;"><span lang=3D"EN-US" style=3D"font-size: 10pt; font-family: =
Verdana, sans-serif; color: silver;">Quanta Computer Inc.</span><span =
lang=3D"EN-US"><o:p></o:p></span></div></div><span =
id=3D"cid:F859E34C-994E-4A73-B232-CED230309228">&lt;Quanta_Schedule_A_Upda=
te_2023-11-08.pdf&gt;</span></div></blockquote></div><br></div></body></ht=
ml>=

--Apple-Mail=_AF99D8AC-A18C-42BF-95DC-3F984E46CAD6--
