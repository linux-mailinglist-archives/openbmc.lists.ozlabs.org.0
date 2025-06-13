Return-Path: <openbmc+bounces-199-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13798AD85C1
	for <lists+openbmc@lfdr.de>; Fri, 13 Jun 2025 10:37:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJXnW2l2Rz30P3;
	Fri, 13 Jun 2025 18:37:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::730"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749803823;
	cv=none; b=l1AMo+wEHCLFTCPs6xohpKHZ7tWttwY5lZbhwA/oq3p+saDPRqqRX8LdIgQd3AM8MDSJKP04Hlmg3nUPZLmYIhN8MqV4USTJ++3vklTo2SsUTV+YfdKLgeGsUkkBRyU0Bs6nLfkz9zZrUceIHYd+krESQifwMKVMr2phgb+Gaw612Kkg+b6JRoTWirmIwONzOvMG0potrBZNGGOadFa0lxoVYRB76RIFQjvNRiD5NU9W0al68mJ12N1KXtaBfAWXrJkzg2iIq2pdhMlX6290FbtliaCKU4n1q24R104m+LA2X6Pnf9ymx8eifx62catKAOTQDbyS/WeKmUKjaWpayg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749803823; c=relaxed/relaxed;
	bh=4CmFDyXtBAFCze9poK/ebftafyZcbijim3Y6OuQ3BDY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=EWQmALVdAVHZ9WrXolNywCSdCZhjlk6KwbF9eFQ2Xp6QlG6lsThT6W+fx2v/JcPr4tzqijY4kgGiDy6nY19V8VHu/0mioRk/XHd4JrAjOt9iDk5NldzbjpOQ09WpZnofcLMTtvkgMJua2APp1B3f1Y/jVcGSKeJ/i1Y/POG8rcfcgBECXEDRQYrliJQYb/bb527n/WWuT6KaWaket+b1BKeLPYUBFa/7/muhpJyhpwIJywMb06Xf8esTTFLoI2ClcZtiq4gfGobOvkJdAxA3NWNfll8BfJx7GH36aBi90IvdXO4b29iYSeVVI1QiVnps6Mjb9PxWq0U+ZZkQdOhPxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iAl4Rr/Q; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=yang.zhang.wz@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iAl4Rr/Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=yang.zhang.wz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJXnV2mbQz30Nl
	for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 18:37:02 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7d38cfa9773so193722885a.2
        for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 01:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749803819; x=1750408619; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4CmFDyXtBAFCze9poK/ebftafyZcbijim3Y6OuQ3BDY=;
        b=iAl4Rr/QD8qmLp73Iyf3XtIunekMW5QYmA9ksL3BlD6+5vq44wx3eBqg+tmbnINUhh
         6FAQ37jzr8W0IfZHurKCfuXRx0HUgTwJG8T6+Slq7CjLcGDGJPNI7sDp38R2S02hBOcj
         YdPLDeuH2Ap0GCCUjEm6tYtXx/XQbGM93XtEY3cW5x9XgKxrUeTUexPXL512iMHgzQ+c
         a+PvXeJhICQ7EKcMClrXC/Wm9Ou3J0OVhdziIdMlzya3vMztppcqEVpvESwDnfojOnEX
         RkcZRYu707fjy53ZmZ1RZmgEmvqt+t/qSsSc76q5LQm98DbqLzSmFdNc56FnBCB8eBGX
         tNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803819; x=1750408619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CmFDyXtBAFCze9poK/ebftafyZcbijim3Y6OuQ3BDY=;
        b=j7t/a1mYuPj3FqS3mJgkKsVKwEqX+kvVw84c+zn+Or5Nvuv9F324YX16lK3J/J6UPd
         wAnnP4d119KjtpnlgKPDsoCu+l+ek5SO+NOzxN6n9hSrqK2whP8/d+mC7U4S5OkpFL+n
         Ppa4mvq6/kZh/QWhECVc/7woVkczkYVgZwb8aFYPS6JKN6m237Ju5pvYrfyJNyR7CFP8
         Bga7DhCctnHcmbGsSzoqFRrdtSfcpjmm1WscxMqidggg1QEZXFjzIrLKq8q6UKInkhUc
         jZ4anJxqnGvi0zcUT73XKtA7eox/1JdvOf5eigjRPNdyB8v7bsLjNfbkxy/acNRkL57S
         wegw==
X-Gm-Message-State: AOJu0YwXEpPltq7OvRog07iFf1J3jCP01efasNLezlip+T1G1OyqzluY
	R4sLLx49iSVcxLk/yLMGU5jsiszvZtH7LV1QI/CUeHWmYN8BVn6XrV60rZX1TtY1oQKI9fJoDaw
	+/Jo2Mcw1PMmcExzq96qg7T2OU1BB+zJ4GJ6A
X-Gm-Gg: ASbGncuueH9g6fitguUY4rcbnEUURFJr/Oz90gVD/r0x0edS2XmpCYD9vib1evJzxnh
	Txf8D1QHRz2gnEaDZM1KhlRKbb6Fvs4l5YdjuoJWApukeRnUvmeHZt12KHNYo0I3F2RhiMc0I1F
	8rtCfno+89+QPN9g5byEbhqhPPrSzgw0Z4odVr3+G5idw=
X-Google-Smtp-Source: AGHT+IFt3+qfIGc6UGSXdPoidwdQRrJm93SLEx+CyhuDhrq9imzjlKVQQXlk3DsmBgtDKOTbAZagNbs+wKTaJjHZ8ao=
X-Received: by 2002:a05:6122:3bc7:b0:531:3a00:211b with SMTP id
 71dfb90a1353d-5313cb5c7a7mr1469038e0c.7.1749803807187; Fri, 13 Jun 2025
 01:36:47 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
From: Yang Zhang <yang.zhang.wz@gmail.com>
Date: Fri, 13 Jun 2025 16:36:36 +0800
X-Gm-Features: AX0GCFtMGx8Y72Ff9ZRyETOeXkeMCoETshTRXDIKmjSSSK5vQWke2aOUzOQB7xI
Message-ID: <CA+3C=r_DV5kLivbMY-5ALh55ySzdzm6Ss-5Eif9YU27Qn8-mxQ@mail.gmail.com>
Subject: How to enable SOL
To: openbmc@lists.ozlabs.org
Cc: Jian Zhang <zhangjian.3032@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi All,

I am trying to set up SOL on my platform. On my platform, ttyS2 is
connected to the host.
I can use ssh -p 2202 localhost to see the output from the host, but
when I run ipmitool sol activate, it shows nothing except the
following:

ipmitool -I lanplus -C 17 -H 192.168.10.178 -U root -P 0penBmc sol activate
[SOL Session operational.  Use ~? for help]

I guess the reason is that I haven=E2=80=99t bound SOL to ttyS2, and I don=
=E2=80=99t
know how to do this. Are there any settings to bind SOL to ttyS2?

Or maybe there are other configurations I need to add?

Here is the config I used:
obmc-console_%.bbappend:
FILESEXTRAPATHS:append :=3D "${THISDIR}/${PN}:"
RDEPENDS:${PN} +=3D "bash"

# Declare port specific config files
OBMC_CONSOLE_TTYS =3D "ttyS0 ttyS2"
CONSOLE_CLIENT =3D "2200 2202 "

SRC_URI +=3D " \
             ${@compose_list(d, 'CONSOLE_SERVER_CONF_FMT',
'OBMC_CONSOLE_TTYS')} \
             ${@compose_list(d, 'CONSOLE_CLIENT_CONF_FMT', 'CONSOLE_CLIENT'=
)} \
           "

SYSTEMD_SERVICE:${PN}:append =3D " \
                                ${@compose_list(d,
'CONSOLE_CLIENT_SERVICE_FMT', 'CONSOLE_CLIENT')} \
                               "

do_install:append() {
    # Install the console client configurations
    install -m 0644 ${UNPACKDIR}/client.*.conf ${D}${sysconfdir}/${BPN}/
}

$ cat server.ttyS0.conf
# console-id is default to obmc-console
local-tty =3D ttyS0
local-tty-baud =3D 115200

$ cat client.2200.conf
# console-id is default to obmc-console

$ cat server.ttyS2.conf
local-tty =3D ttyS2
local-tty-baud =3D 115200
console-id =3D ttyS2

$ cat client.2202.conf
console-id =3D ttyS2


--=20
best regards
yang

