Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B8C96001A
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2024 05:57:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtDJH3C3xz30Vr
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2024 13:57:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724731019;
	cv=none; b=AwaPwAoYlgz6nob37FT0FzVOtAoJxyvZCT8TpFZe/dtKBuvKntIMFw1OgiEsWk2Adh7ZU5d4Vl1vcOSqMuvo5bsy+sa27r1lOKqJ5bSpHfDqW/czbF+3Fnp0J//nW18vEmG/RwCJAJ81b4eUGK6AeOZTo9IBgGAhjsW3PLDp3yk21zlrcIjz9SaSzYBEDpQenA+uwXbycopiUWADL2KXAmYgSKzaIccu0nam/AHOtz25f1lwCnZM2Udc29Uew6mkhloQa2wwM/P67SpWI+QGuBTheuYDl4A90s9q3twBlP08wDAppP9RNa9vSF4rM8LOqG3GEfh527uDWZmKwaI+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724731019; c=relaxed/relaxed;
	bh=KTvOR/DS9knaRzY3sdxLzqaq9zQJwZGfns9IyQ9Yg/c=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Sender:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=MwUW8I9eeJa1PGbmmlO5MhkFlKww4pdL5uof9IczaV0DN1s4OAwSYmapMc08JNbGzATGsVwMDsvTLt/WPHyZoY2LjP9LN+GWZsnXf4TKb6K5r4E7203d9CeZVo0cmPINgPrIYQUdXzwORfzJ8faGpu8/zmv1GC7eLh2pgcBtg3/W11DpDPPRVeond/5/zgSXTmGxWSBxz0Xbb940NlfalFKJuyIYWr10uYcM3xhPhmu8pUIKSLyrDfe2LIElEvXA2H2msqVFfYu1FYql2Q6maA6D9KgYLetN1hpPalrzcVIHBKJUakpXlcW+C7rvRbR+8s2lKJ6DeoB21MLMp8Na+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JLL/uZYD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JLL/uZYD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtDJB2wKlz2xs4
	for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2024 13:56:57 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-204d391f53bso12792935ad.2
        for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2024 20:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724731015; x=1725335815; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTvOR/DS9knaRzY3sdxLzqaq9zQJwZGfns9IyQ9Yg/c=;
        b=JLL/uZYD+c4GGVeucWorHnlDxKkVKNgrSpak2kmzgpuh6apBMkizSuJwrpkIq5E4GH
         /z30dXaHQf8xRxl14ktQ+qyksoE2lLpmkwDNxoueWHx5BK3gIkMjEcMeu9YCOYgwHQ8N
         A/5olaS8C4DTBM1+I7ezYzoizLK9ysS3g3Up/zAYMQFG/BsQz8ypGhd7XH3IcqjIiBnI
         WL5CA5237AIaoMRE8GHa4I5Bxs2LRV8gOSMzh7hfc2jUYX52ctE2CAsKKSJjz71dvYXd
         XjzYLAX4P4k6i/nyz0fJExPj7QzK1gpA7aiwgmIpKfpQfasJTJbtl6JcXyES/I+l+XaA
         T4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724731015; x=1725335815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTvOR/DS9knaRzY3sdxLzqaq9zQJwZGfns9IyQ9Yg/c=;
        b=avATrChZgE/w3m7QYJONjyAhVSwBKEY1dc+4/eXIA/Pfi9ClYSXEpF27hNW+2CC19H
         dQhiIjpqbDwJTEPZ1UoHKCidCnfryqVtILUe7BK7+I65z9QN2qpNizhezzJStF7xaWiS
         1pw/Zh5OZVq6/tEFkr0Z1Jc19wcA8A6ipA3EOLx5DcgwWw/XgxQhlLNNJfUcYRIjnT0k
         7o5qH9Xcfphl///DOXSvv2LBQLCDVSRWqg7IxwCYU8zeGdZuyos+aIMWhGgaoD0W6y/y
         FM8m3JdwuedQVsYKRxki5LLFVTOsnd71szmLbTlYs1QWFn3+mHT21hHflOXkkhrOHHaN
         FQsw==
X-Forwarded-Encrypted: i=1; AJvYcCUDKhjK1YwxpqpqfiApHi6TWfOGklMEWFi6Ny39IXZinBXelI9spITiRGnhm982HBvY1q/fo5c0@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw74Fz8RaxNBR2lslW7Zj+2urRhY7qgkrXozC6ySUTCKbm3Mc0u
	fLW/j19enbjFTJJS+Gs9VAxC6hkhe3l957bGvsyWrxDIxozzU6VR
X-Google-Smtp-Source: AGHT+IFxneXRFmZ1WmEVJIBaliCW7se8z0sLkUpG6VSRORjfjkBu0029f/W74ZEp6JtRVQdyr0mBRA==
X-Received: by 2002:a17:902:b20f:b0:1fb:72b4:8775 with SMTP id d9443c01a7336-204df4d39a1mr16138875ad.40.1724731014747;
        Mon, 26 Aug 2024 20:56:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038556657asm74264205ad.47.2024.08.26.20.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 20:56:54 -0700 (PDT)
Date: Mon, 26 Aug 2024 20:56:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: Re: [PATCH v4] dt-bindings: hwmon: Add maxim max31790
Message-ID: <3382f952-daae-43ff-bb85-fa4820ecbc5f@roeck-us.net>
References: <20240822084808.299884-1-chanh@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822084808.299884-1-chanh@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, Khanh Pham <khpham@amperecomputing.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Phong Vo <phong@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Justin Ledford <justinledford@google.com>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 22, 2024 at 08:48:08AM +0000, Chanh Nguyen wrote:
> Add device tree bindings and an example for max31790 device.
> 
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Thanks,
Guenter
