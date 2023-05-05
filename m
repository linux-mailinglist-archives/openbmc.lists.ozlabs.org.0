Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2DC6F7FCF
	for <lists+openbmc@lfdr.de>; Fri,  5 May 2023 11:23:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCQGs4bhzz3f5Y
	for <lists+openbmc@lfdr.de>; Fri,  5 May 2023 19:23:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DJNs626M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DJNs626M;
	dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCQGG2FBmz3c6H
	for <openbmc@lists.ozlabs.org>; Fri,  5 May 2023 19:23:16 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f11d267d8bso1695069e87.2
        for <openbmc@lists.ozlabs.org>; Fri, 05 May 2023 02:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683278591; x=1685870591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xj6Drd5f9NmzWvlwa3+eK6FOmSCUs4hpc3k8RTI/WaM=;
        b=DJNs626Mwrn4KF3VVroaW3NzzPd2+YgUzFdgtjCJ/mtpshEgs3qaFL1jMrBKC1bDyu
         ReLCBArdsNwyo6rNBZR9/4nDXhDNsO4D4A7WvxYhcMELc9/o1HW/OkVTxsVliYoSIHkR
         YIN4e/DawJPWdY6jg7h/i6qbByf8NevgfagmsbuxrJMKptnYDZsgnZN7jHhw4FnDnBg3
         X5ulnctz78ssbxlVNEaygulCMMfWGvmmoZjYo/+KHE0lS3+hYI34YcOHLg6dmx9or3aR
         rzevJfL5PhO7WGnkja4Yonpof7Xb/xRkHnhX8TlO92CjitMA9UWKfFShFHZBxTB07HFY
         N6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683278591; x=1685870591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xj6Drd5f9NmzWvlwa3+eK6FOmSCUs4hpc3k8RTI/WaM=;
        b=b9TAha+tbuFuhTRCFG/ikWxbyBO+yZNmPx0frwI/8K216s7euXLRO+fFHpbuJUqcow
         zuJJgwLDYEs3KyBQ+XvvUssmEfkX/W7wu0+raOzb5tWbtP6ua41i2Krfvwhgz6Rz6MTD
         xuptowOQ1hIrPMju2iCwSaA3fDBF4mmZ8BUQkn2lq5ZhHKXzC4AD5et76VgmHaIJlW51
         Is2G3Yvfh9aK/d856ixmpazNIU9VHPRcVt6UVRKuLsfqf0anFNKEwiN8A3ImCtSybPMK
         T3Qps+ksJ0QUFUqHVFINAYRjrl7pa7uvtESVXC/oh58ecvXJwxvAwMdDxP2pgr/AU/PJ
         uXaw==
X-Gm-Message-State: AC+VfDz7GOPukxFzqvG29zVLOHTZ0k8egqovGk6b1Tjn37jE8sDh4HAx
	Ou6/mrGMoetqOAW6lfwvG88=
X-Google-Smtp-Source: ACHHUZ7jKnh1oNSHdK6ANg5ioeiAeLcNO4syPzOvB5jL65nk0/fZsJ3f88l/gnkevGcTLytX8IyzIw==
X-Received: by 2002:a19:a415:0:b0:4f1:4644:499a with SMTP id q21-20020a19a415000000b004f14644499amr265120lfc.61.1683278590824;
        Fri, 05 May 2023 02:23:10 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id z10-20020ac2418a000000b004dc4c5149dasm212148lfh.301.2023.05.05.02.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 02:23:10 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 3459N7iF022283;
	Fri, 5 May 2023 12:23:08 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 3459N6xq022282;
	Fri, 5 May 2023 12:23:06 +0300
Date: Fri, 5 May 2023 12:23:06 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Hot-plugging non-sensor devices on non-PnP buses (was: Re:
 entity-manager: SBTSI and hwmontempsensor)
Message-ID: <ZFTK+ij4jMAqtQWw@home.paul.comp>
References: <CABoTLcQNTwxi5nVRG8yRoDrrtV-pO-WA1ubtFVmnLnebPLucmg@mail.gmail.com>
 <9b2c7872-fbe3-4691-b5c1-bf69290b4186@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b2c7872-fbe3-4691-b5c1-bf69290b4186@hatter.bewilderbeest.net>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ali El-Haj-Mahmoud <aaelhaj@google.com>, Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

I do not mean to hi-jack the topic as the issue I have a question about
is closely related, please see inline.

On Thu, May 04, 2023 at 02:10:15PM -0700, Zev Weiss wrote:
> It shouldn't be in your DTS, because then it'd be statically defined and
> hwmontempsensor wouldn't be able to remove it when the host is powered off
> (which I assume you'd want).
> 
> In terms of userspace/kernel separation, it's overall pretty similar to how
> it had been previously, just with the management of device lifetimes
> (instantiation & removal) moved to hwmontempsensor instead of
> entity-manager.

I see similar mechanism is also implemented in omnisensor, so this can
be an option (probably preferred since it's a much cleaner code) too.

But what if the device in consideration isn't a sensor at all? We're
trying to use PCA9551 which is a LED driver controllable over
I2C. Since it's meant to show statuses of the host storage devices
it's powered only when the host is powered. The kernel driver
leds-pca955x handles it nicely but the probe() needs to be run with
the device powered.

I initially thought entity-manager should be the right place in the
architecture to handle cases like this, but now that you say OpenBMC
is moving towards implementing dynamic driver assigning functionality
in the sensors daemons instead I wonder what the solution for the
non-sensor devices should be (as duplicating the relevant code in
phosphor-led-manager seems to be obviously wrong). I can also imagine
e.g. SPI devices needing similar treatment, so it's neither sensors
nor I2C specific in the big picture.

What further complicates situation with leds-pca955x specifically is
that it /needs/ DT or platform data to work, and that makes it try
binding automatically on startup, and probe() fails while the host
system is off, and "new_device" sysfs node can't be used to retry (as
the device is already defined), so either the driver needs to be
modular and reloaded with essentially rmmod/insmod sequence or the
userspace can use sysfs "bind" node to call probe() again (this is
also problematic with entity-manager as $Address template argument
isn't suitable for a string like 5-0019, where 19 is in hex).

I would be happy to hear your and the other OpenBMC community member's
thoughts on this matter.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
