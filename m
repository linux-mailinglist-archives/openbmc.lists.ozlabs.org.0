Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A63326D107
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 04:14:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsLBz5rjwzF3Dx
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 12:14:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=209.85.210.169;
 helo=mail-pf1-f169.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Uen3tNxN; dkim-atps=neutral
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsL5t1WHhzDsNn
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 12:10:25 +1000 (AEST)
Received: by mail-pf1-f169.google.com with SMTP id l126so231683pfd.5
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 19:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DV8o+1xdEKGxr0Gv6tsubOnxEFu/awV6HnKwdbiEGMA=;
 b=Uen3tNxNJBZPTEoAoUzOZWK1pap8ibTYe/UUR2qGfZ18sJBN/KjyhkyI7yfhRKS+UW
 tekcoH2nBIPfO56f+4UHBPoTx+crjCMX5kkSFB5Vc4dwUpk22pYlKWqtjNTWf9W5+JCc
 iUjfMX4C8laK77yqbDy7EEDXwlKZIsl/9aMLz7cM1Jti2bHf/J7j0O2mi7e3gzuG59wS
 JZ6sF4pgSESsxNDEJkzjlK8UB2b/Olr4nryXozIyvkUKgZ3Os2G6Aj+NKbAA1Gninu1+
 GqOdMdOqTlCPTGh8zc8FBzAAR++wfdctfit2+bJPJvL/ZncVnejXohRGJEeyoW7QX0EM
 ElNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DV8o+1xdEKGxr0Gv6tsubOnxEFu/awV6HnKwdbiEGMA=;
 b=JRzBIbeQWDCEA7eaUZlSk/GU6GonQVb+ozcVF7Rl3jGlT9rjqZQzJQjG+U4+k5H74H
 SQ+5DKj3UWS3FwqVZXT/s2mZJF2PyHPjmgk4QDALN4NmV5VEuOJJSRuARTsNmQOpmSUN
 rE/MSSmfwsOQXR8PLt076sIUUncm7PD3IkirFNm8MYZTQKoGynSKEmmRTd2gCmrRbG2P
 pkPspNhKMRzhyVwmTp8DGrq4WkFSkVbtEX2NS+RSXoOwDFZXJ1rXfMV9iLmjdm449U5g
 ooMOiJjpzKIR/5siH1f/WZ+53xNp+xdJJBtFI/jmKDAuI+xUzs+DxBrzQrbvm0hCnn9B
 5pug==
X-Gm-Message-State: AOAM533C11p3o2r0kJvUWDw6QqNtr/jVj7OesWTM6NtTNfrXLJEUVxqQ
 gO+lOSF+5wIIPSK1qpkG4WyFL1yQ2UfFMWzRVd8wNI7uwl8X5w==
X-Google-Smtp-Source: ABdhPJwYsit/4gRiFSyyzU20tXVvAkF34FwfM0740+yw03qLBBCIYi6GzLuIaElePeMjMBQ7spBZkerpx6vN4bnJhUE=
X-Received: by 2002:a05:6602:2245:: with SMTP id
 o5mr20981741ioo.105.1600280494281; 
 Wed, 16 Sep 2020 11:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <a3919f2a61844f9f89f8e1f8dc0d5972@quantatw.com>
In-Reply-To: <a3919f2a61844f9f89f8e1f8dc0d5972@quantatw.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Wed, 16 Sep 2020 11:20:57 -0700
Message-ID: <CADKL2t5YWsjREnFZ36ZA0ZR4ObOqY-noazEc-+wwVePF9bo8vA@mail.gmail.com>
Subject: Re: Quanta requests to create a repo in OpenBMC github
To: =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 16 Sep 2020 at 06:31, Fran Hsu (=E5=BE=90=E8=AA=8C=E8=AC=99) <Fran.=
Hsu@quantatw.com> wrote:
>
> Hi Brad,
>         This is Fran from Quanta Computer.
> Quanta OpenBMC team would like to share some useful tools to the OpenBMC =
community.
> Such as the read-margin-temp daemon (https://github.com/quanta-bmc/read-m=
argin-temp), we are using this daemon to fill sensor margin value to PID to=
 do fan control.

read-margin-temp seems useful and widely applicable enough that I
think it's worth having a dedicated repo for it.

The quanta-misc repo could possibly be used for smaller, more
Quanta-specific things.

>
> We would like to have a repo named "quanta-misc" under the OpenBMC github=
.
>
> Here is the maintainer list:
> M:  Benjamin Fair <benjaminfair@google.com> <benjaminfair!>
> M:  Brandon Kim <brandonkim@google.com> <brandonk!>
> M:  Fran Hsu <fran.hsu@quantatw.com> <franhsu!>
> M:  George Hung <george.hung@quantatw.com> <ghung!>
> M:  Buddy Huang <buddy.huang@quantatw.com> <buddyhunag!>
>
> Thank you.
> Fran Hsu
> E-Mail : Fran.Hsu@QuantaTW.com
> Tel: +886-3-327-2345 Ext: 16935
>
>
