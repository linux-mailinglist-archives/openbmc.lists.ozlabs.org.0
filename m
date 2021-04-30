Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4E236FDFD
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 17:43:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWxVR2cBwz301D
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 01:43:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=j3ZwEraS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c36;
 helo=mail-oo1-xc36.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j3ZwEraS; dkim-atps=neutral
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWxVC3syCz2y6N
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 01:43:28 +1000 (AEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 k26-20020a4adfba0000b02901f992c7ec7bso2139142ook.13
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Pn7n5qhL+AtJQ2dbH2P4GX8aZ8HrkMIfqtEax545LBM=;
 b=j3ZwEraSxf/TF2pxcAaHjMwVfD1lIhPPbWp1AU4rLopCtZIhUpW1+Vqpmd1RQ08GiV
 /mEdkLahBacxfmHv5SJiXpTn60Cr1/IB/wwCXHvFq4LE8Ghn7sw+zupBHaOL+pRfZ4lR
 YDhBQ7SVNvcO9HGf8yWESNWTkQ/+g8pYqW8fiVNRpck6s8uXagqaBBTI09VcUe0EbE2W
 Fb6MbRTQMjb3qfXPnAbhT0At3eTHkH1E/vIwn+TeWdBQMX20agEqu+pVigU7HjAcAaxd
 92mOm/Tm51iLcrZJW+ezAaKoxr65UN29MEoD73iDwHr0UwINi5Lpv34NeVelA1S28/fY
 GScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Pn7n5qhL+AtJQ2dbH2P4GX8aZ8HrkMIfqtEax545LBM=;
 b=Gkm/VybwYJ6N1YRZypDBV+697mEy3kYKbBnC7jv7mKZi6Ql7Ii10H5A7N3JSQ4uJIl
 uPF320KXoWPjfE+2SIcrmc98ym/rak8sWSO+tCZX5s3i9c5zKja9zRJ7vPHVTo+8Yeln
 stMWq86XgEhHB/qGCpQsTUwtTEspVd6VUjXGDMZz/Hvnx1O3VfsvRGLw4qrtrUAS42dq
 sBW9s0LEDZhcUfcD+Aqmq2DbRNU+HJ0+PaKl3UIHtOrJ6XsQgdiV0zYNuxvftifXJi+z
 t1QdYGPhTT8rOqdSbWYlqjGNzP0s7YT9LR85LyjTKMePqbIfA1akvxHlDpLDNlnKAyMS
 EL3g==
X-Gm-Message-State: AOAM5302U+eLVuSssa4L99QeOekewzgwFH6+rqkc9mtachS7QdSZ/Rcj
 JoF6FeY0+TFq0vtlHQIdNZMyPSU5YSGwrg==
X-Google-Smtp-Source: ABdhPJx/q+f7Vc0B0vKNzjJP0wKBZgeJp4NSDfimAZWi2GFOc2GU2c6CqNg1uCyW5RnZDwkCYDcVxw==
X-Received: by 2002:a4a:48c2:: with SMTP id p185mr4967030ooa.73.1619797403990; 
 Fri, 30 Apr 2021 08:43:23 -0700 (PDT)
Received: from smtpclient.apple ([37.19.210.88])
 by smtp.gmail.com with ESMTPSA id h7sm409088otn.47.2021.04.30.08.43.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Apr 2021 08:43:23 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
From: Mike Jones <proclivis@gmail.com>
In-Reply-To: <YIwd4CukDfVrOqQs@heinlein>
Date: Fri, 30 Apr 2021 09:43:21 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <2CAF9521-76FA-4160-9711-4267341B018A@gmail.com>
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
 <YIwRqzb/50Yk9hZa@heinlein>
 <CAHBbfcVPYZyUaMH9eJYs49RkTJ8aeXg5LMHGJGD0Ftqqx9Skew@mail.gmail.com>
 <YIwd4CukDfVrOqQs@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Apr 30, 2021, at 9:10 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Fri, Apr 30, 2021 at 07:52:36AM -0700, Jason Ling wrote:
>>=20
>>    2. How does the availability (and potential recommendation of =
usage
>>>       by our community) affect the effort to ensure that all i2c and
>>>       pmbus drivers are upstreamed?
>>=20
>> Well, this library is meant for userspace usage. So i2c (hwmon?) and =
pmbus
>> drivers would continue to be upstreamed as per usual.
>> Motivating use case for userspace i2c transactions are pmbus firmware
>> updates. With adm1266 we tried to upstream sequencer configuration =
update
>> via the hwmon/pmbus driver, it failed spectacularly. So we have to do =
it
>> userspace.
>=20
> Do you have pointers to the discussion?
>=20
>>>      What is it that makes you want to write your code using =
low-level
>>>       i2c and PMBus APIs directly in userspace instead of writing or
>>>       updating drivers and using the various high-level user APIs
>>>       provided by kernel subsystems?
>>=20
>> I speak in the context of hwmon/pmbus but these patches were simply
>> rejected. A lot of times the device you want to upgrade is also the =
device
>> you're gathering telemetry from.
>=20
> I think the "is also" is the part that gives me concern.  Generally =
this
> means binding/unbinding the kernel side of it, which isn't pleasant.
>=20
>>=20
>>       I see you mentioned "pmbus device upgrades" and I know the =
PMBus
>>>       subsystem doesn't currently support firmware upgrade paths.  =
But,
>>>       there has been LKML threads about it and what I recollect was
>>>       that it wasn't "not allowed" but just "not implemented".
>>>       Shouldn't we be focusing our efforts on enhancing features for
>>>       the whole OSS community rather than building our own different
>>>       library?
>>=20
>> Fair point but I don't see them as mutually exclusive, use =
hwmon/pmbus
>> drivers where they make sense and work for you. Switch to userspace =
for
>> stuff that gets strong pushback from hwmon/pmbus maintainer or stuff =
that
>> just doesn't make sense to put into a driver.
>=20
> My feeling is that we need more definition on what that boundary is.  =
As
> long as we are really only doing stuff from userspace when there is no
> other path forward, I don't have much concern.  But, I've seen too =
many
> cases where someone has tried to write an i2c-driver-in-userspace
> because they "didn't like working with the kernel" or some similar
> excuse.

I had a similar discussion with Guenter, who suggested that any i2c code =
in user space is problematic, but I think it also said there was enough =
locking in the drivers that SMBus transactions from /dev/i2c or =
i2c-tools would not interact with hwmon.

However, in general, ADI PMBus devices have a PAGE command, especially =
the LTC388X and LTC297X families.

This means that many actions require locking the bus to create compound =
transactions or the use of PAGE_PLUS.

The In System Programming code we support on linux via /dev/i2c has this =
issue. If another process touched hwmon during programming, and touches =
a PAGE, the programming may fail, or worse it sends the wrong settings.

If the work within the PMBus community to have a standard programming =
file format, if it were to be applied in user space, OBMC would have to =
disable hwmon and all telemetry while the programming is in process.

If the file (or data blob) was applied in a kernel driver, it could lock =
the i2c during the process so that all hwmon activity and telemetry are =
held off.

This problem is not unique to our desire for a file format. That is =
driven by the vendors complexity and business models.

But, in the context of the ADM1266, it is a multipage device. The DS =
does not say it can do PAGE_PLUS. Therefore, unless I am missing =
something, the above problems apply unless using a PAGEless bulk =
programming mechanism. I don=E2=80=99t know this part well enough to =
know how that works, or if it is published.

The other two families LTC388X and LTC297X do have a PAGEless bulk =
programming. We don=E2=80=99t like do it with telemetry hammering it, =
mainly because it feels risky.

Finally, one could argue that most OMBC systems are using the 1266 and =
not the other parts. But I can say I have sent patches for other parts =
to OBMC users, so they are in use.

