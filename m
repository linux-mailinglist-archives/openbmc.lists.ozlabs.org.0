Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 030C96BA0C
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 12:25:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pYLG0bMzzDqYW
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 20:25:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dvq/xVU4"; 
 dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pYKc1rbFzDqNk
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 20:24:32 +1000 (AEST)
Received: by mail-oi1-x22b.google.com with SMTP id a127so18075686oii.2
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 03:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=y5GHOUl+d6eeW17UzCbY2aWRi1AJ+96aDlXU91JFFJs=;
 b=dvq/xVU4hUsxovl/ONOPKVTyboewga9z91CbDGohvcL56BPcXIjLDvlmmIHp2D818w
 dwvz0PLVnVudRWid/gpIgbYogp4fXLTMtWgZav04ctodnzifXGScG4uQESylmGKq9aeY
 GcrSaOFjnj+PdpCBQQyBeuhA7hPse/jL+KyF4i1W5OaLreTArqD4rF/5zLYtWaFdWnJ9
 o2BSHENq8q5QRwsok5oAw2wI6VYMtEkxK9p/uGddW4B4e1cgLOOujfhF+uzEePUlWUbq
 iGEUzSHu0+AZELn2s4NgbLV3pNX1hzXLveI7JCQpEsWymSgBi/khRL4covvnAFxk6Sds
 R6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=y5GHOUl+d6eeW17UzCbY2aWRi1AJ+96aDlXU91JFFJs=;
 b=Zf9TM1C3z7L7eXu1deeMlSjtzYDulqfnymYj8yGIzxLm9JWOdNS47v2h7otf2Dt+k3
 5JM8k9sz1S4bYrCMNL1ZGWbjFVLWE9FkI43U2TI67FBq2nKpYiQzr0T9IDivdEtpOOi/
 0VWf85c9a2hovzWSjiuIdj2kLEOuE6ykLhog78XFGJ1yOvVT//c014pHSQQtK0ycQyy1
 abF6lYWXZARLG1PIuwG5Yhq4Z1+cbAAaBUWpvVZ52tTTD8VTtRiwejXe0MYqifAuQJQY
 9msTt8R4vxly/g1a9CfLG7if6Di5a/qpOR1DxF1093Oqaws+l5TxX5hjUyzSVHHUo/rV
 CNhA==
X-Gm-Message-State: APjAAAULlsRAJeDGSuKPytJW06axTl/iTiggemHUZjYyMN3mWlKBjVne
 n9Z0VCuTJVRnrc14YX5iC9sPOO4U7iW/8Kae/WfxsoMLJdSEVQ==
X-Google-Smtp-Source: APXvYqxfHQmxKV2E7XJMqQZucUTPIV3BMqIsb6s+fJU+uEFyeSM5ja3101wO1A+EkdD+DHpZnrB3iQoV33iTx8rWNeE=
X-Received: by 2002:aca:4a4e:: with SMTP id x75mr18797264oia.154.1563359068883; 
 Wed, 17 Jul 2019 03:24:28 -0700 (PDT)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Wed, 17 Jul 2019 15:52:55 +0530
Message-ID: <CAE33tLGM-13m=Ni=77vULrqD=d6HRYqZ48rjAy2NV5OenFb9ZA@mail.gmail.com>
Subject: Fan not recognized
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000f50f24058ddde540"
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

--000000000000f50f24058ddde540
Content-Type: text/plain; charset="UTF-8"

Hi All,

I am using a server board with BMC Aspeed AST-2500 and BMC firmware with
zaius configuration.

Seven fans are connected to the board and we are using PWM0 to control
first four fans and PWM1 to  control remaining fans.

root@zaius:ls /sys/class/hwmon/hwmon0
device fan4_input fan8_input pwm2 pwm6 uevent
fan1_input fan5_input name pwm3 pwm7
fan2_input fan6_input of_node pwm4 pwm8
fan3_input fan7_input pwm1 pwm5 subsystem

Even changing values of pwm1 and pwm2 to 0 or 127, the speed of the fan is
not changing.

Also, reading the files fan1_input showing error.

Thanks in advance.

--000000000000f50f24058ddde540
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>I am using a server =
board with BMC Aspeed AST-2500 and BMC firmware with zaius configuration. <=
br><br>Seven fans are connected to the board and we are using PWM0 to contr=
ol first four fans and PWM1 to =C2=A0control remaining fans.<br><br>root@za=
ius:ls /sys/class/hwmon/hwmon0<br>device		fan4_input	fan8_input	pwm2		pwm6	=
	uevent<br>fan1_input	fan5_input	name		pwm3		pwm7<br>fan2_input	fan6_input	=
of_node		pwm4		pwm8<br>fan3_input	fan7_input	pwm1		pwm5		subsystem<br><br>E=
ven changing values of pwm1 and pwm2 to 0 or 127, the speed of the fan is n=
ot changing.<br><br>Also, reading the files fan1_input showing error.</div>=
<div><br></div><div>Thanks in advance.<br></div></div>

--000000000000f50f24058ddde540--
