Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E808D22F8A0
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 21:02:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFq213C43zF1f2
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 05:02:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CTCYpeMo; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFq0x4R6mzDrfR
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 05:01:52 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id s144so5321676oie.3
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 12:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=3VxZ9llayeStAhLh7Qgvxu9VO+5jcgsevZL+cfbXKfc=;
 b=CTCYpeMo/il2olumHJ8DaXlR95Ps+fAK5cQyjSYlEB+Ltal0k40Vx7TuDeEbFVoftU
 6b/zwUJdTRonH93vhN22k52D8faLIq36uzpyEZSQZ8sfOsh5asmefvjdpNOdi09dMTYs
 7W3lW5Tvh3u8pUn9+ZkrxK0Hz635xQ76RHAAua85+rc9Uqs9fRGYIJwfa2tc9MuF9Njb
 QADCL0fcCEGAJsk4ngaeCgOWlXZ3x2LP+XtXUNN6pi4cJEKwtb45t3X/AS7zypL7zL7A
 0uD8edkbHP7hI9bJCfQXkoVghJ2l8AtISyy6rZiIsMOprmcPTbYP+eM6ZHTXs9JJpflz
 zEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=3VxZ9llayeStAhLh7Qgvxu9VO+5jcgsevZL+cfbXKfc=;
 b=l2K0fBPhqdwZ5QY0ktPrTv46lACBZ19ZZ85Vv5Pg/hO494hHxccnipnxKrh+Axutu+
 gSvRK3OuNFeVEDihC/cF6yFRRaGvAaVhcIpNor7Du5t86mu5lbaOl/bnrXT4Ey68ttcZ
 gUfnF9Q9bUhQ6H7KyqJmnR/osKPThuz0zf23bp3AAkUIxL7ecvu78CfZN5Dzx6j4bV/W
 9BfrnUu1ymNpXr8+0QvbMT39BFHMxa1/t5Xgnw404RkAY8MQcJw3tChL5lRBEr74eeSH
 +lssNH0q/OhhxTR+wrEAnRgMomlVptAMbQnJhmY/DN7T17nRxC4o2O08TW9JQ/kUMeHN
 hfaw==
X-Gm-Message-State: AOAM531kOm7mehPrh1heCmhWMGCQoR4p8MCJtdqBXLfCF5NUksXGCbQ9
 3nq45W/opCdYa480aqzksxW8ZT0DBlc=
X-Google-Smtp-Source: ABdhPJwv8QWHX+LbUbHMQ+YnEeTocqnvEgAVzJyhw6j/xMa2XIfdGuWhM4bkja6o4BZa6ey8D5LDdA==
X-Received: by 2002:aca:40d4:: with SMTP id n203mr650372oia.80.1595876509214; 
 Mon, 27 Jul 2020 12:01:49 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:dc25:70f9:d58b:a5c6?
 ([2601:281:c001:2359:dc25:70f9:d58b:a5c6])
 by smtp.gmail.com with ESMTPSA id r128sm2181745oih.50.2020.07.27.12.01.48
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 12:01:48 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-0FA8B1BA-D946-42F7-8F06-90489B375EE0
Content-Transfer-Encoding: 7bit
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 27 Jul 2020 13:01:48 -0600
Subject: Infinite redirect.
Message-Id: <E38290F8-4FC6-4FF3-9FF2-5ED7853FE1DB@gmail.com>
To: openbmc@lists.ozlabs.org
X-Mailer: iPad Mail (17F80)
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


--Apple-Mail-0FA8B1BA-D946-42F7-8F06-90489B375EE0
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I need help debugging an infinite redirect.

Using tag 2.8.0

I built meta-phosphor with raspberrypi4. See https://github.com/Proclivis/co=
nf-meta-rasberrypi-evb.git

I setup a host entry on my ubuntu laptop in /etc/hosts

10.0.1.72 bmc

Then with firefox use url

https://bmc:18080

I get a redirect to=20

https://bmc:18080/#/login?next=3D%2F

Which also redirects again.

bmcweb is not sending a cookie on the first request.

On the target, token_authorization_middleware.hpp:187 is failing the cookie a=
uthorization, probably because Firefox is not sending back the cookie it nev=
er received.

There are two failed services not running:

obmc-phosphor-sysd.service
start-ipkvm-.service

I assume these would not interfere with something as basic as cookies.

Is there something I need to configure on the target?

Mike

Sent from my iPad=

--Apple-Mail-0FA8B1BA-D946-42F7-8F06-90489B375EE0
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">I need help debugging an infinite redirect.=
<div><br></div><div>Using tag 2.8.0<br><div><br></div><div>I built meta-phos=
phor with raspberrypi4. See&nbsp;<a href=3D"https://github.com/Proclivis/con=
f-meta-rasberrypi-evb.git">https://github.com/Proclivis/conf-meta-rasberrypi=
-evb.git</a></div><div><br></div><div>I setup a host entry on my ubuntu lapt=
op in /etc/hosts</div><div><br></div><div>10.0.1.72 bmc</div><div><br></div>=
<div>Then with firefox use url</div><div><br></div><div>https://bmc:18080</d=
iv><div><br></div><div>I get a redirect to&nbsp;</div><div><br></div><div>ht=
tps://bmc:18080/#/login?next=3D%2F</div><div><br></div><div>Which also redir=
ects again.</div><div><br></div><div>bmcweb is not sending a cookie on the f=
irst request.</div><div><br></div><div>On the target, token_authorization_mi=
ddleware.hpp:187 is failing the cookie authorization, probably because Firef=
ox is not sending back the cookie it never received.</div><div><br></div><di=
v>There are two failed services not running:</div><div><br></div><div>obmc-p=
hosphor-sysd.service</div><div>start-ipkvm-.service</div><div><br></div><div=
>I assume these would not interfere with something as basic as cookies.</div=
><div><br></div><div>Is there something I need to configure on the target?</=
div><div><br></div><div>Mike</div><div><br><div dir=3D"ltr">Sent from my iPa=
d</div></div></div></body></html>=

--Apple-Mail-0FA8B1BA-D946-42F7-8F06-90489B375EE0--
