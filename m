Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAF23131A7
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 13:03:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ4Rm4XwyzDsrV
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 23:03:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pcpartner.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=seiresli@pcpartner.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=pcpartner-com.20150623.gappssmtp.com
 header.i=@pcpartner-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=GfKKU+kq; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX0863h5mzDqCZ
 for <openbmc@lists.ozlabs.org>; Fri,  5 Feb 2021 13:42:39 +1100 (AEDT)
Received: by mail-qk1-x731.google.com with SMTP id 19so5610662qkh.3
 for <openbmc@lists.ozlabs.org>; Thu, 04 Feb 2021 18:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pcpartner-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=lCtMBnHMfjo9xb1AnufWGYIsNLbVDtBvEKyZGCaLgQI=;
 b=GfKKU+kqzEqCgTocE5XMl7GISjqqLgmsWMF1iPnU8qLtbxdyyB3bftFUlNSD8Taf7o
 os6b2lmBOgjotYsy3UE/3k+SbX7l86CpumW6DO24WTiJ1QvxACi4pZCHRxYyQFTA3IIN
 B968klyFJFM1opgFyok6OCgoIUWxv5PAH+2qSPbG8+ZFUrVtJWmTQ2i0TEdJF91iTM92
 0koG9YfbDiM4l0RrzUes39ndpwiORATMm7CR4QiGJpQVwBPSwQa9Ll5/vcBIk7wT78NM
 hipc6RF6ksikwoCAuMK3Sgh67EFPQ2cyIA7uZlTDAQYo8GQzmCDDj8tzv3gr3K1eM+Va
 p5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=lCtMBnHMfjo9xb1AnufWGYIsNLbVDtBvEKyZGCaLgQI=;
 b=WTfBcRhYmk0+zCAeRT9Fhu864jq5CrBUZ7qKhoxkWS0zHK2TP3iRLQ8J1i425GASqu
 vavU8rd70cLJQDKl51LK3XTdfdFaxapC4gCDZXkclNg8xzBl+JQtEGjtjCDK2a+/nqU5
 LnosbJuSNnPoh/4uJ5ASEurXBFq5arKbiU+ZJ2rL5CAClqVLPklhpYjAAOGsh+GM74tz
 8WQlO0AP84ZA1j289CNme2lyxYT4P+7O4xCowXsLljt42oBOjLkuYqwAxQ5St4hlgrEN
 uYiedSq4/7jsuC+6NQS7R6zFsm0Fm00PniI29Kr9bukHb+dF7DZ4y60lbW3UvQr9Qm1v
 /hyQ==
X-Gm-Message-State: AOAM532RQ/Uzp0Ee+iusw0mcmIuBIsob7P63Uwdo0o1fLUnhcH1mWZPs
 GFr15F5H4szZgNB825u/3X0X3mpZ7QnuL+QcEGbPFKSWiOI=
X-Google-Smtp-Source: ABdhPJyYFj8MMI9Y7VsYV7ko0sr6lIm61nNK6QJc1YOcQdeOy77YPr98HTnf3/otaEJ7u4SW3gdStTky5Q9FxlMYsdM=
X-Received: by 2002:ac8:554d:: with SMTP id o13mr2585816qtr.55.1612492956194; 
 Thu, 04 Feb 2021 18:42:36 -0800 (PST)
MIME-Version: 1.0
From: Seires Li <seiresli@pcpartner.com>
Date: Fri, 5 Feb 2021 10:42:25 +0800
Message-ID: <CAJwvfaOb1SnFzf3i-LQB3nT_YAdLR=NPVpbOyDdR-+Y4-oyZfQ@mail.gmail.com>
Subject: PCPartner CCLA
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000db6dcc05ba8dc556"
X-Mailman-Approved-At: Mon, 08 Feb 2021 22:58:03 +1100
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
Cc: Arthur Cheng <arthurcheng@pcpartner.com>,
 Richard Yu <RichardYu@pcpartner.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000db6dcc05ba8dc556
Content-Type: text/plain; charset="UTF-8"

Hi,
Attached is the signed CCLA from PCPartner.

Please let us know what else to prepare

 OpenBMC.CCLA_PCP Signed_20210204.pdf
<https://drive.google.com/file/d/1wpiHl8WtyAo9WU1iL_M-KWEK-NoROxv_/view?usp=drive_web>

Regards
Seires

--000000000000db6dcc05ba8dc556
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>Attached is the signed CCLA from PCPartner.</div><=
div><br></div><div>Please let us know what else to prepare</div><div><br><d=
iv class=3D"gmail_chip gmail_drive_chip" style=3D"width:396px;height:18px;m=
ax-height:18px;background-color:#f5f5f5;padding:5px;color:#222;font-family:=
arial;font-style:normal;font-weight:bold;font-size:13px;border:1px solid #d=
dd;line-height:1"><a href=3D"https://drive.google.com/file/d/1wpiHl8WtyAo9W=
U1iL_M-KWEK-NoROxv_/view?usp=3Ddrive_web" target=3D"_blank" style=3D"displa=
y:inline-block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;te=
xt-decoration:none;padding:1px 0px;border:none;width:100%"><img style=3D"ve=
rtical-align: bottom; border: none;" src=3D"https://drive-thirdparty.google=
usercontent.com/16/type/application/pdf">=C2=A0<span dir=3D"ltr" style=3D"c=
olor:#15c;text-decoration:none;vertical-align:bottom">OpenBMC.CCLA_PCP Sign=
ed_20210204.pdf</span></a></div><br></div><div>Regards</div><div>Seires</di=
v></div>

--000000000000db6dcc05ba8dc556--
