Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 960798132DD
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 15:19:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=biTsTeJ1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrZHQ28fmz3cTL
	for <lists+openbmc@lfdr.de>; Fri, 15 Dec 2023 01:19:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=biTsTeJ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrZGs2Wrqz30fp
	for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2023 01:19:15 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50bf69afa99so10547668e87.3
        for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 06:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702563549; x=1703168349; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQ3bwMUk8X1J9J3ypOy0/pA2DHF8fbOaltjbT7mP9XQ=;
        b=biTsTeJ13giOjTpGocZ2sl8gtLw3umYHAfSgc/mcmpjescAmUYAUvGeZAbozJQQzRq
         TMNbFdrxzFlZbbw9mjT+3lN8DVDdbMdDH7qk0hkDw8QEajSsA5mCZMxDRU0eH93DAKb/
         +O+REZKh6WfLRNmXJcD9S7GQ9nBDMEqnGsaKuLA0SYJ3fR3C+L0jNPDVk2cvpcTMN/3U
         TqqUExQpjcp1UQ5NVQc99cNG6ZWn3mCCn55cAEIpO0PbVgEaxKOZlaHXgKD0+JBJNMv1
         EIckeLpf4twn+ILzIr+DkK3OL6JFzjBRKr6xnQAEVa+k7Bz9Ojj67C5c2Sy+CFjO1blp
         6LlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702563549; x=1703168349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQ3bwMUk8X1J9J3ypOy0/pA2DHF8fbOaltjbT7mP9XQ=;
        b=cING+tT9HGR0N81RU3abrn7moQQJBxYQVo1M0joDTW7L6vrBtggE8PTOR5CYwuzsGg
         YI0BrEmLv1ya3qKeuYj0UeqKPBaoVcE9ELowlFZ5uucCbtRFQoCLT2LBYyNLawSzUZeu
         JutX+2esLHtsli2tepdcNpdQm6dTKWph4unRREjssA1Dgv/h2CUeKhgkYW1Ean0IYCPv
         OGcuUW8wLciARcZfmJ6y3MIc7pG9NrNSpqDMisnb0bNCsgTUw6N+zX2DPbx20SyitfYI
         RmLUuNxuAhIv4krokNLBqP59agYv3e7X1RqJxhPY4mT2VDMih54my4csBiiDiWJidGxQ
         iDvQ==
X-Gm-Message-State: AOJu0YzrE4bKdpehavSPo0p+vB9kzs8szewvN44kQRg1Th2qtxCCgZ+B
	taVu8NCQHi8STu5elra7rdo=
X-Google-Smtp-Source: AGHT+IHqRqPM9xCrb8bY2qjbc5gXG+mnTP3vPzOVFwnQVHJHqCdJgI9kYABRRuwhHG1WUCcWt/wOqg==
X-Received: by 2002:a19:f70b:0:b0:50c:1f:7e00 with SMTP id z11-20020a19f70b000000b0050c001f7e00mr4932096lfe.21.1702563548694;
        Thu, 14 Dec 2023 06:19:08 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id d6-20020ac24c86000000b0050bed336e0csm1881825lfl.162.2023.12.14.06.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 06:19:08 -0800 (PST)
Date: Thu, 14 Dec 2023 17:19:04 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 06/16] net: pcs: xpcs: Avoid creating dummy XPCS
 MDIO device
Message-ID: <n44fxxqr6q3fs7z6uhooecn55tvyapdroizsowtmfgrn7vnhlw@dt25gi2dybc4>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
 <ZW8pxM3RvyHJTwqH@shell.armlinux.org.uk>
 <gbkgtb4yp3cwyw7xcuhmkdl3io2wlia2gska2xmjbwjvhigpz3@w52b6tdyugqo>
 <ZXnclVEz10K2XD2+@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXnclVEz10K2XD2+@shell.armlinux.org.uk>
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 13, 2023 at 04:32:21PM +0000, Russell King (Oracle) wrote:
> On Wed, Dec 13, 2023 at 03:01:45AM +0300, Serge Semin wrote:
> > On Tue, Dec 05, 2023 at 01:46:44PM +0000, Russell King (Oracle) wrote:
> > > xpcs_create_mdiodev() as it originally stood creates the mdiodev from
> > > the bus/address, and then passes that to xpcs_create(). Once
> > > xpcs_create() has finished its work (irrespective of whether it was
> > > successful or not) we're done with the mdiodev in this function, so
> > > the reference is _always_ put.
> > 
> > You say that it's required to manage the refcounting twice: when we
> > get the reference from some external place and internally when the
> > reference is stored in the XPCS descriptor. What's the point in such
> > redundancy with the internal ref-counting if we know that the pointer
> > can be safely stored and utilized afterwards? Better maintainability?
> > Is it due to having the object retrieval and storing implemented in
> > different functions?
> 
> The point is that the error handling gets simpler:
> - One can see in xpcs_create_mdiodev() that the reference taken by
>   mdio_device_create() is always dropped if that function was
>   successful, irrespective of whether xpcs_create() was successful.
> 
> - xpcs_create() is responsible for managing the refcount on the mdiodev
>   that is passed to it - and if it's successful, it needs to increment
>   the refcount, or leave it in the same state as it was on entry if
>   failing.
> 
> This avoids complexities in error paths, which are notorious for things
> being forgotten - since with this, each of these functions is resposible
> for managing its refcount.
> 
> It's a different style of refcount management, one I think more people
> should adopt.
> 
> > While at it if you happen to know an answer could you please also
> > clarify the next question. None of the ordinary
> > platform/PCI/USB/hwmon/etc drivers I've been working with managed
> > refcounting on storing a passed to probe() device pointer in the
> > private driver data. Is it wrong not doing that?
> 
> If we wanted to do refcounting strictly, then every time a new
> pointer to a data structure is created, we should be taking a refcount
> on it, and each time that pointer is destroyed, we should be putting
> the refcount. That is what refcounting is all about.
> 
> However, there are circumstances where this can be done lazily, and
> for drivers we would prefer driver authors not to end up with
> refcount errors where they've forgotten to put something.
> 
> In the specific case of drivers, we have a well defined lifetime for
> a device bound to a driver. We guarantee that the struct device will
> not go away if a driver is bound to the device, until such time that
> the driver's .remove method has been called. Thus, we guarantee that
> the device driver will be notified of the struct device going away
> before it has been freed. This frees the driver author from having
> to worry about the refcount of the struct device.
> 
> As soon as we start doing stuff that is outside of that model, then
> objects that are refcounted need to be dealt with, and I much prefer
> the "strict" refcounting implementation such as the one I added to
> xpcs, because IMHO it's much easier to see that the flow is obviously
> correct - even if it does need a comment to describe why we always
> do a put.

Ok. I fully get your point now: lazy refcounting for the drivers
following standard model and the 'strict' one for others. It sounds
reasonable. I'll get that adopted in my future developments. Thank you
very much for the detailed explanation and for all your comments.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
