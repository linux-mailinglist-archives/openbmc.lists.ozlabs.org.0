Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6833C15FD5
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 10:53:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44ytg54HTLzDqM9
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 18:53:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="W9cWsTf3"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ytf36ZDszDqKR
 for <openbmc@lists.ozlabs.org>; Tue,  7 May 2019 18:52:26 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id a59so7830990pla.5
 for <openbmc@lists.ozlabs.org>; Tue, 07 May 2019 01:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=DlKskbMjKOVSPlwLTRbkkkRR8vo1eesh2z2WxqZzK8U=;
 b=W9cWsTf3lvkWEGeF2Sh/AYTuv7HbHz+hz1/JqaQWYHClaVOuECMiGWm9VLeo5j0tEz
 yfjdCLMuwc/wFA9BthC+v0c56b2lowN4N5YB9WLkY02KTSj5JXjpcqfPpYrNvmXEet3u
 kwc/iqr3qcYqjtC2EBhtC4sTaxmJsDaNk/QUQV39cdoiZ+a1HAQHzn+SAL705YshJ9P7
 NBnrWlYYaO+2KKKHoW8MeUHdGIHuRaMzhgNmtgJKILqp43C1ZooT1FaR2EYcNPCxzBcH
 nt1P1kxf0JKGisZlOuZoOnpHjdzP5ClQoAI0+lxlTFYOvyhPpOAcYwu1kpAjrwRethTD
 cJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=DlKskbMjKOVSPlwLTRbkkkRR8vo1eesh2z2WxqZzK8U=;
 b=asLPEY2A2KzJRevU1kTgPzHqEebx4OCOO2qrvgBHBNEwD4x/Fo23l+3PPaI8NiAXhL
 r2lL02Dof64XaaOMgstLYZYXJ9G/fXyV8qErBeVVa2jvmgoCrjQ1uTdCTpSJysnaaesp
 QcY3kkfYO2UCQGHUJtS8V+26bx1NwpV4UP6e0p6eM9t4zTIgKLPGGOBAM25IkXjiN+gp
 wLpnEmowSC5r00s/y11Deqv0RAK2VwWJ+MDOVn+2G6por5k080D8RYPxVB+Fhxnv/oad
 8z03T6rUfH8/XPV0EOp11Y1t2EYGQuzok1UaYTLu4Li+YkyFEDr5WkKnDV2utVlOV1+P
 j1Iw==
X-Gm-Message-State: APjAAAW10fvQBFyymzdJFe6f/yawdR2+pW13DmzWOMmxtcFE8fbl4/yX
 +OJ70NFRip9ivnBxN9C3On4=
X-Google-Smtp-Source: APXvYqxagOE2SW04BTzvC4RbYnZU040y1SP2QZUXDO80zW+9t3ABYKKCB8RKxTzipBtgy+sYz4Y1og==
X-Received: by 2002:a17:902:8609:: with SMTP id
 f9mr36951022plo.32.1557219143122; 
 Tue, 07 May 2019 01:52:23 -0700 (PDT)
Received: from [192.168.1.2] (118-163-39-90.HINET-IP.hinet.net.
 [118.163.39.90])
 by smtp.gmail.com with ESMTPSA id l15sm15598251pgb.71.2019.05.07.01.52.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 01:52:22 -0700 (PDT)
From: Brad Chou <chou.brad@gmail.com>
Message-Id: <A2B0CA36-50FC-4A4D-A1EE-C87B3A55223C@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_FF88F0C5-74CE-4B5E-BE4B-EFC8222CCD98"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: How to set GPIOs to pre-defined value
Date: Tue, 7 May 2019 16:52:18 +0800
In-Reply-To: <acf57f4c-08bd-40db-a77a-bb7f4f9f5938@Spark>
To: Samuel Jiang <chyishian.jiang@gmail.com>
References: <365A980B-9730-411A-A91B-EB0A97026D95@gmail.com>
 <acf57f4c-08bd-40db-a77a-bb7f4f9f5938@Spark>
X-Mailer: Apple Mail (2.3445.9.1)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_FF88F0C5-74CE-4B5E-BE4B-EFC8222CCD98
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Samuel,
Thanks for your reply, I am using AST2500.
I tried add gpio-hog settings into my device tree, and yes, the GPIO =
works as it defined.
But all GPIOs defined by gpio-hog can not be modified in user space by =
gpioset / gpioget utility.
I need to set all GPIOs to pre-defined state and can change it at run =
time.
Set GPIOs in Device tree is trying to lock it by a fixed direction and =
value.

Thanks.

> On May 7, 2019, at 4:16 PM, Samuel Jiang <chyishian.jiang@gmail.com> =
wrote:
>=20
> Hi Brad,
>=20
> You could pre-define GPIOs setting on linux kernel device tree when =
loading kernel.
> I=E2=80=99m not sure which SoC you used. Maybe you could direct apply =
you wanted on linux/arch/arm/boot/dts folder or custom create once. Hope =
the information could help you.
>=20
> Thanks,
>=20
> Samuel Jiang
> On May 7, 2019, 2:47 PM +0800, Brad Chou <chou.brad@gmail.com>, wrote:
>> Hi All,
>> Is there a way to set ALL GPIOs to a pre-defined initial in/out =
direction and high/low value ?
>> I see there is a gpio_defs.json, but seems only the direction can be =
set, ie. In or out, not high / low settings.
>> Now, I am using a shell script with gpioset utility to do the job.
>> But I know using shell to do it is a bad idea.
>> Does anyone have better ideas ?
>>=20
>> Thanks.


--Apple-Mail=_FF88F0C5-74CE-4B5E-BE4B-EFC8222CCD98
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Samuel,<div class=3D"">Thanks for your reply, I am using =
AST2500.</div><div class=3D"">I tried add gpio-hog settings into my =
device tree, and yes, the GPIO works as it defined.</div><div =
class=3D"">But all GPIOs defined by gpio-hog can not be modified in user =
space by gpioset / gpioget utility.</div><div class=3D"">I need to set =
all GPIOs to pre-defined state and can change it at run time.</div><div =
class=3D"">Set GPIOs in Device tree is trying to lock it by a fixed =
direction and value.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Thanks.</div><div class=3D""><div class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On May =
7, 2019, at 4:16 PM, Samuel Jiang &lt;<a =
href=3D"mailto:chyishian.jiang@gmail.com" =
class=3D"">chyishian.jiang@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D"">

<title class=3D""></title>

<div class=3D"">
<div name=3D"messageBodySection" style=3D"font-size: 14px; font-family: =
-apple-system, BlinkMacSystemFont, sans-serif;" class=3D"">
<div dir=3D"auto" class=3D"">Hi Brad,
<div dir=3D"auto" class=3D""><br class=3D""></div>
<div dir=3D"auto" class=3D"">You could pre-define GPIOs setting on linux =
kernel device tree when loading kernel.</div>
<div dir=3D"auto" class=3D"">I=E2=80=99m not sure which SoC you used. =
Maybe you could direct apply you wanted on linux/arch/arm/boot/dts =
folder or custom create once. Hope the information could help you.</div>
</div>
</div>
<div name=3D"messageSignatureSection" class=3D""><br class=3D"">
<div class=3D"matchFont">Thanks,
<div style=3D"font-size: 14px; font-family: -apple-system, =
BlinkMacSystemFont, sans-serif;" class=3D""><br style=3D"font-size: =
14px; font-family: -apple-system, BlinkMacSystemFont, sans-serif;" =
class=3D""></div>
<div style=3D"font-size: 14px; font-family: -apple-system, =
BlinkMacSystemFont, sans-serif;" class=3D"">Samuel Jiang</div>
</div>
</div>
<div name=3D"messageReplySection" style=3D"font-size: 14px; font-family: =
-apple-system, BlinkMacSystemFont, sans-serif;" class=3D"">On May 7, =
2019, 2:47 PM +0800, Brad Chou &lt;<a href=3D"mailto:chou.brad@gmail.com" =
class=3D"">chou.brad@gmail.com</a>&gt;, wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"spark_quote" style=3D"margin: 5px =
5px; padding-left: 10px; border-left: thin solid #1abc9c;">Hi All,<br =
class=3D"">
Is there a way to set ALL GPIOs to a pre-defined initial in/out =
direction and high/low value ?<br class=3D"">
I see there is a gpio_defs.json, but seems only the direction can be =
set, ie. In or out, not high / low settings.<br class=3D"">
Now, I am using a shell script with gpioset utility to do the job.<br =
class=3D"">
But I know using shell to do it is a bad idea.<br class=3D"">
Does anyone have better ideas ?<br class=3D"">
<br class=3D"">
Thanks.</blockquote>
</div>
</div>

</div></blockquote></div><br class=3D""></div></div></body></html>=

--Apple-Mail=_FF88F0C5-74CE-4B5E-BE4B-EFC8222CCD98--
