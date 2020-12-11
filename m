Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF0C2D79BF
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 16:47:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CswCC1p72zDqlX
	for <lists+openbmc@lfdr.de>; Sat, 12 Dec 2020 02:47:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36;
 helo=mail-yb1-xb36.google.com; envelope-from=priyankapillai1206@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NTh/2gG2; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CswB94pCNzDqlf
 for <openbmc@lists.ozlabs.org>; Sat, 12 Dec 2020 02:46:25 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id w127so8404504ybw.8
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 07:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/ryZhL0vsxSM0Pk7Fj9zZthKi4X9Gnd/Ps7x14SF3Ag=;
 b=NTh/2gG27gyGURDWr5QIx6IX3vyoOmhQ/fjvq67xAwZaB1vq5nHyFuvAd5x8QsI8u2
 xUho/wFVAY+x/KAerPf/eQ1q7PBdwHPB/59B42cVsZ8QCP2Hz8X0Ze/94dsMssEtiFM6
 bE5R4flVjlMWYwDw2q8oyWxwMouTOxLJHvI2AZaQFN/7XTphMQjBnJH16On1HicTqwO+
 CRy4sPn6q7IVg4t4s3FFxoH06gCQFXsH0qpsLgTrubiV/ogZ7fqBgkU8CXgOA78g1ETt
 fkyUBQhdM/sBIp21Ng6pMxUYqNeGFyxDu+imMi29cSQEIJImuzzmE3/YRWxQ+pSHBZAH
 XghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/ryZhL0vsxSM0Pk7Fj9zZthKi4X9Gnd/Ps7x14SF3Ag=;
 b=YcuY8IFiGiuqx4VcGgeiiA/D2652Zc3jhxzEmtZz/IQaGs2rm37t7mEnYJPpuJVaoS
 4Xb1uD2D6ml274uqbZgQRsh+uuIwRyjIva8y54Y43HTBs70tGfVIqTZ/L/AnWCrlEevB
 KSSSwktJUv1UhDG1IiUlbECzRQR5H2aix6fGK9Y/Fg+pED1Vpz+hkGtpjL33j0qnXQ5V
 UEnP8qaqYCEeHu+konJwrRASKJnSHYJtiEgjueh8lW2rEbOi8yzTDhIK7p/gWcAqWV9n
 Zto3oVarHaY4oLeZX3E2o5zOMDAMeMnBG34bNBCDzwDviVWVkidL+ynl6wjUxAA1hnFn
 jW6g==
X-Gm-Message-State: AOAM531ENHE/I8ZXlcjQY1cVwvvun1rTyhHhqinshwy+kA79peW8wa5d
 DDarsaCxe13XqZAAwfiRUyAlZpO5x1BoAkTND3CRgNOKwXF7Dg==
X-Google-Smtp-Source: ABdhPJzoyur1Mcb3rMa1YcKT0zTV0o7pu3R3Ziz6q8fcyoj0jHGEpDvYM1roXKSGtoOU4M2tn39boxRN520YZADKRUs=
X-Received: by 2002:a25:9a48:: with SMTP id r8mr17539402ybo.294.1607701581248; 
 Fri, 11 Dec 2020 07:46:21 -0800 (PST)
MIME-Version: 1.0
From: Priyanka Pillai <priyankapillai1206@gmail.com>
Date: Fri, 11 Dec 2020 21:16:10 +0530
Message-ID: <CAJCnuYnwNnqGqKD63tZfkdPjkd8SnS4r+OSXdQAWv3q7y_f_dg@mail.gmail.com>
Subject: Requesting feedback on in-progress GUI designs - Power Restore Policy
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a7bd1205b632318d"
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

--000000000000a7bd1205b632318d
Content-Type: text/plain; charset="UTF-8"

Hello,

Requesting feedback on the current iteration(1) of Power Restore Policy
screens in the WebUI:
https://github.com/openbmc/webui-vue/issues/47
Thanks in advance!

Warm regards,
*Priyanka Pillai*
User Experience Designer
IBM iX : Interactive Experience

--000000000000a7bd1205b632318d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br><div>Requesting feedback on the current iter=
ation(1) of Power Restore Policy screens in the WebUI:<br><a href=3D"https:=
//github.com/openbmc/webui-vue/issues/47" target=3D"_blank">https://github.=
com/openbmc/webui-vue/issues/47</a><br>Thanks in advance!<br><br><font size=
=3D"2" face=3D"Georgia">Warm regards,</font><br>
<b><font size=3D"3" face=3D"Georgia">Priyanka Pillai</font></b><br>
<font size=3D"1" face=3D"Arial" color=3D"#696969">User Experience Designer<=
br>
IBM iX : Interactive Experience</font></div></div>

--000000000000a7bd1205b632318d--
