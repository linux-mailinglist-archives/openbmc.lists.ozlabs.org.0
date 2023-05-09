Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E076FC097
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 09:41:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFqpb3jrJz3fL1
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 17:41:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AOVelzry;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AOVelzry;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFqp00Cb8z308w
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 17:40:37 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4efe8991b8aso6380145e87.0
        for <openbmc@lists.ozlabs.org>; Tue, 09 May 2023 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683618033; x=1686210033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/SFKnkSSzQ7GA0ciWdxbbJI317Jrgf5OShes/VJ+zzM=;
        b=AOVelzrykZguaHtfZwCCL8Y6DiAD+myiK2I20z0+EC6hH4AMdvL4G14GJ20WWErgCD
         ZtavjZk2c4mP1y4NmEU8LLdAAhmvyCHCvXYPxytKrmu4v8e3EhxONV712y4gOmuNcJx/
         BAjdesm3vPNehYv7eleoZVLBOqLl3WDaKbhx3CyMvklPS5NgGmWjTlB25f5OLod9q/43
         VCZqzyx6L6hn6VcfACeQhUj4ohDS4LY8ZRHRz6DnN89LftU3+kyPaDiaqGai7syx2hhr
         M59ECnJJiYF+hMHZiYaxHVueXr5on4+U3HTYxh7bTWfu+RLrzMjbIUij+GEYTAvxgSzo
         hgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683618033; x=1686210033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SFKnkSSzQ7GA0ciWdxbbJI317Jrgf5OShes/VJ+zzM=;
        b=K1w75xah4XEHkaY5rPbJY5Iq7OlhVxvFqUSv504Y6A7f6o1JT9JxinmO9XdS7qSx/K
         NaJe+hgo99sOkpRoMGCnxZxbUinMkJLYqT4jk0p1JPBMnIIpv94+Fb4Jt2j1TIKqaUGF
         nGyNBFeakob9HbN0ynO+k2fQmaxBUeKp1xfi+2HJ8K6cj7iQzTKUHwG5+396pvJQFwFr
         qExaYZhw2GHVGhCzGqDcO9pqsMILSZnmj07vN1lZCCNlzXwie1IrZfwq/P3WHmqvpIAT
         lGx09oojmRK9wczrH+ihCeEWCxD+DgRob3TES64yj01Si2y+UynxC5k/+nN9Mb2plrLG
         UBhQ==
X-Gm-Message-State: AC+VfDzbjPfjt3efDtSGaIflvD1N/LmwvyP+qD467XEJB+t5JZy5cgsG
	9wwf6dr3z0u1tl5L5UCJ+dA=
X-Google-Smtp-Source: ACHHUZ6gWB/CF7onx3Y65JGZhuDAtayKaoudv6M1aHE2M40Hw0P4mEyXyFi9+TlKyWGWoTUWhMLdDw==
X-Received: by 2002:a2e:800e:0:b0:2ac:7e97:6cca with SMTP id j14-20020a2e800e000000b002ac7e976ccamr560441ljg.29.1683618032786;
        Tue, 09 May 2023 00:40:32 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id t21-20020a2e9c55000000b002ad5f774579sm1162844ljj.96.2023.05.09.00.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:40:32 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 3497eSBF030938;
	Tue, 9 May 2023 10:40:29 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 3497eRII030937;
	Tue, 9 May 2023 10:40:27 +0300
Date: Tue, 9 May 2023 10:40:26 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: Hot-plugging non-sensor devices on non-PnP buses (was: Re:
 entity-manager: SBTSI and hwmontempsensor)
Message-ID: <ZFn46vES/XAKOtuF@home.paul.comp>
References: <CABoTLcQNTwxi5nVRG8yRoDrrtV-pO-WA1ubtFVmnLnebPLucmg@mail.gmail.com>
 <9b2c7872-fbe3-4691-b5c1-bf69290b4186@hatter.bewilderbeest.net>
 <ZFTK+ij4jMAqtQWw@home.paul.comp>
 <17542652-2f18-4bd0-9432-f81ebc4c5f42@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17542652-2f18-4bd0-9432-f81ebc4c5f42@hatter.bewilderbeest.net>
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
Cc: Ed Tanous <edtanous@google.com>, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ali El-Haj-Mahmoud <aaelhaj@google.com>, Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

Thank you for answering. A quick additional point inline.

On Mon, May 08, 2023 at 03:46:13PM -0700, Zev Weiss wrote:
> On Fri, May 05, 2023 at 02:23:06AM PDT, Paul Fertser wrote:
> > What further complicates situation with leds-pca955x specifically is
> > that it /needs/ DT or platform data to work, and that makes it try
> > binding automatically on startup, and probe() fails while the host
> > system is off, and "new_device" sysfs node can't be used to retry (as
> > the device is already defined), so either the driver needs to be
> > modular and reloaded with essentially rmmod/insmod sequence or the
> > userspace can use sysfs "bind" node to call probe() again (this is
> > also problematic with entity-manager as $Address template argument
> > isn't suitable for a string like 5-0019, where 19 is in hex).
> > 
> 
> This seems like the trickier part to me.  AFAIK the kernel as it stands
> doesn't really offer any way of specifying any of the additional parameters
> that DT properties and such can provide when dynamically instantiating
> devices, so if you need any non-default configuration your only option is a
> statically-defined device (via a DT node), and if that's not an option
> because you need dynamic instantiation then you're kind of out of luck
> unfortunately.

Dynamic instantiation is still possible either by having the
corresponding kernel driver modular or by using "bind" and "unbind"
sysfs nodes. In this specific case we tested having the driver
built-in, it tries binding on BMC startup, fails if the host is off,
then at any point of time one can do "echo 5-0019 >
/sys/bus/i2c/drivers/leds-pca955x/bind" and it'll re-try binding, and
that works if the host is on at the moment. And of course it can be
"unbind" later if needed. This could even almost work with current
entity-manager code if it was listening for host power state events,
if it wasn't skipping the devices that it already tried exporting, and
if it had something like $HexAddress for the template arguments.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
