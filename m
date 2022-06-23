Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 834015575B0
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 10:40:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTDGZ3MDKz3byT
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 18:40:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SSfRsk+u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=ratankgupta31@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SSfRsk+u;
	dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTDGC2WNSz2x9v
	for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2022 18:40:02 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id g26so18109963ejb.5
        for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2022 01:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r8sCWhNXoS+9aUmYsWrHaYKPhVYs+2dki6EFY9f9wRI=;
        b=SSfRsk+uZ6RgXVCsNQ6HFxfoF/nVmWr3S2fYTFhM/m5Uz02WWaCOuYYid4RUcWxV47
         oIkrTCxACzIzoi+NW/wLUthRqp4PSru6JmoJqHZa8uj8Qp1mEf1v3GiAwlTOAvBVBRwp
         OVsl6or+96Q4LjfZ12vkZf3d++s39T/boWsOqXz6hgYlyYBFLOiCrTc1qePoulaIWbnw
         iZtLd3KU20LM5TU0HRs3qE+PjJrwtVa8v6Hs9hVdOSz2Y1sJ+Pb9S5ZfYyhATIb7kOHU
         ehmzkOTA6JgRyccch9bApafyslkvNf1GB8GxvDR2zmNnrGe/HaUqv/VfNQnjQDqWg4ma
         B4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r8sCWhNXoS+9aUmYsWrHaYKPhVYs+2dki6EFY9f9wRI=;
        b=ge4Fzfk8ZEMZMZ3YRt+hKkFEh+bzQAStUiBzKy9tkUTnst+3J8asJDhy0MLPPaJb35
         MeyDo9ODr60p2hsDDX7lTw54kfysPdED2oMUkd1aKnr9+IczhuM3kqyquQ+FrtlvMQvC
         b6fqvjra0bPllUAJtxjli09PF7ZQMyf9EhDyR0PhT1SLTj6V5exk8vAbrfxxtKbMkeoj
         DjBJU5UdjK0V2eLf7L96xR3Gx//f+02bbZz7tq7Yyp1b1qo+UjMENETIGR3lxlCCM0be
         Z2gOKNwC4uzmD4z8vTXo1C+85jKX2/gTmX+gypo3m6SRrUbl5e4aUE/OZbYDK7OcJOkG
         PKBw==
X-Gm-Message-State: AJIora+a+Ox5XvRSFiE6H8ed2dLwjgY78EPh9rGJLjsfRvtEuR0rTviv
	QcI/jZKMY6LaKLJ7UDqv0rR6TNjqZzsXtrT3XNg=
X-Google-Smtp-Source: AGRyM1vMI0SIHq676iRzODjGnhkUgwkB/qF7r341eT0/PwEnnMrdUxKu0VtEnyFU8SMIiArm0p5rq6/T95m+RAq6l40=
X-Received: by 2002:a17:906:db:b0:718:e9e7:e704 with SMTP id
 27-20020a17090600db00b00718e9e7e704mr7199857eji.718.1655973594907; Thu, 23
 Jun 2022 01:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4DKZkkKx_MPVv_R7WqOhnKA+hRYWU4GK=DqbqqSVj_CtMtMg@mail.gmail.com>
In-Reply-To: <CAM4DKZkkKx_MPVv_R7WqOhnKA+hRYWU4GK=DqbqqSVj_CtMtMg@mail.gmail.com>
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Thu, 23 Jun 2022 14:09:43 +0530
Message-ID: <CAMhqiMoQmZgSdkAjSDYTooPnW7Ta=bQYFZVkfoOr=ZmUzvceiA@mail.gmail.com>
Subject: Re: OpenBMC Network Route Management: Metric and Static Route config support
To: raviteja bailapudi <raviteja28031990@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e1c94b05e2196517"
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

--000000000000e1c94b05e2196517
Content-Type: text/plain; charset="UTF-8"

Hi Raviteja,

Are you mentioning that both the default gateways are pingable and the
kernel picks up the one which is not desirable by you and you want to
control which one to be picked up by configuring the metric value?

Ratan

On Wed, Jun 22, 2022 at 4:20 PM raviteja bailapudi <
raviteja28031990@gmail.com> wrote:

> Hi Team
>
> We have hit network routing issues while using Static IPv4 addresses on
> both eth0 and eth1,  as both default gateways at the interfaces were of the
> same metric value. To solve this problem we are planning to provide an
> interface for admins to set the metric value for the gateway while setting
> up the Static IPv4 network on BMC.
>
>
> To enable users to connect from outside-subnet clients, we also need to
> support static routes on BMC.
>
>
> I have started a thread in redfish forum as well
>
>
> https://redfishforum.com/thread/683/network-routing-table-management-support
>
>
> Please share your views on the same.
>
>
>
> Regards,
>
> Raviteja
>

--000000000000e1c94b05e2196517
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Raviteja,<div><br></div><div>Are you mentioning that bo=
th the default gateways are pingable and the kernel picks up the one which =
is not desirable by you and you want to control which one to be picked up b=
y configuring the metric value?</div><div><br></div><div>Ratan</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 Jun 22, 2022 at 4:20 PM raviteja bailapudi &lt;<a href=3D"mailto:raviteja2=
8031990@gmail.com">raviteja28031990@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Team<div><=
br></div><div><p style=3D"margin:0px;font-stretch:normal;font-size:13px;lin=
e-height:normal;font-family:&quot;Helvetica Neue&quot;">We have hit network=
 routing issues while using Static IPv4 addresses on both eth0 and eth1,=C2=
=A0 as both default gateways at the interfaces were of the same metric valu=
e. To solve this problem we are planning to provide an interface for admins=
 to set the metric value for the gateway while setting up the Static IPv4 n=
etwork on BMC.</p><p style=3D"margin:0px;font-stretch:normal;font-size:13px=
;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;">To enable users=C2=A0to connect f=
rom outside-subnet clients, we also need to support static routes on BMC.</=
p><p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:nor=
mal;font-family:&quot;Helvetica Neue&quot;"><br></p><p style=3D"margin:0px;=
font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Hel=
vetica Neue&quot;">I have started a thread in redfish forum as well</p><p s=
tyle=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:normal;fo=
nt-family:&quot;Helvetica Neue&quot;;color:rgb(220,161,13)"><a href=3D"http=
s://redfishforum.com/thread/683/network-routing-table-management-support" t=
arget=3D"_blank">https://redfishforum.com/thread/683/network-routing-table-=
management-support</a></p></div><div><p style=3D"margin:0px;font-stretch:no=
rmal;font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quo=
t;"><br></p><p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-=
height:normal;font-family:&quot;Helvetica Neue&quot;">Please share your vie=
ws on the same.</p><p style=3D"margin:0px;font-stretch:normal;font-size:13p=
x;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><br></p><p sty=
le=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font=
-family:&quot;Helvetica Neue&quot;"><br></p><p style=3D"margin:0px;font-str=
etch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica N=
eue&quot;">Regards,</p><p style=3D"margin:0px;font-stretch:normal;font-size=
:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">Raviteja<b=
r></p></div></div>
</blockquote></div>

--000000000000e1c94b05e2196517--
