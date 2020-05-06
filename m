Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C06061C6F2E
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 13:22:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HDhw0TTqzDqnr
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 21:22:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=zbigniewku@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RqJlhTgY; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HDdS5L8NzDqwL
 for <openbmc@lists.ozlabs.org>; Wed,  6 May 2020 21:19:40 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id j16so1355059oih.10
 for <openbmc@lists.ozlabs.org>; Wed, 06 May 2020 04:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc
 :content-transfer-encoding;
 bh=wbaUYfWvmu/MdxH1nNoQag1j0c3Hsjz8l/pcqhVnF+c=;
 b=RqJlhTgYhoqO1TRausnnzazZ4u/vNERgofDgTo1J++JWzM9ep5AQnuJ70B1oYT9uRh
 m68po5Eb0u4RafhEgS6VNZl4bFuyl+VHq2ZdKBHzVdEvlDqYolGXmli4xEmBthVrkfUD
 aGLtCwtSvjPGhA0TdgP1EOKSjFyJp0ateb+DN0U+vXuzjex9pZAPEGlrwhb+FcLLOuN5
 oAWxmmN1jkffA5pFUTQ3M2pt7mgohg/+8xlwLv6xiYui/WW0xNShBBRp14XlvL1JRl5s
 h+JCkynbYr15EqFBPRCF7jc03LEJ09v+qVU2nYR0A41w3Y196n8/BvaGCvijmSqnkjpF
 erjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc:content-transfer-encoding;
 bh=wbaUYfWvmu/MdxH1nNoQag1j0c3Hsjz8l/pcqhVnF+c=;
 b=HCSIHoVfVcMs/pyPRkkYhHIlCTqBDMRliQDTuSKFY8CcB3QrRzPXqrwm8IpuQDBngt
 bUBDC6taZ+QqWtPRhvSx2u5ja4xgkMy0AA3GKkwGeMX4gb1jCCQzA8Kwm+pa769iVpJj
 xDQIlKDaMjQK7pPpBc5RN2cwDmohSGLq6E3MweN2R9G5GTt5W+VAgzQEDagrFSXBUyQ2
 FUvNi2NNi0o23gEH0B9S/iZpOjq1/4w3CrH3wc6ezOOrpYatcMey9j8FX32vf5JEC2N/
 put44eT5r1TOQup8fAO4G05fdG8gDbPLh8KMfacS3A8JoY5eeQe45Cflzl4JqgBsjdVy
 hZHA==
X-Gm-Message-State: AGi0PuYoHwBX4Rj5ExZNsaBDbCnE5BmdcuDylH+o1JYsNGEKlrLmcQBz
 A1K2N4Y6PT2GSiiAwudrfO4xOevfVxAhXsm/GWBKCQ61
X-Google-Smtp-Source: APiQypKrifsZrSUajiGYAelAKM903ryhGgr2ekUHxelaos5jiCvy3qz81zwwJ43PcDi2ZLspExd022RQfAYOCH21QyQ=
X-Received: by 2002:a17:90a:930c:: with SMTP id
 p12mr8657172pjo.64.1588763566799; 
 Wed, 06 May 2020 04:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXw96Mnk8Hf4wAB_Ot=XEqp9yecspPfMGB6oF_LSgjRFMNHvw@mail.gmail.com>
In-Reply-To: <CAMXw96Mnk8Hf4wAB_Ot=XEqp9yecspPfMGB6oF_LSgjRFMNHvw@mail.gmail.com>
From: Zbyszek <zbigniewku@gmail.com>
Date: Wed, 6 May 2020 13:12:35 +0200
Message-ID: <CAB_SOc5tEo7xRg65aMfBOWyY_yXkb6+mLmRhf8hifNhHDWGVgQ@mail.gmail.com>
Subject: Re: [bmcweb] mTLS client authentication always succeeds
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

pt., 1 maj 2020 o 02:07 Zhenfei Tai <ztai@google.com> napisa=C5=82(a):
>
> Hi,
>
> I've been testing bmcweb mTLS for a while and found the user defined veri=
fy callback function returns true in all cases. (https://github.com/openbmc=
/bmcweb/blob/master/http/http_connection.h#L287)
>
> If client authentication is enabled in bmcweb, should it reject if client=
 certificate is bad?

No, purpose of this callback is to only extract the user name from the
certificate and then allow to proceed with default OpenSSL
verification flow which should finally fail if something is wrong with
the certificate no matter what this function returned.
The 'set_verify_callback' doesn't replace the whole verification
procedure, it only adds a callback that is called when the default
validator checks each certificate. The 'preverified' parameter, passed
to it indicates if verification of the certificate succeeded or not.
You should be able to see it in bmcweb logs.

>
> Thanks,
> Zhenfei
