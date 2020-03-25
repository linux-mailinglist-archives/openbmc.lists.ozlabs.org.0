Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F35AE192DF7
	for <lists+openbmc@lfdr.de>; Wed, 25 Mar 2020 17:15:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nY9k0dY5zDqf3
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 03:15:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=obmc.developers@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DYFQX/MW; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nY8w2PKkzDqVd
 for <openbmc@lists.ozlabs.org>; Thu, 26 Mar 2020 03:14:22 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id t25so2603988oij.2
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 09:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VXGUUdNMdkLTpN7peUxCbe1QBak65NJh26KWS/e1CEQ=;
 b=DYFQX/MWpqG200hgKUcMm958o6Zs5MATTs+t+Q7k8gMD7rc6am1WtOlyLu5fCKlSez
 i3E3aH3cX+W0/wiW7bYdgRaVxvKGo/cBzZsVgp8Vc1lR7rlBRuWeRvREH3mMvi7bhBzm
 3ZjLLcndr7qq4HZRzbEf5BgW7+3q7iB06oxWGxqDi8HbqSG6/iromQX0ifs0dCXF8tui
 r9Iy0Fx9GAmJOt5AHavmZu9BsfyzrsrQzRJUkqSCWbrQCv2o2pkSOkpzpvay/GODUpH+
 pMlAaFHTkKvfb4PY0eyDC0ZxDc3Mn9Vg34qnZN7nHXJNSYsAbrad5xvpB3ewa2NQsy67
 MZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VXGUUdNMdkLTpN7peUxCbe1QBak65NJh26KWS/e1CEQ=;
 b=jLS4977ZhyU6NV+1F3SBsUXmGzz9M93i2f9aYKla+xcl/jGfC65Jx3binMgegBxAH8
 qxiVPh9dWu2goEDlZkt/PGHpcuGviI3Nv4hBiLvBna+PdFKOtsrO9dlnit7vMBvIFLo3
 dwjTwTSfWq7gBEEMuIENwquH+IgoKpWJsQM5mljjUAw7uq7j/hzfd7KSYtv0ZoixLvF+
 sM0XVRTEISF8EoKH08kxpZIeny/B3SVoWlFUmj2CDS2qLowUQxXNt4c7boi3KlXFbTZu
 DfKksHcobebzho4UvFKiTlgH4DmCgIBeqq+J1/3gtyi4XMMYVRJ/rnSmWHRlVmXSfZVP
 bDGg==
X-Gm-Message-State: ANhLgQ2XQEW9pN/kUUpaq7+lSRIUe2IxAMtTxBtMhty5gPzi86OBOOSE
 RQc+b16PxutnZCMtktx4pM7hhJL7zPv0j+NKxirYfyoI
X-Google-Smtp-Source: ADFU+vtZin3itInLR+RdQohx0gTfvgA7InM/QRrALUvZK/rIoU1GPKjqk2V6NgS1Wnhby8GQrM0KFqA2iQ1Sp5JYSb4=
X-Received: by 2002:aca:130d:: with SMTP id e13mr1618021oii.98.1585152858740; 
 Wed, 25 Mar 2020 09:14:18 -0700 (PDT)
MIME-Version: 1.0
From: Anony Mous <obmc.developers@gmail.com>
Date: Wed, 25 Mar 2020 09:09:51 -0700
Message-ID: <CABbLDjOLt0wQ=f5SjDDjUyNjGAU_Ey_N4BnW=8P3LYSS0LqOOQ@mail.gmail.com>
Subject: Questions about eSPI
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000000f61ea05a1b029aa"
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

--0000000000000f61ea05a1b029aa
Content-Type: text/plain; charset="UTF-8"

To whom it may concern,

I have a few questions relating to eSPI.

1. Is it possible to have Port80/snoop enabled and working with the BMC
(AST2500 Arm core) being set to eSPI? Or does the BMC need to be set to LPC
in order for Port80/snoop to be functional?

Thank you for your time.

--0000000000000f61ea05a1b029aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>To whom it may concern,</div><div><br></div>I have a =
few questions relating to eSPI. <br><br>1. Is it possible to have Port80/sn=
oop enabled and working with the BMC (AST2500 Arm core) being set to eSPI? =
Or does the BMC need to be set to LPC in order for Port80/snoop to be funct=
ional?<br><br>Thank you for your time.<br></div>

--0000000000000f61ea05a1b029aa--
