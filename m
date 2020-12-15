Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 596EF2DB12E
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 17:21:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwNmV634rzDqQQ
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 03:21:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30;
 helo=mail-yb1-xb30.google.com; envelope-from=priyankapillai1206@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XIGIBuws; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwNlJ1kSZzDqKw
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2020 03:20:10 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id o144so18985943ybc.0
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2020 08:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JmXQ7fIUUZ1DzFi3+9vnCU9u8Rfm0yTGWmNoXhIPWts=;
 b=XIGIBuws7r0AjvMvix0NZJREBsFVLonfxTd9+5aGv0eLXSy/H/P4FAj7o9ZsPhMrrL
 XWwPurGLo5FSU0bBsiBmR8VFDk4vIO7qxlMam/keKh/p9qRSXVyQuQXnBMA8R2rk7HW8
 BAtZdmduqSKFMc+jtShz8H2ZamQlD68CFw91lPemk7gxGvtnS+TG4QHR46x0btG1RtQd
 XZyufbwsNpfwEcm6yadL3aZZ86uzrjmsDZGKYLkgVVQaPHxUPet2K8K0YPCD0sNxPH//
 l9r9VX79hVRAxTH5VJJtXoErRj2AqIp7a/qQgr9OsFZyJ5K6BNeHOs2XAepxLKJ0lfy+
 kD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JmXQ7fIUUZ1DzFi3+9vnCU9u8Rfm0yTGWmNoXhIPWts=;
 b=kX3zDciNkG0RYi3zHjtdGeutKAO4Spq9mUBK/REGYH+mrxnl5jIiUTPm8ErhyuKBwe
 OtMQD3dB6E/sImnhHGNqCjeVUoYuLBILaaQmiC1ISfGQr21eO1HEzjvs4VJdTmrPNzt5
 Hg1RcnnAQRtg7rDHH6VrCJnVUOU0PBUK754u5RtTL3vVELUOMdmn9VzUH6zDBzrsDDyn
 6A8An8os6q7Hz5seYvgD1XFXZdka6yAG6ZmLkMMMInuB+mCBw5ufH5CK378NhvZ2smcm
 s4fltCrxjEAcXPhnuXfZjFXQvQXsxAD8/UoNhS2hGHvdp8Dl4D2q2lzvxRgkElT+wWgc
 YEHQ==
X-Gm-Message-State: AOAM531013lVapcvkQbUNSnPCtlDAcxdsrTqE4VNfLVy8AdZKIPOe/Dx
 E9WQek3JEfkTNlw/NxXWNJ2uAmFR3nqnQiu0TIm+V0N+Tvc=
X-Google-Smtp-Source: ABdhPJzmqtBCzqE2glyA1M8HOqPZmu98ncOnWy8kJpswRj9VwrdTqV06Qu/vQ2V0aO9hxSzNbfX5T6qNVEMriHqBGiQ=
X-Received: by 2002:a25:e694:: with SMTP id
 d142mr42918436ybh.494.1608049203820; 
 Tue, 15 Dec 2020 08:20:03 -0800 (PST)
MIME-Version: 1.0
From: Priyanka Pillai <priyankapillai1206@gmail.com>
Date: Tue, 15 Dec 2020 21:49:53 +0530
Message-ID: <CAJCnuY=ONz61yoSKewfBTSUcWLDDRp6Ounr93N4MrHXvLGUWpA@mail.gmail.com>
Subject: Requesting feedback on in-progress GUI designs - Power Management:
 Power Policies
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000933c6c05b6832104"
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

--000000000000933c6c05b6832104
Content-Type: text/plain; charset="UTF-8"

Hello,

Requesting feedback on Power Management: Power Policies screens in the
WebUI:
https://github.com/openbmc/webui-vue/issues/48
Thanks in advance!

Warm regards,
*Priyanka Pillai*
User Experience Designer
IBM iX : Interactive Experience

--000000000000933c6c05b6832104
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br><div>Requesting feedback on Power Management=
: Power Policies  screens in the WebUI:<br><a href=3D"https://github.com/op=
enbmc/webui-vue/issues/48" target=3D"_blank">https://github.com/openbmc/web=
ui-vue/issues/48</a><br>Thanks in advance!<br><br><font size=3D"2" face=3D"=
Georgia">Warm regards,</font><br>
<b><font size=3D"3" face=3D"Georgia">Priyanka Pillai</font></b><br>
<font size=3D"1" face=3D"Arial" color=3D"#696969">User Experience Designer<=
br>
IBM iX : Interactive Experience</font></div></div>

--000000000000933c6c05b6832104--
