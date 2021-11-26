Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E49D645F6B0
	for <lists+openbmc@lfdr.de>; Fri, 26 Nov 2021 22:58:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J17sY6Nxzz3cDy
	for <lists+openbmc@lfdr.de>; Sat, 27 Nov 2021 08:58:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kyk1Xw0d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kyk1Xw0d; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J17s86M4yz2x9G
 for <openbmc@lists.ozlabs.org>; Sat, 27 Nov 2021 08:57:47 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id b1so27147809lfs.13
 for <openbmc@lists.ozlabs.org>; Fri, 26 Nov 2021 13:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=fYF45ebgKCiECAuMJ0a1Tm/E2HHidKT1aMSyXRUiNnU=;
 b=kyk1Xw0dSUovg+l3dU0HSZKmZG7dkaycRAQbe1aBQUnzf+snty48//ntzea4mUjGtM
 yY0DLjVJyfPKf/WLha482n5j92Iqiy+4HUo2L25RcpaBaZGfwo4qCGqWyOJwrtp6qplt
 nH+f8TlsZ7KOQjOgaGenrF1Z1MQcTi+CiaDgzXZEKZKKTQYAs4TPzTYx5IFaaO0qHxnh
 JISzXDeVgyUFtIYpbFpOeIFw+IDyFdJ70KvIGeF/egmpGc5R/bGol7rRJMRVXEyPBcrb
 oXFIk2qfuQGjvgHI7PGhBuQHZMfepSkNbC9rSosXuqVyDYTMuuv0peNlbpTTfcIuUoJ5
 cGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=fYF45ebgKCiECAuMJ0a1Tm/E2HHidKT1aMSyXRUiNnU=;
 b=TUY1UVIlSKaEyuNaeU94Oe+1I/weJ3YJsvahKGthxQlTvRn1BVRXQdNg+4UDu45feI
 PmNVjUoWTsGYDqRc2eow1LbLAylLYHNiwZHzyP7LMnFokUBNJZusYABj/Y4UEmDsyCN5
 wRdjHLOpOXRAP7Vb3MdkLKT/qpG78AIhhLvZ2my4TRNhOgfUM6a+CK9KqRQfI6uSpW6V
 2cjtNPpXSXI7vKihg0gFS4r7ToPMNJuxqMSbRA2y6iPWQneqa21KffDIbE7esynonXyJ
 V9671pdn9Ys0UzhVchIscU/E+OamAJ3f5JfKFc0KxsR/cOjg2j51AKrnBgKkBvqjT9UW
 hzkQ==
X-Gm-Message-State: AOAM531OXztrWQDLz3EU/tn/fzsEd9AVV1pLcthlYTk+D+PW4DLON3Sa
 4aiM74TTvnMJUsguCgLxtnc=
X-Google-Smtp-Source: ABdhPJyWGh4QysCMw/mFvxSvHrD2KiQE0lohHFWVhhDXiR/hPioFBBOoCKu9zJoY3SmhLE+/XBk0vw==
X-Received: by 2002:ac2:5fe1:: with SMTP id s1mr32330975lfg.346.1637963859418; 
 Fri, 26 Nov 2021 13:57:39 -0800 (PST)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id c2sm673934lfb.270.2021.11.26.13.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 13:57:38 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 1AQLvZrc028654; Sat, 27 Nov 2021 00:57:36 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 1AQLvZ1o028653;
 Sat, 27 Nov 2021 00:57:35 +0300
Date: Sat, 27 Nov 2021 00:57:35 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Landon <cld795@163.com>
Subject: Re: openBMC pwm-fan control policy
Message-ID: <20211126215734.GH22508@home.paul.comp>
References: <mailman.0.1637828525.15424.openbmc@lists.ozlabs.org>
 <217ffd16.389b.17d5636abb5.Coremail.cld795@163.com>
 <20211125084640.GA22508@home.paul.comp>
 <78340dc9.749f.17d5ab53990.Coremail.cld795@163.com>
 <687802ca.772b.17d5ad02872.Coremail.cld795@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <687802ca.772b.17d5ad02872.Coremail.cld795@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Fri, Nov 26, 2021 at 01:55:31PM +0800, Landon wrote:
> add: I just want to know in  OpenBMC by reading different temperature values  or
> current values to  control the fan  output, so as  to cool down,  how does  this
> strategy work? An example of this.

This is using temperature values to control the fans so as to cool
down, it works by configuring phosphor-pid-control appropriately, I
hope it's enough of an example:

https://github.com/openbmc/entity-manager/blob/master/configurations/R1000%20Chassis.json

If you think phosphor-pid-control is missing some documentation please
read its source code and send documentation patches for review.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
