Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AC46A3256
	for <lists+openbmc@lfdr.de>; Sun, 26 Feb 2023 16:32:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PPngH0psxz3cdd
	for <lists+openbmc@lfdr.de>; Mon, 27 Feb 2023 02:32:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qkyKmd0X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=satishroyal4u@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qkyKmd0X;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PPnfZ2NYbz3bg1
	for <openbmc@lists.ozlabs.org>; Mon, 27 Feb 2023 02:31:33 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id l1so731382wry.12
        for <openbmc@lists.ozlabs.org>; Sun, 26 Feb 2023 07:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZmYl0nBXy6/WKToEMLo3UUYEsYNq2M/Pnnk0CEKNoHE=;
        b=qkyKmd0XFWIBwDJwt5dSSg2KyIVwrDGf9ONH3Cj+uuEZZDqtBakr16UP1VONXJK6ED
         1BsLRpkRhu6M5+ePHZpDQxUkFnpfDcASvTKEcWtGByiB73pA3LsaLg7Lz3Dyvyo4p2aA
         R9ez9RgqxOw75J6GEqt22UEqFtyiu6osriu0mJo8QJ6g9+Ao4u2WP/qTlz5DcddDOjtg
         LPkndrs2A2bli70iGZGJ/h1CB+wHqC9TfAk9OsmUapPxVoEFM9uaA6133ovJcdnQ1JNF
         y8UuEsvzCuWcvOtbUlhVBRE45vlg7d54WWzHSLz/wvvmtJ/l2GC9hm58HCVxhae5Ri7k
         OpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZmYl0nBXy6/WKToEMLo3UUYEsYNq2M/Pnnk0CEKNoHE=;
        b=ThyOTHOHykAXyjfLzpg3JI3o8fzx12pktUtNecYEGlIbBL8l7kDAHoc1PHPe63ZGyp
         WW+IjmYBwIxawQd89jsZ5rNtnk1NKsR31usXc2wbc3S5Bu3UUmyfSDsRJf9C5iX+kalj
         +Ruv5WpS7XKePlPvRkcu+xG8oc4jvZ8LWErntGoa+w14ISgDQvQfspV3bedT3ofFG3TD
         Do1WDFoF0JpHayeBA6QVSZQPbca/NWJjgAcEfRDstThLIdfRqULyoeLE3dMo7QNy7WHQ
         Jd7nhxmxTgkuBIVpR/nCKk/3B8fUChXUt8ohqs4KIu1JNfUIS+Gvz2jerpniiUF9MaPT
         tvww==
X-Gm-Message-State: AO0yUKU1txs0dT5NcJcTtPoNjvz9FhTwTDORe4EBFh/wmEw+HwjRwvGV
	OobJtkk2opj90jEMxs0sygM6SW6HWGAOH07vmJzbHBuS
X-Google-Smtp-Source: AK7set+VBJxpFCwfY/XjV0gBylA5JqeUhhs8S7nSYv5OuFygU2Z+9ZfnXgug6b+JH+ZdflCB31gPTvCfTJIW0uoXLR4=
X-Received: by 2002:a05:6000:1d95:b0:2c5:4f32:b49f with SMTP id
 bk21-20020a0560001d9500b002c54f32b49fmr1335840wrb.0.1677425485645; Sun, 26
 Feb 2023 07:31:25 -0800 (PST)
MIME-Version: 1.0
From: Satish Yaduvanshi <satishroyal4u@gmail.com>
Date: Sun, 26 Feb 2023 21:01:14 +0530
Message-ID: <CAGugOWv-Fqbgb5HyujtfahXH8hLbhdsi9u2AtVahNL3jN=Gzhw@mail.gmail.com>
Subject: Regarding Code Coverage metrics for OpenBMC firmware
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000358b5505f59c0e49"
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

--000000000000358b5505f59c0e49
Content-Type: text/plain; charset="UTF-8"

Hi All ,

Could any one of you help  on how to capture the code coverage metrics for
openbmc firmware. Is there any documentation/procedure on it?

Thanks,
Satish Kumar Gampa

--000000000000358b5505f59c0e49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div>Hi All ,</div><div><br></div><div>C=
ould any one of you help=C2=A0 on how to capture the code coverage metrics =
for=C2=A0 openbmc firmware. Is there any documentation/procedure on it?</di=
v><div><br></div><div>Thanks,</div><div>Satish Kumar Gampa</div><div dir=3D=
"ltr" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"=
ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div><font face=3D"arial black, sans-serif"><br></font></div></div></div=
></div></div></div></div></div></div></div></div>

--000000000000358b5505f59c0e49--
