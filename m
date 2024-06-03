Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C449C8D8374
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 15:06:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gEjI/Gri;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtDWd6Gptz3cb7
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 23:06:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gEjI/Gri;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=aayushi.chauhan01@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtDW36WGVz3cVR
	for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2024 23:06:06 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so49148161fa.2
        for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2024 06:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717419955; x=1718024755; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rb/K3WJFB3ZgXzeMcRAI9aP6+ZhRrGG8tFHjazr7McQ=;
        b=gEjI/Gri+N33IPDX+fm51h+CfSswupOaSAdOG1cblIrZEzpv+mPo9SE2Y7ejAAMSmD
         IkVAVMhiJR6l3+k5pd382Z+YGQ5r/olYVKlEnCvn1oVPXFAQvYElZewkV6eDBTHpNxOP
         z3AzTBqsMSQTQ6UhtDDX5BVXlOHt/6WZGVFFxfjw6Rc5/hIi+8JrMG+hFfFg1qvxlhoN
         5Um1pOD4R0oCPZJUxBq/dRh4SOeDEjX1bazkYpS1FjbjROR0XJ56VYri7QMQAPg6KE6z
         TRYzQPPoI/vLQatJaC+61PP47QjSZmP7w/JSrQ418SgXV6g5AxvmIYLqtRcJJSMefpt8
         JkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717419955; x=1718024755;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rb/K3WJFB3ZgXzeMcRAI9aP6+ZhRrGG8tFHjazr7McQ=;
        b=sh8DxfmJs/k2H2FWVSzWQSC5KRSuVHL0wg8vyomcz5EX4SeDctm6mGxLC93tpmfu7b
         KWGCzTRDFqUJ4OnHCNbNp5Y/hBAzxM9w8ykN7YvvrOukJF66W2iHMwGnjYoG9y1HABQ2
         SWnvmxUp+W6Mwbq/l3r6zMUFCeDJ+xVOlADwy/SCIF1+DoLNXfq43B3DHVEGvoGDPYCs
         h06r8h5EscVlJhZCYJOCJMPC3FpZeScZgWd6pwEM8l13HxkuKGrdRvw2lkJ2VqoOunTB
         ueip2oZjIGK/MYvkG587ZBPVuII2IQ803Kba31VXVDzd9EE7mgM7DEpYaSk7gysZSAbp
         EwAA==
X-Gm-Message-State: AOJu0YwYmVa/KqsFCA171lbFEDW/5aYJwAJg1cVU6TBU/+lMAN/iaQ9Z
	e/iiS2HymqKMdB1jhrr3KQ4DuBwxzJGAcbS6hJ7EnOyJYvH61DqkH+cigxz8WVtVljpN46KcYRz
	TASqi1kWTzLXVnX1S57/sbze8X7N2tUFm
X-Google-Smtp-Source: AGHT+IH0wM91Jxjm7RegLwYyuOdFv4pyQV+oJqG4GSdenIJOoARRg0mrdzip4MKeMn3EnFjtP+AbtWbiMVg+haktnBc=
X-Received: by 2002:a05:651c:2c5:b0:2e0:c81c:25da with SMTP id
 38308e7fff4ca-2ea951605f5mr52185961fa.30.1717419954545; Mon, 03 Jun 2024
 06:05:54 -0700 (PDT)
MIME-Version: 1.0
From: aayushi chauhan <aayushi.chauhan01@gmail.com>
Date: Mon, 3 Jun 2024 18:35:42 +0530
Message-ID: <CAGUjZ4EuoJFL4N3F4+Knnb+hudHtrMKpCo3UJ=LqrwgOXZxRKQ@mail.gmail.com>
Subject: Server unable to start after OpenBMC flash
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000522e4d0619fbfef3"
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

--000000000000522e4d0619fbfef3
Content-Type: text/plain; charset="UTF-8"

*Unexpected behavior you saw*
After flashing the Intel GNR-based motherboard with the OpenBMC image built
with version 2.14.0, the BMC successfully starts but the server doesn't
start and is stuck at LED post code 0x02.

I tried using an image built with the older commit but it didn't work.

*Expected behavior*
The server is supposed to start.

*To Reproduce*
Steps to reproduce the behavior:

   1. '. setup evb-ast2600'
   2. 'bitbake obmc-phosphor-image'
   3.  Flash the image to the BMC
   4. Power on the system


-> BMC boot up, server stuck at LEPPostcode 0x02.

--000000000000522e4d0619fbfef3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p dir=3D"auto" style=3D"box-sizing:border-box;margin-bott=
om:16px;color:rgb(31,35,40);font-family:-apple-system,BlinkMacSystemFont,&q=
uot;Segoe UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;A=
pple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px;margin-top=
:0px"><strong style=3D"box-sizing:border-box">Unexpected behavior you saw</=
strong><br style=3D"box-sizing:border-box">After flashing the Intel GNR-bas=
ed motherboard with the OpenBMC image built with version 2.14.0,=C2=A0the B=
MC successfully starts but the server doesn&#39;t start and is stuck at LED=
 post code 0x02.=C2=A0</p><p dir=3D"auto" style=3D"box-sizing:border-box;ma=
rgin-top:0px;margin-bottom:16px;color:rgb(31,35,40);font-family:-apple-syst=
em,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot;,Helvetica,=
Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;f=
ont-size:14px">I tried using an image built with the older commit but it di=
dn&#39;t work.</p><p dir=3D"auto" style=3D"box-sizing:border-box;margin-top=
:0px;margin-bottom:16px;color:rgb(31,35,40);font-family:-apple-system,Blink=
MacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sa=
ns-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size=
:14px"><strong style=3D"box-sizing:border-box">Expected behavior</strong><b=
r style=3D"box-sizing:border-box">The server is supposed to start.</p><p di=
r=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px=
;color:rgb(31,35,40);font-family:-apple-system,BlinkMacSystemFont,&quot;Seg=
oe UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Co=
lor Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><strong style=3D=
"box-sizing:border-box">To Reproduce</strong><br style=3D"box-sizing:border=
-box">Steps to reproduce the behavior:</p><ol dir=3D"auto" style=3D"box-siz=
ing:border-box;padding-left:2em;margin-top:0px;margin-bottom:16px;color:rgb=
(31,35,40);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot=
;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&=
quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><li style=3D"box-sizing:bo=
rder-box">&#39;. setup evb-ast2600&#39;</li><li style=3D"box-sizing:border-=
box;margin-top:0.25em">&#39;bitbake obmc-phosphor-image&#39;</li><li style=
=3D"box-sizing:border-box;margin-top:0.25em">=C2=A0Flash the image to the B=
MC</li><li style=3D"box-sizing:border-box;margin-top:0.25em">Power on the s=
ystem</li></ol><div><font color=3D"#1f2328" face=3D"-apple-system, BlinkMac=
SystemFont, Segoe UI, Noto Sans, Helvetica, Arial, sans-serif, Apple Color =
Emoji, Segoe UI Emoji"><span style=3D"font-size:14px"><br></span></font></d=
iv><div><font color=3D"#1f2328" face=3D"-apple-system, BlinkMacSystemFont, =
Segoe UI, Noto Sans, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe=
 UI Emoji"><span style=3D"font-size:14px">-&gt; BMC boot up, server stuck a=
t LEPPostcode 0x02.</span></font></div><div><br></div><div><br></div><div><=
font color=3D"#1f2328" face=3D"-apple-system, BlinkMacSystemFont, Segoe UI,=
 Noto Sans, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji=
"><span style=3D"font-size:14px"><br></span></font></div><div><br></div></d=
iv>

--000000000000522e4d0619fbfef3--
