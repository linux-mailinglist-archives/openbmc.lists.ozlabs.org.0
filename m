Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C3AB51CA
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 17:49:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xnc64fNfzF3Lj
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 01:49:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CdfKO6Q2"; 
 dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XnbL4k6MzF1bx
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 01:49:01 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id a2so2391352pfo.10
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 08:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xjiL8UWLcDn8B9/BUVg31NXpRyKBxnro4Lk0iTS1KyI=;
 b=CdfKO6Q2AGDBHp8PKaLVuX0Q6Y4kw47r36HoizHUAqKNG4wdiZxEStUxS0oeCxaaRl
 kyMwbl51lIngF36INWtbpu8+xN1ApeS49vNky4wFmYyq57SiBYeBkyRcBGfnMYln5alk
 EnerBn+6761I5ECNyBXEGLaWn5GOnRHC8Dv221xb0+Q4pRGmfhprOK98j70cQPYc6Pjp
 8aYmSmgIfpO9AUVTyIT+3vPY0iNWQ9cCaQ7twlgdsIV6l8FL2XEW4Vpm/4N1ghecW3SK
 8vmP/dOiwRQnMdBVbDIOl9wvmXJeDfTZf0Z3pOl0qwoAVL3vGHMgA2XyIh3YxHZ05NW+
 XZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xjiL8UWLcDn8B9/BUVg31NXpRyKBxnro4Lk0iTS1KyI=;
 b=VU0pYmldoTk1LcKKGmgM+5IpWG5pdYdZ/M1i8nQ9eOWauV/ZHMhrZ6QAmGmNQVe9m2
 SaijZvKJDXc+86x/n2v/Kd8KJZyOGKsUz/3AasCbMZTbd6gYRfetTQo7ZJviTEhH5wta
 JnrSFSKrPEetECYMJSvfIzTTjKQe1WjBhX/YVWtSiU7eqZsnwccFtNlj3JiiTCwS5+pR
 sVwLpxQD0vAqCdQTk62OYBOI92HGU8HbcImeR7PJqZAoyp2Adio4m5pjoF4N7j7s3Cbq
 FfleKYT+g4bCKo/yRXpCzx3yAQJvgCM3Xi9cxX4p0LVe47+eMbeX22n38rtEM34eq91T
 BJvw==
X-Gm-Message-State: APjAAAVqOKhAaMCZUjXXW6fD0xsIGAlvkfhmZp7Y6pbmSE2Q0qfDuuYP
 jjqWDXhjOv+iT346VBPkj4uptE9gm7aRtAX+upIEoA==
X-Google-Smtp-Source: APXvYqxdgYwPpZ8sydVooWxv0VBPJ3bITf8iP8vFKZnAQhLsIS2r2F8hJ+IG0AKUuthLv1W9F8BNcC6Y6xitdHkui4w=
X-Received: by 2002:a17:90a:c38d:: with SMTP id
 h13mr5843413pjt.115.1568735338136; 
 Tue, 17 Sep 2019 08:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <xsccJqqcmgguxAh42ykWadNuaYHHgIw0933Bk0tYCREDFQMFzoE43c9ULehB-J0Em4kobpg-P8xmKd5ukb9AdyIO9-JYrY8DrNAcVFkURyM=@protonmail.com>
 <87e610aa-72c7-32d2-9281-2c89023d397a@linux.ibm.com>
In-Reply-To: <87e610aa-72c7-32d2-9281-2c89023d397a@linux.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 17 Sep 2019 08:48:46 -0700
Message-ID: <CAO=notzaok+dsfR0uRJUy2ZGHMiMZZC9Jm704B5HfCS8CLPnEQ@mail.gmail.com>
Subject: Re: Fan PWM monitoring and control
To: Matthew Barth <msbarth@linux.ibm.com>,
 James Feist <james.feist@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 rgrs <rgrs@protonmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 17, 2019 at 8:32 AM Matthew Barth <msbarth@linux.ibm.com> wrote:
>
>
> On 9/17/19 5:40 AM, rgrs wrote:
> > Hi,
> >
> > I need some help with phosphor hwmon related to fan sensors.
> >
> > I'm trying to control Fans in a server motherboard using ADT7462
> > controller. Hw mon porting is done and the sysfs interfaces are working
> > as expected.
> >
> > While I am able to read RPM, i don't find pwm/target to control the fans
> > exposed as dbus objects.
> Do you have the hwmon config set similar to this to denote the fan
> targets are of PWM type?
>
> https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-romulus/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/pwm-tacho-controller%401e786000.conf
> >
> > # busctl --no-page tree xyz.openbmc_project.FanSensor
> > Failed to introspect object / of service xyz.openbmc_project.FanSensor:
> > The name is not activatable
> > No objects discovered.
> That does not look like a hwmon service name. If you are using
> phosphor-objmgr, you can use `# mapper get-service
> /xyz/openbmc_project/sensors/fan_tach` otherwise you'll need to find the
> hwmon service name associated with your fan controller device.

running `busctl tree --no-pager` will just list everything, and you
should see your fans in there.  You can use the mapper too.  I was
curious, are you using entity-manager/dbus-sensors?  When you mention
FanSensor as the service, that's what it sounds like.

> >
> > I came across this post, I think it is similar to my issue.
> > (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/8353)
> >
> > Please someone point to latest documentation or reference Fan porting
> > from openBMC repo?
> > What are the exact fields in YAML that are used create FanPWM objects.
> The Romulus machine should be a good reference for PWM based fan control
> using phosphor-hwmon. It uses the
> phosphor-fan-presence/[control|monitor] apps for controlling and
> monitoring fans
>
> https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-romulus
> >
> > (I'm using Feb release in my sandbox,
> > https://github.com/openbmc/docs/blob/master/release/release-notes.md#26-feb-4-2019)
> >
> > Thanks,
> > Raj
>
> Matt
