Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 951AEB718F
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 04:21:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YgZm5TzgzF4jv
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 12:21:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YJo26/40"; 
 dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YgZ206pnzF4jv
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 12:20:56 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id b19so4082584iob.4
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 19:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u8adwPRLNvYhl07BMFZfBgyKpqdZhaQuxjKk+PN/VXk=;
 b=YJo26/40zHGUSbwLj1/mI5PYlG19Iu7tg2qpYEmX7qRzfi2lLWXsrTh4ZlgPsQubxr
 JXqV4vzC4g7N/KmZhGQa3UFjY2kDLmg3v4hXrwYX611ts3+/hyt7Gu5gCDZND+0fCd+9
 ZEs/JlT27sKpGySHn0d05XccCbgy7cZ3DIWZKqahi+pQKmIY5pjW88JeaMCi5PNFmcR3
 ncBM6kjH8oDgycY9hVBHRLhXHSOuI8UzZg9e79tZC58wLbzvjXLWG5hICPeVvdFtmoSi
 KfNevTNm7ekv9WZKXvwr/boqsJoal774QPhPk4lv9wODkzh+1bM+dRYiCxM3knkAme0X
 LJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u8adwPRLNvYhl07BMFZfBgyKpqdZhaQuxjKk+PN/VXk=;
 b=VfkqDAVyKEfkgIReeBku/5aB+LJsOCJ/jVtaxknTSV6IfpQE8qr2m3qej7sFBjmXa/
 916X7Qh1ZSjsQtqOwbXqk5vyMuuJ7Ur+K60uJFs6fz2rn1UaXGvIlrf+76YKEbbVZqME
 Qzn2Q8LyONMIjvE6q4PnAzgMLS4turUeL3C2j/Zch35nDhFzooaCqV4sWzIufuDtk3vb
 +SZsmfH+0XYmCcd77ygeLeftX6KdWvHGdYJtd+KbJYjg7JeURgCPHdCAWkoU2Z8AU4KK
 cIJ3vjtbdZJL2deEHnyq0rVPyhyTAjTCoIFiJbTV98Go1b24D7n++ZGXoQklCq3z8ikE
 Nt1g==
X-Gm-Message-State: APjAAAUxejFwSScoEroen/uBQyoDpOsfjsdHsjP5TXzTuMxF8Wj4tD5Q
 kIcOu4tp6o7UDIRn21MWXODu04+HE3TmlfxVOkA=
X-Google-Smtp-Source: APXvYqyEtTSYly2NqPyQIYoDigcFF2aUpfLamws8PZYw+uqNA0yyGbh/gWGbe70QIGkdOF04JIHVMb8syuFrs4NT9/w=
X-Received: by 2002:a6b:ec0c:: with SMTP id c12mr7185866ioh.138.1568859653460; 
 Wed, 18 Sep 2019 19:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <xsccJqqcmgguxAh42ykWadNuaYHHgIw0933Bk0tYCREDFQMFzoE43c9ULehB-J0Em4kobpg-P8xmKd5ukb9AdyIO9-JYrY8DrNAcVFkURyM=@protonmail.com>
In-Reply-To: <xsccJqqcmgguxAh42ykWadNuaYHHgIw0933Bk0tYCREDFQMFzoE43c9ULehB-J0Em4kobpg-P8xmKd5ukb9AdyIO9-JYrY8DrNAcVFkURyM=@protonmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 19 Sep 2019 10:20:42 +0800
Message-ID: <CAARXrtm_ne1Ao=V55JvvzTeLTXXcMp-VUVBB8aMJLFZLFbyu-g@mail.gmail.com>
Subject: Re: Fan PWM monitoring and control
To: rgrs <rgrs@protonmail.com>
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

On Tue, Sep 17, 2019 at 6:48 PM rgrs <rgrs@protonmail.com> wrote:
>
> Hi,
>
> I need some help with phosphor hwmon related to fan sensors.
>
> I'm trying to control Fans in a server motherboard using ADT7462 controller. Hw mon porting is done and the sysfs interfaces are working as expected.
>
> While I am able to read RPM, i don't find pwm/target to control the fans exposed as dbus objects.

Could you elaborate the issue?
And could you try to introspect the fan sensor to see what interfaces
it implements?

    service=`mapper get-service /xyz/openbmc_project/sensors/fan_tach/xxx`
    busctl introspect $service /xyz/openbmc_project/sensors/fan_tach/xxx

>
> # busctl --no-page tree xyz.openbmc_project.FanSensor
> Failed to introspect object / of service xyz.openbmc_project.FanSensor: The name is not activatable
> No objects discovered.
>
> I came across this post, I think it is similar to my issue. (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/8353)
>
> Please someone point to latest documentation or reference Fan porting from openBMC repo?
> What are the exact fields in YAML that are used create FanPWM objects.
>
> (I'm using Feb release in my sandbox, https://github.com/openbmc/docs/blob/master/release/release-notes.md#26-feb-4-2019)
>
> Thanks,
> Raj
