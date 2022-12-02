Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 415D1640023
	for <lists+openbmc@lfdr.de>; Fri,  2 Dec 2022 07:10:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNjH91Bmzz3bf8
	for <lists+openbmc@lfdr.de>; Fri,  2 Dec 2022 17:10:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IDIEwrZk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=tyler.sabdon@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IDIEwrZk;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNjGc3j0fz3bSk
	for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2022 17:10:14 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id x13-20020a17090a46cd00b00218f611b6e9so4255520pjg.1
        for <openbmc@lists.ozlabs.org>; Thu, 01 Dec 2022 22:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rOMkkDDaaulYq/W2aSJ9Yurnj7SoY4XP1WDDW7fRL2k=;
        b=IDIEwrZk+pMkdzyCyc6POxp7rAVdVSYTxlCgH54TboRI1CzB8LBmEX3j6621nd+x1r
         PkA7osqIZ8IZuHEymsV22h37hptJH3l22swUbGVsbOS4zzxZRljpIcb0uiyebWmqV38v
         4Qdb9bR4nMLLRx+4Qo9yEg5ZxV7ugPdMLqDTQbHLU6ay0aFGfEdd29V428ckpWtTpkvT
         9EKgXc5XwvrYtR5S3C3MnsLuEgf4yrT/E7bRXUrAsO/98ne2QhjaI8bla6bxpiIua8Os
         +ukULPMfIB2tumaqrO4U2iywYaWl+dLnQKMFnYlSe6RzVLnHf93jciyBlBpMEsfEkmQX
         DkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rOMkkDDaaulYq/W2aSJ9Yurnj7SoY4XP1WDDW7fRL2k=;
        b=dKt4hFGUTHX9eBNAaXyD3NAzTmtIRd+L+TQg/xWB0Kj8a3CbUUmqIQb89qWwdiHJ8w
         VCzCesmh35uGLYLe3zq/KrKJbZPLYorSdB7AZG7kXua+paCuCcpMFI3fudRerK5tl30v
         H/Zb/8m+1kaA+Uz38Gt3GLbRHez/kb/vdVwzyzh09HI+nl/aKgyyQ/mP/qRSMY4BuFMn
         Tz1PRG6w6rl5vRjZfuOwEHLEpn6pjgTKLTh7fbpj8a4uEEY/GUwhZcyLhri4DZDx5MhT
         zPwlP2oCR2HLEorVX7ntaxZEChaiBc5g8wsB8y7F/GIgqxrb3jYdSojojWENQzSWbVUX
         Jofg==
X-Gm-Message-State: ANoB5pkkZOJJnTa0gZb6hoLAfk5ude6m6iLnqQLEC+ia3uMBVlifQ7p/
	bk2jHLNl7fsj6JHPc2w24WOjnQ1Mg4w+u1W+w4765SR/
X-Google-Smtp-Source: AA0mqf47pB0y8AHyLpXNVXNpK8H5epNSkCXcMIHoyoTlImDwLPC14mgsyxW28zvIgIMj6NkepYwAXXlkAOVnkoogXCM=
X-Received: by 2002:a17:902:ab12:b0:189:7d4d:b99b with SMTP id
 ik18-20020a170902ab1200b001897d4db99bmr28097833plb.147.1669961409486; Thu, 01
 Dec 2022 22:10:09 -0800 (PST)
MIME-Version: 1.0
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Fri, 2 Dec 2022 14:09:58 +0800
Message-ID: <CAO9PYR+DBDtB7JxwhpGD+A6FADpTk2eOz-uPVG0MgtLgO9eJmg@mail.gmail.com>
Subject: Does dbus-sensors support PSU hot-plugging
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000099e41f05eed230aa"
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

--00000000000099e41f05eed230aa
Content-Type: text/plain; charset="UTF-8"

Hi all:
    In my understanding, psusensors which in dbus-sensors match
the entity-manager event to create psu sensor thru access hwmon created by
pmbus driver. But we know the hwmon created in pmbus driver probe and the
psusensors or EM don't monitor psu present to bind/unbind pmbus driver. If
some psu plugged then EM or psusensors can't create or refresh the sensors
for psu. Do I miss understanding the design? or there is a proper way to
solve this sitiation?

Tyler

--00000000000099e41f05eed230aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all:<div>=C2=A0 =C2=A0 In my understanding, psusensors =
which in dbus-sensors match the=C2=A0entity-manager event to create psu sen=
sor thru access hwmon created by pmbus driver. But we know the hwmon create=
d in pmbus driver probe and the psusensors or EM don&#39;t monitor=C2=A0psu=
 present to bind/unbind pmbus driver. If some psu plugged then EM or psusen=
sors can&#39;t create or refresh the sensors for psu. Do I miss understandi=
ng the design? or there is a proper way to solve this sitiation?</div><div>=
<br></div><div>Tyler=C2=A0</div></div>

--00000000000099e41f05eed230aa--
