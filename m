Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE5E5B067E
	for <lists+openbmc@lfdr.de>; Wed,  7 Sep 2022 16:26:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN4Lw57Qgz3bk8
	for <lists+openbmc@lfdr.de>; Thu,  8 Sep 2022 00:26:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G+ZUaNVh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G+ZUaNVh;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN4LW6sDvz2yyT
	for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2022 00:26:09 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id q21so8485070lfo.0
        for <openbmc@lists.ozlabs.org>; Wed, 07 Sep 2022 07:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=XOUwC+I40829NSnpzJFcF1IpTMdwv/YhNTX7f2j0TwI=;
        b=G+ZUaNVh/XJocdaBCpHfJ1TXJoWNfqaFY1pQcNuTmTojCjmJyHl+zYEUW3xgjMVU9h
         xZyAb6vi6lUZzN86MFzWQHHNwrP0FxrOyVT4FtpdaiMitub8GS62GmKeQGgit7ZG0Exg
         SfjtijPKO//L4JF2yJfQJ9RmGf18B8cC/1SCzHIlH9PYgbSAXW+nxUG6vHA2/Dupfm6S
         2tIAl14/zkxQMshDXK8ucwhgENzgLR0gzY1pG/KEQ1e+aUghJJqJWPeIcDCFnIwlB6DQ
         z5dypmiUX0hd8DMDNzVMXo6U8nqiJLBjAXvkvu2gydSGGW2LjzHxJZlJIU3czQo8EWUQ
         Rz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=XOUwC+I40829NSnpzJFcF1IpTMdwv/YhNTX7f2j0TwI=;
        b=PrDo8jgursGVxAjtQ0yBobnVuylwcw+9S93i4J8ndayzkGL37CM6Vl2zz3G61BqKzQ
         8UrTPrwBDKGDLGXezgwpB3wBwbJUoU1YqiBFEHR/fKJAjdGrFKnRPZFUr6LFemDNzVfN
         4g8BIZXQQh+BaXk4JjUJNxoS6FiV7eblvU+f1b+7RelcVhf/ugy2ANjTAQk2K5KURQBW
         +JiNhMmAXSSKF9yUOQXXIp6Z+jnbdU3TeEHV+EJeYUwZ3UhUppnKMMxzfDGXX7rWEpYd
         vVfmPHuj3g+QLXxRACxx16z99/0itLs/T2dUhwBB2rUdMqJi7UNU6BJ1X4DAQocJKsgr
         xH1g==
X-Gm-Message-State: ACgBeo0MJRcNBkn9jJBub5XN1E0BCZ5zZw3QulFE0tFs5kVa7osDrW6N
	SVYBhDscDkKQSQvP9EJUXj0=
X-Google-Smtp-Source: AA6agR7TMhbLQje0Trp7Ju4Y4t8ihAy+RJ4cp5tonx1WrAKKaiV6yNfIIpqLYX/Ns2kH1MHEeZ+2eg==
X-Received: by 2002:a05:6512:b01:b0:48b:a065:2a8b with SMTP id w1-20020a0565120b0100b0048ba0652a8bmr1121195lfu.401.1662560765678;
        Wed, 07 Sep 2022 07:26:05 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id n20-20020ac242d4000000b00494813c689dsm2515474lfl.219.2022.09.07.07.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:26:05 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 287EQ27W016385;
	Wed, 7 Sep 2022 17:26:03 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 287EQ1iX016384;
	Wed, 7 Sep 2022 17:26:01 +0300
Date: Wed, 7 Sep 2022 17:26:01 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: SATA hotplug notifications for BMC inventory updates
Message-ID: <Yxip+Yyd8TPWhRft@home.paul.comp>
References: <YxXZeFQhJWDSHSVf@home.paul.comp>
 <2cdb6ea6-fc85-9835-d410-01195148a3eb@intel.com>
 <17841662532977@mail.yandex-team.ru>
 <a18faae2-7efe-42ab-4a85-215afbaaf89b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a18faae2-7efe-42ab-4a85-215afbaaf89b@intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Konstantin Klubnichkin <kitsok@yandex-team.ru>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

(skipped discussion about SMI, as I guess an SMI handler can't
meaningfully communicate with the BMC anyway since that would add an
unacceptable delay to the host operation; I can imagine SMI sending
data to ME and then BMC retrieving it via IPMB but, again, I can't
find any good reference about ME facilities...)

On Wed, Sep 07, 2022 at 07:04:48AM -0700, Johnathan Mantey wrote:
> A back of envelope thought I had is perhaps the host side could interact with
> the BMC via a mailbox. The issue being you'd have to have SW running during the
> BIOS time, and when the OS was in control an OS helper app pushing the data. I'm
> not sure how feasible that idea is.

Some kind of agent running on host can certainly do that. But
apparently no popular GNU/Linux distros package anything like that, so
it must be a rare need.

I asked experienced VMWare ESXi admins and they told me even SATA
drives show in BMC properly without any additional vendor "vibs"
installed on the host system so there must be some side channel
present on many production server systems. 

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
