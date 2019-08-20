Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6687B960E2
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 15:44:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CX8501pszDqyv
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 23:44:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ImxSnI9s"; 
 dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CVMy0bC7zDqTs
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 22:24:13 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id q10so3908774oij.0
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 05:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bzEst1EHDn28YRgPHFIJhhlRhvVN+UQB6kxAPh9ZDpU=;
 b=ImxSnI9sKTN8hHQ7XUeblAbzK08GDS88VfNb5EOjONmXO+hIx/6tPpi8H1ZiPmkWko
 KyiMi471FROkEAKgr1yYYOLyewWw2q6nHP5M57fi+SRRdHT6octhTCaJ3aEnYpllWrv7
 F+p4T3Jn1hvNvsNzO375X590JCtxrcxKMPxSaktOgUPyEQcwpfe29yivGEUxzoAaUKzH
 xvUjXahrxIbdSe1jGDyHRZpGmGlm4gxnD37ziCBv7CiyCxqKMMEkKRInlPRyknAgSej1
 KRhN8ZXFZ7vXs+a4dJISfM0x8eKFHjv0j0TXNf4OQzxVF85wyv3ot90W0QrJ0dzpu80r
 Zdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bzEst1EHDn28YRgPHFIJhhlRhvVN+UQB6kxAPh9ZDpU=;
 b=P90AzAnv6ng8z729rz9yras1US6xsIcv5M4OR9Ttrta5Dm05rxKHvQ//dQQ5pd7Dvr
 nuwWJbtSb+ilFdID4aCCTet3iznf0ZmF4f8hdwV3qlAwkDrQdwTbObPODZVzqLm3H6Z7
 lfl5UzNyOS/txFZybGkh8bkpKAN5HXsW1x8kUG9/KSINtjfawU/rrjBAEIzQ1gj/6gAG
 /3HhlJkWYDl+D7BAIwA+emtavUfilVcXJClLHqwjQww4jAfzXICtc43H0KXgbMbpKDoF
 LC/GnJLXc5cZq0cSvWhH9f7vb0Q/DdNFm+GbpsGwYXe0b7da4CVqNqtVKmXDm8aWB5WX
 zX6Q==
X-Gm-Message-State: APjAAAVXHDdeGk0ILUMKGwXf3iX2Vp1XsiuJwnZLTsxxdmMwrskWfo6S
 GwlOTwBVQZDRvD59+u0SzkR7ztSZijVXtP7jcF4=
X-Google-Smtp-Source: APXvYqyxcCNgc/axJeHIZzlbenZecl0SG8N8VD/+erAzD9HtXGt8r29+aQJaNqYM7SAEqjULW34z5b7GA84jP5qMlCY=
X-Received: by 2002:aca:c58d:: with SMTP id v135mr10164851oif.42.1566303850240; 
 Tue, 20 Aug 2019 05:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <6c4e4469c1134121b840176f92121013@lenovo.com>
In-Reply-To: <6c4e4469c1134121b840176f92121013@lenovo.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 20 Aug 2019 07:23:54 -0500
Message-ID: <CALLMt=oHw_Obfg4Feda+VnLeZCd-v=1_Pb60H6+YrVu4hdb_ag@mail.gmail.com>
Subject: Re: Top shows rngd using 79% CPU
To: Andrew MS1 Peng <pengms1@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 20, 2019 at 6:31 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
>
> Hi Team,
>
>
>
> Top is showing that rngd(random number generator daemon) is using high CPU usage in our machine as below. I download the romulus image from Jenkins and ran it in QEMU environment and it had the same situation, how should I do to avoid or fix it?

Should have a fix soon. https://github.com/openbmc/openbmc/issues/3574

>
>
>
> Load average: 1.99 2.16 1.05 2/101 1297
>
>   PID  PPID USER     STAT   VSZ %VSZ %CPU COMMAND
>
>   109     1 root     RN   12716   3%  79% /usr/sbin/rngd -f -r /dev/hwrng
>
>
>
> Thanks,
>
> Andrew
