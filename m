Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B71014D9A1
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 12:24:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487dL91y94zDqYS
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 22:24:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=rknec.edu
 (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=karpatear@rknec.edu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=rknec.edu
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=rknec-edu.20150623.gappssmtp.com
 header.i=@rknec-edu.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Xzs4Ekzu; dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487dK01lcdzDqSh
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 22:23:39 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id q8so2878202ljj.11
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 03:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rknec-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=Yh32qexuEinjouDSPu1YN/3L86PGDC2elTnUXkgvlas=;
 b=Xzs4EkzuEvdZFXnvYNGVVNBZIPcOIZJN9FCI9Q4PXVcGUHvKRenoC0lkzjOvM211YZ
 Rhj/PJTqyXlWfIiN/ank24q1tE47Dub+ZgJ+Dvqwx91BcLmAoAfYksuyjr/7xs9rtecd
 kGARwgKH2wHjpmJz5Js6PdI9ilkbTBWlhdmLj+QZ5zgzjthg08/r0Bl4XW2Us+nkmVW6
 SnJiPmeSIMoY/Sa6Be/IhAb2qgYP6r8govyoSeRxbpdfr7UIwvG5sByQYnqXFeRWeouC
 CbfUO3BQ5EH94/QvofXVKqvEZhqUZ1Spe+fS78oV5EflNzjJ4qf2p3HO8a3dw8Gu74hM
 SANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Yh32qexuEinjouDSPu1YN/3L86PGDC2elTnUXkgvlas=;
 b=Mw9TKwIMaVFTq41KZT3Al+tuWBE0zQQQYYbUzqLNDvlbPRgfc+0W/R/+rqTsJMXTE8
 aW8lEylJonEibmudmrU/iEQa+NwFNZ4qnBiEq6KDchNIYI5sIRwmOqNO8UyKFBPUwbUV
 2qYLEv79GtfpCcg6G29HoHhJXAWxkF/sRFN98JLHieE6Jf1MtiY4JTus2laOKbTPgDLe
 F/lvxViWQknetNbqQUoFTE0YQkwEsBFLR9YT5j6phM/z2sgIg3qoVN3aOktHXZAsXIy5
 0jGVneVESAQbmrQ7yG48s56Qo9tJ67SMW9qTGkpjXdHY3DbyH8u4niktIAVCTXRBnmgW
 kzeQ==
X-Gm-Message-State: APjAAAVdcEIKA6+1VguPntWScet3KBO+1YP/fd2Ljw5ch+kzpfuFdoj2
 mgKBCOLcV+GK3YdBMk2MEJQT7FZYlChX4YYTiDGSb08JMaM=
X-Google-Smtp-Source: APXvYqwOffWuMZ3RENYrUsK2ZfnlPbyRmv0YM3m1sBvmxnqGnuEaWYp9Y6TOJDV3v7s48cDAtO0BUHEbOnQIvChxQMU=
X-Received: by 2002:a2e:990d:: with SMTP id v13mr2608204lji.47.1580383413799; 
 Thu, 30 Jan 2020 03:23:33 -0800 (PST)
MIME-Version: 1.0
From: Atharva Rajendra Karpate <karpatear@rknec.edu>
Date: Thu, 30 Jan 2020 16:53:22 +0530
Message-ID: <CAF0vu0SZuKY7gsSTkd=H2sbc_Oi4-j9_8r7GnWUFngPT_-0wRw@mail.gmail.com>
Subject: OpenBmc Hardware
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000fd24f6059d59af7f"
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

--000000000000fd24f6059d59af7f
Content-Type: text/plain; charset="UTF-8"

Hi,
I am a newbie to openBmc. I have tried the QEMU KVM Romulus openBmc.I want
to further explore openBmc on real hardware. Could anyone suggest 1U or 2U
rack servers which allow me to install openBmc on them?

Thanks & Regards,
Atharva R Karpate

--000000000000fd24f6059d59af7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div>I am a newbie=C2=A0to openBmc.=C2=A0I have t=
ried the QEMU KVM Romulus openBmc.<span style=3D"color:rgb(51,51,51);font-f=
amily:&quot;Source Sans Pro&quot;,sans-serif;white-space:pre-wrap;backgroun=
d-color:rgb(255,255,255)">I want to further explore openBmc on real hardwar=
e. Could anyone suggest 1U or 2U rack servers which allow me to install ope=
nBmc on them? </span></div><div><span style=3D"color:rgb(51,51,51);font-fam=
ily:&quot;Source Sans Pro&quot;,sans-serif;white-space:pre-wrap;background-=
color:rgb(255,255,255)"><br></span></div><div><span style=3D"color:rgb(51,5=
1,51);font-family:&quot;Source Sans Pro&quot;,sans-serif;white-space:pre-wr=
ap;background-color:rgb(255,255,255)">Thanks &amp; Regards, </span></div><d=
iv><span style=3D"color:rgb(51,51,51);font-family:&quot;Source Sans Pro&quo=
t;,sans-serif;white-space:pre-wrap;background-color:rgb(255,255,255)">Athar=
va R Karpate</span></div><div><span style=3D"color:rgb(51,51,51);font-famil=
y:&quot;Source Sans Pro&quot;,sans-serif;white-space:pre-wrap;background-co=
lor:rgb(255,255,255)"><br></span></div></div>

--000000000000fd24f6059d59af7f--
