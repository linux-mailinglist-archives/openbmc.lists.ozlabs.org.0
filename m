Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5437695D566
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 20:42:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr87r43zlz30gM
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2024 04:42:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724438548;
	cv=none; b=BFn20gw64nbmwLM0QuT4LKZ6sGTqJ1+ned4pfoShfHw5KJZ3Gdl6IbrxyoK0UmIrLQrUWor3G/yymJhhKJhJ+D6OKL+V6jBxwO7fnvTvi5mw+vfpV/q2Og1y+3tR/403P8WGV4w/LWYOYOwV/lN4t2p5UwUjTjKC8QhRuIaylE8I/UuiBiTip6snRocOo4Vw36nUo3simJRmxjDZQlw++e+TiIsI0bPTf9oHn3rL7ItPX/v55WdrsQpt/Qky020D/+OBormApRXP20DXEqKib2+LaJDlef89Rb521/hVIx3odQrGgNOjQFidn03PelpJNuZzu8MbImpAYuQAAVs8Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724438548; c=relaxed/relaxed;
	bh=IEyjhGsHxmscEzgc+AhBwpHEv/DQ9sCSXh9nyqVcL4Y=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Sender:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=U4ED0T505k9RgnILoUT9NiuLYtAjlgC/aKLUvbfHeJPkBjG9AN40v2tlXjB99+uoDCQOoocZnwYFWhlW1k/M7BsZbYIWhIDmeCuQDo74xMBHHjH7NlxnsjBNIr6gp9Yqub0l1w5ZNZnElQR+urRWxnstOFxIZ6cDSaKUHPh3RwV2FXqFwsGqvxXsHJdzcJll1aWklGdcwX0FIbbQzDDDa3k46UC5dCM/QJ9mOP8VxDNd7I3lkVt7y96YJSAMDakzLjVUHoHh6U5Svl13x2VBRYtQjcuxFM5g0meFZQ5ki+NgvHvkBWKQDCmoEVfax9h8iwCWTXF20chl//jRkEe2ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i2XZ78xn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i2XZ78xn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr87l179Rz300B
	for <openbmc@lists.ozlabs.org>; Sat, 24 Aug 2024 04:42:26 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7c3d9a5e050so1631979a12.2
        for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2024 11:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724438542; x=1725043342; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEyjhGsHxmscEzgc+AhBwpHEv/DQ9sCSXh9nyqVcL4Y=;
        b=i2XZ78xnm/UhljtoQC75mb1tozCkZu9su9w+qo1jME3dmp5jqEciap8N8OclGlMvzT
         NHUwmhGh7f9hoTBqoeB1yVf7Zm8+x15+7/AKNC9/kQA0qT66ftpi0JPGDhb9k5M9uIbU
         fceshC4EWVwMRjjCmVTKlFDKDyq2cBSyu0l+KTRt4ZLwazadahq26KjgK/n1TjoUjOAa
         97/DzTqlgIOgRNMOGa54veow+03CYlnlCGeIpbt6NHdKxEufTF0Zo0qqYAIlYrHMDNa9
         4LowpsX7hX4p7b0RRXJlO6YeLlTd9JhiqaangRyzCp8L2PqNpIfoj1+W21OL0ZbrhruI
         VuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724438542; x=1725043342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEyjhGsHxmscEzgc+AhBwpHEv/DQ9sCSXh9nyqVcL4Y=;
        b=Uw+EXW+oBzjpIomruDEyLbss8fq79l8gptdmiRV22W6rOYRVZgtsH/tktsuT8DnUo8
         SO0p0jTbhzEtUt+JDcFtVMMEkdpKLmlLOfjTAji2RxFHTy+w7fiyvQx64zevNv6m88FR
         tUO034lp9Ok2OH3T++RZhUSZrl0ePjCW8F2+WC1hfqNMSTxo9c2mV/O8rnDM6eHyDJ7p
         8JQwIJgDGsZaTRuGUjs9xuTunek67GR/wu8hTo08r5YL2Y6bBSa1+M76nC3qHl64kWh9
         3roExFdpgFOkCJygHRVd8Lgoa2LXQeHRPaOj8ZC6jG871+X3Clzn5BXfo2onHmr0tY0d
         KTwg==
X-Forwarded-Encrypted: i=1; AJvYcCUHWkeVDS0+3rmhxTFVmpdx8kb/0K/ab6NrqMCUsnGGZyybGnNHFFqylpDdaSTogSUXu+G3M3d4@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzilZJ24e6D/pgMPQPmsl9mzgqBtPUIVHuVWGHIVG4QvcMEb/Wv
	4KIy81jDzkRUA07Ro6D0oQLwRO6MwJPlvwjx5IjTyeInIY6csLiOOmdlGw==
X-Google-Smtp-Source: AGHT+IHNgFboepV1Q2CFklhNBgCx4SjTYZHL+QXlbbmJRWwKfoU3zMGyaERa367IWsQtsOtWnBqFiw==
X-Received: by 2002:a05:6a20:b40b:b0:1c2:8e96:f767 with SMTP id adf61e73a8af0-1cc89e1ef52mr3588121637.31.1724438541864;
        Fri, 23 Aug 2024 11:42:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143430636esm3349087b3a.165.2024.08.23.11.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 11:42:20 -0700 (PDT)
Date: Fri, 23 Aug 2024 11:42:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cosmo Chou <chou.cosmo@gmail.com>
Subject: Re: [PATCH linux dev-6.6] hwmon: Add driver for Astera Labs PT5161L
 retimer
Message-ID: <d1bedbe9-1eae-4991-9245-b0627b5ca0a1@roeck-us.net>
References: <20240823061533.3463647-1-chou.cosmo@gmail.com>
 <20240823061533.3463647-3-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823061533.3463647-3-chou.cosmo@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, cosmo.chou@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 23, 2024 at 02:15:33PM +0800, Cosmo Chou wrote:
> This driver implements support for temperature monitoring of Astera Labs
> PT5161L series PCIe retimer chips.
> 
> This driver implementation originates from the CSDK available at
> Link: https://github.com/facebook/openbmc/tree/helium/common/recipes-lib/retimer-v2.14
> The communication protocol utilized is based on the I2C/SMBus standard.
> 
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> Link: https://lore.kernel.org/r/20240206125420.3884300-2-chou.cosmo@gmail.com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Please do not send such e-mails to unrelated mailing lists.

Guenter
