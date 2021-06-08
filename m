Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E8F39EBCE
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 04:16:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzYkh0GXgz306b
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 12:16:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=Y/mRfYS2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Y/mRfYS2; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzYkQ1bZdz2xtk
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jun 2021 12:15:57 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id f11so29421781lfq.4
 for <openbmc@lists.ozlabs.org>; Mon, 07 Jun 2021 19:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wQO9NvAcrYk23wfr4mPm86NAbEalYs4AxEeiiKO4trM=;
 b=Y/mRfYS2s3CWXLpgjrWVKrJbFL/NJncBglgLIxJthMLslBPP0mNek4Pc/v0fVvL6Te
 cgQv+tSdHfheIewMJe6la3sU/vgXgGzLrtkFToN+VNeX3YQyx0V2Naf80H3HImy2lqYH
 N7HU58D7196ICfk9nTQAQw+1jGHh3ld8uSZTLySbWcuSLiK4jJi6SUZVlj2DkY9Xrfq2
 UYr9vOwKqHlXRACQVQRMlo5p9JqzQ1GrOiB/3cxAK757r7zIZP+944+EiJ6BKPzFWoN6
 im3SHerkTE3lA9ZVXlPlIjHM1DKmKshUcC1P9V9/ROTGxahAiCfEN4hvLJLYUVP/oGNh
 w+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wQO9NvAcrYk23wfr4mPm86NAbEalYs4AxEeiiKO4trM=;
 b=r1RXBbF7HtjYkFM/g/+WTyu1yIxXb72UCY6crmjaKyuHAlcqaZ3g4Wq6P/nrriC3cz
 M64ldwZ5RznNsKUKiBKCMqEqi8+8Y95mnagH8BwZ1BLO6CROXBUPWmj/CInyVAebz4m5
 v/R2bO35H9BasQkR6j/7DM6atiJK9Z6erkBkQ96TC1LlHV7m1Szh79TZpjmlLyfKO24T
 OliCn/smBXRAKxu9xsdSeuFkUeTeb3KtvW6YMIYDPOtVjQk7nuEqtJTFd+98wC3+0lRH
 s9Gpx7sk/kGMnYLqsNXBqS6FqDjUnp5BwDeiZ7l1qFDLQVc+RwHXyTKxDUiL+qTBIfCy
 c/Zw==
X-Gm-Message-State: AOAM530kPEi/mreGgTp0CtARDUzWQiHXo6OETD6Qk7HyklsXgt0TP1UF
 DQ5sowWt1vKD9Cp+RQLtLjzOM7i8rK9T5OTIKlfmUg==
X-Google-Smtp-Source: ABdhPJyOm4hgInIW5lr1YMIML1s2KqmRfony6ucuLF1JTQ2GdFIw/gJXaYnMv2rFwxeUVeYP9+KEM39rJ5Y7knL/cGo=
X-Received: by 2002:ac2:5e64:: with SMTP id a4mr8492773lfr.657.1623118550134; 
 Mon, 07 Jun 2021 19:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <dbe431da08674c61bcda091cec16b5fb@asrockrack.com>
 <5d74d92b8e2f47acab7da6a54f6c18ee@asrockrack.com>
 <fec2cbe8fd144a52915d971b4e7214bb@asrockrack.com>
 <58f7b059987f40b78ebdcdbd1db5d969@asrockrack.com>
 <8a3b99b118744df5a918b43e5520d35a@asrockrack.com>
 <CALVHhedqJhfKD+MNofiwnKBB7sGG1wRPV4gXTdW_h=8=6=4HKw@mail.gmail.com>
 <OF6DE94A96.B5787DB8-ON00258584.00525E62-00258584.0052E3DC@notes.na.collabserv.com>
 <OF796A58B2.9DA64EBD-ON00258585.003E519E-00258585.003F6F0E@notes.na.collabserv.com>
 <OF2B5AA3C5.40A65716-ON00258589.004350E5-00258589.00436A50@notes.na.collabserv.com>
 <OF5B0F1DD8.7358EE61-ON002586BE.004FB2E2-002586BE.0050DCF8@notes.na.collabserv.com>
 <7807e4794c844beda004d7059c74289c@asrockrack.com>
 <cb87a8f3a17f47e192ab5474a331807c@asrockrack.com>
In-Reply-To: <cb87a8f3a17f47e192ab5474a331807c@asrockrack.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 7 Jun 2021 19:15:39 -0700
Message-ID: <CACWQX82JrVWKm9ua3n6J4NTTPfO9AwAv3NSYWwHjBGga-awkBg@mail.gmail.com>
Subject: Re: OPENBMC ASRock Rack
To: =?UTF-8?B?SmVmZjkgQ2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjayk=?=
 <Jeff9_Chan@asrockrack.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "manager@lfprojects.org" <manager@lfprojects.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Bradley W Bishop <bradleyb@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jun 7, 2021 at 7:01 PM Jeff9 Chan(=E9=99=B3=E6=9D=BE=E5=84=89_ASRoc=
kRack)
<Jeff9_Chan@asrockrack.com> wrote:
>
> Re-send
>
>
>
> Hi Bradley,
>
>         I got below error when I try to push meta-asrockrack layer to ger=
rit.

Jeff,

On your last thread that you asked this on, you got several replies
about what you were doing wrong.  Please use that thread to
communicate with this list and reply;  Don't start a second thread
like you've done here.

>
>         Is that means my email is not listed in the list?
>
>
>
> To ssh://openbmc.gerrit/openbmc/openbmc
>
> ! [remote rejected]     HEAD -> refs/for/master (commit 1d9951c: not Sign=
ed-off-by author/committer/uploader in message footer)
>
> error: failed to push some refs to 'ssh://openbmc.gerrit/openbmc/openbmc'
>
>
>
>         My procedure is:
>
> 1.      Git clone openbmc
>
> 2.      Add meta-asrockrack layer
>
> 3.      git remote add gerrit ssh://openbmc.gerrit/openbmc/openbmc
>
> 4.      git commit
>
> 5.      git push gerrit
>
>
>
> My git log:
>
> commit 1d9951c5518a7bdf88a5de16a41ae2f337e1b2ed (HEAD -> master)
>
> Author: Jeff9Chan <jeff9_chan@asrockrack.com>
>
> Date:   Tue Jun 8 09:15:44 2021 +0800
>
>
>
>     add meta-asrockrack layer
>
>     Signed-off-by: Jeff Chan <Jeff9_Chan@asrockrack.com>
>
>
>
>     Change-Id: I1686133e0093e4e00adeadc068972396c8dc4fab
>
>
>
>
>
> best regards
>
>
>
> Jeff Chan
>
> ASRock Inc.
>
> Tel: +886-2-55599600 ext.38670
