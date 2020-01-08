Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B5C134DB6
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 21:37:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tLdd02jXzDqQG
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 07:37:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=ryanarnellibm@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q1+eYCfH"; 
 dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tLcx4S7tzDqBr
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 07:36:30 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id j1so4758234lja.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jan 2020 12:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8R/6NL3VNnJyy42DIWPLhmyWH7okTbLcoFJiPLS4Fsw=;
 b=Q1+eYCfHx8jFl27GUD9XeCQ13OFqKhI+uRK8898XmtajRLdCallQLRX5yqBwjWc0/f
 4pxgx2geIHLGorjxOQgWzjKcil7EfAAS72SJCqoelaIKWUvFwmcBEmWSaHGSheEooI8l
 jzNyS/HrF/sy3leGW9dNW1DjkQOczg3s70rCaHynl0y7hVnAlU972vGfRIoLg3V0BbRV
 OlBkzSXuVfIxqdEa45rcefdYvm6lB4Nnyh7ZyEH+DdRuOMdsfa6TPamUMjgWCuG4c8Ov
 hEH+Sr8PribtGwpIC5oyPyo3L+wJ0Rivy4rbw3wj00F59O9mrCnX8aMX89PIPn6uCD/I
 hPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8R/6NL3VNnJyy42DIWPLhmyWH7okTbLcoFJiPLS4Fsw=;
 b=WboV5A4OTB/ndTmZDv9V3CGtukE6tLU/MBKFS6fLjETQoHcF82uXPd1b4fxDry0wGw
 d7LxqRdS6QeosUEfEAA6dedGon1sZEhYMj2IO/7MErwPLWIG8LQ6KCdwjF8gNiqHjDa7
 OzZZZO+EqRxDNvGpgf4eED+dXciKzx1e0DM1CtTkWGcy2FAlwUbkGaOLH7vI1mCI7K9E
 LCTk7MQIasDXXeEJukBZFVdgwj4NtIkG0hcTd56dt4Nmp/9doLD4WUoAxFP6xhmqvy8r
 kDqDaAXzSQ8soyKMnGHiJglqTYhBfM54MoC+GUe9lWPWyBjacLgdWIbohpthFgQGAzN4
 Dw8A==
X-Gm-Message-State: APjAAAVky9EhjuNf51eDalzEBlbmq4ta2dxrlb7zcWwEMZN5Uf+OkK38
 MplkfjAxADnTBso9vgKrUgp9RrxDtYeLz3BrTqIqtAKO
X-Google-Smtp-Source: APXvYqxLZz7wv/IDA+dHiBjtKtOUOiV/v9gUh8XjCno+krNDh6Sd0ikznkUEy80gBxif9WvCQSLiA6MzEV8duL5lGWk=
X-Received: by 2002:a2e:8145:: with SMTP id t5mr4099785ljg.144.1578515785328; 
 Wed, 08 Jan 2020 12:36:25 -0800 (PST)
MIME-Version: 1.0
From: Ryan Arnell <ryanarnellibm@gmail.com>
Date: Wed, 8 Jan 2020 14:36:14 -0600
Message-ID: <CAH3qHnZfQA4X-n2_cWX-rTRo+YLYxktfQrCB16zpr=FOV8LoTw@mail.gmail.com>
Subject: GUI design for profile page
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a82d5c059ba6d878"
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

--000000000000a82d5c059ba6d878
Content-Type: text/plain; charset="UTF-8"

Hello everyone,
Happy new year! We are thinking about introducing a profile page. The idea
is here users can perform tasks like updating the password and other user
related tasks. This page is accessible via a generic user icon from header.
Right now we only have password reset option. Down the road we plan to have
a default language selector. The design show both components for now.

The invision prototype link is
https://ibm.invisionapp.com/share/Q6NZ13M3A5B#/319377577_01-Profile-Settings-02

Please feel free to leave comments in the prototype. We love your feedback.

Thank you
Ryan Arnell
UX Engineer
IBM, Austin, TX.

--000000000000a82d5c059ba6d878
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello everyone,<div>Happy new year! We are thinking about =
introducing a profile page. The idea is here users can perform tasks like u=
pdating the password and other user related tasks. This page is accessible =
via a generic user icon from header. Right now we only have password reset =
option. Down the road we plan to have a default language selector. The desi=
gn=C2=A0show both components for now.=C2=A0</div><div><br></div><div> The i=
nvision prototype=C2=A0link is=C2=A0</div><div><a href=3D"https://ibm.invis=
ionapp.com/share/Q6NZ13M3A5B#/319377577_01-Profile-Settings-02">https://ibm=
.invisionapp.com/share/Q6NZ13M3A5B#/319377577_01-Profile-Settings-02</a><br=
></div><div><br></div><div>Please feel free to leave comments in the protot=
ype. We love your feedback.=C2=A0</div><div><br></div><div>Thank you</div><=
div>Ryan Arnell</div><div>UX Engineer</div><div>IBM, Austin, TX.=C2=A0</div=
><div><br></div><div><div><br></div></div><div><br></div><div><br></div></d=
iv>

--000000000000a82d5c059ba6d878--
