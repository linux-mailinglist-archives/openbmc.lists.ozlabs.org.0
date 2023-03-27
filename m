Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC23D6C9B10
	for <lists+openbmc@lfdr.de>; Mon, 27 Mar 2023 07:46:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlMHs4Ddjz3cdT
	for <lists+openbmc@lfdr.de>; Mon, 27 Mar 2023 16:46:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QazZDEW6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=abigulgumtacore@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QazZDEW6;
	dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlLwY6QN1z3bh0
	for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2023 16:29:31 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id eh3so30729192edb.11
        for <openbmc@lists.ozlabs.org>; Sun, 26 Mar 2023 22:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679894965;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SJM0f/lw6HjTowW+BmUMAI9QoufV8ev5kQkV3HAcHnI=;
        b=QazZDEW6jaI3T0gZVxNe6tHxu80//yO5HHDwzRZ0yjgakdXQ88OyaO67mIpMnhglUu
         iBhiAdlWE+v9ZuIcZEysCvDbgVB52w0IMOcPxdCQH5eqhLeabnkX3bNjwN+Ji0jeE6+a
         opNGtHJu1wfOsj3uqbyLSeiBLvbVthGiqBorA/S/pTfhHaPtmmS3WFxFzsUNWtkwVwY1
         Hx+NitW7sBU+3rsf1aom2PB6CJaS5gi5u+Goq7v9KWTxzNIMnGxubY7csurT1bLfKonq
         Km7oHD67X/HijGr9A7cYQQQ3Bq7uHqtnTz5Z24Fc98jeGhTrZ6O3fCwq4e5x+RMZPK2p
         UReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679894965;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJM0f/lw6HjTowW+BmUMAI9QoufV8ev5kQkV3HAcHnI=;
        b=e47YfoguOoNQZGNBDu7LpmjtUymrgVcYnemrNEAxQaQa/Rj1lXvR+aDqTGbx2PngZr
         LibhzPY+DW2OjoMaT4kYcMYYcB7EtExmHjSSzTc4p5Wm9SvXje2BA/5t2/23NprCLoUE
         HjjDTkQjKusAobuETLBYaAyyFSaMUKE26p6rYIH6DK15foGUiFlTp+ywFvW716r1fbE0
         jucKXmJkkSAoWJb//X0vIRwSIXxpCxKiZzE9MPdJwfnqq61KmrPMEM9QzlIDsyEDdxrV
         UM9R5ziZXpkPPoQ4qzTa7dvhvKfHp5OkMEutFFE35HAXu9W/KQRn4nLozTBgmHE5OSUv
         aWjw==
X-Gm-Message-State: AAQBX9fThs16k//Nhqk6tstgj3FQBbEPBtVjHeCtvefb9t4Af4lB7K0y
	MES5uRczgDk8DMSOLocSnKWl4m6TaU/zq/i4kHmti/1b
X-Google-Smtp-Source: AKy350b33+GHUosW3nf3RtdnAEoN4AyRsJU8zQ0F7p6KtpYm9KeX9pFvyTT/UO2IAEKUfzXnN0y3EnFicKZmO51nwV8=
X-Received: by 2002:a17:906:c315:b0:8eb:27de:447e with SMTP id
 s21-20020a170906c31500b008eb27de447emr4524191ejz.7.1679894965043; Sun, 26 Mar
 2023 22:29:25 -0700 (PDT)
MIME-Version: 1.0
From: abirami sekar <abigulgumtacore@gmail.com>
Date: Mon, 27 Mar 2023 10:59:13 +0530
Message-ID: <CANT9vnoMd9KF-KcD24Rj5+wH_jWkK1Bi7kxUbrtz_BEByFhjqg@mail.gmail.com>
Subject: Host Interface Support
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a6c4cd05f7db06f6"
X-Mailman-Approved-At: Mon, 27 Mar 2023 16:44:52 +1100
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

--000000000000a6c4cd05f7db06f6
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I am new to openBMC and started learning Redfish.
Can you please guide me to add HostInterface Support to Redfish.

With Regards,
Abirami S

--000000000000a6c4cd05f7db06f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Team,=C2=A0<br><br>I am new to openBMC and started lear=
ning Redfish.<br>Can you please guide me to add HostInterface Support to Re=
dfish.<br><br>With Regards,<br>Abirami S=C2=A0</div>

--000000000000a6c4cd05f7db06f6--
