Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 127E84C4664
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 14:31:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4rKJ2Ftyz3bb4
	for <lists+openbmc@lfdr.de>; Sat, 26 Feb 2022 00:31:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pDSkUulU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pDSkUulU; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4rJv0YjXz3Wtt
 for <openbmc@lists.ozlabs.org>; Sat, 26 Feb 2022 00:31:24 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id 12so7359616oix.12
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 05:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=gamoD5zGf2Sz6aH2pBOLq2eOpyruz09Owb+Q2uTS6Mk=;
 b=pDSkUulUmism7TrDuV6MDKNlr+1TD0E2I9pAmuwRrRUvgJVJhoCuP8nWjGVefQAm2l
 sTUNLPaRaqf8wtVNxgF8EVDr62kBNixCeoZPSdKyuJ3yzCUiHBoaCK0BuDIDWFZVnn09
 0P+jzELFbQw1kQ4KL34E2H8yUVqlNnbs8/zExiDoduYLVwWsWaz7UbrbAXXUCoEx4ZS+
 8AV4b1J46q2ps5hYu3U9qlCH/5mP+g1stl/qqL7P9ulMXjitBTmoYh0JCPsuGKTKfiHV
 7IgqWIFxYzDCCxvTQPc1iZapzMZ6EVRAYCxn4ElxaaKppC3savsTmodEHRaN0AiZq6Ab
 0Klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=gamoD5zGf2Sz6aH2pBOLq2eOpyruz09Owb+Q2uTS6Mk=;
 b=I7qL3pgCXqknDoHfEv6x9XTE01gCF6T/97rbXnmoYLMCsb9TOHR90ZGsIt3RJo3Fo8
 ejfeOe4zForKJnxF3LphVnVBDi7bKehy5H0mauiY7N5nVzzlP2M0+Y5CgPiq+aHvkett
 /WqIsZ7bnF4iMxc3HiyF0E22pKGk8lC5tm35+qQmQtR5bIPAIwx5pFfbTAW5R9GjufDy
 dxkk4w0pbYz5pj+bqthj9L52y1x4jYYSrDyoBUdnVJT0qYZUkr5GeaFg+sZknXj3bhUD
 +lEdEfJsu3vrBi6M8lQV2kM03R4ISkrOgy9cgzP4/do49dm0I/bsLEM5JeKdaSsoaXsN
 TdCw==
X-Gm-Message-State: AOAM531jvi1b5v7MoyW5ARc7FUBQrUDrlHDE8saAsJPWzUyzmQ+gAUIl
 7NtVDRxnLQIjGjmiEXFdxeJTLgq7l8yyNw==
X-Google-Smtp-Source: ABdhPJxz70pNdzHOftsV655sDxOQGsCiNd48iq178KzoiZjjVkXcaZpHWY3+P13D+2XJbosC9ilZ6g==
X-Received: by 2002:a05:6808:23c1:b0:2d7:390e:5c2a with SMTP id
 bq1-20020a05680823c100b002d7390e5c2amr1576974oib.108.1645795882364; 
 Fri, 25 Feb 2022 05:31:22 -0800 (PST)
Received: from smtpclient.apple ([37.19.210.176])
 by smtp.gmail.com with ESMTPSA id
 7-20020a4a1e07000000b002fcc8003c36sm1058062ooq.14.2022.02.25.05.31.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Feb 2022 05:31:21 -0800 (PST)
From: Mike Jones <proclivis@gmail.com>
Message-Id: <CE613404-79EA-4D39-816D-B16E757CB64A@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_E23F14A2-3F59-4EA9-B7B8-2C9DB72A50C3"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: openBmc Code Structure
Date: Fri, 25 Feb 2022 06:31:20 -0700
In-Reply-To: <MA1PR01MB41290C4B84DDFB7ABD101CB7873E9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
To: Sandeep Kumar <sandeep.pkumar@tcs.com>
References: <MA1PR01MB41290C4B84DDFB7ABD101CB7873E9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_E23F14A2-3F59-4EA9-B7B8-2C9DB72A50C3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Sandeep,

I think that is like asking what the source code structure of a linux =
distribution is. Obmc is built from a linux kernel and many application, =
each with it=E2=80=99s own structure.

I=E2=80=99m still learning OBMC myself, but I would look at the obmc =
design docs and learn its architecture, which is basically a dbus system =
with services, and to the outside world, Redfish. Yocto is the glue that =
makes a complete image.

Mike

> On Feb 24, 2022, at 11:42 PM, Sandeep Kumar <sandeep.pkumar@tcs.com> =
wrote:
>=20
> Hi,
> =20
> I have just started looking into the openBmc source code. Could anyone =
explain the source code structure for openBMC?
> =20
> Thanks,
> Sandeep.
> =3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D
> Notice: The information contained in this e-mail
> message and/or attachments to it may contain=20
> confidential or privileged information. If you are=20
> not the intended recipient, any dissemination, use,=20
> review, distribution, printing or copying of the=20
> information contained in this e-mail message=20
> and/or attachments to it are strictly prohibited. If=20
> you have received this communication in error,=20
> please notify us by reply e-mail or telephone and=20
> immediately and permanently delete the message=20
> and any attachments. Thank you
>=20


--Apple-Mail=_E23F14A2-3F59-4EA9-B7B8-2C9DB72A50C3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Sandeep,<div class=3D""><br class=3D""></div><div class=3D"">I =
think that is like asking what the source code structure of a linux =
distribution is. Obmc is built from a linux kernel and many application, =
each with it=E2=80=99s own structure.</div><div class=3D""><br =
class=3D""></div><div class=3D"">I=E2=80=99m still learning OBMC myself, =
but I would look at the obmc design docs and learn its architecture, =
which is basically a dbus system with services, and to the outside =
world, Redfish. Yocto is the glue that makes a complete image.</div><div =
class=3D""><br class=3D""></div><div class=3D"">Mike<br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 24, 2022, at 11:42 PM, Sandeep Kumar &lt;<a =
href=3D"mailto:sandeep.pkumar@tcs.com" =
class=3D"">sandeep.pkumar@tcs.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><div class=3D"WordSection1" style=3D"page: =
WordSection1; caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><div style=3D"margin: 0in; font-size: 11pt; font-family: Calibri, =
sans-serif;" class=3D"">Hi,<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in; font-size: 11pt; font-family: Calibri, =
sans-serif;" class=3D""><o:p class=3D"">&nbsp;</o:p></div><div =
style=3D"margin: 0in; font-size: 11pt; font-family: Calibri, =
sans-serif;" class=3D"">I have just started looking into the openBmc =
source code. Could anyone explain the source code structure for =
openBMC?<o:p class=3D""></o:p></div><div style=3D"margin: 0in; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in; font-size: 11pt; =
font-family: Calibri, sans-serif;" class=3D"">Thanks,<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in; font-size: 11pt; =
font-family: Calibri, sans-serif;" class=3D"">Sandeep.<o:p =
class=3D""></o:p></div></div><p style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D----=
-=3D=3D=3D=3D=3D<br class=3D"">Notice: The information contained in this =
e-mail<br class=3D"">message and/or attachments to it may contain<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">confidential =
or privileged information. If you are<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">not the =
intended recipient, any dissemination, use,<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">review, =
distribution, printing or copying of the<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">information =
contained in this e-mail message<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">and/or =
attachments to it are strictly prohibited. If<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">you have =
received this communication in error,<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">please =
notify us by reply e-mail or telephone and<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">immediately =
and permanently delete the message<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">and any =
attachments. Thank you</p></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_E23F14A2-3F59-4EA9-B7B8-2C9DB72A50C3--
