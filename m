Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 677361C83CF
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 09:49:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Hlwd6Bz2zDqvY
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 17:49:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=zbigniewku@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EiwpeptJ; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Hlvv0vN6zDqv6
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 17:48:58 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id b6so1742071plz.13
 for <openbmc@lists.ozlabs.org>; Thu, 07 May 2020 00:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DGeu0HirLGUjV7YOPABaA5X5QsxcevAOD4LfYcv/Pxg=;
 b=EiwpeptJ/+BWlKfqCRaeBUPbuEClHCP0Cikoq5YLS6NEMmlRSu45T5GA+eqSZrTY4P
 PUq+9XOnX00oIrCmZ/AbCPjBLd1HmJ0JVikgPCPuR7AakojDjkONB4vIc2TUA24tCQ3P
 Ywn2gxTWDNkd1j25J5t/QnpCbvYzE0vqKM/JJrqV/aysCSDiTr6MxqLUYexguO7k4kpT
 6UnG8ZYScq5sCEoMBnhmkoSmN9qnrnt+cD2HOszTdffrs96iioknsF+uHaT0rWjyaSbt
 1NbHCfmfjxPUaFDGsMrQfp89H/eQPM3X4zUSaDFQcu0p3Mk+dxCYYQlOmeFSO5IdZVnF
 a47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DGeu0HirLGUjV7YOPABaA5X5QsxcevAOD4LfYcv/Pxg=;
 b=hGg5c0emrUei5wSXWZvfn2G0vjhJPYeldisvJ5YYaorhaWuKeGe39MqByQ4VcHw+46
 UUhLAx97g9w9P9COemEAm9PRzdQakL+paRAniOUDMaIBYL+699LxddZRQDSAHcEyDv5f
 1lqFpT5i2ySpOb2A7XcpFKp635QsBY0TIz+DDLTviSK4SwN+tG5ZDS899OqvfWchKX6z
 5cmH6UZkM62Z08W4IHl8mR2k3NXXkdh561QKE21wR5sjbDBZZ82snmK895IubRWYDkLF
 F+ejZZqq34oLzADDToazphTcgoQiZuwnfH7CFsIOjIIAFJh/gJEvEXWPkU7pe9ZjYU22
 JzBQ==
X-Gm-Message-State: AGi0PuY+xAhvaCC6HxFxo2vuNJZpcfk2mzXjg9IV4pgwVJpj5zlBaHGp
 LiKd2+VnbZu66MrVccMPwb1CzY7RnZzbwolwnbY=
X-Google-Smtp-Source: APiQypJ18z9Myrif2e46mRE9YvATFm4IIAC0mCacPS3pTzkhAJfKa8Wsj5A3qcIR2fVOYSDXeFLExnQ/2JP/69tnmGs=
X-Received: by 2002:a17:90a:3aef:: with SMTP id
 b102mr14711861pjc.177.1588837733839; 
 Thu, 07 May 2020 00:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXw96Mnk8Hf4wAB_Ot=XEqp9yecspPfMGB6oF_LSgjRFMNHvw@mail.gmail.com>
 <CAB_SOc5tEo7xRg65aMfBOWyY_yXkb6+mLmRhf8hifNhHDWGVgQ@mail.gmail.com>
 <CAMXw96NoWn+sZELD1Xd=WUyLwvOUZ9prKyqqaLFKiMwM6ChuMw@mail.gmail.com>
In-Reply-To: <CAMXw96NoWn+sZELD1Xd=WUyLwvOUZ9prKyqqaLFKiMwM6ChuMw@mail.gmail.com>
From: Zbyszek <zbigniewku@gmail.com>
Date: Thu, 7 May 2020 09:48:42 +0200
Message-ID: <CAB_SOc6pgn2OXd-KRYNpzszxWyhfGOdBTHMB5FWbat8QaZ1CoQ@mail.gmail.com>
Subject: Re: [bmcweb] mTLS client authentication always succeeds
To: Zhenfei Tai <ztai@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

=C5=9Br., 6 maj 2020 o 20:19 Zhenfei Tai <ztai@google.com> napisa=C5=82(a):
>
> Hi Zbyszek,
>
> Thanks for your reply. I look forward to the official documentation.
>
> The callback function returns true when preverified =3D=3D false. Not sur=
e why it should always return true, which accepts any client certificate.

Yes, always returning true we do not break the tls handshake allowing
for connection.
But user will not be authenticated anyway because its name will not be
extracted from the certificate.
In such case user should receive proper http error code telling he is
not authenticated.

>
> // We always return true to allow full auth flow
> if (!preverified)
> {
> BMCWEB_LOG_DEBUG << this << " TLS preverification failed.";
> return true;
> }
>
> Thanks,
> Zhenfei
>
> On Wed, May 6, 2020 at 4:22 AM Zbyszek <zbigniewku@gmail.com> wrote:
>>
>> pt., 1 maj 2020 o 02:07 Zhenfei Tai <ztai@google.com> napisa=C5=82(a):
>> >
>> > Hi,
>> >
>> > I've been testing bmcweb mTLS for a while and found the user defined v=
erify callback function returns true in all cases. (https://github.com/open=
bmc/bmcweb/blob/master/http/http_connection.h#L287)
>> >
>> > If client authentication is enabled in bmcweb, should it reject if cli=
ent certificate is bad?
>>
>> No, purpose of this callback is to only extract the user name from the
>> certificate and then allow to proceed with default OpenSSL
>> verification flow which should finally fail if something is wrong with
>> the certificate no matter what this function returned.
>> The 'set_verify_callback' doesn't replace the whole verification
>> procedure, it only adds a callback that is called when the default
>> validator checks each certificate. The 'preverified' parameter, passed
>> to it indicates if verification of the certificate succeeded or not.
>> You should be able to see it in bmcweb logs.
>>
>> >
>> > Thanks,
>> > Zhenfei
