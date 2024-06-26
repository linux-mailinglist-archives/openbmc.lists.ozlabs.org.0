Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 841789179FC
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2024 09:43:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i99GarXO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8DFn00sgz3cFw
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2024 17:43:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i99GarXO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=raviteja28031990@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8DFF2jZ5z30V2
	for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 17:42:39 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2c7c61f7ee3so4991218a91.1
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719387756; x=1719992556; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A1nRxQJv4ataJyXSAlrBeOIf+UkRz3TYamPgVXo1StQ=;
        b=i99GarXOVS4bNhXkH9sAayf48j5VL6FIskXh36IqhkUEkqsuET6GBJy3iVKcuQPi+L
         EGO+v0kGp5SyQYf1xLqDjDaW2Suv4AFkQ/wWALAUYIKIhJfRxb17rw2ktaJYRN9rMbd3
         hWqY2hKSpcEt3ZoosyQ1J6t80YId5n+U8tZX4qXcThChezh3twwsqgXhWoLb6S04iLkG
         ujWca2Kj91siD7mRldx541JwObRIcvzm0XjwyoiqSGYC+JWxUJt7Yjx3E3hSifiRWu+G
         zeKHU/EbXzreS5YmELwCu4gMoOuThoptAFfkydpFJvIEloHjKwpH9JOyqbtVI8KAkTn0
         sw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719387756; x=1719992556;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A1nRxQJv4ataJyXSAlrBeOIf+UkRz3TYamPgVXo1StQ=;
        b=ZKcWPLcAL1rpx9yf7APZ8evj2m3eeLEa+EVaCzAB/w8v4NDrfs5ifj7WemzCcCcTnm
         8Jd/XI4FZWz2+7Ra8juFhlLfnv5CmfWM3pgq99w4+KjyxRKKvCTN1Fdz5kiQRVtZW90e
         4jNKpovFzN7aHDXVikQ+NtqIdoW+qbH3Bbbpg5ByOGwmW31ad0ZcwoHvFvtM/eymL4n5
         FEiXRkVkG6je1c9OsvHD3unIyFplLonSYC4NjHeuYC56DYkm+44NlsWnqZkzqL/eZ4Ao
         7jSGfu43cuJasJZsTRZAS+5lgLr9odBcu8adobXLjbeW8f5sfIjVV3CAemBvgshvL+dJ
         r5iA==
X-Gm-Message-State: AOJu0YzOR9zu0ip1FPEHrjjvKtATm2Uqvl8LBOKEf4Hx1QXiwwcXCr/7
	1qyjxVJ+1HSdGHCSDPAODcx4bzBJrwl9+e5oUC55rz8SN+R06+kbZ3Gg+ESl/x/9AE+t1IeJPZO
	2xFGQUgqqXE4u21JtnMCD2no0onPRzas5GW/FYA==
X-Google-Smtp-Source: AGHT+IGO5dHDSO++tCh1RI0bXaeI6tPCpKfUB1vgZPToGbPKrHpyP0Dl6f+NeO+nSZP0OuooBOslC0QqF3KZruNRetU=
X-Received: by 2002:a17:90a:ce84:b0:2c3:4ea:94bc with SMTP id
 98e67ed59e1d1-2c86148aa28mr6837121a91.47.1719387756217; Wed, 26 Jun 2024
 00:42:36 -0700 (PDT)
MIME-Version: 1.0
From: raviteja bailapudi <raviteja28031990@gmail.com>
Date: Wed, 26 Jun 2024 13:12:25 +0530
Message-ID: <CAM4DKZn1rvz_sKXKG5JfQk2J1kLazNL5KQrfmmbzPeOiiy2jcw@mail.gmail.com>
Subject: TOTP based 2-factor authentication to OpenBMC
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000070cd5f061bc6283e"
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

--00000000000070cd5f061bc6283e
Content-Type: text/plain; charset="UTF-8"

Hi All,

This proposal is to add 2-factor authentication to OpenBMC via
time-based-one-time-password (TOTP) mechanism

Here is proposed model:

1. There will be a user level setting disabled by default for all users.
Redfish interfaces will be implemented to enable/disable the 2nd factor for
each user on BMC.
2. Secret key will be generated at BMC per user, and is shared to only that
user
3. Each user whose TOTP authentication enabled, should register the TOTP
generator app using the secret key shared by BMC.
4. Once TOTP authentication enabled, the user can create sessions by
passing both password and the TOTP together

Here is open source google-authenticator pam library which supports TOTP
based authentication
https://github.com/google/google-authenticator-libpam
Here is recipe for google-authenticator
https://github.com/openbmc/openbmc/blob/master/meta-security/recipes-security/google-authenticator-libpam/google-authenticator-libpam_1.09.bb
Here is redfish schemas for "GoogleAuthenticator" or
"MicrosoftAuthenticator"
https://redfish.dmtf.org/schemas/v1/AccountService.v1_15_1.json

Here is redfish forum discussions, working with DMTF community for
user-level TOTP based authenticator configuration
https://redfishforum.com/thread/1061/multi-factor-authentication-on-accountservice

Please share your views

Thanks & Regards
Raviteja

--00000000000070cd5f061bc6283e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><br>This proposal is to add 2-factor authentica=
tion to OpenBMC via time-based-one-time-password (TOTP) mechanism<br><br>He=
re is proposed model:<br><br>1. There will be a user level setting disabled=
 by default for all users. Redfish interfaces will be implemented to enable=
/disable the 2nd factor for each user on BMC.<br>2. Secret key will be gene=
rated at BMC per user, and is shared to only that user<br>3. Each user whos=
e TOTP authentication enabled, should register the TOTP generator app using=
 the secret key shared by BMC.<br>4. Once TOTP authentication enabled, the =
user can create sessions by passing both password and the TOTP together<br>=
<br>Here is open source google-authenticator pam library which supports TOT=
P based authentication<br><a href=3D"https://github.com/google/google-authe=
nticator-libpam">https://github.com/google/google-authenticator-libpam</a><=
br>Here is recipe for google-authenticator<br><a href=3D"https://github.com=
/openbmc/openbmc/blob/master/meta-security/recipes-security/google-authenti=
cator-libpam/google-authenticator-libpam_1.09.bb">https://github.com/openbm=
c/openbmc/blob/master/meta-security/recipes-security/google-authenticator-l=
ibpam/google-authenticator-libpam_1.09.bb</a><br>Here is redfish schemas fo=
r &quot;GoogleAuthenticator&quot; or &quot;MicrosoftAuthenticator&quot;<br>=
<a href=3D"https://redfish.dmtf.org/schemas/v1/AccountService.v1_15_1.json"=
>https://redfish.dmtf.org/schemas/v1/AccountService.v1_15_1.json</a><br><br=
>Here is redfish forum discussions, working with DMTF community for user-le=
vel TOTP based authenticator configuration<br><a href=3D"https://redfishfor=
um.com/thread/1061/multi-factor-authentication-on-accountservice">https://r=
edfishforum.com/thread/1061/multi-factor-authentication-on-accountservice</=
a><br><br>Please share your views<br><div><br></div><div>Thanks &amp; Regar=
ds</div><div>Raviteja=C2=A0</div></div>

--00000000000070cd5f061bc6283e--
