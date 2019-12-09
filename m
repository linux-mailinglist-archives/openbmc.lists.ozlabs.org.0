Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A210116CE6
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 13:16:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Why32ZXszDqQv
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 23:16:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XOhleWdA"; 
 dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Whx42SRzzDqPN
 for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2019 23:15:48 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id s35so5819816pjb.7
 for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2019 04:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YVhS5+2aDPtHHjAtXbJqp5zeG+1m2PDTn3G1MPZdqQ4=;
 b=XOhleWdAoeKgRgtI6Twt0f6HArLsrGV/ydSygKQIbBAFomEQv7UCMM4YR1V/+Hg+9i
 KaUZBAzOXcuxaBrQlogkQAZmZF8s6Sr5omKoYtNngnIkvZ/yzTXIQnHIT9oJWXSp/ROB
 nKx2e/8gMQ0iOve9wljiXMOWo50xQ3IaCu2kkDT9nsOdrczVjK/jSGeUMB5PXM24u377
 IxVvaDRQECLJrHaA1hh5lQtBn+0Os1K7DY7ZnmsZU9xHsOC78xw7LF3qgyY+aCn9zbjI
 kDCYr3Iq83LjjTT2ozI8VaqLf/KJ/oX8nzfGlqksx2m77TyLcexKJuZvxZURYGfw2mie
 j+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YVhS5+2aDPtHHjAtXbJqp5zeG+1m2PDTn3G1MPZdqQ4=;
 b=md8HXYTYSs+27BUkHlib0E7XDtAU15I0t6VJGwFMVE9hHuSJGY1NPyZCxCkSfBMll0
 MnoMebu9ChI/EplKCaKm/fFyPxXT6xCfun6LDZOktQFCAmtPi28q1Wx8j3Z3RTpOXNyd
 ajpTyz3QjHZf/0HyvbF7SvVTqyTGX5gzGMxL4lsxKwcH570XZMISl0lTkOV8FoRIExFL
 VaVAhhrx5fMpYnOjB65bsG47vCQQ3PpCOmJtNYcaE56QWb4RFtJLy5W6x5MDUa417bo1
 yVRZWhIm4SZITisq9/gEu/EpQymbwq6C8+Fvo9hwgeEb89JI2IHMq3hgdoZot392htX0
 xNjg==
X-Gm-Message-State: APjAAAWzi2D7I8mV7PPthzJ8phrKCMMJ5HG95Jfd7+S5khlmhdNqyD+i
 dz5wLUs0C0p+8EwlE5FIynxpj3Dyxkku/W1gGFZ1HA==
X-Google-Smtp-Source: APXvYqxqU3kSFQJzmyjpCxsV6aA0baAarCXQfrh+Ze6kAQDyzZrE6uBEeSxOyPWzjioOFFQjA7q3pGtEK2egsCf7Vrk=
X-Received: by 2002:a17:902:7b85:: with SMTP id
 w5mr28370307pll.115.1575893745011; 
 Mon, 09 Dec 2019 04:15:45 -0800 (PST)
MIME-Version: 1.0
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Mon, 9 Dec 2019 20:15:21 +0800
Message-ID: <CAO9PYRLd5KJHiuvDxzGcw7E5CVapk3Fonm_mPDaov1zaVHZm2g@mail.gmail.com>
Subject: pinctrl in phosphor-hwmon
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000e0100f0599445a42"
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

--000000000000e0100f0599445a42
Content-Type: text/plain; charset="UTF-8"

Hi all:
    Does phosphor-hwmon support changing gpio pin before read
/sys/class/hwmon/hwmon0/fan*_input while monitoring fan sensor? In my
platform, fans gpio are connect to pin-mux and I need control gpio before
get fan tach rpm.

Regards,
Tyler

--000000000000e0100f0599445a42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all:<div>=C2=A0 =C2=A0 Does phosphor-hwmon support=C2=
=A0changing gpio pin before read /sys/class/hwmon/hwmon0/fan*_input while=
=C2=A0monitoring=C2=A0fan sensor? In my platform, fans gpio are connect to =
pin-mux and I need control gpio before get fan tach rpm.</div><div><br></di=
v><div>Regards,</div><div>Tyler</div></div>

--000000000000e0100f0599445a42--
